package miui.util;

import java.lang.ref.SoftReference;
import java.util.HashMap;
import miui.util.concurrent.ConcurrentRingQueue;

public final class Pools {
    /* access modifiers changed from: private */
    public static final HashMap<Class<?>, InstanceHolder<?>> LO = new HashMap<>();
    /* access modifiers changed from: private */
    public static final HashMap<Class<?>, SoftReferenceInstanceHolder<?>> LP = new HashMap<>();
    private static final Pool<StringBuilder> LQ = createSoftReferencePool(new Manager<StringBuilder>() {
        /* renamed from: a */
        public void onRelease(StringBuilder sb) {
            sb.setLength(0);
        }

        /* renamed from: da */
        public StringBuilder createInstance() {
            return new StringBuilder();
        }
    }, 4);

    static abstract class BasePool<T> implements Pool<T> {
        private final Object Co = new Object() {
            /* access modifiers changed from: protected */
            public void finalize() throws Throwable {
                try {
                    BasePool.this.close();
                } finally {
                    super.finalize();
                }
            }
        };
        private final int Jt;
        private final Manager<T> LW;
        private IInstanceHolder<T> LX;

        public BasePool(Manager<T> manager, int i) {
            if (manager == null || i < 1) {
                this.Jt = this.Co.hashCode();
                throw new IllegalArgumentException("manager cannot be null and size cannot less then 1");
            }
            this.LW = manager;
            this.Jt = i;
            Object createInstance = this.LW.createInstance();
            if (createInstance != null) {
                this.LX = d(createInstance.getClass(), i);
                doRelease(createInstance);
                return;
            }
            throw new IllegalStateException("manager create instance cannot return null");
        }

        /* access modifiers changed from: 0000 */
        public abstract void a(IInstanceHolder<T> iInstanceHolder, int i);

        public T acquire() {
            return doAcquire();
        }

        public void close() {
            if (this.LX != null) {
                a(this.LX, this.Jt);
                this.LX = null;
            }
        }

        /* access modifiers changed from: 0000 */
        public abstract IInstanceHolder<T> d(Class<T> cls, int i);

        /* access modifiers changed from: protected */
        public final T doAcquire() {
            if (this.LX != null) {
                T t = this.LX.get();
                if (t == null) {
                    t = this.LW.createInstance();
                    if (t == null) {
                        throw new IllegalStateException("manager create instance cannot return null");
                    }
                }
                this.LW.onAcquire(t);
                return t;
            }
            throw new IllegalStateException("Cannot acquire object after close()");
        }

        /* access modifiers changed from: protected */
        public final void doRelease(T t) {
            if (this.LX == null) {
                throw new IllegalStateException("Cannot release object after close()");
            } else if (t != null) {
                this.LW.onRelease(t);
                if (!this.LX.put(t)) {
                    this.LW.onDestroy(t);
                }
            }
        }

        public int getSize() {
            if (this.LX == null) {
                return 0;
            }
            return this.Jt;
        }

        public void release(T t) {
            doRelease(t);
        }
    }

    private interface IInstanceHolder<T> {
        Class<T> dC();

        T get();

        int getSize();

        boolean put(T t);

        void resize(int i);
    }

    private static class InstanceHolder<T> implements IInstanceHolder<T> {
        private final Class<T> Ma;
        private final ConcurrentRingQueue<T> Mb;

        InstanceHolder(Class<T> cls, int i) {
            this.Ma = cls;
            this.Mb = new ConcurrentRingQueue<>(i, false, true);
        }

        public Class<T> dC() {
            return this.Ma;
        }

        public T get() {
            return this.Mb.get();
        }

        public int getSize() {
            return this.Mb.getCapacity();
        }

        public boolean put(T t) {
            return this.Mb.put(t);
        }

        /* JADX WARNING: Code restructure failed: missing block: B:20:0x002f, code lost:
            return;
         */
        public synchronized void resize(int i) {
            int capacity = i + this.Mb.getCapacity();
            if (capacity <= 0) {
                synchronized (Pools.LO) {
                    Pools.LO.remove(dC());
                }
            } else if (capacity > 0) {
                this.Mb.increaseCapacity(capacity);
            } else {
                this.Mb.decreaseCapacity(-capacity);
            }
        }
    }

    public static abstract class Manager<T> {
        public abstract T createInstance();

        public void onAcquire(T t) {
        }

        public void onDestroy(T t) {
        }

        public void onRelease(T t) {
        }
    }

    public interface Pool<T> {
        T acquire();

        void close();

        int getSize();

        void release(T t);
    }

    public static class SimplePool<T> extends BasePool<T> {
        SimplePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        /* access modifiers changed from: 0000 */
        public final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((InstanceHolder) iInstanceHolder, i);
        }

        public /* bridge */ /* synthetic */ Object acquire() {
            return super.acquire();
        }

        public /* bridge */ /* synthetic */ void close() {
            super.close();
        }

        /* access modifiers changed from: 0000 */
        public final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.b(cls, i);
        }

        public /* bridge */ /* synthetic */ int getSize() {
            return super.getSize();
        }

        public /* bridge */ /* synthetic */ void release(Object obj) {
            super.release(obj);
        }
    }

    private static class SoftReferenceInstanceHolder<T> implements IInstanceHolder<T> {
        private volatile int Jt;
        private final Class<T> Ma;
        private volatile SoftReference<T>[] Mc;
        private volatile int mIndex = 0;

        SoftReferenceInstanceHolder(Class<T> cls, int i) {
            this.Ma = cls;
            this.Jt = i;
            this.Mc = new SoftReference[i];
        }

        public Class<T> dC() {
            return this.Ma;
        }

        public synchronized T get() {
            int i = this.mIndex;
            SoftReference<T>[] softReferenceArr = this.Mc;
            while (i != 0) {
                i--;
                if (softReferenceArr[i] != null) {
                    T t = softReferenceArr[i].get();
                    softReferenceArr[i] = null;
                    if (t != null) {
                        this.mIndex = i;
                        return t;
                    }
                }
            }
            return null;
        }

        public int getSize() {
            return this.Jt;
        }

        public synchronized boolean put(T t) {
            int i = this.mIndex;
            SoftReference<T>[] softReferenceArr = this.Mc;
            if (i >= this.Jt) {
                int i2 = 0;
                while (i2 < i) {
                    if (softReferenceArr[i2] != null) {
                        if (softReferenceArr[i2].get() != null) {
                            i2++;
                        }
                    }
                    softReferenceArr[i2] = new SoftReference<>(t);
                    return true;
                }
                return false;
            }
            softReferenceArr[i] = new SoftReference<>(t);
            this.mIndex = i + 1;
            return true;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:20:0x002e, code lost:
            return;
         */
        public synchronized void resize(int i) {
            int i2 = i + this.Jt;
            if (i2 <= 0) {
                synchronized (Pools.LP) {
                    Pools.LP.remove(dC());
                }
                return;
            }
            this.Jt = i2;
            SoftReference<T>[] softReferenceArr = this.Mc;
            int i3 = this.mIndex;
            if (i2 > softReferenceArr.length) {
                SoftReference<T>[] softReferenceArr2 = new SoftReference[i2];
                System.arraycopy(softReferenceArr, 0, softReferenceArr2, 0, i3);
                this.Mc = softReferenceArr2;
            }
        }
    }

    public static class SoftReferencePool<T> extends BasePool<T> {
        SoftReferencePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        /* access modifiers changed from: 0000 */
        public final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((SoftReferenceInstanceHolder) iInstanceHolder, i);
        }

        public /* bridge */ /* synthetic */ Object acquire() {
            return super.acquire();
        }

        public /* bridge */ /* synthetic */ void close() {
            super.close();
        }

        /* access modifiers changed from: 0000 */
        public final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.c(cls, i);
        }

        public /* bridge */ /* synthetic */ int getSize() {
            return super.getSize();
        }

        public /* bridge */ /* synthetic */ void release(Object obj) {
            super.release(obj);
        }
    }

    static <T> void a(InstanceHolder<T> instanceHolder, int i) {
        synchronized (LO) {
            instanceHolder.resize(-i);
        }
    }

    static <T> void a(SoftReferenceInstanceHolder<T> softReferenceInstanceHolder, int i) {
        synchronized (LP) {
            softReferenceInstanceHolder.resize(-i);
        }
    }

    static <T> InstanceHolder<T> b(Class<T> cls, int i) {
        InstanceHolder<T> instanceHolder;
        synchronized (LO) {
            instanceHolder = (InstanceHolder) LO.get(cls);
            if (instanceHolder == null) {
                instanceHolder = new InstanceHolder<>(cls, i);
                LO.put(cls, instanceHolder);
            } else {
                instanceHolder.resize(i);
            }
        }
        return instanceHolder;
    }

    static <T> SoftReferenceInstanceHolder<T> c(Class<T> cls, int i) {
        SoftReferenceInstanceHolder<T> softReferenceInstanceHolder;
        synchronized (LP) {
            softReferenceInstanceHolder = (SoftReferenceInstanceHolder) LP.get(cls);
            if (softReferenceInstanceHolder == null) {
                softReferenceInstanceHolder = new SoftReferenceInstanceHolder<>(cls, i);
                LP.put(cls, softReferenceInstanceHolder);
            } else {
                softReferenceInstanceHolder.resize(i);
            }
        }
        return softReferenceInstanceHolder;
    }

    public static <T> SimplePool<T> createSimplePool(Manager<T> manager, int i) {
        return new SimplePool<>(manager, i);
    }

    public static <T> SoftReferencePool<T> createSoftReferencePool(Manager<T> manager, int i) {
        return new SoftReferencePool<>(manager, i);
    }

    public static Pool<StringBuilder> getStringBuilderPool() {
        return LQ;
    }
}

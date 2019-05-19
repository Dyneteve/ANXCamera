package miui.util;

import java.lang.ref.SoftReference;
import java.util.HashMap;
import miui.util.concurrent.ConcurrentRingQueue;

public final class Pools {
    /* access modifiers changed from: private */
    public static final HashMap<Class<?>, InstanceHolder<?>> JI = new HashMap<>();
    /* access modifiers changed from: private */
    public static final HashMap<Class<?>, SoftReferenceInstanceHolder<?>> JJ = new HashMap<>();
    private static final Pool<StringBuilder> JK = createSoftReferencePool(new Manager<StringBuilder>() {
        /* renamed from: da */
        public StringBuilder createInstance() {
            return new StringBuilder();
        }

        /* renamed from: a */
        public void onRelease(StringBuilder sb) {
            sb.setLength(0);
        }
    }, 4);

    static abstract class BasePool<T> implements Pool<T> {
        private final int Hr;
        private final Manager<T> JL;
        private IInstanceHolder<T> JN;
        private final Object zW = new Object() {
            /* access modifiers changed from: protected */
            public void finalize() throws Throwable {
                try {
                    BasePool.this.close();
                } finally {
                    super.finalize();
                }
            }
        };

        public abstract void a(IInstanceHolder<T> iInstanceHolder, int i);

        public abstract IInstanceHolder<T> d(Class<T> cls, int i);

        public BasePool(Manager<T> manager, int i) {
            if (manager == null || i < 1) {
                this.Hr = this.zW.hashCode();
                throw new IllegalArgumentException("manager cannot be null and size cannot less then 1");
            }
            this.JL = manager;
            this.Hr = i;
            Object createInstance = this.JL.createInstance();
            if (createInstance != null) {
                this.JN = d(createInstance.getClass(), i);
                doRelease(createInstance);
                return;
            }
            throw new IllegalStateException("manager create instance cannot return null");
        }

        /* access modifiers changed from: protected */
        public final T doAcquire() {
            if (this.JN != null) {
                T t = this.JN.get();
                if (t == null) {
                    t = this.JL.createInstance();
                    if (t == null) {
                        throw new IllegalStateException("manager create instance cannot return null");
                    }
                }
                this.JL.onAcquire(t);
                return t;
            }
            throw new IllegalStateException("Cannot acquire object after close()");
        }

        /* access modifiers changed from: protected */
        public final void doRelease(T t) {
            if (this.JN == null) {
                throw new IllegalStateException("Cannot release object after close()");
            } else if (t != null) {
                this.JL.onRelease(t);
                if (!this.JN.put(t)) {
                    this.JL.onDestroy(t);
                }
            }
        }

        public T acquire() {
            return doAcquire();
        }

        public void release(T t) {
            doRelease(t);
        }

        public void close() {
            if (this.JN != null) {
                a(this.JN, this.Hr);
                this.JN = null;
            }
        }

        public int getSize() {
            if (this.JN == null) {
                return 0;
            }
            return this.Hr;
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
        private final Class<T> JR;
        private final ConcurrentRingQueue<T> JS;

        InstanceHolder(Class<T> cls, int i) {
            this.JR = cls;
            this.JS = new ConcurrentRingQueue<>(i, false, true);
        }

        public Class<T> dC() {
            return this.JR;
        }

        public int getSize() {
            return this.JS.getCapacity();
        }

        /* JADX WARNING: Code restructure failed: missing block: B:20:0x002f, code lost:
            return;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public synchronized void resize(int i) {
            int capacity = i + this.JS.getCapacity();
            if (capacity <= 0) {
                synchronized (Pools.JI) {
                    Pools.JI.remove(dC());
                }
            } else if (capacity > 0) {
                this.JS.increaseCapacity(capacity);
            } else {
                this.JS.decreaseCapacity(-capacity);
            }
        }

        public T get() {
            return this.JS.get();
        }

        public boolean put(T t) {
            return this.JS.put(t);
        }
    }

    public static abstract class Manager<T> {
        public abstract T createInstance();

        public void onAcquire(T t) {
        }

        public void onRelease(T t) {
        }

        public void onDestroy(T t) {
        }
    }

    public interface Pool<T> {
        T acquire();

        void close();

        int getSize();

        void release(T t);
    }

    public static class SimplePool<T> extends BasePool<T> {
        public /* bridge */ /* synthetic */ Object acquire() {
            return super.acquire();
        }

        public /* bridge */ /* synthetic */ void close() {
            super.close();
        }

        public /* bridge */ /* synthetic */ int getSize() {
            return super.getSize();
        }

        public /* bridge */ /* synthetic */ void release(Object obj) {
            super.release(obj);
        }

        SimplePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        /* access modifiers changed from: 0000 */
        public final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.b(cls, i);
        }

        /* access modifiers changed from: 0000 */
        public final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((InstanceHolder) iInstanceHolder, i);
        }
    }

    private static class SoftReferenceInstanceHolder<T> implements IInstanceHolder<T> {
        private volatile int Hr;
        private final Class<T> JR;
        private volatile SoftReference<T>[] JT;
        private volatile int mIndex = 0;

        SoftReferenceInstanceHolder(Class<T> cls, int i) {
            this.JR = cls;
            this.Hr = i;
            this.JT = new SoftReference[i];
        }

        public Class<T> dC() {
            return this.JR;
        }

        public int getSize() {
            return this.Hr;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:20:0x002e, code lost:
            return;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public synchronized void resize(int i) {
            int i2 = i + this.Hr;
            if (i2 <= 0) {
                synchronized (Pools.JJ) {
                    Pools.JJ.remove(dC());
                }
                return;
            }
            this.Hr = i2;
            SoftReference<T>[] softReferenceArr = this.JT;
            int i3 = this.mIndex;
            if (i2 > softReferenceArr.length) {
                SoftReference<T>[] softReferenceArr2 = new SoftReference[i2];
                System.arraycopy(softReferenceArr, 0, softReferenceArr2, 0, i3);
                this.JT = softReferenceArr2;
            }
        }

        public synchronized T get() {
            int i = this.mIndex;
            SoftReference<T>[] softReferenceArr = this.JT;
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

        public synchronized boolean put(T t) {
            int i = this.mIndex;
            SoftReference<T>[] softReferenceArr = this.JT;
            if (i >= this.Hr) {
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
    }

    public static class SoftReferencePool<T> extends BasePool<T> {
        public /* bridge */ /* synthetic */ Object acquire() {
            return super.acquire();
        }

        public /* bridge */ /* synthetic */ void close() {
            super.close();
        }

        public /* bridge */ /* synthetic */ int getSize() {
            return super.getSize();
        }

        public /* bridge */ /* synthetic */ void release(Object obj) {
            super.release(obj);
        }

        SoftReferencePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        /* access modifiers changed from: 0000 */
        public final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.c(cls, i);
        }

        /* access modifiers changed from: 0000 */
        public final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((SoftReferenceInstanceHolder) iInstanceHolder, i);
        }
    }

    public static Pool<StringBuilder> getStringBuilderPool() {
        return JK;
    }

    static <T> InstanceHolder<T> b(Class<T> cls, int i) {
        InstanceHolder<T> instanceHolder;
        synchronized (JI) {
            instanceHolder = (InstanceHolder) JI.get(cls);
            if (instanceHolder == null) {
                instanceHolder = new InstanceHolder<>(cls, i);
                JI.put(cls, instanceHolder);
            } else {
                instanceHolder.resize(i);
            }
        }
        return instanceHolder;
    }

    static <T> void a(InstanceHolder<T> instanceHolder, int i) {
        synchronized (JI) {
            instanceHolder.resize(-i);
        }
    }

    static <T> SoftReferenceInstanceHolder<T> c(Class<T> cls, int i) {
        SoftReferenceInstanceHolder<T> softReferenceInstanceHolder;
        synchronized (JJ) {
            softReferenceInstanceHolder = (SoftReferenceInstanceHolder) JJ.get(cls);
            if (softReferenceInstanceHolder == null) {
                softReferenceInstanceHolder = new SoftReferenceInstanceHolder<>(cls, i);
                JJ.put(cls, softReferenceInstanceHolder);
            } else {
                softReferenceInstanceHolder.resize(i);
            }
        }
        return softReferenceInstanceHolder;
    }

    static <T> void a(SoftReferenceInstanceHolder<T> softReferenceInstanceHolder, int i) {
        synchronized (JJ) {
            softReferenceInstanceHolder.resize(-i);
        }
    }

    public static <T> SimplePool<T> createSimplePool(Manager<T> manager, int i) {
        return new SimplePool<>(manager, i);
    }

    public static <T> SoftReferencePool<T> createSoftReferencePool(Manager<T> manager, int i) {
        return new SoftReferencePool<>(manager, i);
    }
}

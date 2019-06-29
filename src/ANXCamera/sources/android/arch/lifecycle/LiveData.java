package android.arch.lifecycle;

import android.arch.core.a.a;
import android.arch.core.b.b;
import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.Lifecycle.State;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Iterator;
import java.util.Map.Entry;

public abstract class LiveData<T> {
    /* access modifiers changed from: private */
    public static final Object NOT_SET = new Object();
    static final int START_VERSION = -1;
    /* access modifiers changed from: private */
    public int mActiveCount = 0;
    private volatile Object mData = NOT_SET;
    /* access modifiers changed from: private */
    public final Object mDataLock = new Object();
    private boolean mDispatchInvalidated;
    private boolean mDispatchingValue;
    private b<Observer<? super T>, ObserverWrapper> mObservers = new b<>();
    /* access modifiers changed from: private */
    public volatile Object mPendingData = NOT_SET;
    private final Runnable mPostValueRunnable = new Runnable() {
        public void run() {
            Object access$100;
            synchronized (LiveData.this.mDataLock) {
                access$100 = LiveData.this.mPendingData;
                LiveData.this.mPendingData = LiveData.NOT_SET;
            }
            LiveData.this.setValue(access$100);
        }
    };
    private int mVersion = -1;

    private class AlwaysActiveObserver extends ObserverWrapper {
        AlwaysActiveObserver(Observer<? super T> observer) {
            super(observer);
        }

        /* access modifiers changed from: 0000 */
        public boolean shouldBeActive() {
            return true;
        }
    }

    class LifecycleBoundObserver extends ObserverWrapper implements GenericLifecycleObserver {
        @NonNull
        final LifecycleOwner mOwner;

        LifecycleBoundObserver(LifecycleOwner lifecycleOwner, @NonNull Observer<? super T> observer) {
            super(observer);
            this.mOwner = lifecycleOwner;
        }

        /* access modifiers changed from: 0000 */
        public void detachObserver() {
            this.mOwner.getLifecycle().removeObserver(this);
        }

        /* access modifiers changed from: 0000 */
        public boolean isAttachedTo(LifecycleOwner lifecycleOwner) {
            return this.mOwner == lifecycleOwner;
        }

        public void onStateChanged(LifecycleOwner lifecycleOwner, Event event) {
            if (this.mOwner.getLifecycle().getCurrentState() == State.DESTROYED) {
                LiveData.this.removeObserver(this.mObserver);
            } else {
                activeStateChanged(shouldBeActive());
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean shouldBeActive() {
            return this.mOwner.getLifecycle().getCurrentState().isAtLeast(State.STARTED);
        }
    }

    private abstract class ObserverWrapper {
        boolean mActive;
        int mLastVersion = -1;
        final Observer<? super T> mObserver;

        ObserverWrapper(Observer<? super T> observer) {
            this.mObserver = observer;
        }

        /* access modifiers changed from: 0000 */
        public void activeStateChanged(boolean z) {
            if (z != this.mActive) {
                this.mActive = z;
                int i = 1;
                boolean z2 = LiveData.this.mActiveCount == 0;
                LiveData liveData = LiveData.this;
                int access$300 = liveData.mActiveCount;
                if (!this.mActive) {
                    i = -1;
                }
                liveData.mActiveCount = access$300 + i;
                if (z2 && this.mActive) {
                    LiveData.this.onActive();
                }
                if (LiveData.this.mActiveCount == 0 && !this.mActive) {
                    LiveData.this.onInactive();
                }
                if (this.mActive) {
                    LiveData.this.dispatchingValue(this);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void detachObserver() {
        }

        /* access modifiers changed from: 0000 */
        public boolean isAttachedTo(LifecycleOwner lifecycleOwner) {
            return false;
        }

        /* access modifiers changed from: 0000 */
        public abstract boolean shouldBeActive();
    }

    private static void assertMainThread(String str) {
        if (!a.j().isMainThread()) {
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot invoke ");
            sb.append(str);
            sb.append(" on a background");
            sb.append(" thread");
            throw new IllegalStateException(sb.toString());
        }
    }

    private void considerNotify(ObserverWrapper observerWrapper) {
        if (observerWrapper.mActive) {
            if (!observerWrapper.shouldBeActive()) {
                observerWrapper.activeStateChanged(false);
            } else if (observerWrapper.mLastVersion < this.mVersion) {
                observerWrapper.mLastVersion = this.mVersion;
                observerWrapper.mObserver.onChanged(this.mData);
            }
        }
    }

    /* access modifiers changed from: private */
    public void dispatchingValue(@Nullable ObserverWrapper observerWrapper) {
        if (this.mDispatchingValue) {
            this.mDispatchInvalidated = true;
            return;
        }
        this.mDispatchingValue = true;
        do {
            this.mDispatchInvalidated = false;
            if (observerWrapper == null) {
                d l = this.mObservers.l();
                while (l.hasNext()) {
                    considerNotify((ObserverWrapper) ((Entry) l.next()).getValue());
                    if (this.mDispatchInvalidated) {
                        break;
                    }
                }
            } else {
                considerNotify(observerWrapper);
                observerWrapper = null;
            }
        } while (this.mDispatchInvalidated);
        this.mDispatchingValue = false;
    }

    @Nullable
    public T getValue() {
        T t = this.mData;
        if (t != NOT_SET) {
            return t;
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public int getVersion() {
        return this.mVersion;
    }

    public boolean hasActiveObservers() {
        return this.mActiveCount > 0;
    }

    public boolean hasObservers() {
        return this.mObservers.size() > 0;
    }

    @MainThread
    public void observe(@NonNull LifecycleOwner lifecycleOwner, @NonNull Observer<? super T> observer) {
        assertMainThread("observe");
        if (lifecycleOwner.getLifecycle().getCurrentState() != State.DESTROYED) {
            LifecycleBoundObserver lifecycleBoundObserver = new LifecycleBoundObserver(lifecycleOwner, observer);
            ObserverWrapper observerWrapper = (ObserverWrapper) this.mObservers.putIfAbsent(observer, lifecycleBoundObserver);
            if (observerWrapper != null && !observerWrapper.isAttachedTo(lifecycleOwner)) {
                throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
            } else if (observerWrapper == null) {
                lifecycleOwner.getLifecycle().addObserver(lifecycleBoundObserver);
            }
        }
    }

    @MainThread
    public void observeForever(@NonNull Observer<? super T> observer) {
        assertMainThread("observeForever");
        AlwaysActiveObserver alwaysActiveObserver = new AlwaysActiveObserver(observer);
        ObserverWrapper observerWrapper = (ObserverWrapper) this.mObservers.putIfAbsent(observer, alwaysActiveObserver);
        if (observerWrapper != null && (observerWrapper instanceof LifecycleBoundObserver)) {
            throw new IllegalArgumentException("Cannot add the same observer with different lifecycles");
        } else if (observerWrapper == null) {
            alwaysActiveObserver.activeStateChanged(true);
        }
    }

    /* access modifiers changed from: protected */
    public void onActive() {
    }

    /* access modifiers changed from: protected */
    public void onInactive() {
    }

    /* access modifiers changed from: protected */
    public void postValue(T t) {
        boolean z;
        synchronized (this.mDataLock) {
            z = this.mPendingData == NOT_SET;
            this.mPendingData = t;
        }
        if (z) {
            a.j().b(this.mPostValueRunnable);
        }
    }

    @MainThread
    public void removeObserver(@NonNull Observer<? super T> observer) {
        assertMainThread("removeObserver");
        ObserverWrapper observerWrapper = (ObserverWrapper) this.mObservers.remove(observer);
        if (observerWrapper != null) {
            observerWrapper.detachObserver();
            observerWrapper.activeStateChanged(false);
        }
    }

    @MainThread
    public void removeObservers(@NonNull LifecycleOwner lifecycleOwner) {
        assertMainThread("removeObservers");
        Iterator it = this.mObservers.iterator();
        while (it.hasNext()) {
            Entry entry = (Entry) it.next();
            if (((ObserverWrapper) entry.getValue()).isAttachedTo(lifecycleOwner)) {
                removeObserver((Observer) entry.getKey());
            }
        }
    }

    /* access modifiers changed from: protected */
    @MainThread
    public void setValue(T t) {
        assertMainThread("setValue");
        this.mVersion++;
        this.mData = t;
        dispatchingValue(null);
    }
}

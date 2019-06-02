package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import java.util.concurrent.atomic.AtomicReference;

public final class MaybeCache<T> extends Maybe<T> implements MaybeObserver<T> {
    static final CacheDisposable[] EMPTY = new CacheDisposable[0];
    static final CacheDisposable[] TERMINATED = new CacheDisposable[0];
    Throwable error;
    final AtomicReference<CacheDisposable<T>[]> observers = new AtomicReference<>(EMPTY);
    final AtomicReference<MaybeSource<T>> source;
    T value;

    static final class CacheDisposable<T> extends AtomicReference<MaybeCache<T>> implements Disposable {
        private static final long serialVersionUID = -5791853038359966195L;
        final MaybeObserver<? super T> actual;

        CacheDisposable(MaybeObserver<? super T> maybeObserver, MaybeCache<T> maybeCache) {
            super(maybeCache);
            this.actual = maybeObserver;
        }

        public void dispose() {
            MaybeCache maybeCache = (MaybeCache) getAndSet(null);
            if (maybeCache != null) {
                maybeCache.remove(this);
            }
        }

        public boolean isDisposed() {
            return get() == null;
        }
    }

    public MaybeCache(MaybeSource<T> maybeSource) {
        this.source = new AtomicReference<>(maybeSource);
    }

    /* access modifiers changed from: 0000 */
    public boolean add(CacheDisposable<T> cacheDisposable) {
        while (true) {
            CacheDisposable[] cacheDisposableArr = (CacheDisposable[]) this.observers.get();
            if (cacheDisposableArr == TERMINATED) {
                return false;
            }
            int length = cacheDisposableArr.length;
            CacheDisposable[] cacheDisposableArr2 = new CacheDisposable[(length + 1)];
            System.arraycopy(cacheDisposableArr, 0, cacheDisposableArr2, 0, length);
            cacheDisposableArr2[length] = cacheDisposable;
            if (this.observers.compareAndSet(cacheDisposableArr, cacheDisposableArr2)) {
                return true;
            }
        }
    }

    public void onComplete() {
        CacheDisposable[] cacheDisposableArr;
        for (CacheDisposable cacheDisposable : (CacheDisposable[]) this.observers.getAndSet(TERMINATED)) {
            if (!cacheDisposable.isDisposed()) {
                cacheDisposable.actual.onComplete();
            }
        }
    }

    public void onError(Throwable th) {
        CacheDisposable[] cacheDisposableArr;
        this.error = th;
        for (CacheDisposable cacheDisposable : (CacheDisposable[]) this.observers.getAndSet(TERMINATED)) {
            if (!cacheDisposable.isDisposed()) {
                cacheDisposable.actual.onError(th);
            }
        }
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void onSuccess(T t) {
        CacheDisposable[] cacheDisposableArr;
        this.value = t;
        for (CacheDisposable cacheDisposable : (CacheDisposable[]) this.observers.getAndSet(TERMINATED)) {
            if (!cacheDisposable.isDisposed()) {
                cacheDisposable.actual.onSuccess(t);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void remove(CacheDisposable<T> cacheDisposable) {
        CacheDisposable[] cacheDisposableArr;
        while (true) {
            CacheDisposable<T>[] cacheDisposableArr2 = (CacheDisposable[]) this.observers.get();
            int length = cacheDisposableArr2.length;
            if (length != 0) {
                int i = -1;
                int i2 = 0;
                while (true) {
                    if (i2 >= length) {
                        break;
                    } else if (cacheDisposableArr2[i2] == cacheDisposable) {
                        i = i2;
                        break;
                    } else {
                        i2++;
                    }
                }
                if (i >= 0) {
                    if (length == 1) {
                        cacheDisposableArr = EMPTY;
                    } else {
                        CacheDisposable[] cacheDisposableArr3 = new CacheDisposable[(length - 1)];
                        System.arraycopy(cacheDisposableArr2, 0, cacheDisposableArr3, 0, i);
                        System.arraycopy(cacheDisposableArr2, i + 1, cacheDisposableArr3, i, (length - i) - 1);
                        cacheDisposableArr = cacheDisposableArr3;
                    }
                    if (this.observers.compareAndSet(cacheDisposableArr2, cacheDisposableArr)) {
                        return;
                    }
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(MaybeObserver<? super T> maybeObserver) {
        CacheDisposable cacheDisposable = new CacheDisposable(maybeObserver, this);
        maybeObserver.onSubscribe(cacheDisposable);
        if (!add(cacheDisposable)) {
            if (!cacheDisposable.isDisposed()) {
                Throwable th = this.error;
                if (th != null) {
                    maybeObserver.onError(th);
                } else {
                    T t = this.value;
                    if (t != null) {
                        maybeObserver.onSuccess(t);
                    } else {
                        maybeObserver.onComplete();
                    }
                }
            }
        } else if (cacheDisposable.isDisposed()) {
            remove(cacheDisposable);
        } else {
            MaybeSource maybeSource = (MaybeSource) this.source.getAndSet(null);
            if (maybeSource != null) {
                maybeSource.subscribe(this);
            }
        }
    }
}

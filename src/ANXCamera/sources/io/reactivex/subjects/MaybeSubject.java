package io.reactivex.subjects;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

public final class MaybeSubject<T> extends Maybe<T> implements MaybeObserver<T> {
    static final MaybeDisposable[] EMPTY = new MaybeDisposable[0];
    static final MaybeDisposable[] TERMINATED = new MaybeDisposable[0];
    Throwable error;
    final AtomicReference<MaybeDisposable<T>[]> observers = new AtomicReference<>(EMPTY);
    final AtomicBoolean once = new AtomicBoolean();
    T value;

    static final class MaybeDisposable<T> extends AtomicReference<MaybeSubject<T>> implements Disposable {
        private static final long serialVersionUID = -7650903191002190468L;
        final MaybeObserver<? super T> actual;

        MaybeDisposable(MaybeObserver<? super T> maybeObserver, MaybeSubject<T> maybeSubject) {
            this.actual = maybeObserver;
            lazySet(maybeSubject);
        }

        public void dispose() {
            MaybeSubject maybeSubject = (MaybeSubject) getAndSet(null);
            if (maybeSubject != null) {
                maybeSubject.remove(this);
            }
        }

        public boolean isDisposed() {
            return get() == null;
        }
    }

    MaybeSubject() {
    }

    @CheckReturnValue
    public static <T> MaybeSubject<T> create() {
        return new MaybeSubject<>();
    }

    /* access modifiers changed from: 0000 */
    public boolean add(MaybeDisposable<T> maybeDisposable) {
        while (true) {
            MaybeDisposable[] maybeDisposableArr = (MaybeDisposable[]) this.observers.get();
            if (maybeDisposableArr == TERMINATED) {
                return false;
            }
            int length = maybeDisposableArr.length;
            MaybeDisposable[] maybeDisposableArr2 = new MaybeDisposable[(length + 1)];
            System.arraycopy(maybeDisposableArr, 0, maybeDisposableArr2, 0, length);
            maybeDisposableArr2[length] = maybeDisposable;
            if (this.observers.compareAndSet(maybeDisposableArr, maybeDisposableArr2)) {
                return true;
            }
        }
    }

    public Throwable getThrowable() {
        if (this.observers.get() == TERMINATED) {
            return this.error;
        }
        return null;
    }

    public T getValue() {
        if (this.observers.get() == TERMINATED) {
            return this.value;
        }
        return null;
    }

    public boolean hasComplete() {
        return this.observers.get() == TERMINATED && this.value == null && this.error == null;
    }

    public boolean hasObservers() {
        return ((MaybeDisposable[]) this.observers.get()).length != 0;
    }

    public boolean hasThrowable() {
        return this.observers.get() == TERMINATED && this.error != null;
    }

    public boolean hasValue() {
        return this.observers.get() == TERMINATED && this.value != null;
    }

    /* access modifiers changed from: 0000 */
    public int observerCount() {
        return ((MaybeDisposable[]) this.observers.get()).length;
    }

    public void onComplete() {
        if (this.once.compareAndSet(false, true)) {
            for (MaybeDisposable maybeDisposable : (MaybeDisposable[]) this.observers.getAndSet(TERMINATED)) {
                maybeDisposable.actual.onComplete();
            }
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.once.compareAndSet(false, true)) {
            this.error = th;
            for (MaybeDisposable maybeDisposable : (MaybeDisposable[]) this.observers.getAndSet(TERMINATED)) {
                maybeDisposable.actual.onError(th);
            }
            return;
        }
        RxJavaPlugins.onError(th);
    }

    public void onSubscribe(Disposable disposable) {
        if (this.observers.get() == TERMINATED) {
            disposable.dispose();
        }
    }

    public void onSuccess(T t) {
        ObjectHelper.requireNonNull(t, "onSuccess called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.once.compareAndSet(false, true)) {
            this.value = t;
            for (MaybeDisposable maybeDisposable : (MaybeDisposable[]) this.observers.getAndSet(TERMINATED)) {
                maybeDisposable.actual.onSuccess(t);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void remove(MaybeDisposable<T> maybeDisposable) {
        MaybeDisposable[] maybeDisposableArr;
        while (true) {
            MaybeDisposable<T>[] maybeDisposableArr2 = (MaybeDisposable[]) this.observers.get();
            int length = maybeDisposableArr2.length;
            if (length != 0) {
                int i = -1;
                int i2 = 0;
                while (true) {
                    if (i2 >= length) {
                        break;
                    } else if (maybeDisposableArr2[i2] == maybeDisposable) {
                        i = i2;
                        break;
                    } else {
                        i2++;
                    }
                }
                if (i >= 0) {
                    if (length == 1) {
                        maybeDisposableArr = EMPTY;
                    } else {
                        MaybeDisposable[] maybeDisposableArr3 = new MaybeDisposable[(length - 1)];
                        System.arraycopy(maybeDisposableArr2, 0, maybeDisposableArr3, 0, i);
                        System.arraycopy(maybeDisposableArr2, i + 1, maybeDisposableArr3, i, (length - i) - 1);
                        maybeDisposableArr = maybeDisposableArr3;
                    }
                    if (this.observers.compareAndSet(maybeDisposableArr2, maybeDisposableArr)) {
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
        MaybeDisposable maybeDisposable = new MaybeDisposable(maybeObserver, this);
        maybeObserver.onSubscribe(maybeDisposable);
        if (!add(maybeDisposable)) {
            Throwable th = this.error;
            if (th != null) {
                maybeObserver.onError(th);
                return;
            }
            T t = this.value;
            if (t == null) {
                maybeObserver.onComplete();
            } else {
                maybeObserver.onSuccess(t);
            }
        } else if (maybeDisposable.isDisposed()) {
            remove(maybeDisposable);
        }
    }
}

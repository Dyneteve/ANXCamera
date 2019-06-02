package io.reactivex.internal.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.NoSuchElementException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;

public final class FutureObserver<T> extends CountDownLatch implements Observer<T>, Disposable, Future<T> {
    Throwable error;
    final AtomicReference<Disposable> s = new AtomicReference<>();
    T value;

    public FutureObserver() {
        super(1);
    }

    public boolean cancel(boolean z) {
        while (true) {
            Disposable disposable = (Disposable) this.s.get();
            if (disposable != this && disposable != DisposableHelper.DISPOSED) {
                if (this.s.compareAndSet(disposable, DisposableHelper.DISPOSED)) {
                    if (disposable != null) {
                        disposable.dispose();
                    }
                    countDown();
                    return true;
                }
            }
        }
        return false;
    }

    public void dispose() {
    }

    public T get() throws InterruptedException, ExecutionException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            await();
        }
        if (!isCancelled()) {
            Throwable th = this.error;
            if (th == null) {
                return this.value;
            }
            throw new ExecutionException(th);
        }
        throw new CancellationException();
    }

    public T get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        if (getCount() != 0) {
            BlockingHelper.verifyNonBlocking();
            if (!await(j, timeUnit)) {
                throw new TimeoutException();
            }
        }
        if (!isCancelled()) {
            Throwable th = this.error;
            if (th == null) {
                return this.value;
            }
            throw new ExecutionException(th);
        }
        throw new CancellationException();
    }

    public boolean isCancelled() {
        return DisposableHelper.isDisposed((Disposable) this.s.get());
    }

    public boolean isDisposed() {
        return isDone();
    }

    public boolean isDone() {
        return getCount() == 0;
    }

    public void onComplete() {
        if (this.value == null) {
            onError(new NoSuchElementException("The source is empty"));
            return;
        }
        while (true) {
            Disposable disposable = (Disposable) this.s.get();
            if (disposable != this && disposable != DisposableHelper.DISPOSED) {
                if (this.s.compareAndSet(disposable, this)) {
                    countDown();
                    return;
                }
            }
        }
    }

    public void onError(Throwable th) {
        if (this.error == null) {
            this.error = th;
            while (true) {
                Disposable disposable = (Disposable) this.s.get();
                if (disposable == this || disposable == DisposableHelper.DISPOSED) {
                    RxJavaPlugins.onError(th);
                } else if (this.s.compareAndSet(disposable, this)) {
                    countDown();
                    return;
                }
            }
            RxJavaPlugins.onError(th);
            return;
        }
        RxJavaPlugins.onError(th);
    }

    public void onNext(T t) {
        if (this.value != null) {
            ((Disposable) this.s.get()).dispose();
            onError(new IndexOutOfBoundsException("More than one element received"));
            return;
        }
        this.value = t;
    }

    public void onSubscribe(Disposable disposable) {
        DisposableHelper.setOnce(this.s, disposable);
    }
}

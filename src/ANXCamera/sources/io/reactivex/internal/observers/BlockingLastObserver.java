package io.reactivex.internal.observers;

public final class BlockingLastObserver<T> extends BlockingBaseObserver<T> {
    public void onError(Throwable th) {
        this.value = null;
        this.error = th;
        countDown();
    }

    public void onNext(T t) {
        this.value = t;
    }
}

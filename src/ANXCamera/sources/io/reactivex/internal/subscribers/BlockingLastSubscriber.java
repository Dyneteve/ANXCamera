package io.reactivex.internal.subscribers;

public final class BlockingLastSubscriber<T> extends BlockingBaseSubscriber<T> {
    public void onError(Throwable th) {
        this.value = null;
        this.error = th;
        countDown();
    }

    public void onNext(T t) {
        this.value = t;
    }
}

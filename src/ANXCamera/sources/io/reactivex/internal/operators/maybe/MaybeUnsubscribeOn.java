package io.reactivex.internal.operators.maybe;

import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;

public final class MaybeUnsubscribeOn<T> extends AbstractMaybeWithUpstream<T, T> {
    final Scheduler scheduler;

    static final class UnsubscribeOnMaybeObserver<T> extends AtomicReference<Disposable> implements MaybeObserver<T>, Disposable, Runnable {
        private static final long serialVersionUID = 3256698449646456986L;
        final MaybeObserver<? super T> actual;
        Disposable ds;
        final Scheduler scheduler;

        UnsubscribeOnMaybeObserver(MaybeObserver<? super T> maybeObserver, Scheduler scheduler2) {
            this.actual = maybeObserver;
            this.scheduler = scheduler2;
        }

        public void dispose() {
            Disposable disposable = (Disposable) getAndSet(DisposableHelper.DISPOSED);
            if (disposable != DisposableHelper.DISPOSED) {
                this.ds = disposable;
                this.scheduler.scheduleDirect(this);
            }
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) get());
        }

        public void onComplete() {
            this.actual.onComplete();
        }

        public void onError(Throwable th) {
            this.actual.onError(th);
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.setOnce(this, disposable)) {
                this.actual.onSubscribe(this);
            }
        }

        public void onSuccess(T t) {
            this.actual.onSuccess(t);
        }

        public void run() {
            this.ds.dispose();
        }
    }

    public MaybeUnsubscribeOn(MaybeSource<T> maybeSource, Scheduler scheduler2) {
        super(maybeSource);
        this.scheduler = scheduler2;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(MaybeObserver<? super T> maybeObserver) {
        this.source.subscribe(new UnsubscribeOnMaybeObserver(maybeObserver, this.scheduler));
    }
}

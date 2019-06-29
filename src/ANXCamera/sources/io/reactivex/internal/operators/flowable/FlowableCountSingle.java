package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.fuseable.FuseToFlowable;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscription;

public final class FlowableCountSingle<T> extends Single<Long> implements FuseToFlowable<Long> {
    final Flowable<T> source;

    static final class CountSubscriber implements FlowableSubscriber<Object>, Disposable {
        final SingleObserver<? super Long> actual;
        long count;
        Subscription s;

        CountSubscriber(SingleObserver<? super Long> singleObserver) {
            this.actual = singleObserver;
        }

        public void dispose() {
            this.s.cancel();
            this.s = SubscriptionHelper.CANCELLED;
        }

        public boolean isDisposed() {
            return this.s == SubscriptionHelper.CANCELLED;
        }

        public void onComplete() {
            this.s = SubscriptionHelper.CANCELLED;
            this.actual.onSuccess(Long.valueOf(this.count));
        }

        public void onError(Throwable th) {
            this.s = SubscriptionHelper.CANCELLED;
            this.actual.onError(th);
        }

        public void onNext(Object obj) {
            this.count++;
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
                subscription.request(Long.MAX_VALUE);
            }
        }
    }

    public FlowableCountSingle(Flowable<T> flowable) {
        this.source = flowable;
    }

    public Flowable<Long> fuseToFlowable() {
        return RxJavaPlugins.onAssembly((Flowable<T>) new FlowableCount<T>(this.source));
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(SingleObserver<? super Long> singleObserver) {
        this.source.subscribe((FlowableSubscriber<? super T>) new CountSubscriber<Object>(singleObserver));
    }
}

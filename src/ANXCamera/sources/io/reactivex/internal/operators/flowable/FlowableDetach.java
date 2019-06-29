package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.EmptyComponent;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableDetach<T> extends AbstractFlowableWithUpstream<T, T> {

    static final class DetachSubscriber<T> implements FlowableSubscriber<T>, Subscription {
        Subscriber<? super T> actual;
        Subscription s;

        DetachSubscriber(Subscriber<? super T> subscriber) {
            this.actual = subscriber;
        }

        public void cancel() {
            Subscription subscription = this.s;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            subscription.cancel();
        }

        public void onComplete() {
            Subscriber<? super T> subscriber = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            subscriber.onComplete();
        }

        public void onError(Throwable th) {
            Subscriber<? super T> subscriber = this.actual;
            this.s = EmptyComponent.INSTANCE;
            this.actual = EmptyComponent.asSubscriber();
            subscriber.onError(th);
        }

        public void onNext(T t) {
            this.actual.onNext(t);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
            }
        }

        public void request(long j) {
            this.s.request(j);
        }
    }

    public FlowableDetach(Flowable<T> flowable) {
        super(flowable);
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super T> subscriber) {
        this.source.subscribe((FlowableSubscriber<? super T>) new DetachSubscriber<Object>(subscriber));
    }
}

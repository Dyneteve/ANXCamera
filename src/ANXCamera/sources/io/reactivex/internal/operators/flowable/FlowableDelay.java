package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Scheduler;
import io.reactivex.Scheduler.Worker;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.subscribers.SerializedSubscriber;
import java.util.concurrent.TimeUnit;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableDelay<T> extends AbstractFlowableWithUpstream<T, T> {
    final long delay;
    final boolean delayError;
    final Scheduler scheduler;
    final TimeUnit unit;

    static final class DelaySubscriber<T> implements FlowableSubscriber<T>, Subscription {
        final Subscriber<? super T> actual;
        final long delay;
        final boolean delayError;
        Subscription s;
        final TimeUnit unit;
        final Worker w;

        final class OnComplete implements Runnable {
            OnComplete() {
            }

            public void run() {
                try {
                    DelaySubscriber.this.actual.onComplete();
                } finally {
                    DelaySubscriber.this.w.dispose();
                }
            }
        }

        final class OnError implements Runnable {
            private final Throwable t;

            OnError(Throwable th) {
                this.t = th;
            }

            public void run() {
                try {
                    DelaySubscriber.this.actual.onError(this.t);
                } finally {
                    DelaySubscriber.this.w.dispose();
                }
            }
        }

        final class OnNext implements Runnable {
            private final T t;

            OnNext(T t2) {
                this.t = t2;
            }

            public void run() {
                DelaySubscriber.this.actual.onNext(this.t);
            }
        }

        DelaySubscriber(Subscriber<? super T> subscriber, long j, TimeUnit timeUnit, Worker worker, boolean z) {
            this.actual = subscriber;
            this.delay = j;
            this.unit = timeUnit;
            this.w = worker;
            this.delayError = z;
        }

        public void cancel() {
            this.s.cancel();
            this.w.dispose();
        }

        public void onComplete() {
            this.w.schedule(new OnComplete(), this.delay, this.unit);
        }

        public void onError(Throwable th) {
            this.w.schedule(new OnError(th), this.delayError ? this.delay : 0, this.unit);
        }

        public void onNext(T t) {
            this.w.schedule(new OnNext(t), this.delay, this.unit);
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

    public FlowableDelay(Flowable<T> flowable, long j, TimeUnit timeUnit, Scheduler scheduler2, boolean z) {
        super(flowable);
        this.delay = j;
        this.unit = timeUnit;
        this.scheduler = scheduler2;
        this.delayError = z;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super T> subscriber) {
        Subscriber<? super T> serializedSubscriber = this.delayError ? subscriber : new SerializedSubscriber<>(subscriber);
        Worker createWorker = this.scheduler.createWorker();
        Flowable flowable = this.source;
        DelaySubscriber delaySubscriber = new DelaySubscriber(serializedSubscriber, this.delay, this.unit, createWorker, this.delayError);
        flowable.subscribe((FlowableSubscriber<? super T>) delaySubscriber);
    }
}

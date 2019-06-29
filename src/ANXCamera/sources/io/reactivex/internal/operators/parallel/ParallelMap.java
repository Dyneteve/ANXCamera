package io.reactivex.internal.operators.parallel;

import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelMap<T, R> extends ParallelFlowable<R> {
    final Function<? super T, ? extends R> mapper;
    final ParallelFlowable<T> source;

    static final class ParallelMapConditionalSubscriber<T, R> implements ConditionalSubscriber<T>, Subscription {
        final ConditionalSubscriber<? super R> actual;
        boolean done;
        final Function<? super T, ? extends R> mapper;
        Subscription s;

        ParallelMapConditionalSubscriber(ConditionalSubscriber<? super R> conditionalSubscriber, Function<? super T, ? extends R> function) {
            this.actual = conditionalSubscriber;
            this.mapper = function;
        }

        public void cancel() {
            this.s.cancel();
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
            }
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.done = true;
            this.actual.onError(th);
        }

        public void onNext(T t) {
            if (!this.done) {
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null value"));
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    cancel();
                    onError(th);
                }
            }
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

        public boolean tryOnNext(T t) {
            if (this.done) {
                return false;
            }
            try {
                return this.actual.tryOnNext(ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null value"));
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                cancel();
                onError(th);
                return false;
            }
        }
    }

    static final class ParallelMapSubscriber<T, R> implements FlowableSubscriber<T>, Subscription {
        final Subscriber<? super R> actual;
        boolean done;
        final Function<? super T, ? extends R> mapper;
        Subscription s;

        ParallelMapSubscriber(Subscriber<? super R> subscriber, Function<? super T, ? extends R> function) {
            this.actual = subscriber;
            this.mapper = function;
        }

        public void cancel() {
            this.s.cancel();
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                this.actual.onComplete();
            }
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.done = true;
            this.actual.onError(th);
        }

        public void onNext(T t) {
            if (!this.done) {
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null value"));
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    cancel();
                    onError(th);
                }
            }
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

    public ParallelMap(ParallelFlowable<T> parallelFlowable, Function<? super T, ? extends R> function) {
        this.source = parallelFlowable;
        this.mapper = function;
    }

    public int parallelism() {
        return this.source.parallelism();
    }

    public void subscribe(Subscriber<? super R>[] subscriberArr) {
        if (validate(subscriberArr)) {
            int length = subscriberArr.length;
            Subscriber[] subscriberArr2 = new Subscriber[length];
            for (int i = 0; i < length; i++) {
                ConditionalSubscriber conditionalSubscriber = subscriberArr[i];
                if (conditionalSubscriber instanceof ConditionalSubscriber) {
                    subscriberArr2[i] = new ParallelMapConditionalSubscriber(conditionalSubscriber, this.mapper);
                } else {
                    subscriberArr2[i] = new ParallelMapSubscriber(conditionalSubscriber, this.mapper);
                }
            }
            this.source.subscribe(subscriberArr2);
        }
    }
}

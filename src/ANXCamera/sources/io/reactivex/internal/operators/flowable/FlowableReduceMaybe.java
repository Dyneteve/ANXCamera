package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.FuseToFlowable;
import io.reactivex.internal.fuseable.HasUpstreamPublisher;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscription;

public final class FlowableReduceMaybe<T> extends Maybe<T> implements FuseToFlowable<T>, HasUpstreamPublisher<T> {
    final BiFunction<T, T, T> reducer;
    final Flowable<T> source;

    static final class ReduceSubscriber<T> implements FlowableSubscriber<T>, Disposable {
        final MaybeObserver<? super T> actual;
        boolean done;
        final BiFunction<T, T, T> reducer;
        Subscription s;
        T value;

        ReduceSubscriber(MaybeObserver<? super T> maybeObserver, BiFunction<T, T, T> biFunction) {
            this.actual = maybeObserver;
            this.reducer = biFunction;
        }

        public void dispose() {
            this.s.cancel();
            this.done = true;
        }

        public boolean isDisposed() {
            return this.done;
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                T t = this.value;
                if (t != null) {
                    this.actual.onSuccess(t);
                } else {
                    this.actual.onComplete();
                }
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
                T t2 = this.value;
                if (t2 == null) {
                    this.value = t;
                } else {
                    try {
                        this.value = ObjectHelper.requireNonNull(this.reducer.apply(t2, t), "The reducer returned a null value");
                    } catch (Throwable th) {
                        Exceptions.throwIfFatal(th);
                        this.s.cancel();
                        onError(th);
                    }
                }
            }
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
                subscription.request(Long.MAX_VALUE);
            }
        }
    }

    public FlowableReduceMaybe(Flowable<T> flowable, BiFunction<T, T, T> biFunction) {
        this.source = flowable;
        this.reducer = biFunction;
    }

    public Flowable<T> fuseToFlowable() {
        return RxJavaPlugins.onAssembly((Flowable<T>) new FlowableReduce<T>(this.source, this.reducer));
    }

    public Publisher<T> source() {
        return this.source;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(MaybeObserver<? super T> maybeObserver) {
        this.source.subscribe((FlowableSubscriber<? super T>) new ReduceSubscriber<Object>(maybeObserver, this.reducer));
    }
}

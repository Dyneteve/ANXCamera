package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionArbiter;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableConcatMap<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final ErrorMode errorMode;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;
    final int prefetch;

    static abstract class BaseConcatMapSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, ConcatMapSupport<R>, Subscription {
        private static final long serialVersionUID = -3511336836796789179L;
        volatile boolean active;
        volatile boolean cancelled;
        int consumed;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        final ConcatMapInner<R> inner = new ConcatMapInner<>(this);
        final int limit;
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        final int prefetch;
        SimpleQueue<T> queue;
        Subscription s;
        int sourceMode;

        BaseConcatMapSubscriber(Function<? super T, ? extends Publisher<? extends R>> function, int i) {
            this.mapper = function;
            this.prefetch = i;
            this.limit = i - (i >> 2);
        }

        public abstract void drain();

        public final void innerComplete() {
            this.active = false;
            drain();
        }

        public final void onComplete() {
            this.done = true;
            drain();
        }

        public final void onNext(T t) {
            if (this.sourceMode == 2 || this.queue.offer(t)) {
                drain();
                return;
            }
            this.s.cancel();
            onError(new IllegalStateException("Queue full?!"));
        }

        public final void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(3);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        subscribeActual();
                        drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        subscribeActual();
                        subscription.request((long) this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                subscribeActual();
                subscription.request((long) this.prefetch);
            }
        }

        public abstract void subscribeActual();
    }

    static final class ConcatMapDelayed<T, R> extends BaseConcatMapSubscriber<T, R> {
        private static final long serialVersionUID = -2945777694260521066L;
        final Subscriber<? super R> actual;
        final boolean veryEnd;

        ConcatMapDelayed(Subscriber<? super R> subscriber, Function<? super T, ? extends Publisher<? extends R>> function, int i, boolean z) {
            super(function, i);
            this.actual = subscriber;
            this.veryEnd = z;
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.inner.cancel();
                this.s.cancel();
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            if (getAndIncrement() == 0) {
                while (!this.cancelled) {
                    if (!this.active) {
                        boolean z = this.done;
                        if (!z || this.veryEnd || ((Throwable) this.errors.get()) == null) {
                            try {
                                Object poll = this.queue.poll();
                                boolean z2 = poll == null;
                                if (z && z2) {
                                    Throwable terminate = this.errors.terminate();
                                    if (terminate != null) {
                                        this.actual.onError(terminate);
                                    } else {
                                        this.actual.onComplete();
                                    }
                                    return;
                                } else if (!z2) {
                                    try {
                                        Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.mapper.apply(poll), "The mapper returned a null Publisher");
                                        if (this.sourceMode != 1) {
                                            int i = this.consumed + 1;
                                            if (i == this.limit) {
                                                this.consumed = 0;
                                                this.s.request((long) i);
                                            } else {
                                                this.consumed = i;
                                            }
                                        }
                                        if (publisher instanceof Callable) {
                                            try {
                                                Object call = ((Callable) publisher).call();
                                                if (call != null) {
                                                    if (this.inner.isUnbounded()) {
                                                        this.actual.onNext(call);
                                                    } else {
                                                        this.active = true;
                                                        this.inner.setSubscription(new WeakScalarSubscription(call, this.inner));
                                                    }
                                                }
                                            } catch (Throwable th) {
                                                Exceptions.throwIfFatal(th);
                                                this.s.cancel();
                                                this.errors.addThrowable(th);
                                                this.actual.onError(this.errors.terminate());
                                                return;
                                            }
                                        } else {
                                            this.active = true;
                                            publisher.subscribe(this.inner);
                                        }
                                    } catch (Throwable th2) {
                                        Exceptions.throwIfFatal(th2);
                                        this.s.cancel();
                                        this.errors.addThrowable(th2);
                                        this.actual.onError(this.errors.terminate());
                                        return;
                                    }
                                }
                            } catch (Throwable th3) {
                                Exceptions.throwIfFatal(th3);
                                this.s.cancel();
                                this.errors.addThrowable(th3);
                                this.actual.onError(this.errors.terminate());
                                return;
                            }
                        } else {
                            this.actual.onError(this.errors.terminate());
                            return;
                        }
                    }
                    if (decrementAndGet() == 0) {
                    }
                }
            }
        }

        public void innerError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                if (!this.veryEnd) {
                    this.s.cancel();
                    this.done = true;
                }
                this.active = false;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void innerNext(R r) {
            this.actual.onNext(r);
        }

        public void onError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void request(long j) {
            this.inner.request(j);
        }

        /* access modifiers changed from: 0000 */
        public void subscribeActual() {
            this.actual.onSubscribe(this);
        }
    }

    static final class ConcatMapImmediate<T, R> extends BaseConcatMapSubscriber<T, R> {
        private static final long serialVersionUID = 7898995095634264146L;
        final Subscriber<? super R> actual;
        final AtomicInteger wip = new AtomicInteger();

        ConcatMapImmediate(Subscriber<? super R> subscriber, Function<? super T, ? extends Publisher<? extends R>> function, int i) {
            super(function, i);
            this.actual = subscriber;
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.inner.cancel();
                this.s.cancel();
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            if (this.wip.getAndIncrement() == 0) {
                while (!this.cancelled) {
                    if (!this.active) {
                        boolean z = this.done;
                        try {
                            Object poll = this.queue.poll();
                            boolean z2 = poll == null;
                            if (z && z2) {
                                this.actual.onComplete();
                                return;
                            } else if (!z2) {
                                try {
                                    Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.mapper.apply(poll), "The mapper returned a null Publisher");
                                    if (this.sourceMode != 1) {
                                        int i = this.consumed + 1;
                                        if (i == this.limit) {
                                            this.consumed = 0;
                                            this.s.request((long) i);
                                        } else {
                                            this.consumed = i;
                                        }
                                    }
                                    if (publisher instanceof Callable) {
                                        try {
                                            Object call = ((Callable) publisher).call();
                                            if (call != null) {
                                                if (!this.inner.isUnbounded()) {
                                                    this.active = true;
                                                    this.inner.setSubscription(new WeakScalarSubscription(call, this.inner));
                                                } else if (get() == 0 && compareAndSet(0, 1)) {
                                                    this.actual.onNext(call);
                                                    if (!compareAndSet(1, 0)) {
                                                        this.actual.onError(this.errors.terminate());
                                                        return;
                                                    }
                                                }
                                            }
                                        } catch (Throwable th) {
                                            Exceptions.throwIfFatal(th);
                                            this.s.cancel();
                                            this.errors.addThrowable(th);
                                            this.actual.onError(this.errors.terminate());
                                            return;
                                        }
                                    } else {
                                        this.active = true;
                                        publisher.subscribe(this.inner);
                                    }
                                } catch (Throwable th2) {
                                    Exceptions.throwIfFatal(th2);
                                    this.s.cancel();
                                    this.errors.addThrowable(th2);
                                    this.actual.onError(this.errors.terminate());
                                    return;
                                }
                            }
                        } catch (Throwable th3) {
                            Exceptions.throwIfFatal(th3);
                            this.s.cancel();
                            this.errors.addThrowable(th3);
                            this.actual.onError(this.errors.terminate());
                            return;
                        }
                    }
                    if (this.wip.decrementAndGet() == 0) {
                    }
                }
            }
        }

        public void innerError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.actual.onError(this.errors.terminate());
                    return;
                }
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void innerNext(R r) {
            if (get() == 0 && compareAndSet(0, 1)) {
                this.actual.onNext(r);
                if (!compareAndSet(1, 0)) {
                    this.actual.onError(this.errors.terminate());
                }
            }
        }

        public void onError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.inner.cancel();
                if (getAndIncrement() == 0) {
                    this.actual.onError(this.errors.terminate());
                    return;
                }
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void request(long j) {
            this.inner.request(j);
        }

        /* access modifiers changed from: 0000 */
        public void subscribeActual() {
            this.actual.onSubscribe(this);
        }
    }

    static final class ConcatMapInner<R> extends SubscriptionArbiter implements FlowableSubscriber<R> {
        private static final long serialVersionUID = 897683679971470653L;
        final ConcatMapSupport<R> parent;
        long produced;

        ConcatMapInner(ConcatMapSupport<R> concatMapSupport) {
            this.parent = concatMapSupport;
        }

        public void onComplete() {
            long j = this.produced;
            if (j != 0) {
                this.produced = 0;
                produced(j);
            }
            this.parent.innerComplete();
        }

        public void onError(Throwable th) {
            long j = this.produced;
            if (j != 0) {
                this.produced = 0;
                produced(j);
            }
            this.parent.innerError(th);
        }

        public void onNext(R r) {
            this.produced++;
            this.parent.innerNext(r);
        }

        public void onSubscribe(Subscription subscription) {
            setSubscription(subscription);
        }
    }

    interface ConcatMapSupport<T> {
        void innerComplete();

        void innerError(Throwable th);

        void innerNext(T t);
    }

    static final class WeakScalarSubscription<T> implements Subscription {
        final Subscriber<? super T> actual;
        boolean once;
        final T value;

        WeakScalarSubscription(T t, Subscriber<? super T> subscriber) {
            this.value = t;
            this.actual = subscriber;
        }

        public void cancel() {
        }

        public void request(long j) {
            if (j > 0 && !this.once) {
                this.once = true;
                Subscriber<? super T> subscriber = this.actual;
                subscriber.onNext(this.value);
                subscriber.onComplete();
            }
        }
    }

    public FlowableConcatMap(Flowable<T> flowable, Function<? super T, ? extends Publisher<? extends R>> function, int i, ErrorMode errorMode2) {
        super(flowable);
        this.mapper = function;
        this.prefetch = i;
        this.errorMode = errorMode2;
    }

    public static <T, R> Subscriber<T> subscribe(Subscriber<? super R> subscriber, Function<? super T, ? extends Publisher<? extends R>> function, int i, ErrorMode errorMode2) {
        switch (errorMode2) {
            case BOUNDARY:
                return new ConcatMapDelayed(subscriber, function, i, false);
            case END:
                return new ConcatMapDelayed(subscriber, function, i, true);
            default:
                return new ConcatMapImmediate(subscriber, function, i);
        }
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super R> subscriber) {
        if (!FlowableScalarXMap.tryScalarXMapSubscribe(this.source, subscriber, this.mapper)) {
            this.source.subscribe(subscribe(subscriber, this.mapper, this.prefetch, this.errorMode));
        }
    }
}

package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscribers.InnerQueuedSubscriber;
import io.reactivex.internal.subscribers.InnerQueuedSubscriberSupport;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.ErrorMode;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableConcatMapEager<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final ErrorMode errorMode;
    final Function<? super T, ? extends Publisher<? extends R>> mapper;
    final int maxConcurrency;
    final int prefetch;

    static final class ConcatMapEagerDelayErrorSubscriber<T, R> extends AtomicInteger implements FlowableSubscriber<T>, InnerQueuedSubscriberSupport<R>, Subscription {
        private static final long serialVersionUID = -4255299542215038287L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        volatile InnerQueuedSubscriber<R> current;
        volatile boolean done;
        final ErrorMode errorMode;
        final AtomicThrowable errors = new AtomicThrowable();
        final Function<? super T, ? extends Publisher<? extends R>> mapper;
        final int maxConcurrency;
        final int prefetch;
        final AtomicLong requested = new AtomicLong();
        Subscription s;
        final SpscLinkedArrayQueue<InnerQueuedSubscriber<R>> subscribers;

        ConcatMapEagerDelayErrorSubscriber(Subscriber<? super R> subscriber, Function<? super T, ? extends Publisher<? extends R>> function, int i, int i2, ErrorMode errorMode2) {
            this.actual = subscriber;
            this.mapper = function;
            this.maxConcurrency = i;
            this.prefetch = i2;
            this.errorMode = errorMode2;
            this.subscribers = new SpscLinkedArrayQueue<>(Math.min(i2, i));
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.s.cancel();
                drainAndCancel();
            }
        }

        /* access modifiers changed from: 0000 */
        public void cancelAll() {
            while (true) {
                InnerQueuedSubscriber innerQueuedSubscriber = (InnerQueuedSubscriber) this.subscribers.poll();
                if (innerQueuedSubscriber != null) {
                    innerQueuedSubscriber.cancel();
                } else {
                    return;
                }
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:78:0x0139  */
        /* JADX WARNING: Removed duplicated region for block: B:79:0x013e  */
        public void drain() {
            InnerQueuedSubscriber<R> innerQueuedSubscriber;
            boolean z;
            int i;
            long j;
            int i2;
            if (getAndIncrement() == 0) {
                InnerQueuedSubscriber<R> innerQueuedSubscriber2 = this.current;
                Subscriber<? super R> subscriber = this.actual;
                ErrorMode errorMode2 = this.errorMode;
                int i3 = 1;
                while (true) {
                    long j2 = this.requested.get();
                    if (innerQueuedSubscriber2 != null) {
                        innerQueuedSubscriber = innerQueuedSubscriber2;
                    } else if (errorMode2 == ErrorMode.END || ((Throwable) this.errors.get()) == null) {
                        innerQueuedSubscriber = (InnerQueuedSubscriber) this.subscribers.poll();
                        if (this.done && innerQueuedSubscriber == null) {
                            Throwable terminate = this.errors.terminate();
                            if (terminate != null) {
                                subscriber.onError(terminate);
                            } else {
                                subscriber.onComplete();
                            }
                            return;
                        } else if (innerQueuedSubscriber != null) {
                            this.current = innerQueuedSubscriber;
                        }
                    } else {
                        cancelAll();
                        subscriber.onError(this.errors.terminate());
                        return;
                    }
                    if (innerQueuedSubscriber != null) {
                        SimpleQueue queue = innerQueuedSubscriber.queue();
                        if (queue != null) {
                            j = 0;
                            while (true) {
                                i2 = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                                i = i3;
                                if (i2 == 0) {
                                    break;
                                } else if (this.cancelled) {
                                    cancelAll();
                                    return;
                                } else if (errorMode2 != ErrorMode.IMMEDIATE || ((Throwable) this.errors.get()) == null) {
                                    boolean isDone = innerQueuedSubscriber.isDone();
                                    try {
                                        Object poll = queue.poll();
                                        boolean z2 = poll == null;
                                        if (isDone && z2) {
                                            this.current = null;
                                            this.s.request(1);
                                            innerQueuedSubscriber = null;
                                            z = true;
                                            break;
                                        } else if (z2) {
                                            break;
                                        } else {
                                            subscriber.onNext(poll);
                                            j++;
                                            innerQueuedSubscriber.requestOne();
                                            i3 = i;
                                        }
                                    } catch (Throwable th) {
                                        Throwable th2 = th;
                                        Exceptions.throwIfFatal(th2);
                                        this.current = null;
                                        innerQueuedSubscriber.cancel();
                                        cancelAll();
                                        subscriber.onError(th2);
                                        return;
                                    }
                                } else {
                                    this.current = null;
                                    innerQueuedSubscriber.cancel();
                                    cancelAll();
                                    subscriber.onError(this.errors.terminate());
                                    return;
                                }
                            }
                            z = false;
                            if (i2 == 0) {
                                if (this.cancelled) {
                                    cancelAll();
                                    return;
                                } else if (errorMode2 != ErrorMode.IMMEDIATE || ((Throwable) this.errors.get()) == null) {
                                    boolean isDone2 = innerQueuedSubscriber.isDone();
                                    boolean isEmpty = queue.isEmpty();
                                    if (isDone2 && isEmpty) {
                                        this.current = null;
                                        this.s.request(1);
                                        innerQueuedSubscriber2 = null;
                                        z = true;
                                        if (!(j == 0 || j2 == Long.MAX_VALUE)) {
                                            this.requested.addAndGet(-j);
                                        }
                                        if (z) {
                                            i3 = i;
                                        } else {
                                            i3 = addAndGet(-i);
                                            if (i3 == 0) {
                                                return;
                                            }
                                        }
                                    }
                                } else {
                                    this.current = null;
                                    innerQueuedSubscriber.cancel();
                                    cancelAll();
                                    subscriber.onError(this.errors.terminate());
                                    return;
                                }
                            }
                            innerQueuedSubscriber2 = innerQueuedSubscriber;
                            this.requested.addAndGet(-j);
                            if (z) {
                            }
                        }
                    }
                    i = i3;
                    innerQueuedSubscriber2 = innerQueuedSubscriber;
                    j = 0;
                    z = false;
                    this.requested.addAndGet(-j);
                    if (z) {
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drainAndCancel() {
            if (getAndIncrement() == 0) {
                do {
                    cancelAll();
                } while (decrementAndGet() != 0);
            }
        }

        public void innerComplete(InnerQueuedSubscriber<R> innerQueuedSubscriber) {
            innerQueuedSubscriber.setDone();
            drain();
        }

        public void innerError(InnerQueuedSubscriber<R> innerQueuedSubscriber, Throwable th) {
            if (this.errors.addThrowable(th)) {
                innerQueuedSubscriber.setDone();
                if (this.errorMode != ErrorMode.END) {
                    this.s.cancel();
                }
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void innerNext(InnerQueuedSubscriber<R> innerQueuedSubscriber, R r) {
            if (innerQueuedSubscriber.queue().offer(r)) {
                drain();
                return;
            }
            innerQueuedSubscriber.cancel();
            innerError(innerQueuedSubscriber, new MissingBackpressureException());
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        public void onError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onNext(T t) {
            try {
                Publisher publisher = (Publisher) ObjectHelper.requireNonNull(this.mapper.apply(t), "The mapper returned a null Publisher");
                InnerQueuedSubscriber innerQueuedSubscriber = new InnerQueuedSubscriber(this, this.prefetch);
                if (!this.cancelled) {
                    this.subscribers.offer(innerQueuedSubscriber);
                    if (!this.cancelled) {
                        publisher.subscribe(innerQueuedSubscriber);
                        if (this.cancelled) {
                            innerQueuedSubscriber.cancel();
                            drainAndCancel();
                        }
                    }
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                this.s.cancel();
                onError(th);
            }
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
                subscription.request(this.maxConcurrency == Integer.MAX_VALUE ? Long.MAX_VALUE : (long) this.maxConcurrency);
            }
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }
    }

    public FlowableConcatMapEager(Flowable<T> flowable, Function<? super T, ? extends Publisher<? extends R>> function, int i, int i2, ErrorMode errorMode2) {
        super(flowable);
        this.mapper = function;
        this.maxConcurrency = i;
        this.prefetch = i2;
        this.errorMode = errorMode2;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super R> subscriber) {
        Flowable flowable = this.source;
        ConcatMapEagerDelayErrorSubscriber concatMapEagerDelayErrorSubscriber = new ConcatMapEagerDelayErrorSubscriber(subscriber, this.mapper, this.maxConcurrency, this.prefetch, this.errorMode);
        flowable.subscribe((FlowableSubscriber<? super T>) concatMapEagerDelayErrorSubscriber);
    }
}

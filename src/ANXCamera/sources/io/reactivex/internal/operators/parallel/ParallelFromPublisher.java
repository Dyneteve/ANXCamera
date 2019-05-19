package io.reactivex.internal.operators.parallel;

import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLongArray;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelFromPublisher<T> extends ParallelFlowable<T> {
    final int parallelism;
    final int prefetch;
    final Publisher<? extends T> source;

    static final class ParallelDispatcher<T> extends AtomicInteger implements FlowableSubscriber<T> {
        private static final long serialVersionUID = -4470634016609963609L;
        volatile boolean cancelled;
        volatile boolean done;
        final long[] emissions;
        Throwable error;
        int index;
        final int limit;
        final int prefetch;
        int produced;
        SimpleQueue<T> queue;
        final AtomicLongArray requests;
        Subscription s;
        int sourceMode;
        final AtomicInteger subscriberCount = new AtomicInteger();
        final Subscriber<? super T>[] subscribers;

        final class RailSubscription implements Subscription {
            final int j;
            final int m;

            RailSubscription(int i, int i2) {
                this.j = i;
                this.m = i2;
            }

            public void cancel() {
                if (ParallelDispatcher.this.requests.compareAndSet(this.j + this.m, 0, 1)) {
                    ParallelDispatcher.this.cancel(this.m + this.m);
                }
            }

            public void request(long j2) {
                if (SubscriptionHelper.validate(j2)) {
                    AtomicLongArray atomicLongArray = ParallelDispatcher.this.requests;
                    while (true) {
                        long j3 = atomicLongArray.get(this.j);
                        if (j3 != Long.MAX_VALUE) {
                            if (atomicLongArray.compareAndSet(this.j, j3, BackpressureHelper.addCap(j3, j2))) {
                                if (ParallelDispatcher.this.subscriberCount.get() == this.m) {
                                    ParallelDispatcher.this.drain();
                                }
                            }
                        } else {
                            return;
                        }
                    }
                }
            }
        }

        ParallelDispatcher(Subscriber<? super T>[] subscriberArr, int i) {
            this.subscribers = subscriberArr;
            this.prefetch = i;
            this.limit = i - (i >> 2);
            int length = subscriberArr.length;
            int i2 = length + length;
            this.requests = new AtomicLongArray(i2 + 1);
            this.requests.lazySet(i2, (long) length);
            this.emissions = new long[length];
        }

        /* access modifiers changed from: 0000 */
        public void cancel(int i) {
            if (this.requests.decrementAndGet(i) == 0) {
                this.cancelled = true;
                this.s.cancel();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            if (getAndIncrement() == 0) {
                if (this.sourceMode == 1) {
                    drainSync();
                } else {
                    drainAsync();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drainAsync() {
            int i;
            SimpleQueue<T> simpleQueue = this.queue;
            Subscriber<? super T>[] subscriberArr = this.subscribers;
            AtomicLongArray atomicLongArray = this.requests;
            long[] jArr = this.emissions;
            int length = jArr.length;
            int i2 = this.index;
            int i3 = this.produced;
            int i4 = 1;
            while (true) {
                int i5 = 0;
                int i6 = i3;
                int i7 = 0;
                while (!this.cancelled) {
                    boolean z = this.done;
                    if (z) {
                        Throwable th = this.error;
                        if (th != null) {
                            simpleQueue.clear();
                            int length2 = subscriberArr.length;
                            while (i5 < length2) {
                                subscriberArr[i5].onError(th);
                                i5++;
                            }
                            return;
                        }
                    }
                    boolean isEmpty = simpleQueue.isEmpty();
                    if (!z || !isEmpty) {
                        if (!isEmpty) {
                            long j = atomicLongArray.get(i2);
                            long j2 = jArr[i2];
                            if (j == j2 || atomicLongArray.get(length + i2) != 0) {
                                i7++;
                            } else {
                                try {
                                    Object poll = simpleQueue.poll();
                                    if (poll != null) {
                                        subscriberArr[i2].onNext(poll);
                                        jArr[i2] = j2 + 1;
                                        int i8 = i6 + 1;
                                        if (i8 == this.limit) {
                                            this.s.request((long) i8);
                                            i8 = 0;
                                        }
                                        i6 = i8;
                                        i7 = 0;
                                    }
                                } catch (Throwable th2) {
                                    Throwable th3 = th2;
                                    Exceptions.throwIfFatal(th3);
                                    this.s.cancel();
                                    int length3 = subscriberArr.length;
                                    while (i < length3) {
                                        subscriberArr[i].onError(th3);
                                        i++;
                                    }
                                    return;
                                }
                            }
                            i2++;
                            if (i2 == length) {
                                i2 = 0;
                            }
                            if (i7 == length) {
                            }
                        }
                        i3 = i6;
                        int i9 = get();
                        if (i9 == i4) {
                            this.index = i2;
                            this.produced = i3;
                            i4 = addAndGet(-i4);
                            if (i4 == 0) {
                                return;
                            }
                        } else {
                            i4 = i9;
                        }
                    } else {
                        int length4 = subscriberArr.length;
                        while (i5 < length4) {
                            subscriberArr[i5].onComplete();
                            i5++;
                        }
                        return;
                    }
                }
                simpleQueue.clear();
                return;
            }
        }

        /* access modifiers changed from: 0000 */
        public void drainSync() {
            int i;
            int i2;
            SimpleQueue<T> simpleQueue = this.queue;
            Subscriber<? super T>[] subscriberArr = this.subscribers;
            AtomicLongArray atomicLongArray = this.requests;
            long[] jArr = this.emissions;
            int length = jArr.length;
            int i3 = this.index;
            int i4 = 1;
            while (true) {
                int i5 = 0;
                int i6 = 0;
                while (!this.cancelled) {
                    if (simpleQueue.isEmpty()) {
                        int length2 = subscriberArr.length;
                        while (i2 < length2) {
                            subscriberArr[i2].onComplete();
                            i2++;
                        }
                        return;
                    }
                    long j = atomicLongArray.get(i);
                    long j2 = jArr[i];
                    if (j == j2 || atomicLongArray.get(length + i) != 0) {
                        i6++;
                    } else {
                        try {
                            Object poll = simpleQueue.poll();
                            if (poll == null) {
                                int length3 = subscriberArr.length;
                                while (i5 < length3) {
                                    subscriberArr[i5].onComplete();
                                    i5++;
                                }
                                return;
                            }
                            subscriberArr[i].onNext(poll);
                            jArr[i] = j2 + 1;
                            i6 = 0;
                        } catch (Throwable th) {
                            Throwable th2 = th;
                            Exceptions.throwIfFatal(th2);
                            this.s.cancel();
                            int length4 = subscriberArr.length;
                            while (i5 < length4) {
                                subscriberArr[i5].onError(th2);
                                i5++;
                            }
                            return;
                        }
                    }
                    i++;
                    if (i == length) {
                        i = 0;
                    }
                    if (i6 == length) {
                        int i7 = get();
                        if (i7 == i4) {
                            this.index = i;
                            i4 = addAndGet(-i4);
                            if (i4 == 0) {
                                return;
                            }
                        } else {
                            i4 = i7;
                        }
                    }
                }
                simpleQueue.clear();
                return;
            }
        }

        public void onComplete() {
            this.done = true;
            drain();
        }

        public void onError(Throwable th) {
            this.error = th;
            this.done = true;
            drain();
        }

        public void onNext(T t) {
            if (this.sourceMode != 0 || this.queue.offer(t)) {
                drain();
                return;
            }
            this.s.cancel();
            onError(new MissingBackpressureException("Queue is full?"));
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(7);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        setupSubscribers();
                        drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        setupSubscribers();
                        subscription.request((long) this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                setupSubscribers();
                subscription.request((long) this.prefetch);
            }
        }

        /* access modifiers changed from: 0000 */
        public void setupSubscribers() {
            Subscriber<? super T>[] subscriberArr = this.subscribers;
            int length = subscriberArr.length;
            int i = 0;
            while (i < length && !this.cancelled) {
                int i2 = i + 1;
                this.subscriberCount.lazySet(i2);
                subscriberArr[i].onSubscribe(new RailSubscription(i, length));
                i = i2;
            }
        }
    }

    public ParallelFromPublisher(Publisher<? extends T> publisher, int i, int i2) {
        this.source = publisher;
        this.parallelism = i;
        this.prefetch = i2;
    }

    public int parallelism() {
        return this.parallelism;
    }

    public void subscribe(Subscriber<? super T>[] subscriberArr) {
        if (validate(subscriberArr)) {
            this.source.subscribe(new ParallelDispatcher(subscriberArr, this.prefetch));
        }
    }
}

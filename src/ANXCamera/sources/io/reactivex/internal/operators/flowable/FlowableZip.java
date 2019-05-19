package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.queue.SpscArrayQueue;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableZip<T, R> extends Flowable<R> {
    final int bufferSize;
    final boolean delayError;
    final Publisher<? extends T>[] sources;
    final Iterable<? extends Publisher<? extends T>> sourcesIterable;
    final Function<? super Object[], ? extends R> zipper;

    static final class ZipCoordinator<T, R> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = -2434867452883857743L;
        final Subscriber<? super R> actual;
        volatile boolean cancelled;
        final Object[] current;
        final boolean delayErrors;
        final AtomicThrowable errors;
        final AtomicLong requested;
        final ZipSubscriber<T, R>[] subscribers;
        final Function<? super Object[], ? extends R> zipper;

        ZipCoordinator(Subscriber<? super R> subscriber, Function<? super Object[], ? extends R> function, int i, int i2, boolean z) {
            this.actual = subscriber;
            this.zipper = function;
            this.delayErrors = z;
            ZipSubscriber<T, R>[] zipSubscriberArr = new ZipSubscriber[i];
            for (int i3 = 0; i3 < i; i3++) {
                zipSubscriberArr[i3] = new ZipSubscriber<>(this, i2);
            }
            this.current = new Object[i];
            this.subscribers = zipSubscriberArr;
            this.requested = new AtomicLong();
            this.errors = new AtomicThrowable();
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelAll();
            }
        }

        /* access modifiers changed from: 0000 */
        public void cancelAll() {
            for (ZipSubscriber<T, R> cancel : this.subscribers) {
                cancel.cancel();
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            int i;
            if (getAndIncrement() == 0) {
                Subscriber<? super R> subscriber = this.actual;
                ZipSubscriber<T, R>[] zipSubscriberArr = this.subscribers;
                int length = zipSubscriberArr.length;
                Object[] objArr = this.current;
                int i2 = 1;
                while (true) {
                    long j = this.requested.get();
                    long j2 = 0;
                    while (true) {
                        i = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                        if (i == 0) {
                            break;
                        } else if (!this.cancelled) {
                            if (this.delayErrors || this.errors.get() == null) {
                                boolean z = false;
                                for (int i3 = 0; i3 < length; i3++) {
                                    ZipSubscriber<T, R> zipSubscriber = zipSubscriberArr[i3];
                                    if (objArr[i3] == null) {
                                        try {
                                            boolean z2 = zipSubscriber.done;
                                            SimpleQueue<T> simpleQueue = zipSubscriber.queue;
                                            Object poll = simpleQueue != null ? simpleQueue.poll() : null;
                                            boolean z3 = poll == null;
                                            if (z2 && z3) {
                                                cancelAll();
                                                if (((Throwable) this.errors.get()) != null) {
                                                    subscriber.onError(this.errors.terminate());
                                                } else {
                                                    subscriber.onComplete();
                                                }
                                                return;
                                            } else if (!z3) {
                                                objArr[i3] = poll;
                                            } else {
                                                z = true;
                                            }
                                        } catch (Throwable th) {
                                            Exceptions.throwIfFatal(th);
                                            this.errors.addThrowable(th);
                                            if (!this.delayErrors) {
                                                cancelAll();
                                                subscriber.onError(this.errors.terminate());
                                                return;
                                            }
                                            z = true;
                                        }
                                    }
                                }
                                if (z) {
                                    break;
                                }
                                try {
                                    subscriber.onNext(ObjectHelper.requireNonNull(this.zipper.apply(objArr.clone()), "The zipper returned a null value"));
                                    j2++;
                                    Arrays.fill(objArr, null);
                                } catch (Throwable th2) {
                                    Exceptions.throwIfFatal(th2);
                                    cancelAll();
                                    this.errors.addThrowable(th2);
                                    subscriber.onError(this.errors.terminate());
                                    return;
                                }
                            } else {
                                cancelAll();
                                subscriber.onError(this.errors.terminate());
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                    if (i == 0) {
                        if (!this.cancelled) {
                            if (this.delayErrors || this.errors.get() == null) {
                                for (int i4 = 0; i4 < length; i4++) {
                                    ZipSubscriber<T, R> zipSubscriber2 = zipSubscriberArr[i4];
                                    if (objArr[i4] == null) {
                                        try {
                                            boolean z4 = zipSubscriber2.done;
                                            SimpleQueue<T> simpleQueue2 = zipSubscriber2.queue;
                                            Object poll2 = simpleQueue2 != null ? simpleQueue2.poll() : null;
                                            boolean z5 = poll2 == null;
                                            if (z4 && z5) {
                                                cancelAll();
                                                if (((Throwable) this.errors.get()) != null) {
                                                    subscriber.onError(this.errors.terminate());
                                                } else {
                                                    subscriber.onComplete();
                                                }
                                                return;
                                            } else if (!z5) {
                                                objArr[i4] = poll2;
                                            }
                                        } catch (Throwable th3) {
                                            Exceptions.throwIfFatal(th3);
                                            this.errors.addThrowable(th3);
                                            if (!this.delayErrors) {
                                                cancelAll();
                                                subscriber.onError(this.errors.terminate());
                                                return;
                                            }
                                        }
                                    }
                                }
                            } else {
                                cancelAll();
                                subscriber.onError(this.errors.terminate());
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                    if (j2 != 0) {
                        for (ZipSubscriber<T, R> request : zipSubscriberArr) {
                            request.request(j2);
                        }
                        if (j != Long.MAX_VALUE) {
                            this.requested.addAndGet(-j2);
                        }
                    }
                    i2 = addAndGet(-i2);
                    if (i2 == 0) {
                        return;
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void error(ZipSubscriber<T, R> zipSubscriber, Throwable th) {
            if (this.errors.addThrowable(th)) {
                zipSubscriber.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        /* access modifiers changed from: 0000 */
        public void subscribe(Publisher<? extends T>[] publisherArr, int i) {
            ZipSubscriber<T, R>[] zipSubscriberArr = this.subscribers;
            for (int i2 = 0; i2 < i && !this.cancelled && (this.delayErrors || this.errors.get() == null); i2++) {
                publisherArr[i2].subscribe(zipSubscriberArr[i2]);
            }
        }
    }

    static final class ZipSubscriber<T, R> extends AtomicReference<Subscription> implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = -4627193790118206028L;
        volatile boolean done;
        final int limit;
        final ZipCoordinator<T, R> parent;
        final int prefetch;
        long produced;
        SimpleQueue<T> queue;
        int sourceMode;

        ZipSubscriber(ZipCoordinator<T, R> zipCoordinator, int i) {
            this.parent = zipCoordinator;
            this.prefetch = i;
            this.limit = i - (i >> 2);
        }

        public void cancel() {
            SubscriptionHelper.cancel(this);
        }

        public void onComplete() {
            this.done = true;
            this.parent.drain();
        }

        public void onError(Throwable th) {
            this.parent.error(this, th);
        }

        public void onNext(T t) {
            if (this.sourceMode != 2) {
                this.queue.offer(t);
            }
            this.parent.drain();
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(7);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        this.parent.drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        subscription.request((long) this.prefetch);
                        return;
                    }
                }
                this.queue = new SpscArrayQueue(this.prefetch);
                subscription.request((long) this.prefetch);
            }
        }

        public void request(long j) {
            if (this.sourceMode != 1) {
                long j2 = this.produced + j;
                if (j2 >= ((long) this.limit)) {
                    this.produced = 0;
                    ((Subscription) get()).request(j2);
                    return;
                }
                this.produced = j2;
            }
        }
    }

    public FlowableZip(Publisher<? extends T>[] publisherArr, Iterable<? extends Publisher<? extends T>> iterable, Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.sources = publisherArr;
        this.sourcesIterable = iterable;
        this.zipper = function;
        this.bufferSize = i;
        this.delayError = z;
    }

    public void subscribeActual(Subscriber<? super R> subscriber) {
        Publisher<? extends T>[] publisherArr;
        int i;
        Publisher<? extends T>[] publisherArr2 = this.sources;
        if (publisherArr2 == null) {
            Publisher<? extends T>[] publisherArr3 = new Publisher[8];
            Publisher<? extends T>[] publisherArr4 = publisherArr3;
            i = 0;
            for (Publisher<? extends T> publisher : this.sourcesIterable) {
                if (i == publisherArr4.length) {
                    Publisher<? extends T>[] publisherArr5 = new Publisher[((i >> 2) + i)];
                    System.arraycopy(publisherArr4, 0, publisherArr5, 0, i);
                    publisherArr4 = publisherArr5;
                }
                int i2 = i + 1;
                publisherArr4[i] = publisher;
                i = i2;
            }
            publisherArr = publisherArr4;
        } else {
            publisherArr = publisherArr2;
            i = publisherArr2.length;
        }
        if (i == 0) {
            EmptySubscription.complete(subscriber);
            return;
        }
        ZipCoordinator zipCoordinator = new ZipCoordinator(subscriber, this.zipper, i, this.bufferSize, this.delayError);
        subscriber.onSubscribe(zipCoordinator);
        zipCoordinator.subscribe(publisherArr, i);
    }
}

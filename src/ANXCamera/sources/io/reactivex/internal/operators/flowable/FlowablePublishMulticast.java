package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.exceptions.MissingBackpressureException;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.QueueSubscription;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.QueueDrainHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Publisher;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowablePublishMulticast<T, R> extends AbstractFlowableWithUpstream<T, R> {
    final boolean delayError;
    final int prefetch;
    final Function<? super Flowable<T>, ? extends Publisher<? extends R>> selector;

    static final class MulticastProcessor<T> extends Flowable<T> implements FlowableSubscriber<T>, Disposable {
        static final MulticastSubscription[] EMPTY = new MulticastSubscription[0];
        static final MulticastSubscription[] TERMINATED = new MulticastSubscription[0];
        int consumed;
        final boolean delayError;
        volatile boolean done;
        Throwable error;
        final int limit;
        final int prefetch;
        volatile SimpleQueue<T> queue;
        final AtomicReference<Subscription> s = new AtomicReference<>();
        int sourceMode;
        final AtomicReference<MulticastSubscription<T>[]> subscribers = new AtomicReference<>(EMPTY);
        final AtomicInteger wip = new AtomicInteger();

        MulticastProcessor(int i, boolean z) {
            this.prefetch = i;
            this.limit = i - (i >> 2);
            this.delayError = z;
        }

        /* access modifiers changed from: 0000 */
        public boolean add(MulticastSubscription<T> multicastSubscription) {
            while (true) {
                MulticastSubscription[] multicastSubscriptionArr = (MulticastSubscription[]) this.subscribers.get();
                if (multicastSubscriptionArr == TERMINATED) {
                    return false;
                }
                int length = multicastSubscriptionArr.length;
                MulticastSubscription[] multicastSubscriptionArr2 = new MulticastSubscription[(length + 1)];
                System.arraycopy(multicastSubscriptionArr, 0, multicastSubscriptionArr2, 0, length);
                multicastSubscriptionArr2[length] = multicastSubscription;
                if (this.subscribers.compareAndSet(multicastSubscriptionArr, multicastSubscriptionArr2)) {
                    return true;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void completeAll() {
            MulticastSubscription[] multicastSubscriptionArr;
            for (MulticastSubscription multicastSubscription : (MulticastSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                if (multicastSubscription.get() != Long.MIN_VALUE) {
                    multicastSubscription.actual.onComplete();
                }
            }
        }

        public void dispose() {
            SubscriptionHelper.cancel(this.s);
            if (this.wip.getAndIncrement() == 0) {
                SimpleQueue<T> simpleQueue = this.queue;
                if (simpleQueue != null) {
                    simpleQueue.clear();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            long j;
            int i;
            if (this.wip.getAndIncrement() == 0) {
                SimpleQueue<T> simpleQueue = this.queue;
                int i2 = this.consumed;
                int i3 = this.limit;
                boolean z = this.sourceMode != 1;
                int i4 = i2;
                int i5 = 1;
                while (true) {
                    MulticastSubscription[] multicastSubscriptionArr = (MulticastSubscription[]) this.subscribers.get();
                    int length = multicastSubscriptionArr.length;
                    if (!(simpleQueue == null || length == 0)) {
                        int length2 = multicastSubscriptionArr.length;
                        long j2 = Long.MAX_VALUE;
                        int i6 = 0;
                        while (true) {
                            j = Long.MIN_VALUE;
                            if (i6 >= length2) {
                                break;
                            }
                            long j3 = multicastSubscriptionArr[i6].get();
                            if (j3 != Long.MIN_VALUE && j2 > j3) {
                                j2 = j3;
                            }
                            i6++;
                        }
                        long j4 = 0;
                        while (true) {
                            i = (j4 > j2 ? 1 : (j4 == j2 ? 0 : -1));
                            if (i == 0) {
                                break;
                            } else if (isDisposed()) {
                                simpleQueue.clear();
                                return;
                            } else {
                                boolean z2 = this.done;
                                if (z2 && !this.delayError) {
                                    Throwable th = this.error;
                                    if (th != null) {
                                        errorAll(th);
                                        return;
                                    }
                                }
                                try {
                                    Object poll = simpleQueue.poll();
                                    boolean z3 = poll == null;
                                    if (z2 && z3) {
                                        Throwable th2 = this.error;
                                        if (th2 != null) {
                                            errorAll(th2);
                                        } else {
                                            completeAll();
                                        }
                                        return;
                                    } else if (z3) {
                                        break;
                                    } else {
                                        int length3 = multicastSubscriptionArr.length;
                                        int i7 = 0;
                                        while (i7 < length3) {
                                            MulticastSubscription multicastSubscription = multicastSubscriptionArr[i7];
                                            if (multicastSubscription.get() != Long.MIN_VALUE) {
                                                multicastSubscription.actual.onNext(poll);
                                            }
                                            i7++;
                                            j = Long.MIN_VALUE;
                                        }
                                        long j5 = j;
                                        j4++;
                                        if (z) {
                                            int i8 = i4 + 1;
                                            if (i8 == i3) {
                                                ((Subscription) this.s.get()).request((long) i3);
                                                i4 = 0;
                                            } else {
                                                i4 = i8;
                                            }
                                        }
                                        j = j5;
                                    }
                                } catch (Throwable th3) {
                                    Throwable th4 = th3;
                                    Exceptions.throwIfFatal(th4);
                                    SubscriptionHelper.cancel(this.s);
                                    errorAll(th4);
                                    return;
                                }
                            }
                        }
                        if (i == 0) {
                            if (isDisposed()) {
                                simpleQueue.clear();
                                return;
                            }
                            boolean z4 = this.done;
                            if (z4 && !this.delayError) {
                                Throwable th5 = this.error;
                                if (th5 != null) {
                                    errorAll(th5);
                                    return;
                                }
                            }
                            if (z4 && simpleQueue.isEmpty()) {
                                Throwable th6 = this.error;
                                if (th6 != null) {
                                    errorAll(th6);
                                } else {
                                    completeAll();
                                }
                                return;
                            }
                        }
                        for (MulticastSubscription produced : multicastSubscriptionArr) {
                            BackpressureHelper.produced(produced, j4);
                        }
                    }
                    this.consumed = i4;
                    i5 = this.wip.addAndGet(-i5);
                    if (i5 != 0) {
                        if (simpleQueue == null) {
                            simpleQueue = this.queue;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void errorAll(Throwable th) {
            MulticastSubscription[] multicastSubscriptionArr;
            for (MulticastSubscription multicastSubscription : (MulticastSubscription[]) this.subscribers.getAndSet(TERMINATED)) {
                if (multicastSubscription.get() != Long.MIN_VALUE) {
                    multicastSubscription.actual.onError(th);
                }
            }
        }

        public boolean isDisposed() {
            return SubscriptionHelper.isCancelled((Subscription) this.s.get());
        }

        public void onComplete() {
            if (!this.done) {
                this.done = true;
                drain();
            }
        }

        public void onError(Throwable th) {
            if (this.done) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.error = th;
            this.done = true;
            drain();
        }

        public void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode != 0 || this.queue.offer(t)) {
                    drain();
                    return;
                }
                ((Subscription) this.s.get()).cancel();
                onError(new MissingBackpressureException());
            }
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this.s, subscription)) {
                if (subscription instanceof QueueSubscription) {
                    QueueSubscription queueSubscription = (QueueSubscription) subscription;
                    int requestFusion = queueSubscription.requestFusion(3);
                    if (requestFusion == 1) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        this.done = true;
                        drain();
                        return;
                    } else if (requestFusion == 2) {
                        this.sourceMode = requestFusion;
                        this.queue = queueSubscription;
                        QueueDrainHelper.request(subscription, this.prefetch);
                        return;
                    }
                }
                this.queue = QueueDrainHelper.createQueue(this.prefetch);
                QueueDrainHelper.request(subscription, this.prefetch);
            }
        }

        /* access modifiers changed from: 0000 */
        public void remove(MulticastSubscription<T> multicastSubscription) {
            MulticastSubscription[] multicastSubscriptionArr;
            while (true) {
                MulticastSubscription<T>[] multicastSubscriptionArr2 = (MulticastSubscription[]) this.subscribers.get();
                if (multicastSubscriptionArr2 != TERMINATED && multicastSubscriptionArr2 != EMPTY) {
                    int length = multicastSubscriptionArr2.length;
                    int i = -1;
                    int i2 = 0;
                    while (true) {
                        if (i2 >= length) {
                            break;
                        } else if (multicastSubscriptionArr2[i2] == multicastSubscription) {
                            i = i2;
                            break;
                        } else {
                            i2++;
                        }
                    }
                    if (i >= 0) {
                        if (length == 1) {
                            multicastSubscriptionArr = EMPTY;
                        } else {
                            MulticastSubscription[] multicastSubscriptionArr3 = new MulticastSubscription[(length - 1)];
                            System.arraycopy(multicastSubscriptionArr2, 0, multicastSubscriptionArr3, 0, i);
                            System.arraycopy(multicastSubscriptionArr2, i + 1, multicastSubscriptionArr3, i, (length - i) - 1);
                            multicastSubscriptionArr = multicastSubscriptionArr3;
                        }
                        if (this.subscribers.compareAndSet(multicastSubscriptionArr2, multicastSubscriptionArr)) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }

        /* access modifiers changed from: protected */
        public void subscribeActual(Subscriber<? super T> subscriber) {
            MulticastSubscription multicastSubscription = new MulticastSubscription(subscriber, this);
            subscriber.onSubscribe(multicastSubscription);
            if (!add(multicastSubscription)) {
                Throwable th = this.error;
                if (th != null) {
                    subscriber.onError(th);
                } else {
                    subscriber.onComplete();
                }
            } else if (multicastSubscription.isCancelled()) {
                remove(multicastSubscription);
            } else {
                drain();
            }
        }
    }

    static final class MulticastSubscription<T> extends AtomicLong implements Subscription {
        private static final long serialVersionUID = 8664815189257569791L;
        final Subscriber<? super T> actual;
        final MulticastProcessor<T> parent;

        MulticastSubscription(Subscriber<? super T> subscriber, MulticastProcessor<T> multicastProcessor) {
            this.actual = subscriber;
            this.parent = multicastProcessor;
        }

        public void cancel() {
            if (getAndSet(Long.MIN_VALUE) != Long.MIN_VALUE) {
                this.parent.remove(this);
                this.parent.drain();
            }
        }

        public boolean isCancelled() {
            return get() == Long.MIN_VALUE;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.addCancel(this, j);
                this.parent.drain();
            }
        }
    }

    static final class OutputCanceller<R> implements FlowableSubscriber<R>, Subscription {
        final Subscriber<? super R> actual;
        final MulticastProcessor<?> processor;
        Subscription s;

        OutputCanceller(Subscriber<? super R> subscriber, MulticastProcessor<?> multicastProcessor) {
            this.actual = subscriber;
            this.processor = multicastProcessor;
        }

        public void cancel() {
            this.s.cancel();
            this.processor.dispose();
        }

        public void onComplete() {
            this.actual.onComplete();
            this.processor.dispose();
        }

        public void onError(Throwable th) {
            this.actual.onError(th);
            this.processor.dispose();
        }

        public void onNext(R r) {
            this.actual.onNext(r);
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

    public FlowablePublishMulticast(Flowable<T> flowable, Function<? super Flowable<T>, ? extends Publisher<? extends R>> function, int i, boolean z) {
        super(flowable);
        this.selector = function;
        this.prefetch = i;
        this.delayError = z;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super R> subscriber) {
        MulticastProcessor multicastProcessor = new MulticastProcessor(this.prefetch, this.delayError);
        try {
            ((Publisher) ObjectHelper.requireNonNull(this.selector.apply(multicastProcessor), "selector returned a null Publisher")).subscribe(new OutputCanceller(subscriber, multicastProcessor));
            this.source.subscribe((FlowableSubscriber<? super T>) multicastProcessor);
        } catch (Throwable th) {
            Exceptions.throwIfFatal(th);
            EmptySubscription.error(th, subscriber);
        }
    }
}

package io.reactivex.processors;

import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.EmptySubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class UnicastProcessor<T> extends FlowableProcessor<T> {
    final AtomicReference<Subscriber<? super T>> actual;
    volatile boolean cancelled;
    final boolean delayError;
    volatile boolean done;
    boolean enableOperatorFusion;
    Throwable error;
    final AtomicReference<Runnable> onTerminate;
    final AtomicBoolean once;
    final SpscLinkedArrayQueue<T> queue;
    final AtomicLong requested;
    final BasicIntQueueSubscription<T> wip;

    final class UnicastQueueSubscription extends BasicIntQueueSubscription<T> {
        private static final long serialVersionUID = -4896760517184205454L;

        UnicastQueueSubscription() {
        }

        public void cancel() {
            if (!UnicastProcessor.this.cancelled) {
                UnicastProcessor.this.cancelled = true;
                UnicastProcessor.this.doTerminate();
                if (!UnicastProcessor.this.enableOperatorFusion && UnicastProcessor.this.wip.getAndIncrement() == 0) {
                    UnicastProcessor.this.queue.clear();
                    UnicastProcessor.this.actual.lazySet(null);
                }
            }
        }

        public void clear() {
            UnicastProcessor.this.queue.clear();
        }

        public boolean isEmpty() {
            return UnicastProcessor.this.queue.isEmpty();
        }

        @Nullable
        public T poll() {
            return UnicastProcessor.this.queue.poll();
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(UnicastProcessor.this.requested, j);
                UnicastProcessor.this.drain();
            }
        }

        public int requestFusion(int i) {
            if ((i & 2) == 0) {
                return 0;
            }
            UnicastProcessor.this.enableOperatorFusion = true;
            return 2;
        }
    }

    UnicastProcessor(int i) {
        this(i, null, true);
    }

    UnicastProcessor(int i, Runnable runnable) {
        this(i, runnable, true);
    }

    UnicastProcessor(int i, Runnable runnable, boolean z) {
        this.queue = new SpscLinkedArrayQueue<>(ObjectHelper.verifyPositive(i, "capacityHint"));
        this.onTerminate = new AtomicReference<>(runnable);
        this.delayError = z;
        this.actual = new AtomicReference<>();
        this.once = new AtomicBoolean();
        this.wip = new UnicastQueueSubscription();
        this.requested = new AtomicLong();
    }

    @CheckReturnValue
    public static <T> UnicastProcessor<T> create() {
        return new UnicastProcessor<>(bufferSize());
    }

    @CheckReturnValue
    public static <T> UnicastProcessor<T> create(int i) {
        return new UnicastProcessor<>(i);
    }

    @CheckReturnValue
    public static <T> UnicastProcessor<T> create(int i, Runnable runnable) {
        ObjectHelper.requireNonNull(runnable, "onTerminate");
        return new UnicastProcessor<>(i, runnable);
    }

    @CheckReturnValue
    @Experimental
    public static <T> UnicastProcessor<T> create(int i, Runnable runnable, boolean z) {
        ObjectHelper.requireNonNull(runnable, "onTerminate");
        return new UnicastProcessor<>(i, runnable, z);
    }

    @CheckReturnValue
    @Experimental
    public static <T> UnicastProcessor<T> create(boolean z) {
        return new UnicastProcessor<>(bufferSize(), null, z);
    }

    /* access modifiers changed from: 0000 */
    public boolean checkTerminated(boolean z, boolean z2, boolean z3, Subscriber<? super T> subscriber, SpscLinkedArrayQueue<T> spscLinkedArrayQueue) {
        if (this.cancelled) {
            spscLinkedArrayQueue.clear();
            this.actual.lazySet(null);
            return true;
        }
        if (z2) {
            if (z && this.error != null) {
                spscLinkedArrayQueue.clear();
                this.actual.lazySet(null);
                subscriber.onError(this.error);
                return true;
            } else if (z3) {
                Throwable th = this.error;
                this.actual.lazySet(null);
                if (th != null) {
                    subscriber.onError(th);
                } else {
                    subscriber.onComplete();
                }
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public void doTerminate() {
        Runnable runnable = (Runnable) this.onTerminate.get();
        if (runnable != null && this.onTerminate.compareAndSet(runnable, null)) {
            runnable.run();
        }
    }

    /* access modifiers changed from: 0000 */
    public void drain() {
        if (this.wip.getAndIncrement() == 0) {
            int i = 1;
            Subscriber subscriber = (Subscriber) this.actual.get();
            while (subscriber == null) {
                i = this.wip.addAndGet(-i);
                if (i != 0) {
                    subscriber = (Subscriber) this.actual.get();
                } else {
                    return;
                }
            }
            if (this.enableOperatorFusion) {
                drainFused(subscriber);
            } else {
                drainRegular(subscriber);
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void drainFused(Subscriber<? super T> subscriber) {
        SpscLinkedArrayQueue<T> spscLinkedArrayQueue = this.queue;
        int i = 1;
        boolean z = !this.delayError;
        while (!this.cancelled) {
            boolean z2 = this.done;
            if (!z || !z2 || this.error == null) {
                subscriber.onNext(null);
                if (z2) {
                    this.actual.lazySet(null);
                    Throwable th = this.error;
                    if (th != null) {
                        subscriber.onError(th);
                    } else {
                        subscriber.onComplete();
                    }
                    return;
                }
                i = this.wip.addAndGet(-i);
                if (i == 0) {
                    return;
                }
            } else {
                spscLinkedArrayQueue.clear();
                this.actual.lazySet(null);
                subscriber.onError(this.error);
                return;
            }
        }
        spscLinkedArrayQueue.clear();
        this.actual.lazySet(null);
    }

    /* access modifiers changed from: 0000 */
    public void drainRegular(Subscriber<? super T> subscriber) {
        int i;
        long j;
        SpscLinkedArrayQueue<T> spscLinkedArrayQueue = this.queue;
        boolean z = true;
        boolean z2 = !this.delayError;
        int i2 = 1;
        while (true) {
            long j2 = this.requested.get();
            long j3 = 0;
            while (true) {
                i = (j2 > j3 ? 1 : (j2 == j3 ? 0 : -1));
                if (i == 0) {
                    j = j3;
                    break;
                }
                boolean z3 = this.done;
                Object poll = spscLinkedArrayQueue.poll();
                boolean z4 = poll == null ? z : false;
                Object obj = poll;
                j = j3;
                if (!checkTerminated(z2, z3, z4, subscriber, spscLinkedArrayQueue)) {
                    if (z4) {
                        break;
                    }
                    subscriber.onNext(obj);
                    j3 = 1 + j;
                    z = true;
                } else {
                    return;
                }
            }
            Subscriber<? super T> subscriber2 = subscriber;
            if (i == 0) {
                if (checkTerminated(z2, this.done, spscLinkedArrayQueue.isEmpty(), subscriber2, spscLinkedArrayQueue)) {
                    return;
                }
            }
            if (!(j == 0 || j2 == Long.MAX_VALUE)) {
                this.requested.addAndGet(-j);
            }
            i2 = this.wip.addAndGet(-i2);
            if (i2 != 0) {
                z = true;
            } else {
                return;
            }
        }
    }

    public Throwable getThrowable() {
        if (this.done) {
            return this.error;
        }
        return null;
    }

    public boolean hasComplete() {
        return this.done && this.error == null;
    }

    public boolean hasSubscribers() {
        return this.actual.get() != null;
    }

    public boolean hasThrowable() {
        return this.done && this.error != null;
    }

    public void onComplete() {
        if (!this.done && !this.cancelled) {
            this.done = true;
            doTerminate();
            drain();
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.done || this.cancelled) {
            RxJavaPlugins.onError(th);
            return;
        }
        this.error = th;
        this.done = true;
        doTerminate();
        drain();
    }

    public void onNext(T t) {
        ObjectHelper.requireNonNull(t, "onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (!this.done && !this.cancelled) {
            this.queue.offer(t);
            drain();
        }
    }

    public void onSubscribe(Subscription subscription) {
        if (this.done || this.cancelled) {
            subscription.cancel();
        } else {
            subscription.request(Long.MAX_VALUE);
        }
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super T> subscriber) {
        if (this.once.get() || !this.once.compareAndSet(false, true)) {
            EmptySubscription.error(new IllegalStateException("This processor allows only a single Subscriber"), subscriber);
            return;
        }
        subscriber.onSubscribe(this.wip);
        this.actual.set(subscriber);
        if (this.cancelled) {
            this.actual.lazySet(null);
        } else {
            drain();
        }
    }
}

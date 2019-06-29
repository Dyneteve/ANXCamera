package io.reactivex.internal.operators.parallel;

import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.parallel.ParallelFailureHandling;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelFilterTry<T> extends ParallelFlowable<T> {
    final BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> errorHandler;
    final Predicate<? super T> predicate;
    final ParallelFlowable<T> source;

    static abstract class BaseFilterSubscriber<T> implements ConditionalSubscriber<T>, Subscription {
        boolean done;
        final BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> errorHandler;
        final Predicate<? super T> predicate;
        Subscription s;

        BaseFilterSubscriber(Predicate<? super T> predicate2, BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> biFunction) {
            this.predicate = predicate2;
            this.errorHandler = biFunction;
        }

        public final void cancel() {
            this.s.cancel();
        }

        public final void onNext(T t) {
            if (!tryOnNext(t) && !this.done) {
                this.s.request(1);
            }
        }

        public final void request(long j) {
            this.s.request(j);
        }
    }

    static final class ParallelFilterConditionalSubscriber<T> extends BaseFilterSubscriber<T> {
        final ConditionalSubscriber<? super T> actual;

        ParallelFilterConditionalSubscriber(ConditionalSubscriber<? super T> conditionalSubscriber, Predicate<? super T> predicate, BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> biFunction) {
            super(predicate, biFunction);
            this.actual = conditionalSubscriber;
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

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:3:0x0007 A[LOOP:0: B:3:0x0007->B:16:0x003e, LOOP_START, PHI: r2 
  PHI: (r2v1 long) = (r2v0 long), (r2v3 long) binds: [B:2:0x0005, B:16:0x003e] A[DONT_GENERATE, DONT_INLINE]] */
        public boolean tryOnNext(T t) {
            if (this.done) {
                return false;
            }
            long j = 0;
            while (true) {
                boolean z = true;
                try {
                    if (!this.predicate.test(t) || !this.actual.tryOnNext(t)) {
                        z = false;
                    }
                    return z;
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    cancel();
                    onError(new CompositeException(th, th));
                    return false;
                }
            }
            cancel();
            onError(th);
            return false;
        }
    }

    static final class ParallelFilterSubscriber<T> extends BaseFilterSubscriber<T> {
        final Subscriber<? super T> actual;

        ParallelFilterSubscriber(Subscriber<? super T> subscriber, Predicate<? super T> predicate, BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> biFunction) {
            super(predicate, biFunction);
            this.actual = subscriber;
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

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.validate(this.s, subscription)) {
                this.s = subscription;
                this.actual.onSubscribe(this);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:3:0x0007 A[LOOP:0: B:3:0x0007->B:15:0x003a, LOOP_START, PHI: r2 
  PHI: (r2v1 long) = (r2v0 long), (r2v3 long) binds: [B:2:0x0005, B:15:0x003a] A[DONT_GENERATE, DONT_INLINE]] */
        public boolean tryOnNext(T t) {
            if (this.done) {
                return false;
            }
            long j = 0;
            while (true) {
                try {
                    if (!this.predicate.test(t)) {
                        return false;
                    }
                    this.actual.onNext(t);
                    return true;
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    cancel();
                    onError(new CompositeException(th, th));
                    return false;
                }
            }
            cancel();
            onError(th);
            return false;
        }
    }

    public ParallelFilterTry(ParallelFlowable<T> parallelFlowable, Predicate<? super T> predicate2, BiFunction<? super Long, ? super Throwable, ParallelFailureHandling> biFunction) {
        this.source = parallelFlowable;
        this.predicate = predicate2;
        this.errorHandler = biFunction;
    }

    public int parallelism() {
        return this.source.parallelism();
    }

    public void subscribe(Subscriber<? super T>[] subscriberArr) {
        if (validate(subscriberArr)) {
            int length = subscriberArr.length;
            Subscriber[] subscriberArr2 = new Subscriber[length];
            for (int i = 0; i < length; i++) {
                ConditionalSubscriber conditionalSubscriber = subscriberArr[i];
                if (conditionalSubscriber instanceof ConditionalSubscriber) {
                    subscriberArr2[i] = new ParallelFilterConditionalSubscriber(conditionalSubscriber, this.predicate, this.errorHandler);
                } else {
                    subscriberArr2[i] = new ParallelFilterSubscriber(conditionalSubscriber, this.predicate, this.errorHandler);
                }
            }
            this.source.subscribe(subscriberArr2);
        }
    }
}

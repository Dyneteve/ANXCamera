package io.reactivex.internal.subscribers;

import io.reactivex.FlowableSubscriber;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import java.util.concurrent.atomic.AtomicLong;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public abstract class SinglePostCompleteSubscriber<T, R> extends AtomicLong implements FlowableSubscriber<T>, Subscription {
    static final long COMPLETE_MASK = Long.MIN_VALUE;
    static final long REQUEST_MASK = Long.MAX_VALUE;
    private static final long serialVersionUID = 7917814472626990048L;
    protected final Subscriber<? super R> actual;
    protected long produced;
    protected Subscription s;
    protected R value;

    public SinglePostCompleteSubscriber(Subscriber<? super R> subscriber) {
        this.actual = subscriber;
    }

    public void cancel() {
        this.s.cancel();
    }

    /* access modifiers changed from: protected */
    public final void complete(R r) {
        long j = this.produced;
        if (j != 0) {
            BackpressureHelper.produced(this, j);
        }
        while (true) {
            long j2 = get();
            if ((j2 & COMPLETE_MASK) != 0) {
                onDrop(r);
                return;
            } else if ((j2 & REQUEST_MASK) != 0) {
                lazySet(-9223372036854775807L);
                this.actual.onNext(r);
                this.actual.onComplete();
                return;
            } else {
                this.value = r;
                if (!compareAndSet(0, COMPLETE_MASK)) {
                    this.value = null;
                } else {
                    return;
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onDrop(R r) {
    }

    public void onSubscribe(Subscription subscription) {
        if (SubscriptionHelper.validate(this.s, subscription)) {
            this.s = subscription;
            this.actual.onSubscribe(this);
        }
    }

    public final void request(long j) {
        long j2;
        if (SubscriptionHelper.validate(j)) {
            do {
                j2 = get();
                if ((j2 & COMPLETE_MASK) != 0) {
                    if (compareAndSet(COMPLETE_MASK, -9223372036854775807L)) {
                        this.actual.onNext(this.value);
                        this.actual.onComplete();
                        return;
                    }
                    return;
                }
            } while (!compareAndSet(j2, BackpressureHelper.addCap(j2, j)));
            this.s.request(j);
        }
    }
}

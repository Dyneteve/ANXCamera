package io.reactivex.internal.operators.parallel;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.parallel.ParallelFlowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class ParallelSortedJoin<T> extends Flowable<T> {
    final Comparator<? super T> comparator;
    final ParallelFlowable<List<T>> source;

    static final class SortedJoinInnerSubscriber<T> extends AtomicReference<Subscription> implements FlowableSubscriber<List<T>> {
        private static final long serialVersionUID = 6751017204873808094L;
        final int index;
        final SortedJoinSubscription<T> parent;

        SortedJoinInnerSubscriber(SortedJoinSubscription<T> sortedJoinSubscription, int i) {
            this.parent = sortedJoinSubscription;
            this.index = i;
        }

        /* access modifiers changed from: 0000 */
        public void cancel() {
            SubscriptionHelper.cancel(this);
        }

        public void onComplete() {
        }

        public void onError(Throwable th) {
            this.parent.innerError(th);
        }

        public void onNext(List<T> list) {
            this.parent.innerNext(list, this.index);
        }

        public void onSubscribe(Subscription subscription) {
            if (SubscriptionHelper.setOnce(this, subscription)) {
                subscription.request(Long.MAX_VALUE);
            }
        }
    }

    static final class SortedJoinSubscription<T> extends AtomicInteger implements Subscription {
        private static final long serialVersionUID = 3481980673745556697L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        final Comparator<? super T> comparator;
        final AtomicReference<Throwable> error = new AtomicReference<>();
        final int[] indexes;
        final List<T>[] lists;
        final AtomicInteger remaining = new AtomicInteger();
        final AtomicLong requested = new AtomicLong();
        final SortedJoinInnerSubscriber<T>[] subscribers;

        SortedJoinSubscription(Subscriber<? super T> subscriber, int i, Comparator<? super T> comparator2) {
            this.actual = subscriber;
            this.comparator = comparator2;
            SortedJoinInnerSubscriber<T>[] sortedJoinInnerSubscriberArr = new SortedJoinInnerSubscriber[i];
            for (int i2 = 0; i2 < i; i2++) {
                sortedJoinInnerSubscriberArr[i2] = new SortedJoinInnerSubscriber<>(this, i2);
            }
            this.subscribers = sortedJoinInnerSubscriberArr;
            this.lists = new List[i];
            this.indexes = new int[i];
            this.remaining.lazySet(i);
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelAll();
                if (getAndIncrement() == 0) {
                    Arrays.fill(this.lists, null);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void cancelAll() {
            for (SortedJoinInnerSubscriber<T> cancel : this.subscribers) {
                cancel.cancel();
            }
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:41:0x00a9, code lost:
            if (r13 != 0) goto L_0x00e8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:43:0x00ad, code lost:
            if (r1.cancelled == false) goto L_0x00b3;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:44:0x00af, code lost:
            java.util.Arrays.fill(r3, null);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:45:0x00b2, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:46:0x00b3, code lost:
            r5 = (java.lang.Throwable) r1.error.get();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:47:0x00bb, code lost:
            if (r5 == null) goto L_0x00c7;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:48:0x00bd, code lost:
            cancelAll();
            java.util.Arrays.fill(r3, null);
            r2.onError(r5);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:49:0x00c6, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:50:0x00c7, code lost:
            r5 = 0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:51:0x00c9, code lost:
            if (r5 >= r4) goto L_0x00dd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:53:0x00d3, code lost:
            if (r0[r5] == r3[r5].size()) goto L_0x00da;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:54:0x00d5, code lost:
            r16 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:55:0x00da, code lost:
            r5 = r5 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:56:0x00dd, code lost:
            r16 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:57:0x00df, code lost:
            if (r16 == false) goto L_0x00e8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:58:0x00e1, code lost:
            java.util.Arrays.fill(r3, null);
            r2.onComplete();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:59:0x00e7, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:61:0x00ec, code lost:
            if (r11 == 0) goto L_0x00fd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:63:0x00f5, code lost:
            if (r7 == Long.MAX_VALUE) goto L_0x00fd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:64:0x00f7, code lost:
            r1.requested.addAndGet(-r11);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:65:0x00fd, code lost:
            r5 = get();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:66:0x0101, code lost:
            if (r5 != r6) goto L_0x010c;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:67:0x0103, code lost:
            r5 = addAndGet(-r6);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:68:0x0108, code lost:
            if (r5 != 0) goto L_0x010c;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:69:0x010b, code lost:
            return;
         */
        public void drain() {
            int i;
            Object obj;
            if (getAndIncrement() == 0) {
                Subscriber<? super T> subscriber = this.actual;
                List<T>[] listArr = this.lists;
                int[] iArr = this.indexes;
                int length = iArr.length;
                int i2 = 1;
                while (true) {
                    long j = this.requested.get();
                    long j2 = 0;
                    while (true) {
                        int i3 = (j2 > j ? 1 : (j2 == j ? 0 : -1));
                        if (i3 == 0) {
                            break;
                        } else if (this.cancelled) {
                            Arrays.fill(listArr, null);
                            return;
                        } else {
                            Throwable th = (Throwable) this.error.get();
                            if (th != null) {
                                cancelAll();
                                Arrays.fill(listArr, null);
                                subscriber.onError(th);
                                return;
                            }
                            int i4 = -1;
                            Object obj2 = null;
                            for (int i5 = 0; i5 < length; i5++) {
                                List<T> list = listArr[i5];
                                int i6 = iArr[i5];
                                if (list.size() != i6) {
                                    if (obj2 == null) {
                                        obj = list.get(i6);
                                    } else {
                                        obj = list.get(i6);
                                        try {
                                            if (!(this.comparator.compare(obj2, obj) > 0)) {
                                            }
                                        } catch (Throwable th2) {
                                            Exceptions.throwIfFatal(th2);
                                            cancelAll();
                                            Arrays.fill(listArr, null);
                                            if (!this.error.compareAndSet(null, th2)) {
                                                RxJavaPlugins.onError(th2);
                                            }
                                            subscriber.onError((Throwable) this.error.get());
                                            return;
                                        }
                                    }
                                    obj2 = obj;
                                    i4 = i5;
                                }
                            }
                            if (obj2 == null) {
                                Arrays.fill(listArr, null);
                                subscriber.onComplete();
                                return;
                            }
                            subscriber.onNext(obj2);
                            iArr[i4] = iArr[i4] + 1;
                            j2++;
                        }
                    }
                    i2 = i;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void innerError(Throwable th) {
            if (this.error.compareAndSet(null, th)) {
                drain();
            } else if (th != this.error.get()) {
                RxJavaPlugins.onError(th);
            }
        }

        /* access modifiers changed from: 0000 */
        public void innerNext(List<T> list, int i) {
            this.lists[i] = list;
            if (this.remaining.decrementAndGet() == 0) {
                drain();
            }
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                if (this.remaining.get() == 0) {
                    drain();
                }
            }
        }
    }

    public ParallelSortedJoin(ParallelFlowable<List<T>> parallelFlowable, Comparator<? super T> comparator2) {
        this.source = parallelFlowable;
        this.comparator = comparator2;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super T> subscriber) {
        SortedJoinSubscription sortedJoinSubscription = new SortedJoinSubscription(subscriber, this.source.parallelism(), this.comparator);
        subscriber.onSubscribe(sortedJoinSubscription);
        this.source.subscribe(sortedJoinSubscription.subscribers);
    }
}

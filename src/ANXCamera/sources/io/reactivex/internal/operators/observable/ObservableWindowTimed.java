package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.Scheduler.Worker;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.observers.QueueDrainObserver;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.observers.SerializedObserver;
import io.reactivex.subjects.UnicastSubject;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableWindowTimed<T> extends AbstractObservableWithUpstream<T, Observable<T>> {
    final int bufferSize;
    final long maxSize;
    final boolean restartTimerOnMaxSize;
    final Scheduler scheduler;
    final long timeskip;
    final long timespan;
    final TimeUnit unit;

    static final class WindowExactBoundedObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Disposable {
        final int bufferSize;
        long count;
        final long maxSize;
        long producerIndex;
        final boolean restartTimerOnMaxSize;
        Disposable s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final AtomicReference<Disposable> timer = new AtomicReference<>();
        final long timespan;
        final TimeUnit unit;
        UnicastSubject<T> window;
        final Worker worker;

        static final class ConsumerIndexHolder implements Runnable {
            final long index;
            final WindowExactBoundedObserver<?> parent;

            ConsumerIndexHolder(long j, WindowExactBoundedObserver<?> windowExactBoundedObserver) {
                this.index = j;
                this.parent = windowExactBoundedObserver;
            }

            public void run() {
                WindowExactBoundedObserver<?> windowExactBoundedObserver = this.parent;
                if (!windowExactBoundedObserver.cancelled) {
                    windowExactBoundedObserver.queue.offer(this);
                } else {
                    windowExactBoundedObserver.terminated = true;
                    windowExactBoundedObserver.disposeTimer();
                }
                if (windowExactBoundedObserver.enter()) {
                    windowExactBoundedObserver.drainLoop();
                }
            }
        }

        WindowExactBoundedObserver(Observer<? super Observable<T>> observer, long j, TimeUnit timeUnit, Scheduler scheduler2, int i, long j2, boolean z) {
            super(observer, new MpscLinkedQueue());
            this.timespan = j;
            this.unit = timeUnit;
            this.scheduler = scheduler2;
            this.bufferSize = i;
            this.maxSize = j2;
            this.restartTimerOnMaxSize = z;
            if (z) {
                this.worker = scheduler2.createWorker();
            } else {
                this.worker = null;
            }
        }

        public void dispose() {
            this.cancelled = true;
        }

        /* access modifiers changed from: 0000 */
        public void disposeTimer() {
            DisposableHelper.dispose(this.timer);
            Worker worker2 = this.worker;
            if (worker2 != null) {
                worker2.dispose();
            }
        }

        /* access modifiers changed from: 0000 */
        public void drainLoop() {
            MpscLinkedQueue mpscLinkedQueue = (MpscLinkedQueue) this.queue;
            Observer observer = this.actual;
            UnicastSubject<T> unicastSubject = this.window;
            int i = 1;
            while (!this.terminated) {
                boolean z = this.done;
                Object poll = mpscLinkedQueue.poll();
                boolean z2 = poll == null;
                boolean z3 = poll instanceof ConsumerIndexHolder;
                if (z && (z2 || z3)) {
                    this.window = null;
                    mpscLinkedQueue.clear();
                    disposeTimer();
                    Throwable th = this.error;
                    if (th != null) {
                        unicastSubject.onError(th);
                    } else {
                        unicastSubject.onComplete();
                    }
                    return;
                } else if (z2) {
                    i = leave(-i);
                    if (i == 0) {
                        return;
                    }
                } else if (z3) {
                    ConsumerIndexHolder consumerIndexHolder = (ConsumerIndexHolder) poll;
                    if (this.restartTimerOnMaxSize || this.producerIndex == consumerIndexHolder.index) {
                        unicastSubject.onComplete();
                        this.count = 0;
                        unicastSubject = UnicastSubject.create(this.bufferSize);
                        this.window = unicastSubject;
                        observer.onNext(unicastSubject);
                    }
                } else {
                    unicastSubject.onNext(NotificationLite.getValue(poll));
                    long j = this.count + 1;
                    if (j >= this.maxSize) {
                        this.producerIndex++;
                        this.count = 0;
                        unicastSubject.onComplete();
                        unicastSubject = UnicastSubject.create(this.bufferSize);
                        this.window = unicastSubject;
                        this.actual.onNext(unicastSubject);
                        if (this.restartTimerOnMaxSize) {
                            Disposable disposable = (Disposable) this.timer.get();
                            disposable.dispose();
                            Disposable schedulePeriodically = this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit);
                            if (!this.timer.compareAndSet(disposable, schedulePeriodically)) {
                                schedulePeriodically.dispose();
                            }
                        }
                    } else {
                        this.count = j;
                    }
                }
            }
            this.s.dispose();
            mpscLinkedQueue.clear();
            disposeTimer();
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            disposeTimer();
        }

        public void onError(Throwable th) {
            this.error = th;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(th);
            disposeTimer();
        }

        public void onNext(T t) {
            if (!this.terminated) {
                if (fastEnter()) {
                    UnicastSubject<T> unicastSubject = this.window;
                    unicastSubject.onNext(t);
                    long j = this.count + 1;
                    if (j >= this.maxSize) {
                        this.producerIndex++;
                        this.count = 0;
                        unicastSubject.onComplete();
                        UnicastSubject<T> create = UnicastSubject.create(this.bufferSize);
                        this.window = create;
                        this.actual.onNext(create);
                        if (this.restartTimerOnMaxSize) {
                            ((Disposable) this.timer.get()).dispose();
                            DisposableHelper.replace(this.timer, this.worker.schedulePeriodically(new ConsumerIndexHolder(this.producerIndex, this), this.timespan, this.timespan, this.unit));
                        }
                    } else {
                        this.count = j;
                    }
                    if (leave(-1) == 0) {
                        return;
                    }
                } else {
                    this.queue.offer(NotificationLite.next(t));
                    if (!enter()) {
                        return;
                    }
                }
                drainLoop();
            }
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                Observer observer = this.actual;
                observer.onSubscribe(this);
                if (!this.cancelled) {
                    UnicastSubject<T> create = UnicastSubject.create(this.bufferSize);
                    this.window = create;
                    observer.onNext(create);
                    ConsumerIndexHolder consumerIndexHolder = new ConsumerIndexHolder(this.producerIndex, this);
                    DisposableHelper.replace(this.timer, this.restartTimerOnMaxSize ? this.worker.schedulePeriodically(consumerIndexHolder, this.timespan, this.timespan, this.unit) : this.scheduler.schedulePeriodicallyDirect(consumerIndexHolder, this.timespan, this.timespan, this.unit));
                }
            }
        }
    }

    static final class WindowExactUnboundedObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Observer<T>, Disposable, Runnable {
        static final Object NEXT = new Object();
        final int bufferSize;
        Disposable s;
        final Scheduler scheduler;
        volatile boolean terminated;
        final AtomicReference<Disposable> timer = new AtomicReference<>();
        final long timespan;
        final TimeUnit unit;
        UnicastSubject<T> window;

        WindowExactUnboundedObserver(Observer<? super Observable<T>> observer, long j, TimeUnit timeUnit, Scheduler scheduler2, int i) {
            super(observer, new MpscLinkedQueue());
            this.timespan = j;
            this.unit = timeUnit;
            this.scheduler = scheduler2;
            this.bufferSize = i;
        }

        public void dispose() {
            this.cancelled = true;
        }

        /* access modifiers changed from: 0000 */
        public void disposeTimer() {
            DisposableHelper.dispose(this.timer);
        }

        /* access modifiers changed from: 0000 */
        public void drainLoop() {
            MpscLinkedQueue mpscLinkedQueue = (MpscLinkedQueue) this.queue;
            Observer observer = this.actual;
            UnicastSubject<T> unicastSubject = this.window;
            int i = 1;
            while (true) {
                boolean z = this.terminated;
                boolean z2 = this.done;
                Object poll = mpscLinkedQueue.poll();
                if (!z2 || !(poll == null || poll == NEXT)) {
                    if (poll == null) {
                        i = leave(-i);
                        if (i == 0) {
                            return;
                        }
                    } else if (poll == NEXT) {
                        unicastSubject.onComplete();
                        if (!z) {
                            unicastSubject = UnicastSubject.create(this.bufferSize);
                            this.window = unicastSubject;
                            observer.onNext(unicastSubject);
                        } else {
                            this.s.dispose();
                        }
                    } else {
                        unicastSubject.onNext(NotificationLite.getValue(poll));
                    }
                }
            }
            this.window = null;
            mpscLinkedQueue.clear();
            disposeTimer();
            Throwable th = this.error;
            if (th != null) {
                unicastSubject.onError(th);
            } else {
                unicastSubject.onComplete();
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            disposeTimer();
            this.actual.onComplete();
        }

        public void onError(Throwable th) {
            this.error = th;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            disposeTimer();
            this.actual.onError(th);
        }

        public void onNext(T t) {
            if (!this.terminated) {
                if (fastEnter()) {
                    this.window.onNext(t);
                    if (leave(-1) == 0) {
                        return;
                    }
                } else {
                    this.queue.offer(NotificationLite.next(t));
                    if (!enter()) {
                        return;
                    }
                }
                drainLoop();
            }
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.window = UnicastSubject.create(this.bufferSize);
                Observer observer = this.actual;
                observer.onSubscribe(this);
                observer.onNext(this.window);
                if (!this.cancelled) {
                    DisposableHelper.replace(this.timer, this.scheduler.schedulePeriodicallyDirect(this, this.timespan, this.timespan, this.unit));
                }
            }
        }

        public void run() {
            if (this.cancelled) {
                this.terminated = true;
                disposeTimer();
            }
            this.queue.offer(NEXT);
            if (enter()) {
                drainLoop();
            }
        }
    }

    static final class WindowSkipObserver<T> extends QueueDrainObserver<T, Object, Observable<T>> implements Disposable, Runnable {
        final int bufferSize;
        Disposable s;
        volatile boolean terminated;
        final long timeskip;
        final long timespan;
        final TimeUnit unit;
        final List<UnicastSubject<T>> windows = new LinkedList();
        final Worker worker;

        final class CompletionTask implements Runnable {
            private final UnicastSubject<T> w;

            CompletionTask(UnicastSubject<T> unicastSubject) {
                this.w = unicastSubject;
            }

            public void run() {
                WindowSkipObserver.this.complete(this.w);
            }
        }

        static final class SubjectWork<T> {
            final boolean open;
            final UnicastSubject<T> w;

            SubjectWork(UnicastSubject<T> unicastSubject, boolean z) {
                this.w = unicastSubject;
                this.open = z;
            }
        }

        WindowSkipObserver(Observer<? super Observable<T>> observer, long j, long j2, TimeUnit timeUnit, Worker worker2, int i) {
            super(observer, new MpscLinkedQueue());
            this.timespan = j;
            this.timeskip = j2;
            this.unit = timeUnit;
            this.worker = worker2;
            this.bufferSize = i;
        }

        /* access modifiers changed from: 0000 */
        public void complete(UnicastSubject<T> unicastSubject) {
            this.queue.offer(new SubjectWork(unicastSubject, false));
            if (enter()) {
                drainLoop();
            }
        }

        public void dispose() {
            this.cancelled = true;
        }

        /* access modifiers changed from: 0000 */
        public void disposeWorker() {
            this.worker.dispose();
        }

        /* access modifiers changed from: 0000 */
        public void drainLoop() {
            MpscLinkedQueue mpscLinkedQueue = (MpscLinkedQueue) this.queue;
            Observer observer = this.actual;
            List<UnicastSubject<T>> list = this.windows;
            int i = 1;
            while (!this.terminated) {
                boolean z = this.done;
                Object poll = mpscLinkedQueue.poll();
                boolean z2 = poll == null;
                boolean z3 = poll instanceof SubjectWork;
                if (z && (z2 || z3)) {
                    mpscLinkedQueue.clear();
                    Throwable th = this.error;
                    if (th != null) {
                        for (UnicastSubject onError : list) {
                            onError.onError(th);
                        }
                    } else {
                        for (UnicastSubject onComplete : list) {
                            onComplete.onComplete();
                        }
                    }
                    disposeWorker();
                    list.clear();
                    return;
                } else if (z2) {
                    i = leave(-i);
                    if (i == 0) {
                        return;
                    }
                } else if (z3) {
                    SubjectWork subjectWork = (SubjectWork) poll;
                    if (!subjectWork.open) {
                        list.remove(subjectWork.w);
                        subjectWork.w.onComplete();
                        if (list.isEmpty() && this.cancelled) {
                            this.terminated = true;
                        }
                    } else if (!this.cancelled) {
                        UnicastSubject create = UnicastSubject.create(this.bufferSize);
                        list.add(create);
                        observer.onNext(create);
                        this.worker.schedule(new CompletionTask(create), this.timespan, this.unit);
                    }
                } else {
                    for (UnicastSubject onNext : list) {
                        onNext.onNext(poll);
                    }
                }
            }
            this.s.dispose();
            disposeWorker();
            mpscLinkedQueue.clear();
            list.clear();
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        public void onComplete() {
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onComplete();
            disposeWorker();
        }

        public void onError(Throwable th) {
            this.error = th;
            this.done = true;
            if (enter()) {
                drainLoop();
            }
            this.actual.onError(th);
            disposeWorker();
        }

        public void onNext(T t) {
            if (fastEnter()) {
                for (UnicastSubject onNext : this.windows) {
                    onNext.onNext(t);
                }
                if (leave(-1) == 0) {
                    return;
                }
            } else {
                this.queue.offer(t);
                if (!enter()) {
                    return;
                }
            }
            drainLoop();
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.actual.onSubscribe(this);
                if (!this.cancelled) {
                    UnicastSubject create = UnicastSubject.create(this.bufferSize);
                    this.windows.add(create);
                    this.actual.onNext(create);
                    this.worker.schedule(new CompletionTask(create), this.timespan, this.unit);
                    this.worker.schedulePeriodically(this, this.timeskip, this.timeskip, this.unit);
                }
            }
        }

        public void run() {
            SubjectWork subjectWork = new SubjectWork(UnicastSubject.create(this.bufferSize), true);
            if (!this.cancelled) {
                this.queue.offer(subjectWork);
            }
            if (enter()) {
                drainLoop();
            }
        }
    }

    public ObservableWindowTimed(ObservableSource<T> observableSource, long j, long j2, TimeUnit timeUnit, Scheduler scheduler2, long j3, int i, boolean z) {
        super(observableSource);
        this.timespan = j;
        this.timeskip = j2;
        this.unit = timeUnit;
        this.scheduler = scheduler2;
        this.maxSize = j3;
        this.bufferSize = i;
        this.restartTimerOnMaxSize = z;
    }

    public void subscribeActual(Observer<? super Observable<T>> observer) {
        SerializedObserver serializedObserver = new SerializedObserver(observer);
        if (this.timespan != this.timeskip) {
            ObservableSource observableSource = this.source;
            WindowSkipObserver windowSkipObserver = new WindowSkipObserver(serializedObserver, this.timespan, this.timeskip, this.unit, this.scheduler.createWorker(), this.bufferSize);
            observableSource.subscribe(windowSkipObserver);
        } else if (this.maxSize == Long.MAX_VALUE) {
            ObservableSource observableSource2 = this.source;
            WindowExactUnboundedObserver windowExactUnboundedObserver = new WindowExactUnboundedObserver(serializedObserver, this.timespan, this.unit, this.scheduler, this.bufferSize);
            observableSource2.subscribe(windowExactUnboundedObserver);
        } else {
            ObservableSource observableSource3 = this.source;
            WindowExactBoundedObserver windowExactBoundedObserver = new WindowExactBoundedObserver(serializedObserver, this.timespan, this.unit, this.scheduler, this.bufferSize, this.maxSize, this.restartTimerOnMaxSize);
            observableSource3.subscribe(windowExactBoundedObserver);
        }
    }
}

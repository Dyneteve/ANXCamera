package io.reactivex.internal.schedulers;

import io.reactivex.Scheduler;
import io.reactivex.Scheduler.Worker;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.disposables.SequentialDisposable;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.queue.MpscLinkedQueue;
import io.reactivex.plugins.RxJavaPlugins;
import io.reactivex.schedulers.SchedulerRunnableIntrospection;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ExecutorScheduler extends Scheduler {
    static final Scheduler HELPER = Schedulers.single();
    @NonNull
    final Executor executor;

    final class DelayedDispose implements Runnable {
        private final DelayedRunnable dr;

        DelayedDispose(DelayedRunnable delayedRunnable) {
            this.dr = delayedRunnable;
        }

        public void run() {
            this.dr.direct.replace(ExecutorScheduler.this.scheduleDirect(this.dr));
        }
    }

    static final class DelayedRunnable extends AtomicReference<Runnable> implements Disposable, SchedulerRunnableIntrospection, Runnable {
        private static final long serialVersionUID = -4101336210206799084L;
        final SequentialDisposable direct = new SequentialDisposable();
        final SequentialDisposable timed = new SequentialDisposable();

        DelayedRunnable(Runnable runnable) {
            super(runnable);
        }

        public void dispose() {
            if (getAndSet(null) != null) {
                this.timed.dispose();
                this.direct.dispose();
            }
        }

        public Runnable getWrappedRunnable() {
            Runnable runnable = (Runnable) get();
            return runnable != null ? runnable : Functions.EMPTY_RUNNABLE;
        }

        public boolean isDisposed() {
            return get() == null;
        }

        public void run() {
            Runnable runnable = (Runnable) get();
            if (runnable != null) {
                try {
                    runnable.run();
                } finally {
                    lazySet(null);
                    this.timed.lazySet(DisposableHelper.DISPOSED);
                    this.direct.lazySet(DisposableHelper.DISPOSED);
                }
            }
        }
    }

    public static final class ExecutorWorker extends Worker implements Runnable {
        volatile boolean disposed;
        final Executor executor;
        final MpscLinkedQueue<Runnable> queue;
        final CompositeDisposable tasks = new CompositeDisposable();
        final AtomicInteger wip = new AtomicInteger();

        static final class BooleanRunnable extends AtomicBoolean implements Disposable, Runnable {
            private static final long serialVersionUID = -2421395018820541164L;
            final Runnable actual;

            BooleanRunnable(Runnable runnable) {
                this.actual = runnable;
            }

            public void dispose() {
                lazySet(true);
            }

            public boolean isDisposed() {
                return get();
            }

            public void run() {
                if (!get()) {
                    try {
                        this.actual.run();
                    } finally {
                        lazySet(true);
                    }
                }
            }
        }

        final class SequentialDispose implements Runnable {
            private final Runnable decoratedRun;
            private final SequentialDisposable mar;

            SequentialDispose(SequentialDisposable sequentialDisposable, Runnable runnable) {
                this.mar = sequentialDisposable;
                this.decoratedRun = runnable;
            }

            public void run() {
                this.mar.replace(ExecutorWorker.this.schedule(this.decoratedRun));
            }
        }

        public ExecutorWorker(Executor executor2) {
            this.executor = executor2;
            this.queue = new MpscLinkedQueue<>();
        }

        public void dispose() {
            if (!this.disposed) {
                this.disposed = true;
                this.tasks.dispose();
                if (this.wip.getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        public boolean isDisposed() {
            return this.disposed;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:10:0x001c, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:11:0x001d, code lost:
            r1 = r3.wip.addAndGet(-r1);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0024, code lost:
            if (r1 != 0) goto L_0x0004;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0027, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0017, code lost:
            if (r3.disposed == false) goto L_0x001d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x0019, code lost:
            r0.clear();
         */
        public void run() {
            MpscLinkedQueue<Runnable> mpscLinkedQueue = this.queue;
            int i = 1;
            while (!this.disposed) {
                while (true) {
                    Runnable runnable = (Runnable) mpscLinkedQueue.poll();
                    if (runnable == null) {
                        break;
                    }
                    runnable.run();
                    if (this.disposed) {
                        mpscLinkedQueue.clear();
                        return;
                    }
                }
            }
            mpscLinkedQueue.clear();
        }

        @NonNull
        public Disposable schedule(@NonNull Runnable runnable) {
            if (this.disposed) {
                return EmptyDisposable.INSTANCE;
            }
            BooleanRunnable booleanRunnable = new BooleanRunnable(RxJavaPlugins.onSchedule(runnable));
            this.queue.offer(booleanRunnable);
            if (this.wip.getAndIncrement() == 0) {
                try {
                    this.executor.execute(this);
                } catch (RejectedExecutionException e) {
                    this.disposed = true;
                    this.queue.clear();
                    RxJavaPlugins.onError(e);
                    return EmptyDisposable.INSTANCE;
                }
            }
            return booleanRunnable;
        }

        @NonNull
        public Disposable schedule(@NonNull Runnable runnable, long j, @NonNull TimeUnit timeUnit) {
            if (j <= 0) {
                return schedule(runnable);
            }
            if (this.disposed) {
                return EmptyDisposable.INSTANCE;
            }
            SequentialDisposable sequentialDisposable = new SequentialDisposable();
            SequentialDisposable sequentialDisposable2 = new SequentialDisposable(sequentialDisposable);
            ScheduledRunnable scheduledRunnable = new ScheduledRunnable(new SequentialDispose(sequentialDisposable2, RxJavaPlugins.onSchedule(runnable)), this.tasks);
            this.tasks.add(scheduledRunnable);
            if (this.executor instanceof ScheduledExecutorService) {
                try {
                    scheduledRunnable.setFuture(((ScheduledExecutorService) this.executor).schedule(scheduledRunnable, j, timeUnit));
                } catch (RejectedExecutionException e) {
                    this.disposed = true;
                    RxJavaPlugins.onError(e);
                    return EmptyDisposable.INSTANCE;
                }
            } else {
                scheduledRunnable.setFuture(new DisposeOnCancel(ExecutorScheduler.HELPER.scheduleDirect(scheduledRunnable, j, timeUnit)));
            }
            sequentialDisposable.replace(scheduledRunnable);
            return sequentialDisposable2;
        }
    }

    public ExecutorScheduler(@NonNull Executor executor2) {
        this.executor = executor2;
    }

    @NonNull
    public Worker createWorker() {
        return new ExecutorWorker(this.executor);
    }

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable runnable) {
        Runnable onSchedule = RxJavaPlugins.onSchedule(runnable);
        try {
            if (this.executor instanceof ExecutorService) {
                ScheduledDirectTask scheduledDirectTask = new ScheduledDirectTask(onSchedule);
                scheduledDirectTask.setFuture(((ExecutorService) this.executor).submit(scheduledDirectTask));
                return scheduledDirectTask;
            }
            BooleanRunnable booleanRunnable = new BooleanRunnable(onSchedule);
            this.executor.execute(booleanRunnable);
            return booleanRunnable;
        } catch (RejectedExecutionException e) {
            RxJavaPlugins.onError(e);
            return EmptyDisposable.INSTANCE;
        }
    }

    @NonNull
    public Disposable scheduleDirect(@NonNull Runnable runnable, long j, TimeUnit timeUnit) {
        Runnable onSchedule = RxJavaPlugins.onSchedule(runnable);
        if (this.executor instanceof ScheduledExecutorService) {
            try {
                ScheduledDirectTask scheduledDirectTask = new ScheduledDirectTask(onSchedule);
                scheduledDirectTask.setFuture(((ScheduledExecutorService) this.executor).schedule(scheduledDirectTask, j, timeUnit));
                return scheduledDirectTask;
            } catch (RejectedExecutionException e) {
                RxJavaPlugins.onError(e);
                return EmptyDisposable.INSTANCE;
            }
        } else {
            DelayedRunnable delayedRunnable = new DelayedRunnable(onSchedule);
            delayedRunnable.timed.replace(HELPER.scheduleDirect(new DelayedDispose(delayedRunnable), j, timeUnit));
            return delayedRunnable;
        }
    }

    @NonNull
    public Disposable schedulePeriodicallyDirect(@NonNull Runnable runnable, long j, long j2, TimeUnit timeUnit) {
        if (!(this.executor instanceof ScheduledExecutorService)) {
            return super.schedulePeriodicallyDirect(runnable, j, j2, timeUnit);
        }
        try {
            ScheduledDirectPeriodicTask scheduledDirectPeriodicTask = new ScheduledDirectPeriodicTask(RxJavaPlugins.onSchedule(runnable));
            scheduledDirectPeriodicTask.setFuture(((ScheduledExecutorService) this.executor).scheduleAtFixedRate(scheduledDirectPeriodicTask, j, j2, timeUnit));
            return scheduledDirectPeriodicTask;
        } catch (RejectedExecutionException e) {
            RxJavaPlugins.onError(e);
            return EmptyDisposable.INSTANCE;
        }
    }
}

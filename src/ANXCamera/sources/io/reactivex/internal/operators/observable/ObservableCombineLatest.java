package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableCombineLatest<T, R> extends Observable<R> {
    final int bufferSize;
    final Function<? super Object[], ? extends R> combiner;
    final boolean delayError;
    final ObservableSource<? extends T>[] sources;
    final Iterable<? extends ObservableSource<? extends T>> sourcesIterable;

    static final class CombinerObserver<T, R> extends AtomicReference<Disposable> implements Observer<T> {
        private static final long serialVersionUID = -4823716997131257941L;
        final int index;
        final LatestCoordinator<T, R> parent;

        CombinerObserver(LatestCoordinator<T, R> latestCoordinator, int i) {
            this.parent = latestCoordinator;
            this.index = i;
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }

        public void onComplete() {
            this.parent.innerComplete(this.index);
        }

        public void onError(Throwable th) {
            this.parent.innerError(this.index, th);
        }

        public void onNext(T t) {
            this.parent.innerNext(this.index, t);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }
    }

    static final class LatestCoordinator<T, R> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = 8567835998786448817L;
        int active;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        final Function<? super Object[], ? extends R> combiner;
        int complete;
        final boolean delayError;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        Object[] latest;
        final CombinerObserver<T, R>[] observers;
        final SpscLinkedArrayQueue<Object[]> queue;

        LatestCoordinator(Observer<? super R> observer, Function<? super Object[], ? extends R> function, int i, int i2, boolean z) {
            this.actual = observer;
            this.combiner = function;
            this.delayError = z;
            this.latest = new Object[i];
            CombinerObserver<T, R>[] combinerObserverArr = new CombinerObserver[i];
            for (int i3 = 0; i3 < i; i3++) {
                combinerObserverArr[i3] = new CombinerObserver<>(this, i3);
            }
            this.observers = combinerObserverArr;
            this.queue = new SpscLinkedArrayQueue<>(i2);
        }

        /* access modifiers changed from: 0000 */
        public void cancelSources() {
            for (CombinerObserver<T, R> dispose : this.observers) {
                dispose.dispose();
            }
        }

        /* access modifiers changed from: 0000 */
        public void clear(SpscLinkedArrayQueue<?> spscLinkedArrayQueue) {
            synchronized (this) {
                this.latest = null;
            }
            spscLinkedArrayQueue.clear();
        }

        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                cancelSources();
                if (getAndIncrement() == 0) {
                    clear(this.queue);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            if (getAndIncrement() == 0) {
                SpscLinkedArrayQueue<Object[]> spscLinkedArrayQueue = this.queue;
                Observer<? super R> observer = this.actual;
                boolean z = this.delayError;
                int i = 1;
                while (!this.cancelled) {
                    if (z || this.errors.get() == null) {
                        boolean z2 = this.done;
                        Object[] objArr = (Object[]) spscLinkedArrayQueue.poll();
                        boolean z3 = objArr == null;
                        if (z2 && z3) {
                            clear(spscLinkedArrayQueue);
                            Throwable terminate = this.errors.terminate();
                            if (terminate == null) {
                                observer.onComplete();
                            } else {
                                observer.onError(terminate);
                            }
                            return;
                        } else if (z3) {
                            i = addAndGet(-i);
                            if (i == 0) {
                                return;
                            }
                        } else {
                            try {
                                observer.onNext(ObjectHelper.requireNonNull(this.combiner.apply(objArr), "The combiner returned a null value"));
                            } catch (Throwable th) {
                                Exceptions.throwIfFatal(th);
                                this.errors.addThrowable(th);
                                cancelSources();
                                clear(spscLinkedArrayQueue);
                                observer.onError(this.errors.terminate());
                                return;
                            }
                        }
                    } else {
                        cancelSources();
                        clear(spscLinkedArrayQueue);
                        observer.onError(this.errors.terminate());
                        return;
                    }
                }
                clear(spscLinkedArrayQueue);
            }
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0018, code lost:
            if (r2 == r0.length) goto L_0x001a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:16:0x001d, code lost:
            if (r4 == false) goto L_0x0022;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x001f, code lost:
            cancelSources();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:18:0x0022, code lost:
            drain();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0025, code lost:
            return;
         */
        public void innerComplete(int i) {
            synchronized (this) {
                Object[] objArr = this.latest;
                if (objArr != null) {
                    boolean z = objArr[i] == null;
                    if (!z) {
                        int i2 = this.complete + 1;
                        this.complete = i2;
                    }
                    this.done = true;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:16:0x0024, code lost:
            if (r1 == r4.length) goto L_0x0026;
         */
        public void innerError(int i, Throwable th) {
            boolean z;
            if (this.errors.addThrowable(th)) {
                if (this.delayError) {
                    synchronized (this) {
                        Object[] objArr = this.latest;
                        if (objArr != null) {
                            z = objArr[i] == null;
                            if (!z) {
                                int i2 = this.complete + 1;
                                this.complete = i2;
                            }
                            this.done = true;
                        } else {
                            return;
                        }
                    }
                } else {
                    z = true;
                }
                if (z) {
                    cancelSources();
                }
                drain();
            } else {
                RxJavaPlugins.onError(th);
            }
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x0025, code lost:
            if (r4 == false) goto L_0x002a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:16:0x0027, code lost:
            drain();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x002a, code lost:
            return;
         */
        public void innerNext(int i, T t) {
            boolean z;
            synchronized (this) {
                Object[] objArr = this.latest;
                if (objArr != null) {
                    Object obj = objArr[i];
                    int i2 = this.active;
                    if (obj == null) {
                        i2++;
                        this.active = i2;
                    }
                    objArr[i] = t;
                    if (i2 == objArr.length) {
                        this.queue.offer(objArr.clone());
                        z = true;
                    } else {
                        z = false;
                    }
                }
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        public void subscribe(ObservableSource<? extends T>[] observableSourceArr) {
            CombinerObserver<T, R>[] combinerObserverArr = this.observers;
            int length = combinerObserverArr.length;
            this.actual.onSubscribe(this);
            for (int i = 0; i < length && !this.done && !this.cancelled; i++) {
                observableSourceArr[i].subscribe(combinerObserverArr[i]);
            }
        }
    }

    public ObservableCombineLatest(ObservableSource<? extends T>[] observableSourceArr, Iterable<? extends ObservableSource<? extends T>> iterable, Function<? super Object[], ? extends R> function, int i, boolean z) {
        this.sources = observableSourceArr;
        this.sourcesIterable = iterable;
        this.combiner = function;
        this.bufferSize = i;
        this.delayError = z;
    }

    public void subscribeActual(Observer<? super R> observer) {
        int i;
        ObservableSource<? extends T>[] observableSourceArr = this.sources;
        if (observableSourceArr == null) {
            Observable[] observableArr = new Observable[8];
            ObservableSource<? extends T>[] observableSourceArr2 = observableArr;
            int i2 = 0;
            for (ObservableSource<? extends T> observableSource : this.sourcesIterable) {
                if (i2 == observableSourceArr2.length) {
                    ObservableSource<? extends T>[] observableSourceArr3 = new ObservableSource[((i2 >> 2) + i2)];
                    System.arraycopy(observableSourceArr2, 0, observableSourceArr3, 0, i2);
                    observableSourceArr2 = observableSourceArr3;
                }
                int i3 = i2 + 1;
                observableSourceArr2[i2] = observableSource;
                i2 = i3;
            }
            i = i2;
            observableSourceArr = observableSourceArr2;
        } else {
            i = observableSourceArr.length;
        }
        if (i == 0) {
            EmptyDisposable.complete(observer);
            return;
        }
        LatestCoordinator latestCoordinator = new LatestCoordinator(observer, this.combiner, i, this.bufferSize, this.delayError);
        latestCoordinator.subscribe(observableSourceArr);
    }
}

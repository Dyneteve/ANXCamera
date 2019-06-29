package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableBufferBoundary<T, U extends Collection<? super T>, Open, Close> extends AbstractObservableWithUpstream<T, U> {
    final Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose;
    final ObservableSource<? extends Open> bufferOpen;
    final Callable<U> bufferSupplier;

    static final class BufferBoundaryObserver<T, C extends Collection<? super T>, Open, Close> extends AtomicInteger implements Observer<T>, Disposable {
        private static final long serialVersionUID = -8466418554264089604L;
        final Observer<? super C> actual;
        final Function<? super Open, ? extends ObservableSource<? extends Close>> bufferClose;
        final ObservableSource<? extends Open> bufferOpen;
        final Callable<C> bufferSupplier;
        Map<Long, C> buffers = new LinkedHashMap();
        volatile boolean cancelled;
        volatile boolean done;
        final AtomicThrowable errors = new AtomicThrowable();
        long index;
        final CompositeDisposable observers = new CompositeDisposable();
        final SpscLinkedArrayQueue<C> queue = new SpscLinkedArrayQueue<>(Observable.bufferSize());
        final AtomicReference<Disposable> upstream = new AtomicReference<>();

        static final class BufferOpenObserver<Open> extends AtomicReference<Disposable> implements Observer<Open>, Disposable {
            private static final long serialVersionUID = -8498650778633225126L;
            final BufferBoundaryObserver<?, ?, Open, ?> parent;

            BufferOpenObserver(BufferBoundaryObserver<?, ?, Open, ?> bufferBoundaryObserver) {
                this.parent = bufferBoundaryObserver;
            }

            public void dispose() {
                DisposableHelper.dispose(this);
            }

            public boolean isDisposed() {
                return get() == DisposableHelper.DISPOSED;
            }

            public void onComplete() {
                lazySet(DisposableHelper.DISPOSED);
                this.parent.openComplete(this);
            }

            public void onError(Throwable th) {
                lazySet(DisposableHelper.DISPOSED);
                this.parent.boundaryError(this, th);
            }

            public void onNext(Open open) {
                this.parent.open(open);
            }

            public void onSubscribe(Disposable disposable) {
                DisposableHelper.setOnce(this, disposable);
            }
        }

        BufferBoundaryObserver(Observer<? super C> observer, ObservableSource<? extends Open> observableSource, Function<? super Open, ? extends ObservableSource<? extends Close>> function, Callable<C> callable) {
            this.actual = observer;
            this.bufferSupplier = callable;
            this.bufferOpen = observableSource;
            this.bufferClose = function;
        }

        /* access modifiers changed from: 0000 */
        public void boundaryError(Disposable disposable, Throwable th) {
            DisposableHelper.dispose(this.upstream);
            this.observers.delete(disposable);
            onError(th);
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x002f, code lost:
            if (r4 == false) goto L_0x0033;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0031, code lost:
            r3.done = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:14:0x0033, code lost:
            drain();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x0036, code lost:
            return;
         */
        public void close(BufferCloseObserver<T, C> bufferCloseObserver, long j) {
            boolean z;
            this.observers.delete(bufferCloseObserver);
            if (this.observers.size() == 0) {
                DisposableHelper.dispose(this.upstream);
                z = true;
            } else {
                z = false;
            }
            synchronized (this) {
                if (this.buffers != null) {
                    this.queue.offer(this.buffers.remove(Long.valueOf(j)));
                }
            }
        }

        public void dispose() {
            if (DisposableHelper.dispose(this.upstream)) {
                this.cancelled = true;
                this.observers.dispose();
                synchronized (this) {
                    this.buffers = null;
                }
                if (getAndIncrement() != 0) {
                    this.queue.clear();
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void drain() {
            if (getAndIncrement() == 0) {
                Observer<? super C> observer = this.actual;
                SpscLinkedArrayQueue<C> spscLinkedArrayQueue = this.queue;
                int i = 1;
                while (!this.cancelled) {
                    boolean z = this.done;
                    if (!z || this.errors.get() == null) {
                        Collection collection = (Collection) spscLinkedArrayQueue.poll();
                        boolean z2 = collection == null;
                        if (z && z2) {
                            observer.onComplete();
                            return;
                        } else if (z2) {
                            i = addAndGet(-i);
                            if (i == 0) {
                                return;
                            }
                        } else {
                            observer.onNext(collection);
                        }
                    } else {
                        spscLinkedArrayQueue.clear();
                        observer.onError(this.errors.terminate());
                        return;
                    }
                }
                spscLinkedArrayQueue.clear();
            }
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) this.upstream.get());
        }

        public void onComplete() {
            this.observers.dispose();
            synchronized (this) {
                Map<Long, C> map = this.buffers;
                if (map != null) {
                    for (Collection offer : map.values()) {
                        this.queue.offer(offer);
                    }
                    this.buffers = null;
                    this.done = true;
                    drain();
                }
            }
        }

        public void onError(Throwable th) {
            if (this.errors.addThrowable(th)) {
                this.observers.dispose();
                synchronized (this) {
                    this.buffers = null;
                }
                this.done = true;
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onNext(T t) {
            synchronized (this) {
                Map<Long, C> map = this.buffers;
                if (map != null) {
                    for (Collection add : map.values()) {
                        add.add(t);
                    }
                }
            }
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.setOnce(this.upstream, disposable)) {
                BufferOpenObserver bufferOpenObserver = new BufferOpenObserver(this);
                this.observers.add(bufferOpenObserver);
                this.bufferOpen.subscribe(bufferOpenObserver);
            }
        }

        /* access modifiers changed from: 0000 */
        public void open(Open open) {
            try {
                Collection collection = (Collection) ObjectHelper.requireNonNull(this.bufferSupplier.call(), "The bufferSupplier returned a null Collection");
                ObservableSource observableSource = (ObservableSource) ObjectHelper.requireNonNull(this.bufferClose.apply(open), "The bufferClose returned a null ObservableSource");
                long j = this.index;
                this.index = 1 + j;
                synchronized (this) {
                    Map<Long, C> map = this.buffers;
                    if (map != null) {
                        map.put(Long.valueOf(j), collection);
                        BufferCloseObserver bufferCloseObserver = new BufferCloseObserver(this, j);
                        this.observers.add(bufferCloseObserver);
                        observableSource.subscribe(bufferCloseObserver);
                    }
                }
            } catch (Throwable th) {
                Exceptions.throwIfFatal(th);
                DisposableHelper.dispose(this.upstream);
                onError(th);
            }
        }

        /* access modifiers changed from: 0000 */
        public void openComplete(BufferOpenObserver<Open> bufferOpenObserver) {
            this.observers.delete(bufferOpenObserver);
            if (this.observers.size() == 0) {
                DisposableHelper.dispose(this.upstream);
                this.done = true;
                drain();
            }
        }
    }

    static final class BufferCloseObserver<T, C extends Collection<? super T>> extends AtomicReference<Disposable> implements Observer<Object>, Disposable {
        private static final long serialVersionUID = -8498650778633225126L;
        final long index;
        final BufferBoundaryObserver<T, C, ?, ?> parent;

        BufferCloseObserver(BufferBoundaryObserver<T, C, ?, ?> bufferBoundaryObserver, long j) {
            this.parent = bufferBoundaryObserver;
            this.index = j;
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }

        public boolean isDisposed() {
            return get() == DisposableHelper.DISPOSED;
        }

        public void onComplete() {
            if (get() != DisposableHelper.DISPOSED) {
                lazySet(DisposableHelper.DISPOSED);
                this.parent.close(this, this.index);
            }
        }

        public void onError(Throwable th) {
            if (get() != DisposableHelper.DISPOSED) {
                lazySet(DisposableHelper.DISPOSED);
                this.parent.boundaryError(this, th);
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onNext(Object obj) {
            Disposable disposable = (Disposable) get();
            if (disposable != DisposableHelper.DISPOSED) {
                lazySet(DisposableHelper.DISPOSED);
                disposable.dispose();
                this.parent.close(this, this.index);
            }
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }
    }

    public ObservableBufferBoundary(ObservableSource<T> observableSource, ObservableSource<? extends Open> observableSource2, Function<? super Open, ? extends ObservableSource<? extends Close>> function, Callable<U> callable) {
        super(observableSource);
        this.bufferOpen = observableSource2;
        this.bufferClose = function;
        this.bufferSupplier = callable;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Observer<? super U> observer) {
        BufferBoundaryObserver bufferBoundaryObserver = new BufferBoundaryObserver(observer, this.bufferOpen, this.bufferClose, this.bufferSupplier);
        observer.onSubscribe(bufferBoundaryObserver);
        this.source.subscribe(bufferBoundaryObserver);
    }
}

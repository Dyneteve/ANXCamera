package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.plugins.RxJavaPlugins;

public final class ObservableFlattenIterable<T, R> extends AbstractObservableWithUpstream<T, R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;

    static final class FlattenIterableObserver<T, R> implements Observer<T>, Disposable {
        final Observer<? super R> actual;
        Disposable d;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;

        FlattenIterableObserver(Observer<? super R> observer, Function<? super T, ? extends Iterable<? extends R>> function) {
            this.actual = observer;
            this.mapper = function;
        }

        public void dispose() {
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
        }

        public boolean isDisposed() {
            return this.d.isDisposed();
        }

        public void onComplete() {
            if (this.d != DisposableHelper.DISPOSED) {
                this.d = DisposableHelper.DISPOSED;
                this.actual.onComplete();
            }
        }

        public void onError(Throwable th) {
            if (this.d == DisposableHelper.DISPOSED) {
                RxJavaPlugins.onError(th);
                return;
            }
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(th);
        }

        public void onNext(T t) {
            if (this.d != DisposableHelper.DISPOSED) {
                try {
                    Observer<? super R> observer = this.actual;
                    for (Object requireNonNull : (Iterable) this.mapper.apply(t)) {
                        try {
                            try {
                                observer.onNext(ObjectHelper.requireNonNull(requireNonNull, "The iterator returned a null value"));
                            } catch (Throwable th) {
                                Exceptions.throwIfFatal(th);
                                this.d.dispose();
                                onError(th);
                                return;
                            }
                        } catch (Throwable th2) {
                            Exceptions.throwIfFatal(th2);
                            this.d.dispose();
                            onError(th2);
                            return;
                        }
                    }
                } catch (Throwable th3) {
                    Exceptions.throwIfFatal(th3);
                    this.d.dispose();
                    onError(th3);
                }
            }
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.d, disposable)) {
                this.d = disposable;
                this.actual.onSubscribe(this);
            }
        }
    }

    public ObservableFlattenIterable(ObservableSource<T> observableSource, Function<? super T, ? extends Iterable<? extends R>> function) {
        super(observableSource);
        this.mapper = function;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Observer<? super R> observer) {
        this.source.subscribe(new FlattenIterableObserver(observer, this.mapper));
    }
}

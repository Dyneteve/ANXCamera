package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.ArrayCompositeDisposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.observers.SerializedObserver;
import java.util.concurrent.atomic.AtomicBoolean;

public final class ObservableTakeUntil<T, U> extends AbstractObservableWithUpstream<T, T> {
    final ObservableSource<? extends U> other;

    final class TakeUntil implements Observer<U> {
        private final ArrayCompositeDisposable frc;
        private final SerializedObserver<T> serial;

        TakeUntil(ArrayCompositeDisposable arrayCompositeDisposable, SerializedObserver<T> serializedObserver) {
            this.frc = arrayCompositeDisposable;
            this.serial = serializedObserver;
        }

        public void onComplete() {
            this.frc.dispose();
            this.serial.onComplete();
        }

        public void onError(Throwable th) {
            this.frc.dispose();
            this.serial.onError(th);
        }

        public void onNext(U u) {
            this.frc.dispose();
            this.serial.onComplete();
        }

        public void onSubscribe(Disposable disposable) {
            this.frc.setResource(1, disposable);
        }
    }

    static final class TakeUntilObserver<T> extends AtomicBoolean implements Observer<T> {
        private static final long serialVersionUID = 3451719290311127173L;
        final Observer<? super T> actual;
        final ArrayCompositeDisposable frc;
        Disposable s;

        TakeUntilObserver(Observer<? super T> observer, ArrayCompositeDisposable arrayCompositeDisposable) {
            this.actual = observer;
            this.frc = arrayCompositeDisposable;
        }

        public void onComplete() {
            this.frc.dispose();
            this.actual.onComplete();
        }

        public void onError(Throwable th) {
            this.frc.dispose();
            this.actual.onError(th);
        }

        public void onNext(T t) {
            this.actual.onNext(t);
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.frc.setResource(0, disposable);
            }
        }
    }

    public ObservableTakeUntil(ObservableSource<T> observableSource, ObservableSource<? extends U> observableSource2) {
        super(observableSource);
        this.other = observableSource2;
    }

    public void subscribeActual(Observer<? super T> observer) {
        SerializedObserver serializedObserver = new SerializedObserver(observer);
        ArrayCompositeDisposable arrayCompositeDisposable = new ArrayCompositeDisposable(2);
        TakeUntilObserver takeUntilObserver = new TakeUntilObserver(serializedObserver, arrayCompositeDisposable);
        observer.onSubscribe(arrayCompositeDisposable);
        this.other.subscribe(new TakeUntil(arrayCompositeDisposable, serializedObserver));
        this.source.subscribe(takeUntilObserver);
    }
}

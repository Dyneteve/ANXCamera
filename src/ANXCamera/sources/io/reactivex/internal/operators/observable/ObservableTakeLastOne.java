package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;

public final class ObservableTakeLastOne<T> extends AbstractObservableWithUpstream<T, T> {

    static final class TakeLastOneObserver<T> implements Observer<T>, Disposable {
        final Observer<? super T> actual;
        Disposable s;
        T value;

        TakeLastOneObserver(Observer<? super T> observer) {
            this.actual = observer;
        }

        public void dispose() {
            this.value = null;
            this.s.dispose();
        }

        /* access modifiers changed from: 0000 */
        public void emit() {
            T t = this.value;
            if (t != null) {
                this.value = null;
                this.actual.onNext(t);
            }
            this.actual.onComplete();
        }

        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        public void onComplete() {
            emit();
        }

        public void onError(Throwable th) {
            this.value = null;
            this.actual.onError(th);
        }

        public void onNext(T t) {
            this.value = t;
        }

        public void onSubscribe(Disposable disposable) {
            if (DisposableHelper.validate(this.s, disposable)) {
                this.s = disposable;
                this.actual.onSubscribe(this);
            }
        }
    }

    public ObservableTakeLastOne(ObservableSource<T> observableSource) {
        super(observableSource);
    }

    public void subscribeActual(Observer<? super T> observer) {
        this.source.subscribe(new TakeLastOneObserver(observer));
    }
}

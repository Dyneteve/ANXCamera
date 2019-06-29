package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Scheduler;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.concurrent.atomic.AtomicReference;

public final class ObservableSubscribeOn<T> extends AbstractObservableWithUpstream<T, T> {
    final Scheduler scheduler;

    static final class SubscribeOnObserver<T> extends AtomicReference<Disposable> implements Observer<T>, Disposable {
        private static final long serialVersionUID = 8094547886072529208L;
        final Observer<? super T> actual;
        final AtomicReference<Disposable> s = new AtomicReference<>();

        SubscribeOnObserver(Observer<? super T> observer) {
            this.actual = observer;
        }

        public void dispose() {
            DisposableHelper.dispose(this.s);
            DisposableHelper.dispose(this);
        }

        public boolean isDisposed() {
            return DisposableHelper.isDisposed((Disposable) get());
        }

        public void onComplete() {
            this.actual.onComplete();
        }

        public void onError(Throwable th) {
            this.actual.onError(th);
        }

        public void onNext(T t) {
            this.actual.onNext(t);
        }

        public void onSubscribe(Disposable disposable) {
            DisposableHelper.setOnce(this.s, disposable);
        }

        /* access modifiers changed from: 0000 */
        public void setDisposable(Disposable disposable) {
            DisposableHelper.setOnce(this, disposable);
        }
    }

    final class SubscribeTask implements Runnable {
        private final SubscribeOnObserver<T> parent;

        SubscribeTask(SubscribeOnObserver<T> subscribeOnObserver) {
            this.parent = subscribeOnObserver;
        }

        public void run() {
            ObservableSubscribeOn.this.source.subscribe(this.parent);
        }
    }

    public ObservableSubscribeOn(ObservableSource<T> observableSource, Scheduler scheduler2) {
        super(observableSource);
        this.scheduler = scheduler2;
    }

    public void subscribeActual(Observer<? super T> observer) {
        SubscribeOnObserver subscribeOnObserver = new SubscribeOnObserver(observer);
        observer.onSubscribe(subscribeOnObserver);
        subscribeOnObserver.setDisposable(this.scheduler.scheduleDirect(new SubscribeTask(subscribeOnObserver)));
    }
}

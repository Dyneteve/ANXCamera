package io.reactivex.internal.operators.observable;

import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.disposables.SequentialDisposable;
import java.util.concurrent.atomic.AtomicInteger;

public final class ObservableRetryPredicate<T> extends AbstractObservableWithUpstream<T, T> {
    final long count;
    final Predicate<? super Throwable> predicate;

    static final class RepeatObserver<T> extends AtomicInteger implements Observer<T> {
        private static final long serialVersionUID = -7098360935104053232L;
        final Observer<? super T> actual;
        final Predicate<? super Throwable> predicate;
        long remaining;
        final SequentialDisposable sa;
        final ObservableSource<? extends T> source;

        RepeatObserver(Observer<? super T> observer, long j, Predicate<? super Throwable> predicate2, SequentialDisposable sequentialDisposable, ObservableSource<? extends T> observableSource) {
            this.actual = observer;
            this.sa = sequentialDisposable;
            this.source = observableSource;
            this.predicate = predicate2;
            this.remaining = j;
        }

        public void onComplete() {
            this.actual.onComplete();
        }

        public void onError(Throwable th) {
            long j = this.remaining;
            if (j != Long.MAX_VALUE) {
                this.remaining = j - 1;
            }
            if (j == 0) {
                this.actual.onError(th);
            } else {
                try {
                    if (!this.predicate.test(th)) {
                        this.actual.onError(th);
                        return;
                    }
                    subscribeNext();
                } catch (Throwable th2) {
                    Exceptions.throwIfFatal(th2);
                    this.actual.onError(new CompositeException(th, th2));
                }
            }
        }

        public void onNext(T t) {
            this.actual.onNext(t);
        }

        public void onSubscribe(Disposable disposable) {
            this.sa.update(disposable);
        }

        /* access modifiers changed from: 0000 */
        public void subscribeNext() {
            if (getAndIncrement() == 0) {
                int i = 1;
                while (!this.sa.isDisposed()) {
                    this.source.subscribe(this);
                    i = addAndGet(-i);
                    if (i == 0) {
                    }
                }
            }
        }
    }

    public ObservableRetryPredicate(Observable<T> observable, long j, Predicate<? super Throwable> predicate2) {
        super(observable);
        this.predicate = predicate2;
        this.count = j;
    }

    public void subscribeActual(Observer<? super T> observer) {
        SequentialDisposable sequentialDisposable = new SequentialDisposable();
        observer.onSubscribe(sequentialDisposable);
        RepeatObserver repeatObserver = new RepeatObserver(observer, this.count, this.predicate, sequentialDisposable, this.source);
        repeatObserver.subscribeNext();
    }
}

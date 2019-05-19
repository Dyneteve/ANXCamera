package org.greenrobot.greendao.rx;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import org.greenrobot.greendao.annotation.apihint.Experimental;
import org.greenrobot.greendao.query.LazyList;
import org.greenrobot.greendao.query.Query;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Subscriber;
import rx.exceptions.Exceptions;

@Experimental
public class RxQuery<T> extends RxBase {
    /* access modifiers changed from: private */
    public final Query<T> query;

    public RxQuery(Query<T> query2) {
        this.query = query2;
    }

    public RxQuery(Query<T> query2, Scheduler scheduler) {
        super(scheduler);
        this.query = query2;
    }

    @Experimental
    public /* bridge */ /* synthetic */ Scheduler getScheduler() {
        return super.getScheduler();
    }

    @Experimental
    public Observable<List<T>> list() {
        return wrap((Callable<R>) new Callable<List<T>>() {
            public List<T> call() throws Exception {
                return RxQuery.this.query.forCurrentThread().list();
            }
        });
    }

    public Observable<T> oneByOne() {
        return wrap(Observable.create(new OnSubscribe<T>() {
            public void call(Subscriber<? super T> subscriber) {
                LazyList listLazyUncached;
                try {
                    listLazyUncached = RxQuery.this.query.forCurrentThread().listLazyUncached();
                    Iterator it = listLazyUncached.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            Object next = it.next();
                            if (subscriber.isUnsubscribed()) {
                                break;
                            }
                            subscriber.onNext(next);
                        }
                    }
                    listLazyUncached.close();
                    if (!subscriber.isUnsubscribed()) {
                        subscriber.onCompleted();
                    }
                } catch (Throwable th) {
                    Exceptions.throwIfFatal(th);
                    subscriber.onError(th);
                }
            }
        }));
    }

    @Experimental
    public Observable<T> unique() {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                return RxQuery.this.query.forCurrentThread().unique();
            }
        });
    }
}

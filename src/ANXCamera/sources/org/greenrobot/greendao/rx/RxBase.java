package org.greenrobot.greendao.rx;

import java.util.concurrent.Callable;
import org.greenrobot.greendao.annotation.apihint.Experimental;
import org.greenrobot.greendao.annotation.apihint.Internal;
import rx.Observable;
import rx.Scheduler;

@Internal
class RxBase {
    protected final Scheduler scheduler;

    RxBase() {
        this.scheduler = null;
    }

    @Experimental
    RxBase(Scheduler scheduler2) {
        this.scheduler = scheduler2;
    }

    @Experimental
    public Scheduler getScheduler() {
        return this.scheduler;
    }

    /* access modifiers changed from: protected */
    public <R> Observable<R> wrap(Callable<R> callable) {
        return wrap(RxUtils.fromCallable(callable));
    }

    /* access modifiers changed from: protected */
    public <R> Observable<R> wrap(Observable<R> observable) {
        return this.scheduler != null ? observable.subscribeOn(this.scheduler) : observable;
    }
}

package org.greenrobot.greendao.rx;

import java.util.List;
import java.util.concurrent.Callable;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.annotation.apihint.Experimental;
import rx.Observable;
import rx.Scheduler;

@Experimental
public class RxDao<T, K> extends RxBase {
    /* access modifiers changed from: private */
    public final AbstractDao<T, K> dao;

    @Experimental
    public RxDao(AbstractDao<T, K> abstractDao) {
        this(abstractDao, null);
    }

    @Experimental
    public RxDao(AbstractDao<T, K> abstractDao, Scheduler scheduler) {
        super(scheduler);
        this.dao = abstractDao;
    }

    @Experimental
    public Observable<Long> count() {
        return wrap((Callable<R>) new Callable<Long>() {
            public Long call() throws Exception {
                return Long.valueOf(RxDao.this.dao.count());
            }
        });
    }

    @Experimental
    public Observable<Void> delete(final T t) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.delete(t);
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteAll() {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteAll();
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteByKey(final K k) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteByKey(k);
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteByKeyInTx(final Iterable<K> iterable) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteByKeyInTx(iterable);
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteByKeyInTx(final K... kArr) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteByKeyInTx((K[]) kArr);
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteInTx(final Iterable<T> iterable) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteInTx(iterable);
                return null;
            }
        });
    }

    @Experimental
    public Observable<Void> deleteInTx(final T... tArr) {
        return wrap((Callable<R>) new Callable<Void>() {
            public Void call() throws Exception {
                RxDao.this.dao.deleteInTx((T[]) tArr);
                return null;
            }
        });
    }

    @Experimental
    public AbstractDao<T, K> getDao() {
        return this.dao;
    }

    @Experimental
    public /* bridge */ /* synthetic */ Scheduler getScheduler() {
        return super.getScheduler();
    }

    @Experimental
    public Observable<T> insert(final T t) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                RxDao.this.dao.insert(t);
                return t;
            }
        });
    }

    @Experimental
    public Observable<Iterable<T>> insertInTx(final Iterable<T> iterable) {
        return wrap((Callable<R>) new Callable<Iterable<T>>() {
            public Iterable<T> call() throws Exception {
                RxDao.this.dao.insertInTx(iterable);
                return iterable;
            }
        });
    }

    @Experimental
    public Observable<Object[]> insertInTx(final T... tArr) {
        return wrap((Callable<R>) new Callable<Object[]>() {
            public Object[] call() throws Exception {
                RxDao.this.dao.insertInTx((T[]) tArr);
                return tArr;
            }
        });
    }

    @Experimental
    public Observable<T> insertOrReplace(final T t) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                RxDao.this.dao.insertOrReplace(t);
                return t;
            }
        });
    }

    @Experimental
    public Observable<Iterable<T>> insertOrReplaceInTx(final Iterable<T> iterable) {
        return wrap((Callable<R>) new Callable<Iterable<T>>() {
            public Iterable<T> call() throws Exception {
                RxDao.this.dao.insertOrReplaceInTx(iterable);
                return iterable;
            }
        });
    }

    @Experimental
    public Observable<Object[]> insertOrReplaceInTx(final T... tArr) {
        return wrap((Callable<R>) new Callable<Object[]>() {
            public Object[] call() throws Exception {
                RxDao.this.dao.insertOrReplaceInTx((T[]) tArr);
                return tArr;
            }
        });
    }

    @Experimental
    public Observable<T> load(final K k) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                return RxDao.this.dao.load(k);
            }
        });
    }

    @Experimental
    public Observable<List<T>> loadAll() {
        return wrap((Callable<R>) new Callable<List<T>>() {
            public List<T> call() throws Exception {
                return RxDao.this.dao.loadAll();
            }
        });
    }

    @Experimental
    public Observable<T> refresh(final T t) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                RxDao.this.dao.refresh(t);
                return t;
            }
        });
    }

    @Experimental
    public Observable<T> save(final T t) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                RxDao.this.dao.save(t);
                return t;
            }
        });
    }

    @Experimental
    public Observable<Iterable<T>> saveInTx(final Iterable<T> iterable) {
        return wrap((Callable<R>) new Callable<Iterable<T>>() {
            public Iterable<T> call() throws Exception {
                RxDao.this.dao.saveInTx(iterable);
                return iterable;
            }
        });
    }

    @Experimental
    public Observable<Object[]> saveInTx(final T... tArr) {
        return wrap((Callable<R>) new Callable<Object[]>() {
            public Object[] call() throws Exception {
                RxDao.this.dao.saveInTx((T[]) tArr);
                return tArr;
            }
        });
    }

    @Experimental
    public Observable<T> update(final T t) {
        return wrap((Callable<R>) new Callable<T>() {
            public T call() throws Exception {
                RxDao.this.dao.update(t);
                return t;
            }
        });
    }

    @Experimental
    public Observable<Iterable<T>> updateInTx(final Iterable<T> iterable) {
        return wrap((Callable<R>) new Callable<Iterable<T>>() {
            public Iterable<T> call() throws Exception {
                RxDao.this.dao.updateInTx(iterable);
                return iterable;
            }
        });
    }

    @Experimental
    public Observable<Object[]> updateInTx(final T... tArr) {
        return wrap((Callable<R>) new Callable<Object[]>() {
            public Object[] call() throws Exception {
                RxDao.this.dao.updateInTx((T[]) tArr);
                return tArr;
            }
        });
    }
}

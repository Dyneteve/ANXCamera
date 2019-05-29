package org.greenrobot.greendao;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import org.greenrobot.greendao.async.AsyncSession;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.query.QueryBuilder;

public class AbstractDaoSession {
    private final Database db;
    private final Map<Class<?>, AbstractDao<?, ?>> entityToDao = new HashMap();

    public AbstractDaoSession(Database database) {
        this.db = database;
    }

    public <V> V callInTx(Callable<V> callable) throws Exception {
        this.db.beginTransaction();
        try {
            V call = callable.call();
            this.db.setTransactionSuccessful();
            return call;
        } finally {
            this.db.endTransaction();
        }
    }

    public <V> V callInTxNoException(Callable<V> callable) {
        this.db.beginTransaction();
        try {
            V call = callable.call();
            this.db.setTransactionSuccessful();
            this.db.endTransaction();
            return call;
        } catch (Exception e) {
            throw new DaoException("Callable failed", e);
        } catch (Throwable th) {
            this.db.endTransaction();
            throw th;
        }
    }

    public <T> void delete(T t) {
        getDao(t.getClass()).delete(t);
    }

    public <T> void deleteAll(Class<T> cls) {
        getDao(cls).deleteAll();
    }

    public Collection<AbstractDao<?, ?>> getAllDaos() {
        return Collections.unmodifiableCollection(this.entityToDao.values());
    }

    public AbstractDao<?, ?> getDao(Class<? extends Object> cls) {
        AbstractDao<?, ?> abstractDao = (AbstractDao) this.entityToDao.get(cls);
        if (abstractDao != null) {
            return abstractDao;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("No DAO registered for ");
        sb.append(cls);
        throw new DaoException(sb.toString());
    }

    public Database getDatabase() {
        return this.db;
    }

    public <T> long insert(T t) {
        return getDao(t.getClass()).insert(t);
    }

    public <T> long insertOrReplace(T t) {
        return getDao(t.getClass()).insertOrReplace(t);
    }

    public <T, K> T load(Class<T> cls, K k) {
        return getDao(cls).load(k);
    }

    public <T, K> List<T> loadAll(Class<T> cls) {
        return getDao(cls).loadAll();
    }

    public <T> QueryBuilder<T> queryBuilder(Class<T> cls) {
        return getDao(cls).queryBuilder();
    }

    public <T, K> List<T> queryRaw(Class<T> cls, String str, String... strArr) {
        return getDao(cls).queryRaw(str, strArr);
    }

    public <T> void refresh(T t) {
        getDao(t.getClass()).refresh(t);
    }

    /* access modifiers changed from: protected */
    public <T> void registerDao(Class<T> cls, AbstractDao<T, ?> abstractDao) {
        this.entityToDao.put(cls, abstractDao);
    }

    public void runInTx(Runnable runnable) {
        this.db.beginTransaction();
        try {
            runnable.run();
            this.db.setTransactionSuccessful();
        } finally {
            this.db.endTransaction();
        }
    }

    public AsyncSession startAsyncSession() {
        return new AsyncSession(this);
    }

    public <T> void update(T t) {
        getDao(t.getClass()).update(t);
    }
}

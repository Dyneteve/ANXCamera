package org.greenrobot.greendao;

import android.database.CrossProcessCursor;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.identityscope.IdentityScope;
import org.greenrobot.greendao.identityscope.IdentityScopeLong;
import org.greenrobot.greendao.internal.DaoConfig;
import org.greenrobot.greendao.internal.FastCursor;
import org.greenrobot.greendao.internal.TableStatements;
import org.greenrobot.greendao.query.Query;
import org.greenrobot.greendao.query.QueryBuilder;

public abstract class AbstractDao<T, K> {
    protected final DaoConfig config;
    protected final Database db;
    protected final IdentityScope<K, T> identityScope;
    protected final IdentityScopeLong<T> identityScopeLong;
    protected final boolean isStandardSQLite;
    protected final int pkOrdinal;
    protected final AbstractDaoSession session;
    protected final TableStatements statements;

    public AbstractDao(DaoConfig daoConfig) {
        this(daoConfig, null);
    }

    public AbstractDao(DaoConfig daoConfig, AbstractDaoSession abstractDaoSession) {
        this.config = daoConfig;
        this.session = abstractDaoSession;
        this.db = daoConfig.db;
        this.isStandardSQLite = this.db.getRawDatabase() instanceof SQLiteDatabase;
        this.identityScope = daoConfig.getIdentityScope();
        if (this.identityScope instanceof IdentityScopeLong) {
            this.identityScopeLong = (IdentityScopeLong) this.identityScope;
        } else {
            this.identityScopeLong = null;
        }
        this.statements = daoConfig.statements;
        this.pkOrdinal = daoConfig.pkProperty != null ? daoConfig.pkProperty.ordinal : -1;
    }

    private void deleteByKeyInsideSynchronized(K k, DatabaseStatement databaseStatement) {
        if (k instanceof Long) {
            databaseStatement.bindLong(1, ((Long) k).longValue());
        } else if (k != null) {
            databaseStatement.bindString(1, k.toString());
        } else {
            throw new DaoException("Cannot delete entity, key is null");
        }
        databaseStatement.execute();
    }

    private void deleteInTxInternal(Iterable<T> iterable, Iterable<K> iterable2) {
        ArrayList arrayList;
        assertSinglePk();
        DatabaseStatement deleteStatement = this.statements.getDeleteStatement();
        this.db.beginTransaction();
        try {
            synchronized (deleteStatement) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                    arrayList = new ArrayList();
                } else {
                    arrayList = null;
                }
                if (iterable != null) {
                    try {
                        for (T keyVerified : iterable) {
                            Object keyVerified2 = getKeyVerified(keyVerified);
                            deleteByKeyInsideSynchronized(keyVerified2, deleteStatement);
                            if (arrayList != null) {
                                arrayList.add(keyVerified2);
                            }
                        }
                    } finally {
                        if (this.identityScope != null) {
                            this.identityScope.unlock();
                        }
                    }
                }
                if (iterable2 != null) {
                    for (Object next : iterable2) {
                        deleteByKeyInsideSynchronized(next, deleteStatement);
                        if (arrayList != null) {
                            arrayList.add(next);
                        }
                    }
                }
                if (this.identityScope != null) {
                    this.identityScope.unlock();
                }
            }
            this.db.setTransactionSuccessful();
            if (!(arrayList == null || this.identityScope == null)) {
                this.identityScope.remove((Iterable<K>) arrayList);
            }
        } finally {
            this.db.endTransaction();
        }
    }

    private long executeInsert(T t, DatabaseStatement databaseStatement, boolean z) {
        long j;
        if (this.db.isDbLockedByCurrentThread()) {
            j = insertInsideTx(t, databaseStatement);
        } else {
            this.db.beginTransaction();
            try {
                j = insertInsideTx(t, databaseStatement);
                this.db.setTransactionSuccessful();
            } finally {
                this.db.endTransaction();
            }
        }
        if (z) {
            updateKeyAfterInsertAndAttach(t, j, true);
        }
        return j;
    }

    private void executeInsertInTx(DatabaseStatement databaseStatement, Iterable<T> iterable, boolean z) {
        this.db.beginTransaction();
        try {
            synchronized (databaseStatement) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                }
                try {
                    if (this.isStandardSQLite) {
                        SQLiteStatement sQLiteStatement = (SQLiteStatement) databaseStatement.getRawStatement();
                        for (Object next : iterable) {
                            bindValues(sQLiteStatement, (T) next);
                            if (z) {
                                updateKeyAfterInsertAndAttach(next, sQLiteStatement.executeInsert(), false);
                            } else {
                                sQLiteStatement.execute();
                            }
                        }
                    } else {
                        for (Object next2 : iterable) {
                            bindValues(databaseStatement, (T) next2);
                            if (z) {
                                updateKeyAfterInsertAndAttach(next2, databaseStatement.executeInsert(), false);
                            } else {
                                databaseStatement.execute();
                            }
                        }
                    }
                } finally {
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                }
            }
            this.db.setTransactionSuccessful();
        } finally {
            this.db.endTransaction();
        }
    }

    private long insertInsideTx(T t, DatabaseStatement databaseStatement) {
        synchronized (databaseStatement) {
            if (this.isStandardSQLite) {
                SQLiteStatement sQLiteStatement = (SQLiteStatement) databaseStatement.getRawStatement();
                bindValues(sQLiteStatement, t);
                long executeInsert = sQLiteStatement.executeInsert();
                return executeInsert;
            }
            bindValues(databaseStatement, t);
            long executeInsert2 = databaseStatement.executeInsert();
            return executeInsert2;
        }
    }

    private void loadAllUnlockOnWindowBounds(Cursor cursor, CursorWindow cursorWindow, List<T> list) {
        int startPosition = cursorWindow.getStartPosition() + cursorWindow.getNumRows();
        int i = 0;
        while (true) {
            list.add(loadCurrent(cursor, 0, false));
            int i2 = i + 1;
            if (i2 >= startPosition) {
                CursorWindow moveToNextUnlocked = moveToNextUnlocked(cursor);
                if (moveToNextUnlocked != null) {
                    startPosition = moveToNextUnlocked.getStartPosition() + moveToNextUnlocked.getNumRows();
                } else {
                    return;
                }
            } else if (!cursor.moveToNext()) {
                return;
            }
            i = i2 + 1;
        }
    }

    private CursorWindow moveToNextUnlocked(Cursor cursor) {
        this.identityScope.unlock();
        try {
            if (cursor.moveToNext()) {
                return ((CrossProcessCursor) cursor).getWindow();
            }
            this.identityScope.lock();
            return null;
        } finally {
            this.identityScope.lock();
        }
    }

    /* access modifiers changed from: protected */
    public void assertSinglePk() {
        if (this.config.pkColumns.length != 1) {
            StringBuilder sb = new StringBuilder();
            sb.append(this);
            sb.append(" (");
            sb.append(this.config.tablename);
            sb.append(") does not have a single-column primary key");
            throw new DaoException(sb.toString());
        }
    }

    /* access modifiers changed from: protected */
    public void attachEntity(T t) {
    }

    /* access modifiers changed from: protected */
    public final void attachEntity(K k, T t, boolean z) {
        attachEntity(t);
        if (this.identityScope != null && k != null) {
            if (z) {
                this.identityScope.put(k, t);
            } else {
                this.identityScope.putNoLock(k, t);
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract void bindValues(SQLiteStatement sQLiteStatement, T t);

    /* access modifiers changed from: protected */
    public abstract void bindValues(DatabaseStatement databaseStatement, T t);

    public long count() {
        return this.statements.getCountStatement().simpleQueryForLong();
    }

    public void delete(T t) {
        assertSinglePk();
        deleteByKey(getKeyVerified(t));
    }

    public void deleteAll() {
        Database database = this.db;
        StringBuilder sb = new StringBuilder();
        sb.append("DELETE FROM '");
        sb.append(this.config.tablename);
        sb.append("'");
        database.execSQL(sb.toString());
        if (this.identityScope != null) {
            this.identityScope.clear();
        }
    }

    public void deleteByKey(K k) {
        assertSinglePk();
        DatabaseStatement deleteStatement = this.statements.getDeleteStatement();
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (deleteStatement) {
                deleteByKeyInsideSynchronized(k, deleteStatement);
            }
        } else {
            this.db.beginTransaction();
            try {
                synchronized (deleteStatement) {
                    deleteByKeyInsideSynchronized(k, deleteStatement);
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            } catch (Throwable th) {
                this.db.endTransaction();
                throw th;
            }
        }
        if (this.identityScope != null) {
            this.identityScope.remove(k);
        }
    }

    public void deleteByKeyInTx(Iterable<K> iterable) {
        deleteInTxInternal(null, iterable);
    }

    public void deleteByKeyInTx(K... kArr) {
        deleteInTxInternal(null, Arrays.asList(kArr));
    }

    public void deleteInTx(Iterable<T> iterable) {
        deleteInTxInternal(iterable, null);
    }

    public void deleteInTx(T... tArr) {
        deleteInTxInternal(Arrays.asList(tArr), null);
    }

    public boolean detach(T t) {
        if (this.identityScope == null) {
            return false;
        }
        return this.identityScope.detach(getKeyVerified(t), t);
    }

    public void detachAll() {
        if (this.identityScope != null) {
            this.identityScope.clear();
        }
    }

    public String[] getAllColumns() {
        return this.config.allColumns;
    }

    public Database getDatabase() {
        return this.db;
    }

    /* access modifiers changed from: protected */
    public abstract K getKey(T t);

    /* access modifiers changed from: protected */
    public K getKeyVerified(T t) {
        K key = getKey(t);
        if (key != null) {
            return key;
        }
        if (t == null) {
            throw new NullPointerException("Entity may not be null");
        }
        throw new DaoException("Entity has no key");
    }

    public String[] getNonPkColumns() {
        return this.config.nonPkColumns;
    }

    public String[] getPkColumns() {
        return this.config.pkColumns;
    }

    public Property getPkProperty() {
        return this.config.pkProperty;
    }

    public Property[] getProperties() {
        return this.config.properties;
    }

    public AbstractDaoSession getSession() {
        return this.session;
    }

    /* access modifiers changed from: 0000 */
    public TableStatements getStatements() {
        return this.config.statements;
    }

    public String getTablename() {
        return this.config.tablename;
    }

    /* access modifiers changed from: protected */
    public abstract boolean hasKey(T t);

    public long insert(T t) {
        return executeInsert(t, this.statements.getInsertStatement(), true);
    }

    public void insertInTx(Iterable<T> iterable) {
        insertInTx(iterable, isEntityUpdateable());
    }

    public void insertInTx(Iterable<T> iterable, boolean z) {
        executeInsertInTx(this.statements.getInsertStatement(), iterable, z);
    }

    public void insertInTx(T... tArr) {
        insertInTx(Arrays.asList(tArr), isEntityUpdateable());
    }

    public long insertOrReplace(T t) {
        return executeInsert(t, this.statements.getInsertOrReplaceStatement(), true);
    }

    public void insertOrReplaceInTx(Iterable<T> iterable) {
        insertOrReplaceInTx(iterable, isEntityUpdateable());
    }

    public void insertOrReplaceInTx(Iterable<T> iterable, boolean z) {
        executeInsertInTx(this.statements.getInsertOrReplaceStatement(), iterable, z);
    }

    public void insertOrReplaceInTx(T... tArr) {
        insertOrReplaceInTx(Arrays.asList(tArr), isEntityUpdateable());
    }

    public long insertWithoutSettingPk(T t) {
        return executeInsert(t, this.statements.getInsertOrReplaceStatement(), false);
    }

    /* access modifiers changed from: protected */
    public abstract boolean isEntityUpdateable();

    public T load(K k) {
        assertSinglePk();
        if (k == null) {
            return null;
        }
        if (this.identityScope != null) {
            T t = this.identityScope.get(k);
            if (t != null) {
                return t;
            }
        }
        return loadUniqueAndCloseCursor(this.db.rawQuery(this.statements.getSelectByKey(), new String[]{k.toString()}));
    }

    public List<T> loadAll() {
        return loadAllAndCloseCursor(this.db.rawQuery(this.statements.getSelectAll(), null));
    }

    /* access modifiers changed from: protected */
    public List<T> loadAllAndCloseCursor(Cursor cursor) {
        try {
            return loadAllFromCursor(cursor);
        } finally {
            cursor.close();
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0055  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0080  */
    public List<T> loadAllFromCursor(Cursor cursor) {
        boolean z;
        int count = cursor.getCount();
        if (count == 0) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList(count);
        CursorWindow cursorWindow = null;
        if (cursor instanceof CrossProcessCursor) {
            cursorWindow = ((CrossProcessCursor) cursor).getWindow();
            if (cursorWindow != null) {
                if (cursorWindow.getNumRows() == count) {
                    cursor = new FastCursor(cursorWindow);
                    z = true;
                    if (cursor.moveToFirst()) {
                        if (this.identityScope != null) {
                            this.identityScope.lock();
                            this.identityScope.reserveRoom(count);
                        }
                        if (!z && cursorWindow != null) {
                            try {
                                if (this.identityScope != null) {
                                    loadAllUnlockOnWindowBounds(cursor, cursorWindow, arrayList);
                                    if (this.identityScope != null) {
                                        this.identityScope.unlock();
                                    }
                                }
                            } catch (Throwable th) {
                                if (this.identityScope != null) {
                                    this.identityScope.unlock();
                                }
                                throw th;
                            }
                        }
                        do {
                            arrayList.add(loadCurrent(cursor, 0, false));
                        } while (cursor.moveToNext());
                        if (this.identityScope != null) {
                        }
                    }
                    return arrayList;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("Window vs. result size: ");
                sb.append(cursorWindow.getNumRows());
                sb.append("/");
                sb.append(count);
                DaoLog.d(sb.toString());
            }
        }
        z = false;
        if (cursor.moveToFirst()) {
        }
        return arrayList;
    }

    public T loadByRowId(long j) {
        return loadUniqueAndCloseCursor(this.db.rawQuery(this.statements.getSelectByRowId(), new String[]{Long.toString(j)}));
    }

    /* access modifiers changed from: protected */
    public final T loadCurrent(Cursor cursor, int i, boolean z) {
        if (this.identityScopeLong != null) {
            if (i != 0 && cursor.isNull(this.pkOrdinal + i)) {
                return null;
            }
            long j = cursor.getLong(this.pkOrdinal + i);
            T r2 = z ? this.identityScopeLong.get2(j) : this.identityScopeLong.get2NoLock(j);
            if (r2 != null) {
                return r2;
            }
            T readEntity = readEntity(cursor, i);
            attachEntity(readEntity);
            if (z) {
                this.identityScopeLong.put2(j, readEntity);
            } else {
                this.identityScopeLong.put2NoLock(j, readEntity);
            }
            return readEntity;
        } else if (this.identityScope != null) {
            Object readKey = readKey(cursor, i);
            if (i != 0 && readKey == null) {
                return null;
            }
            T noLock = z ? this.identityScope.get(readKey) : this.identityScope.getNoLock(readKey);
            if (noLock != null) {
                return noLock;
            }
            T readEntity2 = readEntity(cursor, i);
            attachEntity(readKey, readEntity2, z);
            return readEntity2;
        } else if (i != 0 && readKey(cursor, i) == null) {
            return null;
        } else {
            T readEntity3 = readEntity(cursor, i);
            attachEntity(readEntity3);
            return readEntity3;
        }
    }

    /* access modifiers changed from: protected */
    public final <O> O loadCurrentOther(AbstractDao<O, ?> abstractDao, Cursor cursor, int i) {
        return abstractDao.loadCurrent(cursor, i, true);
    }

    /* access modifiers changed from: protected */
    public T loadUnique(Cursor cursor) {
        if (!cursor.moveToFirst()) {
            return null;
        }
        if (cursor.isLast()) {
            return loadCurrent(cursor, 0, true);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected unique result, but count was ");
        sb.append(cursor.getCount());
        throw new DaoException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public T loadUniqueAndCloseCursor(Cursor cursor) {
        try {
            return loadUnique(cursor);
        } finally {
            cursor.close();
        }
    }

    public QueryBuilder<T> queryBuilder() {
        return QueryBuilder.internalCreate(this);
    }

    public List<T> queryRaw(String str, String... strArr) {
        Database database = this.db;
        StringBuilder sb = new StringBuilder();
        sb.append(this.statements.getSelectAll());
        sb.append(str);
        return loadAllAndCloseCursor(database.rawQuery(sb.toString(), strArr));
    }

    public Query<T> queryRawCreate(String str, Object... objArr) {
        return queryRawCreateListArgs(str, Arrays.asList(objArr));
    }

    public Query<T> queryRawCreateListArgs(String str, Collection<Object> collection) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.statements.getSelectAll());
        sb.append(str);
        return Query.internalCreate(this, sb.toString(), collection.toArray());
    }

    /* access modifiers changed from: protected */
    public abstract T readEntity(Cursor cursor, int i);

    /* access modifiers changed from: protected */
    public abstract void readEntity(Cursor cursor, T t, int i);

    /* access modifiers changed from: protected */
    public abstract K readKey(Cursor cursor, int i);

    public void refresh(T t) {
        assertSinglePk();
        Object keyVerified = getKeyVerified(t);
        Cursor rawQuery = this.db.rawQuery(this.statements.getSelectByKey(), new String[]{keyVerified.toString()});
        try {
            if (!rawQuery.moveToFirst()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Entity does not exist in the database anymore: ");
                sb.append(t.getClass());
                sb.append(" with key ");
                sb.append(keyVerified);
                throw new DaoException(sb.toString());
            } else if (rawQuery.isLast()) {
                readEntity(rawQuery, t, 0);
                attachEntity(keyVerified, t, true);
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Expected unique result, but count was ");
                sb2.append(rawQuery.getCount());
                throw new DaoException(sb2.toString());
            }
        } finally {
            rawQuery.close();
        }
    }

    public void save(T t) {
        if (hasKey(t)) {
            update(t);
        } else {
            insert(t);
        }
    }

    public void saveInTx(Iterable<T> iterable) {
        int i = 0;
        int i2 = 0;
        for (T hasKey : iterable) {
            if (hasKey(hasKey)) {
                i++;
            } else {
                i2++;
            }
        }
        if (i > 0 && i2 > 0) {
            ArrayList arrayList = new ArrayList(i);
            ArrayList arrayList2 = new ArrayList(i2);
            for (Object next : iterable) {
                if (hasKey(next)) {
                    arrayList.add(next);
                } else {
                    arrayList2.add(next);
                }
            }
            this.db.beginTransaction();
            try {
                updateInTx((Iterable<T>) arrayList);
                insertInTx((Iterable<T>) arrayList2);
                this.db.setTransactionSuccessful();
            } finally {
                this.db.endTransaction();
            }
        } else if (i2 > 0) {
            insertInTx(iterable);
        } else if (i > 0) {
            updateInTx(iterable);
        }
    }

    public void saveInTx(T... tArr) {
        saveInTx((Iterable<T>) Arrays.asList(tArr));
    }

    public void update(T t) {
        assertSinglePk();
        DatabaseStatement updateStatement = this.statements.getUpdateStatement();
        if (this.db.isDbLockedByCurrentThread()) {
            synchronized (updateStatement) {
                if (this.isStandardSQLite) {
                    updateInsideSynchronized(t, (SQLiteStatement) updateStatement.getRawStatement(), true);
                } else {
                    updateInsideSynchronized(t, updateStatement, true);
                }
            }
            return;
        }
        this.db.beginTransaction();
        try {
            synchronized (updateStatement) {
                updateInsideSynchronized(t, updateStatement, true);
            }
            this.db.setTransactionSuccessful();
            this.db.endTransaction();
        } catch (Throwable th) {
            this.db.endTransaction();
            throw th;
        }
    }

    public void updateInTx(Iterable<T> iterable) {
        DatabaseStatement updateStatement = this.statements.getUpdateStatement();
        this.db.beginTransaction();
        try {
            synchronized (updateStatement) {
                if (this.identityScope != null) {
                    this.identityScope.lock();
                }
                try {
                    if (this.isStandardSQLite) {
                        SQLiteStatement sQLiteStatement = (SQLiteStatement) updateStatement.getRawStatement();
                        for (T updateInsideSynchronized : iterable) {
                            updateInsideSynchronized(updateInsideSynchronized, sQLiteStatement, false);
                        }
                    } else {
                        for (T updateInsideSynchronized2 : iterable) {
                            updateInsideSynchronized(updateInsideSynchronized2, updateStatement, false);
                        }
                    }
                } finally {
                    if (this.identityScope != null) {
                        this.identityScope.unlock();
                    }
                }
            }
            this.db.setTransactionSuccessful();
            try {
                e = null;
            } catch (RuntimeException e) {
                throw e;
            }
        } catch (RuntimeException e2) {
            e = e2;
            try {
            } catch (RuntimeException e3) {
                DaoLog.w("Could not end transaction (rethrowing initial exception)", e3);
                throw e;
            }
        } finally {
            try {
                this.db.endTransaction();
            } catch (RuntimeException e4) {
                throw e4;
            }
        }
        if (e != null) {
            throw e;
        }
    }

    public void updateInTx(T... tArr) {
        updateInTx((Iterable<T>) Arrays.asList(tArr));
    }

    /* access modifiers changed from: protected */
    public void updateInsideSynchronized(T t, SQLiteStatement sQLiteStatement, boolean z) {
        bindValues(sQLiteStatement, t);
        int length = this.config.allColumns.length + 1;
        Object key = getKey(t);
        if (key instanceof Long) {
            sQLiteStatement.bindLong(length, ((Long) key).longValue());
        } else if (key != null) {
            sQLiteStatement.bindString(length, key.toString());
        } else {
            throw new DaoException("Cannot update entity without key - was it inserted before?");
        }
        sQLiteStatement.execute();
        attachEntity(key, t, z);
    }

    /* access modifiers changed from: protected */
    public void updateInsideSynchronized(T t, DatabaseStatement databaseStatement, boolean z) {
        bindValues(databaseStatement, t);
        int length = this.config.allColumns.length + 1;
        Object key = getKey(t);
        if (key instanceof Long) {
            databaseStatement.bindLong(length, ((Long) key).longValue());
        } else if (key != null) {
            databaseStatement.bindString(length, key.toString());
        } else {
            throw new DaoException("Cannot update entity without key - was it inserted before?");
        }
        databaseStatement.execute();
        attachEntity(key, t, z);
    }

    /* access modifiers changed from: protected */
    public abstract K updateKeyAfterInsert(T t, long j);

    /* access modifiers changed from: protected */
    public void updateKeyAfterInsertAndAttach(T t, long j, boolean z) {
        if (j != -1) {
            attachEntity(updateKeyAfterInsert(t, j), t, z);
        } else {
            DaoLog.w("Could not insert row (executeInsert returned -1)");
        }
    }
}

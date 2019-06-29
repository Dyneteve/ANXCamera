package org.greenrobot.greendao.query;

import android.database.Cursor;
import java.util.Date;
import org.greenrobot.greendao.AbstractDao;

public class CursorQuery<T> extends AbstractQueryWithLimit<T> {
    private final QueryData<T> queryData;

    private static final class QueryData<T2> extends AbstractQueryData<T2, CursorQuery<T2>> {
        private final int limitPosition;
        private final int offsetPosition;

        QueryData(AbstractDao abstractDao, String str, String[] strArr, int i, int i2) {
            super(abstractDao, str, strArr);
            this.limitPosition = i;
            this.offsetPosition = i2;
        }

        /* access modifiers changed from: protected */
        public CursorQuery<T2> createQuery() {
            CursorQuery cursorQuery = new CursorQuery(this, this.dao, this.sql, (String[]) this.initialValues.clone(), this.limitPosition, this.offsetPosition);
            return cursorQuery;
        }
    }

    private CursorQuery(QueryData<T> queryData2, AbstractDao<T, ?> abstractDao, String str, String[] strArr, int i, int i2) {
        super(abstractDao, str, strArr, i, i2);
        this.queryData = queryData2;
    }

    static <T2> CursorQuery<T2> create(AbstractDao<T2, ?> abstractDao, String str, Object[] objArr, int i, int i2) {
        QueryData queryData2 = new QueryData(abstractDao, str, toStringArray(objArr), i, i2);
        return (CursorQuery) queryData2.forCurrentThread();
    }

    public static <T2> CursorQuery<T2> internalCreate(AbstractDao<T2, ?> abstractDao, String str, Object[] objArr) {
        return create(abstractDao, str, objArr, -1, -1);
    }

    public CursorQuery forCurrentThread() {
        return (CursorQuery) this.queryData.forCurrentThread(this);
    }

    public Cursor query() {
        checkThread();
        return this.dao.getDatabase().rawQuery(this.sql, this.parameters);
    }

    public /* bridge */ /* synthetic */ void setLimit(int i) {
        super.setLimit(i);
    }

    public /* bridge */ /* synthetic */ void setOffset(int i) {
        super.setOffset(i);
    }

    public CursorQuery<T> setParameter(int i, Boolean bool) {
        return (CursorQuery) super.setParameter(i, bool);
    }

    public CursorQuery<T> setParameter(int i, Object obj) {
        return (CursorQuery) super.setParameter(i, obj);
    }

    public CursorQuery<T> setParameter(int i, Date date) {
        return (CursorQuery) super.setParameter(i, date);
    }
}

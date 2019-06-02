package org.greenrobot.greendao.query;

import android.database.Cursor;
import java.util.Date;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;

public class CountQuery<T> extends AbstractQuery<T> {
    private final QueryData<T> queryData;

    private static final class QueryData<T2> extends AbstractQueryData<T2, CountQuery<T2>> {
        private QueryData(AbstractDao<T2, ?> abstractDao, String str, String[] strArr) {
            super(abstractDao, str, strArr);
        }

        /* access modifiers changed from: protected */
        public CountQuery<T2> createQuery() {
            CountQuery countQuery = new CountQuery(this, this.dao, this.sql, (String[]) this.initialValues.clone());
            return countQuery;
        }
    }

    private CountQuery(QueryData<T> queryData2, AbstractDao<T, ?> abstractDao, String str, String[] strArr) {
        super(abstractDao, str, strArr);
        this.queryData = queryData2;
    }

    static <T2> CountQuery<T2> create(AbstractDao<T2, ?> abstractDao, String str, Object[] objArr) {
        return (CountQuery) new QueryData(abstractDao, str, toStringArray(objArr)).forCurrentThread();
    }

    public long count() {
        checkThread();
        Cursor rawQuery = this.dao.getDatabase().rawQuery(this.sql, this.parameters);
        try {
            if (!rawQuery.moveToNext()) {
                throw new DaoException("No result for count");
            } else if (!rawQuery.isLast()) {
                StringBuilder sb = new StringBuilder();
                sb.append("Unexpected row count: ");
                sb.append(rawQuery.getCount());
                throw new DaoException(sb.toString());
            } else if (rawQuery.getColumnCount() == 1) {
                return rawQuery.getLong(0);
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Unexpected column count: ");
                sb2.append(rawQuery.getColumnCount());
                throw new DaoException(sb2.toString());
            }
        } finally {
            rawQuery.close();
        }
    }

    public CountQuery<T> forCurrentThread() {
        return (CountQuery) this.queryData.forCurrentThread(this);
    }

    public CountQuery<T> setParameter(int i, Boolean bool) {
        return (CountQuery) super.setParameter(i, bool);
    }

    public CountQuery<T> setParameter(int i, Object obj) {
        return (CountQuery) super.setParameter(i, obj);
    }

    public CountQuery<T> setParameter(int i, Date date) {
        return (CountQuery) super.setParameter(i, date);
    }
}

package org.greenrobot.greendao.query;

import org.greenrobot.greendao.AbstractDao;

abstract class AbstractQueryWithLimit<T> extends AbstractQuery<T> {
    protected final int limitPosition;
    protected final int offsetPosition;

    protected AbstractQueryWithLimit(AbstractDao<T, ?> abstractDao, String str, String[] strArr, int i, int i2) {
        super(abstractDao, str, strArr);
        this.limitPosition = i;
        this.offsetPosition = i2;
    }

    public void setLimit(int i) {
        checkThread();
        if (this.limitPosition != -1) {
            this.parameters[this.limitPosition] = Integer.toString(i);
            return;
        }
        throw new IllegalStateException("Limit must be set with QueryBuilder before it can be used here");
    }

    public void setOffset(int i) {
        checkThread();
        if (this.offsetPosition != -1) {
            this.parameters[this.offsetPosition] = Integer.toString(i);
            return;
        }
        throw new IllegalStateException("Offset must be set with QueryBuilder before it can be used here");
    }

    public AbstractQueryWithLimit<T> setParameter(int i, Object obj) {
        if (i < 0 || (i != this.limitPosition && i != this.offsetPosition)) {
            return (AbstractQueryWithLimit) super.setParameter(i, obj);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Illegal parameter index: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }
}

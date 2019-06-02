package org.greenrobot.greendao.query;

import android.database.sqlite.SQLiteDatabase;
import com.android.gallery3d.exif.ExifInterface.GpsTrackRef;
import java.util.ArrayList;
import java.util.List;
import miui.reflect.Field;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.DaoLog;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.internal.SqlUtils;

public class QueryBuilder<T> {
    public static boolean LOG_SQL;
    public static boolean LOG_VALUES;
    private final AbstractDao<T, ?> dao;
    private boolean distinct;
    private final List<Join<T, ?>> joins;
    private Integer limit;
    private Integer offset;
    private StringBuilder orderBuilder;
    private String stringOrderCollation;
    private final String tablePrefix;
    private final List<Object> values;
    private final WhereCollector<T> whereCollector;

    protected QueryBuilder(AbstractDao<T, ?> abstractDao) {
        this(abstractDao, GpsTrackRef.TRUE_DIRECTION);
    }

    protected QueryBuilder(AbstractDao<T, ?> abstractDao, String str) {
        this.dao = abstractDao;
        this.tablePrefix = str;
        this.values = new ArrayList();
        this.joins = new ArrayList();
        this.whereCollector = new WhereCollector<>(abstractDao, str);
        this.stringOrderCollation = " COLLATE NOCASE";
    }

    private <J> Join<T, J> addJoin(String str, Property property, AbstractDao<J, ?> abstractDao, Property property2) {
        StringBuilder sb = new StringBuilder();
        sb.append(Field.LONG_SIGNATURE_PRIMITIVE);
        sb.append(this.joins.size() + 1);
        Join join = new Join(str, property, abstractDao, property2, sb.toString());
        this.joins.add(join);
        return join;
    }

    private void appendJoinsAndWheres(StringBuilder sb, String str) {
        this.values.clear();
        for (Join join : this.joins) {
            sb.append(" JOIN ");
            sb.append('\"');
            sb.append(join.daoDestination.getTablename());
            sb.append('\"');
            sb.append(' ');
            sb.append(join.tablePrefix);
            sb.append(" ON ");
            SqlUtils.appendProperty(sb, join.sourceTablePrefix, join.joinPropertySource).append('=');
            SqlUtils.appendProperty(sb, join.tablePrefix, join.joinPropertyDestination);
        }
        boolean z = !this.whereCollector.isEmpty();
        if (z) {
            sb.append(" WHERE ");
            this.whereCollector.appendWhereClause(sb, str, this.values);
        }
        for (Join join2 : this.joins) {
            if (!join2.whereCollector.isEmpty()) {
                if (!z) {
                    sb.append(" WHERE ");
                    z = true;
                } else {
                    sb.append(" AND ");
                }
                join2.whereCollector.appendWhereClause(sb, join2.tablePrefix, this.values);
            }
        }
    }

    private int checkAddLimit(StringBuilder sb) {
        if (this.limit == null) {
            return -1;
        }
        sb.append(" LIMIT ?");
        this.values.add(this.limit);
        return this.values.size() - 1;
    }

    private int checkAddOffset(StringBuilder sb) {
        if (this.offset == null) {
            return -1;
        }
        if (this.limit != null) {
            sb.append(" OFFSET ?");
            this.values.add(this.offset);
            return this.values.size() - 1;
        }
        throw new IllegalStateException("Offset cannot be set without limit");
    }

    private void checkLog(String str) {
        if (LOG_SQL) {
            StringBuilder sb = new StringBuilder();
            sb.append("Built SQL for query: ");
            sb.append(str);
            DaoLog.d(sb.toString());
        }
        if (LOG_VALUES) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Values for query: ");
            sb2.append(this.values);
            DaoLog.d(sb2.toString());
        }
    }

    private void checkOrderBuilder() {
        if (this.orderBuilder == null) {
            this.orderBuilder = new StringBuilder();
        } else if (this.orderBuilder.length() > 0) {
            this.orderBuilder.append(",");
        }
    }

    private StringBuilder createSelectBuilder() {
        StringBuilder sb = new StringBuilder(SqlUtils.createSqlSelect(this.dao.getTablename(), this.tablePrefix, this.dao.getAllColumns(), this.distinct));
        appendJoinsAndWheres(sb, this.tablePrefix);
        if (this.orderBuilder != null && this.orderBuilder.length() > 0) {
            sb.append(" ORDER BY ");
            sb.append(this.orderBuilder);
        }
        return sb;
    }

    public static <T2> QueryBuilder<T2> internalCreate(AbstractDao<T2, ?> abstractDao) {
        return new QueryBuilder<>(abstractDao);
    }

    private void orderAscOrDesc(String str, Property... propertyArr) {
        for (Property property : propertyArr) {
            checkOrderBuilder();
            append(this.orderBuilder, property);
            if (String.class.equals(property.type) && this.stringOrderCollation != null) {
                this.orderBuilder.append(this.stringOrderCollation);
            }
            this.orderBuilder.append(str);
        }
    }

    public WhereCondition and(WhereCondition whereCondition, WhereCondition whereCondition2, WhereCondition... whereConditionArr) {
        return this.whereCollector.combineWhereConditions(" AND ", whereCondition, whereCondition2, whereConditionArr);
    }

    /* access modifiers changed from: protected */
    public StringBuilder append(StringBuilder sb, Property property) {
        this.whereCollector.checkProperty(property);
        sb.append(this.tablePrefix);
        sb.append('.');
        sb.append('\'');
        sb.append(property.columnName);
        sb.append('\'');
        return sb;
    }

    public Query<T> build() {
        StringBuilder createSelectBuilder = createSelectBuilder();
        int checkAddLimit = checkAddLimit(createSelectBuilder);
        int checkAddOffset = checkAddOffset(createSelectBuilder);
        String sb = createSelectBuilder.toString();
        checkLog(sb);
        return Query.create(this.dao, sb, this.values.toArray(), checkAddLimit, checkAddOffset);
    }

    public CountQuery<T> buildCount() {
        StringBuilder sb = new StringBuilder(SqlUtils.createSqlSelectCountStar(this.dao.getTablename(), this.tablePrefix));
        appendJoinsAndWheres(sb, this.tablePrefix);
        String sb2 = sb.toString();
        checkLog(sb2);
        return CountQuery.create(this.dao, sb2, this.values.toArray());
    }

    public CursorQuery buildCursor() {
        StringBuilder createSelectBuilder = createSelectBuilder();
        int checkAddLimit = checkAddLimit(createSelectBuilder);
        int checkAddOffset = checkAddOffset(createSelectBuilder);
        String sb = createSelectBuilder.toString();
        checkLog(sb);
        return CursorQuery.create(this.dao, sb, this.values.toArray(), checkAddLimit, checkAddOffset);
    }

    public DeleteQuery<T> buildDelete() {
        if (this.joins.isEmpty()) {
            String tablename = this.dao.getTablename();
            StringBuilder sb = new StringBuilder(SqlUtils.createSqlDelete(tablename, null));
            appendJoinsAndWheres(sb, this.tablePrefix);
            String sb2 = sb.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append(this.tablePrefix);
            sb3.append(".\"");
            String sb4 = sb3.toString();
            StringBuilder sb5 = new StringBuilder();
            sb5.append('\"');
            sb5.append(tablename);
            sb5.append("\".\"");
            String replace = sb2.replace(sb4, sb5.toString());
            checkLog(replace);
            return DeleteQuery.create(this.dao, replace, this.values.toArray());
        }
        throw new DaoException("JOINs are not supported for DELETE queries");
    }

    public long count() {
        return buildCount().count();
    }

    public QueryBuilder<T> distinct() {
        this.distinct = true;
        return this;
    }

    public <J> Join<T, J> join(Class<J> cls, Property property) {
        return join(this.dao.getPkProperty(), cls, property);
    }

    public <J> Join<T, J> join(Property property, Class<J> cls) {
        AbstractDao dao2 = this.dao.getSession().getDao(cls);
        return addJoin(this.tablePrefix, property, dao2, dao2.getPkProperty());
    }

    public <J> Join<T, J> join(Property property, Class<J> cls, Property property2) {
        return addJoin(this.tablePrefix, property, this.dao.getSession().getDao(cls), property2);
    }

    public <J> Join<T, J> join(Join<?, T> join, Property property, Class<J> cls, Property property2) {
        return addJoin(join.tablePrefix, property, this.dao.getSession().getDao(cls), property2);
    }

    public QueryBuilder<T> limit(int i) {
        this.limit = Integer.valueOf(i);
        return this;
    }

    public List<T> list() {
        return build().list();
    }

    public CloseableListIterator<T> listIterator() {
        return build().listIterator();
    }

    public LazyList<T> listLazy() {
        return build().listLazy();
    }

    public LazyList<T> listLazyUncached() {
        return build().listLazyUncached();
    }

    public QueryBuilder<T> offset(int i) {
        this.offset = Integer.valueOf(i);
        return this;
    }

    public WhereCondition or(WhereCondition whereCondition, WhereCondition whereCondition2, WhereCondition... whereConditionArr) {
        return this.whereCollector.combineWhereConditions(" OR ", whereCondition, whereCondition2, whereConditionArr);
    }

    public QueryBuilder<T> orderAsc(Property... propertyArr) {
        orderAscOrDesc(" ASC", propertyArr);
        return this;
    }

    public QueryBuilder<T> orderCustom(Property property, String str) {
        checkOrderBuilder();
        append(this.orderBuilder, property).append(' ');
        this.orderBuilder.append(str);
        return this;
    }

    public QueryBuilder<T> orderDesc(Property... propertyArr) {
        orderAscOrDesc(" DESC", propertyArr);
        return this;
    }

    public QueryBuilder<T> orderRaw(String str) {
        checkOrderBuilder();
        this.orderBuilder.append(str);
        return this;
    }

    public QueryBuilder<T> preferLocalizedStringOrder() {
        if (this.dao.getDatabase().getRawDatabase() instanceof SQLiteDatabase) {
            this.stringOrderCollation = " COLLATE LOCALIZED";
        }
        return this;
    }

    public QueryBuilder<T> stringOrderCollation(String str) {
        if (str != null && !str.startsWith(" ")) {
            StringBuilder sb = new StringBuilder();
            sb.append(" ");
            sb.append(str);
            str = sb.toString();
        }
        this.stringOrderCollation = str;
        return this;
    }

    public T unique() {
        return build().unique();
    }

    public T uniqueOrThrow() {
        return build().uniqueOrThrow();
    }

    public QueryBuilder<T> where(WhereCondition whereCondition, WhereCondition... whereConditionArr) {
        this.whereCollector.add(whereCondition, whereConditionArr);
        return this;
    }

    public QueryBuilder<T> whereOr(WhereCondition whereCondition, WhereCondition whereCondition2, WhereCondition... whereConditionArr) {
        this.whereCollector.add(or(whereCondition, whereCondition2, whereConditionArr), new WhereCondition[0]);
        return this;
    }
}

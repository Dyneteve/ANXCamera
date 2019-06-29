package org.greenrobot.greendao.query;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.query.WhereCondition.PropertyCondition;
import org.greenrobot.greendao.query.WhereCondition.StringCondition;

class WhereCollector<T> {
    private final AbstractDao<T, ?> dao;
    private final String tablePrefix;
    private final List<WhereCondition> whereConditions = new ArrayList();

    WhereCollector(AbstractDao<T, ?> abstractDao, String str) {
        this.dao = abstractDao;
        this.tablePrefix = str;
    }

    /* access modifiers changed from: 0000 */
    public void add(WhereCondition whereCondition, WhereCondition... whereConditionArr) {
        checkCondition(whereCondition);
        this.whereConditions.add(whereCondition);
        for (WhereCondition whereCondition2 : whereConditionArr) {
            checkCondition(whereCondition2);
            this.whereConditions.add(whereCondition2);
        }
    }

    /* access modifiers changed from: 0000 */
    public void addCondition(StringBuilder sb, List<Object> list, WhereCondition whereCondition) {
        checkCondition(whereCondition);
        whereCondition.appendTo(sb, this.tablePrefix);
        whereCondition.appendValuesTo(list);
    }

    /* access modifiers changed from: 0000 */
    public void appendWhereClause(StringBuilder sb, String str, List<Object> list) {
        ListIterator listIterator = this.whereConditions.listIterator();
        while (listIterator.hasNext()) {
            if (listIterator.hasPrevious()) {
                sb.append(" AND ");
            }
            WhereCondition whereCondition = (WhereCondition) listIterator.next();
            whereCondition.appendTo(sb, str);
            whereCondition.appendValuesTo(list);
        }
    }

    /* access modifiers changed from: 0000 */
    public void checkCondition(WhereCondition whereCondition) {
        if (whereCondition instanceof PropertyCondition) {
            checkProperty(((PropertyCondition) whereCondition).property);
        }
    }

    /* access modifiers changed from: 0000 */
    public void checkProperty(Property property) {
        if (this.dao != null) {
            Property[] properties = this.dao.getProperties();
            int length = properties.length;
            boolean z = false;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                } else if (property == properties[i]) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
            if (!z) {
                StringBuilder sb = new StringBuilder();
                sb.append("Property '");
                sb.append(property.name);
                sb.append("' is not part of ");
                sb.append(this.dao);
                throw new DaoException(sb.toString());
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public WhereCondition combineWhereConditions(String str, WhereCondition whereCondition, WhereCondition whereCondition2, WhereCondition... whereConditionArr) {
        StringBuilder sb = new StringBuilder("(");
        ArrayList arrayList = new ArrayList();
        addCondition(sb, arrayList, whereCondition);
        sb.append(str);
        addCondition(sb, arrayList, whereCondition2);
        for (WhereCondition whereCondition3 : whereConditionArr) {
            sb.append(str);
            addCondition(sb, arrayList, whereCondition3);
        }
        sb.append(')');
        return new StringCondition(sb.toString(), arrayList.toArray());
    }

    /* access modifiers changed from: 0000 */
    public boolean isEmpty() {
        return this.whereConditions.isEmpty();
    }
}

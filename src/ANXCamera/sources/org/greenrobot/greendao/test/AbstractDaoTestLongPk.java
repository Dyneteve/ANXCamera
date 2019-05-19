package org.greenrobot.greendao.test;

import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoLog;

public abstract class AbstractDaoTestLongPk<D extends AbstractDao<T, Long>, T> extends AbstractDaoTestSinglePk<D, T, Long> {
    public AbstractDaoTestLongPk(Class<D> cls) {
        super(cls);
    }

    /* access modifiers changed from: protected */
    public Long createRandomPk() {
        return Long.valueOf(this.random.nextLong());
    }

    public void testAssignPk() {
        if (this.daoAccess.isEntityUpdateable()) {
            Object createEntity = createEntity(null);
            if (createEntity != null) {
                Object createEntity2 = createEntity(null);
                this.dao.insert(createEntity);
                this.dao.insert(createEntity2);
                Long l = (Long) this.daoAccess.getKey(createEntity);
                assertNotNull(l);
                Long l2 = (Long) this.daoAccess.getKey(createEntity2);
                assertNotNull(l2);
                assertFalse(l.equals(l2));
                assertNotNull(this.dao.load(l));
                assertNotNull(this.dao.load(l2));
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Skipping testAssignPk for ");
            sb.append(this.daoClass);
            sb.append(" (createEntity returned null for null key)");
            DaoLog.d(sb.toString());
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Skipping testAssignPk for not updateable ");
        sb2.append(this.daoClass);
        DaoLog.d(sb2.toString());
    }
}

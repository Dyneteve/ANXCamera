package org.greenrobot.greendao.test;

import org.greenrobot.greendao.AbstractDao;

public abstract class AbstractDaoTestStringPk<D extends AbstractDao<T, String>, T> extends AbstractDaoTestSinglePk<D, T, String> {
    public AbstractDaoTestStringPk(Class<D> cls) {
        super(cls);
    }

    /* access modifiers changed from: protected */
    public String createRandomPk() {
        int nextInt = 1 + this.random.nextInt(30);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < nextInt; i++) {
            sb.append((char) (97 + this.random.nextInt(25)));
        }
        return sb.toString();
    }
}

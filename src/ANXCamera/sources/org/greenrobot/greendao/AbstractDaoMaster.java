package org.greenrobot.greendao;

import java.util.HashMap;
import java.util.Map;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScopeType;
import org.greenrobot.greendao.internal.DaoConfig;

public abstract class AbstractDaoMaster {
    protected final Map<Class<? extends AbstractDao<?, ?>>, DaoConfig> daoConfigMap = new HashMap();
    protected final Database db;
    protected final int schemaVersion;

    public AbstractDaoMaster(Database database, int i) {
        this.db = database;
        this.schemaVersion = i;
    }

    public Database getDatabase() {
        return this.db;
    }

    public int getSchemaVersion() {
        return this.schemaVersion;
    }

    public abstract AbstractDaoSession newSession();

    public abstract AbstractDaoSession newSession(IdentityScopeType identityScopeType);

    /* access modifiers changed from: protected */
    public void registerDaoClass(Class<? extends AbstractDao<?, ?>> cls) {
        this.daoConfigMap.put(cls, new DaoConfig(this.db, cls));
    }
}

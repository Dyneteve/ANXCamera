package com.android.camera.db;

import com.android.camera.db.item.DbItemSaveTask;
import com.android.camera.db.provider.DbProvider;
import com.android.camera.db.provider.DbProviderMgr;

public class DbRepository {
    private DbProviderMgr dbProviderMgr;

    private static class DbRepositoryContainer {
        /* access modifiers changed from: private */
        public static DbRepository sInstance = new DbRepository();

        private DbRepositoryContainer() {
        }
    }

    private DbRepository() {
        this.dbProviderMgr = new DbProviderMgr();
    }

    public static DbItemSaveTask dbItemSaveTask() {
        return (DbItemSaveTask) provider().dbItemSaveTask();
    }

    public static DbRepository getInstance() {
        return DbRepositoryContainer.sInstance;
    }

    public static DbProvider provider() {
        return getInstance().dbProviderMgr.provider();
    }
}

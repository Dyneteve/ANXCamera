package com.android.camera.db;

import android.content.Context;
import com.android.camera.CameraAppImpl;
import com.android.camera.db.greendao.DaoMaster;
import com.android.camera.db.greendao.DaoMaster.DevOpenHelper;
import com.android.camera.db.greendao.DaoSession;

public class DbContainer {
    private static DbContainer dbContainer;
    private Context context;
    private DaoMaster daoMaster;
    private DaoSession daoSession;

    private DbContainer(Context context2) {
        this.context = context2;
    }

    private void clear() {
        if (this.daoSession != null) {
            this.daoSession.clear();
            this.daoSession = null;
        }
        if (this.daoMaster != null) {
            this.daoMaster = null;
        }
    }

    public static DbContainer getInstance() {
        return dbContainer;
    }

    public static final void init(Context context2) {
        if (dbContainer == null) {
            dbContainer = new DbContainer(context2);
        }
    }

    public static void release() {
        if (dbContainer != null) {
            dbContainer.clear();
            dbContainer = null;
        }
    }

    public DaoMaster getDaoMaster() {
        if (this.daoMaster == null) {
            if (this.context == null) {
                this.context = CameraAppImpl.getAndroidContext();
            }
            DevOpenHelper devOpenHelper = new DevOpenHelper(this.context, "camera.db", null);
            devOpenHelper.setLoadSQLCipherNativeLibs(false);
            this.daoMaster = new DaoMaster(devOpenHelper.getWritableDb());
        }
        return this.daoMaster;
    }

    public DaoSession getDaoSession() {
        if (this.daoSession == null) {
            this.daoMaster = getDaoMaster();
            this.daoSession = this.daoMaster.newSession();
        }
        return this.daoSession;
    }
}

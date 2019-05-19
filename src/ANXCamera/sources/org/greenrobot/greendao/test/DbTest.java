package org.greenrobot.greendao.test;

import android.app.Application;
import android.app.Instrumentation;
import android.database.sqlite.SQLiteDatabase;
import android.test.AndroidTestCase;
import java.util.Random;
import org.greenrobot.greendao.DaoLog;
import org.greenrobot.greendao.DbUtils;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.StandardDatabase;

public abstract class DbTest extends AndroidTestCase {
    public static final String DB_NAME = "greendao-unittest-db.temp";
    private Application application;
    protected Database db;
    protected final boolean inMemory;
    protected final Random random;

    public DbTest() {
        this(true);
    }

    public DbTest(boolean z) {
        this.inMemory = z;
        this.random = new Random();
    }

    public <T extends Application> T createApplication(Class<T> cls) {
        assertNull("Application already created", this.application);
        try {
            T newApplication = Instrumentation.newApplication(cls, getContext());
            newApplication.onCreate();
            this.application = newApplication;
            return newApplication;
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Could not create application ");
            sb.append(cls);
            throw new RuntimeException(sb.toString(), e);
        }
    }

    /* access modifiers changed from: protected */
    public Database createDatabase() {
        SQLiteDatabase sQLiteDatabase;
        if (this.inMemory) {
            sQLiteDatabase = SQLiteDatabase.create(null);
        } else {
            getContext().deleteDatabase(DB_NAME);
            sQLiteDatabase = getContext().openOrCreateDatabase(DB_NAME, 0, null);
        }
        return new StandardDatabase(sQLiteDatabase);
    }

    public <T extends Application> T getApplication() {
        assertNotNull("Application not yet created", this.application);
        return this.application;
    }

    /* access modifiers changed from: protected */
    public void logTableDump(String str) {
        if (this.db instanceof StandardDatabase) {
            DbUtils.logTableDump(((StandardDatabase) this.db).getSQLiteDatabase(), str);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Table dump unsupported for ");
        sb.append(this.db);
        DaoLog.w(sb.toString());
    }

    /* access modifiers changed from: protected */
    public void setUp() throws Exception {
        DbTest.super.setUp();
        this.db = createDatabase();
    }

    /* access modifiers changed from: protected */
    public void tearDown() throws Exception {
        if (this.application != null) {
            terminateApplication();
        }
        this.db.close();
        if (!this.inMemory) {
            getContext().deleteDatabase(DB_NAME);
        }
        DbTest.super.tearDown();
    }

    public void terminateApplication() {
        assertNotNull("Application not yet created", this.application);
        this.application.onTerminate();
        this.application = null;
    }
}

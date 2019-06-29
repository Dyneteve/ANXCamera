package com.bytedance.frameworks.baselib.log;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.text.TextUtils;

class LogDBHelper {
    static final String COL_ID = "_id";
    static final String COL_RETRY_COUNT = "retry_count";
    static final String COL_RETRY_TIME = "retry_time";
    static final String COL_TIMESTAMP = "timestamp";
    static final String COL_TYPE = "type";
    static final String COL_VALUE = "value";
    static final String DB_NAME = "lib_log_queue.db";
    static final int DB_VERSION = 1;
    static final String[] QUEUE_COLS = {"_id", COL_VALUE, "type", COL_TIMESTAMP, COL_RETRY_COUNT, COL_RETRY_TIME};
    static final String TABLE_QUEUE = "queue";
    static final String createTableQueue = "CREATE TABLE queue ( _id INTEGER PRIMARY KEY AUTOINCREMENT, value BLOB, type TEXT, timestamp INTEGER, retry_count INTEGER, retry_time INTEGER )";
    private static LogDBHelper sInstance = null;
    private static final String whereId = "_id = ?";
    private SQLiteDatabase mDb;

    private static class OpenHelper extends SQLiteOpenHelper {
        public OpenHelper(Context context) {
            super(context, LogDBHelper.DB_NAME, null, 1);
        }

        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            try {
                sQLiteDatabase.execSQL(LogDBHelper.createTableQueue);
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("create db exception ");
                sb.append(e);
                LogQueue.log(sb.toString());
            }
        }

        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    private LogDBHelper(Context context) {
        if (context != null) {
            try {
                this.mDb = new OpenHelper(context.getApplicationContext()).getWritableDatabase();
            } catch (Throwable th) {
            }
        }
    }

    static LogDBHelper getInstance(Context context) {
        if (sInstance == null) {
            synchronized (LogDBHelper.class) {
                if (sInstance == null) {
                    sInstance = new LogDBHelper(context);
                }
            }
        }
        return sInstance;
    }

    static void safeCloseCursor(Cursor cursor) {
        if (cursor != null) {
            try {
                if (!cursor.isClosed()) {
                    cursor.close();
                }
            } catch (Exception e) {
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void cleanExpireLog(String str, int i, long j) {
        String[] strArr;
        String str2;
        if (isOpen()) {
            long currentTimeMillis = System.currentTimeMillis() - j;
            if (TextUtils.isEmpty(str)) {
                str2 = "timestamp <= ? ";
                strArr = new String[]{String.valueOf(currentTimeMillis)};
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("(timestamp <= ? OR retry_count > ");
                sb.append(i);
                sb.append(") and ");
                sb.append("type");
                sb.append(" = ?");
                String sb2 = sb.toString();
                String[] strArr2 = {String.valueOf(currentTimeMillis), str};
                str2 = sb2;
                strArr = strArr2;
            }
            try {
                this.mDb.delete(TABLE_QUEUE, str2, strArr);
            } catch (Exception e) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("delete expire log error:");
                sb3.append(e);
                LogQueue.log(sb3.toString());
            }
        } else {
            return;
        }
        return;
    }

    /* access modifiers changed from: 0000 */
    public synchronized void closeDatabase() {
        try {
            if (isOpen()) {
                this.mDb.close();
                this.mDb = null;
            }
        } catch (Throwable th) {
            StringBuilder sb = new StringBuilder();
            sb.append("closeDatabase error: ");
            sb.append(th);
            LogQueue.log(sb.toString());
        }
        return;
    }

    /* access modifiers changed from: 0000 */
    public synchronized long getEventCount(String str) {
        long j = 0;
        if (!isOpen()) {
            return 0;
        }
        Cursor cursor = null;
        String str2 = "select count(*) from queue";
        try {
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(" ");
                sb.append(str);
                str2 = sb.toString();
            }
            Cursor rawQuery = this.mDb.rawQuery(str2, null);
            try {
                if (rawQuery.moveToNext()) {
                    j = rawQuery.getLong(0);
                }
                safeCloseCursor(rawQuery);
            } catch (Throwable th) {
                Throwable th2 = th;
                cursor = rawQuery;
                th = th2;
                safeCloseCursor(cursor);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            safeCloseCursor(cursor);
            throw th;
        }
    }

    /* JADX WARNING: type inference failed for: r1v0 */
    /* JADX WARNING: type inference failed for: r1v1, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r1v2, types: [com.bytedance.frameworks.baselib.log.LogItem] */
    /* JADX WARNING: type inference failed for: r2v0 */
    /* JADX WARNING: type inference failed for: r1v3, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r1v4 */
    /* JADX WARNING: type inference failed for: r2v1 */
    /* JADX WARNING: type inference failed for: r12v5, types: [android.database.Cursor] */
    /* JADX WARNING: type inference failed for: r2v3 */
    /* JADX WARNING: type inference failed for: r1v5 */
    /* JADX WARNING: type inference failed for: r2v4 */
    /* JADX WARNING: type inference failed for: r1v6 */
    /* JADX WARNING: type inference failed for: r1v7 */
    /* JADX WARNING: type inference failed for: r2v6, types: [com.bytedance.frameworks.baselib.log.LogItem] */
    /* JADX WARNING: type inference failed for: r1v8 */
    /* JADX WARNING: type inference failed for: r1v9 */
    /* JADX WARNING: type inference failed for: r1v10 */
    /* JADX WARNING: type inference failed for: r2v7 */
    /* JADX WARNING: type inference failed for: r1v11 */
    /* JADX WARNING: type inference failed for: r2v8 */
    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x005d, code lost:
        r13 = e;
        r2 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0063, code lost:
        r13 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0064, code lost:
        r1 = r12;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v3
  assigns: []
  uses: []
  mth insns count: 63
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0063 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:10:0x0028] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:35:0x0089=Splitter:B:35:0x0089, B:18:0x005f=Splitter:B:18:0x005f} */
    /* JADX WARNING: Unknown variable types count: 8 */
    public synchronized LogItem getLog(long j) {
        ? r1;
        ? r2;
        ? r12;
        ? r13 = 0;
        if (!isOpen()) {
            return null;
        }
        try {
            ? query = this.mDb.query(TABLE_QUEUE, QUEUE_COLS, "_id > ?", new String[]{String.valueOf(j)}, null, null, "_id ASC", "1");
            try {
                if (query.moveToNext()) {
                    ? logItem = new LogItem();
                    logItem.id = query.getLong(0);
                    logItem.value = query.getBlob(1);
                    logItem.type = query.getString(2);
                    logItem.timestamp = query.getLong(3);
                    logItem.retry_count = query.getInt(4);
                    logItem.retry_time = query.getLong(5);
                    r13 = logItem;
                }
                safeCloseCursor(query);
                r1 = r13;
            } catch (Exception e) {
                e = e;
                ? r22 = 0;
                r12 = query;
                r2 = r22;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getLog exception ");
                    sb.append(e);
                    LogQueue.log(sb.toString());
                    safeCloseCursor(r12);
                    r1 = r2;
                    return r1;
                } catch (Throwable th) {
                    th = th;
                    ? r14 = r12;
                    safeCloseCursor(r14);
                    throw th;
                }
            } catch (Throwable th2) {
            }
        } catch (Exception e2) {
            e = e2;
            r2 = 0;
            r12 = r13;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("getLog exception ");
            sb2.append(e);
            LogQueue.log(sb2.toString());
            safeCloseCursor(r12);
            r1 = r2;
            return r1;
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized long insertLog(String str, byte[] bArr) {
        if (isOpen() && bArr != null) {
            if (bArr.length > 0) {
                ContentValues contentValues = new ContentValues();
                contentValues.put(COL_VALUE, bArr);
                contentValues.put("type", str);
                contentValues.put(COL_TIMESTAMP, Long.valueOf(System.currentTimeMillis()));
                contentValues.put(COL_RETRY_COUNT, Integer.valueOf(0));
                contentValues.put(COL_RETRY_TIME, Long.valueOf(0));
                return this.mDb.insert(TABLE_QUEUE, null, contentValues);
            }
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public synchronized boolean isOpen() {
        if (this.mDb != null && this.mDb.isOpen()) {
            return true;
        }
        LogQueue.log("db not establish and open");
        return false;
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00d2, code lost:
        return false;
     */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00ae A[SYNTHETIC, Splitter:B:46:0x00ae] */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x00cf A[DONT_GENERATE] */
    public synchronized boolean onLogSent(long j, boolean z, long j2, int i) {
        long j3 = j;
        synchronized (this) {
            if (isOpen()) {
                if (j3 > 0) {
                    boolean z2 = true;
                    String[] strArr = {String.valueOf(j)};
                    if (!z) {
                        Cursor cursor = null;
                        try {
                            Cursor cursor2 = this.mDb.query(TABLE_QUEUE, new String[]{COL_TIMESTAMP, COL_RETRY_COUNT}, whereId, strArr, null, null, null);
                            try {
                                if (!cursor2.moveToNext()) {
                                    safeCloseCursor(cursor2);
                                    return false;
                                }
                                long j4 = cursor2.getLong(0);
                                int i2 = cursor2.getInt(1);
                                long currentTimeMillis = System.currentTimeMillis();
                                if (currentTimeMillis - j4 >= j2 || i2 >= i) {
                                    safeCloseCursor(cursor2);
                                } else {
                                    ContentValues contentValues = new ContentValues();
                                    contentValues.put(COL_RETRY_COUNT, Integer.valueOf(i2 + 1));
                                    contentValues.put(COL_RETRY_TIME, Long.valueOf(currentTimeMillis));
                                    this.mDb.update(TABLE_QUEUE, contentValues, whereId, strArr);
                                    safeCloseCursor(cursor2);
                                    return true;
                                }
                            } catch (Exception e) {
                                e = e;
                                cursor = cursor2;
                                try {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("onLogSent exception: ");
                                    sb.append(e);
                                    LogQueue.log(sb.toString());
                                    safeCloseCursor(cursor);
                                    z2 = false;
                                    if (!z2) {
                                    }
                                } catch (Throwable th) {
                                    th = th;
                                    cursor2 = cursor;
                                    safeCloseCursor(cursor2);
                                    throw th;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                safeCloseCursor(cursor2);
                                throw th;
                            }
                        } catch (Exception e2) {
                            e = e2;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("onLogSent exception: ");
                            sb2.append(e);
                            LogQueue.log(sb2.toString());
                            safeCloseCursor(cursor);
                            z2 = false;
                            if (!z2) {
                            }
                        }
                    }
                    if (!z2) {
                        return false;
                    }
                    try {
                        this.mDb.delete(TABLE_QUEUE, whereId, strArr);
                    } catch (Throwable th3) {
                    }
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("delete app_log: ");
                    sb3.append(j3);
                    LogQueue.log(sb3.toString());
                    return false;
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public synchronized void recreateTableQueue() {
        if (isOpen()) {
            try {
                this.mDb.execSQL("DROP TABLE IF EXISTS queue");
                this.mDb.execSQL(createTableQueue);
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("recreateTableQueue db exception ");
                sb.append(e);
                LogQueue.log(sb.toString());
            }
        } else {
            return;
        }
        return;
    }
}

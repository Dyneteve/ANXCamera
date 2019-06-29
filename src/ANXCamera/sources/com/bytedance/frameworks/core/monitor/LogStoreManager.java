package com.bytedance.frameworks.core.monitor;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.support.v4.media.session.PlaybackStateCompat;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.frameworks.core.monitor.config.MonitorConfigure;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class LogStoreManager {
    static final String[] LOCAL_MONITOR_COLS = {"_id", DBHelper.COL_VERSION_ID, "data"};
    static final String[] LOCAL_VERSION_COLS = {"_id", "version_code", DBHelper.COL_VERSION_NAME, DBHelper.COL_MANIFEST_VERSION_CODE, DBHelper.COL_UPDATE_VERSION_CODE};
    private static final String ORDER_BY_ID_ASC = "_id ASC ";
    static final String[] SAMPLE_LOG_COLS = {"_id", "type", DBHelper.COL_VERSION_ID, "data"};
    private static String SQL_GET_SAMPLED_COUNT = "SELECT count(*) from local_monitor_log WHERE is_sampled = 1";
    private static String SQL_GET_TOTAL_COUNT = "SELECT count(*) FROM local_monitor_log";
    private static final String TAG = "LogStoreManager";
    static final int WEED_OUT_ROWS_SINGLE_TIME = 1000;
    private static final Object mLock = new Object();
    private static HashMap<String, LogStoreManager> sLogStoreManagerMap = new HashMap<>();
    static long sMaxLogSaveCount = 40000;
    private String mAid;
    private SQLiteDatabase mDb;
    private volatile long totalRowCount = -1;

    public LogStoreManager(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("LogStoreManager: ");
        sb.append(str);
        sb.append(" , threadName: ");
        sb.append(Thread.currentThread().getName());
        Log.d("monitorlib", sb.toString());
        try {
            DBHelper dBHelper = new DBHelper(context, str);
            this.mAid = str;
            this.mDb = dBHelper.getWritableDatabase();
        } catch (Throwable th) {
            Log.i(TAG, "monitor DB build failed");
        }
    }

    private synchronized void closeDatabase() {
        try {
            if (this.mDb != null && this.mDb.isOpen()) {
                this.mDb.close();
                this.mDb = null;
            }
        } catch (Throwable th) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mDb close error:");
            sb.append(th);
            Log.e(str, sb.toString());
        }
        return;
    }

    protected static void safeCloseCursor(Cursor cursor) {
        if (cursor != null) {
            try {
                if (!cursor.isClosed()) {
                    cursor.close();
                }
            } catch (Exception e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("cursor close error:");
                sb.append(e);
                Log.e(str, sb.toString());
            }
        }
    }

    private void setMaxLogSaveCount(long j) {
        if (j <= 0) {
            sMaxLogSaveCount = 40000;
        } else {
            sMaxLogSaveCount = j;
        }
    }

    private synchronized void weedOutLogIfNeed(long j) {
        if (this.totalRowCount <= 0) {
            this.totalRowCount = getLogTotalCount();
        }
        if (this.totalRowCount + j >= sMaxLogSaveCount) {
            weedOutOldLogs(1000);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x002f, code lost:
        return;
     */
    private synchronized void weedOutVersionTableIfNeed() {
        if (this.mDb != null) {
            Cursor query = this.mDb.query("local_monitor_log", new String[]{DBHelper.COL_VERSION_ID}, null, null, null, null, ORDER_BY_ID_ASC, "1");
            if (query != null && query.moveToNext()) {
                weedOutVersionTable(query.getLong(0));
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0027, code lost:
        return;
     */
    public synchronized void cleanExpiredLog(long j) {
        if (this.mDb != null && j >= 0) {
            try {
                this.mDb.delete("local_monitor_log", "create_time< ? ", new String[]{String.valueOf(j)});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }

    public void closeDB() {
        synchronized (mLock) {
            closeDatabase();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0032, code lost:
        return -1;
     */
    public synchronized int deleteLocalLogByIds(String str) {
        int i;
        i = -1;
        if (this.mDb != null && !TextUtils.isEmpty(str)) {
            try {
                SQLiteDatabase sQLiteDatabase = this.mDb;
                StringBuilder sb = new StringBuilder();
                sb.append("delete from local_monitor_log where _id in ( ");
                sb.append(str);
                sb.append(" )");
                sQLiteDatabase.execSQL(sb.toString());
                i = 1;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    public String getAid() {
        return this.mAid;
    }

    public int getDBJournalSizeInKB() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mDb.getPath());
        sb.append("-journal");
        File file = new File(sb.toString());
        if (file.exists()) {
            return ((int) file.length()) / 1024;
        }
        return -1;
    }

    public int getDBSizeInMB() {
        File file = new File(this.mDb.getPath());
        if (file.exists()) {
            return (int) ((file.length() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID) / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
        }
        return -1;
    }

    public synchronized LocalVersionInfo getLatestLocalVersion() {
        Cursor cursor;
        Throwable th;
        try {
            cursor = this.mDb.query("local_monitor_version", LOCAL_VERSION_COLS, null, null, null, null, "_id DESC", String.valueOf(1));
            try {
                if (cursor.getCount() == 0) {
                    safeCloseCursor(cursor);
                    return null;
                } else if (cursor.moveToNext()) {
                    LocalVersionInfo localVersionInfo = new LocalVersionInfo(cursor.getLong(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4));
                    safeCloseCursor(cursor);
                    return localVersionInfo;
                } else {
                    safeCloseCursor(cursor);
                }
            } catch (Throwable th2) {
                th = th2;
                safeCloseCursor(cursor);
                throw th;
            }
        } catch (Throwable th3) {
            Throwable th4 = th3;
            cursor = null;
            th = th4;
            safeCloseCursor(cursor);
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0093 A[Catch:{ Throwable -> 0x00d1, all -> 0x00ce }] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x009c A[SYNTHETIC, Splitter:B:27:0x009c] */
    public synchronized List<LocalLog> getLocalLog(long j, long j2, List<String> list, String str) {
        String[] strArr;
        Cursor query;
        List<String> list2 = list;
        synchronized (this) {
            if (this.mDb == null) {
                List<LocalLog> emptyList = Collections.emptyList();
                return emptyList;
            }
            Cursor cursor = null;
            String str2 = "create_time >=? AND create_time <=? ";
            if (list2 != null) {
                try {
                    if (list.size() > 0) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(str2);
                        sb.append(" AND type2 IN ( ");
                        sb.append(TextUtils.join(",", Collections.nCopies(list.size(), "?")));
                        sb.append(" )");
                        str2 = sb.toString();
                        strArr = new String[(list.size() + 2)];
                        strArr[0] = String.valueOf(j);
                        strArr[1] = String.valueOf(j2);
                        for (int i = 0; i < list.size(); i++) {
                            strArr[i + 2] = (String) list2.get(i);
                        }
                        query = this.mDb.query("local_monitor_log", LOCAL_MONITOR_COLS, str2, strArr, null, null, ORDER_BY_ID_ASC, str);
                        if (query.getCount() != 0) {
                            List<LocalLog> emptyList2 = Collections.emptyList();
                            safeCloseCursor(query);
                            return emptyList2;
                        }
                        LinkedList linkedList = new LinkedList();
                        while (query.moveToNext()) {
                            long j3 = query.getLong(0);
                            long j4 = query.getLong(1);
                            linkedList.add(new LocalLog().setVersionId(j4).setData(query.getString(2)).setId(j3));
                        }
                        safeCloseCursor(query);
                        return linkedList;
                    }
                } catch (Throwable th) {
                    th = th;
                    String str3 = TAG;
                    try {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("obtain monitor logs failed:");
                        sb2.append(th.toString());
                        Log.e(str3, sb2.toString());
                        safeCloseCursor(cursor);
                        List<LocalLog> emptyList3 = Collections.emptyList();
                        return emptyList3;
                    } catch (Throwable th2) {
                        th = th2;
                        safeCloseCursor(cursor);
                        throw th;
                    }
                }
            }
            strArr = new String[]{String.valueOf(j), String.valueOf(j2)};
            query = this.mDb.query("local_monitor_log", LOCAL_MONITOR_COLS, str2, strArr, null, null, ORDER_BY_ID_ASC, str);
            try {
                if (query.getCount() != 0) {
                }
            } catch (Throwable th3) {
                th = th3;
                cursor = query;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    public synchronized LocalVersionInfo getLocalVersionById(long j) {
        Cursor cursor;
        Cursor cursor2 = null;
        try {
            cursor = this.mDb.query("local_monitor_version", LOCAL_VERSION_COLS, " _id = ?", new String[]{String.valueOf(j)}, null, null, "_id DESC", String.valueOf(1));
            try {
                if (cursor.getCount() == 0) {
                    safeCloseCursor(cursor);
                    return null;
                } else if (cursor.moveToNext()) {
                    LocalVersionInfo localVersionInfo = new LocalVersionInfo(cursor.getLong(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4));
                    safeCloseCursor(cursor);
                    return localVersionInfo;
                } else {
                    safeCloseCursor(cursor);
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
    }

    /* JADX WARNING: Code restructure failed: missing block: B:31:0x004f, code lost:
        return -1;
     */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:23:0x0043=Splitter:B:23:0x0043, B:14:0x0037=Splitter:B:14:0x0037} */
    public synchronized long getLogCountInTime(long j, long j2) {
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                Cursor rawQuery = this.mDb.rawQuery("SELECT count(*) FROM local_monitor_log WHERE create_time >= ? AND create_time <= ?", new String[]{String.valueOf(j), String.valueOf(j2)});
                try {
                    long j3 = rawQuery.moveToNext() ? rawQuery.getLong(0) : -1;
                    safeCloseCursor(rawQuery);
                    return j3;
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return -1;
                } catch (Throwable th) {
                    th = th;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return -1;
            } catch (Throwable th2) {
                th = th2;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0097 A[Catch:{ Throwable -> 0x00d0, all -> 0x00cd }] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00a0 A[SYNTHETIC, Splitter:B:27:0x00a0] */
    public synchronized List<LocalLog> getLogSampled(List<String> list, int i) {
        String[] strArr;
        Cursor query;
        List<String> list2 = list;
        synchronized (this) {
            if (this.mDb == null) {
                List<LocalLog> emptyList = Collections.emptyList();
                return emptyList;
            }
            Cursor cursor = null;
            String str = "is_sampled = ? ";
            if (list2 != null) {
                try {
                    if (list.size() > 0) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(str);
                        sb.append(" AND type IN ( ");
                        sb.append(TextUtils.join(",", Collections.nCopies(list.size(), "?")));
                        sb.append(" ) ");
                        str = sb.toString();
                        strArr = new String[(list.size() + 1)];
                        strArr[0] = String.valueOf(1);
                        int i2 = 0;
                        while (i2 < list.size()) {
                            int i3 = i2 + 1;
                            strArr[i3] = (String) list2.get(i2);
                            i2 = i3;
                        }
                        String str2 = str;
                        String[] strArr2 = strArr;
                        String[] strArr3 = SAMPLE_LOG_COLS;
                        String str3 = ORDER_BY_ID_ASC;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(i);
                        sb2.append("");
                        query = this.mDb.query("local_monitor_log", strArr3, str2, strArr2, null, null, str3, sb2.toString());
                        if (query.getCount() != 0) {
                            List<LocalLog> emptyList2 = Collections.emptyList();
                            safeCloseCursor(query);
                            return emptyList2;
                        }
                        LinkedList linkedList = new LinkedList();
                        while (query.moveToNext()) {
                            LocalLog localLog = new LocalLog(query.getLong(0), query.getString(1), query.getLong(2), query.getString(3));
                            linkedList.add(localLog);
                        }
                        safeCloseCursor(query);
                        return linkedList;
                    }
                } catch (Throwable th) {
                    th = th;
                    try {
                        th.printStackTrace();
                        String str4 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("obtain monitor logs failed:");
                        sb3.append(th.toString());
                        Log.e(str4, sb3.toString());
                        safeCloseCursor(cursor);
                        List<LocalLog> emptyList3 = Collections.emptyList();
                        return emptyList3;
                    } catch (Throwable th2) {
                        th = th2;
                        safeCloseCursor(cursor);
                        throw th;
                    }
                }
            }
            strArr = new String[]{String.valueOf(1)};
            String str22 = str;
            String[] strArr22 = strArr;
            String[] strArr32 = SAMPLE_LOG_COLS;
            String str32 = ORDER_BY_ID_ASC;
            StringBuilder sb22 = new StringBuilder();
            sb22.append(i);
            sb22.append("");
            query = this.mDb.query("local_monitor_log", strArr32, str22, strArr22, null, null, str32, sb22.toString());
            try {
                if (query.getCount() != 0) {
                }
            } catch (Throwable th3) {
                th = th3;
                cursor = query;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x003f, code lost:
        return -1;
     */
    public synchronized long getLogSampledCount() {
        long j = -1;
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                Cursor rawQuery = this.mDb.rawQuery(SQL_GET_SAMPLED_COUNT, null);
                try {
                    if (rawQuery.moveToNext()) {
                        j = rawQuery.getLong(0);
                    }
                    safeCloseCursor(rawQuery);
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return j;
                } catch (Throwable th) {
                    th = th;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return j;
            } catch (Throwable th2) {
                th = th2;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0040, code lost:
        return -1;
     */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:23:0x0034=Splitter:B:23:0x0034, B:14:0x0027=Splitter:B:14:0x0027} */
    public synchronized long getLogTotalCount() {
        long j = -1;
        if (this.mDb != null && this.mDb.isOpen()) {
            Cursor cursor = null;
            try {
                Cursor rawQuery = this.mDb.rawQuery(SQL_GET_TOTAL_COUNT, null);
                try {
                    if (rawQuery.moveToNext()) {
                        j = rawQuery.getLong(0);
                    }
                    safeCloseCursor(rawQuery);
                    return j;
                } catch (Exception e) {
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    return -1;
                } catch (Throwable th) {
                    th = th;
                    cursor = rawQuery;
                    safeCloseCursor(cursor);
                    throw th;
                }
            } catch (Exception e2) {
                safeCloseCursor(cursor);
                return -1;
            } catch (Throwable th2) {
                th = th2;
                safeCloseCursor(cursor);
                throw th;
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0060, code lost:
        return r5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0065, code lost:
        return -1;
     */
    public synchronized long insertLocalLog(LocalLog localLog) {
        if (this.mDb != null && localLog != null) {
            try {
                weedOutLogIfNeed(1);
                ContentValues contentValues = new ContentValues();
                contentValues.put("type", localLog.type);
                contentValues.put(DBHelper.COL_TYPE2, localLog.type2);
                contentValues.put(DBHelper.COL_CREATE_TIME, Long.valueOf(localLog.createTime));
                contentValues.put(DBHelper.COL_VERSION_ID, Long.valueOf(localLog.versionId));
                contentValues.put("data", localLog.data);
                contentValues.put(DBHelper.COL_SAMPLED, Integer.valueOf(localLog.isSampled ? 1 : 0));
                long insert = this.mDb.insert("local_monitor_log", null, contentValues);
                if (insert != -1) {
                    this.totalRowCount++;
                }
            } catch (Exception e) {
                return -1;
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00a7, code lost:
        return;
     */
    public synchronized void insertLocalLogBatch(List<LocalLog> list) {
        if (!(this.mDb == null || list == null)) {
            if (list.size() != 0) {
                weedOutLogIfNeed((long) list.size());
                this.mDb.beginTransaction();
                try {
                    SQLiteStatement compileStatement = this.mDb.compileStatement("INSERT INTO local_monitor_log(type, type2, create_time, version_id, data, is_sampled) VALUES ( ?, ?, ?, ?, ?, ?)");
                    for (LocalLog localLog : list) {
                        compileStatement.bindString(1, localLog.type == null ? "" : localLog.type);
                        compileStatement.bindString(2, localLog.type2 == null ? "" : localLog.type2);
                        compileStatement.bindLong(3, localLog.createTime);
                        compileStatement.bindLong(4, localLog.versionId);
                        compileStatement.bindString(5, localLog.data == null ? "" : localLog.data);
                        compileStatement.bindLong(6, localLog.isSampled ? 1 : 0);
                        compileStatement.executeInsert();
                    }
                    this.mDb.setTransactionSuccessful();
                    this.totalRowCount += (long) list.size();
                    try {
                        this.mDb.endTransaction();
                    } catch (Exception e) {
                    }
                } catch (Exception e2) {
                    try {
                        e2.printStackTrace();
                        return;
                    } finally {
                        try {
                            this.mDb.endTransaction();
                        } catch (Exception e3) {
                        }
                    }
                }
            }
        }
    }

    public synchronized long saveLocalVersion(LocalVersionInfo localVersionInfo) {
        if (this.mDb != null) {
            if (localVersionInfo != null) {
                return saveLocalVersion(localVersionInfo.versionCode, localVersionInfo.versionName, localVersionInfo.manifestVersionCode, localVersionInfo.updateVersionCode);
            }
        }
        return -1;
    }

    public synchronized long saveLocalVersion(String str, String str2, String str3, String str4) {
        if (this.mDb == null) {
            return -1;
        }
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("version_code", str);
            contentValues.put(DBHelper.COL_VERSION_NAME, str2);
            contentValues.put(DBHelper.COL_MANIFEST_VERSION_CODE, str3);
            contentValues.put(DBHelper.COL_UPDATE_VERSION_CODE, str4);
            return this.mDb.insert("local_monitor_version", null, contentValues);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void updateConfig() {
        setMaxLogSaveCount(MonitorConfigure.getMaxMonitorLogSaveCount(this.mAid));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0037, code lost:
        return;
     */
    public synchronized void weedOutOldLogs(long j) {
        if (this.mDb != null && j > 0) {
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(" DELETE FROM local_monitor_log WHERE _id IN (SELECT _id FROM local_monitor_log ORDER BY _id ASC LIMIT ");
                sb.append(j);
                sb.append(")");
                this.mDb.execSQL(sb.toString());
                this.totalRowCount -= j;
                weedOutVersionTableIfNeed();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0024, code lost:
        return;
     */
    public synchronized void weedOutVersionTable(long j) {
        if (this.mDb != null && j >= 0) {
            try {
                this.mDb.delete("local_monitor_version", "_id< ? ", new String[]{String.valueOf(j)});
            } catch (Exception e) {
            }
        }
    }
}

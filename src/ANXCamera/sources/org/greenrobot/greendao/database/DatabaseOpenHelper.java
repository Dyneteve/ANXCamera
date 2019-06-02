package org.greenrobot.greendao.database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;

public abstract class DatabaseOpenHelper extends SQLiteOpenHelper {
    private final Context context;
    private boolean loadSQLCipherNativeLibs;
    private final String name;
    private final int version;

    public DatabaseOpenHelper(Context context2, String str, int i) {
        this(context2, str, null, i);
    }

    public DatabaseOpenHelper(Context context2, String str, CursorFactory cursorFactory, int i) {
        super(context2, str, cursorFactory, i);
        this.loadSQLCipherNativeLibs = true;
        this.context = context2;
        this.name = str;
        this.version = i;
    }

    public Database getReadableDb() {
        return wrap(getReadableDatabase());
    }

    public Database getWritableDb() {
        return wrap(getWritableDatabase());
    }

    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        onCreate(wrap(sQLiteDatabase));
    }

    public void onCreate(Database database) {
    }

    public void onOpen(SQLiteDatabase sQLiteDatabase) {
        onOpen(wrap(sQLiteDatabase));
    }

    public void onOpen(Database database) {
    }

    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        onUpgrade(wrap(sQLiteDatabase), i, i2);
    }

    public void onUpgrade(Database database, int i, int i2) {
    }

    public void setLoadSQLCipherNativeLibs(boolean z) {
        this.loadSQLCipherNativeLibs = z;
    }

    /* access modifiers changed from: protected */
    public Database wrap(SQLiteDatabase sQLiteDatabase) {
        return new StandardDatabase(sQLiteDatabase);
    }
}

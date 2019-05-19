package org.greenrobot.greendao.database;

import android.database.sqlite.SQLiteStatement;

public class StandardDatabaseStatement implements DatabaseStatement {
    private final SQLiteStatement delegate;

    public StandardDatabaseStatement(SQLiteStatement sQLiteStatement) {
        this.delegate = sQLiteStatement;
    }

    public void bindBlob(int i, byte[] bArr) {
        this.delegate.bindBlob(i, bArr);
    }

    public void bindDouble(int i, double d) {
        this.delegate.bindDouble(i, d);
    }

    public void bindLong(int i, long j) {
        this.delegate.bindLong(i, j);
    }

    public void bindNull(int i) {
        this.delegate.bindNull(i);
    }

    public void bindString(int i, String str) {
        this.delegate.bindString(i, str);
    }

    public void clearBindings() {
        this.delegate.clearBindings();
    }

    public void close() {
        this.delegate.close();
    }

    public void execute() {
        this.delegate.execute();
    }

    public long executeInsert() {
        return this.delegate.executeInsert();
    }

    public Object getRawStatement() {
        return this.delegate;
    }

    public long simpleQueryForLong() {
        return this.delegate.simpleQueryForLong();
    }
}

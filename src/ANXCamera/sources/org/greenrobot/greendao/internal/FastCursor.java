package org.greenrobot.greendao.internal;

import android.content.ContentResolver;
import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;

public final class FastCursor implements Cursor {
    private final int count;
    private int position;
    private final CursorWindow window;

    public FastCursor(CursorWindow cursorWindow) {
        this.window = cursorWindow;
        this.count = cursorWindow.getNumRows();
    }

    public void close() {
        throw new UnsupportedOperationException();
    }

    public void copyStringToBuffer(int i, CharArrayBuffer charArrayBuffer) {
        throw new UnsupportedOperationException();
    }

    public void deactivate() {
        throw new UnsupportedOperationException();
    }

    public byte[] getBlob(int i) {
        return this.window.getBlob(this.position, i);
    }

    public int getColumnCount() {
        throw new UnsupportedOperationException();
    }

    public int getColumnIndex(String str) {
        throw new UnsupportedOperationException();
    }

    public int getColumnIndexOrThrow(String str) throws IllegalArgumentException {
        throw new UnsupportedOperationException();
    }

    public String getColumnName(int i) {
        throw new UnsupportedOperationException();
    }

    public String[] getColumnNames() {
        throw new UnsupportedOperationException();
    }

    public int getCount() {
        return this.window.getNumRows();
    }

    public double getDouble(int i) {
        return this.window.getDouble(this.position, i);
    }

    public Bundle getExtras() {
        throw new UnsupportedOperationException();
    }

    public float getFloat(int i) {
        return this.window.getFloat(this.position, i);
    }

    public int getInt(int i) {
        return this.window.getInt(this.position, i);
    }

    public long getLong(int i) {
        return this.window.getLong(this.position, i);
    }

    public Uri getNotificationUri() {
        return null;
    }

    public int getPosition() {
        return this.position;
    }

    public short getShort(int i) {
        return this.window.getShort(this.position, i);
    }

    public String getString(int i) {
        return this.window.getString(this.position, i);
    }

    public int getType(int i) {
        throw new UnsupportedOperationException();
    }

    public boolean getWantsAllOnMoveCalls() {
        throw new UnsupportedOperationException();
    }

    public boolean isAfterLast() {
        throw new UnsupportedOperationException();
    }

    public boolean isBeforeFirst() {
        throw new UnsupportedOperationException();
    }

    public boolean isClosed() {
        throw new UnsupportedOperationException();
    }

    public boolean isFirst() {
        return this.position == 0;
    }

    public boolean isLast() {
        return this.position == this.count - 1;
    }

    public boolean isNull(int i) {
        return this.window.isNull(this.position, i);
    }

    public boolean move(int i) {
        return moveToPosition(this.position + i);
    }

    public boolean moveToFirst() {
        this.position = 0;
        return this.count > 0;
    }

    public boolean moveToLast() {
        if (this.count <= 0) {
            return false;
        }
        this.position = this.count - 1;
        return true;
    }

    public boolean moveToNext() {
        if (this.position >= this.count - 1) {
            return false;
        }
        this.position++;
        return true;
    }

    public boolean moveToPosition(int i) {
        if (i < 0 || i >= this.count) {
            return false;
        }
        this.position = i;
        return true;
    }

    public boolean moveToPrevious() {
        if (this.position <= 0) {
            return false;
        }
        this.position--;
        return true;
    }

    public void registerContentObserver(ContentObserver contentObserver) {
        throw new UnsupportedOperationException();
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        throw new UnsupportedOperationException();
    }

    public boolean requery() {
        throw new UnsupportedOperationException();
    }

    public Bundle respond(Bundle bundle) {
        throw new UnsupportedOperationException();
    }

    public void setExtras(Bundle bundle) {
    }

    public void setNotificationUri(ContentResolver contentResolver, Uri uri) {
        throw new UnsupportedOperationException();
    }

    public void unregisterContentObserver(ContentObserver contentObserver) {
        throw new UnsupportedOperationException();
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        throw new UnsupportedOperationException();
    }
}

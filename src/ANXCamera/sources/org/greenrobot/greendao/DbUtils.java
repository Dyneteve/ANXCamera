package org.greenrobot.greendao;

import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.greenrobot.greendao.database.Database;

public class DbUtils {
    public static int copyAllBytes(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[4096];
        int i = 0;
        while (true) {
            int read = inputStream.read(bArr);
            if (read == -1) {
                return i;
            }
            outputStream.write(bArr, 0, read);
            i += read;
        }
    }

    public static int executeSqlScript(Context context, Database database, String str) throws IOException {
        return executeSqlScript(context, database, str, true);
    }

    public static int executeSqlScript(Context context, Database database, String str, boolean z) throws IOException {
        String[] split = new String(readAsset(context, str), "UTF-8").split(";(\\s)*[\n\r]");
        int executeSqlStatementsInTx = z ? executeSqlStatementsInTx(database, split) : executeSqlStatements(database, split);
        StringBuilder sb = new StringBuilder();
        sb.append("Executed ");
        sb.append(executeSqlStatementsInTx);
        sb.append(" statements from SQL script '");
        sb.append(str);
        sb.append("'");
        DaoLog.i(sb.toString());
        return executeSqlStatementsInTx;
    }

    public static int executeSqlStatements(Database database, String[] strArr) {
        int i = 0;
        for (String trim : strArr) {
            String trim2 = trim.trim();
            if (trim2.length() > 0) {
                database.execSQL(trim2);
                i++;
            }
        }
        return i;
    }

    public static int executeSqlStatementsInTx(Database database, String[] strArr) {
        database.beginTransaction();
        try {
            int executeSqlStatements = executeSqlStatements(database, strArr);
            database.setTransactionSuccessful();
            return executeSqlStatements;
        } finally {
            database.endTransaction();
        }
    }

    public static void logTableDump(SQLiteDatabase sQLiteDatabase, String str) {
        Cursor query = sQLiteDatabase.query(str, null, null, null, null, null, null);
        try {
            DaoLog.d(DatabaseUtils.dumpCursorToString(query));
        } finally {
            query.close();
        }
    }

    public static byte[] readAllBytes(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        copyAllBytes(inputStream, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public static byte[] readAsset(Context context, String str) throws IOException {
        InputStream open = context.getResources().getAssets().open(str);
        try {
            return readAllBytes(open);
        } finally {
            open.close();
        }
    }

    public static void vacuum(Database database) {
        database.execSQL("VACUUM");
    }
}

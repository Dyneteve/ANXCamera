package com.android.camera.storage;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Video;
import com.android.camera.log.Log;
import java.io.File;

public class MediaProviderUtil {
    public static final String TAG = "MediaProviderUtil";

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    private MediaProviderUtil() {
    }

    public static Uri getContentUriFromPath(Context context, String str) {
        Throwable th;
        Throwable th2;
        try {
            Cursor query = context.getContentResolver().query(Files.getContentUri("external"), new String[]{"_id", "media_type"}, "_data = ?", new String[]{str}, "");
            try {
                if (query.moveToNext()) {
                    long j = (long) query.getInt(0);
                    int i = query.getInt(1);
                    if (i == 1) {
                        Uri withAppendedId = ContentUris.withAppendedId(Media.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId;
                    } else if (i == 3) {
                        Uri withAppendedId2 = ContentUris.withAppendedId(Video.Media.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId2;
                    } else {
                        Uri withAppendedId3 = ContentUris.withAppendedId(Files.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId3;
                    }
                } else {
                    if (query != null) {
                        $closeResource(null, query);
                    }
                    return null;
                }
            } catch (Throwable th3) {
                Throwable th4 = th3;
                th2 = r9;
                th = th4;
            }
            if (query != null) {
                $closeResource(th2, query);
            }
            throw th;
        } catch (Exception e) {
        }
    }

    private static long getParent(Context context, String str) {
        Cursor query;
        Throwable th;
        try {
            query = context.getContentResolver().query(Files.getContentUri("external"), new String[]{"_id"}, "_data = ?", new String[]{new File(str).getParent()}, "");
            if (query.moveToNext()) {
                long j = query.getLong(0);
                if (query != null) {
                    $closeResource(null, query);
                }
                return j;
            }
            if (query != null) {
                $closeResource(null, query);
            }
            return 0;
        } catch (Exception e) {
        } catch (Throwable th2) {
            if (query != null) {
                $closeResource(th, query);
            }
            throw th2;
        }
    }

    public static Uri insertCameraDirectory(Context context, String str) {
        long parent = getParent(context, str);
        if (parent > 0) {
            return insertDirectory(context, str, parent);
        }
        Uri insertDirectory = insertDirectory(context, new File(str).getParent(), 0);
        if (insertDirectory == null) {
            return null;
        }
        return insertDirectory(context, str, ContentUris.parseId(insertDirectory));
    }

    public static Uri insertDirectory(Context context, String str, long j) {
        Uri contentUri = Files.getContentUri("external");
        ContentValues contentValues = new ContentValues();
        contentValues.put("format", Integer.valueOf(12289));
        contentValues.put("media_type", Integer.valueOf(0));
        contentValues.put("_data", str);
        contentValues.put("parent", Long.valueOf(j));
        File file = new File(str);
        if (file.exists()) {
            contentValues.put("date_modified", Long.valueOf(file.lastModified() / 1000));
        }
        try {
            return context.getContentResolver().insert(contentUri, contentValues);
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("insertDirectory fail, path = ");
            sb.append(str);
            Log.w(str2, sb.toString(), e);
            return null;
        }
    }
}

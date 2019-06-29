package android.support.v4.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.text.TextUtils;
import android.util.Log;

@RequiresApi(19)
class DocumentsContractApi19 {
    private static final int FLAG_VIRTUAL_DOCUMENT = 512;
    private static final String TAG = "DocumentFile";

    private DocumentsContractApi19() {
    }

    public static boolean canRead(Context context, Uri uri) {
        return context.checkCallingOrSelfUriPermission(uri, 1) == 0 && !TextUtils.isEmpty(getRawType(context, uri));
    }

    public static boolean canWrite(Context context, Uri uri) {
        if (context.checkCallingOrSelfUriPermission(uri, 2) != 0) {
            return false;
        }
        String rawType = getRawType(context, uri);
        int queryForInt = queryForInt(context, uri, "flags", 0);
        if (TextUtils.isEmpty(rawType)) {
            return false;
        }
        if ((queryForInt & 4) != 0) {
            return true;
        }
        if (!"vnd.android.document/directory".equals(rawType) || (queryForInt & 8) == 0) {
            return !TextUtils.isEmpty(rawType) && (queryForInt & 2) != 0;
        }
        return true;
    }

    private static void closeQuietly(@Nullable AutoCloseable autoCloseable) {
        if (autoCloseable != null) {
            try {
                autoCloseable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception e2) {
            }
        }
    }

    public static boolean exists(Context context, Uri uri) {
        ContentResolver contentResolver = context.getContentResolver();
        boolean z = false;
        Cursor cursor = null;
        try {
            Cursor query = contentResolver.query(uri, new String[]{"document_id"}, null, null, null);
            try {
                if (query.getCount() > 0) {
                    z = true;
                }
                closeQuietly(query);
                return z;
            } catch (Exception e) {
                e = e;
                cursor = query;
                String str = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed query: ");
                    sb.append(e);
                    Log.w(str, sb.toString());
                    closeQuietly(cursor);
                    return false;
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(cursor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                cursor = query;
                closeQuietly(cursor);
                throw th;
            }
        } catch (Exception e2) {
            e = e2;
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str2, sb2.toString());
            closeQuietly(cursor);
            return false;
        }
    }

    public static long getFlags(Context context, Uri uri) {
        return queryForLong(context, uri, "flags", 0);
    }

    @Nullable
    public static String getName(Context context, Uri uri) {
        return queryForString(context, uri, "_display_name", null);
    }

    @Nullable
    private static String getRawType(Context context, Uri uri) {
        return queryForString(context, uri, "mime_type", null);
    }

    @Nullable
    public static String getType(Context context, Uri uri) {
        String rawType = getRawType(context, uri);
        if ("vnd.android.document/directory".equals(rawType)) {
            return null;
        }
        return rawType;
    }

    public static boolean isDirectory(Context context, Uri uri) {
        return "vnd.android.document/directory".equals(getRawType(context, uri));
    }

    public static boolean isFile(Context context, Uri uri) {
        String rawType = getRawType(context, uri);
        return !"vnd.android.document/directory".equals(rawType) && !TextUtils.isEmpty(rawType);
    }

    public static boolean isVirtual(Context context, Uri uri) {
        boolean z = false;
        if (!DocumentsContract.isDocumentUri(context, uri)) {
            return false;
        }
        if ((getFlags(context, uri) & 512) != 0) {
            z = true;
        }
        return z;
    }

    public static long lastModified(Context context, Uri uri) {
        return queryForLong(context, uri, "last_modified", 0);
    }

    public static long length(Context context, Uri uri) {
        return queryForLong(context, uri, "_size", 0);
    }

    private static int queryForInt(Context context, Uri uri, String str, int i) {
        return (int) queryForLong(context, uri, str, (long) i);
    }

    private static long queryForLong(Context context, Uri uri, String str, long j) {
        Cursor cursor = null;
        try {
            Cursor query = context.getContentResolver().query(uri, new String[]{str}, null, null, null);
            try {
                if (!query.moveToFirst() || query.isNull(0)) {
                    closeQuietly(query);
                    return j;
                }
                long j2 = query.getLong(0);
                closeQuietly(query);
                return j2;
            } catch (Exception e) {
                e = e;
                cursor = query;
                String str2 = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed query: ");
                    sb.append(e);
                    Log.w(str2, sb.toString());
                    closeQuietly(cursor);
                    return j;
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(cursor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                cursor = query;
                closeQuietly(cursor);
                throw th;
            }
        } catch (Exception e2) {
            e = e2;
            String str22 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str22, sb2.toString());
            closeQuietly(cursor);
            return j;
        }
    }

    @Nullable
    private static String queryForString(Context context, Uri uri, String str, @Nullable String str2) {
        Cursor cursor = null;
        try {
            Cursor query = context.getContentResolver().query(uri, new String[]{str}, null, null, null);
            try {
                if (!query.moveToFirst() || query.isNull(0)) {
                    closeQuietly(query);
                    return str2;
                }
                String string = query.getString(0);
                closeQuietly(query);
                return string;
            } catch (Exception e) {
                e = e;
                cursor = query;
                String str3 = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed query: ");
                    sb.append(e);
                    Log.w(str3, sb.toString());
                    closeQuietly(cursor);
                    return str2;
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(cursor);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                cursor = query;
                closeQuietly(cursor);
                throw th;
            }
        } catch (Exception e2) {
            e = e2;
            String str32 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed query: ");
            sb2.append(e);
            Log.w(str32, sb2.toString());
            closeQuietly(cursor);
            return str2;
        }
    }
}

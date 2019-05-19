package com.xiaomi.camera.parallelservice.util;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.android.camera.db.element.SaveTask;
import com.android.camera.log.Log;
import com.google.android.apps.photos.api.ProcessingMetadataQuery;

public class ParallelUtil {
    private static final String PROCESSING_URI = "content://com.xiaomi.camera.parallelservice.provider.SpecialTypesProvider/processing";
    /* access modifiers changed from: private */
    public static final String TAG = ParallelUtil.class.getSimpleName();

    public static class DEBUG {
        public static final boolean ENABLE = false;

        public static void crash() {
            doAssert(false);
        }

        public static void doAssert(boolean z) {
            doAssert(z, null);
        }

        public static void doAssert(boolean z, String str) {
        }
    }

    public static class ParallelProvider {
        public static void deleteInProvider(Context context, long j) {
            deleteInProvider(context, ParallelUtil.getResultUri(j));
        }

        public static void deleteInProvider(Context context, Uri uri) {
            DEBUG.doAssert(context != null);
            if (context != null) {
                String access$000 = ParallelUtil.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("deleteInProvider resultUri: ");
                sb.append(uri);
                Log.v(access$000, sb.toString());
                context.getContentResolver().delete(uri, null, null);
            }
        }
    }

    public static class ParallelService {
        public static void start(Context context) {
        }
    }

    public static Uri getResultUri(long j) {
        return ContentUris.withAppendedId(Uri.parse(PROCESSING_URI), j);
    }

    public static void insertImageToParallelService(Context context, long j, String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("algo db: first: ");
        sb.append(j);
        sb.append(" | ");
        sb.append(str);
        Log.i(str2, sb.toString());
        ContentValues contentValues = new ContentValues();
        contentValues.put(ProcessingMetadataQuery.MEDIA_STORE_ID, Long.valueOf(j));
        contentValues.put(ProcessingMetadataQuery.MEDIA_PATH, str);
        try {
            Uri insert = context.getContentResolver().insert(Uri.parse(PROCESSING_URI), contentValues);
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("algo db: uri: ");
            sb2.append(insert.toString());
            Log.i(str3, sb2.toString());
        } catch (Exception e) {
            Log.e(TAG, "Error! insert to parallel provider failed!!!");
        }
    }

    public static void markTaskFinish(Context context, SaveTask saveTask, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("algo db: finish: ");
        sb.append(saveTask.getMediaStoreId());
        sb.append(" | ");
        sb.append(saveTask.getPath());
        Log.d(str, sb.toString());
        if (z) {
            ParallelExifUtil.updateExif(saveTask.getPath());
        }
        ParallelProvider.deleteInProvider(context, saveTask.getMediaStoreId().longValue());
    }
}

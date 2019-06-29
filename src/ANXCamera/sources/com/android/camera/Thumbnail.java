package com.android.camera;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.media.MediaMetadataRetriever;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.provider.MediaStore.Images.Thumbnails;
import android.provider.MediaStore.Video;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.TextUtils;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import com.android.gallery3d.exif.ExifInterface;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

public class Thumbnail {
    private static final int BUFSIZE = 4096;
    private static final String LAST_THUMB_FILENAME = "last_thumb";
    private static final String TAG = "Thumbnail";
    public static final int THUMBNAIL_DELETED = 2;
    public static final int THUMBNAIL_FAIL_FROM_FILE = 3;
    public static final int THUMBNAIL_FOUND = 1;
    public static final int THUMBNAIL_NOT_FOUND = 0;
    public static final int THUMBNAIL_USE_FROM_FILE = -1;
    private static Object sLock = new Object();
    private Bitmap mBitmap;
    private boolean mFromFile = false;
    private Uri mUri;
    private boolean mWaitingForUri = false;

    private static class Media {
        public final long dateTaken;
        public final long id;
        public final int orientation;
        public final String path;
        public final Uri uri;

        public Media(long j, int i, long j2, Uri uri2, String str) {
            this.id = j;
            this.orientation = i;
            this.dateTaken = j2;
            this.uri = uri2;
            this.path = str;
        }
    }

    private Thumbnail(Uri uri, Bitmap bitmap, int i, boolean z) {
        this.mUri = uri;
        this.mBitmap = adjustImage(bitmap, i, z);
    }

    private static Bitmap adjustImage(Bitmap bitmap, int i, boolean z) {
        int i2;
        int i3;
        Bitmap bitmap2;
        if (i == 0 && !z && bitmap.getWidth() == bitmap.getHeight()) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        if (i % 180 != 0) {
            i3 = bitmap.getHeight();
            i2 = bitmap.getWidth();
        } else {
            i3 = bitmap.getWidth();
            i2 = bitmap.getHeight();
        }
        matrix.postTranslate(((float) (-bitmap.getWidth())) / 2.0f, ((float) (-bitmap.getHeight())) / 2.0f);
        matrix.postRotate((float) i);
        float f = ((float) i3) / 2.0f;
        float f2 = ((float) i2) / 2.0f;
        matrix.postTranslate(f, f2);
        matrix.postScale(z ? -1.0f : 1.0f, 1.0f, f, f2);
        int min = Math.min(i3, i2);
        matrix.postTranslate(((float) (min - i3)) / 2.0f, ((float) (min - i2)) / 2.0f);
        try {
            bitmap2 = Bitmap.createBitmap(min, min, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(bitmap2);
                canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
                Paint paint = new Paint();
                paint.setAntiAlias(true);
                paint.setFilterBitmap(true);
                canvas.drawBitmap(bitmap, matrix, paint);
                bitmap.recycle();
            } catch (Exception e) {
                e = e;
            } catch (OutOfMemoryError e2) {
                e = e2;
                Log.w(TAG, "Failed to rotate thumbnail", e);
                return bitmap2;
            }
        } catch (Exception e3) {
            e = e3;
            bitmap2 = null;
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return bitmap2;
        } catch (OutOfMemoryError e4) {
            e = e4;
            bitmap2 = null;
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return bitmap2;
        }
        return bitmap2;
    }

    public static Bitmap createBitmap(byte[] bArr, int i, boolean z, int i2) {
        Options options = new Options();
        options.inSampleSize = i2;
        options.inPurgeable = true;
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        int i3 = i % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        if (decodeByteArray != null && (i3 != 0 || z)) {
            Matrix matrix = new Matrix();
            Matrix matrix2 = new Matrix();
            if (i3 != 0) {
                matrix.setRotate((float) i3, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
            }
            if (z) {
                matrix2.setScale(-1.0f, 1.0f, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
                matrix.postConcat(matrix2);
            }
            try {
                Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray, 0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight(), matrix, true);
                if (createBitmap != decodeByteArray) {
                    decodeByteArray.recycle();
                }
                return createBitmap;
            } catch (Exception e) {
                Log.w(TAG, "Failed to rotate thumbnail", e);
            }
        }
        return decodeByteArray;
    }

    public static Thumbnail createThumbnail(Uri uri, Bitmap bitmap, int i, boolean z) {
        if (bitmap != null) {
            return new Thumbnail(uri, bitmap, i, z);
        }
        Log.e(TAG, "Failed to create thumbnail from null bitmap");
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x001d  */
    public static Thumbnail createThumbnail(byte[] bArr, int i, int i2, Uri uri, boolean z) {
        Bitmap bitmap;
        if (11 <= i2) {
            ExifInterface exifInterface = new ExifInterface();
            try {
                exifInterface.readExif(bArr);
                bitmap = exifInterface.getThumbnailBitmap();
            } catch (IOException e) {
                Log.e(TAG, "parser jpeg error, ignore", e);
            }
            if (bitmap == null) {
                Options options = new Options();
                options.inSampleSize = i2;
                options.inPurgeable = true;
                bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            }
            return createThumbnail(uri, bitmap, i, z);
        }
        bitmap = null;
        if (bitmap == null) {
        }
        return createThumbnail(uri, bitmap, i, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x006d  */
    public static Thumbnail createThumbnailFromUri(ContentResolver contentResolver, Uri uri, boolean z) {
        int i;
        String str;
        Bitmap bitmap;
        if (!(uri == null || uri.getPath() == null)) {
            boolean contains = uri.getPath().contains(android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI.getPath());
            Cursor query = contentResolver.query(uri, contains ? new String[]{"_id", "_data", "orientation"} : new String[]{"_id", "_data"}, null, null, null);
            long j = -1;
            int i2 = 0;
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        j = query.getLong(0);
                        str = query.getString(1);
                        if (contains) {
                            i2 = query.getInt(2);
                        }
                        i = i2;
                        i2 = 1;
                        if (query != null) {
                            query.close();
                        }
                        if (i2 != 0) {
                            if (contains) {
                                bitmap = Thumbnails.getThumbnail(contentResolver, j, 1, null);
                                if (bitmap == null) {
                                    bitmap = ThumbnailUtils.createImageThumbnail(str, 1);
                                }
                            } else {
                                bitmap = Video.Thumbnails.getThumbnail(contentResolver, j, 1, null);
                                if (bitmap == null) {
                                    bitmap = ThumbnailUtils.createVideoThumbnail(str, 1);
                                }
                            }
                            return createThumbnail(uri, bitmap, i, z);
                        }
                    }
                } catch (Throwable th) {
                    if (query != null) {
                        query.close();
                    }
                    throw th;
                }
            }
            str = null;
            i = 0;
            if (query != null) {
            }
            if (i2 != 0) {
            }
        }
        return null;
    }

    public static Bitmap createVideoThumbnailBitmap(FileDescriptor fileDescriptor, int i) {
        return createVideoThumbnailBitmap(null, fileDescriptor, i);
    }

    public static Bitmap createVideoThumbnailBitmap(String str, int i) {
        return createVideoThumbnailBitmap(str, null, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0056  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x006d  */
    private static Bitmap createVideoThumbnailBitmap(String str, FileDescriptor fileDescriptor, int i) {
        Bitmap bitmap;
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        if (str != null) {
            try {
                mediaMetadataRetriever.setDataSource(str);
            } catch (IllegalArgumentException e) {
                Log.e(TAG, e.getMessage(), e);
                mediaMetadataRetriever.release();
                bitmap = null;
                if (bitmap == null) {
                }
            } catch (RuntimeException e2) {
                Log.e(TAG, e2.getMessage(), e2);
                try {
                    mediaMetadataRetriever.release();
                } catch (RuntimeException e3) {
                    Log.e(TAG, e3.getMessage(), e3);
                }
                bitmap = null;
                if (bitmap == null) {
                }
            } catch (Throwable th) {
                try {
                    mediaMetadataRetriever.release();
                } catch (RuntimeException e4) {
                    Log.e(TAG, e4.getMessage(), e4);
                }
                throw th;
            }
        } else {
            mediaMetadataRetriever.setDataSource(fileDescriptor);
        }
        bitmap = mediaMetadataRetriever.getFrameAtTime(-1);
        try {
            mediaMetadataRetriever.release();
        } catch (RuntimeException e5) {
            Log.e(TAG, e5.getMessage(), e5);
        }
        if (bitmap == null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("fail to get thumbnail for ");
            sb.append(str);
            Log.e(str2, sb.toString());
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        if (width > i) {
            float f = (float) width;
            float f2 = ((float) i) / f;
            bitmap = Bitmap.createScaledBitmap(bitmap, Math.round(f * f2), Math.round(f2 * ((float) height)), true);
        }
        return bitmap;
    }

    private static String getImageBucketIds() {
        if (Storage.secondaryStorageMounted()) {
            StringBuilder sb = new StringBuilder();
            sb.append("bucket_id IN (");
            sb.append(Storage.PRIMARY_BUCKET_ID);
            sb.append(",");
            sb.append(Storage.SECONDARY_BUCKET_ID);
            sb.append(")");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("bucket_id=");
        sb2.append(Storage.BUCKET_ID);
        return sb2.toString();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:46:0x011b, code lost:
        if (r1 == null) goto L_0x0137;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x011d, code lost:
        r1.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x0134, code lost:
        if (r1 != null) goto L_0x011d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x0137, code lost:
        return null;
     */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x00aa A[Catch:{ Exception -> 0x00a3, all -> 0x009f }] */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0115  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0118  */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x0131  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x013b  */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x0140  */
    private static Media getLastImageThumbnail(ContentResolver contentResolver) {
        Cursor cursor;
        Cursor cursor2;
        boolean z;
        Uri uri = android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
        Uri build = uri.buildUpon().appendQueryParameter("limit", "1").build();
        String[] strArr = {"_id", "orientation", "datetaken", "_data"};
        StringBuilder sb = new StringBuilder();
        sb.append("mime_type='image/jpeg' AND ");
        sb.append(getImageBucketIds());
        sb.append(" AND ");
        sb.append("_size");
        sb.append(" > 0");
        String sb2 = sb.toString();
        String str = "datetaken DESC,_id DESC";
        try {
            cursor = contentResolver.query(build, strArr, sb2, null, str);
            if (cursor != null) {
                try {
                    if (cursor.moveToFirst()) {
                        String string = cursor.getString(3);
                        if (TextUtils.isEmpty(string) || !new File(string).exists()) {
                            Log.d(TAG, "getLastImageThumbnail first file is deleted");
                            z = true;
                            if (!z) {
                                cursor2 = contentResolver.query(uri, strArr, sb2, null, str);
                                if (cursor2 != null) {
                                    String str2 = TAG;
                                    try {
                                        StringBuilder sb3 = new StringBuilder();
                                        sb3.append("getLastImageThumbnail count=");
                                        sb3.append(cursor2.getCount());
                                        Log.d(str2, sb3.toString());
                                        while (cursor2.moveToNext()) {
                                            String string2 = cursor2.getString(3);
                                            if (!TextUtils.isEmpty(string2) && new File(string2).exists()) {
                                                long j = cursor2.getLong(0);
                                                Media media = new Media(j, cursor2.getInt(1), cursor2.getLong(2), ContentUris.withAppendedId(uri, j), string2);
                                                if (cursor != null) {
                                                    cursor.close();
                                                }
                                                if (cursor2 != null) {
                                                    cursor2.close();
                                                }
                                                return media;
                                            }
                                        }
                                    } catch (Exception e) {
                                        e = e;
                                        try {
                                            Log.w(TAG, "getLastImageThumbnail error", e);
                                            if (cursor != null) {
                                            }
                                        } catch (Throwable th) {
                                            th = th;
                                            if (cursor != null) {
                                                cursor.close();
                                            }
                                            if (cursor2 != null) {
                                                cursor2.close();
                                            }
                                            throw th;
                                        }
                                    }
                                }
                            } else {
                                cursor2 = null;
                            }
                            if (cursor != null) {
                                cursor.close();
                            }
                        } else {
                            long j2 = cursor.getLong(0);
                            Media media2 = new Media(j2, cursor.getInt(1), cursor.getLong(2), ContentUris.withAppendedId(uri, j2), string);
                            if (cursor != null) {
                                cursor.close();
                            }
                            return media2;
                        }
                    }
                } catch (Exception e2) {
                    e = e2;
                    cursor2 = null;
                    Log.w(TAG, "getLastImageThumbnail error", e);
                    if (cursor != null) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor2 = null;
                    if (cursor != null) {
                    }
                    if (cursor2 != null) {
                    }
                    throw th;
                }
            }
            z = false;
            if (!z) {
            }
            if (cursor != null) {
            }
        } catch (Exception e3) {
            e = e3;
            cursor2 = null;
            cursor = null;
            Log.w(TAG, "getLastImageThumbnail error", e);
            if (cursor != null) {
                cursor.close();
            }
        } catch (Throwable th3) {
            th = th3;
            cursor2 = null;
            cursor = null;
            if (cursor != null) {
            }
            if (cursor2 != null) {
            }
            throw th;
        }
    }

    public static int getLastThumbnailFromContentResolver(ContentResolver contentResolver, Thumbnail[] thumbnailArr, Uri uri) {
        Bitmap bitmap;
        Media lastImageThumbnail = getLastImageThumbnail(contentResolver);
        Media lastVideoThumbnail = getLastVideoThumbnail(contentResolver);
        if (lastImageThumbnail == null && lastVideoThumbnail == null) {
            return 0;
        }
        if (lastImageThumbnail == null || (lastVideoThumbnail != null && lastImageThumbnail.dateTaken < lastVideoThumbnail.dateTaken)) {
            if (uri != null && uri.equals(lastVideoThumbnail.uri)) {
                return -1;
            }
            bitmap = Video.Thumbnails.getThumbnail(contentResolver, lastVideoThumbnail.id, 1, null);
            if (bitmap == null) {
                try {
                    bitmap = ThumbnailUtils.createVideoThumbnail(lastVideoThumbnail.path, 1);
                } catch (Exception e) {
                    Log.e(TAG, "exception in createVideoThumbnail", e);
                }
            }
            lastImageThumbnail = lastVideoThumbnail;
        } else if (uri != null && uri.equals(lastImageThumbnail.uri)) {
            return -1;
        } else {
            bitmap = Thumbnails.getThumbnail(contentResolver, lastImageThumbnail.id, 1, null);
            if (bitmap == null) {
                try {
                    bitmap = ThumbnailUtils.createImageThumbnail(lastImageThumbnail.path, 1);
                } catch (Exception e2) {
                    Log.e(TAG, "exception in createImageThumbnail", e2);
                }
            }
        }
        if (!Util.isUriValid(lastImageThumbnail.uri, contentResolver)) {
            return 2;
        }
        if (bitmap == null) {
            return 3;
        }
        thumbnailArr[0] = createThumbnail(lastImageThumbnail.uri, bitmap, lastImageThumbnail.orientation, false);
        return 1;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0050, code lost:
        r7 = createThumbnail(r4, r8, 0, false);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0055, code lost:
        if (r7 == null) goto L_0x005b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0057, code lost:
        r7.setFromFile(true);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x005b, code lost:
        return r7;
     */
    public static Thumbnail getLastThumbnailFromFile(File file, ContentResolver contentResolver) {
        DataInputStream dataInputStream;
        FileInputStream fileInputStream;
        BufferedInputStream bufferedInputStream;
        File file2 = new File(file, LAST_THUMB_FILENAME);
        synchronized (sLock) {
            try {
                fileInputStream = new FileInputStream(file2);
                try {
                    bufferedInputStream = new BufferedInputStream(fileInputStream, 4096);
                } catch (IOException e) {
                    e = e;
                    bufferedInputStream = null;
                    dataInputStream = null;
                    String str = TAG;
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Fail to load bitmap. ");
                        sb.append(e);
                        Log.i(str, sb.toString());
                        Util.closeSilently(fileInputStream);
                        Util.closeSilently(bufferedInputStream);
                        Util.closeSilently(dataInputStream);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    bufferedInputStream = null;
                    dataInputStream = null;
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(dataInputStream);
                    throw th;
                }
                try {
                    dataInputStream = new DataInputStream(bufferedInputStream);
                } catch (IOException e2) {
                    e = e2;
                    dataInputStream = null;
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Fail to load bitmap. ");
                    sb2.append(e);
                    Log.i(str2, sb2.toString());
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(dataInputStream);
                    return null;
                } catch (Throwable th3) {
                    th = th3;
                    dataInputStream = null;
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(dataInputStream);
                    throw th;
                }
                try {
                    Uri parse = Uri.parse(dataInputStream.readUTF());
                    if (!Util.isUriValid(parse, contentResolver)) {
                        dataInputStream.close();
                        Util.closeSilently(fileInputStream);
                        Util.closeSilently(bufferedInputStream);
                        Util.closeSilently(dataInputStream);
                        return null;
                    }
                    Bitmap decodeStream = BitmapFactory.decodeStream(dataInputStream);
                    dataInputStream.close();
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(dataInputStream);
                } catch (IOException e3) {
                    e = e3;
                    String str22 = TAG;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("Fail to load bitmap. ");
                    sb22.append(e);
                    Log.i(str22, sb22.toString());
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(dataInputStream);
                    return null;
                }
            } catch (IOException e4) {
                e = e4;
                bufferedInputStream = null;
                fileInputStream = null;
                dataInputStream = null;
                String str222 = TAG;
                StringBuilder sb222 = new StringBuilder();
                sb222.append("Fail to load bitmap. ");
                sb222.append(e);
                Log.i(str222, sb222.toString());
                Util.closeSilently(fileInputStream);
                Util.closeSilently(bufferedInputStream);
                Util.closeSilently(dataInputStream);
                return null;
            } catch (Throwable th4) {
                th = th4;
                bufferedInputStream = null;
                fileInputStream = null;
                dataInputStream = null;
                Util.closeSilently(fileInputStream);
                Util.closeSilently(bufferedInputStream);
                Util.closeSilently(dataInputStream);
                throw th;
            }
        }
    }

    public static int getLastThumbnailFromUriList(ContentResolver contentResolver, Thumbnail[] thumbnailArr, ArrayList<Uri> arrayList, Uri uri) {
        if (arrayList == null || arrayList.size() == 0) {
            return 0;
        }
        int size = arrayList.size() - 1;
        while (size >= 0) {
            Uri uri2 = (Uri) arrayList.get(size);
            if (!Util.isUriValid(uri2, contentResolver)) {
                size--;
            } else if (uri != null && uri.equals(uri2)) {
                return -1;
            } else {
                thumbnailArr[0] = createThumbnailFromUri(contentResolver, uri2, false);
                return 1;
            }
        }
        return 0;
    }

    public static Uri getLastThumbnailUri(ContentResolver contentResolver) {
        Media lastImageThumbnail = getLastImageThumbnail(contentResolver);
        Media lastVideoThumbnail = getLastVideoThumbnail(contentResolver);
        if (lastImageThumbnail != null && (lastVideoThumbnail == null || lastImageThumbnail.dateTaken >= lastVideoThumbnail.dateTaken)) {
            return lastImageThumbnail.uri;
        }
        if (lastVideoThumbnail == null || (lastImageThumbnail != null && lastVideoThumbnail.dateTaken < lastImageThumbnail.dateTaken)) {
            return null;
        }
        return lastVideoThumbnail.uri;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x009d A[Catch:{ all -> 0x0096 }] */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x010e  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x0117  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x011c  */
    private static Media getLastVideoThumbnail(ContentResolver contentResolver) {
        Cursor cursor;
        Cursor cursor2;
        boolean z;
        Uri uri = android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
        Uri build = uri.buildUpon().appendQueryParameter("limit", "1").build();
        String[] strArr = {"_id", "_data", "datetaken"};
        StringBuilder sb = new StringBuilder();
        sb.append(getVideoBucketIds());
        sb.append(" AND ");
        sb.append("_size");
        sb.append(" > 0");
        String sb2 = sb.toString();
        String str = "datetaken DESC,_id DESC";
        try {
            cursor = contentResolver.query(build, strArr, sb2, null, str);
            if (cursor != null) {
                try {
                    if (cursor.moveToFirst()) {
                        long j = cursor.getLong(0);
                        if (cursor.getString(1) == null || !new File(cursor.getString(1)).exists()) {
                            Log.d(TAG, "getLastVideoThumbnail first file is deleted");
                            z = true;
                            if (!z) {
                                cursor2 = contentResolver.query(uri, strArr, sb2, null, str);
                                String str2 = TAG;
                                try {
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("getLastVideoThumbnail count=");
                                    sb3.append(cursor2.getCount());
                                    Log.d(str2, sb3.toString());
                                    if (cursor2 != null) {
                                        while (cursor2.moveToNext()) {
                                            if (cursor2.getString(1) != null && new File(cursor2.getString(1)).exists()) {
                                                long j2 = cursor2.getLong(0);
                                                Media media = new Media(j2, 0, cursor2.getLong(2), ContentUris.withAppendedId(uri, j2), cursor2.getString(1));
                                                if (cursor != null) {
                                                    cursor.close();
                                                }
                                                if (cursor2 != null) {
                                                    cursor2.close();
                                                }
                                                return media;
                                            }
                                        }
                                    }
                                } catch (Throwable th) {
                                    th = th;
                                    if (cursor != null) {
                                    }
                                    if (cursor2 != null) {
                                    }
                                    throw th;
                                }
                            } else {
                                cursor2 = null;
                            }
                            if (cursor != null) {
                                cursor.close();
                            }
                            if (cursor2 != null) {
                                cursor2.close();
                            }
                            return null;
                        }
                        Media media2 = new Media(j, 0, cursor.getLong(2), ContentUris.withAppendedId(uri, j), cursor.getString(1));
                        if (cursor != null) {
                            cursor.close();
                        }
                        return media2;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    cursor2 = null;
                    if (cursor != null) {
                    }
                    if (cursor2 != null) {
                    }
                    throw th;
                }
            }
            z = false;
            if (!z) {
            }
            if (cursor != null) {
            }
            if (cursor2 != null) {
            }
            return null;
        } catch (Throwable th3) {
            th = th3;
            cursor2 = null;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            if (cursor2 != null) {
                cursor2.close();
            }
            throw th;
        }
    }

    private static String getVideoBucketIds() {
        if (Storage.secondaryStorageMounted()) {
            StringBuilder sb = new StringBuilder();
            sb.append("bucket_id IN (");
            sb.append(Storage.PRIMARY_BUCKET_ID);
            sb.append(",");
            sb.append(Storage.SECONDARY_BUCKET_ID);
            sb.append(")");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("bucket_id=");
        sb2.append(Storage.BUCKET_ID);
        return sb2.toString();
    }

    public boolean fromFile() {
        return this.mFromFile;
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public boolean isWaitingForUri() {
        return this.mWaitingForUri;
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r3v0, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r4v2 */
    /* JADX WARNING: type inference failed for: r3v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r4v3 */
    /* JADX WARNING: type inference failed for: r3v3 */
    /* JADX WARNING: type inference failed for: r4v4 */
    /* JADX WARNING: type inference failed for: r3v4 */
    /* JADX WARNING: type inference failed for: r4v5 */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v7 */
    /* JADX WARNING: type inference failed for: r3v8, types: [java.io.OutputStream, java.io.Closeable, java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r4v8 */
    /* JADX WARNING: type inference failed for: r4v9 */
    /* JADX WARNING: type inference failed for: r4v10, types: [java.io.OutputStream, java.io.DataOutputStream] */
    /* JADX WARNING: type inference failed for: r4v11 */
    /* JADX WARNING: type inference failed for: r4v12 */
    /* JADX WARNING: type inference failed for: r3v9 */
    /* JADX WARNING: type inference failed for: r3v10 */
    /* JADX WARNING: type inference failed for: r3v11 */
    /* JADX WARNING: type inference failed for: r3v12 */
    /* JADX WARNING: type inference failed for: r3v13 */
    /* JADX WARNING: type inference failed for: r4v13 */
    /* JADX WARNING: type inference failed for: r4v14 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v2
  assigns: []
  uses: []
  mth insns count: 73
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
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 9 */
    public void saveLastThumbnailToFile(File file) {
        ? r4;
        ? r3;
        FileOutputStream fileOutputStream;
        ? r42;
        ? r43;
        ? r32;
        Throwable e;
        ? r33;
        ? r34;
        ? bufferedOutputStream;
        ? dataOutputStream;
        if (this.mUri == null) {
            Log.w(TAG, "Fail to store bitmap. uri is null");
            return;
        }
        File file2 = new File(file, LAST_THUMB_FILENAME);
        synchronized (sLock) {
            try {
                fileOutputStream = new FileOutputStream(file2);
                try {
                    bufferedOutputStream = new BufferedOutputStream(fileOutputStream, 4096);
                } catch (IOException e2) {
                    r43 = 0;
                    e = e2;
                    r32 = 0;
                    String str = TAG;
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Fail to store bitmap. path=");
                        sb.append(file2.getPath());
                        Log.e(str, sb.toString(), e);
                        Util.closeSilently(fileOutputStream);
                        Util.closeSilently(r32);
                        r42 = r43;
                        Util.closeSilently(r42);
                    } catch (Throwable th) {
                        th = th;
                        r4 = r43;
                        r3 = r32;
                        Util.closeSilently(fileOutputStream);
                        Util.closeSilently(r3);
                        Util.closeSilently(r4);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    r34 = 0;
                    r4 = r33;
                    r3 = r33;
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(r3);
                    Util.closeSilently(r4);
                    throw th;
                }
                try {
                    dataOutputStream = new DataOutputStream(bufferedOutputStream);
                } catch (IOException e3) {
                    Throwable th3 = e3;
                    r43 = 0;
                    e = th3;
                    r32 = bufferedOutputStream;
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Fail to store bitmap. path=");
                    sb2.append(file2.getPath());
                    Log.e(str2, sb2.toString(), e);
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(r32);
                    r42 = r43;
                    Util.closeSilently(r42);
                } catch (Throwable th4) {
                    th = th4;
                    r4 = 0;
                    r3 = bufferedOutputStream;
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(r3);
                    Util.closeSilently(r4);
                    throw th;
                }
                try {
                    dataOutputStream.writeUTF(this.mUri.toString());
                    this.mBitmap.compress(CompressFormat.JPEG, 90, dataOutputStream);
                    dataOutputStream.close();
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                    r42 = dataOutputStream;
                } catch (IOException e4) {
                    e = e4;
                    r32 = bufferedOutputStream;
                    r43 = dataOutputStream;
                    String str22 = TAG;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("Fail to store bitmap. path=");
                    sb22.append(file2.getPath());
                    Log.e(str22, sb22.toString(), e);
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(r32);
                    r42 = r43;
                    Util.closeSilently(r42);
                }
            } catch (IOException e5) {
                r32 = 0;
                r43 = 0;
                e = e5;
                fileOutputStream = null;
                String str222 = TAG;
                StringBuilder sb222 = new StringBuilder();
                sb222.append("Fail to store bitmap. path=");
                sb222.append(file2.getPath());
                Log.e(str222, sb222.toString(), e);
                Util.closeSilently(fileOutputStream);
                Util.closeSilently(r32);
                r42 = r43;
                Util.closeSilently(r42);
            } catch (Throwable th5) {
                th = th5;
                fileOutputStream = null;
                r34 = 0;
                r4 = r33;
                r3 = r33;
                Util.closeSilently(fileOutputStream);
                Util.closeSilently(r3);
                Util.closeSilently(r4);
                throw th;
            }
            Util.closeSilently(r42);
        }
    }

    public void setFromFile(boolean z) {
        this.mFromFile = z;
    }

    public void setUri(Uri uri) {
        if (this.mUri != null) {
            Log.d(TAG, "the uri for thumbnail is being updated unexpectedly..ignore.");
            return;
        }
        this.mUri = uri;
        this.mWaitingForUri = false;
    }

    public void startWaitingForUri() {
        this.mWaitingForUri = true;
    }
}

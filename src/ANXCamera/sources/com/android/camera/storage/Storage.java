package com.android.camera.storage;

import android.app.Activity;
import android.app.usage.StorageStatsManager;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.location.Location;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.StatFs;
import android.os.UserHandle;
import android.os.storage.StorageManager;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.text.TextUtils;
import com.android.camera.ActivityBase;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import miui.os.Build;
import miui.reflect.Method;

public class Storage {
    public static final String AVOID_SCAN_FILE_NAME = ".nomedia";
    public static int BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    private static final String CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera";
    private static final String CAMERA_STORAGE_PATH_TEMP = "/DCIM/Camera/temp";
    public static String CAMERA_TEMP_DIRECTORY = null;
    public static String DIRECTORY = null;
    public static String FIRST_CONSIDER_STORAGE_PATH = (b.qA ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH);
    public static String HIDEDIRECTORY = null;
    private static final String HIDE_CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera/.ubifocus";
    public static final String HSR_120_SUFFIX = "_HSR_120";
    public static final String HSR_240_SUFFIX = "_HSR_240";
    public static final String JPEG_SUFFIX = ".jpg";
    private static final AtomicLong LEFT_SPACE = new AtomicLong(0);
    public static final String LIVE_SHOT_PREFIX = "MV";
    public static final long LOW_STORAGE_THRESHOLD = 52428800;
    private static final int MAX_WRITE_RETRY = (Build.IS_ALPHA_BUILD ? 1 : 3);
    protected static final String PARALLEL_PROCESS_EXIF_PROCESS_TAG = "processing";
    public static final long PREPARING = -2;
    public static int PRIMARY_BUCKET_ID = 0;
    private static final String PRIMARY_STORAGE_PATH = Environment.getExternalStorageDirectory().toString();
    public static final float QUOTA_RATIO = 0.9f;
    private static final String SAVE_TO_CLOUD_ALBUM_ACTION = "com.miui.gallery.SAVE_TO_CLOUD";
    private static final String SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY = "extra_cache_location";
    private static final String SAVE_TO_CLOUD_ALBUM_FILE_LENGTH = "extra_file_length";
    private static final String SAVE_TO_CLOUD_ALBUM_PACKAGE = "com.miui.gallery";
    private static final String SAVE_TO_CLOUD_ALBUM_PATH_KAY = "extra_file_path";
    private static final String SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY = "extra_media_store_id";
    private static final String SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY = "extra_is_temp_file";
    public static int SECONDARY_BUCKET_ID = 0;
    private static String SECONDARY_STORAGE_PATH = System.getenv("SECONDARY_STORAGE");
    private static final String TAG = Storage.class.getSimpleName();
    public static final String UBIFOCUS_SUFFIX = "_UBIFOCUS_";
    public static final long UNAVAILABLE = -1;
    public static final long UNKNOWN_SIZE = -3;
    private static String sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
    private static long sQuotaBytes;
    private static boolean sQuotaSupported;
    private static long sReserveBytes;
    private static WeakReference<StorageListener> sStorageListener;

    public interface StorageListener {
        void onStoragePathChanged();
    }

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

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(FIRST_CONSIDER_STORAGE_PATH);
        sb.append(CAMERA_STORAGE_PATH_SUFFIX);
        DIRECTORY = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(FIRST_CONSIDER_STORAGE_PATH);
        sb2.append(HIDE_CAMERA_STORAGE_PATH_SUFFIX);
        HIDEDIRECTORY = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(FIRST_CONSIDER_STORAGE_PATH);
        sb3.append(CAMERA_STORAGE_PATH_TEMP);
        CAMERA_TEMP_DIRECTORY = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(PRIMARY_STORAGE_PATH);
        sb4.append(CAMERA_STORAGE_PATH_SUFFIX);
        PRIMARY_BUCKET_ID = sb4.toString().toLowerCase(Locale.ENGLISH).hashCode();
        StringBuilder sb5 = new StringBuilder();
        sb5.append(SECONDARY_STORAGE_PATH);
        sb5.append(CAMERA_STORAGE_PATH_SUFFIX);
        SECONDARY_BUCKET_ID = sb5.toString().toLowerCase(Locale.ENGLISH).hashCode();
        StringBuilder sb6 = new StringBuilder();
        sb6.append(DIRECTORY);
        sb6.append(File.separator);
        sb6.append(AVOID_SCAN_FILE_NAME);
        File file = new File(sb6.toString());
        if (file.exists()) {
            file.delete();
        }
    }

    public static void addDNGToDataBase(Activity activity, String str) {
        String generateFilepath = generateFilepath(str, ".dng");
        ContentValues contentValues = new ContentValues(4);
        contentValues.put("title", str);
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".dng");
        contentValues.put("_display_name", sb.toString());
        contentValues.put("media_type", Integer.valueOf(1));
        contentValues.put("_data", generateFilepath);
        try {
            activity.getContentResolver().insert(Files.getContentUri("external"), contentValues);
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed to write MediaStore");
            sb2.append(e);
            Log.e(str2, sb2.toString());
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:107:0x015c A[SYNTHETIC, Splitter:B:107:0x015c] */
    /* JADX WARNING: Removed duplicated region for block: B:143:0x01b5  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x01b7  */
    /* JADX WARNING: Removed duplicated region for block: B:187:0x015f A[EDGE_INSN: B:187:0x015f->B:109:0x015f ?: BREAK  , SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Uri addImage(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, String str2, PictureInfo pictureInfo) {
        boolean z6;
        int i4;
        int i5;
        boolean z7;
        boolean z8;
        String str3;
        String str4;
        boolean z9;
        Throwable th;
        OutputStream fileOutputStream;
        Throwable th2;
        boolean z10;
        Throwable th3;
        boolean z11;
        boolean z12;
        final Context context2 = context;
        String str5 = str;
        Location location2 = location;
        int i6 = i;
        boolean z13 = z2;
        boolean z14 = z3;
        String str6 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("addImage: parallel=");
        boolean z15 = z5;
        sb.append(z15);
        sb.append(" appendExif=");
        boolean z16 = z4;
        sb.append(z16);
        Log.d(str6, sb.toString());
        byte[] updateExif = updateExif(bArr, z15, str2, pictureInfo, i6, i2, i3);
        String generateFilepath = generateFilepath(str5, z13, z14);
        String str7 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("addImage: path=");
        sb2.append(generateFilepath);
        Log.d(str7, sb2.toString());
        int i7 = 0;
        while (true) {
            try {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(updateExif));
                try {
                    if (isUseDocumentMode()) {
                        try {
                            fileOutputStream = FileCompat.getFileOutputStream(generateFilepath, true);
                        } catch (Throwable th4) {
                            th = th4;
                            th = null;
                            try {
                                $closeResource(th, bufferedInputStream);
                                throw th;
                            } catch (Exception e) {
                                e = e;
                                dumpExceptionEnv(e, generateFilepath);
                                Log.e(TAG, "Failed to write image", e);
                                i7++;
                                if (Util.isQuotaExceeded(e) && (context2 instanceof ActivityBase)) {
                                    ActivityBase activityBase = (ActivityBase) context2;
                                    if (!activityBase.isActivityPaused()) {
                                        activityBase.runOnUiThread(new Runnable() {
                                            public void run() {
                                                ToastUtils.showToast(context2, (int) R.string.spaceIsLow_content_primary_storage_priority);
                                            }
                                        });
                                    }
                                    i7 = MAX_WRITE_RETRY;
                                } else if (i7 < MAX_WRITE_RETRY) {
                                    System.gc();
                                    try {
                                        Thread.sleep(50);
                                    } catch (InterruptedException e2) {
                                    }
                                }
                                if (i7 >= MAX_WRITE_RETRY) {
                                    z6 = true;
                                    if (!z6) {
                                    }
                                } else {
                                    int i8 = i2;
                                    context2 = context;
                                    boolean z17 = z5;
                                    boolean z18 = z2;
                                }
                            }
                        }
                    } else {
                        fileOutputStream = new FileOutputStream(generateFilepath);
                    }
                    OutputStream outputStream = fileOutputStream;
                    try {
                        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
                        if (!z) {
                            z9 = z16;
                            byte[] bArr2 = new byte[4096];
                            while (true) {
                                int read = bufferedInputStream.read(bArr2);
                                if (read == -1) {
                                    break;
                                }
                                bufferedOutputStream.write(bArr2, 0, read);
                            }
                        } else {
                            try {
                                boolean z19 = i6 % 180 == 0;
                                Bitmap flipJpeg = flipJpeg(updateExif, z19, !z19);
                                if (flipJpeg == null) {
                                    z9 = z16;
                                    byte[] bArr3 = new byte[4096];
                                    while (true) {
                                        int read2 = bufferedInputStream.read(bArr3);
                                        if (read2 == -1) {
                                            break;
                                        }
                                        bufferedOutputStream.write(bArr3, 0, read2);
                                    }
                                } else {
                                    z9 = z16;
                                    try {
                                        ExifInterface exif = Util.getExif(updateExif);
                                        byte[] thumbnailBytes = exif.getThumbnailBytes();
                                        if (thumbnailBytes != null) {
                                            Bitmap flipJpeg2 = flipJpeg(thumbnailBytes, z19, !z19);
                                            if (flipJpeg2 != null) {
                                                exif.setCompressedThumbnail(flipJpeg2);
                                                flipJpeg2.recycle();
                                            }
                                            z9 = false;
                                        }
                                        exif.writeExif(flipJpeg, (OutputStream) bufferedOutputStream);
                                        flipJpeg.recycle();
                                    } catch (Throwable th5) {
                                        th = th5;
                                        z16 = z9;
                                        th3 = null;
                                        try {
                                            $closeResource(th3, bufferedOutputStream);
                                            throw th;
                                        } catch (Throwable th6) {
                                            th = th6;
                                            th2 = null;
                                            if (outputStream == null) {
                                                break;
                                            }
                                            $closeResource(th2, outputStream);
                                            break;
                                            throw th;
                                        }
                                    }
                                }
                            } catch (Throwable th7) {
                                th = th7;
                                z9 = z16;
                                th3 = null;
                                $closeResource(th3, bufferedOutputStream);
                                throw th;
                            }
                        }
                        z16 = z9;
                        if (z16) {
                            try {
                                bufferedOutputStream.flush();
                                z11 = z16;
                                try {
                                    ExifHelper.writeExifByFilePath(generateFilepath, i6, location2, System.currentTimeMillis());
                                } catch (Throwable th8) {
                                    th = th8;
                                    z16 = z11;
                                    th3 = null;
                                    $closeResource(th3, bufferedOutputStream);
                                    throw th;
                                }
                            } catch (Throwable th9) {
                                th = th9;
                                boolean z20 = z16;
                                th3 = null;
                                $closeResource(th3, bufferedOutputStream);
                                throw th;
                            }
                        } else {
                            z11 = z16;
                        }
                        try {
                            $closeResource(null, bufferedOutputStream);
                            if (outputStream != null) {
                                try {
                                    $closeResource(null, outputStream);
                                } catch (Throwable th10) {
                                    th = th10;
                                    th = null;
                                    z16 = z11;
                                    $closeResource(th, bufferedInputStream);
                                    throw th;
                                }
                            }
                            try {
                                $closeResource(null, bufferedInputStream);
                                z6 = false;
                                break;
                            } catch (Exception e3) {
                                e = e3;
                                z16 = z11;
                            }
                        } catch (Throwable th11) {
                            th = th11;
                            z16 = z11;
                            th2 = null;
                            if (outputStream == null) {
                            }
                            throw th;
                        }
                    } catch (Throwable th12) {
                        th = th12;
                        z9 = z16;
                        th2 = null;
                        if (outputStream == null) {
                        }
                        throw th;
                    }
                } catch (Throwable th13) {
                    th = th13;
                    z9 = z16;
                    th = null;
                    $closeResource(th, bufferedInputStream);
                    throw th;
                }
            } catch (Exception e4) {
                e = e4;
                z9 = z16;
            }
            int i82 = i2;
            context2 = context;
            boolean z172 = z5;
            boolean z182 = z2;
        }
        if (!z6) {
            return null;
        }
        if (z14) {
            boolean isProduceFocusInfoSuccess = Util.isProduceFocusInfoSuccess(updateExif);
            i4 = i2;
            i5 = i3;
            int centerFocusDepthIndex = Util.getCenterFocusDepthIndex(updateExif, i4, i5);
            String substring = str5.substring(0, str5.lastIndexOf(isProduceFocusInfoSuccess ? "_" : UBIFOCUS_SUFFIX));
            String generateFilepath2 = generateFilepath(substring, false, false);
            StringBuilder sb3 = new StringBuilder();
            sb3.append(substring);
            sb3.append(isProduceFocusInfoSuccess ? "_" : UBIFOCUS_SUFFIX);
            sb3.append(centerFocusDepthIndex);
            String sb4 = sb3.toString();
            z8 = z2;
            z7 = false;
            String generateFilepath3 = generateFilepath(sb4, z8, false);
            if (generateFilepath2 == null || generateFilepath3 == null) {
                String str8 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("oldPath: ");
                if (generateFilepath3 == null) {
                    generateFilepath3 = TEDefine.FACE_BEAUTY_NULL;
                }
                sb5.append(generateFilepath3);
                sb5.append(" newPath: ");
                sb5.append(generateFilepath2 == null ? TEDefine.FACE_BEAUTY_NULL : generateFilepath2);
                Log.e(str8, sb5.toString());
            } else {
                new File(generateFilepath3).renameTo(new File(generateFilepath2));
            }
            if (!isProduceFocusInfoSuccess) {
                deleteImage(substring);
            }
            str3 = substring;
            str4 = generateFilepath2;
        } else {
            i4 = i2;
            i5 = i3;
            z8 = z2;
            z7 = false;
            str4 = generateFilepath;
            str3 = str5;
        }
        if (z8 && !z14) {
            return null;
        }
        StringBuilder sb6 = new StringBuilder();
        sb6.append(str3);
        sb6.append(JPEG_SUFFIX);
        boolean z21 = z7;
        byte[] bArr4 = updateExif;
        Location location3 = location2;
        Uri insertToMediaStore = insertToMediaStore(context2, str3, sb6.toString(), j, "image/jpeg", i6, str4, new File(str4).length(), i4, i5, location2, z5);
        if (insertToMediaStore == null) {
            String str9 = TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("failed to insert to DB: ");
            sb7.append(str4);
            Log.e(str9, sb7.toString());
            return null;
        }
        saveToCloudAlbum(context, str4, (long) bArr4.length, z5, ContentUris.parseId(insertToMediaStore), location3 == null ? true : z21);
        return insertToMediaStore;
    }

    public static Uri addImageForEffect(Activity activity, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, String str2, PictureInfo pictureInfo) {
        return addImage(activity, str, j, location, i, bArr, i2, i3, z, false, false, false, z2, str2, pictureInfo);
    }

    public static Uri addImageForGroupOrPanorama(Context context, String str, int i, long j, Location location, int i2, int i3) {
        File file;
        Context context2 = context;
        String str2 = str;
        if (context2 == null || str2 == null) {
            return null;
        }
        try {
            file = new File(str2);
        } catch (Exception e) {
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to open panorama file: ");
            sb.append(e.getMessage());
            Log.e(str3, sb.toString(), e);
            file = null;
        }
        if (file == null || !file.exists()) {
            return null;
        }
        String name = file.getName();
        String str4 = str2;
        Uri insertToMediaStore = insertToMediaStore(context2, name, name, j, "image/jpeg", i, str2, file.length(), i2, i3, location, false);
        saveToCloudAlbum(context, str4, -1, location == null);
        return insertToMediaStore;
    }

    public static Uri addImageForSnapCamera(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, boolean z3, String str2, PictureInfo pictureInfo) {
        return addImage(context, str, j, location, i, bArr, i2, i3, z, z2, z3, false, false, str2, pictureInfo);
    }

    public static void deleteImage(String str) {
        File[] listFiles;
        File file = new File(HIDEDIRECTORY);
        if (file.exists() && file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                if (file2.getName().indexOf(str) != -1) {
                    file2.delete();
                }
            }
        }
    }

    private static boolean deleteSdcardFile(String str) {
        boolean deleteFile;
        int i = 0;
        do {
            i++;
            deleteFile = FileCompat.deleteFile(str);
            if (deleteFile) {
                break;
            }
        } while (i < 5);
        return deleteFile;
    }

    private static void dumpExceptionEnv(Exception exc, String str) {
        boolean z;
        if (exc instanceof FileNotFoundException) {
            long maxMemory = Runtime.getRuntime().maxMemory();
            long j = Runtime.getRuntime().totalMemory();
            long freeMemory = Runtime.getRuntime().freeMemory();
            File file = new File(str);
            try {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(".ex");
                File file2 = new File(sb.toString());
                z = file2.createNewFile();
                file2.delete();
            } catch (IOException e) {
                z = false;
            }
            String str2 = TAG;
            Locale locale = Locale.ENGLISH;
            String str3 = "Failed to write image, memory state(max:%d, total:%d, free:%d), file state(%s;%s;%s;%s)";
            Object[] objArr = new Object[7];
            objArr[0] = Long.valueOf(maxMemory);
            objArr[1] = Long.valueOf(j);
            objArr[2] = Long.valueOf(freeMemory);
            objArr[3] = file.exists() ? "exists" : "not exists";
            objArr[4] = file.isDirectory() ? "isDirectory" : "isNotDirectory";
            objArr[5] = file.canWrite() ? "canWrite" : "canNotWrite";
            objArr[6] = z ? "testFileCanWrite" : "testFileCannotWrite";
            Log.e(str2, String.format(locale, str3, objArr), exc);
        }
    }

    public static Bitmap flipJpeg(byte[] bArr, boolean z, boolean z2) {
        if (bArr == null) {
            return null;
        }
        Options options = new Options();
        options.inPurgeable = true;
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        Matrix matrix = new Matrix();
        float f = 1.0f;
        float f2 = z ? -1.0f : 1.0f;
        if (z2) {
            f = -1.0f;
        }
        matrix.setScale(f2, f, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray, 0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight(), matrix, true);
            if (createBitmap != decodeByteArray) {
                decodeByteArray.recycle();
            }
            if (createBitmap.getWidth() == -1 || createBitmap.getHeight() == -1) {
                return null;
            }
            return createBitmap;
        } catch (Exception e) {
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return null;
        }
    }

    public static String generateFilepath(String str) {
        return generateFilepath(str, JPEG_SUFFIX);
    }

    public static String generateFilepath(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(DIRECTORY);
        sb.append('/');
        sb.append(str);
        sb.append(str2);
        return sb.toString();
    }

    public static String generateFilepath(String str, boolean z, boolean z2) {
        if (z && isLowStorageSpace(HIDEDIRECTORY)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(z ? HIDEDIRECTORY : DIRECTORY);
        sb.append('/');
        sb.append(str);
        sb.append(z2 ? ".y" : JPEG_SUFFIX);
        return sb.toString();
    }

    public static String generatePrimaryDirectoryPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(PRIMARY_STORAGE_PATH);
        sb.append(CAMERA_STORAGE_PATH_SUFFIX);
        return sb.toString();
    }

    public static String generatePrimaryFilepath(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(generatePrimaryDirectoryPath());
        sb.append('/');
        sb.append(str);
        return sb.toString();
    }

    public static String generatePrimaryTempFile() {
        StringBuilder sb = new StringBuilder();
        sb.append(PRIMARY_STORAGE_PATH);
        sb.append(CAMERA_STORAGE_PATH_TEMP);
        return sb.toString();
    }

    public static long getAvailableSpace() {
        return getAvailableSpace(DIRECTORY);
    }

    public static long getAvailableSpace(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "getAvailableSpace path is empty");
            return -1;
        }
        File file = new File(str);
        boolean mkdirs = isUseDocumentMode() ? FileCompat.mkdirs(str) : Util.mkdirs(file, 511, -1, -1);
        if (!file.exists() || !file.isDirectory()) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getAvailableSpace path = ");
            sb.append(str);
            sb.append(", exists = ");
            sb.append(file.exists());
            sb.append(", isDirectory = ");
            sb.append(file.isDirectory());
            sb.append(", canWrite = ");
            sb.append(file.canWrite());
            Log.w(str2, sb.toString());
            return -1;
        }
        if (mkdirs && str.endsWith(CAMERA_STORAGE_PATH_SUFFIX)) {
            if (MediaProviderUtil.insertCameraDirectory(CameraAppImpl.getAndroidContext(), str) != null) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("insertDirectory success, path ");
                sb2.append(str);
                Log.d(str3, sb2.toString());
            } else {
                String str4 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("insertDirectory fail, path ");
                sb3.append(str);
                Log.w(str4, sb3.toString());
            }
        }
        try {
            if (HIDEDIRECTORY.equals(str)) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append(HIDEDIRECTORY);
                sb4.append(File.separator);
                sb4.append(AVOID_SCAN_FILE_NAME);
                Util.createFile(new File(sb4.toString()));
            }
            long availableBytes = new StatFs(str).getAvailableBytes();
            if (DIRECTORY.equals(str)) {
                if (isUsePhoneStorage() && isQuotaSupported() && availableBytes < sReserveBytes) {
                    Context androidContext = CameraAppImpl.getAndroidContext();
                    ApplicationInfo applicationInfo = androidContext.getApplicationInfo();
                    try {
                        long totalBytes = sQuotaBytes - ((StorageStatsManager) androidContext.getSystemService(StorageStatsManager.class)).queryExternalStatsForUser(applicationInfo.storageUuid, UserHandle.getUserHandleForUid(applicationInfo.uid)).getTotalBytes();
                        availableBytes = 0;
                        if (totalBytes >= 0) {
                            availableBytes = totalBytes;
                        }
                    } catch (IOException e) {
                        Log.e(TAG, e.getMessage(), e);
                    }
                }
                setLeftSpace(availableBytes);
            }
            return availableBytes;
        } catch (Exception e2) {
            Log.i(TAG, "Fail to access external storage", e2);
            return -3;
        }
    }

    public static long getLeftSpace() {
        long j = LEFT_SPACE.get();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getLeftSpace() return ");
        sb.append(j);
        Log.i(str, sb.toString());
        return j;
    }

    private static Intent getSaveToCloudIntent(Context context, String str, long j, boolean z, long j2, boolean z2) {
        Intent intent = new Intent(SAVE_TO_CLOUD_ALBUM_ACTION);
        intent.setPackage("com.miui.gallery");
        List queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (queryBroadcastReceivers != null && queryBroadcastReceivers.size() > 0) {
            intent.setComponent(new ComponentName("com.miui.gallery", ((ResolveInfo) queryBroadcastReceivers.get(0)).activityInfo.name));
        }
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_PATH_KAY, str);
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_FILE_LENGTH, j);
        if (z) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY, true);
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY, j2);
        } else {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY, false);
        }
        if (z2) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY, LocationManager.instance().getLastKnownLocation());
            Log.d(TAG, "broadcast last location to gallery");
        }
        return intent;
    }

    public static boolean hasSecondaryStorage() {
        boolean z = false;
        if (VERSION.SDK_INT == 28) {
            if (UserHandle.myUserId() == 0 && b.hb() && SECONDARY_STORAGE_PATH != null) {
                z = true;
            }
            return z;
        }
        if (b.hb() && SECONDARY_STORAGE_PATH != null) {
            z = true;
        }
        return z;
    }

    private static void initQuota(Context context) {
        if (VERSION.SDK_INT >= 26) {
            StorageStatsManager storageStatsManager = (StorageStatsManager) context.getSystemService(StorageStatsManager.class);
            Class[] clsArr = {StorageStatsManager.class};
            Method method = Util.getMethod(clsArr, "isQuotaSupported", "(Ljava/util/UUID;)Z");
            if (method != null) {
                sQuotaSupported = method.invokeBoolean(clsArr[0], storageStatsManager, new Object[]{StorageManager.UUID_DEFAULT});
                if (sQuotaSupported) {
                    long totalBytes = new StatFs(PRIMARY_STORAGE_PATH).getTotalBytes();
                    sQuotaBytes = (long) (0.9f * ((float) totalBytes));
                    sReserveBytes = totalBytes - sQuotaBytes;
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("quota: ");
                    sb.append(sQuotaBytes);
                    sb.append("|");
                    sb.append(sReserveBytes);
                    Log.d(str, sb.toString());
                }
            }
        }
    }

    public static void initStorage(Context context) {
        initQuota(context);
        if (b.hb()) {
            FileCompat.updateSDPath();
            String sdcardPath = CompatibilityUtils.getSdcardPath(context);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("initStorage sd=");
            sb.append(sdcardPath);
            Log.v(str, sb.toString());
            if (sdcardPath != null) {
                SECONDARY_STORAGE_PATH = sdcardPath;
                StringBuilder sb2 = new StringBuilder();
                sb2.append(SECONDARY_STORAGE_PATH);
                sb2.append(CAMERA_STORAGE_PATH_SUFFIX);
                SECONDARY_BUCKET_ID = sb2.toString().toLowerCase(Locale.ENGLISH).hashCode();
            } else {
                SECONDARY_STORAGE_PATH = null;
            }
            readSystemPriorityStorage();
        }
    }

    private static Uri insertToMediaStore(Context context, String str, String str2, long j, String str3, int i, String str4, long j2, int i2, int i3, Location location, boolean z) {
        Uri uri;
        ContentValues contentValues = new ContentValues(11);
        contentValues.put("title", str);
        contentValues.put("_display_name", str2);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("mime_type", str3);
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", str4);
        contentValues.put("_size", Long.valueOf(j2));
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        if (!z) {
            try {
                uri = context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
                try {
                    String str5 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("insert: title ");
                    sb.append(str);
                    sb.append(", orientation = ");
                    sb.append(i);
                    sb.append(", uri = ");
                    sb.append(uri);
                    Log.d(str5, sb.toString());
                    return uri;
                } catch (Exception e) {
                    e = e;
                }
            } catch (Exception e2) {
                e = e2;
                uri = null;
                String str6 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Failed to write MediaStore:");
                sb2.append(e.getMessage());
                Log.e(str6, sb2.toString(), e);
                return uri;
            }
        } else {
            Uri insert = context.getContentResolver().insert(Files.getContentUri("external"), contentValues);
            try {
                ParallelUtil.insertImageToParallelService(context, ContentUris.parseId(insert), str4);
                String str7 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("parallel insert: title ");
                sb3.append(str);
                sb3.append(", orientation = ");
                sb3.append(i);
                sb3.append(", uri = ");
                sb3.append(insert);
                Log.d(str7, sb3.toString());
                return insert;
            } catch (Exception e3) {
                e = e3;
                uri = insert;
                String str62 = TAG;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("Failed to write MediaStore:");
                sb22.append(e.getMessage());
                Log.e(str62, sb22.toString(), e);
                return uri;
            }
        }
    }

    public static boolean isCurrentStorageIsSecondary() {
        return SECONDARY_STORAGE_PATH != null && SECONDARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static boolean isLowStorageAtLastPoint() {
        return getLeftSpace() < LOW_STORAGE_THRESHOLD;
    }

    public static boolean isLowStorageSpace(String str) {
        return getAvailableSpace(str) < LOW_STORAGE_THRESHOLD;
    }

    public static boolean isPhoneStoragePriority() {
        return PRIMARY_STORAGE_PATH.equals(FIRST_CONSIDER_STORAGE_PATH);
    }

    public static boolean isQuotaSupported() {
        return sQuotaSupported && sQuotaBytes > 0;
    }

    public static boolean isRelatedStorage(Uri uri) {
        boolean z = false;
        if (uri == null) {
            return false;
        }
        String path = uri.getPath();
        if (path != null && (path.equals(PRIMARY_STORAGE_PATH) || path.equals(SECONDARY_STORAGE_PATH))) {
            z = true;
        }
        return z;
    }

    public static boolean isUseDocumentMode() {
        return VERSION.SDK_INT >= 28 && !isPhoneStoragePriority();
    }

    public static boolean isUsePhoneStorage() {
        return PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static Uri newImage(Context context, String str, long j, int i, int i2, int i3) {
        String generateFilepath = generateFilepath(str);
        ContentValues contentValues = new ContentValues(6);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", generateFilepath);
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        contentValues.put("mime_type", "image/jpeg");
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to new image");
            sb.append(e);
            Log.e(str2, sb.toString());
            return null;
        }
    }

    public static void readSystemPriorityStorage() {
        boolean z;
        if (hasSecondaryStorage()) {
            z = PriorityStorageBroadcastReceiver.isPriorityStorage();
            CameraSettings.setPriorityStoragePreference(z);
        } else {
            z = false;
        }
        FIRST_CONSIDER_STORAGE_PATH = z ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH;
        sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
        updateDirectory();
    }

    private static boolean renameSdcardFile(String str, String str2) {
        boolean renameFile;
        int i = 0;
        boolean z = false;
        while (true) {
            i++;
            try {
                renameFile = FileCompat.renameFile(str, str2);
                if (!renameFile && i < 5) {
                    z = renameFile;
                }
            } catch (IOException e) {
                Log.e(TAG, "renameSdcardFile failed", e);
                return z;
            }
        }
        return renameFile;
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0094 A[SYNTHETIC, Splitter:B:24:0x0094] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x009c A[SYNTHETIC, Splitter:B:27:0x009c] */
    /* JADX WARNING: Removed duplicated region for block: B:33:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void saveMorphoPanoramaOriginalPic(ByteBuffer byteBuffer, int i, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(DIRECTORY);
        sb.append(File.separator);
        sb.append(str);
        sb.append(File.separator);
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(File.separator);
        sb2.append(str);
        sb2.append("_");
        sb2.append(i);
        FileChannel fileChannel = null;
        try {
            File file2 = new File(generateFilepath(sb2.toString()));
            if (!file2.exists()) {
                file2.createNewFile();
            }
            FileChannel channel = new FileOutputStream(file2, false).getChannel();
            try {
                channel.write(byteBuffer);
                if (channel != null) {
                    try {
                        channel.close();
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e2) {
                e = e2;
                fileChannel = channel;
                try {
                    String str2 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("saveMorphoPanoramaOriginalPic  ");
                    sb3.append(e.toString());
                    Log.e(str2, sb3.toString());
                    if (fileChannel == null) {
                        fileChannel.close();
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileChannel != null) {
                        try {
                            fileChannel.close();
                        } catch (Exception e3) {
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileChannel = channel;
                if (fileChannel != null) {
                }
                throw th;
            }
        } catch (Exception e4) {
            e = e4;
            String str22 = TAG;
            StringBuilder sb32 = new StringBuilder();
            sb32.append("saveMorphoPanoramaOriginalPic  ");
            sb32.append(e.toString());
            Log.e(str22, sb32.toString());
            if (fileChannel == null) {
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0089 A[SYNTHETIC, Splitter:B:26:0x0089] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void saveOriginalPic(byte[] bArr, int i, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(DIRECTORY);
        sb.append(File.separator);
        sb.append(str);
        sb.append(File.separator);
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(File.separator);
        sb2.append(str);
        sb2.append("_");
        sb2.append(i);
        FileOutputStream fileOutputStream = null;
        try {
            File file2 = new File(generateFilepath(sb2.toString()));
            if (!file2.exists()) {
                file2.createNewFile();
            }
            FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
            try {
                fileOutputStream2.write(bArr);
            } catch (Exception e) {
                e = e;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th) {
                th = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.flush();
                        fileOutputStream.close();
                    } catch (Exception e2) {
                    }
                }
                throw th;
            }
            try {
                fileOutputStream2.flush();
                fileOutputStream2.close();
            } catch (Exception e3) {
            }
        } catch (Exception e4) {
            e = e4;
            try {
                Log.e(TAG, "saveMorphoPanoramaOriginalPic exception occurs", e);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
        }
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z) {
        saveToCloudAlbum(context, str, j, false, -1, z);
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z, long j2, boolean z2) {
        context.sendBroadcast(getSaveToCloudIntent(context, str, j, z, j2, z2));
    }

    public static boolean secondaryStorageMounted() {
        StringBuilder sb = new StringBuilder();
        sb.append(SECONDARY_STORAGE_PATH);
        sb.append(File.separator);
        sb.append(Environment.DIRECTORY_DCIM);
        return hasSecondaryStorage() && getAvailableSpace(sb.toString()) > 0;
    }

    private static void setLeftSpace(long j) {
        LEFT_SPACE.set(j);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setLeftSpace(");
        sb.append(j);
        sb.append(")");
        Log.i(str, sb.toString());
    }

    public static void setStorageListener(StorageListener storageListener) {
        if (storageListener != null) {
            sStorageListener = new WeakReference<>(storageListener);
        }
    }

    public static void switchStoragePathIfNeeded() {
        if (hasSecondaryStorage()) {
            String str = FIRST_CONSIDER_STORAGE_PATH;
            String str2 = SECONDARY_STORAGE_PATH;
            if (FIRST_CONSIDER_STORAGE_PATH.equals(SECONDARY_STORAGE_PATH)) {
                str2 = PRIMARY_STORAGE_PATH;
            }
            String str3 = sCurrentStoragePath;
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(CAMERA_STORAGE_PATH_SUFFIX);
            if (!isLowStorageSpace(sb.toString())) {
                sCurrentStoragePath = str;
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str2);
                sb2.append(CAMERA_STORAGE_PATH_SUFFIX);
                if (!isLowStorageSpace(sb2.toString())) {
                    sCurrentStoragePath = str2;
                } else {
                    return;
                }
            }
            if (!sCurrentStoragePath.equals(str3)) {
                updateDirectory();
                if (!(sStorageListener == null || sStorageListener.get() == null)) {
                    ((StorageListener) sStorageListener.get()).onStoragePathChanged();
                }
            }
            String str4 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Storage path is switched path = ");
            sb3.append(DIRECTORY);
            sb3.append(", FIRST_CONSIDER_STORAGE_PATH = ");
            sb3.append(FIRST_CONSIDER_STORAGE_PATH);
            sb3.append(", SECONDARY_STORAGE_PATH = ");
            sb3.append(SECONDARY_STORAGE_PATH);
            Log.d(str4, sb3.toString());
        }
    }

    public static void switchToPhoneStorage() {
        FIRST_CONSIDER_STORAGE_PATH = PRIMARY_STORAGE_PATH;
        if (!PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath)) {
            Log.v(TAG, "switchToPhoneStorage");
            sCurrentStoragePath = PRIMARY_STORAGE_PATH;
            updateDirectory();
            if (sStorageListener != null && sStorageListener.get() != null) {
                ((StorageListener) sStorageListener.get()).onStoragePathChanged();
            }
        }
    }

    private static void updateDirectory() {
        StringBuilder sb = new StringBuilder();
        sb.append(sCurrentStoragePath);
        sb.append(CAMERA_STORAGE_PATH_SUFFIX);
        DIRECTORY = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(sCurrentStoragePath);
        sb2.append(HIDE_CAMERA_STORAGE_PATH_SUFFIX);
        HIDEDIRECTORY = sb2.toString();
        BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    }

    private static byte[] updateExif(byte[] bArr, boolean z, String str, PictureInfo pictureInfo, int i, int i2, int i3) {
        if (!z && TextUtils.isEmpty(str) && pictureInfo == null) {
            return bArr;
        }
        long currentTimeMillis = System.currentTimeMillis();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            if (z) {
                exifInterface.addParallelProcessComment("processing", i, i2, i3);
            }
            if (!TextUtils.isEmpty(str)) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("save algorithm: ");
                sb.append(str);
                Log.d(str2, sb.toString());
                exifInterface.addAlgorithmComment(str);
            }
            if (pictureInfo != null) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("save xiaomi comment: ");
                sb2.append(pictureInfo.getInfoString());
                sb2.append(", aiType = ");
                sb2.append(pictureInfo.getAiType());
                Log.d(str3, sb2.toString());
                exifInterface.addAiType(pictureInfo.getAiType());
                if (pictureInfo.isBokehFrontCamera()) {
                    exifInterface.addFrontMirror(pictureInfo.isFrontMirror() ? 1 : 0);
                }
                exifInterface.addXiaomiComment(pictureInfo.getInfoString());
            }
            exifInterface.writeExif(bArr, (OutputStream) byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            bArr = byteArray;
        } catch (Exception e) {
            String str4 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("updateExif error ");
            sb3.append(e.getMessage());
            Log.e(str4, sb3.toString(), e);
        }
        String str5 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("update exif cost=");
        sb4.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str5, sb4.toString());
        return bArr;
    }

    public static boolean updateImage(Context context, byte[] bArr, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2) {
        boolean z;
        BufferedInputStream bufferedInputStream;
        Throwable th;
        OutputStream fileOutputStream;
        Throwable th2;
        byte[] bArr2 = bArr;
        ExifInterface exifInterface2 = exifInterface;
        String str3 = str;
        String str4 = str2;
        String generateFilepath = generateFilepath(str);
        StringBuilder sb = new StringBuilder();
        sb.append(str4 != null ? generateFilepath(str2) : generateFilepath);
        sb.append(".tmp");
        String sb2 = sb.toString();
        File file = new File(sb2);
        boolean z2 = false;
        if (bArr2 != null) {
            try {
                bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(bArr2));
                fileOutputStream = isUseDocumentMode() ? FileCompat.getFileOutputStream(sb2, true) : new BufferedOutputStream(new FileOutputStream(file));
                if (exifInterface2 == null) {
                    byte[] bArr3 = new byte[4096];
                    while (true) {
                        int read = bufferedInputStream.read(bArr3);
                        if (read == -1) {
                            break;
                        }
                        fileOutputStream.write(bArr3, 0, read);
                    }
                } else {
                    try {
                        exifInterface2.writeExif(bArr2, fileOutputStream);
                    } catch (IOException e) {
                        try {
                            Log.e(TAG, "Failed to rewrite Exif");
                            fileOutputStream.write(bArr2);
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                }
                if (fileOutputStream != null) {
                    $closeResource(null, fileOutputStream);
                }
                $closeResource(null, bufferedInputStream);
            } catch (Exception e2) {
                Log.e(TAG, "Failed to write image", e2);
                return false;
            } catch (Throwable th4) {
                $closeResource(th, bufferedInputStream);
                throw th4;
            }
        } else if (str4 != null) {
            sb2 = generateFilepath(str2);
        }
        long length = file.length();
        if (!isUseDocumentMode()) {
            boolean renameTo = file.renameTo(new File(generateFilepath));
            if (!(exifInterface2 == null || str4 == null)) {
                try {
                    new File(generateFilepath(str2)).delete();
                } catch (Exception e3) {
                    String str5 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("Exception when delete old file ");
                    sb3.append(str4);
                    Log.e(str5, sb3.toString(), e3);
                }
            }
            if (!renameTo) {
                String str6 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("renameTo failed, tmpPath = ");
                sb4.append(sb2);
                Log.w(str6, sb4.toString());
                return false;
            }
        } else {
            StringBuilder sb5 = new StringBuilder();
            sb5.append(generateFilepath);
            sb5.append(".mid");
            String sb6 = sb5.toString();
            if (renameSdcardFile(generateFilepath, sb6)) {
                z = renameSdcardFile(sb2, generateFilepath);
                if (z) {
                    deleteSdcardFile(sb6);
                } else {
                    String str7 = TAG;
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("fail to rename ");
                    sb7.append(sb2);
                    sb7.append(" to ");
                    sb7.append(generateFilepath);
                    Log.w(str7, sb7.toString());
                    deleteSdcardFile(sb2);
                }
            } else {
                String str8 = TAG;
                StringBuilder sb8 = new StringBuilder();
                sb8.append("fail to rename ");
                sb8.append(generateFilepath);
                sb8.append(" to ");
                sb8.append(sb6);
                Log.w(str8, sb8.toString());
                deleteSdcardFile(sb6);
                z = false;
            }
            FileCompat.removeDocumentFileForPath(sb2);
            FileCompat.removeDocumentFileForPath(generateFilepath);
            if (!z) {
                String str9 = TAG;
                StringBuilder sb9 = new StringBuilder();
                sb9.append("renameTo failed, tmpPath = ");
                sb9.append(sb2);
                Log.w(str9, sb9.toString());
                return false;
            }
        }
        ContentValues contentValues = new ContentValues(10);
        contentValues.put("title", str3);
        StringBuilder sb10 = new StringBuilder();
        sb10.append(str3);
        sb10.append(JPEG_SUFFIX);
        contentValues.put("_display_name", sb10.toString());
        if (bArr2 != null) {
            contentValues.put("mime_type", "image/jpeg");
            contentValues.put("orientation", Integer.valueOf(i));
            contentValues.put("_size", Long.valueOf(length));
            contentValues.put("width", Integer.valueOf(i2));
            contentValues.put("height", Integer.valueOf(i3));
            if (location != null) {
                contentValues.put("latitude", Double.valueOf(location.getLatitude()));
                contentValues.put("longitude", Double.valueOf(location.getLongitude()));
            }
            contentValues.put("_data", generateFilepath);
        } else if (str4 != null) {
            contentValues.put("_data", generateFilepath);
        }
        context.getContentResolver().update(uri, contentValues, null, null);
        long length2 = (long) bArr2.length;
        if (location == null) {
            z2 = true;
        }
        saveToCloudAlbum(context, generateFilepath, length2, z2);
        return true;
        if (fileOutputStream != null) {
            $closeResource(th2, fileOutputStream);
        }
        throw th;
    }

    public static boolean updateImageSize(ContentResolver contentResolver, Uri uri, long j) {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put("_size", Long.valueOf(j));
        try {
            contentResolver.update(uri, contentValues, null, null);
            return true;
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to updateMediaStore");
            sb.append(e);
            Log.e(str, sb.toString());
            return false;
        }
    }

    public static boolean updateImageWithExtraExif(Context context, byte[] bArr, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2, boolean z, boolean z2, String str3, PictureInfo pictureInfo) {
        return updateImage(context, updateExif(bArr, z2, str3, pictureInfo, i, i2, i3), exifInterface, uri, str, location, i, i2, i3, str2);
    }
}

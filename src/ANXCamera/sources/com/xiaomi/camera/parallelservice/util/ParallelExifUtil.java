package com.xiaomi.camera.parallelservice.util;

import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class ParallelExifUtil {
    private static final String TAG = ParallelExifUtil.class.getSimpleName();

    /* JADX WARNING: Removed duplicated region for block: B:27:0x009d A[SYNTHETIC, Splitter:B:27:0x009d] */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x00a5 A[Catch:{ IOException -> 0x00a1 }] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x00b7 A[SYNTHETIC, Splitter:B:37:0x00b7] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00bf A[Catch:{ IOException -> 0x00bb }] */
    public static void updateExif(String str) {
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        Exception e;
        FileOutputStream fileOutputStream2;
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateExif path:");
        sb.append(str);
        Log.v(str2, sb.toString());
        File file = new File(str);
        if (!file.exists()) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("updateExif path not exist. ");
            sb2.append(str);
            Log.e(str3, sb2.toString());
            return;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(str);
        sb3.append(".tmp");
        File file2 = new File(sb3.toString());
        try {
            file2.createNewFile();
            fileInputStream = new FileInputStream(file);
            try {
                fileOutputStream2 = new FileOutputStream(file2);
                try {
                    byte[] bArr = new byte[((int) file.length())];
                    fileInputStream.read(bArr);
                    fileOutputStream2.write(ExifInterface.removeParallelProcessComment(bArr));
                    fileOutputStream2.close();
                    file.delete();
                    file2.renameTo(file);
                    try {
                        fileInputStream.close();
                        fileOutputStream2.close();
                    } catch (IOException e2) {
                        Log.e(TAG, "close image file failed!", e2);
                    }
                } catch (Exception e3) {
                    e = e3;
                }
            } catch (Exception e4) {
                e = e4;
                fileOutputStream2 = null;
                e = e;
                try {
                    Log.e(TAG, "process exif failed!", e);
                    if (fileInputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (IOException e5) {
                            Log.e(TAG, "close image file failed!", e5);
                            throw th;
                        }
                    }
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = null;
                th = th;
                if (fileInputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                throw th;
            }
        } catch (Exception e6) {
            e = e6;
            fileInputStream = null;
            fileOutputStream2 = null;
            e = e;
            Log.e(TAG, "process exif failed!", e);
            if (fileInputStream != null) {
                fileInputStream.close();
            }
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream = null;
            fileOutputStream = null;
            th = th;
            if (fileInputStream != null) {
            }
            if (fileOutputStream != null) {
            }
            throw th;
        }
    }
}

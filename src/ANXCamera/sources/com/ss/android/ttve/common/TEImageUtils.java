package com.ss.android.ttve.common;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import com.android.camera.storage.Storage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class TEImageUtils {
    private static final String TAG = TEImageUtils.class.getSimpleName();

    public static void saveBitmap(Bitmap bitmap) {
        StringBuilder sb = new StringBuilder();
        sb.append(System.currentTimeMillis());
        sb.append(Storage.JPEG_SUFFIX);
        saveBitmap(bitmap, sb.toString());
    }

    public static void saveBitmap(Bitmap bitmap, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(TEFileUtils.getPath());
        sb.append("/");
        sb.append(str);
        String sb2 = sb.toString();
        String str2 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("saving Bitmap : ");
        sb3.append(str);
        TELogUtil.i(str2, sb3.toString());
        try {
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(sb2));
            bitmap.compress(CompressFormat.JPEG, 100, bufferedOutputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            String str3 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("Bitmap ");
            sb4.append(str);
            sb4.append(" saved!");
            TELogUtil.i(str3, sb4.toString());
        } catch (IOException e) {
            TELogUtil.e(TAG, "Err when saving bitmap...");
            e.printStackTrace();
        }
    }
}

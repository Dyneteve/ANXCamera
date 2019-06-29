package com.xiaomi.camera.base;

import android.content.Context;
import com.android.camera.log.Log;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public final class CommonUtil {
    private static final String TAG = "CommonUtil";

    private CommonUtil() {
    }

    private static boolean saveCameraCalibrationToFile(Context context, byte[] bArr, String str) {
        boolean z = false;
        if (!(bArr == null || context == null)) {
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream openFileOutput = context.openFileOutput(str, 0);
                try {
                    openFileOutput.write(bArr);
                    z = true;
                    try {
                        openFileOutput.flush();
                        openFileOutput.close();
                    } catch (Exception e) {
                        Log.w(TAG, "saveCameraCalibrationToFile: failed!", e);
                    }
                } catch (FileNotFoundException e2) {
                    e = e2;
                    fileOutputStream = openFileOutput;
                    Log.w(TAG, "saveCameraCalibrationToFile: FileNotFoundException", e);
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    return z;
                } catch (IOException e3) {
                    e = e3;
                    fileOutputStream = openFileOutput;
                    try {
                        Log.w(TAG, "saveCameraCalibrationToFile: IOException", e);
                        fileOutputStream.flush();
                        fileOutputStream.close();
                        return z;
                    } catch (Throwable th) {
                        th = th;
                        try {
                            fileOutputStream.flush();
                            fileOutputStream.close();
                        } catch (Exception e4) {
                            Log.w(TAG, "saveCameraCalibrationToFile: failed!", e4);
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream = openFileOutput;
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    throw th;
                }
            } catch (FileNotFoundException e5) {
                e = e5;
                Log.w(TAG, "saveCameraCalibrationToFile: FileNotFoundException", e);
                fileOutputStream.flush();
                fileOutputStream.close();
                return z;
            } catch (IOException e6) {
                e = e6;
                Log.w(TAG, "saveCameraCalibrationToFile: IOException", e);
                fileOutputStream.flush();
                fileOutputStream.close();
                return z;
            }
        }
        return z;
    }

    public static boolean saveCameraCalibrationToFile(Context context, byte[] bArr, boolean z) {
        return saveCameraCalibrationToFile(context, bArr, z ? "front_dual_camera_caldata.bin" : "back_dual_camera_caldata.bin");
    }
}

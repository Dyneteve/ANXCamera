package com.android.camera.permission;

import android.app.Activity;
import android.os.Build.VERSION;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import com.android.camera.CameraAppImpl;
import com.android.camera.log.Log;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import miui.os.Build;

public class PermissionManager {
    private static final int CAM_REQUEST_CODE_ASK_RUNTIME_PERMISSIONS = 100;
    private static final String TAG = "PermissionManager";
    private static List<String> mLaunchPermissionList = new ArrayList();
    private static List<String> sLocationPermissionList = new ArrayList();
    private static List<String> sRuntimePermissions = new ArrayList();
    private static List<String> sStoragePermissionList = new ArrayList();

    static {
        sLocationPermissionList.add("android.permission.ACCESS_FINE_LOCATION");
        sLocationPermissionList.add("android.permission.ACCESS_COARSE_LOCATION");
        sStoragePermissionList.add("android.permission.READ_EXTERNAL_STORAGE");
        sStoragePermissionList.add("android.permission.WRITE_EXTERNAL_STORAGE");
        mLaunchPermissionList.add("android.permission.CAMERA");
        mLaunchPermissionList.add("android.permission.RECORD_AUDIO");
        mLaunchPermissionList.addAll(sStoragePermissionList);
        sRuntimePermissions.addAll(mLaunchPermissionList);
        sRuntimePermissions.addAll(sLocationPermissionList);
        if (b.isMTKPlatform()) {
            sRuntimePermissions.add("android.permission.READ_PHONE_STATE");
        }
    }

    public static boolean checkCameraLaunchPermissions() {
        if (VERSION.SDK_INT < 23 || !Build.IS_INTERNATIONAL_BUILD) {
            return true;
        }
        if (getNeedCheckPermissionList(mLaunchPermissionList).size() > 0) {
            return false;
        }
        Log.i(TAG, "CheckCameraPermissions(), all on");
        return true;
    }

    public static boolean checkCameraLocationPermissions() {
        if (VERSION.SDK_INT < 23 || !Build.IS_INTERNATIONAL_BUILD) {
            return true;
        }
        if (getNeedCheckPermissionList(sLocationPermissionList).size() > 0) {
            return false;
        }
        Log.i(TAG, "checkCameraLocationPermissions(), all on");
        return true;
    }

    public static boolean checkPhoneStatePermission(Activity activity) {
        return VERSION.SDK_INT < 23 || !Build.IS_INTERNATIONAL_BUILD || ContextCompat.checkSelfPermission(activity, "android.permission.READ_PHONE_STATE") == 0;
    }

    public static boolean checkStoragePermissions() {
        if (VERSION.SDK_INT < 23 || !Build.IS_INTERNATIONAL_BUILD) {
            return true;
        }
        if (getNeedCheckPermissionList(sStoragePermissionList).size() > 0) {
            return false;
        }
        Log.i(TAG, "checkStoragePermissions on");
        return true;
    }

    public static int getCameraRuntimePermissionRequestCode() {
        return 100;
    }

    private static List<String> getNeedCheckPermissionList(List<String> list) {
        if (list.size() <= 0) {
            return list;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            if (ContextCompat.checkSelfPermission(CameraAppImpl.getAndroidContext(), str) != 0) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("getNeedCheckPermissionList() permission =");
                sb.append(str);
                Log.i(str2, sb.toString());
                arrayList.add(str);
            }
        }
        String str3 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("getNeedCheckPermissionList() listSize =");
        sb2.append(arrayList.size());
        Log.i(str3, sb2.toString());
        return arrayList;
    }

    public static boolean isCameraLaunchPermissionsResultReady(String[] strArr, int[] iArr) {
        HashMap hashMap = new HashMap();
        hashMap.put("android.permission.CAMERA", Integer.valueOf(0));
        hashMap.put("android.permission.RECORD_AUDIO", Integer.valueOf(0));
        hashMap.put("android.permission.WRITE_EXTERNAL_STORAGE", Integer.valueOf(0));
        for (int i = 0; i < strArr.length; i++) {
            hashMap.put(strArr[i], Integer.valueOf(iArr[i]));
        }
        return ((Integer) hashMap.get("android.permission.CAMERA")).intValue() == 0 && ((Integer) hashMap.get("android.permission.RECORD_AUDIO")).intValue() == 0 && ((Integer) hashMap.get("android.permission.WRITE_EXTERNAL_STORAGE")).intValue() == 0;
    }

    public static boolean isCameraLocationPermissionsResultReady(String[] strArr, int[] iArr) {
        HashMap hashMap = new HashMap();
        hashMap.put("android.permission.ACCESS_COARSE_LOCATION", Integer.valueOf(0));
        hashMap.put("android.permission.ACCESS_FINE_LOCATION", Integer.valueOf(0));
        for (int i = 0; i < strArr.length; i++) {
            hashMap.put(strArr[i], Integer.valueOf(iArr[i]));
        }
        return ((Integer) hashMap.get("android.permission.ACCESS_COARSE_LOCATION")).intValue() == 0 && ((Integer) hashMap.get("android.permission.ACCESS_FINE_LOCATION")).intValue() == 0;
    }

    public static boolean requestCameraRuntimePermissions(Activity activity) {
        if (VERSION.SDK_INT < 23 || !Build.IS_INTERNATIONAL_BUILD) {
            return true;
        }
        List needCheckPermissionList = getNeedCheckPermissionList(sRuntimePermissions);
        if (needCheckPermissionList.size() > 0) {
            Log.i(TAG, "requestCameraRuntimePermissions(), user check");
            ActivityCompat.requestPermissions(activity, (String[]) needCheckPermissionList.toArray(new String[needCheckPermissionList.size()]), 100);
            return false;
        }
        Log.i(TAG, "requestCameraRuntimePermissions(), all on");
        return true;
    }
}

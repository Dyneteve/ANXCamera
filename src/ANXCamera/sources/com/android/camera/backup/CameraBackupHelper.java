package com.android.camera.backup;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.XmlResourceParser;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.log.Log;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.KeyStringSettingItem;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;

public class CameraBackupHelper {
    private static final String TAG = CameraBackupHelper.class.getSimpleName();

    private static String convertAntiBandingMode(String str) {
        if (str == null) {
            return null;
        }
        char c = 65535;
        int hashCode = str.hashCode();
        if (hashCode != 109935) {
            if (hashCode != 1628397) {
                if (hashCode != 1658188) {
                    if (hashCode == 3005871 && str.equals("auto")) {
                        c = 3;
                    }
                } else if (str.equals("60hz")) {
                    c = 2;
                }
            } else if (str.equals("50hz")) {
                c = 1;
            }
        } else if (str.equals("off")) {
            c = 0;
        }
        switch (c) {
            case 0:
                return String.valueOf(0);
            case 1:
                return String.valueOf(1);
            case 2:
                return String.valueOf(2);
            case 3:
                return String.valueOf(3);
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unknown antibanding mode ");
                sb.append(str);
                Log.w(str2, sb.toString());
                return null;
        }
    }

    private static String convertContrast(String str) {
        return null;
    }

    private static String convertExposureMode(String str) {
        if (str == null) {
            return null;
        }
        char c = 65535;
        switch (str.hashCode()) {
            case -1364013995:
                if (str.equals("center")) {
                    c = 2;
                    break;
                }
                break;
            case -1200037852:
                if (str.equals("spot-metering")) {
                    c = 5;
                    break;
                }
                break;
            case -631448035:
                if (str.equals("average")) {
                    c = 0;
                    break;
                }
                break;
            case 3537154:
                if (str.equals("spot")) {
                    c = 4;
                    break;
                }
                break;
            case 1302812559:
                if (str.equals("center-weighted")) {
                    c = 3;
                    break;
                }
                break;
            case 2133765565:
                if (str.equals("frame-average")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
                return "0";
            case 2:
            case 3:
                return "1";
            case 4:
            case 5:
                return "2";
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unknown exposure mode ");
                sb.append(str);
                Log.w(str2, sb.toString());
                return null;
        }
    }

    private static String convertSaturation(String str) {
        return null;
    }

    private static String convertSharpness(String str) {
        return null;
    }

    private static String convertVideoQuality(String str) {
        if (str == null) {
            return null;
        }
        char c = 65535;
        switch (str.hashCode()) {
            case 52:
                if (str.equals("4")) {
                    c = 0;
                    break;
                }
                break;
            case 53:
                if (str.equals("5")) {
                    c = 2;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    c = 4;
                    break;
                }
                break;
            case 56:
                if (str.equals("8")) {
                    c = 6;
                    break;
                }
                break;
            case 57:
                if (str.equals("9")) {
                    c = 1;
                    break;
                }
                break;
            case 1567:
                if (str.equals("10")) {
                    c = 3;
                    break;
                }
                break;
            case 1568:
                if (str.equals(ComponentRunningShine.SHINE_LIVE_BEAUTY)) {
                    c = 5;
                    break;
                }
                break;
            case 1569:
                if (str.equals("12")) {
                    c = 7;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
            case 1:
                return "4";
            case 2:
            case 3:
                return "5";
            case 4:
            case 5:
                return "6";
            case 6:
            case 7:
                return "8";
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unknown video quality ");
                sb.append(str);
                Log.w(str2, sb.toString());
                return null;
        }
    }

    private static String filterValue(String str, int i) {
        if (Util.isSupported(str, (T[]) CameraAppImpl.getAndroidContext().getResources().getStringArray(i))) {
            return str;
        }
        return null;
    }

    private static List<String> getSettingsKeys() {
        ArrayList arrayList = new ArrayList();
        XmlResourceParser xml = CameraAppImpl.getAndroidContext().getResources().getXml(R.xml.camera_other_preferences);
        try {
            int eventType = xml.getEventType();
            while (eventType != 1) {
                if ((eventType == 2 || eventType == 3) && xml.getDepth() >= 3) {
                    String attributeValue = xml.getAttributeValue("http://schemas.android.com/apk/res/android", "key");
                    if (attributeValue != null) {
                        arrayList.add(attributeValue);
                    }
                }
                eventType = xml.next();
            }
        } catch (IOException | XmlPullParserException e) {
            Log.e(TAG, e.getMessage(), e);
        }
        xml.close();
        return arrayList;
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void restoreSettings(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr, boolean z) {
        char c;
        String str;
        List settingsKeys = getSettingsKeys();
        Editor edit = sharedPreferences.edit();
        int length = prefEntryArr.length;
        for (int i = 0; i < length; i++) {
            PrefEntry prefEntry = prefEntryArr[i];
            if (settingsKeys.contains(prefEntry.getLocalKey()) && ((!z || !CameraSettings.isCameraSpecific(prefEntry.getLocalKey())) && (z || CameraSettings.isCameraSpecific(prefEntry.getLocalKey())))) {
                try {
                    KeyStringSettingItem keyStringSettingItem = dataPackage.get(prefEntry.getCloudKey());
                    if (keyStringSettingItem != null) {
                        String localKey = prefEntry.getLocalKey();
                        switch (localKey.hashCode()) {
                            case -2096668591:
                                if (localKey.equals(CameraSettings.KEY_FRONT_MIRROR)) {
                                    c = 6;
                                    break;
                                }
                            case -885525953:
                                if (localKey.equals(CameraSettings.KEY_VIDEO_QUALITY)) {
                                    c = 0;
                                    break;
                                }
                            case -302378757:
                                if (localKey.equals(CameraSettings.KEY_QC_SATURATION)) {
                                    c = 4;
                                    break;
                                }
                            case -33912691:
                                if (localKey.equals(CameraSettings.KEY_ANTIBANDING)) {
                                    c = 1;
                                    break;
                                }
                            case 549001748:
                                if (localKey.equals(CameraSettings.KEY_AUTOEXPOSURE)) {
                                    c = 2;
                                    break;
                                }
                            case 936502456:
                                if (localKey.equals(CameraSettings.KEY_QC_SHARPNESS)) {
                                    c = 5;
                                    break;
                                }
                            case 1907727979:
                                if (localKey.equals(CameraSettings.KEY_QC_CONTRAST)) {
                                    c = 3;
                                    break;
                                }
                        }
                        c = 65535;
                        switch (c) {
                            case 0:
                                str = convertVideoQuality((String) keyStringSettingItem.getValue());
                                break;
                            case 1:
                                str = convertAntiBandingMode((String) keyStringSettingItem.getValue());
                                break;
                            case 2:
                                str = convertExposureMode((String) keyStringSettingItem.getValue());
                                break;
                            case 3:
                                str = convertContrast((String) keyStringSettingItem.getValue());
                                break;
                            case 4:
                                str = convertSaturation((String) keyStringSettingItem.getValue());
                                break;
                            case 5:
                                str = convertSharpness((String) keyStringSettingItem.getValue());
                                break;
                            case 6:
                                str = filterValue((String) keyStringSettingItem.getValue(), R.array.pref_front_mirror_entryvalues);
                                break;
                            default:
                                str = (String) keyStringSettingItem.getValue();
                                break;
                        }
                        if (str != null) {
                            if (prefEntry.getValueClass() == Integer.class) {
                                edit.putInt(prefEntry.getLocalKey(), Integer.parseInt(str));
                            } else if (prefEntry.getValueClass() == Long.class) {
                                edit.putLong(prefEntry.getLocalKey(), Long.parseLong(str));
                            } else if (prefEntry.getValueClass() == Boolean.class) {
                                edit.putBoolean(prefEntry.getLocalKey(), Boolean.parseBoolean(str));
                            } else if (prefEntry.getValueClass() == String.class) {
                                edit.putString(prefEntry.getLocalKey(), str);
                            }
                        }
                    }
                } catch (ClassCastException e) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("entry ");
                    sb.append(prefEntry.getCloudKey());
                    sb.append(" is not KeyStringSettingItem");
                    Log.e(str2, sb.toString());
                }
            }
        }
        edit.commit();
    }
}

package com.android.camera.data.data.global;

import android.content.Intent;
import android.support.v4.util.Pair;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.log.Log;
import com.mi.config.a;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class DataItemGlobal extends DataItemBase {
    public static final String CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY = "can_connect_network";
    public static final String DATA_COMMON_AI_SCENE_HINT = "pref_camera_first_ai_scene_use_hint_shown_key";
    public static final String DATA_COMMON_CURRENT_CAMERA_ID = "pref_camera_id_key";
    public static final String DATA_COMMON_CURRENT_MODE = "pref_camera_mode_key_intent_";
    public static final String DATA_COMMON_CUSTOM_WATERMARK_VERSION = "pref_custom_watermark_version";
    public static final String DATA_COMMON_DEVICE_WATERMARK = "pref_dualcamera_watermark";
    public static final String DATA_COMMON_DUALCAMERA_USERDEFINE_WATERMARK = "user_define_watermark";
    public static final String DATA_COMMON_FOCUS_SHOOT = "pref_camera_focus_shoot_key";
    public static final String DATA_COMMON_FRONT_CAM_ROTATE_HINT = "pref_front_camera_first_use_hint_shown_key";
    private static final String DATA_COMMON_OPEN_TIME = "pref_camera_open_time";
    public static final String DATA_COMMON_PORTRAIT_HINT = "pref_camera_first_portrait_use_hint_shown_key";
    public static final String DATA_COMMON_TIME_WATER_MARK = "pref_watermark_key";
    public static final String DATA_COMMON_ULTRA_WIDE_HINT = "pref_camera_first_ultra_wide_use_hint_shown_key";
    public static final String DATA_COMMON_ULTRA_WIDE_SAT_HINT = "pref_camera_first_ultra_wide_sat_use_hint_shown_key";
    public static final int INTENT_TYPE_IMAGE = 1;
    public static final int INTENT_TYPE_NORMAL = 0;
    public static final int INTENT_TYPE_SCAN_QR = 3;
    public static final int INTENT_TYPE_UNSPECIFIED = -1;
    public static final int INTENT_TYPE_VIDEO = 2;
    public static final int INTENT_TYPE_VOICE_CONTROL = 4;
    public static final String KEY = "camera_settings_global";
    private static final String TAG = "DataItemGlobal";
    private a mDataItemFeature;
    private int mIntentType = 0;
    private boolean mIsForceMainBackCamera;
    private Boolean mIsTimeOut;
    private int mLastCameraId;
    private ComponentGlobalRaw mManuallyRaw;
    private ComponentModuleList mModuleList;
    private boolean mRetriedIfCameraError;
    private boolean mStartFromKeyguard;

    @Retention(RetentionPolicy.SOURCE)
    public @interface IntentType {
    }

    public DataItemGlobal(a aVar) {
        this.mDataItemFeature = aVar;
        this.mLastCameraId = getCurrentCameraId();
        this.mModuleList = new ComponentModuleList(this);
    }

    private boolean determineTimeOut() {
        boolean isActualTimeOut = isActualTimeOut();
        if (!isActualTimeOut || !CameraSettings.retainCameraMode()) {
            return isActualTimeOut;
        }
        return false;
    }

    private int getCurrentCameraId(int i) {
        switch (i) {
            case 166:
            case 167:
            case 172:
            case 173:
            case 175:
                return 0;
            case 171:
                if (this.mDataItemFeature.gB()) {
                    return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(i)))).intValue();
                }
                return 0;
            case 176:
                return 1;
            default:
                return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(i)))).intValue();
        }
    }

    private int getCurrentMode(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(DATA_COMMON_CURRENT_MODE);
        sb.append(i);
        return getInt(sb.toString(), getDefaultMode(i));
    }

    private int getCurrentModeForFrontCamera(int i) {
        int currentMode = getCurrentMode(i);
        switch (currentMode) {
            case 166:
            case 167:
            case 173:
            case 175:
                break;
            case 168:
            case 169:
            case 170:
            case 172:
                return 162;
            case 171:
                if (this.mDataItemFeature.gB()) {
                    return currentMode;
                }
                break;
            default:
                return currentMode;
        }
        return 163;
    }

    private int getDefaultCameraId(int i) {
        return 0;
    }

    private boolean isActualTimeOut() {
        long currentTimeMillis = System.currentTimeMillis();
        return currentTimeMillis - getLong(DATA_COMMON_OPEN_TIME, currentTimeMillis) > 30000 || this.mIsTimeOut == null;
    }

    public boolean getCTACanCollect() {
        return getBoolean(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, false);
    }

    public ComponentModuleList getComponentModuleList() {
        return this.mModuleList;
    }

    public int getCurrentCameraId() {
        return getCurrentCameraId(getCurrentMode());
    }

    public int getCurrentMode() {
        return getCurrentMode(this.mIntentType);
    }

    public int getDataBackUpKey(int i) {
        if (i == 165) {
            i = ComponentModuleList.getTransferredMode(i);
        }
        int i2 = i | ((this.mIntentType + 2) << 8);
        return this.mStartFromKeyguard ? i2 | 65536 : i2;
    }

    public int getDefaultMode(int i) {
        switch (i) {
            case 1:
            case 3:
                return 163;
            case 2:
                return 162;
            default:
                return 163;
        }
    }

    public ComponentGlobalRaw getGlobalRaw() {
        if (this.mManuallyRaw == null) {
            this.mManuallyRaw = new ComponentGlobalRaw(this);
        }
        return this.mManuallyRaw;
    }

    public int getIntentType() {
        return this.mIntentType;
    }

    public int getLastCameraId() {
        return this.mLastCameraId;
    }

    public boolean getStartFromKeyguard() {
        return this.mStartFromKeyguard;
    }

    public String getTempRatioGlobal(String str) {
        return getString(str, null);
    }

    public boolean isFirstShowCTAConCollect() {
        return !contains(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY);
    }

    public boolean isForceMainBackCamera() {
        return this.mIsForceMainBackCamera;
    }

    public boolean isGlobalSwitchOn(String str) {
        return getBoolean(str, false);
    }

    public boolean isIntentAction() {
        return this.mIntentType != 0;
    }

    public boolean isNormalIntent() {
        return this.mIntentType == 0;
    }

    public boolean isRetriedIfCameraError() {
        return this.mRetriedIfCameraError;
    }

    public boolean isTimeOut() {
        return this.mIsTimeOut == null || this.mIsTimeOut.booleanValue();
    }

    public boolean isTransient() {
        return false;
    }

    public boolean matchCustomWatermarkVersion() {
        String gF = this.mDataItemFeature.gF();
        if (!contains(DATA_COMMON_CUSTOM_WATERMARK_VERSION)) {
            return !this.mDataItemFeature.K(c.tL);
        }
        if (arrayMapContainsKey(DATA_COMMON_CUSTOM_WATERMARK_VERSION)) {
            arrayMapRemove(DATA_COMMON_CUSTOM_WATERMARK_VERSION);
        }
        String string = getString(DATA_COMMON_CUSTOM_WATERMARK_VERSION, "");
        int indexOf = string.indexOf(58);
        if (indexOf > 0) {
            String substring = string.substring(0, indexOf);
            String substring2 = string.substring(indexOf + 1);
            StringBuilder sb = new StringBuilder();
            sb.append(b.qn);
            sb.append(b.getGivenName());
            if (substring.equals(sb.toString()) && substring2.equals(gF)) {
                return true;
            }
        }
        String str = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("mismatch custom watermark version: ");
        sb2.append(string);
        Log.w(str, sb2.toString());
        return false;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:100:0x0191, code lost:
        setTempRatioGlobal(com.android.camera.CameraIntentManager.CameraMode.SQUARE, null);
        r9 = 163;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:101:0x0198, code lost:
        if (r9 != 163) goto L_0x01ad;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:103:0x01a6, code lost:
        if (com.android.camera.data.data.config.ComponentConfigRatio.RATIO_1X1.equals(getTempRatioGlobal(com.android.camera.CameraIntentManager.CameraMode.SQUARE)) == false) goto L_0x01ad;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:104:0x01a8, code lost:
        setTempRatioGlobal(com.android.camera.CameraIntentManager.CameraMode.SQUARE, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:105:0x01ad, code lost:
        if (r12 != false) goto L_0x01d7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:106:0x01af, code lost:
        r8.mIsTimeOut = java.lang.Boolean.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:107:0x01b5, code lost:
        if (r0 == false) goto L_0x01c2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:108:0x01b7, code lost:
        r8.mIntentType = r3;
        r8.mStartFromKeyguard = r11;
        r8.mModuleList.setIntentType(r8.mIntentType);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:110:0x01c6, code lost:
        if (r9 == getCurrentMode()) goto L_0x01ce;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:111:0x01c8, code lost:
        setCurrentMode(r9);
        com.android.camera.module.ModuleManager.setActiveModuleIndex(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:113:0x01d2, code lost:
        if (r1 == getCurrentCameraId()) goto L_0x01d7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:114:0x01d4, code lost:
        setCameraId(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:116:0x01e4, code lost:
        return new android.support.v4.util.Pair<>(java.lang.Integer.valueOf(r1), java.lang.Integer.valueOf(r9));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x007a, code lost:
        r3 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x0081, code lost:
        if (r10.booleanValue() == false) goto L_0x007a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0085, code lost:
        r9 = com.android.camera.CameraIntentManager.getInstance(r9);
        r10 = r9.getCameraModeId();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0090, code lost:
        if (r10 != 160) goto L_0x00a1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0096, code lost:
        if (determineTimeOut() == false) goto L_0x009d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x0098, code lost:
        r10 = getDefaultMode(0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x009d, code lost:
        r10 = getCurrentMode(0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00a5, code lost:
        r9 = r9.isUseFrontCamera();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00ad, code lost:
        if (r9.isOnlyForceOpenMainBackCamera() != false) goto L_0x00af;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00af, code lost:
        setForceMainBackCamera(true);
        r9 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00b9, code lost:
        if (determineTimeOut() != false) goto L_0x00bb;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00bb, code lost:
        r9 = getDefaultCameraId(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00c0, code lost:
        r9 = getCurrentCameraId(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00c4, code lost:
        r12 = TAG;
        r13 = new java.lang.StringBuilder();
        r13.append("intent from voice control assist : pendingOpenId = ");
        r13.append(r9);
        r13.append(";pendingOpenModule = ");
        r13.append(r10);
        com.android.camera.log.Log.d(r12, r13.toString());
        r8.mIntentType = 0;
        r8.mStartFromKeyguard = r11;
        r8.mModuleList.setIntentType(r8.mIntentType);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00f1, code lost:
        if (r10 == getCurrentMode()) goto L_0x00f9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00f3, code lost:
        setCurrentMode(r10);
        com.android.camera.module.ModuleManager.setActiveModuleIndex(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x00fd, code lost:
        if (r9 == getCurrentCameraId()) goto L_0x0102;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x00ff, code lost:
        setCameraId(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x010f, code lost:
        return new android.support.v4.util.Pair<>(java.lang.Integer.valueOf(r9), java.lang.Integer.valueOf(r10));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x0119, code lost:
        r9 = com.android.camera.CameraIntentManager.getInstance(r9).getCameraFacing();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0121, code lost:
        if (r9 == -1) goto L_0x0126;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x0123, code lost:
        setCameraIdTransient(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0126, code lost:
        if (r13 == false) goto L_0x0130;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x012c, code lost:
        if (determineTimeOut() == false) goto L_0x0130;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x012e, code lost:
        r10 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x0130, code lost:
        r10 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0134, code lost:
        if (r8.mIntentType != r3) goto L_0x013c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0138, code lost:
        if (r8.mStartFromKeyguard == r11) goto L_0x013d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x013c, code lost:
        r0 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x013d, code lost:
        r13 = 163;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x013f, code lost:
        if (r0 == false) goto L_0x0151;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x0147, code lost:
        if ("android.media.action.STILL_IMAGE_CAMERA".equals(r1) == false) goto L_0x0151;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x0149, code lost:
        r9 = getCurrentCameraId(163);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x014e, code lost:
        r1 = r9;
        r9 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x0151, code lost:
        if (r0 == false) goto L_0x0162;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x0159, code lost:
        if ("android.media.action.VIDEO_CAMERA".equals(r1) == false) goto L_0x0162;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x015b, code lost:
        r13 = 162;
        r9 = getCurrentCameraId(162);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x0162, code lost:
        if (r10 == false) goto L_0x0177;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x0164, code lost:
        r1 = getDefaultMode(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x0168, code lost:
        if (r9 >= 0) goto L_0x016f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:89:0x016a, code lost:
        r9 = getDefaultCameraId(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:90:0x016f, code lost:
        r9 = getCurrentCameraId(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x0173, code lost:
        r7 = r1;
        r1 = r9;
        r9 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:92:0x0177, code lost:
        if (r9 == 1) goto L_0x017e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:93:0x0179, code lost:
        r9 = getCurrentMode(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x017e, code lost:
        r9 = getCurrentModeForFrontCamera(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:0x0182, code lost:
        r1 = getCurrentCameraId(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:97:0x018a, code lost:
        if (isActualTimeOut() == false) goto L_0x01ad;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:99:0x018f, code lost:
        if (r9 != 165) goto L_0x0198;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Pair<Integer, Integer> parseIntent(Intent intent, Boolean bool, boolean z, boolean z2, boolean z3) {
        char c;
        boolean z4 = false;
        setForceMainBackCamera(false);
        if (DataRepository.dataItemFeature().fu() && Util.isScreenSlideOff(CameraAppImpl.getAndroidContext())) {
            setCameraId(0);
        }
        String action = intent.getAction();
        if (action == null) {
            action = "<unknown>";
        }
        int i = 3;
        switch (action.hashCode()) {
            case -1960745709:
                if (action.equals("android.media.action.IMAGE_CAPTURE")) {
                    c = 0;
                    break;
                }
            case -1528697361:
                if (action.equals(CameraIntentManager.ACTION_VOICE_CONTROL)) {
                    c = 6;
                    break;
                }
            case -1449841107:
                if (action.equals(CameraIntentManager.ACTION_QR_CODE_ZXING)) {
                    c = 3;
                    break;
                }
            case 464109999:
                if (action.equals("android.media.action.STILL_IMAGE_CAMERA")) {
                    c = 4;
                    break;
                }
            case 701083699:
                if (action.equals("android.media.action.VIDEO_CAPTURE")) {
                    c = 1;
                    break;
                }
            case 1130890360:
                if (action.equals("android.media.action.VIDEO_CAMERA")) {
                    c = 5;
                    break;
                }
            case 1280056183:
                if (action.equals(CameraIntentManager.ACTION_QR_CODE_CAPTURE)) {
                    c = 2;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                i = 1;
                break;
            case 1:
                i = 2;
                break;
            case 2:
            case 3:
                break;
            case 4:
            case 5:
                break;
            case 6:
                break;
        }
    }

    public String provideKey() {
        return "camera_settings_global";
    }

    public void reInit() {
        this.mModuleList.reInit();
        ProviderEditor editor = editor();
        this.mIsTimeOut = Boolean.valueOf(false);
        editor.putLong(DATA_COMMON_OPEN_TIME, System.currentTimeMillis());
        editor.putLong(CameraSettings.KEY_OPEN_CAMERA_FAIL, 0);
        int currentCameraId = getCurrentCameraId(getCurrentMode());
        this.mLastCameraId = currentCameraId;
        editor.putString("pref_camera_id_key", String.valueOf(currentCameraId));
        editor.apply();
    }

    public void resetAll() {
        this.mIsTimeOut = null;
        editor().clear().putInt(CameraSettings.KEY_VERSION, 4).apply();
    }

    public void resetTimeOut() {
        this.mIsTimeOut = Boolean.valueOf(false);
        editor().putLong(DATA_COMMON_OPEN_TIME, System.currentTimeMillis()).apply();
    }

    public void setCTACanCollect(boolean z) {
        editor().putBoolean(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, z).apply();
    }

    public void setCameraId(int i) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        editor().putString("pref_camera_id_key", String.valueOf(i)).apply();
    }

    public void setCameraIdTransient(int i) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        putString("pref_camera_id_key", String.valueOf(i));
    }

    public void setCurrentMode(int i) {
        ProviderEditor editor = editor();
        StringBuilder sb = new StringBuilder();
        sb.append(DATA_COMMON_CURRENT_MODE);
        sb.append(this.mIntentType);
        editor.putInt(sb.toString(), i).apply();
    }

    public void setForceMainBackCamera(boolean z) {
        this.mIsForceMainBackCamera = z;
    }

    public void setRetriedIfCameraError(boolean z) {
        this.mRetriedIfCameraError = z;
    }

    public void setStartFromKeyguard(boolean z) {
        this.mStartFromKeyguard = z;
    }

    public void setTempRatioGlobal(String str, String str2) {
        editor().putString(str, str2).apply();
    }

    public void updateCustomWatermarkVersion() {
        String gF = this.mDataItemFeature.gF();
        StringBuilder sb = new StringBuilder();
        sb.append(b.qn);
        sb.append(b.getGivenName());
        sb.append(":");
        sb.append(gF);
        String sb2 = sb.toString();
        editor().putString(DATA_COMMON_CUSTOM_WATERMARK_VERSION, sb2).apply();
        String str = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("custom watermark version updated: ");
        sb3.append(sb2);
        Log.i(str, sb3.toString());
    }
}

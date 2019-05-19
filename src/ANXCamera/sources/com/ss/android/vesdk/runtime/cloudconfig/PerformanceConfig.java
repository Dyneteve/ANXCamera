package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Build.VERSION;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.text.TextUtils;
import android.util.Log;
import com.ss.android.vesdk.runtime.VERuntime;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class PerformanceConfig {
    public static final String BASE_URL_CHINA = "https://effect.snssdk.com/devicehub/getSettings?";
    public static final String BASE_URL_SINGAPORE = "https://sg-effect.byteoversea.com/devicehub/getSetting?";
    public static final String BASE_URL_TEST = "https://effect.snssdk.com/devicehub/getSettings/?";
    public static final String BASE_URL_US = "https://va-effect.byteoversea.com/devicehub/getSettings?";
    public static final int DISABLE = 2;
    public static final int ENABLE = 1;
    public static final String KEY_I_EARPHONE_ECHO_AAUDIO = "earphone_echo_aaudio";
    public static final String KEY_I_EARPHONE_ECHO_HUAWEI = "earphone_echo_huawei";
    public static final String KEY_I_EARPHONE_ECHO_NORMAL = "earphone_echo_normal";
    public static final String KEY_I_IMPORT_ENCODE_MODE = "import_encode_mode";
    public static final String KEY_I_IMPORT_HW_BITRATE_MODE = "import_hw_bitrate_mode";
    public static final String KEY_I_IMPORT_HW_PROFILE = "import_hw_profile";
    public static final String KEY_I_IMPORT_SHORTER_PIXELS = "import_shorter_pixels";
    public static final String KEY_I_IMPORT_SW_BITRATE_MODE = "import_sw_bitrate_mode";
    public static final String KEY_I_IMPORT_VIDEO_HW_BITRATE = "import_video_hw_bitrate";
    public static final String KEY_I_IMPORT_VIDEO_SW_CRF = "import_video_sw_crf";
    public static final String KEY_I_IMPORT_VIDEO_SW_GOP = "import_video_sw_gop";
    public static final String KEY_I_IMPORT_VIDEO_SW_MAXRATE = "import_video_sw_maxrate";
    public static final String KEY_I_IMPORT_VIDEO_SW_PRESET = "import_video_sw_preset";
    public static final String KEY_I_IMPORT_VIDEO_SW_QP = "import_video_sw_qp";
    public static final String KEY_I_RECORD_CAMERA_COMPAT_LEVEL = "record_camera_compat_level";
    public static final String KEY_I_RECORD_CAMERA_TYPE = "record_camera_type";
    public static final String KEY_I_RECORD_ENCODE_MODE = "record_encode_mode";
    public static final String KEY_I_RECORD_HW_BITRATE_MODE = "record_hw_bitrate_mode";
    public static final String KEY_I_RECORD_HW_PROFILE = "record_hw_profile";
    public static final String KEY_I_RECORD_RESOLUTION_HEIGHT = "record_resolution_height";
    public static final String KEY_I_RECORD_RESOLUTION_WIDTH = "record_resolution_width";
    public static final String KEY_I_RECORD_SW_BITRATE_MODE = "record_sw_bitrate_mode";
    public static final String KEY_I_RECORD_VIDEO_HW_BITRATE = "record_video_hw_bitrate";
    public static final String KEY_I_RECORD_VIDEO_SW_CRF = "record_video_sw_crf";
    public static final String KEY_I_RECORD_VIDEO_SW_GOP = "record_video_sw_gop";
    public static final String KEY_I_RECORD_VIDEO_SW_MAXRATE = "record_video_sw_maxrate";
    public static final String KEY_I_RECORD_VIDEO_SW_PRESET = "record_video_sw_preset";
    public static final String KEY_I_RECORD_VIDEO_SW_QP = "record_video_sw_qp";
    public static final String KEY_I_SYNTHETIC_ENCODE_MODE = "synthetic_encode_mode";
    public static final String KEY_I_SYNTHETIC_HW_BITRATE_MODE = "synthetic_hw_bitrate_mode";
    public static final String KEY_I_SYNTHETIC_HW_PROFILE = "synthetic_hw_profile";
    public static final String KEY_I_SYNTHETIC_SW_BITRATE_MODE = "synthetic_sw_bitrate_mode";
    public static final String KEY_I_SYNTHETIC_VIDEO_HW_BITRATE = "synthetic_video_hw_bitrate";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_CRF = "synthetic_video_sw_crf";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_GOP = "synthetic_video_sw_gop";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE = "synthetic_video_sw_maxrate";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_PRESET = "synthetic_video_sw_preset";
    public static final String KEY_I_SYNTHETIC_VIDEO_SW_QP = "synthetic_video_sw_qp";
    private static final String TAG = "PerfConfig";
    public static final int UNDEFINED = 0;
    public static final List<Config> sConfigList = new ArrayList(20);
    private static final String sConfigs = "ShortVideoConfig";
    private static final String sPerfConfigPrefix = "PerfConfig_";
    public static final VECloudConfig sVECloudConfig = new VECloudConfig();

    private static class ConfigAsyncTask extends AsyncTask<Void, Void, Void> {
        private ConfigAsyncTask() {
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            try {
                Context context = VERuntime.getInstance().getContext();
                Map map = DeviceInfoDetector.toMap();
                map.put("package_name", context.getPackageName());
                map.put("model", Build.MODEL);
                map.put("os_version", VERSION.RELEASE);
                map.put("local", Locale.getDefault().getCountry());
                map.put("platform", "android");
                String body = HttpRequest.get((CharSequence) PerformanceConfig.BASE_URL_CHINA, map, true).body();
                String str = PerformanceConfig.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("cloud config result = ");
                sb.append(body);
                Log.d(str, sb.toString());
                try {
                    JSONObject jSONObject = new JSONObject(body);
                    if (jSONObject.getInt("code") == 0) {
                        JSONObject jSONObject2 = jSONObject.getJSONObject("data");
                        HashMap hashMap = new HashMap();
                        for (Config config : PerformanceConfig.sConfigList) {
                            if (!jSONObject2.has(config.key)) {
                                String str2 = PerformanceConfig.TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("Configuration field not available for this config:");
                                sb2.append(config.key);
                                Log.e(str2, sb2.toString());
                            } else {
                                hashMap.put(config.key, PerformanceConfig.doubtingFilter(config, jSONObject2, true));
                            }
                        }
                        PerformanceConfig.setPerformanceConfig(VERuntime.getInstance().getContext(), hashMap);
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Return code is ");
                        sb3.append(jSONObject.getInt("code"));
                        Log.e(PerformanceConfig.TAG, "Config return code not 0.", new IllegalStateException(sb3.toString()));
                    }
                } catch (JSONException e) {
                    Log.e(PerformanceConfig.TAG, "Parse json result failed! ", e);
                    e.printStackTrace();
                }
            } catch (Exception e2) {
                Log.e(PerformanceConfig.TAG, "Fetch config failed! ", e2);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConfigKey {
    }

    static {
        sConfigList.add(new Config(KEY_I_RECORD_CAMERA_TYPE, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_RECORD_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_WIDTH, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_RECORD_RESOLUTION_HEIGHT, 0, Integer.valueOf(1024)));
        sConfigList.add(new Config(KEY_I_RECORD_CAMERA_COMPAT_LEVEL, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_RECORD_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_RECORD_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_RECORD_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_SHORTER_PIXELS, 0, Integer.valueOf(576)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_IMPORT_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_IMPORT_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_IMPORT_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_ENCODE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_CRF, 0, Integer.valueOf(15)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE, 0, Integer.valueOf(4194304)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE, 0, Integer.valueOf(5000000)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_PRESET, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_GOP, 0, Integer.valueOf(35)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_VIDEO_SW_QP, 0, Integer.valueOf(2)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_SW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_HW_BITRATE_MODE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_SYNTHETIC_HW_PROFILE, 0, Integer.valueOf(0)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_NORMAL, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_AAUDIO, 0, Integer.valueOf(1)));
        sConfigList.add(new Config(KEY_I_EARPHONE_ECHO_HUAWEI, 0, Integer.valueOf(1)));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:128:0x01f9, code lost:
        r10 = 65535;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:130:0x0200, code lost:
        switch(r10) {
            case 0: goto L_0x02f9;
            case 1: goto L_0x02ec;
            case 2: goto L_0x02ec;
            case 3: goto L_0x02ec;
            case 4: goto L_0x02e1;
            case 5: goto L_0x02e1;
            case 6: goto L_0x02e1;
            case 7: goto L_0x02d4;
            case 8: goto L_0x02d4;
            case 9: goto L_0x02d4;
            case 10: goto L_0x02c1;
            case 11: goto L_0x02b0;
            case 12: goto L_0x029f;
            case 13: goto L_0x028b;
            case 14: goto L_0x028b;
            case 15: goto L_0x028b;
            case 16: goto L_0x027d;
            case 17: goto L_0x027d;
            case 18: goto L_0x027d;
            case 19: goto L_0x0271;
            case 20: goto L_0x0265;
            case 21: goto L_0x0265;
            case 22: goto L_0x0265;
            case 23: goto L_0x0259;
            case 24: goto L_0x0259;
            case 25: goto L_0x0259;
            case 26: goto L_0x024d;
            case 27: goto L_0x024d;
            case 28: goto L_0x024d;
            case 29: goto L_0x023f;
            case 30: goto L_0x023f;
            case 31: goto L_0x023f;
            case 32: goto L_0x0231;
            case 33: goto L_0x0231;
            case 34: goto L_0x0231;
            case 35: goto L_0x0223;
            case 36: goto L_0x0215;
            case 37: goto L_0x0207;
            default: goto L_0x0203;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:132:0x0207, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:133:0x020b, code lost:
        if (r10 == 0) goto L_0x020f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:134:0x020d, code lost:
        if (r10 != 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:136:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:138:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:139:0x0219, code lost:
        if (r10 == 0) goto L_0x021d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:140:0x021b, code lost:
        if (r10 != 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:142:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:144:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:145:0x0227, code lost:
        if (r10 == 0) goto L_0x022b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:146:0x0229, code lost:
        if (r10 != 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:150:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:151:0x0235, code lost:
        if (r10 < 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:152:0x0237, code lost:
        if (r10 > 2) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:154:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:156:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:157:0x0243, code lost:
        if (r10 < 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:158:0x0245, code lost:
        if (r10 > 50) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:160:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:162:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:163:0x0251, code lost:
        if (r10 < 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:165:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:167:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:168:0x025d, code lost:
        if (r10 < 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:170:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:172:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:173:0x0269, code lost:
        if (r10 < 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:175:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:177:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:178:0x0275, code lost:
        if (r10 < 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:180:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:182:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:183:0x0281, code lost:
        if (r10 < 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:184:0x0283, code lost:
        if (r10 > 9) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:186:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:188:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:190:0x0292, code lost:
        if (r10 < 100000) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:192:0x0297, code lost:
        if (r10 > 10000000) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:194:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:196:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:199:0x02a5, code lost:
        if ((r10 % 16) != 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:200:0x02a7, code lost:
        if (r10 < 160) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:201:0x02a9, code lost:
        if (r10 > 5120) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:202:0x02ab, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:204:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:207:0x02b6, code lost:
        if ((r10 % 16) != 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:208:0x02b8, code lost:
        if (r10 < 160) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:209:0x02ba, code lost:
        if (r10 > 5120) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:210:0x02bc, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:212:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:215:0x02c7, code lost:
        if ((r10 % 16) != 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:216:0x02c9, code lost:
        if (r10 < 160) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:217:0x02cb, code lost:
        if (r10 > 5120) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:218:0x02cd, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:219:0x02d2, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:221:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:222:0x02d8, code lost:
        if (r10 == 0) goto L_0x02dc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:223:0x02da, code lost:
        if (r10 != 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:225:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:227:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:228:0x02e5, code lost:
        if (r10 <= 0) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:230:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:232:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:233:0x02f0, code lost:
        if (r10 < 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:234:0x02f2, code lost:
        if (r10 > 50) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:236:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:238:?, code lost:
        r10 = r0.getInt(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:239:0x02fd, code lost:
        if (r10 < 1) goto L_0x0304;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:241:?, code lost:
        r0 = java.lang.String.valueOf(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:242:0x0304, code lost:
        r0 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:246:0x030b, code lost:
        throw new java.lang.IllegalStateException("Shouldn't reach here. Unmatched config.key case");
     */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:147:0x022b=Splitter:B:147:0x022b, B:224:0x02dc=Splitter:B:224:0x02dc, B:141:0x021d=Splitter:B:141:0x021d, B:135:0x020f=Splitter:B:135:0x020f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static String doubtingFilter(Config config, JSONObject jSONObject, boolean z) {
        char c;
        Config config2 = config;
        JSONObject jSONObject2 = jSONObject;
        if (jSONObject2 != null) {
            String str = config2.key;
            String str2 = null;
            if (!jSONObject2.has(str)) {
                String str3 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("fetched config do not contain config.key = ");
                sb.append(str);
                Log.e(str3, sb.toString());
                if (z) {
                    return config2.defaultValue.toString();
                }
                return null;
            }
            boolean z2 = false;
            try {
                switch (str.hashCode()) {
                    case -2004732869:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE)) {
                            c = 6;
                            break;
                        }
                    case -2003520120:
                        if (str.equals(KEY_I_EARPHONE_ECHO_AAUDIO)) {
                            c = '$';
                            break;
                        }
                    case -1815767918:
                        if (str.equals(KEY_I_IMPORT_ENCODE_MODE)) {
                            c = 8;
                            break;
                        }
                    case -1785223334:
                        if (str.equals(KEY_I_EARPHONE_ECHO_HUAWEI)) {
                            c = '%';
                            break;
                        }
                    case -1694569666:
                        if (str.equals(KEY_I_RECORD_ENCODE_MODE)) {
                            c = 7;
                            break;
                        }
                    case -1668300853:
                        if (str.equals(KEY_I_IMPORT_HW_BITRATE_MODE)) {
                            c = 22;
                            break;
                        }
                    case -1645123140:
                        if (str.equals(KEY_I_IMPORT_VIDEO_SW_PRESET)) {
                            c = 18;
                            break;
                        }
                    case -1618492838:
                        if (str.equals(KEY_I_EARPHONE_ECHO_NORMAL)) {
                            c = '#';
                            break;
                        }
                    case -1558016730:
                        if (str.equals(KEY_I_RECORD_CAMERA_TYPE)) {
                            c = 0;
                            break;
                        }
                    case -1376521253:
                        if (str.equals(KEY_I_IMPORT_VIDEO_HW_BITRATE)) {
                            c = 5;
                            break;
                        }
                    case -1303806036:
                        if (str.equals(KEY_I_RECORD_RESOLUTION_HEIGHT)) {
                            c = 11;
                            break;
                        }
                    case -1248494809:
                        if (str.equals(KEY_I_RECORD_HW_PROFILE)) {
                            c = 23;
                            break;
                        }
                    case -1236656006:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_CRF)) {
                            c = 3;
                            break;
                        }
                    case -1236652245:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_GOP)) {
                            c = 28;
                            break;
                        }
                    case -1136469343:
                        if (str.equals(KEY_I_RECORD_RESOLUTION_WIDTH)) {
                            c = 10;
                            break;
                        }
                    case -532682277:
                        if (str.equals(KEY_I_RECORD_VIDEO_SW_MAXRATE)) {
                            c = 13;
                            break;
                        }
                    case -457298194:
                        if (str.equals(KEY_I_RECORD_VIDEO_SW_CRF)) {
                            c = 1;
                            break;
                        }
                    case -457294433:
                        if (str.equals(KEY_I_RECORD_VIDEO_SW_GOP)) {
                            c = 26;
                            break;
                        }
                    case -144025773:
                        if (str.equals(KEY_I_IMPORT_HW_PROFILE)) {
                            c = 24;
                            break;
                        }
                    case 18051394:
                        if (str.equals(KEY_I_RECORD_SW_BITRATE_MODE)) {
                            c = ' ';
                            break;
                        }
                    case 80523290:
                        if (str.equals(KEY_I_IMPORT_VIDEO_SW_CRF)) {
                            c = 2;
                            break;
                        }
                    case 80527051:
                        if (str.equals(KEY_I_IMPORT_VIDEO_SW_GOP)) {
                            c = 27;
                            break;
                        }
                    case 514297628:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_QP)) {
                            c = 31;
                            break;
                        }
                    case 614850679:
                        if (str.equals(KEY_I_RECORD_HW_BITRATE_MODE)) {
                            c = 20;
                            break;
                        }
                    case 638028392:
                        if (str.equals(KEY_I_RECORD_VIDEO_SW_PRESET)) {
                            c = 17;
                            break;
                        }
                    case 681699503:
                        if (str.equals(KEY_I_RECORD_VIDEO_HW_BITRATE)) {
                            c = 4;
                            break;
                        }
                    case 762676278:
                        if (str.equals(KEY_I_SYNTHETIC_SW_BITRATE_MODE)) {
                            c = '\"';
                            break;
                        }
                    case 1051236402:
                        if (str.equals(KEY_I_SYNTHETIC_ENCODE_MODE)) {
                            c = 9;
                            break;
                        }
                    case 1068128883:
                        if (str.equals(KEY_I_RECORD_CAMERA_COMPAT_LEVEL)) {
                            c = 19;
                            break;
                        }
                    case 1075852647:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE)) {
                            c = 15;
                            break;
                        }
                    case 1359475563:
                        if (str.equals(KEY_I_SYNTHETIC_HW_BITRATE_MODE)) {
                            c = 21;
                            break;
                        }
                    case 1382653276:
                        if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_PRESET)) {
                            c = 16;
                            break;
                        }
                    case 1399891293:
                        if (str.equals(KEY_I_IMPORT_SHORTER_PIXELS)) {
                            c = 12;
                            break;
                        }
                    case 1704064263:
                        if (str.equals(KEY_I_IMPORT_VIDEO_SW_MAXRATE)) {
                            c = 14;
                            break;
                        }
                    case 1749573555:
                        if (str.equals(KEY_I_SYNTHETIC_HW_PROFILE)) {
                            c = 25;
                            break;
                        }
                    case 1942260604:
                        if (str.equals(KEY_I_IMPORT_VIDEO_SW_QP)) {
                            c = 30;
                            break;
                        }
                    case 2029867158:
                        if (str.equals(KEY_I_IMPORT_SW_BITRATE_MODE)) {
                            c = '!';
                            break;
                        }
                    case 2063458856:
                        if (str.equals(KEY_I_RECORD_VIDEO_SW_QP)) {
                            c = 29;
                            break;
                        }
                }
            } catch (JSONException e) {
                e = e;
                int i = -1;
                Log.e(TAG, "Parse json result failed! ", e);
                e.printStackTrace();
                String str4 = null;
                z2 = true;
                if (!z2 && str4 == null) {
                    if (config2.type == 0) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Checked config did not pass: key = ");
                        sb2.append(config2.key);
                        sb2.append(" value = ");
                        sb2.append(i);
                        Log.e("doubtingFilter report: ", sb2.toString());
                    } else if (config2.type == 1) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Checked config did not pass: key = ");
                        sb3.append(config2.key);
                        sb3.append(" value = ");
                        sb3.append(-1.0d);
                        Log.e("doubtingFilter report: ", sb3.toString());
                    }
                }
                if (str4 == null) {
                    if (z) {
                        str2 = config2.defaultValue.toString();
                    }
                    return str2;
                }
                StringBuilder sb4 = new StringBuilder();
                sb4.append(str);
                sb4.append(" == ");
                sb4.append(str4);
                Log.d("doubtingFilter report: ", sb4.toString());
                return str4;
            }
        } else {
            throw new IllegalArgumentException("fetchedRawConfigs == null");
        }
    }

    public static void fetch() {
        new ConfigAsyncTask().execute(new Void[0]);
    }

    private static float getDefaultFloat(String str) {
        for (Config config : sConfigList) {
            if (config.key.equals(str)) {
                return ((Float) config.defaultValue).floatValue();
            }
        }
        return -1.0f;
    }

    private static int getDefaultInt(String str) {
        for (Config config : sConfigList) {
            if (config.key.equals(str)) {
                return ((Integer) config.defaultValue).intValue();
            }
        }
        return -1;
    }

    private static float getFloatConfig(Map<String, String> map, String str, float f) {
        if (map == null) {
            return 0.0f;
        }
        String str2 = (String) map.get(str);
        try {
            if (!TextUtils.isEmpty(str2)) {
                return Float.parseFloat(str2);
            }
        } catch (Exception e) {
            Log.e(TAG, "getIntConfig: error", e);
        }
        return f;
    }

    private static int getIntConfig(Map<String, String> map, String str, int i) {
        if (map == null) {
            return 0;
        }
        String str2 = (String) map.get(str);
        try {
            if (!TextUtils.isEmpty(str2)) {
                return Integer.parseInt(str2);
            }
        } catch (Exception e) {
            Log.e(TAG, "getIntConfig: error", e);
        }
        return i;
    }

    public static Map<String, String> getPerformanceConfig(Context context) {
        HashMap hashMap = new HashMap();
        for (Entry entry : context.getSharedPreferences(sConfigs, 0).getAll().entrySet()) {
            if (((String) entry.getKey()).startsWith(sPerfConfigPrefix)) {
                hashMap.put(((String) entry.getKey()).substring(sPerfConfigPrefix.length()), (String) entry.getValue());
            }
        }
        return hashMap;
    }

    @RestrictTo({Scope.LIBRARY})
    public static void restoreFromCache() {
        if (VERuntime.getInstance().getContext() != null) {
            setConfigsFromMap(getPerformanceConfig(VERuntime.getInstance().getContext()));
            return;
        }
        throw new IllegalStateException("Must call VideoSdkCore.init() before.");
    }

    private static void setConfigsFromMap(Map<String, String> map) {
        for (Config config : sConfigList) {
            String str = config.key;
            char c = 65535;
            switch (str.hashCode()) {
                case -2004732869:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_HW_BITRATE)) {
                        c = 27;
                        break;
                    }
                    break;
                case -2003520120:
                    if (str.equals(KEY_I_EARPHONE_ECHO_AAUDIO)) {
                        c = '$';
                        break;
                    }
                    break;
                case -1815767918:
                    if (str.equals(KEY_I_IMPORT_ENCODE_MODE)) {
                        c = 14;
                        break;
                    }
                    break;
                case -1785223334:
                    if (str.equals(KEY_I_EARPHONE_ECHO_HUAWEI)) {
                        c = '%';
                        break;
                    }
                    break;
                case -1694569666:
                    if (str.equals(KEY_I_RECORD_ENCODE_MODE)) {
                        c = 3;
                        break;
                    }
                    break;
                case -1668300853:
                    if (str.equals(KEY_I_IMPORT_HW_BITRATE_MODE)) {
                        c = 23;
                        break;
                    }
                    break;
                case -1645123140:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_PRESET)) {
                        c = 19;
                        break;
                    }
                    break;
                case -1618492838:
                    if (str.equals(KEY_I_EARPHONE_ECHO_NORMAL)) {
                        c = '#';
                        break;
                    }
                    break;
                case -1558016730:
                    if (str.equals(KEY_I_RECORD_CAMERA_TYPE)) {
                        c = 0;
                        break;
                    }
                    break;
                case -1376521253:
                    if (str.equals(KEY_I_IMPORT_VIDEO_HW_BITRATE)) {
                        c = 17;
                        break;
                    }
                    break;
                case -1303806036:
                    if (str.equals(KEY_I_RECORD_RESOLUTION_HEIGHT)) {
                        c = 5;
                        break;
                    }
                    break;
                case -1248494809:
                    if (str.equals(KEY_I_RECORD_HW_PROFILE)) {
                        c = 13;
                        break;
                    }
                    break;
                case -1236656006:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_CRF)) {
                        c = 26;
                        break;
                    }
                    break;
                case -1236652245:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_GOP)) {
                        c = 30;
                        break;
                    }
                    break;
                case -1136469343:
                    if (str.equals(KEY_I_RECORD_RESOLUTION_WIDTH)) {
                        c = 4;
                        break;
                    }
                    break;
                case -532682277:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_MAXRATE)) {
                        c = 7;
                        break;
                    }
                    break;
                case -457298194:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_CRF)) {
                        c = 1;
                        break;
                    }
                    break;
                case -457294433:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_GOP)) {
                        c = 9;
                        break;
                    }
                    break;
                case -144025773:
                    if (str.equals(KEY_I_IMPORT_HW_PROFILE)) {
                        c = 24;
                        break;
                    }
                    break;
                case 18051394:
                    if (str.equals(KEY_I_RECORD_SW_BITRATE_MODE)) {
                        c = 11;
                        break;
                    }
                    break;
                case 80523290:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_CRF)) {
                        c = 16;
                        break;
                    }
                    break;
                case 80527051:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_GOP)) {
                        c = 20;
                        break;
                    }
                    break;
                case 514297628:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_QP)) {
                        c = 31;
                        break;
                    }
                    break;
                case 614850679:
                    if (str.equals(KEY_I_RECORD_HW_BITRATE_MODE)) {
                        c = 12;
                        break;
                    }
                    break;
                case 638028392:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_PRESET)) {
                        c = 8;
                        break;
                    }
                    break;
                case 681699503:
                    if (str.equals(KEY_I_RECORD_VIDEO_HW_BITRATE)) {
                        c = 2;
                        break;
                    }
                    break;
                case 762676278:
                    if (str.equals(KEY_I_SYNTHETIC_SW_BITRATE_MODE)) {
                        c = ' ';
                        break;
                    }
                    break;
                case 1051236402:
                    if (str.equals(KEY_I_SYNTHETIC_ENCODE_MODE)) {
                        c = 25;
                        break;
                    }
                    break;
                case 1068128883:
                    if (str.equals(KEY_I_RECORD_CAMERA_COMPAT_LEVEL)) {
                        c = 6;
                        break;
                    }
                    break;
                case 1075852647:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_MAXRATE)) {
                        c = 28;
                        break;
                    }
                    break;
                case 1359475563:
                    if (str.equals(KEY_I_SYNTHETIC_HW_BITRATE_MODE)) {
                        c = '!';
                        break;
                    }
                    break;
                case 1382653276:
                    if (str.equals(KEY_I_SYNTHETIC_VIDEO_SW_PRESET)) {
                        c = 29;
                        break;
                    }
                    break;
                case 1399891293:
                    if (str.equals(KEY_I_IMPORT_SHORTER_PIXELS)) {
                        c = 15;
                        break;
                    }
                    break;
                case 1704064263:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_MAXRATE)) {
                        c = 18;
                        break;
                    }
                    break;
                case 1749573555:
                    if (str.equals(KEY_I_SYNTHETIC_HW_PROFILE)) {
                        c = '\"';
                        break;
                    }
                    break;
                case 1942260604:
                    if (str.equals(KEY_I_IMPORT_VIDEO_SW_QP)) {
                        c = 21;
                        break;
                    }
                    break;
                case 2029867158:
                    if (str.equals(KEY_I_IMPORT_SW_BITRATE_MODE)) {
                        c = 22;
                        break;
                    }
                    break;
                case 2063458856:
                    if (str.equals(KEY_I_RECORD_VIDEO_SW_QP)) {
                        c = 10;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    sVECloudConfig.mRecordCameraType = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 1:
                    sVECloudConfig.mRecordSWEncodeCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 2:
                    sVECloudConfig.mRecordHWEncodeBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 3:
                    sVECloudConfig.mRecordEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 4:
                    sVECloudConfig.mRecordResolutionWidth = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 5:
                    sVECloudConfig.mRecordResolutionHeight = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 6:
                    sVECloudConfig.mRecordCameraCompatLevel = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 7:
                    sVECloudConfig.mRecordVideoSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 8:
                    sVECloudConfig.mRecordVideoSWPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 9:
                    sVECloudConfig.mRecordVideoSWGop = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 10:
                    sVECloudConfig.mRecordVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 11:
                    sVECloudConfig.mRecordSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 12:
                    sVECloudConfig.mRecordHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 13:
                    sVECloudConfig.mRecordHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 14:
                    sVECloudConfig.mImportEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 15:
                    sVECloudConfig.mImportShortEdgeValue = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 16:
                    sVECloudConfig.mImportSWEncodeCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 17:
                    sVECloudConfig.mImportHWEncodeBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 18:
                    sVECloudConfig.mImportVideoSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 19:
                    sVECloudConfig.mImportVideoSWPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 20:
                    sVECloudConfig.mImportVideoSWGop = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 21:
                    sVECloudConfig.mImportVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 22:
                    sVECloudConfig.mImportSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 23:
                    sVECloudConfig.mImportHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 24:
                    sVECloudConfig.mImportHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 25:
                    sVECloudConfig.mCompileEncodeMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 26:
                    sVECloudConfig.mCompileEncodeSWCRF = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 27:
                    sVECloudConfig.mCompileEncodeHWBPS = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 28:
                    sVECloudConfig.mCompileEncodeSWMaxrate = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 29:
                    sVECloudConfig.mCompileEncodeSWCRFPreset = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 30:
                    sVECloudConfig.mCompileEncodeSWGOP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case 31:
                    sVECloudConfig.mCompileVideoSWQP = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case ' ':
                    sVECloudConfig.mCompileSWBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case '!':
                    sVECloudConfig.mCompileHwBitrateMode = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case '\"':
                    sVECloudConfig.mCompileHwProfile = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case '#':
                    sVECloudConfig.mEarphoneEchoNormal = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case '$':
                    sVECloudConfig.mEarphoneEchoAAudio = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                case '%':
                    sVECloudConfig.mEarphoneEchoHuawei = getIntConfig(map, config.key, ((Integer) config.defaultValue).intValue());
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unexpected Config.key = ");
                    sb.append(config.key);
                    throw new IllegalStateException(sb.toString());
            }
        }
    }

    public static void setPerformanceConfig(Context context, Map<String, String> map) {
        if (map != null) {
            Set<Entry> entrySet = map.entrySet();
            Editor edit = context.getSharedPreferences(sConfigs, 0).edit();
            for (Entry entry : entrySet) {
                StringBuilder sb = new StringBuilder();
                sb.append(sPerfConfigPrefix);
                sb.append((String) entry.getKey());
                edit.putString(sb.toString(), (String) entry.getValue());
            }
            edit.apply();
        }
    }

    @RestrictTo({Scope.LIBRARY})
    public static void updateConfig(Map<String, String> map) {
        setConfigsFromMap(map);
        setPerformanceConfig(VERuntime.getInstance().getContext(), map);
    }
}

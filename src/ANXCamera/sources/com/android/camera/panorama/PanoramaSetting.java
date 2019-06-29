package com.android.camera.panorama;

import android.content.Context;
import android.util.JsonReader;
import com.android.camera.log.Log;
import java.io.IOException;

public class PanoramaSetting {
    private static final boolean DEBUG = false;
    public static final String KEY_AOVX = "aovx";
    public static final String KEY_AOVY = "aovy";
    public static final String KEY_AOV_GAIN = "aov_gain";
    public static final String KEY_CALCSEAM_PIXNUM = "calcseam_pixnum";
    public static final String KEY_DISTORTION_K1 = "distortion_k1";
    public static final String KEY_DISTORTION_K2 = "distortion_k2";
    public static final String KEY_DISTORTION_K3 = "distortion_k3";
    public static final String KEY_DISTORTION_K4 = "distortion_k4";
    public static final String KEY_DRAW_THRESHOLD = "draw_threshold";
    public static final String KEY_ROTATION_RATIO = "rotation_ratio";
    public static final String KEY_SEAMSEARCH_RATIO = "seamsearch_ratio";
    public static final String KEY_SHRINK_RATIO = "shrink_ratio";
    public static final String KEY_USE_DEFORM = "use_deform";
    public static final String KEY_USE_LUMINANCE_CORRECTION = "use_luminance_correction";
    public static final String KEY_ZROTATION_COEFF = "zrotation_coeff";
    private static final String TAG = "PanoramaSetting";
    private double aov_gain = 1.0d;
    private double aovx = 70.4000015258789d;
    private double aovy = 55.70000076293945d;
    private int calcseam_pixnum = 32400;
    private double distortion_k1 = 0.0d;
    private double distortion_k2 = 0.0d;
    private double distortion_k3 = 0.0d;
    private double distortion_k4 = 0.0d;
    private double draw_threshold = 0.5d;
    private int motion_detection_mode = 0;
    private int projection_mode = 0;
    private double rotation_ratio = 1.0d;
    private double seamsearch_ratio = 1.0d;
    private float shrink_ratio = 7.5f;
    private boolean use_deform = false;
    private boolean use_luminance_correction = true;
    private double zrotation_coeff = 0.95d;

    public PanoramaSetting(Context context) {
        Log.d(TAG, toString());
    }

    private void parseSetting(JsonReader jsonReader) throws IOException {
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String nextName = jsonReader.nextName();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("read key ");
            sb.append(nextName);
            Log.d(str, sb.toString());
            char c = 65535;
            try {
                switch (nextName.hashCode()) {
                    case -1913048451:
                        if (nextName.equals(KEY_USE_DEFORM)) {
                            c = 4;
                            break;
                        }
                        break;
                    case -1861106499:
                        if (nextName.equals(KEY_USE_LUMINANCE_CORRECTION)) {
                            c = 5;
                            break;
                        }
                        break;
                    case -1476979982:
                        if (nextName.equals(KEY_ZROTATION_COEFF)) {
                            c = 7;
                            break;
                        }
                        break;
                    case -701256694:
                        if (nextName.equals(KEY_ROTATION_RATIO)) {
                            c = 14;
                            break;
                        }
                        break;
                    case -591575248:
                        if (nextName.equals(KEY_DRAW_THRESHOLD)) {
                            c = 8;
                            break;
                        }
                        break;
                    case -234320299:
                        if (nextName.equals(KEY_SHRINK_RATIO)) {
                            c = 2;
                            break;
                        }
                        break;
                    case 3000176:
                        if (nextName.equals(KEY_AOVX)) {
                            c = 0;
                            break;
                        }
                        break;
                    case 3000177:
                        if (nextName.equals(KEY_AOVY)) {
                            c = 1;
                            break;
                        }
                        break;
                    case 15721843:
                        if (nextName.equals(KEY_CALCSEAM_PIXNUM)) {
                            c = 3;
                            break;
                        }
                        break;
                    case 107805618:
                        if (nextName.equals(KEY_SEAMSEARCH_RATIO)) {
                            c = 6;
                            break;
                        }
                        break;
                    case 451710806:
                        if (nextName.equals(KEY_AOV_GAIN)) {
                            c = 9;
                            break;
                        }
                        break;
                    case 617635848:
                        if (nextName.equals(KEY_DISTORTION_K1)) {
                            c = 10;
                            break;
                        }
                        break;
                    case 617635849:
                        if (nextName.equals(KEY_DISTORTION_K2)) {
                            c = 11;
                            break;
                        }
                        break;
                    case 617635850:
                        if (nextName.equals(KEY_DISTORTION_K3)) {
                            c = 12;
                            break;
                        }
                        break;
                    case 617635851:
                        if (nextName.equals(KEY_DISTORTION_K4)) {
                            c = 13;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        this.aovx = jsonReader.nextDouble();
                        break;
                    case 1:
                        this.aovy = jsonReader.nextDouble();
                        break;
                    case 2:
                        this.shrink_ratio = (float) jsonReader.nextDouble();
                        break;
                    case 3:
                        this.calcseam_pixnum = jsonReader.nextInt();
                        break;
                    case 4:
                        this.use_deform = jsonReader.nextBoolean();
                        break;
                    case 5:
                        this.use_luminance_correction = jsonReader.nextBoolean();
                        break;
                    case 6:
                        this.seamsearch_ratio = jsonReader.nextDouble();
                        break;
                    case 7:
                        this.zrotation_coeff = jsonReader.nextDouble();
                        break;
                    case 8:
                        this.draw_threshold = jsonReader.nextDouble();
                        break;
                    case 9:
                        this.aov_gain = jsonReader.nextDouble();
                        break;
                    case 10:
                        this.distortion_k1 = jsonReader.nextDouble();
                        break;
                    case 11:
                        this.distortion_k2 = jsonReader.nextDouble();
                        break;
                    case 12:
                        this.distortion_k3 = jsonReader.nextDouble();
                        break;
                    case 13:
                        this.distortion_k4 = jsonReader.nextDouble();
                        break;
                    case 14:
                        this.rotation_ratio = jsonReader.nextDouble();
                        break;
                    default:
                        jsonReader.skipValue();
                        break;
                }
            } catch (Exception e) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("parse error, name = ");
                sb2.append(nextName);
                Log.d(str2, sb2.toString());
            }
        }
        jsonReader.endObject();
    }

    public double getAov_gain() {
        return this.aov_gain;
    }

    public double getAovx() {
        return this.aovx;
    }

    public double getAovy() {
        return this.aovy;
    }

    public int getCalcseam_pixnum() {
        return this.calcseam_pixnum;
    }

    public double getDistortion_k1() {
        return this.distortion_k1;
    }

    public double getDistortion_k2() {
        return this.distortion_k2;
    }

    public double getDistortion_k3() {
        return this.distortion_k3;
    }

    public double getDistortion_k4() {
        return this.distortion_k4;
    }

    public double getDraw_threshold() {
        return this.draw_threshold;
    }

    public int getMotion_detection_mode() {
        return this.motion_detection_mode;
    }

    public int getProjection_mode() {
        return this.projection_mode;
    }

    public double getRotation_ratio() {
        return this.rotation_ratio;
    }

    public double getSeamsearch_ratio() {
        return this.seamsearch_ratio;
    }

    public float getShrink_ratio() {
        return this.shrink_ratio;
    }

    public double getZrotation_coeff() {
        return this.zrotation_coeff;
    }

    public boolean isUse_deform() {
        return this.use_deform;
    }

    public boolean isUse_luminance_correction() {
        return this.use_luminance_correction;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("PanoramaSetting{aovx=");
        sb.append(this.aovx);
        sb.append(", aovy=");
        sb.append(this.aovy);
        sb.append(", shrink_ratio=");
        sb.append(this.shrink_ratio);
        sb.append(", calcseam_pixnum=");
        sb.append(this.calcseam_pixnum);
        sb.append(", use_deform=");
        sb.append(this.use_deform);
        sb.append(", use_luminance_correction=");
        sb.append(this.use_luminance_correction);
        sb.append(", seamsearch_ratio=");
        sb.append(this.seamsearch_ratio);
        sb.append(", zrotation_coeff=");
        sb.append(this.zrotation_coeff);
        sb.append(", draw_threshold=");
        sb.append(this.draw_threshold);
        sb.append(", aov_gain=");
        sb.append(this.aov_gain);
        sb.append(", distortion_k1=");
        sb.append(this.distortion_k1);
        sb.append(", distortion_k2=");
        sb.append(this.distortion_k2);
        sb.append(", distortion_k3=");
        sb.append(this.distortion_k3);
        sb.append(", distortion_k4=");
        sb.append(this.distortion_k4);
        sb.append(", rotation_ratio=");
        sb.append(this.rotation_ratio);
        sb.append('}');
        return sb.toString();
    }
}

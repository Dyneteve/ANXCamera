package com.arcsoft.avatar;

import android.graphics.Bitmap;
import com.android.camera.statistic.CameraStat;
import com.arcsoft.avatar.util.LOG;
import java.io.Serializable;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Arrays;

public interface AvatarConfig {

    @Documented
    @Target({ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ASAvatarConfigComponentType {
        public static final int BEARD_COLOR = 15;
        public static final int BEARD_STYLE = 14;
        public static final int EARRING_STYLE = 16;
        public static final int EAR_SHAPE = 27;
        public static final int EYEBROW_COLOR = 18;
        public static final int EYEBROW_SHAPE = 28;
        public static final int EYELASH_STYLE = 17;
        public static final int EYEWEAR_FRAME = 10;
        public static final int EYEWEAR_LENSES = 11;
        public static final int EYEWEAR_STYLE = 9;
        public static final int EYE_COLOR = 4;
        public static final int EYE_SHAPE = 20;
        public static final int FACE_COLOR = 3;
        public static final int FACE_SHAPE = 19;
        public static final int FRECKLES = 7;
        public static final int HAIR_COLOR = 2;
        public static final int HAIR_HIGHLIGHT_COLOR = 6;
        public static final int HAIR_STYLE = 1;
        public static final int HEADWEAR_COLOR = 13;
        public static final int HEADWEAR_STYLE = 12;
        public static final int LIP_COLOR = 5;
        public static final int MOUTH_HSHAPE = 23;
        public static final int MOUTH_SHAPE = 21;
        public static final int MOUTH_WSHAPE = 22;
        public static final int NEVUS = 8;
        public static final int NONE = 0;
        public static final int NOSE_HSHAPE = 26;
        public static final int NOSE_SHAPE = 24;
        public static final int NOSE_WSHAPE = 25;
    }

    @Documented
    @Target({ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ASAvatarConfigGenderType {
        public static final int FEMALE = 2;
        public static final int MALE = 1;
        public static final int UNKNOWN = 0;
    }

    public static class ASAvatarConfigInfo {
        public int configID;
        public String configThumbPath;
        public int configType;
        public float continuousValue;
        public int endColorValue;
        public int gender;
        public boolean isDefault;
        public boolean isSupportContinuous;
        public boolean isValid;
        public String name;
        public int startColorValue;
        public Bitmap thum;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("configID = ");
            sb.append(this.configID);
            sb.append(" configType = ");
            sb.append(this.configType);
            sb.append(" gender = ");
            sb.append(this.gender);
            sb.append(" name = ");
            sb.append(this.name);
            sb.append(" configThumbPath = ");
            sb.append(this.configThumbPath);
            sb.append(" isDefault = ");
            sb.append(this.isDefault);
            sb.append(" isValid = ");
            sb.append(this.isValid);
            sb.append(" isSupportContinuous = ");
            sb.append(this.isSupportContinuous);
            sb.append(" continuousValue = ");
            sb.append(this.continuousValue);
            sb.append(" startColorValue = ");
            sb.append(this.startColorValue);
            sb.append(" endColorValue = ");
            sb.append(this.endColorValue);
            sb.append("thum = ");
            sb.append(this.thum);
            sb.append("\n");
            return sb.toString();
        }
    }

    public static class ASAvatarConfigType {
        public int configType;
        public String configTypeDesc;
        public boolean refreshThum = true;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("configTypeDesc = ");
            sb.append(this.configTypeDesc);
            sb.append(" configType = ");
            sb.append(this.configType);
            sb.append(" refreshThum = ");
            sb.append(this.refreshThum);
            return sb.toString();
        }
    }

    public static class ASAvatarConfigValue implements Cloneable {
        public int configBeardColorID;
        public float configBeardColorValue;
        public int configBeardStyleID;
        public int configEarShapeID;
        public float configEarShapeValue;
        public int configEarringStyleID;
        public int configEyeColorID;
        public float configEyeColorValue;
        public int configEyeShapeID;
        public float configEyeShapeValue;
        public int configEyebrowColorID;
        public float configEyebrowColorValue;
        public int configEyebrowShapeID;
        public float configEyebrowShapeValue;
        public int configEyelashStyleID;
        public int configEyewearFrameID;
        public float configEyewearFrameValue;
        public int configEyewearLensesID;
        public float configEyewearLensesValue;
        public int configEyewearStyleID;
        public int configFaceColorID;
        public float configFaceColorValue;
        public int configFaceShapeID;
        public float configFaceShapeValue;
        public int configFrecklesID;
        public int configHairColorID;
        public float configHairColorValue;
        public int configHairHighlightColorID;
        public float configHairHighlightColorValue;
        public int configHairStyleID;
        public int configHeadwearColorID;
        public float configHeadwearColorValue;
        public int configHeadwearStyleID;
        public int configLipColorID;
        public float configLipColorValue;
        public int configMouthShapeID;
        public float configMouthShapeValue;
        public int configNevusID;
        public int configNoseShapeID;
        public float configNoseShapeValue;
        public int gender;

        public Object clone() {
            try {
                return (ASAvatarConfigValue) super.clone();
            } catch (CloneNotSupportedException e) {
                e.printStackTrace();
                return null;
            }
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("gender = ");
            sb.append(this.gender);
            sb.append(" hairStyleID = ");
            sb.append(this.configHairStyleID);
            sb.append(" hairColorID = ");
            sb.append(this.configHairColorID);
            sb.append(" hairColorValue = ");
            sb.append(this.configHairColorValue);
            sb.append(" faceColorID = ");
            sb.append(this.configFaceColorID);
            sb.append(" faceColorValue = ");
            sb.append(this.configFaceColorValue);
            sb.append(" eyeColorID = ");
            sb.append(this.configEyeColorID);
            sb.append(" eyeColorValue = ");
            sb.append(this.configEyeColorValue);
            sb.append(" lipColorID = ");
            sb.append(this.configLipColorID);
            sb.append(" lipColorValue = ");
            sb.append(this.configLipColorValue);
            sb.append(" hairHighlightColorID = ");
            sb.append(this.configHairHighlightColorID);
            sb.append(" hairHighlightColorValue = ");
            sb.append(this.configHairHighlightColorValue);
            sb.append(" frecklesID = ");
            sb.append(this.configFrecklesID);
            sb.append(" nevusID = ");
            sb.append(this.configNevusID);
            sb.append(" eyewearStyleID = ");
            sb.append(this.configEyewearStyleID);
            sb.append(" eyewearFrameID = ");
            sb.append(this.configEyewearFrameID);
            sb.append(" eyewearFrameValue = ");
            sb.append(this.configEyewearFrameValue);
            sb.append(" eyewearLensesID = ");
            sb.append(this.configEyewearLensesID);
            sb.append(" eyewearLensesValue = ");
            sb.append(this.configEyewearLensesValue);
            sb.append(" headwearStyleID = ");
            sb.append(this.configHeadwearStyleID);
            sb.append(" headwearColorID = ");
            sb.append(this.configHeadwearColorID);
            sb.append(" headwearColorValue = ");
            sb.append(this.configHeadwearColorValue);
            sb.append(" beardStyleID = ");
            sb.append(this.configBeardStyleID);
            sb.append(" beardColorID = ");
            sb.append(this.configBeardColorID);
            sb.append(" beardColorValue = ");
            sb.append(this.configBeardColorValue);
            sb.append(" earringStyleID = ");
            sb.append(this.configEarringStyleID);
            sb.append(" eyelashStyleID = ");
            sb.append(this.configEyelashStyleID);
            sb.append(" eyebrowColorID = ");
            sb.append(this.configEyebrowColorID);
            sb.append(" eyebrowColorValue = ");
            sb.append(this.configEyebrowColorValue);
            sb.append(" faceShapeID = ");
            sb.append(this.configFaceShapeID);
            sb.append(" faceShapeValue = ");
            sb.append(this.configFaceShapeValue);
            sb.append(" eyeShapeID = ");
            sb.append(this.configEyeShapeID);
            sb.append(" eyeShapeValue = ");
            sb.append(this.configEyeShapeValue);
            sb.append(" mouthShapeID = ");
            sb.append(this.configMouthShapeID);
            sb.append(" mouthShapeValue = ");
            sb.append(this.configMouthShapeValue);
            sb.append(" noseShapeID = ");
            sb.append(this.configNoseShapeID);
            sb.append(" noseShapeValue = ");
            sb.append(this.configNoseShapeValue);
            sb.append(" earShapeID = ");
            sb.append(this.configEarShapeID);
            sb.append(" earShapeValue = ");
            sb.append(this.configEarShapeValue);
            sb.append(" eyebrowShapeID = ");
            sb.append(this.configEyebrowShapeID);
            sb.append(" eyebrowShapeValue = ");
            sb.append(this.configEyebrowShapeValue);
            sb.append("\n");
            return sb.toString();
        }
    }

    public interface ASAvatarOutLineStatusCode {
        public static final int STATUS_FACE_BEYOND_20_DEGREES = 9;
        public static final int STATUS_FACE_OCCLUSION = 6;
        public static final int STATUS_FACE_TOO_BIG = 7;
        public static final int STATUS_FACE_TOO_SMALL = 8;
        public static final int STATUS_LEFT_EYES_OCCLUSION = 2;
        public static final int STATUS_MOUTH_OCCLUSION = 4;
        public static final int STATUS_MULTIPLE_FACES = 10;
        public static final int STATUS_NORMAL = 0;
        public static final int STATUS_NOSE_OCCLUSION = 5;
        public static final int STATUS_NO_FACE = 1;
        public static final int STATUS_RIGHT_EYES_OCCLUSION = 3;
    }

    public static class ASAvatarProcessInfo {
        private static final float F_THRESHOLD = 0.5f;
        private static final int Max_Express_Num = 63;
        private static final int Max_Outline_Num = 154;
        private static final float OUTLINE_THRESHOLD_VALUE = 0.8f;
        private float[] expWeights;
        private ASRect face;
        private int faceCount;
        private float[] faceOrientations;
        private boolean isMirror;
        private int orientation;
        private float[] orientationLeftEyes;
        private float[] orientationRightEyes;
        private float[] orientations;
        private ASPointF[] outlines = new ASPointF[154];
        private int processHeight;
        private int processWidth;
        private int result;
        private float[] shelterFlags;
        private float zoomInScale;

        public boolean checkFaceBlocking() {
            float f = 0.0f;
            int i = 0;
            float f2 = 0.0f;
            float f3 = 0.0f;
            float f4 = 0.0f;
            float f5 = 0.0f;
            float f6 = 0.0f;
            float f7 = 0.0f;
            float f8 = 0.0f;
            float f9 = 0.0f;
            while (i < this.shelterFlags.length) {
                if (i >= 0 && i <= 18) {
                    f2 += this.shelterFlags[i];
                } else if (i >= 19 && i <= 36) {
                    f3 += this.shelterFlags[i];
                } else if (i >= 37 && i <= 46) {
                    f4 += this.shelterFlags[i];
                } else if (i >= 47 && i <= 56) {
                    f5 += this.shelterFlags[i];
                } else if (i >= 57 && i <= 68) {
                    f6 += this.shelterFlags[i];
                } else if (i >= 69 && i <= 80) {
                    f7 += this.shelterFlags[i];
                } else if (i >= 81 && i <= 92) {
                    f8 += this.shelterFlags[i];
                } else if (i >= 93 && i <= 112) {
                    f9 += this.shelterFlags[i];
                }
                i++;
            }
            for (int i2 = 7; i2 <= 29; i2++) {
                f += this.shelterFlags[i2];
            }
            float f10 = f2 / 19.0f;
            float f11 = f3 / 18.0f;
            float f12 = f4 / 10.0f;
            float f13 = f5 / 10.0f;
            float f14 = f6 / 12.0f;
            float f15 = f7 / 12.0f;
            float f16 = f8 / 12.0f;
            float f17 = f9 / 20.0f;
            float f18 = f / 23.0f;
            StringBuilder sb = new StringBuilder();
            sb.append("leftFace = ");
            sb.append(f10);
            LOG.d("CheckOutLine", sb.toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("rightFace = ");
            sb2.append(f11);
            LOG.d("CheckOutLine", sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("leftEyeBrow = ");
            sb3.append(f12);
            LOG.d("CheckOutLine", sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("rightEyeBrow = ");
            sb4.append(f13);
            LOG.d("CheckOutLine", sb4.toString());
            StringBuilder sb5 = new StringBuilder();
            sb5.append("leftEye = ");
            sb5.append(f14);
            LOG.d("CheckOutLine", sb5.toString());
            StringBuilder sb6 = new StringBuilder();
            sb6.append("rightEye = ");
            sb6.append(f15);
            LOG.d("CheckOutLine", sb6.toString());
            StringBuilder sb7 = new StringBuilder();
            sb7.append("nose = ");
            sb7.append(f16);
            LOG.d("CheckOutLine", sb7.toString());
            StringBuilder sb8 = new StringBuilder();
            sb8.append("mouth = ");
            sb8.append(f17);
            LOG.d("CheckOutLine", sb8.toString());
            StringBuilder sb9 = new StringBuilder();
            sb9.append("chin = ");
            sb9.append(f18);
            LOG.d("CheckOutLine", sb9.toString());
            if (f10 > 0.5f && f12 > 0.5f && f14 > 0.5f) {
                LOG.d("CheckOutLine", "--- > left is blocking <---");
                return true;
            } else if (f11 > 0.5f && f13 > 0.5f && f15 > 0.5f) {
                LOG.d("CheckOutLine", "--- > right is blocking <---");
                return true;
            } else if (f12 <= 0.4f || f13 <= 0.4f || f15 <= 0.4f || f14 <= 0.4f) {
                int i3 = (f18 > 0.4f ? 1 : (f18 == 0.4f ? 0 : -1));
                if (i3 > 0 && f17 > 0.4f && f16 > 0.4f) {
                    LOG.d("CheckOutLine", "--- > central is blocking <---");
                    return true;
                } else if (f10 <= 0.4f || f11 <= 0.4f || i3 <= 0) {
                    return false;
                } else {
                    LOG.d("CheckOutLine", "--- > left & right is blocking <---");
                    return true;
                }
            } else {
                LOG.d("CheckOutLine", "--- > top is blocking <---");
                return true;
            }
        }

        public int checkOutLineInfo() {
            int i;
            int i2 = 0;
            float f = this.faceOrientations[0];
            float f2 = this.faceOrientations[1];
            int i3 = 2;
            float f3 = this.faceOrientations[2];
            if (((f < -110.0f || f > -70.0f) && ((f < -20.0f || f > 20.0f) && ((f < 160.0f || f > 180.0f) && ((f < -180.0f || f > -160.0f) && (f < 70.0f || f > 110.0f))))) || -20.0f > f2 || f2 > 20.0f || -20.0f > f3 || f3 > 20.0f) {
                return 9;
            }
            float f4 = 0.0f;
            float f5 = 0.0f;
            for (int i4 = 0; i4 <= 36; i4++) {
                f5 += this.shelterFlags[i4];
            }
            float f6 = f5 / 36.0f;
            StringBuilder sb = new StringBuilder();
            sb.append("fFaceValue = ");
            sb.append(f6);
            LOG.d("CheckOutLine", sb.toString());
            if (f6 > OUTLINE_THRESHOLD_VALUE) {
                return 6;
            }
            float f7 = 0.0f;
            for (int i5 = 69; i5 <= 80; i5++) {
                f7 += this.shelterFlags[i5];
            }
            float f8 = f7 / 12.0f;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("fLeftEyeValue = ");
            sb2.append(f8);
            LOG.d("CheckOutLine", sb2.toString());
            float f9 = 0.0f;
            for (int i6 = 57; i6 <= 68; i6++) {
                f9 += this.shelterFlags[i6];
            }
            float f10 = f9 / 12.0f;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("fRightEyeValue = ");
            sb3.append(f10);
            LOG.d("CheckOutLine", sb3.toString());
            if (f10 > f8) {
                i3 = 3;
            } else {
                f10 = f8;
            }
            float f11 = 0.0f;
            for (int i7 = 93; i7 <= 112; i7++) {
                f11 += this.shelterFlags[i7];
            }
            float f12 = f11 / 20.0f;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("fMouthEyeValue = ");
            sb4.append(f12);
            LOG.d("CheckOutLine", sb4.toString());
            if (f12 > f10) {
                i3 = 4;
                f10 = f12;
            }
            for (int i8 = 81; i8 <= 119; i8++) {
                f4 += this.shelterFlags[i8];
            }
            float f13 = f4 / 39.0f;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("fNOSEEyeValue = ");
            sb5.append(f13);
            LOG.d("CheckOutLine", sb5.toString());
            if (f13 > f10) {
                i = 5;
            } else {
                f13 = f10;
                i = i3;
            }
            StringBuilder sb6 = new StringBuilder();
            sb6.append("fMax = ");
            sb6.append(f13);
            sb6.append(" res = ");
            sb6.append(i);
            LOG.d("CheckOutLine", sb6.toString());
            if (f13 > OUTLINE_THRESHOLD_VALUE) {
                i2 = i;
            }
            return i2;
        }

        public int getFaceCount() {
            return this.faceCount;
        }

        public void setEmpty() {
            ASPointF[] aSPointFArr;
            this.processHeight = 0;
            this.processWidth = 0;
            this.orientation = 0;
            this.isMirror = false;
            this.faceCount = 0;
            for (ASPointF aSPointF : this.outlines) {
                aSPointF.x = 0.0f;
                aSPointF.y = 0.0f;
            }
            this.face.bottom = 0;
            this.face.right = 0;
            this.face.top = 0;
            this.face.left = 0;
            Arrays.fill(this.faceOrientations, 0.0f);
            this.result = 0;
            Arrays.fill(this.orientations, 0.0f);
            Arrays.fill(this.orientationLeftEyes, 0.0f);
            Arrays.fill(this.orientationRightEyes, 0.0f);
            Arrays.fill(this.expWeights, 0.0f);
            this.zoomInScale = 0.0f;
        }

        public boolean shelterIsNull() {
            return this.shelterFlags == null;
        }
    }

    public static class ASAvatarProfileInfo implements Serializable {
        private int eyeShape;
        private int faceShape;
        private int gender;
        private int glassType;
        private byte[] hairColor;
        private int hairType;
        private int hasFringe;
        private int mouthShape;
        private int noseShape;
        private byte[] skinColor;
        private int skinColorScale;

        public String getHairType() {
            String str;
            switch (this.hairType) {
                case 0:
                    str = "光寸头";
                    break;
                case 1:
                    str = "直短发";
                    break;
                case 2:
                    str = "卷短发";
                    break;
                case 3:
                    str = "丸子马尾";
                    break;
                case 4:
                    str = "哪吒头";
                    break;
                case 5:
                    str = "直中短发";
                    break;
                case 6:
                    str = "卷中短发";
                    break;
                case 7:
                    str = "直中发";
                    break;
                case 8:
                    str = "卷中发";
                    break;
                case 9:
                    str = "直长发";
                    break;
                case 10:
                    str = "卷长发";
                    break;
                case 11:
                    str = "双马尾";
                    break;
                case 12:
                    str = "双麻花辫";
                    break;
                default:
                    str = "unknow";
                    break;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Hair Type = ");
            sb.append(str);
            return sb.toString();
        }

        public String getHasFringe() {
            return this.hasFringe == 0 ? CameraStat.LOCATION_WITHOUT : CameraStat.LOCATION_WITH;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("gender = ");
            sb.append(this.gender);
            sb.append("\nfaceShape = ");
            sb.append(this.faceShape);
            sb.append("\neyeShape = ");
            sb.append(this.eyeShape);
            sb.append("\nmouthShape = ");
            sb.append(this.mouthShape);
            sb.append("\nnoseShape = ");
            sb.append(this.noseShape);
            sb.append("\nhairType = ");
            sb.append(this.hairType);
            sb.append("\nhasFringe = ");
            sb.append(this.hasFringe);
            sb.append("\nhairColor = ");
            sb.append(Arrays.toString(this.hairColor));
            sb.append("\nskinColor = ");
            sb.append(Arrays.toString(this.skinColor));
            sb.append("\nskinColorScale = ");
            sb.append(this.skinColorScale);
            sb.append("\nglassType = ");
            sb.append(this.glassType);
            return sb.toString();
        }
    }

    public static class ASAvatarProfileResult implements Serializable {
        public int gender;
        public int status;
    }

    public interface ASAvatarProfileStatusCode {
        public static final int STATUS_FAILED_NOFACE = 1;
        public static final int STATUS_SUCCESS_FACESHAPE = 128;
        public static final int STATUS_SUCCESS_FACIAL = 2;
        public static final int STATUS_SUCCESS_GENDER = 16;
        public static final int STATUS_SUCCESS_GLASS = 64;
        public static final int STATUS_SUCCESS_HAIRCOLOR = 8;
        public static final int STATUS_SUCCESS_HAIRSTYLE = 4;
        public static final int STATUS_SUCCESS_SKINCOLOR = 32;
        public static final int STATUS_UNKNOWN = 0;
    }

    public static class ASPointF {
        public float x;
        public float y;
    }

    public static class ASRect {
        public int bottom;
        public int left;
        public int right;
        public int top;
    }

    public interface GetConfigCallback {
        void onGetConfig(int i, int i2, int i3, int i4, String str, String str2, int i5, int i6, boolean z, boolean z2, boolean z3, float f);
    }

    public interface GetSupportConfigTypeCallback {
        void onGetSupportConfigType(String str, int i);
    }

    public interface UpdateProgressCallback {
        void onUpdateProgress(int i);
    }
}

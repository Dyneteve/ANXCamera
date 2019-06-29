package com.arcsoft.avatar.util;

import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigValue;

public class AvatarConfigUtils {
    public static int getCurrentConfigIdWithType(int i, ASAvatarConfigValue aSAvatarConfigValue) {
        switch (i) {
            case 1:
                return aSAvatarConfigValue.configHairStyleID;
            case 2:
                return aSAvatarConfigValue.configHairColorID;
            case 3:
                return aSAvatarConfigValue.configFaceColorID;
            case 4:
                return aSAvatarConfigValue.configEyeColorID;
            case 5:
                return aSAvatarConfigValue.configLipColorID;
            case 6:
                return aSAvatarConfigValue.configHairHighlightColorID;
            case 7:
                return aSAvatarConfigValue.configFrecklesID;
            case 8:
                return aSAvatarConfigValue.configNevusID;
            case 9:
                return aSAvatarConfigValue.configEyewearStyleID;
            case 10:
                return aSAvatarConfigValue.configEyewearFrameID;
            case 11:
                return aSAvatarConfigValue.configEyewearLensesID;
            case 12:
                return aSAvatarConfigValue.configHeadwearStyleID;
            case 13:
                return aSAvatarConfigValue.configHeadwearColorID;
            case 14:
                return aSAvatarConfigValue.configBeardStyleID;
            case 15:
                return aSAvatarConfigValue.configBeardColorID;
            case 16:
                return aSAvatarConfigValue.configEarringStyleID;
            case 17:
                return aSAvatarConfigValue.configEyelashStyleID;
            case 18:
                return aSAvatarConfigValue.configEyebrowColorID;
            case 19:
                return aSAvatarConfigValue.configFaceShapeID;
            case 20:
                return aSAvatarConfigValue.configEyeShapeID;
            case 21:
                return aSAvatarConfigValue.configMouthShapeID;
            case 24:
                return aSAvatarConfigValue.configNoseShapeID;
            case 27:
                return aSAvatarConfigValue.configEarShapeID;
            case 28:
                return aSAvatarConfigValue.configEyebrowShapeID;
            default:
                return -1;
        }
    }

    public static float getCurrentContinuousValueWithType(int i, ASAvatarConfigValue aSAvatarConfigValue) {
        switch (i) {
            case 2:
                return aSAvatarConfigValue.configHairColorValue;
            case 3:
                return aSAvatarConfigValue.configFaceColorValue;
            case 4:
                return aSAvatarConfigValue.configEyeColorValue;
            case 5:
                return aSAvatarConfigValue.configLipColorValue;
            case 6:
                return aSAvatarConfigValue.configHairHighlightColorValue;
            case 10:
                return aSAvatarConfigValue.configEyewearFrameValue;
            case 11:
                return aSAvatarConfigValue.configEyewearLensesValue;
            case 13:
                return aSAvatarConfigValue.configHeadwearColorValue;
            case 15:
                return aSAvatarConfigValue.configBeardColorValue;
            case 18:
                return aSAvatarConfigValue.configEyebrowColorValue;
            case 19:
                return aSAvatarConfigValue.configFaceShapeValue;
            case 20:
                return aSAvatarConfigValue.configEyeShapeValue;
            case 21:
                return aSAvatarConfigValue.configMouthShapeValue;
            case 24:
                return aSAvatarConfigValue.configNoseShapeValue;
            case 27:
                return aSAvatarConfigValue.configEarShapeValue;
            case 28:
                return aSAvatarConfigValue.configEyebrowShapeValue;
            default:
                return -1.0f;
        }
    }

    public static int getMatchConfigType(int i) {
        if (i == 1) {
            return 2;
        }
        if (i == 12) {
            return 13;
        }
        if (i == 14) {
            return 15;
        }
        if (i == 28) {
            return 18;
        }
        switch (i) {
            case 19:
                return 3;
            case 20:
                return 4;
            case 21:
                return 5;
            default:
                return 0;
        }
    }

    public static boolean isColorConfigComponentType(int i) {
        return i == 2 || i == 3 || i == 4 || i == 5 || i == 6 || i == 13 || i == 15 || i == 18 || i == 10 || i == 11;
    }

    public static boolean isSupportContinuousConfigInfo(ASAvatarConfigInfo aSAvatarConfigInfo) {
        if (aSAvatarConfigInfo.configType == 19 || aSAvatarConfigInfo.configType == 21 || aSAvatarConfigInfo.configType == 24 || aSAvatarConfigInfo.configType == 20 || aSAvatarConfigInfo.configType == 10 || aSAvatarConfigInfo.configType == 11) {
            return false;
        }
        return aSAvatarConfigInfo.isSupportContinuous;
    }

    public static void updateConfigID(int i, int i2, ASAvatarConfigValue aSAvatarConfigValue) {
        switch (i) {
            case 1:
                aSAvatarConfigValue.configHairStyleID = i2;
                return;
            case 2:
                aSAvatarConfigValue.configHairColorID = i2;
                return;
            case 3:
                aSAvatarConfigValue.configFaceColorID = i2;
                return;
            case 4:
                aSAvatarConfigValue.configEyeColorID = i2;
                return;
            case 5:
                aSAvatarConfigValue.configLipColorID = i2;
                return;
            case 6:
                aSAvatarConfigValue.configHairHighlightColorID = i2;
                return;
            case 7:
                aSAvatarConfigValue.configFrecklesID = i2;
                return;
            case 8:
                aSAvatarConfigValue.configNevusID = i2;
                return;
            case 9:
                aSAvatarConfigValue.configEyewearStyleID = i2;
                return;
            case 10:
                aSAvatarConfigValue.configEyewearFrameID = i2;
                return;
            case 11:
                aSAvatarConfigValue.configEyewearLensesID = i2;
                return;
            case 12:
                aSAvatarConfigValue.configHeadwearStyleID = i2;
                return;
            case 13:
                aSAvatarConfigValue.configHeadwearColorID = i2;
                return;
            case 14:
                aSAvatarConfigValue.configBeardStyleID = i2;
                return;
            case 15:
                aSAvatarConfigValue.configBeardColorID = i2;
                return;
            case 16:
                aSAvatarConfigValue.configEarringStyleID = i2;
                return;
            case 17:
                aSAvatarConfigValue.configEyelashStyleID = i2;
                return;
            case 18:
                aSAvatarConfigValue.configEyebrowColorID = i2;
                return;
            case 19:
                aSAvatarConfigValue.configFaceShapeID = i2;
                return;
            case 20:
                aSAvatarConfigValue.configEyeShapeID = i2;
                return;
            case 21:
                aSAvatarConfigValue.configMouthShapeID = i2;
                return;
            case 24:
                aSAvatarConfigValue.configNoseShapeID = i2;
                return;
            case 27:
                aSAvatarConfigValue.configEarShapeID = i2;
                return;
            case 28:
                aSAvatarConfigValue.configEyebrowShapeID = i2;
                return;
            default:
                return;
        }
    }

    public static void updateConfigValue(int i, float f, ASAvatarConfigValue aSAvatarConfigValue) {
        switch (i) {
            case 2:
                aSAvatarConfigValue.configHairColorValue = f;
                return;
            case 3:
                aSAvatarConfigValue.configFaceColorValue = f;
                return;
            case 4:
                aSAvatarConfigValue.configEyeColorValue = f;
                return;
            case 5:
                aSAvatarConfigValue.configLipColorValue = f;
                return;
            case 6:
                aSAvatarConfigValue.configHairHighlightColorValue = f;
                return;
            case 10:
                aSAvatarConfigValue.configEyewearFrameValue = f;
                return;
            case 11:
                aSAvatarConfigValue.configEyewearLensesValue = f;
                return;
            case 13:
                aSAvatarConfigValue.configHeadwearColorValue = f;
                return;
            case 15:
                aSAvatarConfigValue.configBeardColorValue = f;
                return;
            case 18:
                aSAvatarConfigValue.configEyebrowColorValue = f;
                return;
            case 19:
                aSAvatarConfigValue.configFaceShapeValue = f;
                return;
            case 20:
                aSAvatarConfigValue.configEyeShapeValue = f;
                return;
            case 21:
                aSAvatarConfigValue.configMouthShapeValue = f;
                return;
            case 24:
                aSAvatarConfigValue.configNoseShapeValue = f;
                return;
            case 27:
                aSAvatarConfigValue.configEarShapeValue = f;
                return;
            case 28:
                aSAvatarConfigValue.configEyebrowShapeValue = f;
                return;
            default:
                return;
        }
    }
}

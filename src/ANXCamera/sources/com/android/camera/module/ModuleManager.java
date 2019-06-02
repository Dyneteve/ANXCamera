package com.android.camera.module;

import android.support.annotation.Nullable;

public class ModuleManager {
    public static final int MODULE_INDEX_NONE = -1;
    private static int sCurrentModuleIndex = -1;
    private static ModuleManager sInstance = new ModuleManager();

    public static int getActiveModuleIndex() {
        return sCurrentModuleIndex;
    }

    private static Module getCameraByDevice() {
        return new Camera2Module();
    }

    @Nullable
    public static Module getModuleByIndex(int i) {
        switch (i) {
            case 161:
                return new FunModule();
            case 162:
            case 168:
            case 169:
            case 170:
            case 172:
                return getVideoByDevice();
            case 163:
            case 165:
            case 167:
            case 171:
            case 173:
            case 175:
                return getCameraByDevice();
            case 166:
                return new Panorama3Module();
            case 174:
            case 177:
                return new LiveModule();
            case 176:
                return new WideSelfieModule();
            default:
                return null;
        }
    }

    private static Module getVideoByDevice() {
        return new VideoModule();
    }

    public static ModuleManager instance() {
        return sInstance;
    }

    public static boolean isCameraModule() {
        return sCurrentModuleIndex == 163;
    }

    public static boolean isCapture() {
        return isCameraModule() || isSquareModule() || isManualModule() || isSuperNightScene() || isUltraPixel();
    }

    public static boolean isFastMotionModule() {
        return sCurrentModuleIndex == 169;
    }

    public static boolean isFunARModule() {
        return sCurrentModuleIndex == 177;
    }

    public static boolean isFunModule() {
        return sCurrentModuleIndex == 161;
    }

    public static boolean isLiveModule() {
        return sCurrentModuleIndex == 174;
    }

    public static boolean isManualModule() {
        return sCurrentModuleIndex == 167;
    }

    public static boolean isPanoramaModule() {
        return sCurrentModuleIndex == 166;
    }

    public static boolean isPortraitModule() {
        return sCurrentModuleIndex == 171;
    }

    public static boolean isSlowMotionModule() {
        return sCurrentModuleIndex == 168;
    }

    public static boolean isSquareModule() {
        return sCurrentModuleIndex == 165;
    }

    public static boolean isSuperNightScene() {
        return sCurrentModuleIndex == 173;
    }

    private static boolean isUltraPixel() {
        return sCurrentModuleIndex == 175;
    }

    public static boolean isVideoCategory(int i) {
        if (!(i == 172 || i == 174)) {
            switch (i) {
                case 161:
                case 162:
                    break;
                default:
                    switch (i) {
                        case 168:
                        case 169:
                        case 170:
                            break;
                        default:
                            return false;
                    }
            }
        }
        return true;
    }

    public static boolean isVideoHFRModule() {
        return sCurrentModuleIndex == 170;
    }

    public static boolean isVideoModule() {
        return sCurrentModuleIndex == 162;
    }

    public static boolean isVideoNewSlowMotion() {
        return sCurrentModuleIndex == 172;
    }

    public static boolean isWideSelfieModule() {
        return sCurrentModuleIndex == 176;
    }

    public static void setActiveModuleIndex(int i) {
        sCurrentModuleIndex = i;
    }
}

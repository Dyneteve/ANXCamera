package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest.Builder;
import com.android.camera.fragment.beauty.BeautyValues;
import java.util.HashSet;

@TargetApi(21)
class MiCameraCompatMtkImpl extends MiCameraCompatBaseImpl {
    MiCameraCompatMtkImpl() {
    }

    public void applyASDEnable(Builder builder, boolean z) {
    }

    public void applyASDScene(Builder builder, int i) {
    }

    public void applyAiScenePeriod(Builder builder, int i) {
    }

    public void applyAutoZoomMode(Builder builder, int i) {
    }

    public void applyAutoZoomScaleOffset(Builder builder, float f) {
    }

    public void applyBackwardCaptureHint(Builder builder, byte b) {
    }

    public void applyBeautyParameter(Builder builder, HashSet<String> hashSet, BeautyValues beautyValues) {
    }

    public void applyBurstFps(Builder builder, int i) {
    }

    public void applyBurstHint(Builder builder, int i) {
    }

    public void applyCameraAi30Enable(Builder builder, boolean z) {
    }

    public void applyContrast(Builder builder, int i) {
    }

    public void applyCustomWB(Builder builder, int i) {
    }

    public void applyDepurpleEnable(Builder builder, boolean z) {
    }

    public void applyDeviceOrientation(Builder builder, int i) {
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
    }

    public void applyEyeLight(Builder builder, int i, int i2) {
    }

    public void applyFNumber(Builder builder, String str) {
    }

    public void applyFaceAnalyzeAge(Builder builder, boolean z) {
    }

    public void applyFaceScore(Builder builder, boolean z) {
    }

    public void applyFaceWaterMark(Builder builder, String str) {
    }

    public void applyFrontMirror(Builder builder, boolean z) {
    }

    public void applyHDR(Builder builder, boolean z) {
    }

    public void applyHDRCheckerEnable(Builder builder, boolean z) {
    }

    public void applyHFRDeflicker(Builder builder, boolean z) {
    }

    public void applyHHT(Builder builder, boolean z) {
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
    }

    public void applyIsHfrPreview(Builder builder, boolean z) {
    }

    public void applyLensDirtyDetect(Builder builder, boolean z) {
    }

    public void applyMacroMode(Builder builder, boolean z) {
    }

    public void applyMfnr(Builder builder, boolean z) {
    }

    public void applyMiBokeh(Builder builder, boolean z) {
    }

    public void applyMultiFrameInputNum(Builder builder, int i) {
    }

    public void applyParallelProcessEnable(Builder builder, boolean z) {
    }

    public void applyParallelProcessPath(Builder builder, String str) {
    }

    public void applyPortraitLighting(Builder builder, int i) {
    }

    public void applyRearBokeh(Builder builder, boolean z) {
    }

    public void applySaturation(Builder builder, int i) {
    }

    public void applySharpness(Builder builder, int i) {
    }

    public void applySnapshotTorch(Builder builder, boolean z) {
    }

    public void applyStFastZoomIn(Builder builder, boolean z) {
    }

    public void applySuperNightScene(Builder builder, boolean z) {
    }

    public void applySuperResolution(Builder builder, boolean z) {
    }

    public void applySwMfnr(Builder builder, boolean z) {
    }

    public void applyTimeWaterMark(Builder builder, String str) {
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
    }

    public void applyWaterMarkAppliedList(Builder builder, String str) {
    }

    public void applyWaterMarkType(Builder builder, String str) {
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportEyeLight(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportLensDirtyDetect(HashSet<String> hashSet) {
        return false;
    }
}

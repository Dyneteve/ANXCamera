package com.android.camera2;

import android.hardware.camera2.params.MeteringRectangle;
import android.location.Location;
import android.util.Range;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class CameraConfigs {
    private static final int MAX_JPEG_COMPRESSION_QUALITY = 100;
    private static final int MIN_JPEG_COMPRESSION_QUALITY = 1;
    private static final String TAG = CameraConfigs.class.getSimpleName();
    private boolean mAELocked;
    private MeteringRectangle[] mAERegions;
    private MeteringRectangle[] mAFRegions;
    private int mASDScene = -2;
    private boolean mAWBLocked;
    private boolean mAiSceneDetectEnabled;
    private int mAiSceneDetectPeriod;
    private int mAntiBanding = -1;
    private int mAutoZoomMode;
    private float mAutoZoomScaleOffset;
    private int mAwbCustomValue;
    private int mAwbMode = 1;
    private BeautyValues mBeautyValues;
    private boolean mCameraAi30Enabled;
    private int mColorEffect = -1;
    private int mContrastLevel = -1;
    private int mDeviceOrientation = -1;
    private boolean mDualCamWaterMarkEnabled = false;
    private boolean mEISEnabled;
    private int mExposureCompensationIndex;
    private int mExposureMeteringMode = -1;
    private long mExposureTime;
    private int mEyeLightType = Integer.parseInt(EyeLightConstant.OFF);
    private String mFNumber;
    private boolean mFaceAgeAnalyzeEnabled;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceScoreEnabled;
    private boolean mFaceWaterMarkEnabled = false;
    private String mFaceWaterMarkFormat = null;
    private int mFlashMode = -1;
    private float mFocusDistance = -1.0f;
    private int mFocusMode = -1;
    private boolean mFrontMirror;
    private Location mGpsLocation;
    private boolean mHDRCheckerEnabled;
    private boolean mHDREnabled;
    private boolean mHFRDeflicker;
    private boolean mHHTEnabled;
    private boolean mIsQcfaEnabled = false;
    private int mIso;
    private int mJpegQuality = -1;
    private int mJpegRotation = -1;
    private boolean mLensDirtyDetectEnabled;
    private boolean mMacroMode;
    private boolean mMfnrEnabled;
    private boolean mMiBokehEnabled;
    private boolean mNeedFlash;
    private boolean mNeedPausePreview = true;
    private boolean mNormalWideLDCEnabled;
    private boolean mOISEnabled;
    private boolean mOptimizedFlash;
    private int mPhotoFormat = 256;
    private int mPhotoMaxImages = 2;
    private CameraSize mPhotoSize;
    private int mPortraitLightingPattern;
    private int mPreviewFormat = 35;
    private Range<Integer> mPreviewFpsRange;
    private int mPreviewMaxImages = 1;
    private CameraSize mPreviewSize;
    private boolean mQuickShotAnimation;
    private boolean mRearBokehEnabled;
    private boolean mRecordingHintEnabled;
    private int mSaturationLevel = -1;
    private int mSceneMode;
    private int mSharpnessLevel = -1;
    private ArrayDeque<String> mShotPath = null;
    private ArrayDeque<String> mShotPathThumbnail = null;
    private int mShotType = 0;
    private CameraSize mSubPhotoSize;
    private boolean mSuperResolutionEnabled;
    private boolean mSwMfnrEnabled;
    private CameraSize mThumbnailSize;
    private boolean mTimeWaterMarkEnabled = false;
    private String mTimeWatermarkValue = null;
    private boolean mUltraWideLDCEnabled;
    private Range<Integer> mVideoFpsRange;
    private CameraSize mVideoSize;
    private CameraSize mVideoSnapshotSize;
    private List<String> mWaterMarkAppliedList = new ArrayList();
    private float mZoomRatio = 1.0f;
    private boolean mZslEnabled;

    public MeteringRectangle[] getAERegions() {
        return this.mAERegions;
    }

    public MeteringRectangle[] getAFRegions() {
        return this.mAFRegions;
    }

    public int getASDScene() {
        return this.mASDScene;
    }

    public int getAWBMode() {
        return this.mAwbMode;
    }

    public int getAiSceneDetectPeriod() {
        return this.mAiSceneDetectPeriod;
    }

    public int getAntiBanding() {
        return this.mAntiBanding;
    }

    public int getAutoZoomMode() {
        return this.mAutoZoomMode;
    }

    public float getAutoZoomScaleOffset() {
        return this.mAutoZoomScaleOffset;
    }

    public int getAwbCustomValue() {
        return this.mAwbCustomValue;
    }

    public BeautyValues getBeautyValues() {
        return this.mBeautyValues;
    }

    public int getColorEffect() {
        return this.mColorEffect;
    }

    public int getContrastLevel() {
        return this.mContrastLevel;
    }

    public int getDeviceOrientation() {
        return this.mDeviceOrientation;
    }

    public int getExposureCompensationIndex() {
        return this.mExposureCompensationIndex;
    }

    public int getExposureMeteringMode() {
        return this.mExposureMeteringMode;
    }

    public long getExposureTime() {
        return this.mExposureTime;
    }

    public int getEyeLightType() {
        return this.mEyeLightType;
    }

    public String getFNumber() {
        return this.mFNumber;
    }

    public String getFaceWaterMarkFormat() {
        return this.mFaceWaterMarkFormat;
    }

    public int getFlashMode() {
        return this.mFlashMode;
    }

    public float getFocusDistance() {
        return this.mFocusDistance;
    }

    public int getFocusMode() {
        return this.mFocusMode;
    }

    public Location getGpsLocation() {
        return this.mGpsLocation;
    }

    public int getISO() {
        return this.mIso;
    }

    public int getJpegQuality() {
        return this.mJpegQuality;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public boolean getNormalWideLDCEnabled() {
        return this.mNormalWideLDCEnabled;
    }

    public int getPhotoFormat() {
        return this.mPhotoFormat;
    }

    public int getPhotoMaxImages() {
        return this.mPhotoMaxImages;
    }

    public CameraSize getPhotoSize() {
        return this.mPhotoSize;
    }

    public int getPortraitLightingPattern() {
        return this.mPortraitLightingPattern;
    }

    public int getPreviewFormat() {
        return this.mPreviewFormat;
    }

    public Range<Integer> getPreviewFpsRange() {
        return this.mPreviewFpsRange;
    }

    public int getPreviewMaxImages() {
        return this.mPreviewMaxImages;
    }

    public CameraSize getPreviewSize() {
        return this.mPreviewSize;
    }

    public int getSaturationLevel() {
        return this.mSaturationLevel;
    }

    public int getSceneMode() {
        return this.mSceneMode;
    }

    public int getSharpnessLevel() {
        return this.mSharpnessLevel;
    }

    public String getShotPath() {
        String str = (String) this.mShotPath.poll();
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getShotPath: ");
        sb.append(str);
        sb.append(", size:");
        sb.append(this.mShotPath.size());
        Log.d(str2, sb.toString());
        return str;
    }

    public int getShotType() {
        return this.mShotType;
    }

    public CameraSize getSubPhotoSize() {
        return this.mSubPhotoSize;
    }

    public String getThumbnailShotPath() {
        String str = (String) this.mShotPathThumbnail.poll();
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getThumbnailShotPath: ");
        sb.append(str);
        sb.append(", size:");
        sb.append(this.mShotPathThumbnail.size());
        Log.d(str2, sb.toString());
        return str;
    }

    public CameraSize getThumbnailSize() {
        return this.mThumbnailSize;
    }

    public String getTimeWaterMarkValue() {
        return this.mTimeWatermarkValue;
    }

    public boolean getUltraWideLDCEnabled() {
        return this.mUltraWideLDCEnabled;
    }

    public Range<Integer> getVideoFpsRange() {
        return this.mVideoFpsRange;
    }

    public CameraSize getVideoSize() {
        return this.mVideoSize;
    }

    public CameraSize getVideoSnapshotSize() {
        return this.mVideoSnapshotSize;
    }

    public List<String> getWaterMarkAppliedList() {
        return this.mWaterMarkAppliedList;
    }

    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    public boolean isAELocked() {
        return this.mAELocked;
    }

    public boolean isAWBLocked() {
        return this.mAWBLocked;
    }

    public boolean isAiSceneDetectEnabled() {
        return this.mAiSceneDetectEnabled;
    }

    public boolean isCameraAi30Enabled() {
        return this.mCameraAi30Enabled;
    }

    public boolean isEISEnabled() {
        return this.mEISEnabled;
    }

    public boolean isFaceAgeAnalyzeEnabled() {
        return this.mFaceAgeAnalyzeEnabled;
    }

    public boolean isFaceDetectionEnabled() {
        return this.mFaceDetectionEnabled;
    }

    public boolean isFaceScoreEnabled() {
        return this.mFaceScoreEnabled;
    }

    public boolean isFrontMirror() {
        return this.mFrontMirror;
    }

    public boolean isHDRCheckerEnabled() {
        return this.mHDRCheckerEnabled;
    }

    public boolean isHDREnabled() {
        return this.mHDREnabled;
    }

    public boolean isHFRDeflicker() {
        return this.mHFRDeflicker;
    }

    public boolean isHHTEnabled() {
        return this.mHHTEnabled;
    }

    public boolean isLensDirtyDetectEnabled() {
        return this.mLensDirtyDetectEnabled;
    }

    public boolean isMacroMode() {
        return this.mMacroMode;
    }

    public boolean isMfnrEnabled() {
        return this.mMfnrEnabled;
    }

    public boolean isMiBokehEnabled() {
        return this.mMiBokehEnabled;
    }

    public boolean isNeedFlash() {
        return this.mNeedFlash;
    }

    public boolean isNeedPausePreview() {
        return this.mNeedPausePreview;
    }

    public boolean isOISEnabled() {
        return this.mOISEnabled;
    }

    public boolean isOptimizedFlash() {
        return this.mOptimizedFlash;
    }

    public boolean isQcfaEnable() {
        return this.mIsQcfaEnabled;
    }

    public boolean isQuickShotAnimation() {
        return this.mQuickShotAnimation;
    }

    public boolean isRearBokehEnabled() {
        return this.mRearBokehEnabled;
    }

    public boolean isRecordingHintEnabled() {
        return this.mRecordingHintEnabled;
    }

    public boolean isSuperResolutionEnabled() {
        return this.mSuperResolutionEnabled;
    }

    public boolean isSwMfnrEnabled() {
        return this.mSwMfnrEnabled;
    }

    public boolean isZslEnabled() {
        return this.mZslEnabled;
    }

    public boolean setAELock(boolean z) {
        if (this.mAELocked == z) {
            return false;
        }
        this.mAELocked = z;
        return true;
    }

    public boolean setAERegions(MeteringRectangle[] meteringRectangleArr) {
        if (Arrays.equals(this.mAERegions, meteringRectangleArr)) {
            return false;
        }
        this.mAERegions = meteringRectangleArr;
        return true;
    }

    public boolean setAFRegions(MeteringRectangle[] meteringRectangleArr) {
        if (Arrays.equals(this.mAFRegions, meteringRectangleArr)) {
            return false;
        }
        this.mAFRegions = meteringRectangleArr;
        return true;
    }

    public boolean setASDScene(int i) {
        if (this.mASDScene == i) {
            return false;
        }
        this.mASDScene = i;
        return true;
    }

    public boolean setAWBLock(boolean z) {
        if (this.mAWBLocked == z) {
            return false;
        }
        this.mAWBLocked = z;
        return true;
    }

    public boolean setAWBMode(int i) {
        if (this.mAwbMode == i) {
            return false;
        }
        this.mAwbMode = i;
        return true;
    }

    public boolean setAiSceneDetectEnable(boolean z) {
        if (this.mAiSceneDetectEnabled == z) {
            return false;
        }
        this.mAiSceneDetectEnabled = z;
        return true;
    }

    public boolean setAiSceneDetectPeriod(int i) {
        if (this.mAiSceneDetectPeriod == i) {
            return false;
        }
        this.mAiSceneDetectPeriod = i;
        return true;
    }

    public boolean setAntiBanding(int i) {
        if (this.mAntiBanding == i) {
            return false;
        }
        this.mAntiBanding = i;
        return true;
    }

    public void setAutoZoomMode(int i) {
        this.mAutoZoomMode = i;
    }

    public void setAutoZoomScaleOffset(float f) {
        this.mAutoZoomScaleOffset = f;
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mBeautyValues = beautyValues;
    }

    public boolean setCameraAi30Enable(boolean z) {
        if (this.mCameraAi30Enabled == z) {
            return false;
        }
        this.mCameraAi30Enabled = z;
        return true;
    }

    public boolean setColorEffect(int i) {
        if (this.mColorEffect == i) {
            return false;
        }
        this.mColorEffect = i;
        return true;
    }

    public boolean setContrastLevel(int i) {
        if (this.mContrastLevel == i) {
            return false;
        }
        this.mContrastLevel = i;
        return true;
    }

    public boolean setCustomAWB(int i) {
        if (this.mAwbCustomValue == i) {
            return false;
        }
        this.mAwbCustomValue = i;
        return true;
    }

    public boolean setDeviceOrientation(int i) {
        if (this.mDeviceOrientation == i) {
            return false;
        }
        this.mDeviceOrientation = i;
        return true;
    }

    public boolean setDualCamWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "device", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("device");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("device");
        }
        if (this.mDualCamWaterMarkEnabled == z) {
            return false;
        }
        this.mDualCamWaterMarkEnabled = z;
        return true;
    }

    public boolean setEnableEIS(boolean z) {
        if (this.mEISEnabled == z) {
            return false;
        }
        this.mEISEnabled = z;
        return true;
    }

    public void setEnableOIS(boolean z) {
        this.mOISEnabled = z;
    }

    public void setEnableZsl(boolean z) {
        this.mZslEnabled = z;
    }

    public boolean setExposureCompensationIndex(int i) {
        if (this.mExposureCompensationIndex == i) {
            return false;
        }
        this.mExposureCompensationIndex = i;
        return true;
    }

    public boolean setExposureMeteringMode(int i) {
        if (this.mExposureMeteringMode == i) {
            return false;
        }
        this.mExposureMeteringMode = i;
        return true;
    }

    public boolean setExposureTime(long j) {
        if (this.mExposureTime == j) {
            return false;
        }
        this.mExposureTime = j;
        return true;
    }

    public boolean setEyeLight(int i) {
        if (this.mEyeLightType == i) {
            return false;
        }
        this.mEyeLightType = i;
        return true;
    }

    public void setFNumber(String str) {
        this.mFNumber = str;
    }

    public boolean setFaceAgeAnalyzeEnabled(boolean z) {
        if (this.mFaceAgeAnalyzeEnabled == z) {
            return false;
        }
        this.mFaceAgeAnalyzeEnabled = z;
        return true;
    }

    public boolean setFaceDetectionEnabled(boolean z) {
        if (this.mFaceDetectionEnabled == z) {
            return false;
        }
        this.mFaceDetectionEnabled = z;
        return true;
    }

    public boolean setFaceScoreEnabled(boolean z) {
        if (this.mFaceScoreEnabled == z) {
            return false;
        }
        this.mFaceScoreEnabled = z;
        return true;
    }

    public boolean setFaceWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "beautify", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("beautify");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("beautify");
        }
        if (this.mFaceWaterMarkEnabled == z) {
            return false;
        }
        this.mFaceWaterMarkEnabled = z;
        return true;
    }

    public void setFaceWaterMarkFormat(String str) {
        this.mFaceWaterMarkFormat = str;
    }

    public boolean setFlashMode(int i) {
        if (this.mFlashMode == i) {
            return false;
        }
        this.mFlashMode = i;
        return true;
    }

    public boolean setFocusDistance(float f) {
        if (this.mFocusDistance == f) {
            return false;
        }
        this.mFocusDistance = f;
        return true;
    }

    public boolean setFocusMode(int i) {
        if (this.mFocusMode == i) {
            return false;
        }
        this.mFocusMode = i;
        return true;
    }

    public void setFrontMirror(boolean z) {
        this.mFrontMirror = z;
    }

    public void setGpsLocation(Location location) {
        this.mGpsLocation = location;
    }

    public boolean setHDRCheckerEnabled(boolean z) {
        if (this.mHDRCheckerEnabled == z) {
            return false;
        }
        this.mHDRCheckerEnabled = z;
        return true;
    }

    public boolean setHDREnabled(boolean z) {
        if (this.mHDREnabled == z) {
            return false;
        }
        this.mHDREnabled = z;
        return true;
    }

    public boolean setHFRDeflickerEnable(boolean z) {
        if (z == this.mHFRDeflicker) {
            return false;
        }
        this.mHFRDeflicker = z;
        return true;
    }

    public boolean setHHTEnabled(boolean z) {
        if (this.mHHTEnabled == z) {
            return false;
        }
        this.mHHTEnabled = z;
        return true;
    }

    public boolean setISO(int i) {
        if (this.mIso == i) {
            return false;
        }
        this.mIso = i;
        return true;
    }

    public boolean setJpegQuality(int i) {
        if (i < 1 || i > 100) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setJpegQuality: invalid jpeg quality ");
            sb.append(i);
            Log.w(str, sb.toString());
            return false;
        } else if (this.mJpegQuality == i) {
            return false;
        } else {
            this.mJpegQuality = i;
            return true;
        }
    }

    public boolean setJpegRotation(int i) {
        if (this.mJpegRotation == i) {
            return false;
        }
        this.mJpegRotation = i;
        return true;
    }

    public boolean setLensDirtyDetectEnabled(boolean z) {
        if (this.mLensDirtyDetectEnabled == z) {
            return false;
        }
        this.mLensDirtyDetectEnabled = z;
        return true;
    }

    public boolean setMacroMode(boolean z) {
        if (z == this.mMacroMode) {
            return false;
        }
        this.mMacroMode = z;
        return true;
    }

    public boolean setMfnrEnabled(boolean z) {
        if (this.mMfnrEnabled == z) {
            return false;
        }
        this.mMfnrEnabled = z;
        return true;
    }

    public boolean setMiBokehEnabled(boolean z) {
        if (this.mMiBokehEnabled == z) {
            return false;
        }
        this.mMiBokehEnabled = z;
        return true;
    }

    public boolean setNeedFlash(boolean z) {
        if (this.mNeedFlash == z) {
            return false;
        }
        this.mNeedFlash = z;
        return true;
    }

    public boolean setNormalWideLDCEnabled(boolean z) {
        if (this.mNormalWideLDCEnabled == z) {
            return false;
        }
        this.mNormalWideLDCEnabled = z;
        return true;
    }

    public boolean setOptimizedFlash(boolean z) {
        if (this.mOptimizedFlash == z) {
            return false;
        }
        this.mOptimizedFlash = z;
        return true;
    }

    public boolean setPausePreview(boolean z) {
        if (this.mNeedPausePreview == z) {
            return false;
        }
        this.mNeedPausePreview = z;
        return true;
    }

    public boolean setPhotoFormat(int i) {
        if (this.mPhotoFormat == i) {
            return false;
        }
        this.mPhotoFormat = i;
        return true;
    }

    public void setPhotoMaxImages(int i) {
        this.mPhotoMaxImages = i;
    }

    public boolean setPhotoSize(CameraSize cameraSize) {
        if (Objects.equals(this.mPhotoSize, cameraSize)) {
            return false;
        }
        this.mPhotoSize = cameraSize;
        return true;
    }

    public boolean setPortraitLightingPattern(int i) {
        if (this.mPortraitLightingPattern == i) {
            return false;
        }
        this.mPortraitLightingPattern = i;
        return true;
    }

    public boolean setPreviewFormat(int i) {
        if (this.mPreviewFormat == i) {
            return false;
        }
        this.mPreviewFormat = i;
        return true;
    }

    public boolean setPreviewFpsRange(Range<Integer> range) {
        if (Objects.equals(this.mPreviewFpsRange, range)) {
            return false;
        }
        this.mPreviewFpsRange = range;
        return true;
    }

    public void setPreviewMaxImages(int i) {
        this.mPreviewMaxImages = i;
    }

    public boolean setPreviewSize(CameraSize cameraSize) {
        if (Objects.equals(this.mPreviewSize, cameraSize)) {
            return false;
        }
        this.mPreviewSize = cameraSize;
        return true;
    }

    public void setQcfaEnable(boolean z) {
        this.mIsQcfaEnabled = z;
    }

    public void setQuickShotAnimation(boolean z) {
        this.mQuickShotAnimation = z;
    }

    public boolean setRearBokehEnable(boolean z) {
        if (this.mRearBokehEnabled == z) {
            return false;
        }
        this.mRearBokehEnabled = z;
        return true;
    }

    public boolean setRecordingHintEnabled(boolean z) {
        if (this.mRecordingHintEnabled == z) {
            return false;
        }
        this.mRecordingHintEnabled = z;
        return true;
    }

    public boolean setSaturationLevel(int i) {
        if (this.mSaturationLevel == i) {
            return false;
        }
        this.mSaturationLevel = i;
        return true;
    }

    public boolean setSceneMode(int i) {
        if (this.mSceneMode == i) {
            return false;
        }
        this.mSceneMode = i;
        return true;
    }

    public boolean setSharpnessLevel(int i) {
        if (this.mSharpnessLevel == i) {
            return false;
        }
        this.mSharpnessLevel = i;
        return true;
    }

    public void setShotPath(String str, boolean z) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setShotPath: ");
        sb.append(str);
        Log.d(str2, sb.toString());
        if (this.mShotPath == null) {
            this.mShotPath = new ArrayDeque<>(5);
        }
        this.mShotPath.offer(str);
        if (z) {
            if (this.mShotPathThumbnail == null) {
                this.mShotPathThumbnail = new ArrayDeque<>(5);
            }
            this.mShotPathThumbnail.offer(str);
        }
    }

    public boolean setShotType(int i) {
        if (this.mShotType == i) {
            return false;
        }
        this.mShotType = i;
        return true;
    }

    public boolean setSubPhotoSize(CameraSize cameraSize) {
        if (Objects.equals(this.mSubPhotoSize, cameraSize)) {
            return false;
        }
        this.mSubPhotoSize = cameraSize;
        return true;
    }

    public boolean setSuperResolutionEnabled(boolean z) {
        if (this.mSuperResolutionEnabled == z) {
            return false;
        }
        this.mSuperResolutionEnabled = z;
        return true;
    }

    public boolean setSwMfnrEnabled(boolean z) {
        if (this.mSwMfnrEnabled == z) {
            return false;
        }
        this.mSwMfnrEnabled = z;
        return true;
    }

    public boolean setThumbnailSize(CameraSize cameraSize) {
        if (Objects.equals(this.mThumbnailSize, cameraSize)) {
            return false;
        }
        this.mThumbnailSize = cameraSize;
        return true;
    }

    public boolean setTimeWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "watermark", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("watermark");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("watermark");
        }
        if (this.mTimeWaterMarkEnabled == z) {
            return false;
        }
        this.mTimeWaterMarkEnabled = z;
        return true;
    }

    public void setTimeWaterMarkValue(String str) {
        this.mTimeWatermarkValue = str;
    }

    public boolean setUltraWideLDCEnabled(boolean z) {
        if (this.mUltraWideLDCEnabled == z) {
            return false;
        }
        this.mUltraWideLDCEnabled = z;
        return true;
    }

    public boolean setVideoFpsRange(Range<Integer> range) {
        if (Objects.equals(this.mVideoFpsRange, range)) {
            return false;
        }
        this.mVideoFpsRange = range;
        return true;
    }

    public void setVideoSize(CameraSize cameraSize) {
        this.mVideoSize = cameraSize;
    }

    public void setVideoSnapshotSize(CameraSize cameraSize) {
        this.mVideoSnapshotSize = cameraSize;
    }

    public boolean setZoomRatio(float f) {
        float abs = Math.abs(this.mZoomRatio - f);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("zoom ratio diff: ");
        sb.append(abs);
        Log.d(str, sb.toString());
        this.mZoomRatio = f;
        return true;
    }
}

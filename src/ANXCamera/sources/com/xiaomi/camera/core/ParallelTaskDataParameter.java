package com.xiaomi.camera.core;

import android.location.Location;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Size;
import com.android.camera.effect.renders.DeviceWatermarkParam;
import com.android.camera.watermark.WaterMarkData;
import java.util.List;

public class ParallelTaskDataParameter {
    /* access modifiers changed from: private */
    public boolean mAgeGenderAndMagicMirrorWater;
    /* access modifiers changed from: private */
    public String mAlgorithmName;
    /* access modifiers changed from: private */
    public boolean mBokehFrontCamera;
    /* access modifiers changed from: private */
    public DeviceWatermarkParam mDeviceWatermarkParam;
    /* access modifiers changed from: private */
    public List<WaterMarkData> mFaceWaterMarkList;
    /* access modifiers changed from: private */
    public int mFilterId;
    /* access modifiers changed from: private */
    public boolean mHasDualWaterMark;
    /* access modifiers changed from: private */
    public boolean mIsFrontCamera;
    /* access modifiers changed from: private */
    public boolean mIsGradienterOn;
    /* access modifiers changed from: private */
    public int mJpegQuality;
    /* access modifiers changed from: private */
    public int mJpegRotation;
    /* access modifiers changed from: private */
    public int mLightingPattern;
    /* access modifiers changed from: private */
    public Location mLocation;
    /* access modifiers changed from: private */
    public boolean mMirror;
    /* access modifiers changed from: private */
    public int mOrientation;
    private Size mOutputSize;
    /* access modifiers changed from: private */
    public PictureInfo mPictureInfo;
    private Size mPictureSize;
    /* access modifiers changed from: private */
    public String mPrefix;
    private Size mPreviewSize;
    /* access modifiers changed from: private */
    public boolean mSaveGroupshotPrimitive;
    /* access modifiers changed from: private */
    public int mShootOrientation;
    /* access modifiers changed from: private */
    public float mShootRotation;
    /* access modifiers changed from: private */
    public String mSuffix;
    /* access modifiers changed from: private */
    public String mTiltShiftMode;
    /* access modifiers changed from: private */
    public String mTimeWaterMarkString;

    public static final class Builder {
        private final ParallelTaskDataParameter mParameter;

        public Builder(Size size, Size size2, Size size3) {
            this.mParameter = new ParallelTaskDataParameter(size, size2, size3);
        }

        public Builder(ParallelTaskDataParameter parallelTaskDataParameter) {
            this.mParameter = new ParallelTaskDataParameter();
        }

        @NonNull
        public ParallelTaskDataParameter build() {
            return this.mParameter;
        }

        public Builder setAgeGenderAndMagicMirrorWater(boolean z) {
            this.mParameter.mAgeGenderAndMagicMirrorWater = z;
            return this;
        }

        public Builder setAlgorithmName(String str) {
            this.mParameter.mAlgorithmName = str;
            return this;
        }

        public Builder setBokehFrontCamera(boolean z) {
            this.mParameter.mBokehFrontCamera = z;
            return this;
        }

        public Builder setDeviceWatermarkParam(DeviceWatermarkParam deviceWatermarkParam) {
            this.mParameter.mDeviceWatermarkParam = deviceWatermarkParam;
            return this;
        }

        public Builder setFaceWaterMarkList(List<WaterMarkData> list) {
            this.mParameter.mFaceWaterMarkList = list;
            return this;
        }

        public Builder setFilterId(int i) {
            this.mParameter.mFilterId = i;
            return this;
        }

        public Builder setFrontCamera(boolean z) {
            this.mParameter.mIsFrontCamera = z;
            return this;
        }

        public Builder setGradienterOn(boolean z) {
            this.mParameter.mIsGradienterOn = z;
            return this;
        }

        public Builder setHasDualWaterMark(boolean z) {
            this.mParameter.mHasDualWaterMark = z;
            return this;
        }

        public Builder setJpegQuality(int i) {
            this.mParameter.mJpegQuality = i;
            return this;
        }

        public Builder setJpegRotation(int i) {
            this.mParameter.mJpegRotation = i;
            return this;
        }

        public Builder setLightingPattern(int i) {
            this.mParameter.mLightingPattern = i;
            return this;
        }

        public Builder setLocation(Location location) {
            this.mParameter.mLocation = location;
            return this;
        }

        public Builder setMirror(boolean z) {
            this.mParameter.mMirror = z;
            return this;
        }

        public Builder setOrientation(int i) {
            this.mParameter.mOrientation = i;
            return this;
        }

        public Builder setPictureInfo(PictureInfo pictureInfo) {
            this.mParameter.mPictureInfo = pictureInfo;
            return this;
        }

        public Builder setPrefix(String str) {
            this.mParameter.mPrefix = str;
            return this;
        }

        public Builder setSaveGroupshotPrimitive(boolean z) {
            this.mParameter.mSaveGroupshotPrimitive = z;
            return this;
        }

        public Builder setShootOrientation(int i) {
            this.mParameter.mShootOrientation = i;
            return this;
        }

        public Builder setShootRotation(float f) {
            this.mParameter.mShootRotation = f;
            return this;
        }

        public Builder setSuffix(String str) {
            this.mParameter.mSuffix = str;
            return this;
        }

        public Builder setTiltShiftMode(String str) {
            this.mParameter.mTiltShiftMode = str;
            return this;
        }

        public Builder setTimeWaterMarkString(String str) {
            this.mParameter.mTimeWaterMarkString = str;
            return this;
        }
    }

    private ParallelTaskDataParameter(Size size, Size size2, Size size3) {
        this.mPreviewSize = size;
        this.mPictureSize = size2;
        this.mOutputSize = size3;
    }

    private ParallelTaskDataParameter(ParallelTaskDataParameter parallelTaskDataParameter) {
        this.mHasDualWaterMark = parallelTaskDataParameter.mHasDualWaterMark;
        this.mMirror = parallelTaskDataParameter.mMirror;
        this.mLightingPattern = parallelTaskDataParameter.mLightingPattern;
        if (parallelTaskDataParameter.mPreviewSize != null) {
            this.mPreviewSize = new Size(parallelTaskDataParameter.mPreviewSize.getWidth(), parallelTaskDataParameter.mPreviewSize.getHeight());
        }
        if (parallelTaskDataParameter.mPictureSize != null) {
            this.mPictureSize = new Size(parallelTaskDataParameter.mPictureSize.getWidth(), parallelTaskDataParameter.mPictureSize.getHeight());
        }
        this.mFilterId = parallelTaskDataParameter.mFilterId;
        this.mOrientation = parallelTaskDataParameter.mOrientation;
        this.mJpegRotation = parallelTaskDataParameter.mJpegRotation;
        this.mShootRotation = parallelTaskDataParameter.mShootRotation;
        this.mShootOrientation = parallelTaskDataParameter.mShootOrientation;
        if (parallelTaskDataParameter.mLocation != null) {
            this.mLocation = new Location(parallelTaskDataParameter.mLocation);
        }
        this.mTimeWaterMarkString = parallelTaskDataParameter.mTimeWaterMarkString;
        this.mFaceWaterMarkList = parallelTaskDataParameter.mFaceWaterMarkList;
        this.mAgeGenderAndMagicMirrorWater = parallelTaskDataParameter.mAgeGenderAndMagicMirrorWater;
        this.mIsFrontCamera = parallelTaskDataParameter.mIsFrontCamera;
        if (parallelTaskDataParameter.mOutputSize != null) {
            this.mOutputSize = new Size(parallelTaskDataParameter.mOutputSize.getWidth(), parallelTaskDataParameter.mOutputSize.getHeight());
        }
        this.mBokehFrontCamera = parallelTaskDataParameter.mBokehFrontCamera;
        this.mAlgorithmName = parallelTaskDataParameter.mAlgorithmName;
        this.mPictureInfo = parallelTaskDataParameter.mPictureInfo;
        this.mSuffix = parallelTaskDataParameter.mSuffix;
        this.mIsGradienterOn = parallelTaskDataParameter.mIsGradienterOn;
        this.mTiltShiftMode = parallelTaskDataParameter.mTiltShiftMode;
        this.mDeviceWatermarkParam = parallelTaskDataParameter.mDeviceWatermarkParam;
        this.mJpegQuality = parallelTaskDataParameter.mJpegQuality;
    }

    public String getAlgorithmName() {
        return this.mAlgorithmName;
    }

    public DeviceWatermarkParam getDeviceWatermarkParam() {
        return this.mDeviceWatermarkParam;
    }

    public List<WaterMarkData> getFaceWaterMarkList() {
        return this.mFaceWaterMarkList;
    }

    public int getFilterId() {
        return this.mFilterId;
    }

    public int getJpegQuality() {
        return this.mJpegQuality;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public int getLightingPattern() {
        return this.mLightingPattern;
    }

    public Location getLocation() {
        return this.mLocation;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public Size getOutputSize() {
        return this.mOutputSize;
    }

    public PictureInfo getPictureInfo() {
        return this.mPictureInfo;
    }

    public Size getPictureSize() {
        return this.mPictureSize;
    }

    public String getPrefix() {
        return this.mPrefix;
    }

    public Size getPreviewSize() {
        return this.mPreviewSize;
    }

    public int getShootOrientation() {
        return this.mShootOrientation;
    }

    public float getShootRotation() {
        return this.mShootRotation;
    }

    public String getSuffix() {
        return this.mSuffix;
    }

    public String getTiltShiftMode() {
        return this.mTiltShiftMode;
    }

    public String getTimeWaterMarkString() {
        return this.mTimeWaterMarkString;
    }

    public boolean isAgeGenderAndMagicMirrorWater() {
        return this.mAgeGenderAndMagicMirrorWater;
    }

    public boolean isBokehFrontCamera() {
        return this.mBokehFrontCamera;
    }

    public boolean isFrontCamera() {
        return this.mIsFrontCamera;
    }

    public boolean isGradienterOn() {
        return this.mIsGradienterOn;
    }

    public boolean isHasDualWaterMark() {
        return this.mHasDualWaterMark;
    }

    public boolean isHasFrontWaterMark() {
        return this.mDeviceWatermarkParam != null && this.mDeviceWatermarkParam.isFrontWatermarkEnable();
    }

    public boolean isHasWaterMark() {
        return isHasDualWaterMark() || isHasFrontWaterMark() || !TextUtils.isEmpty(this.mTimeWaterMarkString);
    }

    public boolean isMirror() {
        return this.mMirror;
    }

    public boolean isSaveGroupshotPrimitive() {
        return this.mSaveGroupshotPrimitive;
    }

    public boolean isUtralPixelWaterMark() {
        return this.mDeviceWatermarkParam != null && this.mDeviceWatermarkParam.isUltraWatermarkEnable();
    }
}

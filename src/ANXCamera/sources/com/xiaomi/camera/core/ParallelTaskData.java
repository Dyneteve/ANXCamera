package com.xiaomi.camera.core;

import com.android.camera.log.Log;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import com.xiaomi.protocol.ICustomCaptureResult;

public class ParallelTaskData {
    private static final String GROUPSHOT_ORIGINAL_SUFFIX = "_ORG";
    private static final String TAG = ParallelTaskData.class.getSimpleName();
    private int currentModuleIndex = -1;
    private boolean isAdaptiveSnapshotSize;
    private boolean isLiveShotTask;
    private boolean isNeedThumbnail;
    private boolean isPictureFilled;
    private int mAlgoType;
    private int mBurstNum;
    private ICustomCaptureResult mCaptureResult;
    private int[] mCoordinatesOfTheRegionUnderWatermarks;
    private long mCoverFrameTimestamp;
    private byte[] mDataOfTheRegionUnderWatermarks;
    private ParallelTaskDataParameter mDataParameter;
    private byte[] mJpegImageData;
    private int mParallelType;
    private byte[] mPortraitDepthData;
    private byte[] mPortraitRawData;
    private String mSavePath;
    private long mTimestamp;
    private byte[] mVideoRawData = null;
    private int previewThumbnailHash;

    public ParallelTaskData(long j, int i, String str) {
        this.mTimestamp = j;
        this.mParallelType = i;
        this.mSavePath = str;
    }

    public ParallelTaskData(ParallelTaskData parallelTaskData) {
        this.mParallelType = parallelTaskData.mParallelType;
        this.mTimestamp = parallelTaskData.mTimestamp;
        this.mCaptureResult = parallelTaskData.mCaptureResult;
        this.mJpegImageData = parallelTaskData.mJpegImageData;
        this.mPortraitRawData = parallelTaskData.mPortraitRawData;
        this.mPortraitDepthData = parallelTaskData.mPortraitDepthData;
        this.mSavePath = parallelTaskData.mSavePath;
        this.mDataParameter = parallelTaskData.mDataParameter;
        this.isNeedThumbnail = parallelTaskData.isNeedThumbnail;
        this.mVideoRawData = parallelTaskData.mVideoRawData;
        this.mCoverFrameTimestamp = parallelTaskData.mCoverFrameTimestamp;
        this.isLiveShotTask = parallelTaskData.isLiveShotTask;
        this.isPictureFilled = parallelTaskData.isPictureFilled;
        this.mDataOfTheRegionUnderWatermarks = parallelTaskData.mDataOfTheRegionUnderWatermarks;
        this.mCoordinatesOfTheRegionUnderWatermarks = parallelTaskData.mCoordinatesOfTheRegionUnderWatermarks;
    }

    public void checkThread() {
    }

    public ParallelTaskData cloneTaskData(int i) {
        String str;
        ParallelTaskData parallelTaskData = new ParallelTaskData(this);
        String savePath = getSavePath();
        String str2 = GROUPSHOT_ORIGINAL_SUFFIX;
        if (i > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append("_");
            sb.append(i);
            str2 = sb.toString();
        }
        int lastIndexOf = savePath.lastIndexOf(".");
        if (lastIndexOf > 0) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(savePath.substring(0, lastIndexOf));
            sb2.append(str2);
            sb2.append(savePath.substring(lastIndexOf));
            str = sb2.toString();
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(savePath);
            sb3.append(str2);
            str = sb3.toString();
        }
        String str3 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("[1] cloneTaskData: path=");
        sb4.append(str);
        Log.d(str3, sb4.toString());
        parallelTaskData.setSavePath(str);
        parallelTaskData.setNeedThumbnail(false);
        Builder builder = new Builder(getDataParameter());
        builder.setHasDualWaterMark(false);
        builder.setTimeWaterMarkString(null);
        builder.setSaveGroupshotPrimitive(false);
        parallelTaskData.fillParameter(builder.build());
        return parallelTaskData;
    }

    public synchronized void fillJpegData(byte[] bArr, int i) {
        checkThread();
        switch (i) {
            case 0:
                if (this.mJpegImageData == null) {
                    this.isPictureFilled = true;
                    this.mJpegImageData = bArr;
                    break;
                } else {
                    throw new RuntimeException("algo fillJpegData: jpeg already set");
                }
            case 1:
                if (this.mPortraitRawData == null) {
                    this.mPortraitRawData = bArr;
                    break;
                } else {
                    throw new RuntimeException("algo fillJpegData: raw already set");
                }
            case 2:
                if (this.mPortraitDepthData == null) {
                    this.mPortraitDepthData = new byte[bArr.length];
                    System.arraycopy(bArr, 0, this.mPortraitDepthData, 0, bArr.length);
                    break;
                } else {
                    throw new RuntimeException("algo fillJpegData: depth already set");
                }
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("fillJpegData: jpegData=");
        sb.append(bArr);
        sb.append("; imageType=");
        sb.append(i);
        Log.d(str, sb.toString());
    }

    public void fillParameter(ParallelTaskDataParameter parallelTaskDataParameter) {
        this.mDataParameter = parallelTaskDataParameter;
    }

    public synchronized void fillVideoData(byte[] bArr, long j) {
        checkThread();
        if (this.mVideoRawData == null) {
            this.mVideoRawData = bArr;
            this.mCoverFrameTimestamp = j;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("fillVideoData: video = ");
            sb.append(bArr);
            sb.append(", timestamp = ");
            sb.append(j);
            Log.d(str, sb.toString());
        } else {
            throw new IllegalStateException("algo fillVideoData: microvideo already set");
        }
    }

    public int getAlgoType() {
        return this.mAlgoType;
    }

    public int getBurstNum() {
        return this.mBurstNum;
    }

    public ICustomCaptureResult getCaptureResult() {
        return this.mCaptureResult;
    }

    public int[] getCoordinatesOfTheRegionUnderWatermarks() {
        return this.mCoordinatesOfTheRegionUnderWatermarks;
    }

    public synchronized long getCoverFrameTimestamp() {
        return this.mCoverFrameTimestamp;
    }

    public int getCurrentModuleIndex() {
        return this.currentModuleIndex;
    }

    public byte[] getDataOfTheRegionUnderWatermarks() {
        return this.mDataOfTheRegionUnderWatermarks;
    }

    public ParallelTaskDataParameter getDataParameter() {
        return this.mDataParameter;
    }

    public byte[] getJpegImageData() {
        return this.mJpegImageData;
    }

    public synchronized byte[] getMicroVideoData() {
        return this.mVideoRawData;
    }

    public int getParallelType() {
        return this.mParallelType;
    }

    public byte[] getPortraitDepthData() {
        return this.mPortraitDepthData;
    }

    public byte[] getPortraitRawData() {
        return this.mPortraitRawData;
    }

    public int getPreviewThumbnailHash() {
        return this.previewThumbnailHash;
    }

    public String getSavePath() {
        return this.mSavePath;
    }

    public long getTimestamp() {
        return this.mTimestamp;
    }

    public boolean isAdaptiveSnapshotSize() {
        return this.isAdaptiveSnapshotSize;
    }

    public synchronized boolean isJpegDataReady() {
        boolean z;
        z = false;
        switch (this.mParallelType) {
            case -3:
            case 2:
            case 6:
            case 7:
                if (this.mJpegImageData != null && this.mPortraitRawData != null && this.mPortraitDepthData != null) {
                    z = true;
                    break;
                } else {
                    break;
                }
                break;
            case -2:
            case -1:
            case 0:
            case 5:
            case 8:
            case 9:
                if (this.mJpegImageData != null) {
                    z = true;
                }
                break;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isJpegDataReady: object = ");
        sb.append(this);
        sb.append("; mParallelType = ");
        sb.append(this.mParallelType);
        sb.append("; mJpegImageData = ");
        sb.append(this.mJpegImageData);
        sb.append("; mPortraitRawData = ");
        sb.append(this.mPortraitRawData);
        sb.append("; mPortraitDepthData = ");
        sb.append(this.mPortraitDepthData);
        sb.append("; mVideoRawData = ");
        sb.append(this.mVideoRawData);
        sb.append("; result = ");
        sb.append(z);
        Log.d(str, sb.toString());
        return z;
    }

    public synchronized boolean isLiveShotTask() {
        return this.isLiveShotTask;
    }

    public boolean isNeedThumbnail() {
        return this.isNeedThumbnail;
    }

    public synchronized boolean isPictureFilled() {
        return this.isPictureFilled;
    }

    public void refillJpegData(byte[] bArr) {
        this.mJpegImageData = bArr;
        this.isPictureFilled = true;
    }

    public void releaseImageData() {
        this.mVideoRawData = null;
        this.mJpegImageData = null;
        this.mPortraitRawData = null;
        this.mPortraitDepthData = null;
        this.isPictureFilled = false;
        this.mDataOfTheRegionUnderWatermarks = null;
        this.mCoordinatesOfTheRegionUnderWatermarks = null;
    }

    public void setAdaptiveSnapshotSize(boolean z) {
        this.isAdaptiveSnapshotSize = z;
    }

    public void setAlgoType(int i) {
        this.mAlgoType = i;
    }

    public void setBurstNum(int i) {
        this.mBurstNum = i;
    }

    public void setCaptureResult(ICustomCaptureResult iCustomCaptureResult) {
        this.mCaptureResult = iCustomCaptureResult;
    }

    public void setCoordinatesOfTheRegionUnderWatermarks(int[] iArr) {
        this.mCoordinatesOfTheRegionUnderWatermarks = iArr;
    }

    public void setCurrentModuleIndex(int i) {
        this.currentModuleIndex = i;
    }

    public void setDataOfTheRegionUnderWatermarks(byte[] bArr) {
        this.mDataOfTheRegionUnderWatermarks = bArr;
    }

    public synchronized void setLiveShotTask(boolean z) {
        this.isLiveShotTask = z;
    }

    public void setNeedThumbnail(boolean z) {
        this.isNeedThumbnail = z;
    }

    public synchronized void setPictureFilled(boolean z) {
        this.isPictureFilled = z;
    }

    public void setPreviewThumbnailHash(int i) {
        this.previewThumbnailHash = i;
    }

    public void setSavePath(String str) {
        this.mSavePath = str;
    }

    public void setTimestamp(long j) {
        this.mTimestamp = j;
    }
}

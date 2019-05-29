package com.xiaomi.camera.core;

import android.media.Image;
import android.support.annotation.NonNull;
import android.util.Size;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.effect.renders.DeviceWatermarkParam;
import com.android.camera.effect.renders.SnapshotRender;
import com.android.camera.log.Log;

public class FilterProcessor {
    private static final String TAG = FilterProcessor.class.getSimpleName();
    private Size mRenderSize = new Size(0, 0);
    private SnapshotRender mYuvSnapshotRender;

    private static DrawYuvAttribute getDrawYuvAttribute(Image image, boolean z, ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        DrawYuvAttribute drawYuvAttribute = new DrawYuvAttribute(image, dataParameter.getPreviewSize(), dataParameter.getPictureSize(), dataParameter.getFilterId(), dataParameter.getOrientation(), dataParameter.getJpegRotation(), dataParameter.getShootRotation(), System.currentTimeMillis(), dataParameter.isMirror(), z, dataParameter.isGradienterOn(), dataParameter.getTiltShiftMode(), dataParameter.getTimeWaterMarkString(), EffectController.getInstance().copyEffectRectAttribute(), dataParameter.getFaceWaterMarkList());
        return drawYuvAttribute;
    }

    private boolean isWatermarkEnabled(ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        return dataParameter.isHasDualWaterMark() || dataParameter.isHasFrontWaterMark() || dataParameter.getTimeWaterMarkString() != null || dataParameter.isAgeGenderAndMagicMirrorWater();
    }

    private void prepareEffectProcessor(ParallelTaskDataParameter parallelTaskDataParameter) {
        int filterId = parallelTaskDataParameter.getFilterId();
        Size pictureSize = parallelTaskDataParameter.getPictureSize();
        DeviceWatermarkParam deviceWatermarkParam = parallelTaskDataParameter.getDeviceWatermarkParam();
        if (this.mYuvSnapshotRender == null || !this.mRenderSize.equals(pictureSize)) {
            init(pictureSize);
        }
        Log.d(TAG, String.format("prepareEffectProcessor: %x", new Object[]{Integer.valueOf(filterId)}));
        this.mYuvSnapshotRender.prepareEffectRender(deviceWatermarkParam, filterId);
    }

    private void releaseEffectProcessor() {
        if (this.mYuvSnapshotRender != null) {
            this.mYuvSnapshotRender.release();
            this.mYuvSnapshotRender = null;
        }
    }

    private boolean shouldApplyEffect(@NonNull ParallelTaskData parallelTaskData) {
        boolean z = true;
        if (isWatermarkEnabled(parallelTaskData)) {
            return true;
        }
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        if (dataParameter == null || (FilterInfo.FILTER_ID_NONE == dataParameter.getFilterId() && !dataParameter.isGradienterOn() && dataParameter.getTiltShiftMode() == null)) {
            z = false;
        }
        return z;
    }

    public void deInit() {
        releaseEffectProcessor();
    }

    public Image doFilterSync(@NonNull ParallelTaskData parallelTaskData, @NonNull Image image, @NonNull int i) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        if (shouldApplyEffect(parallelTaskData)) {
            prepareEffectProcessor(dataParameter);
            boolean z = i == 0 && isWatermarkEnabled(parallelTaskData);
            DrawYuvAttribute drawYuvAttribute = getDrawYuvAttribute(image, z, parallelTaskData);
            drawYuvAttribute.mJpegQuality = dataParameter.getJpegQuality();
            drawYuvAttribute.mOutputSize = dataParameter.getOutputSize();
            this.mYuvSnapshotRender.processImageSync(drawYuvAttribute);
            parallelTaskData.setDataOfTheRegionUnderWatermarks(drawYuvAttribute.mDataOfTheRegionUnderWatermarks);
            parallelTaskData.setCoordinatesOfTheRegionUnderWatermarks(drawYuvAttribute.mCoordinatesOfTheRegionUnderWatermarks);
        }
        return image;
    }

    public void init(Size size) {
        releaseEffectProcessor();
        this.mYuvSnapshotRender = new SnapshotRender(size);
        this.mRenderSize = size;
    }
}

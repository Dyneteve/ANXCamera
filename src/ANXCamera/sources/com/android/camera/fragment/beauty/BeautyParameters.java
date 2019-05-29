package com.android.camera.fragment.beauty;

import com.android.camera.CameraSettings;
import com.android.camera.effect.EffectController;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.BeautyProcessor;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Map;

@Deprecated
public class BeautyParameters {
    public static final int BACK_LEVEL_BEAUTY_TAB_ID = 0;
    public static final int BEAUTY_BODY_BEAUTY_TAB_ID = 1;
    public static final int BEAUTY_BODY_TYPE = 5;
    public static final int BEAUTY_FILTER_TYPE = 6;
    public static final int BEAUTY_LIVE_BEAUTY_MODE_TYPE = 7;
    public static final int BEAUTY_MODEL_BEAUTY_TAB_ID = 1;
    public static final int BEAUTY_MODEL_TYPE = 2;
    public static final int EYE_LIGHT_BEAUTY_TAB_ID = 3;
    public static final int EYE_LIGHT_BEAUTY_TYPE = 4;
    public static final int FRON_LEVEL_BEAUTY_TAB_ID = 0;
    public static final int LEVEL_BEAUTY_TYPE = 1;
    public static final int LIVE_BEAUTY_MODE_BEAUTY_TAB_ID = 1;
    public static final int LIVE_FILTER_BEAUTY_TAB_ID = 0;
    public static final int MAKE_UP_BEAUTY_TAB_ID = 2;
    public static final int MAKE_UP_TYPE = 3;
    public static final int SEEKBAR_MAX = 100;
    public static final String TAG = BeautyParameters.class.getSimpleName();
    private static BeautyParameters sInstance;
    private float[][] mCameraLevelParameters = {new float[]{0.0f, 0.0f, 0.0f, 0.0f}, new float[]{1.0f, 1.0f, 1.0f, 1.0f}, new float[]{3.0f, 3.0f, 3.0f, 3.0f}, new float[]{5.0f, 5.0f, 5.0f, 5.0f}, new float[]{7.0f, 7.0f, 7.0f, 7.0f}, new float[]{8.0f, 8.0f, 8.0f, 8.0f}};
    private IntelligentBeautyProcessor mMakeupProcessor;
    private IntelligentBeautyProcessor mStickerMakeupProcessor;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BeautyType {
    }

    private BeautyParameters() {
    }

    public static synchronized BeautyParameters getInstance() {
        BeautyParameters beautyParameters;
        synchronized (BeautyParameters.class) {
            if (sInstance == null) {
                sInstance = new BeautyParameters();
            }
            beautyParameters = sInstance;
        }
        return beautyParameters;
    }

    private Map<BeautyParameterType, Float> getProcessorBeautyParams(IntelligentBeautyProcessor intelligentBeautyProcessor, int i) {
        return intelligentBeautyProcessor.getIntelligentLevelParams(i);
    }

    private void setBeautyParameters() {
        int beautyShowLevel = CameraSettings.getBeautyShowLevel();
        if (EffectController.getInstance().isStickerEnable()) {
            if (this.mStickerMakeupProcessor != null) {
                this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mStickerMakeupProcessor, beautyShowLevel));
            }
        } else if (this.mMakeupProcessor != null) {
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mMakeupProcessor, beautyShowLevel));
        }
    }

    public BeautyProcessor getMakeupProcessor() {
        IntelligentBeautyProcessor intelligentBeautyProcessor;
        synchronized (this) {
            intelligentBeautyProcessor = this.mMakeupProcessor;
        }
        return intelligentBeautyProcessor;
    }

    public BeautyProcessor getStickerMakeupProcessor() {
        IntelligentBeautyProcessor intelligentBeautyProcessor;
        synchronized (this) {
            intelligentBeautyProcessor = this.mStickerMakeupProcessor;
        }
        return intelligentBeautyProcessor;
    }

    public void setMakeupProcessor(IntelligentBeautyProcessor intelligentBeautyProcessor) {
        synchronized (this) {
            int beautyShowLevel = CameraSettings.getBeautyShowLevel();
            this.mMakeupProcessor = intelligentBeautyProcessor;
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(intelligentBeautyProcessor, beautyShowLevel));
        }
    }

    public void setStickerMakeupProcessor(IntelligentBeautyProcessor intelligentBeautyProcessor) {
        synchronized (this) {
            int beautyShowLevel = CameraSettings.getBeautyShowLevel();
            this.mStickerMakeupProcessor = intelligentBeautyProcessor;
            this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(intelligentBeautyProcessor, beautyShowLevel));
        }
    }
}

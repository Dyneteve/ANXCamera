package com.ss.android.vesdk;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import android.view.Surface;
import com.ss.android.medialib.TTRecorder;
import com.ss.android.medialib.TTRecorder.SlamDetectListener;
import com.ss.android.medialib.listener.NativeInitListener;
import com.ss.android.medialib.model.TimeSpeedModel;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.oauth.TEOAuth;
import com.ss.android.utils.StringUtils;
import com.ss.android.vesdk.IRecorder.OnConcatFinishedListener;
import com.ss.android.vesdk.VEListener.VERecorderStateListener;
import com.ss.android.vesdk.keyvaluepair.VEKeyValue;
import com.ss.android.vesdk.runtime.VERecorderResManager;
import com.ss.android.vesdk.runtime.VERuntime;
import java.util.List;

public class TERecorder {
    private VEAudioEncodeSettings mAudioEncodeSettings = null;
    private VEPreviewSettings mPreviewSettings = null;
    private int mRecordCount;
    private IRecorder mRecorder;
    private VERecorderResManager mResManager;
    private VERuntime mVERuntime;
    private VEVideoEncodeSettings mVideoEncodeSettings = null;

    public TERecorder(@NonNull String str, @NonNull Context context) {
        if (TextUtils.isEmpty(str)) {
            throw new VEException(-100, "workSpace is null");
        } else if (context != null) {
            this.mResManager = new VERecorderResManager(str);
            this.mVERuntime = VERuntime.getInstance();
            this.mVERuntime.init(context, str);
            this.mRecorder = new RecordV1(context);
        } else {
            throw new NullPointerException("context could not be null");
        }
    }

    public static synchronized void addSlamDetectListener(SlamDetectListener slamDetectListener) {
        synchronized (TERecorder.class) {
            TTRecorder.addSlamDetectListener(slamDetectListener);
        }
    }

    public static synchronized void clearSlamDetectListener() {
        synchronized (TERecorder.class) {
            TTRecorder.clearSlamDetectListener();
        }
    }

    public static synchronized void removeSlamDetectListener(SlamDetectListener slamDetectListener) {
        synchronized (TERecorder.class) {
            TTRecorder.removeSlamDetectListener(slamDetectListener);
        }
    }

    public void chooseSlamFace(int i) {
        this.mRecorder.chooseSlamFace(i);
    }

    public void clearEnv() {
        this.mRecorder.clearEnv();
    }

    @WorkerThread
    public String[] concat() throws VEException {
        this.mResManager.genConcatSegmentVideoPath();
        this.mResManager.genConcatSegmentAudioPath();
        String concatSegmentVideoPath = this.mResManager.getConcatSegmentVideoPath();
        String concatSegmentAudioPath = this.mResManager.getConcatSegmentAudioPath();
        int concat = this.mRecorder.concat(concatSegmentVideoPath, concatSegmentAudioPath);
        if (concat >= 0) {
            return new String[]{concatSegmentVideoPath, concatSegmentAudioPath};
        }
        StringBuilder sb = new StringBuilder();
        sb.append("concat failed: ");
        sb.append(concat);
        throw new VEException(-1, sb.toString());
    }

    public void concatAsync(String str, String str2, OnConcatFinishedListener onConcatFinishedListener) {
        this.mRecorder.concatAsync(str, str2, onConcatFinishedListener);
    }

    public void deleteLastFrag() {
        this.mRecorder.deleteLastFrag();
    }

    public void destroy() {
        this.mRecorder.destroy();
        this.mRecorder = null;
    }

    public int enableTTFaceDetect(boolean z) {
        return this.mRecorder.enableTTFaceDetect(z);
    }

    public long getEndFrameTime() {
        return this.mRecorder.getEndFrameTime();
    }

    public List<TimeSpeedModel> getSegmentInfo() {
        return this.mRecorder.getSegmentInfo();
    }

    public int getSlamFaceCount() {
        return this.mRecorder.getSlamFaceCount();
    }

    public int init(@NonNull VEVideoEncodeSettings vEVideoEncodeSettings, @NonNull VEAudioEncodeSettings vEAudioEncodeSettings, @NonNull VEPreviewSettings vEPreviewSettings) throws VEException {
        this.mVideoEncodeSettings = vEVideoEncodeSettings;
        this.mAudioEncodeSettings = vEAudioEncodeSettings;
        this.mPreviewSettings = vEPreviewSettings;
        return !TEOAuth.isPermitted() ? VEResult.TER_OAUTH_FAIL : this.mRecorder.init(vEVideoEncodeSettings, vEAudioEncodeSettings, vEPreviewSettings, this.mVERuntime.getEnv().getDetectModelsDir(), this.mResManager.getSegmentDirPath());
    }

    public int pauseEffectAudio(boolean z) {
        return this.mRecorder.pauseEffectAudio(z);
    }

    public int processTouchEvent(float f, float f2) {
        return this.mRecorder.processTouchEvent(f, f2);
    }

    public int setBeautyFace(int i, String str) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_verecorder_set_beauty_algorithm", i).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_beauty_algorithm", 1, vEKeyValue);
        return this.mRecorder.setBeautyFace(i, str);
    }

    public int setBeautyFaceIntensity(float f, float f2) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_verecorder_set_beauty_level", f).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_beauty_level", 1, vEKeyValue);
        return this.mRecorder.setBeautyFaceIntensity(f, f2);
    }

    public int setDeviceRotation(float[] fArr) {
        return this.mRecorder.setDeviceRotation(fArr);
    }

    public int setFaceReshape(String str, float f, float f2) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_verecorder_set_bigeyes_smallface_level", f).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_bigeyes_smallface", 1, vEKeyValue);
        return this.mRecorder.setFaceReshape(str, f, f2);
    }

    public int setFilter(String str, float f) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_verecorder_set_filter_click_idfilter_id", StringUtils.parsePathSimpleName(str)).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_filter_click", 1, vEKeyValue);
        return this.mRecorder.setFilter(str, f);
    }

    public int setFilter(String str, String str2, float f) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        vEKeyValue.add("iesve_verecorder_set_filter_slide_left_id", StringUtils.parsePathSimpleName(str)).add("iesve_verecorder_set_filter_slide_right_id", StringUtils.parsePathSimpleName(str2)).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_filter_slide", 1, vEKeyValue);
        return this.mRecorder.setFilter(str, str2, f);
    }

    @Deprecated
    public void setNativeInitListener(NativeInitListener nativeInitListener) {
        this.mRecorder.setNativeInitListener(nativeInitListener);
    }

    public int setRecordBGM(String str, int i, int i2, int i3) {
        return this.mRecorder.setRecordBGM(str, i, i2, i3);
    }

    public void setRecrodStateCallback(VERecorderStateListener vERecorderStateListener) {
        this.mRecorder.setRecordStateCallback(vERecorderStateListener);
    }

    public void setRenderCallback(IRenderCallback iRenderCallback) {
        this.mRecorder.setRenderCallback(iRenderCallback);
    }

    public int setSlamFace(Bitmap bitmap) {
        return this.mRecorder.setSlamFace(bitmap);
    }

    public int setUseLargeMattingModel(boolean z) {
        return this.mRecorder.setUseLargeMattingModel(z);
    }

    public int slamDeviceConfig(boolean z, int i, boolean z2, boolean z3, boolean z4, boolean z5, String str) {
        return this.mRecorder.slamDeviceConfig(z, i, z2, z3, z4, z5, str);
    }

    public int slamProcessIngestAcc(double d, double d2, double d3, double d4) {
        return this.mRecorder.slamProcessIngestAcc(d, d2, d3, d4);
    }

    public int slamProcessIngestGra(double d, double d2, double d3, double d4) {
        return this.mRecorder.slamProcessIngestGra(d, d2, d3, d4);
    }

    public int slamProcessIngestGyr(double d, double d2, double d3, double d4) {
        return this.mRecorder.slamProcessIngestGyr(d, d2, d3, d4);
    }

    public int slamProcessIngestOri(double[] dArr, double d) {
        return this.mRecorder.slamProcessIngestOri(dArr, d);
    }

    public int slamProcessPanEvent(float f, float f2, float f3, float f4, float f5) {
        return this.mRecorder.slamProcessPanEvent(f, f2, f3, f4, f5);
    }

    public int slamProcessRotationEvent(float f, float f2) {
        return this.mRecorder.slamProcessRotationEvent(f, f2);
    }

    public int slamProcessScaleEvent(float f, float f2) {
        return this.mRecorder.slamProcessScaleEvent(f, f2);
    }

    public int slamProcessTouchEvent(float f, float f2) {
        return this.mRecorder.slamProcessTouchEvent(f, f2);
    }

    public int slamProcessTouchEventByType(int i, float f, float f2, int i2) {
        return this.mRecorder.slamProcessTouchEventByType(i, f, f2, i2);
    }

    public int startPreview(Surface surface) {
        return this.mRecorder.startPreview(surface);
    }

    public int startRecord(float f) {
        String genSegmentVideoPath = this.mResManager.genSegmentVideoPath(this.mRecordCount);
        String genSegmentAudioPath = this.mResManager.genSegmentAudioPath(this.mRecordCount);
        this.mRecordCount++;
        this.mResManager.addSegmentAudioPath(genSegmentAudioPath);
        this.mResManager.addSegmentVideoPath(genSegmentVideoPath);
        return this.mRecorder.startRecord(genSegmentVideoPath, genSegmentAudioPath, f);
    }

    public int stopPreview() {
        return this.mRecorder.stopPreview();
    }

    public int stopRecord() {
        return this.mRecorder.stopRecord();
    }

    public int switchEffect(String str) {
        VEKeyValue vEKeyValue = new VEKeyValue();
        String parsePathSimpleName = StringUtils.parsePathSimpleName(str);
        String str2 = "iesve_verecorder_set_sticker_id";
        if (TextUtils.isEmpty(parsePathSimpleName)) {
            parsePathSimpleName = "0";
        }
        vEKeyValue.add(str2, parsePathSimpleName).add("old", 0);
        MonitorUtils.monitorStatistics("iesve_verecorder_set_sticker", 1, vEKeyValue);
        return this.mRecorder.switchEffect(str);
    }

    public int tryRestore() {
        return this.mRecorder.tryRestore();
    }

    public void updatePreviewSettings(VEPreviewSettings vEPreviewSettings) {
        this.mPreviewSettings = vEPreviewSettings;
        this.mRecorder.updatePreviewSettings(vEPreviewSettings);
    }

    public int updateRotation(float f, float f2, float f3) {
        return this.mRecorder.updateRotation(f, f2, f3);
    }
}

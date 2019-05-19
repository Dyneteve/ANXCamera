package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.Face;
import com.android.camera.CameraSettings;
import com.android.camera.log.Log;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;

public class FunctionParseAiScene implements Function<CaptureResult, Integer> {
    private static final String TAG = "FunctionParseAiScene";
    private int mCurrentFaceScene;
    private int mLatestFaceScene;
    private int mModuleIndex;
    private int mParsedAiScene;
    private int mSameFaceSceneDetectedTimes;

    public FunctionParseAiScene(int i) {
        this.mModuleIndex = i;
    }

    private boolean faceSceneFiltering(int i) {
        if (this.mLatestFaceScene != i) {
            this.mLatestFaceScene = i;
            this.mSameFaceSceneDetectedTimes = 0;
        } else if (this.mSameFaceSceneDetectedTimes < 20) {
            this.mSameFaceSceneDetectedTimes++;
            if (20 == this.mSameFaceSceneDetectedTimes && this.mCurrentFaceScene != this.mLatestFaceScene) {
                this.mLatestFaceScene = this.mCurrentFaceScene;
                this.mCurrentFaceScene = this.mLatestFaceScene;
                return true;
            }
        }
        return false;
    }

    public Integer apply(CaptureResult captureResult) {
        int i;
        Face[] faceArr = (Face[]) captureResult.get(CaptureResult.STATISTICS_FACES);
        if (this.mModuleIndex == 171 || CameraSettings.isFrontCamera() || faceArr == null || faceArr.length <= 0) {
            i = Integer.MIN_VALUE;
        } else {
            i = Integer.MIN_VALUE;
            for (Face face : faceArr) {
                if (face.getBounds().width() > 300) {
                    int hDRDetectedScene = CaptureResultParser.getHDRDetectedScene(captureResult);
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("parseAiSceneResult: AI_SCENE_MODE_HUMAN  face.length = ");
                    sb.append(faceArr.length);
                    sb.append(";face.width = ");
                    sb.append(face.getBounds().width());
                    sb.append(";hdrMode = ");
                    sb.append(hDRDetectedScene);
                    Log.c(str, sb.toString());
                    i = hDRDetectedScene == 1 ? -1 : 25;
                }
            }
        }
        if (faceSceneFiltering(i)) {
            if (i == Integer.MIN_VALUE) {
                int asdDetectedModes = CaptureResultParser.getAsdDetectedModes(captureResult);
                if (asdDetectedModes < 0) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("parseAiSceneResult: parse a error result: ");
                    sb2.append(asdDetectedModes);
                    Log.e(str2, sb2.toString());
                    this.mParsedAiScene = 0;
                } else {
                    this.mParsedAiScene = asdDetectedModes;
                }
            } else {
                this.mParsedAiScene = i;
            }
        }
        return Integer.valueOf(this.mParsedAiScene);
    }

    public void resetScene() {
        this.mLatestFaceScene = 0;
        this.mParsedAiScene = 0;
    }
}

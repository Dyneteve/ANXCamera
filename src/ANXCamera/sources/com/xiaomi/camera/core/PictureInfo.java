package com.xiaomi.camera.core;

import com.android.camera.log.Log;
import org.json.JSONException;
import org.json.JSONObject;

public class PictureInfo {
    private static final String MIRROR = "mirror";
    private static final String SENSOR_TYPE = "sensor_type";
    private static final String SENSOR_TYPE_FRONT = "front";
    private static final String SENSOR_TYPE_REAR = "rear";
    private static final String TAG = PictureInfo.class.getSimpleName();
    private boolean aiEnabled;
    private int aiType;
    private boolean isBokehFrontCamera;
    private boolean isMirror;
    private transient JSONObject mInfo = new JSONObject();
    private String mInfoString;
    private String mSensorType = SENSOR_TYPE_REAR;

    public void end() {
        this.mInfoString = this.mInfo.toString();
        this.mInfo = null;
    }

    public int getAiType() {
        return this.aiType;
    }

    public String getInfoString() {
        return this.mInfoString;
    }

    public boolean isAiEnabled() {
        return this.aiEnabled;
    }

    public boolean isBokehFrontCamera() {
        return this.isBokehFrontCamera;
    }

    public boolean isFrontCamera() {
        return this.mSensorType == SENSOR_TYPE_FRONT;
    }

    public boolean isFrontMirror() {
        return this.isMirror;
    }

    public PictureInfo setAiEnabled(boolean z) {
        this.aiEnabled = z;
        return this;
    }

    public PictureInfo setAiType(int i) {
        this.aiType = i;
        return this;
    }

    public PictureInfo setBokehFrontCamera(boolean z) {
        this.isBokehFrontCamera = z;
        return this;
    }

    public PictureInfo setFrontMirror(boolean z) {
        this.isMirror = z;
        try {
            this.mInfo.put(MIRROR, z);
        } catch (JSONException e) {
            Log.e(TAG, "setFrontMirror JSONException occurs ", e);
        }
        return this;
    }

    public PictureInfo setSensorType(boolean z) {
        this.mSensorType = z ? SENSOR_TYPE_FRONT : SENSOR_TYPE_REAR;
        try {
            this.mInfo.put(SENSOR_TYPE, this.mSensorType);
        } catch (JSONException e) {
            Log.e(TAG, "setSensorType JSONException occurs ", e);
        }
        return this;
    }
}

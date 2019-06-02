package com.xiaomi.camera.core;

import com.android.camera.log.Log;
import org.json.JSONException;
import org.json.JSONObject;

public class PictureInfo {
    private static final String AISCENE = "AIScene";
    private static final String BABY = "Baby";
    private static final String BEAUTY_LEVEL = "BeautyLevel";
    private static final String FEMALE = "Female";
    private static final String HDR_TYPE = "Hdr";
    private static final String MALE = "Male";
    private static final float MAX_BABY_AGE = 6.0f;
    private static final float MAX_GENDER_FEMALE = 0.4f;
    private static final float MIN_BABY_AGE = 0.0f;
    private static final float MIN_GENDER_MALE = 0.6f;
    private static final String MIRROR = "mirror";
    private static final String NIGHTSCENE = "NightScene";
    private static final String OPMODE = "OpMode";
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

    public PictureInfo setAIScene(int i) {
        try {
            this.mInfo.put(AISCENE, i);
        } catch (JSONException e) {
            Log.e(TAG, "setAIScene JSONException occurs ", e);
        }
        return this;
    }

    public PictureInfo setAiEnabled(boolean z) {
        this.aiEnabled = z;
        return this;
    }

    public PictureInfo setAiType(int i) {
        this.aiType = i;
        return this;
    }

    public PictureInfo setBaby(float[] fArr) {
        if (fArr != null && fArr.length > 0) {
            float f = fArr[0];
            if (f > 0.0f && f <= 6.0f) {
                try {
                    this.mInfo.put(BABY, (double) f);
                } catch (JSONException e) {
                    Log.e(TAG, "setBaby JSONException occurs ", e);
                }
            }
        }
        return this;
    }

    public PictureInfo setBeautyLevel(String str) {
        try {
            this.mInfo.put(BEAUTY_LEVEL, str);
        } catch (JSONException e) {
            Log.e(TAG, "setBeautyLevel JSONException occurs ", e);
        }
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

    public PictureInfo setGender(float[] fArr) {
        int i;
        if (fArr != null) {
            try {
                i = fArr.length;
            } catch (JSONException e) {
                Log.e(TAG, "setGender JSONException occurs ", e);
            }
        } else {
            i = 0;
        }
        int i2 = 0;
        int i3 = 0;
        for (int i4 = 0; i4 < i; i4++) {
            if (fArr[i4] >= 0.6f) {
                i2++;
            }
            if (fArr[i4] <= 0.4f) {
                i3++;
            }
        }
        this.mInfo.put(MALE, i2);
        this.mInfo.put(FEMALE, i3);
        return this;
    }

    public PictureInfo setHdrType(String str) {
        try {
            this.mInfo.put(HDR_TYPE, str);
        } catch (JSONException e) {
            Log.e(TAG, "setHdrType JSONException occurs ", e);
        }
        return this;
    }

    public PictureInfo setNightScene(int i) {
        try {
            this.mInfo.put(NIGHTSCENE, i);
        } catch (JSONException e) {
            Log.e(TAG, "setNightScene JSONException occurs ", e);
        }
        return this;
    }

    public PictureInfo setOpMode(int i) {
        try {
            this.mInfo.put(OPMODE, i);
        } catch (JSONException e) {
            Log.e(TAG, "setOpMode JSONException occurs ", e);
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

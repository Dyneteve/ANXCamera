package com.android.camera.data.data.extra;

import com.android.camera.CameraSettings;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.module.impl.component.MimojiStatusManager;

public class DataItemLive extends DataItemBase {
    public static final String DATA_LIVE_ACTIVATION = "live_activation";
    public static final String DATA_LIVE_START_ORIENTATION = "live_start_orientation";
    private static final String KEY = "camera_settings_live";
    private MimojiStatusManager mMimojiStatusManager;

    public String getActivation() {
        return getString(DATA_LIVE_ACTIVATION, "");
    }

    public int getLiveFilter() {
        return getInt(CameraSettings.KEY_LIVE_FILTER, 0);
    }

    public int getLiveStartOrientation() {
        return getInt(DATA_LIVE_START_ORIENTATION, 0);
    }

    public MimojiStatusManager getMimojiStatusManager() {
        if (this.mMimojiStatusManager == null) {
            this.mMimojiStatusManager = new MimojiStatusManager();
        }
        return this.mMimojiStatusManager;
    }

    public boolean isTransient() {
        return false;
    }

    public String provideKey() {
        return KEY;
    }

    public void setActivation(String str) {
        editor().putString(DATA_LIVE_ACTIVATION, str).apply();
    }

    public void setLiveFilter(int i) {
        putInt(CameraSettings.KEY_LIVE_FILTER, i);
    }

    public void setLiveStartOrientation(int i) {
        putInt(DATA_LIVE_START_ORIENTATION, i);
    }
}

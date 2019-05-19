package com.android.camera.data.data.runing;

import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.List;

public class ComponentRunningLiveShot extends ComponentData {
    private static final String TAG = ComponentRunningLiveShot.class.getSimpleName();
    private boolean mIsClosed;

    public ComponentRunningLiveShot(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public String getDefaultValue(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(TAG);
        sb.append("#getDefaultValue() not supported");
        throw new UnsupportedOperationException(sb.toString());
    }

    public int getDisplayTitleString() {
        StringBuilder sb = new StringBuilder();
        sb.append(TAG);
        sb.append("#getDisplayTitleString() not supported");
        throw new UnsupportedOperationException(sb.toString());
    }

    public List<ComponentDataItem> getItems() {
        StringBuilder sb = new StringBuilder();
        sb.append(TAG);
        sb.append("#getItems() not supported");
        throw new UnsupportedOperationException(sb.toString());
    }

    public String getKey(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(TAG);
        sb.append("#getKey() not supported");
        throw new UnsupportedOperationException(sb.toString());
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean isLiveShotOn() {
        if (isClosed()) {
            return false;
        }
        return this.mParentDataItem.getBoolean("pref_live_shot_enabled", false);
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public void setLiveShotOn(boolean z) {
        setClosed(false);
        this.mParentDataItem.putBoolean("pref_live_shot_enabled", z);
    }
}

package com.android.camera.data.cloud;

public class DataCloudItemConfig extends DataCloudItemBase {
    public static final String KEY = "cloud_item_";
    private int mCameraId;

    public DataCloudItemConfig(int i) {
        this.mCameraId = i;
    }

    public String provideKey() {
        StringBuilder sb = new StringBuilder();
        sb.append(KEY);
        sb.append(this.mCameraId);
        return sb.toString();
    }
}

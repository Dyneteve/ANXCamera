package com.android.camera.data.cloud;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.data.cloud.DataCloud.CloudItem;

public abstract class DataCloudItemBase implements CloudItem {
    private Editor mEditor;
    private SharedPreferences mPreferences;
    private boolean mReady;
    private SimpleArrayMap<String, Object> mValues = new SimpleArrayMap<>();

    private SharedPreferences getSharedPreferences() {
        if (this.mPreferences == null) {
            initPreferences();
        }
        return this.mPreferences;
    }

    private void initPreferences() {
        this.mPreferences = CameraAppImpl.getAndroidContext().getSharedPreferences(provideKey(), 0);
    }

    public Editor editor() {
        this.mEditor = getSharedPreferences().edit();
        return this.mEditor;
    }

    public boolean getCloudBooleanDefault(String str, boolean z) {
        if (!this.mReady) {
            return z;
        }
        Boolean bool = (Boolean) this.mValues.get(str);
        if (bool == null) {
            bool = Boolean.valueOf(getSharedPreferences().getBoolean(str, z));
        }
        if (bool != null) {
            z = bool.booleanValue();
        }
        return z;
    }

    public float getCloudFloatDefault(String str, float f) {
        if (!this.mReady) {
            return f;
        }
        Float f2 = (Float) this.mValues.get(str);
        if (f2 == null) {
            f2 = Float.valueOf(getSharedPreferences().getFloat(str, f));
        }
        if (f2 != null) {
            f = f2.floatValue();
        }
        return f;
    }

    public int getCloudIntDefault(String str, int i) {
        if (!this.mReady) {
            return i;
        }
        Integer num = (Integer) this.mValues.get(str);
        if (num == null) {
            num = Integer.valueOf(getSharedPreferences().getInt(str, i));
        }
        if (num != null) {
            i = num.intValue();
        }
        return i;
    }

    public long getCloudLongDefault(String str, long j) {
        if (!this.mReady) {
            return j;
        }
        Long l = (Long) this.mValues.get(str);
        if (l == null) {
            l = Long.valueOf(getSharedPreferences().getLong(str, j));
        }
        if (l != null) {
            j = l.longValue();
        }
        return j;
    }

    public String getCloudStringDefault(String str, String str2) {
        if (!this.mReady) {
            return str2;
        }
        String str3 = (String) this.mValues.get(str);
        String string = str3 == null ? getSharedPreferences().getString(str, str2) : str3;
        if (string == null) {
            string = str2;
        }
        return string;
    }

    public void setReady(boolean z) {
        this.mReady = z;
    }
}

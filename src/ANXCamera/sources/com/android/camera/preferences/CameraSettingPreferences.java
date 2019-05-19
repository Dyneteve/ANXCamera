package com.android.camera.preferences;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import java.util.Map;
import java.util.Set;

public class CameraSettingPreferences implements SharedPreferences {
    public static final String FILE_NAME_GLOBAL = "camera_settings_global";
    public static final String FILE_NAME_PREFIX_SIMPLE_MODE_LOCAL = "camera_settings_simple_mode_local_";
    public static final String FILE_NAME_SIMPLE_MODE_GLOBAL = "camera_settings_simple_mode_global";
    private static CameraSettingPreferences sPreferences = new CameraSettingPreferences();

    private class MyEditor implements Editor {
        private ProviderEditor mEditorConfig = DataRepository.dataItemConfig().editor();
        private ProviderEditor mEditorGlobal = DataRepository.dataItemGlobal().editor();
        private ProviderEditor mEditorRunning = DataRepository.dataItemRunning().editor();

        MyEditor() {
        }

        public void apply() {
            this.mEditorGlobal.apply();
            this.mEditorConfig.apply();
        }

        public Editor clear() {
            this.mEditorGlobal.clear();
            this.mEditorConfig.clear();
            this.mEditorRunning.clear();
            return this;
        }

        public boolean commit() {
            return this.mEditorGlobal.commit() && this.mEditorConfig.commit();
        }

        public Editor putBoolean(String str, boolean z) {
            if (CameraSettings.isCameraSpecific(str)) {
                this.mEditorConfig.putBoolean(str, z);
            } else if (CameraSettings.isTransient(str)) {
                this.mEditorRunning.putBoolean(str, z);
            } else {
                this.mEditorGlobal.putBoolean(str, z);
            }
            return this;
        }

        public Editor putFloat(String str, float f) {
            if (CameraSettings.isCameraSpecific(str)) {
                this.mEditorConfig.putFloat(str, f);
            } else if (CameraSettings.isTransient(str)) {
                this.mEditorRunning.putFloat(str, f);
            } else {
                this.mEditorGlobal.putFloat(str, f);
            }
            return this;
        }

        public Editor putInt(String str, int i) {
            if (CameraSettings.isCameraSpecific(str)) {
                this.mEditorConfig.putInt(str, i);
            } else if (CameraSettings.isTransient(str)) {
                this.mEditorRunning.putInt(str, i);
            } else {
                this.mEditorGlobal.putInt(str, i);
            }
            return this;
        }

        public Editor putLong(String str, long j) {
            if (CameraSettings.isCameraSpecific(str)) {
                this.mEditorConfig.putLong(str, j);
            } else if (CameraSettings.isTransient(str)) {
                this.mEditorRunning.putLong(str, j);
            } else {
                this.mEditorGlobal.putLong(str, j);
            }
            return this;
        }

        public Editor putString(String str, String str2) {
            if (CameraSettings.isCameraSpecific(str)) {
                this.mEditorConfig.putString(str, str2);
            } else if (CameraSettings.isTransient(str)) {
                this.mEditorRunning.putString(str, str2);
            } else {
                this.mEditorGlobal.putString(str, str2);
            }
            return this;
        }

        public Editor putStringSet(String str, Set<String> set) {
            throw new UnsupportedOperationException();
        }

        public Editor remove(String str) {
            this.mEditorGlobal.remove(str);
            this.mEditorConfig.remove(str);
            this.mEditorRunning.remove(str);
            return this;
        }
    }

    private CameraSettingPreferences() {
    }

    public static synchronized CameraSettingPreferences instance() {
        CameraSettingPreferences cameraSettingPreferences;
        synchronized (CameraSettingPreferences.class) {
            cameraSettingPreferences = sPreferences;
        }
        return cameraSettingPreferences;
    }

    public boolean contains(String str) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().contains(str) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().contains(str) : DataRepository.dataItemGlobal().contains(str);
    }

    public Editor edit() {
        return new MyEditor();
    }

    public Map<String, ?> getAll() {
        return null;
    }

    public boolean getBoolean(String str, boolean z) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().getBoolean(str, z) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().getBoolean(str, z) : DataRepository.dataItemGlobal().getBoolean(str, z);
    }

    public float getFloat(String str, float f) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().getFloat(str, f) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().getFloat(str, f) : DataRepository.dataItemGlobal().getFloat(str, f);
    }

    public int getInt(String str, int i) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().getInt(str, i) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().getInt(str, i) : DataRepository.dataItemGlobal().getInt(str, i);
    }

    public long getLong(String str, long j) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().getLong(str, j) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().getLong(str, j) : DataRepository.dataItemGlobal().getLong(str, j);
    }

    public String getString(String str, String str2) {
        return CameraSettings.isCameraSpecific(str) ? DataRepository.dataItemConfig().getString(str, str2) : CameraSettings.isTransient(str) ? DataRepository.dataItemRunning().getString(str, str2) : DataRepository.dataItemGlobal().getString(str, str2);
    }

    public Set<String> getStringSet(String str, Set<String> set) {
        throw new UnsupportedOperationException();
    }

    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
    }

    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
    }
}

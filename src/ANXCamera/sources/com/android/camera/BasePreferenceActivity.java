package com.android.camera;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceGroup;
import com.android.camera.log.Log;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.PreviewListPreference;
import com.mi.config.b;
import java.util.List;
import miui.preference.PreferenceActivity;

public abstract class BasePreferenceActivity extends PreferenceActivity implements OnPreferenceChangeListener, OnPreferenceClickListener {
    private static final String TAG = BasePreferenceActivity.class.getSimpleName();
    protected CameraSettingPreferences mPreferences;

    /* access modifiers changed from: protected */
    public boolean addPreference(PreferenceGroup preferenceGroup, String str, Preference preference) {
        Preference findPreference = preferenceGroup.findPreference(str);
        if (!(findPreference instanceof PreferenceGroup)) {
            return false;
        }
        ((PreferenceGroup) findPreference).addPreference(preference);
        return true;
    }

    public void changeRequestOrientation() {
        if (b.ja()) {
            if (CameraSettings.isFrontCamera()) {
                setRequestedOrientation(7);
            } else {
                setRequestedOrientation(1);
            }
        }
    }

    public void filterUnsupportedOptions(PreferenceGroup preferenceGroup, PreviewListPreference previewListPreference, List<String> list) {
        if (list == null || list.size() <= 1) {
            removePreference(preferenceGroup, previewListPreference.getKey());
            return;
        }
        previewListPreference.filterUnsupported(list);
        if (previewListPreference.getEntries().length <= 1) {
            removePreference(preferenceGroup, previewListPreference.getKey());
        } else {
            resetIfInvalid(previewListPreference);
        }
    }

    /* access modifiers changed from: protected */
    public abstract int getPreferenceXml();

    /* JADX WARNING: type inference failed for: r0v0, types: [android.content.Context, miui.preference.PreferenceActivity, com.android.camera.BasePreferenceActivity] */
    public void onCreate(Bundle bundle) {
        BasePreferenceActivity.super.onCreate(bundle);
        Util.updateDeviceConfig(this);
        this.mPreferences = CameraSettingPreferences.instance();
        changeRequestOrientation();
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        onSettingChanged(1);
        Editor edit = this.mPreferences.edit();
        String key = preference.getKey();
        if (obj instanceof String) {
            edit.putString(key, (String) obj);
        } else if (obj instanceof Boolean) {
            edit.putBoolean(key, ((Boolean) obj).booleanValue());
        } else if (obj instanceof Integer) {
            edit.putInt(key, ((Integer) obj).intValue());
        } else if (obj instanceof Long) {
            edit.putLong(key, ((Long) obj).longValue());
        } else if (obj instanceof Float) {
            edit.putFloat(key, ((Float) obj).floatValue());
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("unhandled new value with type=");
            sb.append(obj.getClass().getName());
            throw new IllegalStateException(sb.toString());
        }
        edit.apply();
        CameraStatUtil.trackPreferenceChange(preference.getKey(), obj);
        updateConflictPreference(preference);
        return true;
    }

    /* access modifiers changed from: protected */
    public void onSettingChanged(int i) {
        CameraSettings.sCameraChangeManager.request(i);
    }

    /* access modifiers changed from: protected */
    public void registerListener(PreferenceGroup preferenceGroup, OnPreferenceChangeListener onPreferenceChangeListener) {
        int preferenceCount = preferenceGroup.getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = preferenceGroup.getPreference(i);
            if (preference instanceof PreferenceGroup) {
                registerListener((PreferenceGroup) preference, onPreferenceChangeListener);
            } else {
                preference.setOnPreferenceChangeListener(onPreferenceChangeListener);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void removeFromGroup(Preference preference, String str) {
        if (preference != null && (preference instanceof PreferenceGroup)) {
            PreferenceGroup preferenceGroup = (PreferenceGroup) preference;
            if (preferenceGroup.getPreferenceCount() > 0) {
                removePreference(preferenceGroup, str);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean removePreference(PreferenceGroup preferenceGroup, String str) {
        Preference findPreference = preferenceGroup.findPreference(str);
        if (findPreference != null && preferenceGroup.removePreference(findPreference)) {
            return true;
        }
        int preferenceCount = preferenceGroup.getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = preferenceGroup.getPreference(i);
            if ((preference instanceof PreferenceGroup) && removePreference((PreferenceGroup) preference, str)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void resetIfInvalid(ListPreference listPreference) {
        if (listPreference.findIndexOfValue(listPreference.getValue()) == -1) {
            listPreference.setValueIndex(0);
        }
    }

    /* access modifiers changed from: protected */
    public abstract void updateConflictPreference(Preference preference);

    public void updatePreferences(PreferenceGroup preferenceGroup, SharedPreferences sharedPreferences) {
        if (preferenceGroup != null) {
            int preferenceCount = preferenceGroup.getPreferenceCount();
            for (int i = 0; i < preferenceCount; i++) {
                Preference preference = preferenceGroup.getPreference(i);
                if (preference instanceof CheckBoxPreference) {
                    CheckBoxPreference checkBoxPreference = (CheckBoxPreference) preference;
                    checkBoxPreference.setChecked(sharedPreferences.getBoolean(checkBoxPreference.getKey(), checkBoxPreference.isChecked()));
                    preference.setPersistent(false);
                } else if (preference instanceof PreferenceGroup) {
                    updatePreferences((PreferenceGroup) preference, sharedPreferences);
                } else {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("no need update preference for ");
                    sb.append(preference.getKey());
                    Log.v(str, sb.toString());
                }
            }
        }
    }
}

package com.android.camera.preferences;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Iterator;

public class PreferenceGroup extends CameraPreference {
    private ArrayList<CameraPreference> list = new ArrayList<>();

    public PreferenceGroup(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void addChild(CameraPreference cameraPreference) {
        this.list.add(cameraPreference);
    }

    public ListPreference findPreference(String str) {
        Iterator it = this.list.iterator();
        while (it.hasNext()) {
            CameraPreference cameraPreference = (CameraPreference) it.next();
            if (cameraPreference instanceof ListPreference) {
                ListPreference listPreference = (ListPreference) cameraPreference;
                if (listPreference.getKey().equals(str)) {
                    return listPreference;
                }
            } else if (cameraPreference instanceof PreferenceGroup) {
                ListPreference findPreference = ((PreferenceGroup) cameraPreference).findPreference(str);
                if (findPreference != null) {
                    return findPreference;
                }
            } else {
                continue;
            }
        }
        return null;
    }

    public CameraPreference get(int i) {
        return (CameraPreference) this.list.get(i);
    }

    public void removePreference(int i) {
        this.list.remove(i);
    }

    public int size() {
        return this.list.size();
    }
}

package com.android.camera.data.data.runing;

import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningSceneValue extends ComponentData {
    public ComponentRunningSceneValue(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_auto_normal, R.drawable.ic_scene_mode_auto_normal, R.string.pref_camera_scenemode_entry_auto, "0"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_portrait_normal, R.drawable.ic_scene_mode_portrait_normal, R.string.pref_camera_scenemode_entry_portrait, "3"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_landscape_normal, R.drawable.ic_scene_mode_landscape_normal, R.string.pref_camera_scenemode_entry_landscape, "4"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sports_normal, R.drawable.ic_scene_mode_sports_normal, R.string.pref_camera_scenemode_entry_sports, "13"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_normal, R.drawable.ic_scene_mode_night_normal, R.string.pref_camera_scenemode_entry_night, "5"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_night_portrait_normal, R.drawable.ic_scene_mode_night_portrait_normal, R.string.pref_camera_scenemode_entry_night_portrait, "6"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_beach_normal, R.drawable.ic_scene_mode_beach_normal, R.string.pref_camera_scenemode_entry_beach, "8"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_snow_normal, R.drawable.ic_scene_mode_snow_normal, R.string.pref_camera_scenemode_entry_snow, "9"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_sunset_normal, R.drawable.ic_scene_mode_sunset_normal, R.string.pref_camera_scenemode_entry_sunset, "10"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_scene_mode_fireworks_normal, R.drawable.ic_scene_mode_fireworks_normal, R.string.pref_camera_scenemode_entry_fireworks, "12"));
        return arrayList;
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_scenemode_title;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_scenemode_key";
    }
}

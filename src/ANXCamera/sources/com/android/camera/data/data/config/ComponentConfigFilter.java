package com.android.camera.data.data.config;

import android.util.SparseBooleanArray;
import com.android.camera.R;
import com.android.camera.constant.ModeConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ComponentConfigFilter extends ComponentData {
    private SparseBooleanArray mIsClosed;

    public ComponentConfigFilter(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public void clearFilterSelected(ProviderEditor providerEditor) {
        int[] allModes;
        if (providerEditor != null) {
            for (int i : ModeConstant.getAllModes()) {
                providerEditor.putString(getKey(i), getDefaultValue(i));
            }
        }
    }

    public String getComponentValue(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("getComponentValue: isClosed(mode) = ");
        sb.append(isClosed(i));
        sb.append(", mode = ");
        sb.append(i);
        Log.d("ComponentConfigFilter", sb.toString());
        return isClosed(i) ? String.valueOf(FilterInfo.FILTER_ID_NONE) : super.getComponentValue(i);
    }

    public String getDefaultValue(int i) {
        return String.valueOf(FilterInfo.FILTER_ID_NONE);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_coloreffect_title;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_shader_coloreffect_key";
    }

    public boolean isClosed(int i) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        return this.mIsClosed.get(i);
    }

    public void mapToItems(ArrayList<FilterInfo> arrayList) {
        this.mItems = new ArrayList(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            FilterInfo filterInfo = (FilterInfo) it.next();
            this.mItems.add(new ComponentDataItem(filterInfo.getIconResId(), filterInfo.getIconResId(), filterInfo.getNameResId(), String.valueOf(filterInfo.getId())));
        }
    }

    public void setClosed(boolean z, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("setClosed: mode = ");
        sb.append(i);
        sb.append(", close = ");
        sb.append(z);
        Log.d("ComponentConfigFilter", sb.toString());
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(i, z);
    }
}

package com.android.camera.data.data;

import android.support.annotation.NonNull;
import java.util.List;

public class ComponentMultiple extends ComponentData {
    private TypeElements typeElements;

    public <D extends DataItemBase> ComponentMultiple(D d) {
        super(d);
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public String getKey(int i) {
        return null;
    }

    public <T> T getValue(TypeItem<T> typeItem) {
        return null;
    }

    public <T> void putValue(TypeItem<T> typeItem, T t) {
    }
}

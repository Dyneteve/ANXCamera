package com.android.camera.data.data;

import java.util.List;

public abstract class TypeElements {
    protected ComponentData mComponentData;
    private List<TypeItem> mTypeItemList;

    public <C extends ComponentData> TypeElements(C c) {
        this.mComponentData = c;
    }
}

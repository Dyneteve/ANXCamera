package com.miui.filtersdk.filter.base;

import com.miui.filtersdk.beauty.BeautyProcessor;

public abstract class BaseBeautyFilter extends GPUImageFilter {
    /* access modifiers changed from: protected */
    public BeautyProcessor mBeautyProcessor;

    public boolean beautyEnable() {
        return this.mBeautyProcessor != null;
    }

    public abstract void initBeautyProcessor(int i, int i2);

    public void setBeautyProcessor(BeautyProcessor beautyProcessor) {
        this.mBeautyProcessor = beautyProcessor;
    }
}

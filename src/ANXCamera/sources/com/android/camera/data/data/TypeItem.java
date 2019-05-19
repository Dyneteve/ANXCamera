package com.android.camera.data.data;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;

public final class TypeItem<T> {
    @DrawableRes
    public static final int RES_NULL = -1;
    @StringRes
    public static final int STRING_NULL = -1;
    public String mCategory;
    public T mDefaultValue;
    @StringRes
    public int mDisplayNameRes;
    @DrawableRes
    public int mIconRes;
    @DrawableRes
    public int mIconSelectedRes;
    public String mKeyOrType;

    public TypeItem(@DrawableRes int i, @DrawableRes int i2, @StringRes int i3, String str, String str2) {
        this.mIconRes = i;
        this.mIconSelectedRes = i2;
        this.mDisplayNameRes = i3;
        this.mCategory = str;
        this.mKeyOrType = str2;
    }

    public TypeItem(@DrawableRes int i, @StringRes int i2, String str, String str2) {
        this.mIconRes = i;
        this.mDisplayNameRes = i2;
        this.mCategory = str;
        this.mKeyOrType = str2;
    }

    public T getDefaultValue() {
        return this.mDefaultValue;
    }

    public int getImageResource() {
        return this.mIconRes;
    }

    public int getTextResource() {
        return this.mDisplayNameRes;
    }

    public TypeItem<T> setDefaultValue(T t) {
        this.mDefaultValue = t;
        return this;
    }
}

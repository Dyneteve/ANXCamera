package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

public class RotateLayout extends ViewGroup implements Rotatable {
    private static final String TAG = "RotateLayout";
    protected View mChild;
    private int mOrientation;

    public RotateLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundResource(17170445);
    }

    public int getCurrentOrientation() {
        return this.mOrientation;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        this.mChild = getChildAt(0);
        this.mChild.setPivotX(0.0f);
        this.mChild.setPivotY(0.0f);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5 = i3 - i;
        int i6 = i4 - i2;
        int i7 = this.mOrientation;
        if (i7 != 0) {
            if (i7 != 90) {
                if (i7 != 180) {
                    if (i7 != 270) {
                        return;
                    }
                }
            }
            this.mChild.layout(0, 0, i6, i5);
            return;
        }
        this.mChild.layout(0, 0, i5, i6);
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x006c  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5 = this.mOrientation;
        int i6 = 0;
        if (i5 != 0) {
            if (i5 != 90) {
                if (i5 != 180) {
                    if (i5 != 270) {
                        i3 = 0;
                        setMeasuredDimension(i6, i3);
                        i4 = this.mOrientation;
                        if (i4 == 0) {
                            this.mChild.setTranslationX(0.0f);
                            this.mChild.setTranslationY(0.0f);
                        } else if (i4 == 90) {
                            this.mChild.setTranslationX(0.0f);
                            this.mChild.setTranslationY((float) i3);
                        } else if (i4 == 180) {
                            this.mChild.setTranslationX((float) i6);
                            this.mChild.setTranslationY((float) i3);
                        } else if (i4 == 270) {
                            this.mChild.setTranslationX((float) i6);
                            this.mChild.setTranslationY(0.0f);
                        }
                        this.mChild.setRotation((float) (-this.mOrientation));
                    }
                }
            }
            measureChild(this.mChild, i2, i);
            i6 = this.mChild.getMeasuredHeight();
            i3 = this.mChild.getMeasuredWidth();
            setMeasuredDimension(i6, i3);
            i4 = this.mOrientation;
            if (i4 == 0) {
            }
            this.mChild.setRotation((float) (-this.mOrientation));
        }
        measureChild(this.mChild, i, i2);
        i6 = this.mChild.getMeasuredWidth();
        i3 = this.mChild.getMeasuredHeight();
        setMeasuredDimension(i6, i3);
        i4 = this.mOrientation;
        if (i4 == 0) {
        }
        this.mChild.setRotation((float) (-this.mOrientation));
    }

    public void setOrientation(int i, boolean z) {
        int i2 = i % 360;
        if (this.mOrientation != i2) {
            this.mOrientation = i2;
            requestLayout();
        }
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }
}

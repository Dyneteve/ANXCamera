package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;

public class CameraRootView extends FrameLayout {
    private boolean mDisableTouchevt = false;

    public CameraRootView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void disableTouchEvent() {
        this.mDisableTouchevt = true;
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (!this.mDisableTouchevt || (motionEvent.getActionMasked() != 0 && motionEvent.getActionMasked() != 5)) {
            return super.dispatchTouchEvent(motionEvent);
        }
        return true;
    }

    public void enableTouchEvent() {
        this.mDisableTouchevt = false;
    }
}

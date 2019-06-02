package com.android.camera.fragment.manually.adapter;

import com.android.camera.ui.HorizontalSlideView.HorizontalDrawAdapter;
import com.android.camera.ui.HorizontalSlideView.OnPositionSelectListener;
import com.mi.config.b;

public abstract class AbstractZoomSliderAdapter extends HorizontalDrawAdapter implements OnPositionSelectListener {
    protected static int getRealZoomRatioTele() {
        return b.rD ? 17 : 20;
    }

    public abstract boolean isEnable();

    public abstract float mapPositionToZoomRatio(float f);

    public abstract float mapZoomRatioToPosition(float f);

    public abstract void setEnable(boolean z);
}

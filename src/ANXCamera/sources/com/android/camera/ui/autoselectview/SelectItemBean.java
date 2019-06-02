package com.android.camera.ui.autoselectview;

import java.io.Serializable;

public class SelectItemBean implements Serializable {
    private static final long serialVersionUID = 1;
    private int alpha;

    public int getAlpha() {
        return this.alpha;
    }

    public void setAlpha(int i) {
        if (i <= 1 && i >= 0) {
            this.alpha = i;
        }
    }
}

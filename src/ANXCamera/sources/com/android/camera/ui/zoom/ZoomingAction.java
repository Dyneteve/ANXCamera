package com.android.camera.ui.zoom;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class ZoomingAction {
    public static final int ZOOMING_BY_PINCH_GESTURE = 2;
    public static final int ZOOMING_BY_SLIDER_BAR = 3;
    public static final int ZOOMING_BY_TOGGLE_BUTTON = 0;
    public static final int ZOOMING_BY_UNKNOWN_SOURCE = -1;
    public static final int ZOOMING_BY_VOLUME_KEY = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Action {
    }

    public static String toString(int i) {
        switch (i) {
            case -1:
                return "ZOOMING_BY_UNKNOWN_SOURCE";
            case 0:
                return "ZOOMING_BY_TOGGLE_BUTTON";
            case 1:
                return "ZOOMING_BY_VOLUME_KEY";
            case 2:
                return "ZOOMING_BY_PINCH_GESTURE";
            case 3:
                return "ZOOMING_BY_SLIDER_BAR";
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown zooming action: ");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
        }
    }
}

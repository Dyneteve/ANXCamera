package com.google.android.libraries.lens.lenslite;

import android.graphics.drawable.Drawable;
import android.util.Log;

public abstract class ExternalChipContent {
    private static final String TAG = "ExternalChipContent";

    public interface ExternalChipContentCallback {
        void onClick();
    }

    public static ExternalChipContent create(String str, Drawable drawable, ExternalChipContentCallback externalChipContentCallback) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onFocusChange: text = ");
        sb.append(str);
        sb.append(", icon = ");
        sb.append(drawable);
        sb.append(", callback = ");
        sb.append(externalChipContentCallback);
        Log.d(str2, sb.toString());
        return null;
    }
}

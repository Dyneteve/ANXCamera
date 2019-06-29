package com.google.android.libraries.lens.lenslite.api;

import android.media.Image;
import android.util.Log;

public final class LinkImage {
    private static final String TAG = "LinkImage";

    public static LinkImage create(Image image, int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("create: image = ");
        sb.append(image);
        sb.append(", rotation = ");
        sb.append(i);
        Log.d(str, sb.toString());
        return null;
    }
}

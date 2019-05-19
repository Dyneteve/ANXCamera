package com.bumptech.glide.b;

import android.support.annotation.ColorInt;
import java.util.ArrayList;
import java.util.List;

/* compiled from: GifHeader */
public class c {
    public static final int cj = 0;
    public static final int ck = -1;
    @ColorInt
    int bgColor;
    int bgIndex;
    int cl = 0;
    b cm;
    final List<b> cn = new ArrayList();
    @ColorInt
    int[] gct = null;
    boolean gctFlag;
    int gctSize;
    int height;
    int loopCount = -1;
    int pixelAspect;
    int status = 0;
    int width;

    public int ab() {
        return this.cl;
    }

    public int getHeight() {
        return this.height;
    }

    public int getStatus() {
        return this.status;
    }

    public int getWidth() {
        return this.width;
    }
}

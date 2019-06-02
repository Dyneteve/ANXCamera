package com.bumptech.glide.b;

import android.support.annotation.ColorInt;
import java.util.ArrayList;
import java.util.List;

/* compiled from: GifHeader */
public class c {
    public static final int cl = 0;
    public static final int cm = -1;
    @ColorInt
    int bgColor;
    int bgIndex;
    int cn = 0;
    b cp;
    final List<b> cq = new ArrayList();
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
        return this.cn;
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

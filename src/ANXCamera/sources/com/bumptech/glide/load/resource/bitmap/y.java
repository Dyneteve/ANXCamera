package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;

@Deprecated
/* compiled from: VideoBitmapDecoder */
public class y extends VideoDecoder<ParcelFileDescriptor> {
    public y(Context context) {
        this(c.c(context).K());
    }

    public y(d dVar) {
        super(dVar, new b());
    }
}

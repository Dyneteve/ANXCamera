package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.ImageHeaderParser;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ImageHeaderParserRegistry */
public final class b {
    private final List<ImageHeaderParser> ev = new ArrayList();

    public synchronized void b(@NonNull ImageHeaderParser imageHeaderParser) {
        this.ev.add(imageHeaderParser);
    }

    @NonNull
    public synchronized List<ImageHeaderParser> di() {
        return this.ev;
    }
}

package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.j;
import com.bumptech.glide.request.a.b;
import com.bumptech.glide.request.a.c;
import com.bumptech.glide.request.a.c.a;
import com.bumptech.glide.request.a.g;

/* compiled from: BitmapTransitionOptions */
public final class h extends j<h, Bitmap> {
    @NonNull
    public static h D(int i) {
        return new h().E(i);
    }

    @NonNull
    public static h a(@NonNull a aVar) {
        return new h().b(aVar);
    }

    @NonNull
    public static h a(@NonNull c cVar) {
        return new h().b(cVar);
    }

    @NonNull
    public static h c(@NonNull g<Drawable> gVar) {
        return new h().e(gVar);
    }

    @NonNull
    public static h cQ() {
        return new h().cR();
    }

    @NonNull
    public static h d(@NonNull g<Bitmap> gVar) {
        return (h) new h().b(gVar);
    }

    @NonNull
    public h E(int i) {
        return b(new a(i));
    }

    @NonNull
    public h b(@NonNull a aVar) {
        return e(aVar.fg());
    }

    @NonNull
    public h b(@NonNull c cVar) {
        return e(cVar);
    }

    @NonNull
    public h cR() {
        return b(new a());
    }

    @NonNull
    public h e(@NonNull g<Drawable> gVar) {
        return (h) b((g<? super TranscodeType>) new b<Object>(gVar));
    }
}

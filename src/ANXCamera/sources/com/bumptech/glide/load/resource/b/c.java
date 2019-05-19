package com.bumptech.glide.load.resource.b;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.j;
import com.bumptech.glide.request.a.c.a;
import com.bumptech.glide.request.a.g;

/* compiled from: DrawableTransitionOptions */
public final class c extends j<c, Drawable> {
    @NonNull
    public static c G(int i) {
        return new c().H(i);
    }

    @NonNull
    public static c c(@NonNull a aVar) {
        return new c().d(aVar);
    }

    @NonNull
    public static c c(@NonNull com.bumptech.glide.request.a.c cVar) {
        return new c().d(cVar);
    }

    @NonNull
    public static c cE() {
        return new c().cF();
    }

    @NonNull
    public static c f(@NonNull g<Drawable> gVar) {
        return (c) new c().b(gVar);
    }

    @NonNull
    public c H(int i) {
        return d(new a(i));
    }

    @NonNull
    public c cF() {
        return d(new a());
    }

    @NonNull
    public c d(@NonNull a aVar) {
        return d(aVar.eE());
    }

    @NonNull
    public c d(@NonNull com.bumptech.glide.request.a.c cVar) {
        return (c) b((g<? super TranscodeType>) cVar);
    }
}

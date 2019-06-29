package com.bumptech.glide;

import android.support.annotation.NonNull;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.a.j.a;

/* compiled from: GenericTransitionOptions */
public final class b<TranscodeType> extends j<b<TranscodeType>, TranscodeType> {
    @NonNull
    public static <TranscodeType> b<TranscodeType> I() {
        return (b) new b().am();
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> a(@NonNull g<? super TranscodeType> gVar) {
        return (b) new b().b(gVar);
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> a(@NonNull a aVar) {
        return (b) new b().b(aVar);
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> i(int i) {
        return (b) new b().l(i);
    }
}

package com.bumptech.glide;

import android.support.annotation.NonNull;
import com.bumptech.glide.j;
import com.bumptech.glide.request.a.e;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.a.h;
import com.bumptech.glide.request.a.j.a;
import com.bumptech.glide.util.i;

/* compiled from: TransitionOptions */
public abstract class j<CHILD extends j<CHILD, TranscodeType>, TranscodeType> implements Cloneable {
    private g<? super TranscodeType> cU = e.fh();

    private CHILD ap() {
        return this;
    }

    @NonNull
    public final CHILD am() {
        return b(e.fh());
    }

    /* renamed from: an */
    public final CHILD clone() {
        try {
            return (j) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    /* access modifiers changed from: 0000 */
    public final g<? super TranscodeType> ao() {
        return this.cU;
    }

    @NonNull
    public final CHILD b(@NonNull g<? super TranscodeType> gVar) {
        this.cU = (g) i.checkNotNull(gVar);
        return ap();
    }

    @NonNull
    public final CHILD b(@NonNull a aVar) {
        return b((g<? super TranscodeType>) new com.bumptech.glide.request.a.i<Object>(aVar));
    }

    @NonNull
    public final CHILD l(int i) {
        return b((g<? super TranscodeType>) new h<Object>(i));
    }
}

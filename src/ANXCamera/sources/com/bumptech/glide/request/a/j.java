package com.bumptech.glide.request.a;

import android.view.View;

/* compiled from: ViewPropertyTransition */
public class j<R> implements f<R> {
    private final a pJ;

    /* compiled from: ViewPropertyTransition */
    public interface a {
        void d(View view);
    }

    public j(a aVar) {
        this.pJ = aVar;
    }

    public boolean a(R r, com.bumptech.glide.request.a.f.a aVar) {
        if (aVar.getView() != null) {
            this.pJ.d(aVar.getView());
        }
        return false;
    }
}

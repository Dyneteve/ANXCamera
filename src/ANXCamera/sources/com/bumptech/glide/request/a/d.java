package com.bumptech.glide.request.a;

import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import com.bumptech.glide.request.a.f.a;

/* compiled from: DrawableCrossFadeTransition */
public class d implements f<Drawable> {
    private final int duration;
    private final boolean pA;

    public d(int i, boolean z) {
        this.duration = i;
        this.pA = z;
    }

    public boolean a(Drawable drawable, a aVar) {
        Drawable currentDrawable = aVar.getCurrentDrawable();
        if (currentDrawable == null) {
            currentDrawable = new ColorDrawable(0);
        }
        TransitionDrawable transitionDrawable = new TransitionDrawable(new Drawable[]{currentDrawable, drawable});
        transitionDrawable.setCrossFadeEnabled(this.pA);
        transitionDrawable.startTransition(this.duration);
        aVar.setDrawable(transitionDrawable);
        return true;
    }
}

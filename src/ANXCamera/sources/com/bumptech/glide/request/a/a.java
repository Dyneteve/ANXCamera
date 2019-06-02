package com.bumptech.glide.request.a;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.bumptech.glide.load.DataSource;

/* compiled from: BitmapContainerTransitionFactory */
public abstract class a<R> implements g<R> {
    private final g<Drawable> py;

    /* compiled from: BitmapContainerTransitionFactory */
    /* renamed from: com.bumptech.glide.request.a.a$a reason: collision with other inner class name */
    private final class C0011a implements f<R> {
        private final f<Drawable> pz;

        C0011a(f<Drawable> fVar) {
            this.pz = fVar;
        }

        public boolean a(R r, com.bumptech.glide.request.a.f.a aVar) {
            return this.pz.a(new BitmapDrawable(aVar.getView().getResources(), a.this.y(r)), aVar);
        }
    }

    public a(g<Drawable> gVar) {
        this.py = gVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        return new C0011a(this.py.a(dataSource, z));
    }

    public abstract Bitmap y(R r);
}

package com.bumptech.glide.request.target;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import com.bumptech.glide.util.i;

/* compiled from: FixedSizeDrawable */
public class g extends Drawable {
    private final Matrix matrix;
    private final RectF pb;
    private final RectF pc;
    private Drawable pd;
    private a pe;
    private boolean pf;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState pg;
        final int width;

        a(ConstantState constantState, int i, int i2) {
            this.pg = constantState;
            this.width = i;
            this.height = i2;
        }

        a(a aVar) {
            this(aVar.pg, aVar.width, aVar.height);
        }

        public int getChangingConfigurations() {
            return 0;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.pg.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.pg.newDrawable(resources));
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.pe = (a) i.checkNotNull(aVar);
        this.pd = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.pb = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.pc = new RectF();
    }

    private void es() {
        this.matrix.setRectToRect(this.pb, this.pc, ScaleToFit.CENTER);
    }

    public void clearColorFilter() {
        this.pd.clearColorFilter();
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.pd.draw(canvas);
        canvas.restore();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.pd.getAlpha();
    }

    public Callback getCallback() {
        return this.pd.getCallback();
    }

    public int getChangingConfigurations() {
        return this.pd.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        return this.pe;
    }

    @NonNull
    public Drawable getCurrent() {
        return this.pd.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.pe.height;
    }

    public int getIntrinsicWidth() {
        return this.pe.width;
    }

    public int getMinimumHeight() {
        return this.pd.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.pd.getMinimumWidth();
    }

    public int getOpacity() {
        return this.pd.getOpacity();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.pd.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.pd.invalidateSelf();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.pf && super.mutate() == this) {
            this.pd = this.pd.mutate();
            this.pe = new a(this.pe);
            this.pf = true;
        }
        return this;
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.pd.scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.pd.setAlpha(i);
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.pc.set((float) i, (float) i2, (float) i3, (float) i4);
        es();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.pc.set(rect);
        es();
    }

    public void setChangingConfigurations(int i) {
        this.pd.setChangingConfigurations(i);
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.pd.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.pd.setColorFilter(colorFilter);
    }

    @Deprecated
    public void setDither(boolean z) {
        this.pd.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.pd.setFilterBitmap(z);
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.pd.setVisible(z, z2);
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.pd.unscheduleSelf(runnable);
    }
}

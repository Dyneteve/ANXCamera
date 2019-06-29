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
    private final RectF qa;
    private final RectF qb;
    private Drawable qc;
    private a qe;
    private boolean qf;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState qg;
        final int width;

        a(ConstantState constantState, int i, int i2) {
            this.qg = constantState;
            this.width = i;
            this.height = i2;
        }

        a(a aVar) {
            this(aVar.qg, aVar.width, aVar.height);
        }

        public int getChangingConfigurations() {
            return 0;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.qg.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.qg.newDrawable(resources));
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.qe = (a) i.checkNotNull(aVar);
        this.qc = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.qa = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.qb = new RectF();
    }

    private void eU() {
        this.matrix.setRectToRect(this.qa, this.qb, ScaleToFit.CENTER);
    }

    public void clearColorFilter() {
        this.qc.clearColorFilter();
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.qc.draw(canvas);
        canvas.restore();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.qc.getAlpha();
    }

    public Callback getCallback() {
        return this.qc.getCallback();
    }

    public int getChangingConfigurations() {
        return this.qc.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        return this.qe;
    }

    @NonNull
    public Drawable getCurrent() {
        return this.qc.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.qe.height;
    }

    public int getIntrinsicWidth() {
        return this.qe.width;
    }

    public int getMinimumHeight() {
        return this.qc.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.qc.getMinimumWidth();
    }

    public int getOpacity() {
        return this.qc.getOpacity();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.qc.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.qc.invalidateSelf();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.qf && super.mutate() == this) {
            this.qc = this.qc.mutate();
            this.qe = new a(this.qe);
            this.qf = true;
        }
        return this;
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.qc.scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.qc.setAlpha(i);
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.qb.set((float) i, (float) i2, (float) i3, (float) i4);
        eU();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.qb.set(rect);
        eU();
    }

    public void setChangingConfigurations(int i) {
        this.qc.setChangingConfigurations(i);
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.qc.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.qc.setColorFilter(colorFilter);
    }

    @Deprecated
    public void setDither(boolean z) {
        this.qc.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.qc.setFilterBitmap(z);
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.qc.setVisible(z, z2);
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.qc.unscheduleSelf(runnable);
    }
}

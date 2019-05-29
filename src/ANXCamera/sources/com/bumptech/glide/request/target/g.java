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
    private final RectF pa;
    private final RectF pb;
    private Drawable pc;
    private a pd;
    private boolean pe;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState pf;
        final int width;

        a(ConstantState constantState, int i, int i2) {
            this.pf = constantState;
            this.width = i;
            this.height = i2;
        }

        a(a aVar) {
            this(aVar.pf, aVar.width, aVar.height);
        }

        public int getChangingConfigurations() {
            return 0;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.pf.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.pf.newDrawable(resources));
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.pd = (a) i.checkNotNull(aVar);
        this.pc = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.pa = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.pb = new RectF();
    }

    private void es() {
        this.matrix.setRectToRect(this.pa, this.pb, ScaleToFit.CENTER);
    }

    public void clearColorFilter() {
        this.pc.clearColorFilter();
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.pc.draw(canvas);
        canvas.restore();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.pc.getAlpha();
    }

    public Callback getCallback() {
        return this.pc.getCallback();
    }

    public int getChangingConfigurations() {
        return this.pc.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        return this.pd;
    }

    @NonNull
    public Drawable getCurrent() {
        return this.pc.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.pd.height;
    }

    public int getIntrinsicWidth() {
        return this.pd.width;
    }

    public int getMinimumHeight() {
        return this.pc.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.pc.getMinimumWidth();
    }

    public int getOpacity() {
        return this.pc.getOpacity();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.pc.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.pc.invalidateSelf();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.pe && super.mutate() == this) {
            this.pc = this.pc.mutate();
            this.pd = new a(this.pd);
            this.pe = true;
        }
        return this;
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.pc.scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.pc.setAlpha(i);
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.pb.set((float) i, (float) i2, (float) i3, (float) i4);
        es();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.pb.set(rect);
        es();
    }

    public void setChangingConfigurations(int i) {
        this.pc.setChangingConfigurations(i);
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.pc.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.pc.setColorFilter(colorFilter);
    }

    @Deprecated
    public void setDither(boolean z) {
        this.pc.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.pc.setFilterBitmap(z);
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.pc.setVisible(z, z2);
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.pc.unscheduleSelf(runnable);
    }
}

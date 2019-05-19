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
    private final RectF oZ;
    private final RectF pa;
    private Drawable pb;
    private a pc;
    private boolean pd;

    /* compiled from: FixedSizeDrawable */
    static final class a extends ConstantState {
        final int height;
        private final ConstantState pe;
        final int width;

        a(ConstantState constantState, int i, int i2) {
            this.pe = constantState;
            this.width = i;
            this.height = i2;
        }

        a(a aVar) {
            this(aVar.pe, aVar.width, aVar.height);
        }

        public int getChangingConfigurations() {
            return 0;
        }

        @NonNull
        public Drawable newDrawable() {
            return new g(this, this.pe.newDrawable());
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return new g(this, this.pe.newDrawable(resources));
        }
    }

    public g(Drawable drawable, int i, int i2) {
        this(new a(drawable.getConstantState(), i, i2), drawable);
    }

    g(a aVar, Drawable drawable) {
        this.pc = (a) i.checkNotNull(aVar);
        this.pb = (Drawable) i.checkNotNull(drawable);
        drawable.setBounds(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        this.matrix = new Matrix();
        this.oZ = new RectF(0.0f, 0.0f, (float) drawable.getIntrinsicWidth(), (float) drawable.getIntrinsicHeight());
        this.pa = new RectF();
    }

    private void es() {
        this.matrix.setRectToRect(this.oZ, this.pa, ScaleToFit.CENTER);
    }

    public void clearColorFilter() {
        this.pb.clearColorFilter();
    }

    public void draw(@NonNull Canvas canvas) {
        canvas.save();
        canvas.concat(this.matrix);
        this.pb.draw(canvas);
        canvas.restore();
    }

    @RequiresApi(19)
    public int getAlpha() {
        return this.pb.getAlpha();
    }

    public Callback getCallback() {
        return this.pb.getCallback();
    }

    public int getChangingConfigurations() {
        return this.pb.getChangingConfigurations();
    }

    public ConstantState getConstantState() {
        return this.pc;
    }

    @NonNull
    public Drawable getCurrent() {
        return this.pb.getCurrent();
    }

    public int getIntrinsicHeight() {
        return this.pc.height;
    }

    public int getIntrinsicWidth() {
        return this.pc.width;
    }

    public int getMinimumHeight() {
        return this.pb.getMinimumHeight();
    }

    public int getMinimumWidth() {
        return this.pb.getMinimumWidth();
    }

    public int getOpacity() {
        return this.pb.getOpacity();
    }

    public boolean getPadding(@NonNull Rect rect) {
        return this.pb.getPadding(rect);
    }

    public void invalidateSelf() {
        super.invalidateSelf();
        this.pb.invalidateSelf();
    }

    @NonNull
    public Drawable mutate() {
        if (!this.pd && super.mutate() == this) {
            this.pb = this.pb.mutate();
            this.pc = new a(this.pc);
            this.pd = true;
        }
        return this;
    }

    public void scheduleSelf(@NonNull Runnable runnable, long j) {
        super.scheduleSelf(runnable, j);
        this.pb.scheduleSelf(runnable, j);
    }

    public void setAlpha(int i) {
        this.pb.setAlpha(i);
    }

    public void setBounds(int i, int i2, int i3, int i4) {
        super.setBounds(i, i2, i3, i4);
        this.pa.set((float) i, (float) i2, (float) i3, (float) i4);
        es();
    }

    public void setBounds(@NonNull Rect rect) {
        super.setBounds(rect);
        this.pa.set(rect);
        es();
    }

    public void setChangingConfigurations(int i) {
        this.pb.setChangingConfigurations(i);
    }

    public void setColorFilter(int i, @NonNull Mode mode) {
        this.pb.setColorFilter(i, mode);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        this.pb.setColorFilter(colorFilter);
    }

    @Deprecated
    public void setDither(boolean z) {
        this.pb.setDither(z);
    }

    public void setFilterBitmap(boolean z) {
        this.pb.setFilterBitmap(z);
    }

    public boolean setVisible(boolean z, boolean z2) {
        return this.pb.setVisible(z, z2);
    }

    public void unscheduleSelf(@NonNull Runnable runnable) {
        super.unscheduleSelf(runnable);
        this.pb.unscheduleSelf(runnable);
    }
}

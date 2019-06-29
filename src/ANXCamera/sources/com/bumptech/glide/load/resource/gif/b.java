package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.view.Gravity;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.i;
import java.nio.ByteBuffer;

/* compiled from: GifDrawable */
public class b extends Drawable implements Animatable, com.bumptech.glide.load.resource.gif.GifFrameLoader.a {
    private static final int GRAVITY = 119;
    public static final int nn = -1;
    public static final int no = 0;
    private boolean hJ;
    private boolean isRunning;
    private int loopCount;
    private final a np;
    private boolean nq;
    private boolean nr;
    private int ns;
    private boolean nt;
    private Rect nu;
    private Paint paint;

    /* compiled from: GifDrawable */
    static final class a extends ConstantState {
        @VisibleForTesting
        final GifFrameLoader frameLoader;

        a(GifFrameLoader gifFrameLoader) {
            this.frameLoader = gifFrameLoader;
        }

        public int getChangingConfigurations() {
            return 0;
        }

        @NonNull
        public Drawable newDrawable() {
            return new b(this);
        }

        @NonNull
        public Drawable newDrawable(Resources resources) {
            return newDrawable();
        }
    }

    @Deprecated
    public b(Context context, com.bumptech.glide.b.a aVar, d dVar, i<Bitmap> iVar, int i, int i2, Bitmap bitmap) {
        this(context, aVar, iVar, i, i2, bitmap);
    }

    public b(Context context, com.bumptech.glide.b.a aVar, i<Bitmap> iVar, int i, int i2, Bitmap bitmap) {
        GifFrameLoader gifFrameLoader = new GifFrameLoader(c.c(context), aVar, i, i2, iVar, bitmap);
        this(new a(gifFrameLoader));
    }

    @VisibleForTesting
    b(GifFrameLoader gifFrameLoader, Paint paint2) {
        this(new a(gifFrameLoader));
        this.paint = paint2;
    }

    b(a aVar) {
        this.nr = true;
        this.ns = -1;
        this.np = (a) com.bumptech.glide.util.i.checkNotNull(aVar);
    }

    private void dl() {
        this.loopCount = 0;
    }

    private void dn() {
        com.bumptech.glide.util.i.a(!this.hJ, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request.");
        if (this.np.frameLoader.getFrameCount() == 1) {
            invalidateSelf();
        } else if (!this.isRunning) {
            this.isRunning = true;
            this.np.frameLoader.a(this);
            invalidateSelf();
        }
    }

    /* renamed from: do reason: not valid java name */
    private Rect m0do() {
        if (this.nu == null) {
            this.nu = new Rect();
        }
        return this.nu;
    }

    private Callback dp() {
        Callback callback = getCallback();
        while (callback instanceof Drawable) {
            callback = ((Drawable) callback).getCallback();
        }
        return callback;
    }

    private Paint getPaint() {
        if (this.paint == null) {
            this.paint = new Paint(2);
        }
        return this.paint;
    }

    private void stopRunning() {
        this.isRunning = false;
        this.np.frameLoader.b(this);
    }

    public void a(i<Bitmap> iVar, Bitmap bitmap) {
        this.np.frameLoader.a(iVar, bitmap);
    }

    public Bitmap di() {
        return this.np.frameLoader.di();
    }

    public i<Bitmap> dj() {
        return this.np.frameLoader.dj();
    }

    public int dk() {
        return this.np.frameLoader.getCurrentIndex();
    }

    public void dm() {
        com.bumptech.glide.util.i.a(!this.isRunning, "You cannot restart a currently running animation.");
        this.np.frameLoader.du();
        start();
    }

    public void dq() {
        if (dp() == null) {
            stop();
            invalidateSelf();
            return;
        }
        invalidateSelf();
        if (dk() == getFrameCount() - 1) {
            this.loopCount++;
        }
        if (this.ns != -1 && this.loopCount >= this.ns) {
            stop();
        }
    }

    public void draw(@NonNull Canvas canvas) {
        if (!this.hJ) {
            if (this.nt) {
                Gravity.apply(119, getIntrinsicWidth(), getIntrinsicHeight(), getBounds(), m0do());
                this.nt = false;
            }
            canvas.drawBitmap(this.np.frameLoader.dr(), null, m0do(), getPaint());
        }
    }

    public ByteBuffer getBuffer() {
        return this.np.frameLoader.getBuffer();
    }

    public ConstantState getConstantState() {
        return this.np;
    }

    public int getFrameCount() {
        return this.np.frameLoader.getFrameCount();
    }

    public int getIntrinsicHeight() {
        return this.np.frameLoader.getHeight();
    }

    public int getIntrinsicWidth() {
        return this.np.frameLoader.getWidth();
    }

    public int getOpacity() {
        return -2;
    }

    public int getSize() {
        return this.np.frameLoader.getSize();
    }

    /* access modifiers changed from: 0000 */
    public void h(boolean z) {
        this.isRunning = z;
    }

    /* access modifiers changed from: 0000 */
    public boolean isRecycled() {
        return this.hJ;
    }

    public boolean isRunning() {
        return this.isRunning;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.nt = true;
    }

    public void recycle() {
        this.hJ = true;
        this.np.frameLoader.clear();
    }

    public void setAlpha(int i) {
        getPaint().setAlpha(i);
    }

    public void setColorFilter(ColorFilter colorFilter) {
        getPaint().setColorFilter(colorFilter);
    }

    public void setLoopCount(int i) {
        if (i <= 0 && i != -1 && i != 0) {
            throw new IllegalArgumentException("Loop count must be greater than 0, or equal to GlideDrawable.LOOP_FOREVER, or equal to GlideDrawable.LOOP_INTRINSIC");
        } else if (i == 0) {
            int loopCount2 = this.np.frameLoader.getLoopCount();
            if (loopCount2 == 0) {
                loopCount2 = -1;
            }
            this.ns = loopCount2;
        } else {
            this.ns = i;
        }
    }

    public boolean setVisible(boolean z, boolean z2) {
        com.bumptech.glide.util.i.a(!this.hJ, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View's visibility.");
        this.nr = z;
        if (!z) {
            stopRunning();
        } else if (this.nq) {
            dn();
        }
        return super.setVisible(z, z2);
    }

    public void start() {
        this.nq = true;
        dl();
        if (this.nr) {
            dn();
        }
    }

    public void stop() {
        this.nq = false;
        stopRunning();
    }
}

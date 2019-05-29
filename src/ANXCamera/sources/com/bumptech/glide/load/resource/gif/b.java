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
    public static final int mj = -1;
    public static final int mk = 0;
    private boolean gI;
    private boolean isRunning;
    private int loopCount;
    private final a ml;
    private boolean mm;
    private boolean mn;
    private int mo;
    private boolean mp;
    private Rect mq;
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
        this.mn = true;
        this.mo = -1;
        this.ml = (a) com.bumptech.glide.util.i.checkNotNull(aVar);
    }

    private void cJ() {
        this.loopCount = 0;
    }

    private void cL() {
        com.bumptech.glide.util.i.a(!this.gI, "You cannot start a recycled Drawable. Ensure thatyou clear any references to the Drawable when clearing the corresponding request.");
        if (this.ml.frameLoader.getFrameCount() == 1) {
            invalidateSelf();
        } else if (!this.isRunning) {
            this.isRunning = true;
            this.ml.frameLoader.a(this);
            invalidateSelf();
        }
    }

    private Rect cM() {
        if (this.mq == null) {
            this.mq = new Rect();
        }
        return this.mq;
    }

    private Callback cN() {
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
        this.ml.frameLoader.b(this);
    }

    public void a(i<Bitmap> iVar, Bitmap bitmap) {
        this.ml.frameLoader.a(iVar, bitmap);
    }

    public Bitmap cG() {
        return this.ml.frameLoader.cG();
    }

    public i<Bitmap> cH() {
        return this.ml.frameLoader.cH();
    }

    public int cI() {
        return this.ml.frameLoader.getCurrentIndex();
    }

    public void cK() {
        com.bumptech.glide.util.i.a(!this.isRunning, "You cannot restart a currently running animation.");
        this.ml.frameLoader.cS();
        start();
    }

    public void cO() {
        if (cN() == null) {
            stop();
            invalidateSelf();
            return;
        }
        invalidateSelf();
        if (cI() == getFrameCount() - 1) {
            this.loopCount++;
        }
        if (this.mo != -1 && this.loopCount >= this.mo) {
            stop();
        }
    }

    public void draw(@NonNull Canvas canvas) {
        if (!this.gI) {
            if (this.mp) {
                Gravity.apply(119, getIntrinsicWidth(), getIntrinsicHeight(), getBounds(), cM());
                this.mp = false;
            }
            canvas.drawBitmap(this.ml.frameLoader.cP(), null, cM(), getPaint());
        }
    }

    public ByteBuffer getBuffer() {
        return this.ml.frameLoader.getBuffer();
    }

    public ConstantState getConstantState() {
        return this.ml;
    }

    public int getFrameCount() {
        return this.ml.frameLoader.getFrameCount();
    }

    public int getIntrinsicHeight() {
        return this.ml.frameLoader.getHeight();
    }

    public int getIntrinsicWidth() {
        return this.ml.frameLoader.getWidth();
    }

    public int getOpacity() {
        return -2;
    }

    public int getSize() {
        return this.ml.frameLoader.getSize();
    }

    /* access modifiers changed from: 0000 */
    public void h(boolean z) {
        this.isRunning = z;
    }

    /* access modifiers changed from: 0000 */
    public boolean isRecycled() {
        return this.gI;
    }

    public boolean isRunning() {
        return this.isRunning;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        this.mp = true;
    }

    public void recycle() {
        this.gI = true;
        this.ml.frameLoader.clear();
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
            int loopCount2 = this.ml.frameLoader.getLoopCount();
            if (loopCount2 == 0) {
                loopCount2 = -1;
            }
            this.mo = loopCount2;
        } else {
            this.mo = i;
        }
    }

    public boolean setVisible(boolean z, boolean z2) {
        com.bumptech.glide.util.i.a(!this.gI, "Cannot change the visibility of a recycled resource. Ensure that you unset the Drawable from your View before changing the View's visibility.");
        this.mn = z;
        if (!z) {
            stopRunning();
        } else if (this.mm) {
            cL();
        }
        return super.setVisible(z, z2);
    }

    public void start() {
        this.mm = true;
        cJ();
        if (this.mn) {
            cL();
        }
    }

    public void stop() {
        this.mm = false;
        stopRunning();
    }
}

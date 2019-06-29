package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.bitmap_recycle.e;
import com.bumptech.glide.load.engine.p;
import java.util.concurrent.locks.Lock;

/* compiled from: DrawableToBitmapConverter */
final class o {
    private static final String TAG = "DrawableToBitmap";
    private static final d my = new e() {
        public void d(Bitmap bitmap) {
        }
    };

    private o() {
    }

    @Nullable
    static p<Bitmap> a(d dVar, Drawable drawable, int i, int i2) {
        Bitmap bitmap;
        Drawable current = drawable.getCurrent();
        boolean z = false;
        if (current instanceof BitmapDrawable) {
            bitmap = ((BitmapDrawable) current).getBitmap();
        } else if (!(current instanceof Animatable)) {
            bitmap = b(dVar, current, i, i2);
            z = true;
        } else {
            bitmap = null;
        }
        if (!z) {
            dVar = my;
        }
        return f.a(bitmap, dVar);
    }

    @Nullable
    private static Bitmap b(d dVar, Drawable drawable, int i, int i2) {
        if (i == Integer.MIN_VALUE && drawable.getIntrinsicWidth() <= 0) {
            if (Log.isLoggable(TAG, 5)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to draw ");
                sb.append(drawable);
                sb.append(" to Bitmap with Target.SIZE_ORIGINAL because the Drawable has no intrinsic width");
                Log.w(str, sb.toString());
            }
            return null;
        } else if (i2 != Integer.MIN_VALUE || drawable.getIntrinsicHeight() > 0) {
            if (drawable.getIntrinsicWidth() > 0) {
                i = drawable.getIntrinsicWidth();
            }
            if (drawable.getIntrinsicHeight() > 0) {
                i2 = drawable.getIntrinsicHeight();
            }
            Lock dc = w.dc();
            dc.lock();
            Bitmap b = dVar.b(i, i2, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(b);
                drawable.setBounds(0, 0, i, i2);
                drawable.draw(canvas);
                canvas.setBitmap(null);
                return b;
            } finally {
                dc.unlock();
            }
        } else {
            if (Log.isLoggable(TAG, 5)) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Unable to draw ");
                sb2.append(drawable);
                sb2.append(" to Bitmap with Target.SIZE_ORIGINAL because the Drawable has no intrinsic height");
                Log.w(str2, sb2.toString());
            }
            return null;
        }
    }
}

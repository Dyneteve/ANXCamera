package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.c;
import com.bumptech.glide.h;
import com.bumptech.glide.i;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.l;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

class GifFrameLoader {
    final i aJ;
    private final d am;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> gX;
    private final Handler handler;
    private boolean isRunning;
    private DelayTarget mA;
    @Nullable
    private OnEveryFrameListener mB;
    private final com.bumptech.glide.b.a ms;
    private boolean mt;
    private boolean mu;
    private h<Bitmap> mv;
    private DelayTarget mw;
    private boolean mx;
    private DelayTarget my;
    private Bitmap mz;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long mC;
        private Bitmap mD;

        DelayTarget(Handler handler2, int i, long j) {
            this.handler = handler2;
            this.index = i;
            this.mC = j;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.mD = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.mC);
        }

        /* access modifiers changed from: 0000 */
        public Bitmap cU() {
            return this.mD;
        }
    }

    @VisibleForTesting
    interface OnEveryFrameListener {
        void cO();
    }

    public interface a {
        void cO();
    }

    private class b implements Callback {
        static final int mE = 1;
        static final int mF = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.aJ.d((n<?>) (DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.k(), c.g(cVar.getContext()), aVar, null, a(c.g(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler2, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.aJ = iVar;
        if (handler2 == null) {
            handler2 = new Handler(Looper.getMainLooper(), new b());
        }
        this.am = dVar;
        this.handler = handler2;
        this.mv = hVar;
        this.ms = aVar;
        a(iVar2, bitmap);
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.H().b(com.bumptech.glide.request.f.a(g.fV).k(true).m(true).o(i, i2));
    }

    private void cQ() {
        if (this.isRunning && !this.mt) {
            if (this.mu) {
                com.bumptech.glide.util.i.a(this.mA == null, "Pending target must be null when starting from the first frame");
                this.ms.W();
                this.mu = false;
            }
            if (this.mA != null) {
                DelayTarget delayTarget = this.mA;
                this.mA = null;
                onFrameReady(delayTarget);
                return;
            }
            this.mt = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.ms.U());
            this.ms.advance();
            this.my = new DelayTarget(this.handler, this.ms.V(), uptimeMillis);
            this.mv.b(com.bumptech.glide.request.f.j(cT())).load(this.ms).b(this.my);
        }
    }

    private void cR() {
        if (this.mz != null) {
            this.am.d(this.mz);
            this.mz = null;
        }
    }

    private static com.bumptech.glide.load.c cT() {
        return new com.bumptech.glide.e.d(Double.valueOf(Math.random()));
    }

    private int getFrameSize() {
        return k.i(cP().getWidth(), cP().getHeight(), cP().getConfig());
    }

    private void start() {
        if (!this.isRunning) {
            this.isRunning = true;
            this.mx = false;
            cQ();
        }
    }

    private void stop() {
        this.isRunning = false;
    }

    /* access modifiers changed from: 0000 */
    public void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.gX = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.mz = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.mv = this.mv.b(new com.bumptech.glide.request.f().b(iVar));
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        if (this.mx) {
            throw new IllegalStateException("Cannot subscribe to a cleared frame loader");
        } else if (!this.callbacks.contains(aVar)) {
            boolean isEmpty = this.callbacks.isEmpty();
            this.callbacks.add(aVar);
            if (isEmpty) {
                start();
            }
        } else {
            throw new IllegalStateException("Cannot subscribe twice in a row");
        }
    }

    /* access modifiers changed from: 0000 */
    public void b(a aVar) {
        this.callbacks.remove(aVar);
        if (this.callbacks.isEmpty()) {
            stop();
        }
    }

    /* access modifiers changed from: 0000 */
    public Bitmap cG() {
        return this.mz;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.i<Bitmap> cH() {
        return this.gX;
    }

    /* access modifiers changed from: 0000 */
    public Bitmap cP() {
        return this.mw != null ? this.mw.cU() : this.mz;
    }

    /* access modifiers changed from: 0000 */
    public void cS() {
        com.bumptech.glide.util.i.a(!this.isRunning, "Can't restart a running animation");
        this.mu = true;
        if (this.mA != null) {
            this.aJ.d((n<?>) this.mA);
            this.mA = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void clear() {
        this.callbacks.clear();
        cR();
        stop();
        if (this.mw != null) {
            this.aJ.d((n<?>) this.mw);
            this.mw = null;
        }
        if (this.my != null) {
            this.aJ.d((n<?>) this.my);
            this.my = null;
        }
        if (this.mA != null) {
            this.aJ.d((n<?>) this.mA);
            this.mA = null;
        }
        this.ms.clear();
        this.mx = true;
    }

    /* access modifiers changed from: 0000 */
    public ByteBuffer getBuffer() {
        return this.ms.getData().asReadOnlyBuffer();
    }

    /* access modifiers changed from: 0000 */
    public int getCurrentIndex() {
        if (this.mw != null) {
            return this.mw.index;
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public int getFrameCount() {
        return this.ms.getFrameCount();
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return cP().getHeight();
    }

    /* access modifiers changed from: 0000 */
    public int getLoopCount() {
        return this.ms.Y();
    }

    /* access modifiers changed from: 0000 */
    public int getSize() {
        return this.ms.Z() + getFrameSize();
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return cP().getWidth();
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void onFrameReady(DelayTarget delayTarget) {
        if (this.mB != null) {
            this.mB.cO();
        }
        this.mt = false;
        if (this.mx) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (!this.isRunning) {
            this.mA = delayTarget;
        } else {
            if (delayTarget.cU() != null) {
                cR();
                DelayTarget delayTarget2 = this.mw;
                this.mw = delayTarget;
                for (int size = this.callbacks.size() - 1; size >= 0; size--) {
                    ((a) this.callbacks.get(size)).cO();
                }
                if (delayTarget2 != null) {
                    this.handler.obtainMessage(2, delayTarget2).sendToTarget();
                }
            }
            cQ();
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void setOnEveryFrameReadyListener(@Nullable OnEveryFrameListener onEveryFrameListener) {
        this.mB = onEveryFrameListener;
    }
}

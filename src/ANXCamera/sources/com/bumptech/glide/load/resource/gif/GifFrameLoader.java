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
    final i aI;
    private final d al;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> gW;
    private final Handler handler;
    private boolean isRunning;
    @Nullable
    private OnEveryFrameListener mA;
    private final com.bumptech.glide.b.a mr;
    private boolean ms;
    private boolean mt;
    private h<Bitmap> mu;
    private DelayTarget mv;
    private boolean mw;
    private DelayTarget mx;
    private Bitmap my;
    private DelayTarget mz;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long mB;
        private Bitmap mC;

        DelayTarget(Handler handler2, int i, long j) {
            this.handler = handler2;
            this.index = i;
            this.mB = j;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.mC = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.mB);
        }

        /* access modifiers changed from: 0000 */
        public Bitmap cU() {
            return this.mC;
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
        static final int mD = 1;
        static final int mE = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.aI.d((n<?>) (DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.k(), c.g(cVar.getContext()), aVar, null, a(c.g(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler2, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.aI = iVar;
        if (handler2 == null) {
            handler2 = new Handler(Looper.getMainLooper(), new b());
        }
        this.al = dVar;
        this.handler = handler2;
        this.mu = hVar;
        this.mr = aVar;
        a(iVar2, bitmap);
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.H().b(com.bumptech.glide.request.f.a(g.fU).k(true).m(true).o(i, i2));
    }

    private void cQ() {
        if (this.isRunning && !this.ms) {
            if (this.mt) {
                com.bumptech.glide.util.i.a(this.mz == null, "Pending target must be null when starting from the first frame");
                this.mr.W();
                this.mt = false;
            }
            if (this.mz != null) {
                DelayTarget delayTarget = this.mz;
                this.mz = null;
                onFrameReady(delayTarget);
                return;
            }
            this.ms = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.mr.U());
            this.mr.advance();
            this.mx = new DelayTarget(this.handler, this.mr.V(), uptimeMillis);
            this.mu.b(com.bumptech.glide.request.f.j(cT())).load(this.mr).b(this.mx);
        }
    }

    private void cR() {
        if (this.my != null) {
            this.al.d(this.my);
            this.my = null;
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
            this.mw = false;
            cQ();
        }
    }

    private void stop() {
        this.isRunning = false;
    }

    /* access modifiers changed from: 0000 */
    public void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.gW = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.my = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.mu = this.mu.b(new com.bumptech.glide.request.f().b(iVar));
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        if (this.mw) {
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
        return this.my;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.i<Bitmap> cH() {
        return this.gW;
    }

    /* access modifiers changed from: 0000 */
    public Bitmap cP() {
        return this.mv != null ? this.mv.cU() : this.my;
    }

    /* access modifiers changed from: 0000 */
    public void cS() {
        com.bumptech.glide.util.i.a(!this.isRunning, "Can't restart a running animation");
        this.mt = true;
        if (this.mz != null) {
            this.aI.d((n<?>) this.mz);
            this.mz = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void clear() {
        this.callbacks.clear();
        cR();
        stop();
        if (this.mv != null) {
            this.aI.d((n<?>) this.mv);
            this.mv = null;
        }
        if (this.mx != null) {
            this.aI.d((n<?>) this.mx);
            this.mx = null;
        }
        if (this.mz != null) {
            this.aI.d((n<?>) this.mz);
            this.mz = null;
        }
        this.mr.clear();
        this.mw = true;
    }

    /* access modifiers changed from: 0000 */
    public ByteBuffer getBuffer() {
        return this.mr.getData().asReadOnlyBuffer();
    }

    /* access modifiers changed from: 0000 */
    public int getCurrentIndex() {
        if (this.mv != null) {
            return this.mv.index;
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public int getFrameCount() {
        return this.mr.getFrameCount();
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return cP().getHeight();
    }

    /* access modifiers changed from: 0000 */
    public int getLoopCount() {
        return this.mr.Y();
    }

    /* access modifiers changed from: 0000 */
    public int getSize() {
        return this.mr.Z() + getFrameSize();
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return cP().getWidth();
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void onFrameReady(DelayTarget delayTarget) {
        if (this.mA != null) {
            this.mA.cO();
        }
        this.ms = false;
        if (this.mw) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (!this.isRunning) {
            this.mz = delayTarget;
        } else {
            if (delayTarget.cU() != null) {
                cR();
                DelayTarget delayTarget2 = this.mv;
                this.mv = delayTarget;
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
        this.mA = onEveryFrameListener;
    }
}

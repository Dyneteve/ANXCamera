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
    final i aH;
    private final d ak;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> gV;
    private final Handler handler;
    private boolean isRunning;
    private final com.bumptech.glide.b.a mq;
    private boolean mr;
    private boolean ms;
    private h<Bitmap> mt;
    private DelayTarget mu;
    private boolean mv;
    private DelayTarget mw;
    private Bitmap mx;
    private DelayTarget my;
    @Nullable
    private OnEveryFrameListener mz;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long mA;
        private Bitmap mB;

        DelayTarget(Handler handler2, int i, long j) {
            this.handler = handler2;
            this.index = i;
            this.mA = j;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.mB = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.mA);
        }

        /* access modifiers changed from: 0000 */
        public Bitmap cU() {
            return this.mB;
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
        static final int mC = 1;
        static final int mD = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.aH.d((n<?>) (DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.k(), c.g(cVar.getContext()), aVar, null, a(c.g(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler2, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.aH = iVar;
        if (handler2 == null) {
            handler2 = new Handler(Looper.getMainLooper(), new b());
        }
        this.ak = dVar;
        this.handler = handler2;
        this.mt = hVar;
        this.mq = aVar;
        a(iVar2, bitmap);
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.H().b(com.bumptech.glide.request.f.a(g.fT).k(true).m(true).o(i, i2));
    }

    private void cQ() {
        if (this.isRunning && !this.mr) {
            if (this.ms) {
                com.bumptech.glide.util.i.a(this.my == null, "Pending target must be null when starting from the first frame");
                this.mq.W();
                this.ms = false;
            }
            if (this.my != null) {
                DelayTarget delayTarget = this.my;
                this.my = null;
                onFrameReady(delayTarget);
                return;
            }
            this.mr = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.mq.U());
            this.mq.advance();
            this.mw = new DelayTarget(this.handler, this.mq.V(), uptimeMillis);
            this.mt.b(com.bumptech.glide.request.f.j(cT())).load(this.mq).b(this.mw);
        }
    }

    private void cR() {
        if (this.mx != null) {
            this.ak.d(this.mx);
            this.mx = null;
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
            this.mv = false;
            cQ();
        }
    }

    private void stop() {
        this.isRunning = false;
    }

    /* access modifiers changed from: 0000 */
    public void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.gV = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.mx = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.mt = this.mt.b(new com.bumptech.glide.request.f().b(iVar));
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        if (this.mv) {
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
        return this.mx;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.i<Bitmap> cH() {
        return this.gV;
    }

    /* access modifiers changed from: 0000 */
    public Bitmap cP() {
        return this.mu != null ? this.mu.cU() : this.mx;
    }

    /* access modifiers changed from: 0000 */
    public void cS() {
        com.bumptech.glide.util.i.a(!this.isRunning, "Can't restart a running animation");
        this.ms = true;
        if (this.my != null) {
            this.aH.d((n<?>) this.my);
            this.my = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void clear() {
        this.callbacks.clear();
        cR();
        stop();
        if (this.mu != null) {
            this.aH.d((n<?>) this.mu);
            this.mu = null;
        }
        if (this.mw != null) {
            this.aH.d((n<?>) this.mw);
            this.mw = null;
        }
        if (this.my != null) {
            this.aH.d((n<?>) this.my);
            this.my = null;
        }
        this.mq.clear();
        this.mv = true;
    }

    /* access modifiers changed from: 0000 */
    public ByteBuffer getBuffer() {
        return this.mq.getData().asReadOnlyBuffer();
    }

    /* access modifiers changed from: 0000 */
    public int getCurrentIndex() {
        if (this.mu != null) {
            return this.mu.index;
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public int getFrameCount() {
        return this.mq.getFrameCount();
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return cP().getHeight();
    }

    /* access modifiers changed from: 0000 */
    public int getLoopCount() {
        return this.mq.Y();
    }

    /* access modifiers changed from: 0000 */
    public int getSize() {
        return this.mq.Z() + getFrameSize();
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return cP().getWidth();
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void onFrameReady(DelayTarget delayTarget) {
        if (this.mz != null) {
            this.mz.cO();
        }
        this.mr = false;
        if (this.mv) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (!this.isRunning) {
            this.my = delayTarget;
        } else {
            if (delayTarget.cU() != null) {
                cR();
                DelayTarget delayTarget2 = this.mu;
                this.mu = delayTarget;
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
        this.mz = onEveryFrameListener;
    }
}

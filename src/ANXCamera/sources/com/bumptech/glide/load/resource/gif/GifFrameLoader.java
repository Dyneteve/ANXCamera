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
    final i bJ;
    private final d bm;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> hX;
    private final Handler handler;
    private boolean isRunning;
    private boolean nA;
    private DelayTarget nB;
    private Bitmap nC;
    private DelayTarget nD;
    @Nullable
    private OnEveryFrameListener nE;
    private final com.bumptech.glide.b.a nv;
    private boolean nw;
    private boolean nx;
    private h<Bitmap> ny;
    private DelayTarget nz;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long nF;
        private Bitmap nG;

        DelayTarget(Handler handler2, int i, long j) {
            this.handler = handler2;
            this.index = i;
            this.nF = j;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.nG = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.nF);
        }

        /* access modifiers changed from: 0000 */
        public Bitmap dw() {
            return this.nG;
        }
    }

    @VisibleForTesting
    interface OnEveryFrameListener {
        void dq();
    }

    public interface a {
        void dq();
    }

    private class b implements Callback {
        static final int nH = 1;
        static final int nI = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.bJ.d((n<?>) (DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.K(), c.g(cVar.getContext()), aVar, null, a(c.g(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler2, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.bJ = iVar;
        if (handler2 == null) {
            handler2 = new Handler(Looper.getMainLooper(), new b());
        }
        this.bm = dVar;
        this.handler = handler2;
        this.ny = hVar;
        this.nv = aVar;
        a(iVar2, bitmap);
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.ah().b(com.bumptech.glide.request.f.a(g.gV).k(true).m(true).p(i, i2));
    }

    private void ds() {
        if (this.isRunning && !this.nw) {
            if (this.nx) {
                com.bumptech.glide.util.i.a(this.nD == null, "Pending target must be null when starting from the first frame");
                this.nv.aw();
                this.nx = false;
            }
            if (this.nD != null) {
                DelayTarget delayTarget = this.nD;
                this.nD = null;
                onFrameReady(delayTarget);
                return;
            }
            this.nw = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.nv.au());
            this.nv.advance();
            this.nB = new DelayTarget(this.handler, this.nv.av(), uptimeMillis);
            this.ny.b(com.bumptech.glide.request.f.j(dv())).load(this.nv).b(this.nB);
        }
    }

    private void dt() {
        if (this.nC != null) {
            this.bm.d(this.nC);
            this.nC = null;
        }
    }

    private static com.bumptech.glide.load.c dv() {
        return new com.bumptech.glide.e.d(Double.valueOf(Math.random()));
    }

    private int getFrameSize() {
        return k.i(dr().getWidth(), dr().getHeight(), dr().getConfig());
    }

    private void start() {
        if (!this.isRunning) {
            this.isRunning = true;
            this.nA = false;
            ds();
        }
    }

    private void stop() {
        this.isRunning = false;
    }

    /* access modifiers changed from: 0000 */
    public void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.hX = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.nC = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.ny = this.ny.b(new com.bumptech.glide.request.f().b(iVar));
    }

    /* access modifiers changed from: 0000 */
    public void a(a aVar) {
        if (this.nA) {
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
    public void clear() {
        this.callbacks.clear();
        dt();
        stop();
        if (this.nz != null) {
            this.bJ.d((n<?>) this.nz);
            this.nz = null;
        }
        if (this.nB != null) {
            this.bJ.d((n<?>) this.nB);
            this.nB = null;
        }
        if (this.nD != null) {
            this.bJ.d((n<?>) this.nD);
            this.nD = null;
        }
        this.nv.clear();
        this.nA = true;
    }

    /* access modifiers changed from: 0000 */
    public Bitmap di() {
        return this.nC;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.i<Bitmap> dj() {
        return this.hX;
    }

    /* access modifiers changed from: 0000 */
    public Bitmap dr() {
        return this.nz != null ? this.nz.dw() : this.nC;
    }

    /* access modifiers changed from: 0000 */
    public void du() {
        com.bumptech.glide.util.i.a(!this.isRunning, "Can't restart a running animation");
        this.nx = true;
        if (this.nD != null) {
            this.bJ.d((n<?>) this.nD);
            this.nD = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public ByteBuffer getBuffer() {
        return this.nv.getData().asReadOnlyBuffer();
    }

    /* access modifiers changed from: 0000 */
    public int getCurrentIndex() {
        if (this.nz != null) {
            return this.nz.index;
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public int getFrameCount() {
        return this.nv.getFrameCount();
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return dr().getHeight();
    }

    /* access modifiers changed from: 0000 */
    public int getLoopCount() {
        return this.nv.ay();
    }

    /* access modifiers changed from: 0000 */
    public int getSize() {
        return this.nv.az() + getFrameSize();
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return dr().getWidth();
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void onFrameReady(DelayTarget delayTarget) {
        if (this.nE != null) {
            this.nE.dq();
        }
        this.nw = false;
        if (this.nA) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (!this.isRunning) {
            this.nD = delayTarget;
        } else {
            if (delayTarget.dw() != null) {
                dt();
                DelayTarget delayTarget2 = this.nz;
                this.nz = delayTarget;
                for (int size = this.callbacks.size() - 1; size >= 0; size--) {
                    ((a) this.callbacks.get(size)).dq();
                }
                if (delayTarget2 != null) {
                    this.handler.obtainMessage(2, delayTarget2).sendToTarget();
                }
            }
            ds();
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public void setOnEveryFrameReadyListener(@Nullable OnEveryFrameListener onEveryFrameListener) {
        this.nE = onEveryFrameListener;
    }
}

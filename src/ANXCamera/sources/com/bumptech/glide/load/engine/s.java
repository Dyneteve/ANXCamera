package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import com.bumptech.glide.util.k;

/* compiled from: ResourceRecycler */
class s {
    private boolean gX;
    private final Handler handler = new Handler(Looper.getMainLooper(), new a());

    /* compiled from: ResourceRecycler */
    private static final class a implements Callback {
        static final int gY = 1;

        a() {
        }

        public boolean handleMessage(Message message) {
            if (message.what != 1) {
                return false;
            }
            ((p) message.obj).recycle();
            return true;
        }
    }

    s() {
    }

    /* access modifiers changed from: 0000 */
    public void h(p<?> pVar) {
        k.eL();
        if (this.gX) {
            this.handler.obtainMessage(1, pVar).sendToTarget();
            return;
        }
        this.gX = true;
        pVar.recycle();
        this.gX = false;
    }
}

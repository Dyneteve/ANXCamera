package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.d.a;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.util.e;
import java.util.Collections;
import java.util.List;

/* compiled from: SourceGenerator */
class t implements a<Object>, d.a, d {
    private static final String TAG = "SourceGenerator";
    private final e<?> eF;
    private final d.a eG;
    private volatile m.a<?> eL;
    private int gY;
    private a gZ;
    private Object ha;
    private b hb;

    t(e<?> eVar, d.a aVar) {
        this.eF = eVar;
        this.eG = aVar;
    }

    private boolean at() {
        return this.gY < this.eF.aF().size();
    }

    /* JADX INFO: finally extract failed */
    private void m(Object obj) {
        long eK = e.eK();
        try {
            com.bumptech.glide.load.a d = this.eF.d(obj);
            c cVar = new c(d, obj, this.eF.az());
            this.hb = new b(this.eL.eI, this.eF.aA());
            this.eF.aw().a(this.hb, cVar);
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Finished encoding source to cache, key: ");
                sb.append(this.hb);
                sb.append(", data: ");
                sb.append(obj);
                sb.append(", encoder: ");
                sb.append(d);
                sb.append(", duration: ");
                sb.append(e.f(eK));
                Log.v(str, sb.toString());
            }
            this.eL.jX.cleanup();
            this.gZ = new a(Collections.singletonList(this.eL.eI), this.eF, this);
        } catch (Throwable th) {
            this.eL.jX.cleanup();
            throw th;
        }
    }

    public void a(c cVar, Exception exc, d<?> dVar, DataSource dataSource) {
        this.eG.a(cVar, exc, dVar, this.eL.jX.ak());
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.eG.a(cVar, obj, dVar, this.eL.jX.ak(), cVar);
    }

    public boolean as() {
        if (this.ha != null) {
            Object obj = this.ha;
            this.ha = null;
            m(obj);
        }
        if (this.gZ != null && this.gZ.as()) {
            return true;
        }
        this.gZ = null;
        this.eL = null;
        boolean z = false;
        while (!z && at()) {
            List aF = this.eF.aF();
            int i = this.gY;
            this.gY = i + 1;
            this.eL = (m.a) aF.get(i);
            if (this.eL != null && (this.eF.ax().b(this.eL.jX.ak()) || this.eF.c(this.eL.jX.aj()))) {
                this.eL.jX.a(this.eF.ay(), this);
                z = true;
            }
        }
        return z;
    }

    public void av() {
        throw new UnsupportedOperationException();
    }

    public void b(@NonNull Exception exc) {
        this.eG.a(this.hb, exc, this.eL.jX, this.eL.jX.ak());
    }

    public void cancel() {
        m.a<?> aVar = this.eL;
        if (aVar != null) {
            aVar.jX.cancel();
        }
    }

    public void k(Object obj) {
        g ax = this.eF.ax();
        if (obj == null || !ax.b(this.eL.jX.ak())) {
            this.eG.a(this.eL.eI, obj, this.eL.jX, this.eL.jX.ak(), this.hb);
            return;
        }
        this.ha = obj;
        this.eG.av();
    }
}

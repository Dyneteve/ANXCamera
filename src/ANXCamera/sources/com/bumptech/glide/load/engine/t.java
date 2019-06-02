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
    private final e<?> eH;
    private final d.a eI;
    private volatile m.a<?> eN;
    private int ha;
    private a hb;
    private Object hc;
    private b hd;

    t(e<?> eVar, d.a aVar) {
        this.eH = eVar;
        this.eI = aVar;
    }

    private boolean at() {
        return this.ha < this.eH.aF().size();
    }

    /* JADX INFO: finally extract failed */
    private void m(Object obj) {
        long eK = e.eK();
        try {
            com.bumptech.glide.load.a d = this.eH.d(obj);
            c cVar = new c(d, obj, this.eH.az());
            this.hd = new b(this.eN.eK, this.eH.aA());
            this.eH.aw().a(this.hd, cVar);
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Finished encoding source to cache, key: ");
                sb.append(this.hd);
                sb.append(", data: ");
                sb.append(obj);
                sb.append(", encoder: ");
                sb.append(d);
                sb.append(", duration: ");
                sb.append(e.f(eK));
                Log.v(str, sb.toString());
            }
            this.eN.jZ.cleanup();
            this.hb = new a(Collections.singletonList(this.eN.eK), this.eH, this);
        } catch (Throwable th) {
            this.eN.jZ.cleanup();
            throw th;
        }
    }

    public void a(c cVar, Exception exc, d<?> dVar, DataSource dataSource) {
        this.eI.a(cVar, exc, dVar, this.eN.jZ.ak());
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.eI.a(cVar, obj, dVar, this.eN.jZ.ak(), cVar);
    }

    public boolean as() {
        if (this.hc != null) {
            Object obj = this.hc;
            this.hc = null;
            m(obj);
        }
        if (this.hb != null && this.hb.as()) {
            return true;
        }
        this.hb = null;
        this.eN = null;
        boolean z = false;
        while (!z && at()) {
            List aF = this.eH.aF();
            int i = this.ha;
            this.ha = i + 1;
            this.eN = (m.a) aF.get(i);
            if (this.eN != null && (this.eH.ax().b(this.eN.jZ.ak()) || this.eH.c(this.eN.jZ.aj()))) {
                this.eN.jZ.a(this.eH.ay(), this);
                z = true;
            }
        }
        return z;
    }

    public void av() {
        throw new UnsupportedOperationException();
    }

    public void b(@NonNull Exception exc) {
        this.eI.a(this.hd, exc, this.eN.jZ, this.eN.jZ.ak());
    }

    public void cancel() {
        m.a<?> aVar = this.eN;
        if (aVar != null) {
            aVar.jZ.cancel();
        }
    }

    public void k(Object obj) {
        g ax = this.eH.ax();
        if (obj == null || !ax.b(this.eN.jZ.ak())) {
            this.eI.a(this.eN.eK, obj, this.eN.jZ, this.eN.jZ.ak(), this.hd);
            return;
        }
        this.hc = obj;
        this.eI.av();
    }
}

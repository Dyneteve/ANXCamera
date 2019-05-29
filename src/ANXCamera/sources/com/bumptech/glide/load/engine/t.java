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
    private final e<?> eG;
    private final d.a eH;
    private volatile m.a<?> eM;
    private int gZ;
    private a ha;
    private Object hb;
    private b hc;

    t(e<?> eVar, d.a aVar) {
        this.eG = eVar;
        this.eH = aVar;
    }

    private boolean at() {
        return this.gZ < this.eG.aF().size();
    }

    /* JADX INFO: finally extract failed */
    private void m(Object obj) {
        long eK = e.eK();
        try {
            com.bumptech.glide.load.a d = this.eG.d(obj);
            c cVar = new c(d, obj, this.eG.az());
            this.hc = new b(this.eM.eJ, this.eG.aA());
            this.eG.aw().a(this.hc, cVar);
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Finished encoding source to cache, key: ");
                sb.append(this.hc);
                sb.append(", data: ");
                sb.append(obj);
                sb.append(", encoder: ");
                sb.append(d);
                sb.append(", duration: ");
                sb.append(e.f(eK));
                Log.v(str, sb.toString());
            }
            this.eM.jY.cleanup();
            this.ha = new a(Collections.singletonList(this.eM.eJ), this.eG, this);
        } catch (Throwable th) {
            this.eM.jY.cleanup();
            throw th;
        }
    }

    public void a(c cVar, Exception exc, d<?> dVar, DataSource dataSource) {
        this.eH.a(cVar, exc, dVar, this.eM.jY.ak());
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.eH.a(cVar, obj, dVar, this.eM.jY.ak(), cVar);
    }

    public boolean as() {
        if (this.hb != null) {
            Object obj = this.hb;
            this.hb = null;
            m(obj);
        }
        if (this.ha != null && this.ha.as()) {
            return true;
        }
        this.ha = null;
        this.eM = null;
        boolean z = false;
        while (!z && at()) {
            List aF = this.eG.aF();
            int i = this.gZ;
            this.gZ = i + 1;
            this.eM = (m.a) aF.get(i);
            if (this.eM != null && (this.eG.ax().b(this.eM.jY.ak()) || this.eG.c(this.eM.jY.aj()))) {
                this.eM.jY.a(this.eG.ay(), this);
                z = true;
            }
        }
        return z;
    }

    public void av() {
        throw new UnsupportedOperationException();
    }

    public void b(@NonNull Exception exc) {
        this.eH.a(this.hc, exc, this.eM.jY, this.eM.jY.ak());
    }

    public void cancel() {
        m.a<?> aVar = this.eM;
        if (aVar != null) {
            aVar.jY.cancel();
        }
    }

    public void k(Object obj) {
        g ax = this.eG.ax();
        if (obj == null || !ax.b(this.eM.jY.ak())) {
            this.eH.a(this.eM.eJ, obj, this.eM.jY, this.eM.jY.ak(), this.hc);
            return;
        }
        this.hb = obj;
        this.eH.av();
    }
}

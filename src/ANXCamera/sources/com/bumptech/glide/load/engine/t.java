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
    private final e<?> fH;
    private final d.a fI;
    private volatile m.a<?> fN;
    private int ia;
    private a ib;
    private Object ic;
    private b ie;

    t(e<?> eVar, d.a aVar) {
        this.fH = eVar;
        this.fI = aVar;
    }

    private boolean aT() {
        return this.ia < this.fH.bf().size();
    }

    /* JADX INFO: finally extract failed */
    private void p(Object obj) {
        long fm = e.fm();
        try {
            com.bumptech.glide.load.a g = this.fH.g(obj);
            c cVar = new c(g, obj, this.fH.aZ());
            this.ie = new b(this.fN.fK, this.fH.ba());
            this.fH.aW().a(this.ie, cVar);
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Finished encoding source to cache, key: ");
                sb.append(this.ie);
                sb.append(", data: ");
                sb.append(obj);
                sb.append(", encoder: ");
                sb.append(g);
                sb.append(", duration: ");
                sb.append(e.f(fm));
                Log.v(str, sb.toString());
            }
            this.fN.kZ.cleanup();
            this.ib = new a(Collections.singletonList(this.fN.fK), this.fH, this);
        } catch (Throwable th) {
            this.fN.kZ.cleanup();
            throw th;
        }
    }

    public void a(c cVar, Exception exc, d<?> dVar, DataSource dataSource) {
        this.fI.a(cVar, exc, dVar, this.fN.kZ.aK());
    }

    public void a(c cVar, Object obj, d<?> dVar, DataSource dataSource, c cVar2) {
        this.fI.a(cVar, obj, dVar, this.fN.kZ.aK(), cVar);
    }

    public boolean aS() {
        if (this.ic != null) {
            Object obj = this.ic;
            this.ic = null;
            p(obj);
        }
        if (this.ib != null && this.ib.aS()) {
            return true;
        }
        this.ib = null;
        this.fN = null;
        boolean z = false;
        while (!z && aT()) {
            List bf = this.fH.bf();
            int i = this.ia;
            this.ia = i + 1;
            this.fN = (m.a) bf.get(i);
            if (this.fN != null && (this.fH.aX().b(this.fN.kZ.aK()) || this.fH.d(this.fN.kZ.aJ()))) {
                this.fN.kZ.a(this.fH.aY(), this);
                z = true;
            }
        }
        return z;
    }

    public void aV() {
        throw new UnsupportedOperationException();
    }

    public void b(@NonNull Exception exc) {
        this.fI.a(this.ie, exc, this.fN.kZ, this.fN.kZ.aK());
    }

    public void cancel() {
        m.a<?> aVar = this.fN;
        if (aVar != null) {
            aVar.kZ.cancel();
        }
    }

    public void n(Object obj) {
        g aX = this.fH.aX();
        if (obj == null || !aX.b(this.fN.kZ.aK())) {
            this.fI.a(this.fN.fK, obj, this.fN.kZ, this.fN.kZ.aK(), this.ie);
            return;
        }
        this.ic = obj;
        this.fI.aV();
    }
}

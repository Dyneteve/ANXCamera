package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: ResourceCacheGenerator */
class q implements a<Object>, d {
    private final e<?> fH;
    private final d.a fI;
    private int fJ;
    private c fK;
    private List<m<File, ?>> fL;
    private int fM;
    private volatile m.a<?> fN;
    private File fO;
    private int hT = -1;
    private r hU;

    q(e<?> eVar, d.a aVar) {
        this.fH = eVar;
        this.fI = aVar;
    }

    private boolean aT() {
        return this.fM < this.fL.size();
    }

    public boolean aS() {
        List bg = this.fH.bg();
        boolean z = false;
        if (bg.isEmpty()) {
            return false;
        }
        List bd = this.fH.bd();
        if (bd.isEmpty() && File.class.equals(this.fH.bb())) {
            return false;
        }
        while (true) {
            if (this.fL == null || !aT()) {
                this.hT++;
                if (this.hT >= bd.size()) {
                    this.fJ++;
                    if (this.fJ >= bg.size()) {
                        return false;
                    }
                    this.hT = 0;
                }
                c cVar = (c) bg.get(this.fJ);
                Class cls = (Class) bd.get(this.hT);
                c cVar2 = cVar;
                r rVar = new r(this.fH.L(), cVar2, this.fH.ba(), this.fH.getWidth(), this.fH.getHeight(), this.fH.f(cls), cls, this.fH.aZ());
                this.hU = rVar;
                this.fO = this.fH.aW().e(this.hU);
                if (this.fO != null) {
                    this.fK = cVar;
                    this.fL = this.fH.g(this.fO);
                    this.fM = 0;
                }
            } else {
                this.fN = null;
                while (!z && aT()) {
                    List<m<File, ?>> list = this.fL;
                    int i = this.fM;
                    this.fM = i + 1;
                    this.fN = ((m) list.get(i)).b(this.fO, this.fH.getWidth(), this.fH.getHeight(), this.fH.aZ());
                    if (this.fN != null && this.fH.d(this.fN.kZ.aJ())) {
                        this.fN.kZ.a(this.fH.aY(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    public void b(@NonNull Exception exc) {
        this.fI.a(this.hU, exc, this.fN.kZ, DataSource.RESOURCE_DISK_CACHE);
    }

    public void cancel() {
        m.a<?> aVar = this.fN;
        if (aVar != null) {
            aVar.kZ.cancel();
        }
    }

    public void n(Object obj) {
        this.fI.a(this.fK, obj, this.fN.kZ, DataSource.RESOURCE_DISK_CACHE, this.hU);
    }
}

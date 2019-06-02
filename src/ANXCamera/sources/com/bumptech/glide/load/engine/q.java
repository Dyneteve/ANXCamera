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
    private final e<?> eH;
    private final d.a eI;
    private int eJ;
    private c eK;
    private List<m<File, ?>> eL;
    private int eM;
    private volatile m.a<?> eN;
    private File eO;
    private int gT = -1;
    private r gU;

    q(e<?> eVar, d.a aVar) {
        this.eH = eVar;
        this.eI = aVar;
    }

    private boolean at() {
        return this.eM < this.eL.size();
    }

    public boolean as() {
        List aG = this.eH.aG();
        boolean z = false;
        if (aG.isEmpty()) {
            return false;
        }
        List aD = this.eH.aD();
        if (aD.isEmpty() && File.class.equals(this.eH.aB())) {
            return false;
        }
        while (true) {
            if (this.eL == null || !at()) {
                this.gT++;
                if (this.gT >= aD.size()) {
                    this.eJ++;
                    if (this.eJ >= aG.size()) {
                        return false;
                    }
                    this.gT = 0;
                }
                c cVar = (c) aG.get(this.eJ);
                Class cls = (Class) aD.get(this.gT);
                c cVar2 = cVar;
                r rVar = new r(this.eH.l(), cVar2, this.eH.aA(), this.eH.getWidth(), this.eH.getHeight(), this.eH.e(cls), cls, this.eH.az());
                this.gU = rVar;
                this.eO = this.eH.aw().e(this.gU);
                if (this.eO != null) {
                    this.eK = cVar;
                    this.eL = this.eH.g(this.eO);
                    this.eM = 0;
                }
            } else {
                this.eN = null;
                while (!z && at()) {
                    List<m<File, ?>> list = this.eL;
                    int i = this.eM;
                    this.eM = i + 1;
                    this.eN = ((m) list.get(i)).b(this.eO, this.eH.getWidth(), this.eH.getHeight(), this.eH.az());
                    if (this.eN != null && this.eH.c(this.eN.jZ.aj())) {
                        this.eN.jZ.a(this.eH.ay(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    public void b(@NonNull Exception exc) {
        this.eI.a(this.gU, exc, this.eN.jZ, DataSource.RESOURCE_DISK_CACHE);
    }

    public void cancel() {
        m.a<?> aVar = this.eN;
        if (aVar != null) {
            aVar.jZ.cancel();
        }
    }

    public void k(Object obj) {
        this.eI.a(this.eK, obj, this.eN.jZ, DataSource.RESOURCE_DISK_CACHE, this.gU);
    }
}

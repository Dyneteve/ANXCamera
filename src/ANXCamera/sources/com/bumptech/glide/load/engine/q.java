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
    private final e<?> eF;
    private final d.a eG;
    private int eH;
    private c eI;
    private List<m<File, ?>> eJ;
    private int eK;
    private volatile m.a<?> eL;
    private File eM;
    private int gR = -1;
    private r gS;

    q(e<?> eVar, d.a aVar) {
        this.eF = eVar;
        this.eG = aVar;
    }

    private boolean at() {
        return this.eK < this.eJ.size();
    }

    public boolean as() {
        List aG = this.eF.aG();
        boolean z = false;
        if (aG.isEmpty()) {
            return false;
        }
        List aD = this.eF.aD();
        if (aD.isEmpty() && File.class.equals(this.eF.aB())) {
            return false;
        }
        while (true) {
            if (this.eJ == null || !at()) {
                this.gR++;
                if (this.gR >= aD.size()) {
                    this.eH++;
                    if (this.eH >= aG.size()) {
                        return false;
                    }
                    this.gR = 0;
                }
                c cVar = (c) aG.get(this.eH);
                Class cls = (Class) aD.get(this.gR);
                c cVar2 = cVar;
                r rVar = new r(this.eF.l(), cVar2, this.eF.aA(), this.eF.getWidth(), this.eF.getHeight(), this.eF.e(cls), cls, this.eF.az());
                this.gS = rVar;
                this.eM = this.eF.aw().e(this.gS);
                if (this.eM != null) {
                    this.eI = cVar;
                    this.eJ = this.eF.g(this.eM);
                    this.eK = 0;
                }
            } else {
                this.eL = null;
                while (!z && at()) {
                    List<m<File, ?>> list = this.eJ;
                    int i = this.eK;
                    this.eK = i + 1;
                    this.eL = ((m) list.get(i)).b(this.eM, this.eF.getWidth(), this.eF.getHeight(), this.eF.az());
                    if (this.eL != null && this.eF.c(this.eL.jX.aj())) {
                        this.eL.jX.a(this.eF.ay(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    public void b(@NonNull Exception exc) {
        this.eG.a(this.gS, exc, this.eL.jX, DataSource.RESOURCE_DISK_CACHE);
    }

    public void cancel() {
        m.a<?> aVar = this.eL;
        if (aVar != null) {
            aVar.jX.cancel();
        }
    }

    public void k(Object obj) {
        this.eG.a(this.eI, obj, this.eL.jX, DataSource.RESOURCE_DISK_CACHE, this.gS);
    }
}

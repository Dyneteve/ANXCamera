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
    private final e<?> eG;
    private final d.a eH;
    private int eI;
    private c eJ;
    private List<m<File, ?>> eK;
    private int eL;
    private volatile m.a<?> eM;
    private File eN;
    private int gS = -1;
    private r gT;

    q(e<?> eVar, d.a aVar) {
        this.eG = eVar;
        this.eH = aVar;
    }

    private boolean at() {
        return this.eL < this.eK.size();
    }

    public boolean as() {
        List aG = this.eG.aG();
        boolean z = false;
        if (aG.isEmpty()) {
            return false;
        }
        List aD = this.eG.aD();
        if (aD.isEmpty() && File.class.equals(this.eG.aB())) {
            return false;
        }
        while (true) {
            if (this.eK == null || !at()) {
                this.gS++;
                if (this.gS >= aD.size()) {
                    this.eI++;
                    if (this.eI >= aG.size()) {
                        return false;
                    }
                    this.gS = 0;
                }
                c cVar = (c) aG.get(this.eI);
                Class cls = (Class) aD.get(this.gS);
                c cVar2 = cVar;
                r rVar = new r(this.eG.l(), cVar2, this.eG.aA(), this.eG.getWidth(), this.eG.getHeight(), this.eG.e(cls), cls, this.eG.az());
                this.gT = rVar;
                this.eN = this.eG.aw().e(this.gT);
                if (this.eN != null) {
                    this.eJ = cVar;
                    this.eK = this.eG.g(this.eN);
                    this.eL = 0;
                }
            } else {
                this.eM = null;
                while (!z && at()) {
                    List<m<File, ?>> list = this.eK;
                    int i = this.eL;
                    this.eL = i + 1;
                    this.eM = ((m) list.get(i)).b(this.eN, this.eG.getWidth(), this.eG.getHeight(), this.eG.az());
                    if (this.eM != null && this.eG.c(this.eM.jY.aj())) {
                        this.eM.jY.a(this.eG.ay(), this);
                        z = true;
                    }
                }
                return z;
            }
        }
    }

    public void b(@NonNull Exception exc) {
        this.eH.a(this.gT, exc, this.eM.jY, DataSource.RESOURCE_DISK_CACHE);
    }

    public void cancel() {
        m.a<?> aVar = this.eM;
        if (aVar != null) {
            aVar.jY.cancel();
        }
    }

    public void k(Object obj) {
        this.eH.a(this.eJ, obj, this.eM.jY, DataSource.RESOURCE_DISK_CACHE, this.gT);
    }
}

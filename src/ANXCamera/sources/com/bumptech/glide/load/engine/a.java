package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> eE;
    private final e<?> eF;
    private final com.bumptech.glide.load.engine.d.a eG;
    private int eH;
    private c eI;
    private List<m<File, ?>> eJ;
    private int eK;
    private volatile com.bumptech.glide.load.model.m.a<?> eL;
    private File eM;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.aG(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.eH = -1;
        this.eE = list;
        this.eF = eVar;
        this.eG = aVar;
    }

    private boolean at() {
        return this.eK < this.eJ.size();
    }

    public boolean as() {
        while (true) {
            boolean z = false;
            if (this.eJ == null || !at()) {
                this.eH++;
                if (this.eH >= this.eE.size()) {
                    return false;
                }
                c cVar = (c) this.eE.get(this.eH);
                this.eM = this.eF.aw().e(new b(cVar, this.eF.aA()));
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
        this.eG.a(this.eI, exc, this.eL.jX, DataSource.DATA_DISK_CACHE);
    }

    public void cancel() {
        com.bumptech.glide.load.model.m.a<?> aVar = this.eL;
        if (aVar != null) {
            aVar.jX.cancel();
        }
    }

    public void k(Object obj) {
        this.eG.a(this.eI, obj, this.eL.jX, DataSource.DATA_DISK_CACHE, this.eI);
    }
}

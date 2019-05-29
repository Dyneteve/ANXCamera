package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> eF;
    private final e<?> eG;
    private final com.bumptech.glide.load.engine.d.a eH;
    private int eI;
    private c eJ;
    private List<m<File, ?>> eK;
    private int eL;
    private volatile com.bumptech.glide.load.model.m.a<?> eM;
    private File eN;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.aG(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.eI = -1;
        this.eF = list;
        this.eG = eVar;
        this.eH = aVar;
    }

    private boolean at() {
        return this.eL < this.eK.size();
    }

    public boolean as() {
        while (true) {
            boolean z = false;
            if (this.eK == null || !at()) {
                this.eI++;
                if (this.eI >= this.eF.size()) {
                    return false;
                }
                c cVar = (c) this.eF.get(this.eI);
                this.eN = this.eG.aw().e(new b(cVar, this.eG.aA()));
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
        this.eH.a(this.eJ, exc, this.eM.jY, DataSource.DATA_DISK_CACHE);
    }

    public void cancel() {
        com.bumptech.glide.load.model.m.a<?> aVar = this.eM;
        if (aVar != null) {
            aVar.jY.cancel();
        }
    }

    public void k(Object obj) {
        this.eH.a(this.eJ, obj, this.eM.jY, DataSource.DATA_DISK_CACHE, this.eJ);
    }
}

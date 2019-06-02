package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> eG;
    private final e<?> eH;
    private final com.bumptech.glide.load.engine.d.a eI;
    private int eJ;
    private c eK;
    private List<m<File, ?>> eL;
    private int eM;
    private volatile com.bumptech.glide.load.model.m.a<?> eN;
    private File eO;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.aG(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.eJ = -1;
        this.eG = list;
        this.eH = eVar;
        this.eI = aVar;
    }

    private boolean at() {
        return this.eM < this.eL.size();
    }

    public boolean as() {
        while (true) {
            boolean z = false;
            if (this.eL == null || !at()) {
                this.eJ++;
                if (this.eJ >= this.eG.size()) {
                    return false;
                }
                c cVar = (c) this.eG.get(this.eJ);
                this.eO = this.eH.aw().e(new b(cVar, this.eH.aA()));
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
        this.eI.a(this.eK, exc, this.eN.jZ, DataSource.DATA_DISK_CACHE);
    }

    public void cancel() {
        com.bumptech.glide.load.model.m.a<?> aVar = this.eN;
        if (aVar != null) {
            aVar.jZ.cancel();
        }
    }

    public void k(Object obj) {
        this.eI.a(this.eK, obj, this.eN.jZ, DataSource.DATA_DISK_CACHE, this.eK);
    }
}

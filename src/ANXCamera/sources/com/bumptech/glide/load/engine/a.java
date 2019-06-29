package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.model.m;
import java.io.File;
import java.util.List;

/* compiled from: DataCacheGenerator */
class a implements com.bumptech.glide.load.a.d.a<Object>, d {
    private final List<c> fG;
    private final e<?> fH;
    private final com.bumptech.glide.load.engine.d.a fI;
    private int fJ;
    private c fK;
    private List<m<File, ?>> fL;
    private int fM;
    private volatile com.bumptech.glide.load.model.m.a<?> fN;
    private File fO;

    a(e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this(eVar.bg(), eVar, aVar);
    }

    a(List<c> list, e<?> eVar, com.bumptech.glide.load.engine.d.a aVar) {
        this.fJ = -1;
        this.fG = list;
        this.fH = eVar;
        this.fI = aVar;
    }

    private boolean aT() {
        return this.fM < this.fL.size();
    }

    public boolean aS() {
        while (true) {
            boolean z = false;
            if (this.fL == null || !aT()) {
                this.fJ++;
                if (this.fJ >= this.fG.size()) {
                    return false;
                }
                c cVar = (c) this.fG.get(this.fJ);
                this.fO = this.fH.aW().e(new b(cVar, this.fH.ba()));
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
        this.fI.a(this.fK, exc, this.fN.kZ, DataSource.DATA_DISK_CACHE);
    }

    public void cancel() {
        com.bumptech.glide.load.model.m.a<?> aVar = this.fN;
        if (aVar != null) {
            aVar.kZ.cancel();
        }
    }

    public void n(Object obj) {
        this.fI.a(this.fK, obj, this.fN.kZ, DataSource.DATA_DISK_CACHE, this.fK);
    }
}

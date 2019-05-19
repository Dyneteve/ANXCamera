package com.bumptech.glide.load.engine;

import com.bumptech.glide.Priority;
import com.bumptech.glide.Registry.NoModelLoaderAvailableException;
import com.bumptech.glide.Registry.NoSourceEncoderAvailableException;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.m.a;
import com.bumptech.glide.load.resource.b;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: DecodeHelper */
final class e<Transcode> {
    private com.bumptech.glide.e an;
    private Class<Transcode> bq;
    private Object bt;
    private final List<c> eE = new ArrayList();
    private c eN;
    private f eP;
    private final List<a<?>> eQ = new ArrayList();
    private Class<?> eR;
    private d eS;
    private Map<Class<?>, i<?>> eT;
    private boolean eU;
    private boolean eV;
    private Priority eW;
    private g eX;
    private boolean eY;
    private boolean eZ;
    private int height;
    private int width;

    e() {
    }

    /* access modifiers changed from: 0000 */
    public <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.an = eVar;
        this.bt = obj;
        this.eN = cVar;
        this.width = i;
        this.height = i2;
        this.eX = gVar;
        this.eR = cls;
        this.eS = dVar;
        this.bq = cls2;
        this.eW = priority;
        this.eP = fVar;
        this.eT = map;
        this.eY = z;
        this.eZ = z2;
    }

    /* access modifiers changed from: 0000 */
    public boolean a(p<?> pVar) {
        return this.an.r().a(pVar);
    }

    /* access modifiers changed from: 0000 */
    public c aA() {
        return this.eN;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aB() {
        return this.bq;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aC() {
        return this.bt.getClass();
    }

    /* access modifiers changed from: 0000 */
    public List<Class<?>> aD() {
        return this.an.r().c(this.bt.getClass(), this.eR, this.bq);
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.eZ;
    }

    /* access modifiers changed from: 0000 */
    public List<a<?>> aF() {
        if (!this.eU) {
            this.eU = true;
            this.eQ.clear();
            List f = this.an.r().f(this.bt);
            int size = f.size();
            for (int i = 0; i < size; i++) {
                a b = ((m) f.get(i)).b(this.bt, this.width, this.height, this.eP);
                if (b != null) {
                    this.eQ.add(b);
                }
            }
        }
        return this.eQ;
    }

    /* access modifiers changed from: 0000 */
    public List<c> aG() {
        if (!this.eV) {
            this.eV = true;
            this.eE.clear();
            List aF = aF();
            int size = aF.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) aF.get(i);
                if (!this.eE.contains(aVar.eI)) {
                    this.eE.add(aVar.eI);
                }
                for (int i2 = 0; i2 < aVar.jW.size(); i2++) {
                    if (!this.eE.contains(aVar.jW.get(i2))) {
                        this.eE.add(aVar.jW.get(i2));
                    }
                }
            }
        }
        return this.eE;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.engine.a.a aw() {
        return this.eS.aw();
    }

    /* access modifiers changed from: 0000 */
    public g ax() {
        return this.eX;
    }

    /* access modifiers changed from: 0000 */
    public Priority ay() {
        return this.eW;
    }

    /* access modifiers changed from: 0000 */
    public f az() {
        return this.eP;
    }

    /* access modifiers changed from: 0000 */
    public <Z> h<Z> b(p<Z> pVar) {
        return this.an.r().b(pVar);
    }

    /* access modifiers changed from: 0000 */
    public boolean c(c cVar) {
        List aF = aF();
        int size = aF.size();
        for (int i = 0; i < size; i++) {
            if (((a) aF.get(i)).eI.equals(cVar)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public boolean c(Class<?> cls) {
        return d(cls) != null;
    }

    /* access modifiers changed from: 0000 */
    public void clear() {
        this.an = null;
        this.bt = null;
        this.eN = null;
        this.eR = null;
        this.bq = null;
        this.eP = null;
        this.eW = null;
        this.eT = null;
        this.eX = null;
        this.eQ.clear();
        this.eU = false;
        this.eE.clear();
        this.eV = false;
    }

    /* access modifiers changed from: 0000 */
    public <X> com.bumptech.glide.load.a<X> d(X x) throws NoSourceEncoderAvailableException {
        return this.an.r().d(x);
    }

    /* access modifiers changed from: 0000 */
    public <Data> n<Data, ?, Transcode> d(Class<Data> cls) {
        return this.an.r().a(cls, this.eR, this.bq);
    }

    /* access modifiers changed from: 0000 */
    public <Z> i<Z> e(Class<Z> cls) {
        i<Z> iVar = (i) this.eT.get(cls);
        if (iVar == null) {
            Iterator it = this.eT.entrySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Entry entry = (Entry) it.next();
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    iVar = (i) entry.getValue();
                    break;
                }
            }
        }
        if (iVar != null) {
            return iVar;
        }
        if (!this.eT.isEmpty() || !this.eY) {
            return b.cm();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Missing transformation for ");
        sb.append(cls);
        sb.append(". If you wish to ignore unknown resource types, use the optional transformation methods.");
        throw new IllegalArgumentException(sb.toString());
    }

    /* access modifiers changed from: 0000 */
    public List<m<File, ?>> g(File file) throws NoModelLoaderAvailableException {
        return this.an.r().f(file);
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return this.height;
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return this.width;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.engine.bitmap_recycle.b l() {
        return this.an.l();
    }
}

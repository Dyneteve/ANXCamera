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
    private com.bumptech.glide.e ap;
    private Class<Transcode> bs;
    private Object bv;
    private final List<c> eG = new ArrayList();
    private c eP;
    private f eR;
    private final List<a<?>> eS = new ArrayList();
    private Class<?> eT;
    private d eU;
    private Map<Class<?>, i<?>> eV;
    private boolean eW;
    private boolean eX;
    private Priority eY;
    private g eZ;
    private boolean fa;
    private boolean fb;
    private int height;
    private int width;

    e() {
    }

    /* access modifiers changed from: 0000 */
    public <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.ap = eVar;
        this.bv = obj;
        this.eP = cVar;
        this.width = i;
        this.height = i2;
        this.eZ = gVar;
        this.eT = cls;
        this.eU = dVar;
        this.bs = cls2;
        this.eY = priority;
        this.eR = fVar;
        this.eV = map;
        this.fa = z;
        this.fb = z2;
    }

    /* access modifiers changed from: 0000 */
    public boolean a(p<?> pVar) {
        return this.ap.r().a(pVar);
    }

    /* access modifiers changed from: 0000 */
    public c aA() {
        return this.eP;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aB() {
        return this.bs;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aC() {
        return this.bv.getClass();
    }

    /* access modifiers changed from: 0000 */
    public List<Class<?>> aD() {
        return this.ap.r().c(this.bv.getClass(), this.eT, this.bs);
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.fb;
    }

    /* access modifiers changed from: 0000 */
    public List<a<?>> aF() {
        if (!this.eW) {
            this.eW = true;
            this.eS.clear();
            List f = this.ap.r().f(this.bv);
            int size = f.size();
            for (int i = 0; i < size; i++) {
                a b = ((m) f.get(i)).b(this.bv, this.width, this.height, this.eR);
                if (b != null) {
                    this.eS.add(b);
                }
            }
        }
        return this.eS;
    }

    /* access modifiers changed from: 0000 */
    public List<c> aG() {
        if (!this.eX) {
            this.eX = true;
            this.eG.clear();
            List aF = aF();
            int size = aF.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) aF.get(i);
                if (!this.eG.contains(aVar.eK)) {
                    this.eG.add(aVar.eK);
                }
                for (int i2 = 0; i2 < aVar.jY.size(); i2++) {
                    if (!this.eG.contains(aVar.jY.get(i2))) {
                        this.eG.add(aVar.jY.get(i2));
                    }
                }
            }
        }
        return this.eG;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.engine.a.a aw() {
        return this.eU.aw();
    }

    /* access modifiers changed from: 0000 */
    public g ax() {
        return this.eZ;
    }

    /* access modifiers changed from: 0000 */
    public Priority ay() {
        return this.eY;
    }

    /* access modifiers changed from: 0000 */
    public f az() {
        return this.eR;
    }

    /* access modifiers changed from: 0000 */
    public <Z> h<Z> b(p<Z> pVar) {
        return this.ap.r().b(pVar);
    }

    /* access modifiers changed from: 0000 */
    public boolean c(c cVar) {
        List aF = aF();
        int size = aF.size();
        for (int i = 0; i < size; i++) {
            if (((a) aF.get(i)).eK.equals(cVar)) {
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
        this.ap = null;
        this.bv = null;
        this.eP = null;
        this.eT = null;
        this.bs = null;
        this.eR = null;
        this.eY = null;
        this.eV = null;
        this.eZ = null;
        this.eS.clear();
        this.eW = false;
        this.eG.clear();
        this.eX = false;
    }

    /* access modifiers changed from: 0000 */
    public <X> com.bumptech.glide.load.a<X> d(X x) throws NoSourceEncoderAvailableException {
        return this.ap.r().d(x);
    }

    /* access modifiers changed from: 0000 */
    public <Data> n<Data, ?, Transcode> d(Class<Data> cls) {
        return this.ap.r().a(cls, this.eT, this.bs);
    }

    /* access modifiers changed from: 0000 */
    public <Z> i<Z> e(Class<Z> cls) {
        i<Z> iVar = (i) this.eV.get(cls);
        if (iVar == null) {
            Iterator it = this.eV.entrySet().iterator();
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
        if (!this.eV.isEmpty() || !this.fa) {
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
        return this.ap.r().f(file);
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
        return this.ap.l();
    }
}

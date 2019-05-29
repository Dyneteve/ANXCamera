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
    private com.bumptech.glide.e ao;
    private Class<Transcode> br;
    private Object bu;
    private final List<c> eF = new ArrayList();
    private c eO;
    private f eQ;
    private final List<a<?>> eR = new ArrayList();
    private Class<?> eS;
    private d eT;
    private Map<Class<?>, i<?>> eU;
    private boolean eV;
    private boolean eW;
    private Priority eX;
    private g eY;
    private boolean eZ;
    private boolean fa;
    private int height;
    private int width;

    e() {
    }

    /* access modifiers changed from: 0000 */
    public <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.ao = eVar;
        this.bu = obj;
        this.eO = cVar;
        this.width = i;
        this.height = i2;
        this.eY = gVar;
        this.eS = cls;
        this.eT = dVar;
        this.br = cls2;
        this.eX = priority;
        this.eQ = fVar;
        this.eU = map;
        this.eZ = z;
        this.fa = z2;
    }

    /* access modifiers changed from: 0000 */
    public boolean a(p<?> pVar) {
        return this.ao.r().a(pVar);
    }

    /* access modifiers changed from: 0000 */
    public c aA() {
        return this.eO;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aB() {
        return this.br;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> aC() {
        return this.bu.getClass();
    }

    /* access modifiers changed from: 0000 */
    public List<Class<?>> aD() {
        return this.ao.r().c(this.bu.getClass(), this.eS, this.br);
    }

    /* access modifiers changed from: 0000 */
    public boolean aE() {
        return this.fa;
    }

    /* access modifiers changed from: 0000 */
    public List<a<?>> aF() {
        if (!this.eV) {
            this.eV = true;
            this.eR.clear();
            List f = this.ao.r().f(this.bu);
            int size = f.size();
            for (int i = 0; i < size; i++) {
                a b = ((m) f.get(i)).b(this.bu, this.width, this.height, this.eQ);
                if (b != null) {
                    this.eR.add(b);
                }
            }
        }
        return this.eR;
    }

    /* access modifiers changed from: 0000 */
    public List<c> aG() {
        if (!this.eW) {
            this.eW = true;
            this.eF.clear();
            List aF = aF();
            int size = aF.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) aF.get(i);
                if (!this.eF.contains(aVar.eJ)) {
                    this.eF.add(aVar.eJ);
                }
                for (int i2 = 0; i2 < aVar.jX.size(); i2++) {
                    if (!this.eF.contains(aVar.jX.get(i2))) {
                        this.eF.add(aVar.jX.get(i2));
                    }
                }
            }
        }
        return this.eF;
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.engine.a.a aw() {
        return this.eT.aw();
    }

    /* access modifiers changed from: 0000 */
    public g ax() {
        return this.eY;
    }

    /* access modifiers changed from: 0000 */
    public Priority ay() {
        return this.eX;
    }

    /* access modifiers changed from: 0000 */
    public f az() {
        return this.eQ;
    }

    /* access modifiers changed from: 0000 */
    public <Z> h<Z> b(p<Z> pVar) {
        return this.ao.r().b(pVar);
    }

    /* access modifiers changed from: 0000 */
    public boolean c(c cVar) {
        List aF = aF();
        int size = aF.size();
        for (int i = 0; i < size; i++) {
            if (((a) aF.get(i)).eJ.equals(cVar)) {
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
        this.ao = null;
        this.bu = null;
        this.eO = null;
        this.eS = null;
        this.br = null;
        this.eQ = null;
        this.eX = null;
        this.eU = null;
        this.eY = null;
        this.eR.clear();
        this.eV = false;
        this.eF.clear();
        this.eW = false;
    }

    /* access modifiers changed from: 0000 */
    public <X> com.bumptech.glide.load.a<X> d(X x) throws NoSourceEncoderAvailableException {
        return this.ao.r().d(x);
    }

    /* access modifiers changed from: 0000 */
    public <Data> n<Data, ?, Transcode> d(Class<Data> cls) {
        return this.ao.r().a(cls, this.eS, this.br);
    }

    /* access modifiers changed from: 0000 */
    public <Z> i<Z> e(Class<Z> cls) {
        i<Z> iVar = (i) this.eU.get(cls);
        if (iVar == null) {
            Iterator it = this.eU.entrySet().iterator();
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
        if (!this.eU.isEmpty() || !this.eZ) {
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
        return this.ao.r().f(file);
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
        return this.ao.l();
    }
}

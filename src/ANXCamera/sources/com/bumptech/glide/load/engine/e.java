package com.bumptech.glide.load.engine;

import com.bumptech.glide.Priority;
import com.bumptech.glide.Registry.NoModelLoaderAvailableException;
import com.bumptech.glide.Registry.NoSourceEncoderAvailableException;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.m.a;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: DecodeHelper */
final class e<Transcode> {
    private com.bumptech.glide.e bp;
    private Class<Transcode> cv;
    private Object cy;
    private final List<c> fG = new ArrayList();
    private c fP;
    private f fR;
    private final List<a<?>> fS = new ArrayList();
    private Class<?> fT;
    private d fU;
    private Map<Class<?>, i<?>> fV;
    private boolean fW;
    private boolean fX;
    private Priority fY;
    private g fZ;
    private boolean ga;
    private boolean gb;
    private int height;
    private int width;

    e() {
    }

    /* access modifiers changed from: 0000 */
    public b L() {
        return this.bp.L();
    }

    /* access modifiers changed from: 0000 */
    public <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.bp = eVar;
        this.cy = obj;
        this.fP = cVar;
        this.width = i;
        this.height = i2;
        this.fZ = gVar;
        this.fT = cls;
        this.fU = dVar;
        this.cv = cls2;
        this.fY = priority;
        this.fR = fVar;
        this.fV = map;
        this.ga = z;
        this.gb = z2;
    }

    /* access modifiers changed from: 0000 */
    public boolean a(p<?> pVar) {
        return this.bp.R().a(pVar);
    }

    /* access modifiers changed from: 0000 */
    public com.bumptech.glide.load.engine.a.a aW() {
        return this.fU.aW();
    }

    /* access modifiers changed from: 0000 */
    public g aX() {
        return this.fZ;
    }

    /* access modifiers changed from: 0000 */
    public Priority aY() {
        return this.fY;
    }

    /* access modifiers changed from: 0000 */
    public f aZ() {
        return this.fR;
    }

    /* access modifiers changed from: 0000 */
    public <Z> h<Z> b(p<Z> pVar) {
        return this.bp.R().b(pVar);
    }

    /* access modifiers changed from: 0000 */
    public c ba() {
        return this.fP;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> bb() {
        return this.cv;
    }

    /* access modifiers changed from: 0000 */
    public Class<?> bc() {
        return this.cy.getClass();
    }

    /* access modifiers changed from: 0000 */
    public List<Class<?>> bd() {
        return this.bp.R().c(this.cy.getClass(), this.fT, this.cv);
    }

    /* access modifiers changed from: 0000 */
    public boolean be() {
        return this.gb;
    }

    /* access modifiers changed from: 0000 */
    public List<a<?>> bf() {
        if (!this.fW) {
            this.fW = true;
            this.fS.clear();
            List i = this.bp.R().i(this.cy);
            int size = i.size();
            for (int i2 = 0; i2 < size; i2++) {
                a b = ((m) i.get(i2)).b(this.cy, this.width, this.height, this.fR);
                if (b != null) {
                    this.fS.add(b);
                }
            }
        }
        return this.fS;
    }

    /* access modifiers changed from: 0000 */
    public List<c> bg() {
        if (!this.fX) {
            this.fX = true;
            this.fG.clear();
            List bf = bf();
            int size = bf.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) bf.get(i);
                if (!this.fG.contains(aVar.fK)) {
                    this.fG.add(aVar.fK);
                }
                for (int i2 = 0; i2 < aVar.kY.size(); i2++) {
                    if (!this.fG.contains(aVar.kY.get(i2))) {
                        this.fG.add(aVar.kY.get(i2));
                    }
                }
            }
        }
        return this.fG;
    }

    /* access modifiers changed from: 0000 */
    public boolean c(c cVar) {
        List bf = bf();
        int size = bf.size();
        for (int i = 0; i < size; i++) {
            if (((a) bf.get(i)).fK.equals(cVar)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public void clear() {
        this.bp = null;
        this.cy = null;
        this.fP = null;
        this.fT = null;
        this.cv = null;
        this.fR = null;
        this.fY = null;
        this.fV = null;
        this.fZ = null;
        this.fS.clear();
        this.fW = false;
        this.fG.clear();
        this.fX = false;
    }

    /* access modifiers changed from: 0000 */
    public boolean d(Class<?> cls) {
        return e(cls) != null;
    }

    /* access modifiers changed from: 0000 */
    public <Data> n<Data, ?, Transcode> e(Class<Data> cls) {
        return this.bp.R().a(cls, this.fT, this.cv);
    }

    /* access modifiers changed from: 0000 */
    public <Z> i<Z> f(Class<Z> cls) {
        i<Z> iVar = (i) this.fV.get(cls);
        if (iVar == null) {
            Iterator it = this.fV.entrySet().iterator();
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
        if (!this.fV.isEmpty() || !this.ga) {
            return com.bumptech.glide.load.resource.b.cO();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Missing transformation for ");
        sb.append(cls);
        sb.append(". If you wish to ignore unknown resource types, use the optional transformation methods.");
        throw new IllegalArgumentException(sb.toString());
    }

    /* access modifiers changed from: 0000 */
    public <X> com.bumptech.glide.load.a<X> g(X x) throws NoSourceEncoderAvailableException {
        return this.bp.R().g(x);
    }

    /* access modifiers changed from: 0000 */
    public List<m<File, ?>> g(File file) throws NoModelLoaderAvailableException {
        return this.bp.R().i(file);
    }

    /* access modifiers changed from: 0000 */
    public int getHeight() {
        return this.height;
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return this.width;
    }
}

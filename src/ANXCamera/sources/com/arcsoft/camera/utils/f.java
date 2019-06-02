package com.arcsoft.camera.utils;

/* compiled from: MSize */
public class f implements Comparable<f> {
    private int a;
    private int b;

    public f() {
    }

    public f(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    /* renamed from: a */
    public int b(f fVar) {
        if (fVar == null) {
            return 1;
        }
        return this.a == fVar.a ? this.b - fVar.b : this.a - fVar.a;
    }

    public String a() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(this.a);
        sb.append(",");
        sb.append(this.b);
        sb.append("]");
        return new String(sb.toString());
    }

    public boolean a(int i, int i2) {
        return this.a == i && this.b == i2;
    }

    public boolean a(Object obj) {
        if (this == obj) {
            return true;
        }
        boolean z = false;
        if (obj == null || !(obj instanceof f)) {
            return false;
        }
        if (obj != null) {
            f fVar = (f) obj;
            z = a(fVar.a, fVar.b);
        }
        return z;
    }

    public int b() {
        return (this.a * 31) + this.b;
    }
}

package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> pZ;
    private Class<?> qa;
    private Class<?> qb;

    public h() {
    }

    public h(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        j(cls, cls2);
    }

    public h(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        f(cls, cls2, cls3);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        h hVar = (h) obj;
        return this.pZ.equals(hVar.pZ) && this.qa.equals(hVar.qa) && k.c(this.qb, hVar.qb);
    }

    public void f(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        this.pZ = cls;
        this.qa = cls2;
        this.qb = cls3;
    }

    public int hashCode() {
        return (31 * ((this.pZ.hashCode() * 31) + this.qa.hashCode())) + (this.qb != null ? this.qb.hashCode() : 0);
    }

    public void j(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        f(cls, cls2, null);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiClassKey{first=");
        sb.append(this.pZ);
        sb.append(", second=");
        sb.append(this.qa);
        sb.append('}');
        return sb.toString();
    }
}

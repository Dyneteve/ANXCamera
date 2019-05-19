package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> pX;
    private Class<?> pY;
    private Class<?> pZ;

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
        return this.pX.equals(hVar.pX) && this.pY.equals(hVar.pY) && k.c(this.pZ, hVar.pZ);
    }

    public void f(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        this.pX = cls;
        this.pY = cls2;
        this.pZ = cls3;
    }

    public int hashCode() {
        return (31 * ((this.pX.hashCode() * 31) + this.pY.hashCode())) + (this.pZ != null ? this.pZ.hashCode() : 0);
    }

    public void j(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        f(cls, cls2, null);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiClassKey{first=");
        sb.append(this.pX);
        sb.append(", second=");
        sb.append(this.pY);
        sb.append('}');
        return sb.toString();
    }
}

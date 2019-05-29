package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> pY;
    private Class<?> pZ;
    private Class<?> qa;

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
        return this.pY.equals(hVar.pY) && this.pZ.equals(hVar.pZ) && k.c(this.qa, hVar.qa);
    }

    public void f(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        this.pY = cls;
        this.pZ = cls2;
        this.qa = cls3;
    }

    public int hashCode() {
        return (31 * ((this.pY.hashCode() * 31) + this.pZ.hashCode())) + (this.qa != null ? this.qa.hashCode() : 0);
    }

    public void j(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        f(cls, cls2, null);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiClassKey{first=");
        sb.append(this.pY);
        sb.append(", second=");
        sb.append(this.pZ);
        sb.append('}');
        return sb.toString();
    }
}

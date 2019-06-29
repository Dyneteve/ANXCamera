package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> qZ;
    private Class<?> ra;
    private Class<?> rb;

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
        return this.qZ.equals(hVar.qZ) && this.ra.equals(hVar.ra) && k.d(this.rb, hVar.rb);
    }

    public void f(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        this.qZ = cls;
        this.ra = cls2;
        this.rb = cls3;
    }

    public int hashCode() {
        return (31 * ((this.qZ.hashCode() * 31) + this.ra.hashCode())) + (this.rb != null ? this.rb.hashCode() : 0);
    }

    public void j(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        f(cls, cls2, null);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiClassKey{first=");
        sb.append(this.qZ);
        sb.append(", second=");
        sb.append(this.ra);
        sb.append('}');
        return sb.toString();
    }
}

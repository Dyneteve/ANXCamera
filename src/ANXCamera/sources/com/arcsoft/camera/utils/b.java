package com.arcsoft.camera.utils;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

/* compiled from: MPoint */
public class b implements Parcelable {
    public static final Creator<b> W = new Creator() {
        /* renamed from: b */
        public b c(Parcel parcel) {
            b bVar = new b();
            bVar.a(parcel);
            return bVar;
        }

        /* renamed from: c */
        public b[] d(int i) {
            return new b[i];
        }
    };
    public int a;
    public int b;

    public b() {
    }

    public b(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public b(b bVar) {
        this.a = bVar.a;
        this.b = bVar.b;
    }

    public int a() {
        return 0;
    }

    public void a(Parcel parcel) {
        this.a = parcel.readInt();
        this.b = parcel.readInt();
    }

    public void a(Parcel parcel, int i) {
        parcel.writeInt(this.a);
        parcel.writeInt(this.b);
    }

    public final boolean a(int i, int i2) {
        return this.a == i && this.b == i2;
    }

    public boolean a(Object obj) {
        if (this != obj) {
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            b bVar = (b) obj;
            if (!(this.a == bVar.a && this.b == bVar.b)) {
                return false;
            }
        }
        return true;
    }

    public int b() {
        return (31 * this.a) + this.b;
    }

    public final void b(int i, int i2) {
        this.a += i;
        this.b += i2;
    }

    public final void c() {
        this.a = -this.a;
        this.b = -this.b;
    }

    public void c(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public String d() {
        StringBuilder sb = new StringBuilder();
        sb.append("Point(");
        sb.append(this.a);
        sb.append(", ");
        sb.append(this.b);
        sb.append(")");
        return sb.toString();
    }
}

package com.bumptech.glide.load.engine.a;

import com.bumptech.glide.load.engine.a.a.C0003a;
import java.io.File;

/* compiled from: DiskLruCacheFactory */
public class d implements C0003a {
    private final long hV;
    private final a hW;

    /* compiled from: DiskLruCacheFactory */
    public interface a {
        File bB();
    }

    public d(a aVar, long j) {
        this.hV = j;
        this.hW = aVar;
    }

    public d(final String str, long j) {
        this((a) new a() {
            public File bB() {
                return new File(str);
            }
        }, j);
    }

    public d(final String str, final String str2, long j) {
        this((a) new a() {
            public File bB() {
                return new File(str, str2);
            }
        }, j);
    }

    public a bz() {
        File bB = this.hW.bB();
        if (bB == null) {
            return null;
        }
        if (bB.mkdirs() || (bB.exists() && bB.isDirectory())) {
            return e.b(bB, this.hV);
        }
        return null;
    }
}

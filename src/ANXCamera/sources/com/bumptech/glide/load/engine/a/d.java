package com.bumptech.glide.load.engine.a;

import com.bumptech.glide.load.engine.a.a.C0004a;
import java.io.File;

/* compiled from: DiskLruCacheFactory */
public class d implements C0004a {
    private final long je;
    private final a jf;

    /* compiled from: DiskLruCacheFactory */
    public interface a {
        File cc();
    }

    public d(a aVar, long j) {
        this.je = j;
        this.jf = aVar;
    }

    public d(final String str, long j) {
        this((a) new a() {
            public File cc() {
                return new File(str);
            }
        }, j);
    }

    public d(final String str, final String str2, long j) {
        this((a) new a() {
            public File cc() {
                return new File(str, str2);
            }
        }, j);
    }

    public a ca() {
        File cc = this.jf.cc();
        if (cc == null) {
            return null;
        }
        if (cc.mkdirs() || (cc.exists() && cc.isDirectory())) {
            return e.b(cc, this.je);
        }
        return null;
    }
}

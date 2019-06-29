package com.bumptech.glide.load.engine.a;

import android.util.Log;
import com.bumptech.glide.a.a;
import com.bumptech.glide.a.a.d;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.a.b;
import java.io.File;
import java.io.IOException;

/* compiled from: DiskLruCacheWrapper */
public class e implements a {
    private static final String TAG = "DiskLruCacheWrapper";
    private static final int ji = 1;
    private static final int jj = 1;
    private static e jk;
    private final File directory;
    private final m jl;
    private final c jm = new c();
    private a jn;
    private final long maxSize;

    @Deprecated
    protected e(File file, long j) {
        this.directory = file;
        this.maxSize = j;
        this.jl = new m();
    }

    @Deprecated
    public static synchronized a a(File file, long j) {
        e eVar;
        synchronized (e.class) {
            if (jk == null) {
                jk = new e(file, j);
            }
            eVar = jk;
        }
        return eVar;
    }

    public static a b(File file, long j) {
        return new e(file, j);
    }

    private synchronized a cd() throws IOException {
        if (this.jn == null) {
            this.jn = a.a(this.directory, 1, 1, this.maxSize);
        }
        return this.jn;
    }

    private synchronized void ce() {
        this.jn = null;
    }

    public void a(c cVar, b bVar) {
        a.b o;
        String h = this.jl.h(cVar);
        this.jm.t(h);
        try {
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Put: Obtained: ");
                sb.append(h);
                sb.append(" for for Key: ");
                sb.append(cVar);
                Log.v(str, sb.toString());
            }
            try {
                a cd = cd();
                if (cd.n(h) == null) {
                    o = cd.o(h);
                    if (o != null) {
                        if (bVar.f(o.n(0))) {
                            o.commit();
                        }
                        o.abortUnlessCommitted();
                        this.jm.u(h);
                        return;
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Had two simultaneous puts for: ");
                    sb2.append(h);
                    throw new IllegalStateException(sb2.toString());
                }
            } catch (IOException e) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Unable to put to disk cache", e);
                }
            } catch (Throwable th) {
                o.abortUnlessCommitted();
                throw th;
            }
        } finally {
            this.jm.u(h);
        }
    }

    public synchronized void clear() {
        try {
            cd().delete();
        } catch (IOException e) {
            try {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Unable to clear disk cache or disk cache cleared externally", e);
                }
            } catch (Throwable th) {
                ce();
                throw th;
            }
        }
        ce();
    }

    public File e(c cVar) {
        String h = this.jl.h(cVar);
        if (Log.isLoggable(TAG, 2)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Get: Obtained: ");
            sb.append(h);
            sb.append(" for for Key: ");
            sb.append(cVar);
            Log.v(str, sb.toString());
        }
        try {
            d n = cd().n(h);
            if (n != null) {
                return n.n(0);
            }
            return null;
        } catch (IOException e) {
            if (!Log.isLoggable(TAG, 5)) {
                return null;
            }
            Log.w(TAG, "Unable to get from disk cache", e);
            return null;
        }
    }

    public void f(c cVar) {
        try {
            cd().remove(this.jl.h(cVar));
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to delete from disk cache", e);
            }
        }
    }
}

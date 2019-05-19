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
    private static final int hY = 1;
    private static final int hZ = 1;
    private static e ia;
    private final File directory;
    private final m ib;
    private final c ic = new c();
    private a ie;
    private final long maxSize;

    @Deprecated
    protected e(File file, long j) {
        this.directory = file;
        this.maxSize = j;
        this.ib = new m();
    }

    @Deprecated
    public static synchronized a a(File file, long j) {
        e eVar;
        synchronized (e.class) {
            if (ia == null) {
                ia = new e(file, j);
            }
            eVar = ia;
        }
        return eVar;
    }

    public static a b(File file, long j) {
        return new e(file, j);
    }

    private synchronized a bC() throws IOException {
        if (this.ie == null) {
            this.ie = a.a(this.directory, 1, 1, this.maxSize);
        }
        return this.ie;
    }

    private synchronized void bD() {
        this.ie = null;
    }

    public void a(c cVar, b bVar) {
        a.b o;
        String h = this.ib.h(cVar);
        this.ic.t(h);
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
                a bC = bC();
                if (bC.n(h) == null) {
                    o = bC.o(h);
                    if (o != null) {
                        if (bVar.f(o.j(0))) {
                            o.commit();
                        }
                        o.abortUnlessCommitted();
                        this.ic.u(h);
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
            this.ic.u(h);
        }
    }

    public synchronized void clear() {
        try {
            bC().delete();
        } catch (IOException e) {
            try {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Unable to clear disk cache or disk cache cleared externally", e);
                }
            } catch (Throwable th) {
                bD();
                throw th;
            }
        }
        bD();
    }

    public File e(c cVar) {
        String h = this.ib.h(cVar);
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
            d n = bC().n(h);
            if (n != null) {
                return n.j(0);
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
            bC().remove(this.ib.h(cVar));
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to delete from disk cache", e);
            }
        }
    }
}

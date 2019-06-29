package com.bumptech.glide.load.engine.a;

import android.content.Context;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.a.a.C0004a;
import com.bumptech.glide.load.engine.a.d.a;
import java.io.File;

/* compiled from: ExternalPreferredCacheDiskCacheFactory */
public final class g extends d {
    public g(Context context) {
        this(context, C0004a.bi, 262144000);
    }

    public g(Context context, long j) {
        this(context, C0004a.bi, j);
    }

    public g(final Context context, final String str, long j) {
        super((a) new a() {
            @Nullable
            private File cf() {
                File cacheDir = context.getCacheDir();
                if (cacheDir == null) {
                    return null;
                }
                return str != null ? new File(cacheDir, str) : cacheDir;
            }

            public File cc() {
                File cf = cf();
                if (cf != null && cf.exists()) {
                    return cf;
                }
                File externalCacheDir = context.getExternalCacheDir();
                return (externalCacheDir == null || !externalCacheDir.canWrite()) ? cf : str != null ? new File(externalCacheDir, str) : externalCacheDir;
            }
        }, j);
    }
}

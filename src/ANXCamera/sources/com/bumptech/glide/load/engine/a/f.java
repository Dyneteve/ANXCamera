package com.bumptech.glide.load.engine.a;

import android.content.Context;
import com.bumptech.glide.load.engine.a.a.C0004a;
import com.bumptech.glide.load.engine.a.d.a;
import java.io.File;

@Deprecated
/* compiled from: ExternalCacheDiskCacheFactory */
public final class f extends d {
    public f(Context context) {
        this(context, C0004a.bi, C0004a.iY);
    }

    public f(Context context, int i) {
        this(context, C0004a.bi, i);
    }

    public f(final Context context, final String str, int i) {
        super((a) new a() {
            public File cc() {
                File externalCacheDir = context.getExternalCacheDir();
                if (externalCacheDir == null) {
                    return null;
                }
                return str != null ? new File(externalCacheDir, str) : externalCacheDir;
            }
        }, (long) i);
    }
}

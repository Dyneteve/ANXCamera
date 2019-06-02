package com.bumptech.glide.load.engine.a;

import android.content.Context;
import com.bumptech.glide.load.engine.a.a.C0005a;
import com.bumptech.glide.load.engine.a.d.a;
import java.io.File;

@Deprecated
/* compiled from: ExternalCacheDiskCacheFactory */
public final class f extends d {
    public f(Context context) {
        this(context, C0005a.ai, C0005a.hQ);
    }

    public f(Context context, int i) {
        this(context, C0005a.ai, i);
    }

    public f(final Context context, final String str, int i) {
        super((a) new a() {
            public File bB() {
                File externalCacheDir = context.getExternalCacheDir();
                if (externalCacheDir == null) {
                    return null;
                }
                return str != null ? new File(externalCacheDir, str) : externalCacheDir;
            }
        }, (long) i);
    }
}

package com.bumptech.glide.load.engine.a;

import android.content.Context;
import com.bumptech.glide.load.engine.a.a.C0003a;
import com.bumptech.glide.load.engine.a.d.a;
import java.io.File;

@Deprecated
/* compiled from: ExternalCacheDiskCacheFactory */
public final class f extends d {
    public f(Context context) {
        this(context, C0003a.ah, C0003a.hP);
    }

    public f(Context context, int i) {
        this(context, C0003a.ah, i);
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

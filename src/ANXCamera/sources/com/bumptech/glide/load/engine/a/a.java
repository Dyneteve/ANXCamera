package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import java.io.File;

/* compiled from: DiskCache */
public interface a {

    /* renamed from: com.bumptech.glide.load.engine.a.a$a reason: collision with other inner class name */
    /* compiled from: DiskCache */
    public interface C0004a {
        public static final String bi = "image_manager_disk_cache";
        public static final int iY = 262144000;

        @Nullable
        a ca();
    }

    /* compiled from: DiskCache */
    public interface b {
        boolean f(@NonNull File file);
    }

    void a(c cVar, b bVar);

    void clear();

    @Nullable
    File e(c cVar);

    void f(c cVar);
}

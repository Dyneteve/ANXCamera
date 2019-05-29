package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import java.io.File;

/* compiled from: DiskCache */
public interface a {

    /* compiled from: DiskCache */
    /* renamed from: com.bumptech.glide.load.engine.a.a$a reason: collision with other inner class name */
    public interface C0003a {
        public static final String ah = "image_manager_disk_cache";
        public static final int hP = 262144000;

        @Nullable
        a bz();
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

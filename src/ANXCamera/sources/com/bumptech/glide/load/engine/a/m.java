package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.a.a.C0011a;
import com.bumptech.glide.util.f;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* compiled from: SafeKeyGenerator */
public class m {
    private final f<c, String> iE = new f<>(1000);
    private final Pool<a> iF = com.bumptech.glide.util.a.a.b(10, new C0011a<a>() {
        /* renamed from: bM */
        public a create() {
            try {
                return new a(MessageDigest.getInstance("SHA-256"));
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
        }
    });

    /* compiled from: SafeKeyGenerator */
    private static final class a implements com.bumptech.glide.util.a.a.c {
        private final com.bumptech.glide.util.a.c fd = com.bumptech.glide.util.a.c.eS();
        final MessageDigest messageDigest;

        a(MessageDigest messageDigest2) {
            this.messageDigest = messageDigest2;
        }

        @NonNull
        public com.bumptech.glide.util.a.c aQ() {
            return this.fd;
        }
    }

    private String i(c cVar) {
        a aVar = (a) i.checkNotNull(this.iF.acquire());
        try {
            cVar.updateDiskCacheKey(aVar.messageDigest);
            return k.j(aVar.messageDigest.digest());
        } finally {
            this.iF.release(aVar);
        }
    }

    public String h(c cVar) {
        String str;
        synchronized (this.iE) {
            str = (String) this.iE.get(cVar);
        }
        if (str == null) {
            str = i(cVar);
        }
        synchronized (this.iE) {
            this.iE.put(cVar, str);
        }
        return str;
    }
}

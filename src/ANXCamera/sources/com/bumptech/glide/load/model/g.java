package com.bumptech.glide.load.model;

import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: GlideUrl */
public class g implements c {
    private static final String jG = "@#&=*+-_.,:!?()/~'%;$";
    private int hashCode;
    private final h jH;
    @Nullable
    private final String jI;
    @Nullable
    private String jJ;
    @Nullable
    private URL jK;
    @Nullable
    private volatile byte[] jL;
    @Nullable
    private final URL url;

    public g(String str) {
        this(str, h.jN);
    }

    public g(String str, h hVar) {
        this.url = null;
        this.jI = i.H(str);
        this.jH = (h) i.checkNotNull(hVar);
    }

    public g(URL url2) {
        this(url2, h.jN);
    }

    public g(URL url2, h hVar) {
        this.url = (URL) i.checkNotNull(url2);
        this.jI = null;
        this.jH = (h) i.checkNotNull(hVar);
    }

    private URL bY() throws MalformedURLException {
        if (this.jK == null) {
            this.jK = new URL(ca());
        }
        return this.jK;
    }

    private String ca() {
        if (TextUtils.isEmpty(this.jJ)) {
            String str = this.jI;
            if (TextUtils.isEmpty(str)) {
                str = ((URL) i.checkNotNull(this.url)).toString();
            }
            this.jJ = Uri.encode(str, jG);
        }
        return this.jJ;
    }

    private byte[] cb() {
        if (this.jL == null) {
            this.jL = getCacheKey().getBytes(dH);
        }
        return this.jL;
    }

    public String bZ() {
        return ca();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (getCacheKey().equals(gVar.getCacheKey()) && this.jH.equals(gVar.jH)) {
            z = true;
        }
        return z;
    }

    public String getCacheKey() {
        return this.jI != null ? this.jI : ((URL) i.checkNotNull(this.url)).toString();
    }

    public Map<String, String> getHeaders() {
        return this.jH.getHeaders();
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = getCacheKey().hashCode();
            this.hashCode = (31 * this.hashCode) + this.jH.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        return getCacheKey();
    }

    public URL toURL() throws MalformedURLException {
        return bY();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(cb());
    }
}

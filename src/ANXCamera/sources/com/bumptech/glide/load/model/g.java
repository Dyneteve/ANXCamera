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
    private static final String jF = "@#&=*+-_.,:!?()/~'%;$";
    private int hashCode;
    private final h jG;
    @Nullable
    private final String jH;
    @Nullable
    private String jI;
    @Nullable
    private URL jJ;
    @Nullable
    private volatile byte[] jK;
    @Nullable
    private final URL url;

    public g(String str) {
        this(str, h.jM);
    }

    public g(String str, h hVar) {
        this.url = null;
        this.jH = i.H(str);
        this.jG = (h) i.checkNotNull(hVar);
    }

    public g(URL url2) {
        this(url2, h.jM);
    }

    public g(URL url2, h hVar) {
        this.url = (URL) i.checkNotNull(url2);
        this.jH = null;
        this.jG = (h) i.checkNotNull(hVar);
    }

    private URL bY() throws MalformedURLException {
        if (this.jJ == null) {
            this.jJ = new URL(ca());
        }
        return this.jJ;
    }

    private String ca() {
        if (TextUtils.isEmpty(this.jI)) {
            String str = this.jH;
            if (TextUtils.isEmpty(str)) {
                str = ((URL) i.checkNotNull(this.url)).toString();
            }
            this.jI = Uri.encode(str, jF);
        }
        return this.jI;
    }

    private byte[] cb() {
        if (this.jK == null) {
            this.jK = getCacheKey().getBytes(dG);
        }
        return this.jK;
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
        if (getCacheKey().equals(gVar.getCacheKey()) && this.jG.equals(gVar.jG)) {
            z = true;
        }
        return z;
    }

    public String getCacheKey() {
        return this.jH != null ? this.jH : ((URL) i.checkNotNull(this.url)).toString();
    }

    public Map<String, String> getHeaders() {
        return this.jG.getHeaders();
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = getCacheKey().hashCode();
            this.hashCode = (31 * this.hashCode) + this.jG.hashCode();
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

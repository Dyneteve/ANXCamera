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
    private static final String jH = "@#&=*+-_.,:!?()/~'%;$";
    private int hashCode;
    private final h jI;
    @Nullable
    private final String jJ;
    @Nullable
    private String jK;
    @Nullable
    private URL jL;
    @Nullable
    private volatile byte[] jM;
    @Nullable
    private final URL url;

    public g(String str) {
        this(str, h.jO);
    }

    public g(String str, h hVar) {
        this.url = null;
        this.jJ = i.H(str);
        this.jI = (h) i.checkNotNull(hVar);
    }

    public g(URL url2) {
        this(url2, h.jO);
    }

    public g(URL url2, h hVar) {
        this.url = (URL) i.checkNotNull(url2);
        this.jJ = null;
        this.jI = (h) i.checkNotNull(hVar);
    }

    private URL bY() throws MalformedURLException {
        if (this.jL == null) {
            this.jL = new URL(ca());
        }
        return this.jL;
    }

    private String ca() {
        if (TextUtils.isEmpty(this.jK)) {
            String str = this.jJ;
            if (TextUtils.isEmpty(str)) {
                str = ((URL) i.checkNotNull(this.url)).toString();
            }
            this.jK = Uri.encode(str, jH);
        }
        return this.jK;
    }

    private byte[] cb() {
        if (this.jM == null) {
            this.jM = getCacheKey().getBytes(dI);
        }
        return this.jM;
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
        if (getCacheKey().equals(gVar.getCacheKey()) && this.jI.equals(gVar.jI)) {
            z = true;
        }
        return z;
    }

    public String getCacheKey() {
        return this.jJ != null ? this.jJ : ((URL) i.checkNotNull(this.url)).toString();
    }

    public Map<String, String> getHeaders() {
        return this.jI.getHeaders();
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = getCacheKey().hashCode();
            this.hashCode = (31 * this.hashCode) + this.jI.hashCode();
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

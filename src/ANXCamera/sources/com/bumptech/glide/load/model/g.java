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
    private static final String kH = "@#&=*+-_.,:!?()/~'%;$";
    private int hashCode;
    private final h kI;
    @Nullable
    private final String kJ;
    @Nullable
    private String kK;
    @Nullable
    private URL kL;
    @Nullable
    private volatile byte[] kM;
    @Nullable
    private final URL url;

    public g(String str) {
        this(str, h.kO);
    }

    public g(String str, h hVar) {
        this.url = null;
        this.kJ = i.H(str);
        this.kI = (h) i.checkNotNull(hVar);
    }

    public g(URL url2) {
        this(url2, h.kO);
    }

    public g(URL url2, h hVar) {
        this.url = (URL) i.checkNotNull(url2);
        this.kJ = null;
        this.kI = (h) i.checkNotNull(hVar);
    }

    private URL cB() throws MalformedURLException {
        if (this.kL == null) {
            this.kL = new URL(cD());
        }
        return this.kL;
    }

    private String cD() {
        if (TextUtils.isEmpty(this.kK)) {
            String str = this.kJ;
            if (TextUtils.isEmpty(str)) {
                str = ((URL) i.checkNotNull(this.url)).toString();
            }
            this.kK = Uri.encode(str, kH);
        }
        return this.kK;
    }

    private byte[] cE() {
        if (this.kM == null) {
            this.kM = getCacheKey().getBytes(eI);
        }
        return this.kM;
    }

    public String cC() {
        return cD();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        if (getCacheKey().equals(gVar.getCacheKey()) && this.kI.equals(gVar.kI)) {
            z = true;
        }
        return z;
    }

    public String getCacheKey() {
        return this.kJ != null ? this.kJ : ((URL) i.checkNotNull(this.url)).toString();
    }

    public Map<String, String> getHeaders() {
        return this.kI.getHeaders();
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = getCacheKey().hashCode();
            this.hashCode = (31 * this.hashCode) + this.kI.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        return getCacheKey();
    }

    public URL toURL() throws MalformedURLException {
        return cB();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(cE());
    }
}

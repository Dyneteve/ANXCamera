package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LazyHeaders */
public final class j implements h {
    private final Map<String, List<i>> headers;
    private volatile Map<String, String> jO;

    /* compiled from: LazyHeaders */
    public static final class a {
        private static final String jP = "User-Agent";
        private static final String jQ = getSanitizedUserAgent();
        private static final Map<String, List<i>> jR;
        private Map<String, List<i>> headers = jR;
        private boolean jS = true;
        private boolean jT = true;

        static {
            HashMap hashMap = new HashMap(2);
            if (!TextUtils.isEmpty(jQ)) {
                hashMap.put("User-Agent", Collections.singletonList(new b(jQ)));
            }
            jR = Collections.unmodifiableMap(hashMap);
        }

        private void ce() {
            if (this.jS) {
                this.jS = false;
                this.headers = cg();
            }
        }

        private Map<String, List<i>> cg() {
            HashMap hashMap = new HashMap(this.headers.size());
            for (Entry entry : this.headers.entrySet()) {
                hashMap.put(entry.getKey(), new ArrayList((Collection) entry.getValue()));
            }
            return hashMap;
        }

        @VisibleForTesting
        static String getSanitizedUserAgent() {
            String property = System.getProperty("http.agent");
            if (TextUtils.isEmpty(property)) {
                return property;
            }
            int length = property.length();
            StringBuilder sb = new StringBuilder(property.length());
            for (int i = 0; i < length; i++) {
                char charAt = property.charAt(i);
                if ((charAt > 31 || charAt == 9) && charAt < 127) {
                    sb.append(charAt);
                } else {
                    sb.append('?');
                }
            }
            return sb.toString();
        }

        private List<i> z(String str) {
            List<i> list = (List) this.headers.get(str);
            if (list != null) {
                return list;
            }
            ArrayList arrayList = new ArrayList();
            this.headers.put(str, arrayList);
            return arrayList;
        }

        public a a(String str, i iVar) {
            if (this.jT && "User-Agent".equalsIgnoreCase(str)) {
                return b(str, iVar);
            }
            ce();
            z(str).add(iVar);
            return this;
        }

        public a b(String str, i iVar) {
            ce();
            if (iVar == null) {
                this.headers.remove(str);
            } else {
                List z = z(str);
                z.clear();
                z.add(iVar);
            }
            if (this.jT && "User-Agent".equalsIgnoreCase(str)) {
                this.jT = false;
            }
            return this;
        }

        public j cf() {
            this.jS = true;
            return new j(this.headers);
        }

        public a k(String str, String str2) {
            return a(str, new b(str2));
        }

        public a l(String str, String str2) {
            return b(str, str2 == null ? null : new b(str2));
        }
    }

    /* compiled from: LazyHeaders */
    static final class b implements i {
        private final String value;

        b(String str) {
            this.value = str;
        }

        public String cc() {
            return this.value;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof b)) {
                return false;
            }
            return this.value.equals(((b) obj).value);
        }

        public int hashCode() {
            return this.value.hashCode();
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("StringHeaderFactory{value='");
            sb.append(this.value);
            sb.append('\'');
            sb.append('}');
            return sb.toString();
        }
    }

    j(Map<String, List<i>> map) {
        this.headers = Collections.unmodifiableMap(map);
    }

    @NonNull
    private String c(@NonNull List<i> list) {
        StringBuilder sb = new StringBuilder();
        int size = list.size();
        for (int i = 0; i < size; i++) {
            String cc = ((i) list.get(i)).cc();
            if (!TextUtils.isEmpty(cc)) {
                sb.append(cc);
                if (i != list.size() - 1) {
                    sb.append(',');
                }
            }
        }
        return sb.toString();
    }

    private Map<String, String> cd() {
        HashMap hashMap = new HashMap();
        for (Entry entry : this.headers.entrySet()) {
            String c = c((List) entry.getValue());
            if (!TextUtils.isEmpty(c)) {
                hashMap.put(entry.getKey(), c);
            }
        }
        return hashMap;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof j)) {
            return false;
        }
        return this.headers.equals(((j) obj).headers);
    }

    public Map<String, String> getHeaders() {
        if (this.jO == null) {
            synchronized (this) {
                if (this.jO == null) {
                    this.jO = Collections.unmodifiableMap(cd());
                }
            }
        }
        return this.jO;
    }

    public int hashCode() {
        return this.headers.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LazyHeaders{headers=");
        sb.append(this.headers);
        sb.append('}');
        return sb.toString();
    }
}

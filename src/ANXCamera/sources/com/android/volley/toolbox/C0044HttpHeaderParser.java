package com.android.volley.toolbox;

import com.android.volley.C0018Cache.Entry;
import com.android.volley.C0025NetworkResponse;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.Map;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

/* renamed from: com.android.volley.toolbox.HttpHeaderParser reason: case insensitive filesystem */
public class C0044HttpHeaderParser {
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0081, code lost:
        return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Entry parseCacheHeaders(C0025NetworkResponse networkResponse) {
        long j;
        boolean z;
        long j2;
        C0025NetworkResponse networkResponse2 = networkResponse;
        long currentTimeMillis = System.currentTimeMillis();
        Map<String, String> map = networkResponse2.headers;
        long j3 = 0;
        long j4 = 0;
        long j5 = 0;
        String str = (String) map.get("Date");
        if (str != null) {
            j3 = parseDateAsEpoch(str);
        }
        String str2 = (String) map.get(HttpRequest.HEADER_CACHE_CONTROL);
        if (str2 != null) {
            z = true;
            j = 0;
            String[] split = str2.split(",");
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= split.length) {
                    break;
                }
                String[] strArr = split;
                String trim = split[i2].trim();
                if (!trim.equals("no-cache") && !trim.equals("no-store")) {
                    if (trim.startsWith("max-age=")) {
                        try {
                            j5 = Long.parseLong(trim.substring(8));
                        } catch (Exception e) {
                        }
                    } else if (trim.equals("must-revalidate") || trim.equals("proxy-revalidate")) {
                        j5 = 0;
                    }
                    i = i2 + 1;
                    split = strArr;
                }
            }
        } else {
            j = 0;
            z = false;
        }
        String str3 = (String) map.get(HttpRequest.HEADER_EXPIRES);
        if (str3 != null) {
            j = parseDateAsEpoch(str3);
        }
        String str4 = (String) map.get(HttpRequest.HEADER_ETAG);
        if (z) {
            j4 = currentTimeMillis + (1000 * j2);
        } else if (j3 > 0 && j >= j3) {
            j4 = currentTimeMillis + (j - j3);
        }
        Entry entry = new Entry();
        entry.data = networkResponse2.data;
        entry.etag = str4;
        entry.softTtl = j4;
        entry.ttl = entry.softTtl;
        entry.serverDate = j3;
        entry.responseHeaders = map;
        return entry;
    }

    public static String parseCharset(Map<String, String> map) {
        String str = (String) map.get("Content-Type");
        if (str != null) {
            String[] split = str.split(";");
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=");
                if (split2.length == 2 && split2[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return split2[1];
                }
            }
        }
        return "ISO-8859-1";
    }

    public static long parseDateAsEpoch(String str) {
        try {
            return DateUtils.parseDate(str).getTime();
        } catch (DateParseException e) {
            return 0;
        }
    }
}

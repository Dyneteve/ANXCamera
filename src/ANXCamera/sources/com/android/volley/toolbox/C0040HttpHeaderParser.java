package com.android.volley.toolbox;

import com.android.volley.C0014Cache.Entry;
import com.android.volley.C0021NetworkResponse;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.Map;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

/* renamed from: com.android.volley.toolbox.HttpHeaderParser reason: case insensitive filesystem */
public class C0040HttpHeaderParser {
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0081, code lost:
        return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Entry parseCacheHeaders(C0021NetworkResponse response) {
        long serverExpires;
        boolean hasCacheControl;
        long maxAge;
        C0021NetworkResponse networkResponse = response;
        long now = System.currentTimeMillis();
        Map<String, String> headers = networkResponse.headers;
        long serverDate = 0;
        long softExpire = 0;
        long maxAge2 = 0;
        String headerValue = (String) headers.get("Date");
        if (headerValue != null) {
            serverDate = parseDateAsEpoch(headerValue);
        }
        String headerValue2 = (String) headers.get(HttpRequest.HEADER_CACHE_CONTROL);
        if (headerValue2 != null) {
            hasCacheControl = true;
            serverExpires = 0;
            String[] tokens = headerValue2.split(",");
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= tokens.length) {
                    break;
                }
                String[] tokens2 = tokens;
                String token = tokens[i2].trim();
                if (!token.equals("no-cache") && !token.equals("no-store")) {
                    if (token.startsWith("max-age=")) {
                        try {
                            maxAge2 = Long.parseLong(token.substring(8));
                        } catch (Exception e) {
                        }
                    } else if (token.equals("must-revalidate") || token.equals("proxy-revalidate")) {
                        maxAge2 = 0;
                    }
                    i = i2 + 1;
                    tokens = tokens2;
                }
            }
        } else {
            serverExpires = 0;
            hasCacheControl = false;
        }
        String headerValue3 = (String) headers.get(HttpRequest.HEADER_EXPIRES);
        if (headerValue3 != null) {
            serverExpires = parseDateAsEpoch(headerValue3);
        }
        String serverEtag = (String) headers.get(HttpRequest.HEADER_ETAG);
        if (hasCacheControl) {
            softExpire = now + (1000 * maxAge);
        } else if (serverDate > 0 && serverExpires >= serverDate) {
            softExpire = now + (serverExpires - serverDate);
        }
        Entry entry = new Entry();
        entry.data = networkResponse.data;
        entry.etag = serverEtag;
        entry.softTtl = softExpire;
        entry.ttl = entry.softTtl;
        entry.serverDate = serverDate;
        entry.responseHeaders = headers;
        return entry;
    }

    public static long parseDateAsEpoch(String dateStr) {
        try {
            return DateUtils.parseDate(dateStr).getTime();
        } catch (DateParseException e) {
            return 0;
        }
    }

    public static String parseCharset(Map<String, String> headers) {
        String contentType = (String) headers.get("Content-Type");
        if (contentType != null) {
            String[] params = contentType.split(";");
            for (int i = 1; i < params.length; i++) {
                String[] pair = params[i].trim().split("=");
                if (pair.length == 2 && pair[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return pair[1];
                }
            }
        }
        return "ISO-8859-1";
    }
}

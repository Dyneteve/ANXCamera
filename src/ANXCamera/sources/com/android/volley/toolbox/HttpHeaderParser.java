package com.android.volley.toolbox;

import com.android.volley.Cache.Entry;
import com.android.volley.Header;
import com.android.volley.NetworkResponse;
import com.android.volley.VolleyLog;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;

public class HttpHeaderParser {
    private static final String DEFAULT_CONTENT_CHARSET = "ISO-8859-1";
    static final String HEADER_CONTENT_TYPE = "Content-Type";
    private static final String RFC1123_FORMAT = "EEE, dd MMM yyyy HH:mm:ss zzz";

    static String formatEpochAsRfc1123(long j) {
        return newRfc1123Formatter().format(new Date(j));
    }

    private static SimpleDateFormat newRfc1123Formatter() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(RFC1123_FORMAT, Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        return simpleDateFormat;
    }

    public static Entry parseCacheHeaders(NetworkResponse networkResponse) {
        boolean z;
        long j;
        boolean z2;
        long j2;
        long j3;
        NetworkResponse networkResponse2 = networkResponse;
        long currentTimeMillis = System.currentTimeMillis();
        Map<String, String> map = networkResponse2.headers;
        String str = (String) map.get("Date");
        long j4 = 0;
        long parseDateAsEpoch = str != null ? parseDateAsEpoch(str) : 0;
        String str2 = (String) map.get(HttpRequest.HEADER_CACHE_CONTROL);
        if (str2 != null) {
            String[] split = str2.split(",", 0);
            j2 = 0;
            j = 0;
            z2 = false;
            for (String trim : split) {
                String trim2 = trim.trim();
                if (trim2.equals("no-cache") || trim2.equals("no-store")) {
                    return null;
                }
                if (trim2.startsWith("max-age=")) {
                    try {
                        j2 = Long.parseLong(trim2.substring(8));
                    } catch (Exception e) {
                    }
                } else if (trim2.startsWith("stale-while-revalidate=")) {
                    try {
                        j = Long.parseLong(trim2.substring(23));
                    } catch (Exception e2) {
                    }
                } else if (trim2.equals("must-revalidate") || trim2.equals("proxy-revalidate")) {
                    z2 = true;
                }
            }
            z = true;
        } else {
            j2 = 0;
            j = 0;
            z2 = false;
            z = false;
        }
        String str3 = (String) map.get(HttpRequest.HEADER_EXPIRES);
        long parseDateAsEpoch2 = str3 != null ? parseDateAsEpoch(str3) : 0;
        String str4 = (String) map.get(HttpRequest.HEADER_LAST_MODIFIED);
        long parseDateAsEpoch3 = str4 != null ? parseDateAsEpoch(str4) : 0;
        String str5 = (String) map.get(HttpRequest.HEADER_ETAG);
        if (z) {
            long j5 = currentTimeMillis + (j2 * 1000);
            long j6 = j5;
            j3 = z2 ? j5 : (j * 1000) + j5;
            j4 = j6;
        } else {
            if (parseDateAsEpoch > 0 && parseDateAsEpoch2 >= parseDateAsEpoch) {
                j4 = currentTimeMillis + (parseDateAsEpoch2 - parseDateAsEpoch);
            }
            j3 = j4;
        }
        Entry entry = new Entry();
        entry.data = networkResponse2.data;
        entry.etag = str5;
        entry.softTtl = j4;
        entry.ttl = j3;
        entry.serverDate = parseDateAsEpoch;
        entry.lastModified = parseDateAsEpoch3;
        entry.responseHeaders = map;
        entry.allResponseHeaders = networkResponse2.allHeaders;
        return entry;
    }

    public static String parseCharset(Map<String, String> map) {
        return parseCharset(map, "ISO-8859-1");
    }

    public static String parseCharset(Map<String, String> map, String str) {
        String str2 = (String) map.get("Content-Type");
        if (str2 != null) {
            String[] split = str2.split(";", 0);
            for (int i = 1; i < split.length; i++) {
                String[] split2 = split[i].trim().split("=", 0);
                if (split2.length == 2 && split2[0].equals(HttpRequest.PARAM_CHARSET)) {
                    return split2[1];
                }
            }
        }
        return str;
    }

    public static long parseDateAsEpoch(String str) {
        try {
            return newRfc1123Formatter().parse(str).getTime();
        } catch (ParseException e) {
            VolleyLog.e(e, "Unable to parse dateStr: %s, falling back to 0", str);
            return 0;
        }
    }

    static List<Header> toAllHeaderList(Map<String, String> map) {
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            arrayList.add(new Header((String) entry.getKey(), (String) entry.getValue()));
        }
        return arrayList;
    }

    static Map<String, String> toHeaderMap(List<Header> list) {
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        for (Header header : list) {
            treeMap.put(header.getName(), header.getValue());
        }
        return treeMap;
    }
}

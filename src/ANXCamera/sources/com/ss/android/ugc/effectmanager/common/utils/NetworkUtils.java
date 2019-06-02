package com.ss.android.ugc.effectmanager.common.utils;

import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

public class NetworkUtils {
    public static String buildRequestUrl(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder(str);
        sb.append("?");
        if (map.size() > 0) {
            for (Entry entry : map.entrySet()) {
                String str2 = (String) entry.getKey();
                String str3 = (String) entry.getValue();
                if (!TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str3)) {
                    sb.append("&");
                    sb.append(str2);
                    sb.append("=");
                    sb.append(str3);
                }
            }
        }
        return new String(sb);
    }

    public static String encodeParameters(Map<String, String> map, String str) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Entry entry : map.entrySet()) {
                sb.append(URLEncoder.encode((String) entry.getKey(), str));
                sb.append('=');
                sb.append(URLEncoder.encode((String) entry.getValue(), str));
                sb.append('&');
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Encoding not supported: ");
            sb2.append(str);
            throw new RuntimeException(sb2.toString(), e);
        }
    }

    public static String filterUrl(String str, String str2) {
        Pattern compile = Pattern.compile(".*(?=://)");
        Pattern compile2 = Pattern.compile("(?<=://)([^/]*)");
        URI create = URI.create(str);
        return compile2.matcher(compile.matcher(str2).replaceFirst(create.getScheme())).replaceFirst(create.getHost());
    }

    public static <T> String toJson(List<T> list) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        if (list == null || list.isEmpty()) {
            sb.append("]");
            return sb.toString();
        }
        for (Object next : list) {
            sb.append("\"");
            sb.append(next.toString());
            sb.append("\"");
            sb.append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append("]");
        return sb.toString();
    }
}

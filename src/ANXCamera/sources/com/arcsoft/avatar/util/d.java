package com.arcsoft.avatar.util;

import java.util.HashMap;

/* compiled from: TimeConsumingUtil */
public class d {
    public static boolean a = false;
    private static HashMap<String, Long> b = new HashMap<>();
    private static final String c = "PERFORMANCE";

    public static void a(String str) {
        if (a && b != null) {
            b.put(str, Long.valueOf(System.currentTimeMillis()));
        }
    }

    public static void a(String str, String str2) {
        if (a && b != null && b.containsKey(str2)) {
            long longValue = ((Long) b.get(str2)).longValue();
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(str2);
            sb.append(" : ");
            sb.append(System.currentTimeMillis() - longValue);
            LOG.d(str, sb.toString());
        }
    }

    public static void b(String str) {
        if (a && b != null && b.containsKey(str)) {
            long longValue = ((Long) b.get(str)).longValue();
            String str2 = c;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(str);
            sb.append(" : ");
            sb.append(System.currentTimeMillis() - longValue);
            LOG.d(str2, sb.toString());
        }
    }
}

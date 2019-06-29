package com.ss.android.ttve.oauth;

import java.util.HashMap;
import java.util.Map;

public enum TEOAuthResult {
    OK(0),
    TBD(1),
    EXPIRED(2),
    FAIL(3),
    NOT_MATCH(4);
    
    private static Map<Integer, TEOAuthResult> valueMaps;
    private int ordinal;

    static {
        int i;
        TEOAuthResult[] values;
        valueMaps = new HashMap();
        for (TEOAuthResult tEOAuthResult : values()) {
            valueMaps.put(Integer.valueOf(tEOAuthResult.ordinal), tEOAuthResult);
        }
    }

    private TEOAuthResult(int i) {
        this.ordinal = i;
    }

    public static TEOAuthResult from(int i) {
        return valueMaps.containsKey(Integer.valueOf(i)) ? (TEOAuthResult) valueMaps.get(Integer.valueOf(i)) : FAIL;
    }
}

package com.miui.filtersdk;

import android.content.Context;

public class BeautificationSDK {
    public static Context sContext;

    private BeautificationSDK() {
    }

    public static void init(Context context) {
        sContext = context;
    }
}

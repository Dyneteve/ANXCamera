package com.ss.android.medialib;

import java.util.ArrayList;
import java.util.List;

public class LibsConfig {
    public static List<String> LIBS = new ArrayList();

    static {
        LIBS.add("ttffmpeg");
        LIBS.add("ttyuv");
        LIBS.add("tt_effect");
        LIBS.add("ttffmpeg-invoker");
    }
}

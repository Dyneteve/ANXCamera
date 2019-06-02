package com.bumptech.glide.load.model;

import com.bumptech.glide.load.model.j.a;
import java.util.Collections;
import java.util.Map;

/* compiled from: Headers */
public interface h {
    @Deprecated
    public static final h jN = new h() {
        public Map<String, String> getHeaders() {
            return Collections.emptyMap();
        }
    };
    public static final h jO = new a().cf();

    Map<String, String> getHeaders();
}

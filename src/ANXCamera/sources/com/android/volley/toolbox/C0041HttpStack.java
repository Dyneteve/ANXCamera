package com.android.volley.toolbox;

import com.android.volley.C0013AuthFailureError;
import com.android.volley.C0024Request;
import java.io.IOException;
import java.util.Map;
import org.apache.http.HttpResponse;

/* renamed from: com.android.volley.toolbox.HttpStack reason: case insensitive filesystem */
public interface C0041HttpStack {
    HttpResponse performRequest(C0024Request<?> request, Map<String, String> map) throws IOException, C0013AuthFailureError;
}

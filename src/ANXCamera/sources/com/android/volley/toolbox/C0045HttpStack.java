package com.android.volley.toolbox;

import com.android.volley.C0017AuthFailureError;
import com.android.volley.C0028Request;
import java.io.IOException;
import java.util.Map;
import org.apache.http.HttpResponse;

/* renamed from: com.android.volley.toolbox.HttpStack reason: case insensitive filesystem */
public interface C0045HttpStack {
    HttpResponse performRequest(C0028Request<?> request, Map<String, String> map) throws IOException, C0017AuthFailureError;
}

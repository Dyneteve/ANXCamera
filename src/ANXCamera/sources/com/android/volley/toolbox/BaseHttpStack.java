package com.android.volley.toolbox;

import com.android.volley.C0017AuthFailureError;
import com.android.volley.C0028Request;
import com.android.volley.Header;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;

public abstract class BaseHttpStack implements C0045HttpStack {
    public abstract HttpResponse executeRequest(C0028Request<?> request, Map<String, String> map) throws IOException, C0017AuthFailureError;

    @Deprecated
    public final HttpResponse performRequest(C0028Request<?> request, Map<String, String> map) throws IOException, C0017AuthFailureError {
        HttpResponse executeRequest = executeRequest(request, map);
        BasicHttpResponse basicHttpResponse = new BasicHttpResponse(new BasicStatusLine(new ProtocolVersion("HTTP", 1, 1), executeRequest.getStatusCode(), ""));
        ArrayList arrayList = new ArrayList();
        for (Header header : executeRequest.getHeaders()) {
            arrayList.add(new BasicHeader(header.getName(), header.getValue()));
        }
        basicHttpResponse.setHeaders((org.apache.http.Header[]) arrayList.toArray(new org.apache.http.Header[arrayList.size()]));
        InputStream content = executeRequest.getContent();
        if (content != null) {
            BasicHttpEntity basicHttpEntity = new BasicHttpEntity();
            basicHttpEntity.setContent(content);
            basicHttpEntity.setContentLength((long) executeRequest.getContentLength());
            basicHttpResponse.setEntity(basicHttpEntity);
        }
        return basicHttpResponse;
    }
}

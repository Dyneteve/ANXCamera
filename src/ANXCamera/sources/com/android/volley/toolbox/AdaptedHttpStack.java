package com.android.volley.toolbox;

import com.android.volley.C0017AuthFailureError;
import com.android.volley.C0028Request;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.conn.ConnectTimeoutException;

class AdaptedHttpStack extends BaseHttpStack {
    private final C0045HttpStack mHttpStack;

    AdaptedHttpStack(C0045HttpStack httpStack) {
        this.mHttpStack = httpStack;
    }

    public HttpResponse executeRequest(C0028Request<?> request, Map<String, String> map) throws IOException, C0017AuthFailureError {
        try {
            HttpResponse performRequest = this.mHttpStack.performRequest(request, map);
            int statusCode = performRequest.getStatusLine().getStatusCode();
            Header[] allHeaders = performRequest.getAllHeaders();
            ArrayList arrayList = new ArrayList(allHeaders.length);
            for (Header header : allHeaders) {
                arrayList.add(new com.android.volley.Header(header.getName(), header.getValue()));
            }
            if (performRequest.getEntity() == null) {
                return new HttpResponse(statusCode, arrayList);
            }
            long contentLength = performRequest.getEntity().getContentLength();
            if (((long) ((int) contentLength)) == contentLength) {
                return new HttpResponse(statusCode, arrayList, (int) performRequest.getEntity().getContentLength(), performRequest.getEntity().getContent());
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Response too large: ");
            sb.append(contentLength);
            throw new IOException(sb.toString());
        } catch (ConnectTimeoutException e) {
            throw new SocketTimeoutException(e.getMessage());
        }
    }
}

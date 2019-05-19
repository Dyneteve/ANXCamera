package com.android.volley.toolbox;

import com.android.volley.C0013AuthFailureError;
import com.android.volley.C0024Request;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpOptions;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpTrace;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

/* renamed from: com.android.volley.toolbox.HttpClientStack reason: case insensitive filesystem */
public class C0039HttpClientStack implements C0041HttpStack {
    private static final String HEADER_CONTENT_TYPE = "Content-Type";
    protected final HttpClient mClient;

    /* renamed from: com.android.volley.toolbox.HttpClientStack$HttpPatch */
    public static final class HttpPatch extends HttpEntityEnclosingRequestBase {
        public static final String METHOD_NAME = "PATCH";

        public HttpPatch() {
        }

        public HttpPatch(URI uri) {
            setURI(uri);
        }

        public HttpPatch(String uri) {
            setURI(URI.create(uri));
        }

        public String getMethod() {
            return "PATCH";
        }
    }

    public C0039HttpClientStack(HttpClient client) {
        this.mClient = client;
    }

    private static void addHeaders(HttpUriRequest httpRequest, Map<String, String> headers) {
        for (String key : headers.keySet()) {
            httpRequest.setHeader(key, (String) headers.get(key));
        }
    }

    private static List<NameValuePair> getPostParameterPairs(Map<String, String> postParams) {
        List<NameValuePair> result = new ArrayList<>(postParams.size());
        for (String key : postParams.keySet()) {
            result.add(new BasicNameValuePair(key, (String) postParams.get(key)));
        }
        return result;
    }

    public HttpResponse performRequest(C0024Request<?> request, Map<String, String> additionalHeaders) throws IOException, C0013AuthFailureError {
        HttpUriRequest httpRequest = createHttpRequest(request, additionalHeaders);
        addHeaders(httpRequest, additionalHeaders);
        addHeaders(httpRequest, request.getHeaders());
        onPrepareRequest(httpRequest);
        HttpParams httpParams = httpRequest.getParams();
        int timeoutMs = request.getTimeoutMs();
        HttpConnectionParams.setConnectionTimeout(httpParams, 5000);
        HttpConnectionParams.setSoTimeout(httpParams, timeoutMs);
        return this.mClient.execute(httpRequest);
    }

    static HttpUriRequest createHttpRequest(C0024Request<?> request, Map<String, String> map) throws C0013AuthFailureError {
        switch (request.getMethod()) {
            case -1:
                byte[] postBody = request.getPostBody();
                if (postBody == null) {
                    return new HttpGet(request.getUrl());
                }
                HttpPost postRequest = new HttpPost(request.getUrl());
                postRequest.addHeader("Content-Type", request.getPostBodyContentType());
                postRequest.setEntity(new ByteArrayEntity(postBody));
                return postRequest;
            case 0:
                return new HttpGet(request.getUrl());
            case 1:
                HttpPost postRequest2 = new HttpPost(request.getUrl());
                postRequest2.addHeader("Content-Type", request.getBodyContentType());
                setEntityIfNonEmptyBody(postRequest2, request);
                return postRequest2;
            case 2:
                HttpPut putRequest = new HttpPut(request.getUrl());
                putRequest.addHeader("Content-Type", request.getBodyContentType());
                setEntityIfNonEmptyBody(putRequest, request);
                return putRequest;
            case 3:
                return new HttpDelete(request.getUrl());
            case 4:
                return new HttpHead(request.getUrl());
            case 5:
                return new HttpOptions(request.getUrl());
            case 6:
                return new HttpTrace(request.getUrl());
            case 7:
                HttpPatch patchRequest = new HttpPatch(request.getUrl());
                patchRequest.addHeader("Content-Type", request.getBodyContentType());
                setEntityIfNonEmptyBody(patchRequest, request);
                return patchRequest;
            default:
                throw new IllegalStateException("Unknown request method.");
        }
    }

    private static void setEntityIfNonEmptyBody(HttpEntityEnclosingRequestBase httpRequest, C0024Request<?> request) throws C0013AuthFailureError {
        byte[] body = request.getBody();
        if (body != null) {
            httpRequest.setEntity(new ByteArrayEntity(body));
        }
    }

    /* access modifiers changed from: protected */
    public void onPrepareRequest(HttpUriRequest request) throws IOException {
    }
}

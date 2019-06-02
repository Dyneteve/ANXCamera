package com.android.volley.toolbox;

import com.android.volley.C0017AuthFailureError;
import com.android.volley.C0028Request;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;

/* renamed from: com.android.volley.toolbox.HurlStack reason: case insensitive filesystem */
public class C0046HurlStack implements C0045HttpStack {
    private static final String HEADER_CONTENT_TYPE = "Content-Type";
    private final SSLSocketFactory mSslSocketFactory;
    private final UrlRewriter mUrlRewriter;

    /* renamed from: com.android.volley.toolbox.HurlStack$UrlRewriter */
    public interface UrlRewriter {
        String rewriteUrl(String str);
    }

    public C0046HurlStack() {
        this(null);
    }

    public C0046HurlStack(UrlRewriter urlRewriter) {
        this(urlRewriter, null);
    }

    public C0046HurlStack(UrlRewriter urlRewriter, SSLSocketFactory sSLSocketFactory) {
        this.mUrlRewriter = urlRewriter;
        this.mSslSocketFactory = sSLSocketFactory;
    }

    private static void addBodyIfExists(HttpURLConnection httpURLConnection, C0028Request<?> request) throws IOException, C0017AuthFailureError {
        byte[] body = request.getBody();
        if (body != null) {
            httpURLConnection.setDoOutput(true);
            httpURLConnection.addRequestProperty("Content-Type", request.getBodyContentType());
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            dataOutputStream.write(body);
            dataOutputStream.close();
        }
    }

    private static HttpEntity entityFromConnection(HttpURLConnection httpURLConnection) {
        InputStream inputStream;
        BasicHttpEntity basicHttpEntity = new BasicHttpEntity();
        try {
            inputStream = httpURLConnection.getInputStream();
        } catch (IOException e) {
            inputStream = httpURLConnection.getErrorStream();
        }
        basicHttpEntity.setContent(inputStream);
        basicHttpEntity.setContentLength((long) httpURLConnection.getContentLength());
        basicHttpEntity.setContentEncoding(httpURLConnection.getContentEncoding());
        basicHttpEntity.setContentType(httpURLConnection.getContentType());
        return basicHttpEntity;
    }

    private HttpURLConnection openConnection(URL url, C0028Request<?> request) throws IOException {
        HttpURLConnection createConnection = createConnection(url);
        int timeoutMs = request.getTimeoutMs();
        createConnection.setConnectTimeout(timeoutMs);
        createConnection.setReadTimeout(timeoutMs);
        createConnection.setUseCaches(false);
        createConnection.setDoInput(true);
        if ("https".equals(url.getProtocol()) && this.mSslSocketFactory != null) {
            ((HttpsURLConnection) createConnection).setSSLSocketFactory(this.mSslSocketFactory);
        }
        return createConnection;
    }

    static void setConnectionParametersForRequest(HttpURLConnection httpURLConnection, C0028Request<?> request) throws IOException, C0017AuthFailureError {
        switch (request.getMethod()) {
            case -1:
                byte[] postBody = request.getPostBody();
                if (postBody != null) {
                    httpURLConnection.setDoOutput(true);
                    httpURLConnection.setRequestMethod("POST");
                    httpURLConnection.addRequestProperty("Content-Type", request.getPostBodyContentType());
                    DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
                    dataOutputStream.write(postBody);
                    dataOutputStream.close();
                    return;
                }
                return;
            case 0:
                httpURLConnection.setRequestMethod("GET");
                return;
            case 1:
                httpURLConnection.setRequestMethod("POST");
                addBodyIfExists(httpURLConnection, request);
                return;
            case 2:
                httpURLConnection.setRequestMethod("PUT");
                addBodyIfExists(httpURLConnection, request);
                return;
            case 3:
                httpURLConnection.setRequestMethod("DELETE");
                return;
            case 4:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_HEAD);
                return;
            case 5:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_OPTIONS);
                return;
            case 6:
                httpURLConnection.setRequestMethod(HttpRequest.METHOD_TRACE);
                return;
            case 7:
                httpURLConnection.setRequestMethod("PATCH");
                addBodyIfExists(httpURLConnection, request);
                return;
            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }

    /* access modifiers changed from: protected */
    public HttpURLConnection createConnection(URL url) throws IOException {
        return (HttpURLConnection) url.openConnection();
    }

    public HttpResponse performRequest(C0028Request<?> request, Map<String, String> map) throws IOException, C0017AuthFailureError {
        C0028Request<?> request2 = request;
        String url = request.getUrl();
        HashMap hashMap = new HashMap();
        hashMap.putAll(request.getHeaders());
        hashMap.putAll(map);
        if (this.mUrlRewriter != null) {
            String rewriteUrl = this.mUrlRewriter.rewriteUrl(url);
            if (rewriteUrl != null) {
                url = rewriteUrl;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("URL blocked by rewriter: ");
                sb.append(url);
                throw new IOException(sb.toString());
            }
        }
        HttpURLConnection openConnection = openConnection(new URL(url), request2);
        for (String str : hashMap.keySet()) {
            openConnection.addRequestProperty(str, (String) hashMap.get(str));
        }
        setConnectionParametersForRequest(openConnection, request2);
        ProtocolVersion protocolVersion = new ProtocolVersion("HTTP", 1, 1);
        if (openConnection.getResponseCode() != -1) {
            BasicHttpResponse basicHttpResponse = new BasicHttpResponse(new BasicStatusLine(protocolVersion, openConnection.getResponseCode(), openConnection.getResponseMessage()));
            basicHttpResponse.setEntity(entityFromConnection(openConnection));
            for (Entry entry : openConnection.getHeaderFields().entrySet()) {
                if (entry.getKey() != null) {
                    basicHttpResponse.addHeader(new BasicHeader((String) entry.getKey(), (String) ((List) entry.getValue()).get(0)));
                }
            }
            return basicHttpResponse;
        }
        throw new IOException("Could not retrieve response code from HttpUrlConnection.");
    }
}

package com.android.volley.toolbox;

import com.android.volley.C0013AuthFailureError;
import com.android.volley.C0024Request;
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
public class C0042HurlStack implements C0041HttpStack {
    private static final String HEADER_CONTENT_TYPE = "Content-Type";
    private final SSLSocketFactory mSslSocketFactory;
    private final UrlRewriter mUrlRewriter;

    /* renamed from: com.android.volley.toolbox.HurlStack$UrlRewriter */
    public interface UrlRewriter {
        String rewriteUrl(String str);
    }

    public C0042HurlStack() {
        this(null);
    }

    public C0042HurlStack(UrlRewriter urlRewriter) {
        this(urlRewriter, null);
    }

    public C0042HurlStack(UrlRewriter urlRewriter, SSLSocketFactory sslSocketFactory) {
        this.mUrlRewriter = urlRewriter;
        this.mSslSocketFactory = sslSocketFactory;
    }

    public HttpResponse performRequest(C0024Request<?> request, Map<String, String> additionalHeaders) throws IOException, C0013AuthFailureError {
        C0024Request<?> request2 = request;
        String url = request.getUrl();
        HashMap<String, String> map = new HashMap<>();
        map.putAll(request.getHeaders());
        map.putAll(additionalHeaders);
        if (this.mUrlRewriter != null) {
            String rewritten = this.mUrlRewriter.rewriteUrl(url);
            if (rewritten != null) {
                url = rewritten;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("URL blocked by rewriter: ");
                sb.append(url);
                throw new IOException(sb.toString());
            }
        }
        HttpURLConnection connection = openConnection(new URL(url), request2);
        for (String headerName : map.keySet()) {
            connection.addRequestProperty(headerName, (String) map.get(headerName));
        }
        setConnectionParametersForRequest(connection, request2);
        ProtocolVersion protocolVersion = new ProtocolVersion("HTTP", 1, 1);
        if (connection.getResponseCode() != -1) {
            BasicHttpResponse response = new BasicHttpResponse(new BasicStatusLine(protocolVersion, connection.getResponseCode(), connection.getResponseMessage()));
            response.setEntity(entityFromConnection(connection));
            for (Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
                if (header.getKey() != null) {
                    response.addHeader(new BasicHeader((String) header.getKey(), (String) ((List) header.getValue()).get(0)));
                }
            }
            return response;
        }
        throw new IOException("Could not retrieve response code from HttpUrlConnection.");
    }

    private static HttpEntity entityFromConnection(HttpURLConnection connection) {
        InputStream inputStream;
        BasicHttpEntity entity = new BasicHttpEntity();
        try {
            inputStream = connection.getInputStream();
        } catch (IOException e) {
            inputStream = connection.getErrorStream();
        }
        entity.setContent(inputStream);
        entity.setContentLength((long) connection.getContentLength());
        entity.setContentEncoding(connection.getContentEncoding());
        entity.setContentType(connection.getContentType());
        return entity;
    }

    /* access modifiers changed from: protected */
    public HttpURLConnection createConnection(URL url) throws IOException {
        return (HttpURLConnection) url.openConnection();
    }

    private HttpURLConnection openConnection(URL url, C0024Request<?> request) throws IOException {
        HttpURLConnection connection = createConnection(url);
        int timeoutMs = request.getTimeoutMs();
        connection.setConnectTimeout(timeoutMs);
        connection.setReadTimeout(timeoutMs);
        connection.setUseCaches(false);
        connection.setDoInput(true);
        if ("https".equals(url.getProtocol()) && this.mSslSocketFactory != null) {
            ((HttpsURLConnection) connection).setSSLSocketFactory(this.mSslSocketFactory);
        }
        return connection;
    }

    static void setConnectionParametersForRequest(HttpURLConnection connection, C0024Request<?> request) throws IOException, C0013AuthFailureError {
        switch (request.getMethod()) {
            case -1:
                byte[] postBody = request.getPostBody();
                if (postBody != null) {
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.addRequestProperty("Content-Type", request.getPostBodyContentType());
                    DataOutputStream out = new DataOutputStream(connection.getOutputStream());
                    out.write(postBody);
                    out.close();
                    return;
                }
                return;
            case 0:
                connection.setRequestMethod("GET");
                return;
            case 1:
                connection.setRequestMethod("POST");
                addBodyIfExists(connection, request);
                return;
            case 2:
                connection.setRequestMethod("PUT");
                addBodyIfExists(connection, request);
                return;
            case 3:
                connection.setRequestMethod("DELETE");
                return;
            case 4:
                connection.setRequestMethod(HttpRequest.METHOD_HEAD);
                return;
            case 5:
                connection.setRequestMethod(HttpRequest.METHOD_OPTIONS);
                return;
            case 6:
                connection.setRequestMethod(HttpRequest.METHOD_TRACE);
                return;
            case 7:
                connection.setRequestMethod("PATCH");
                addBodyIfExists(connection, request);
                return;
            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }

    private static void addBodyIfExists(HttpURLConnection connection, C0024Request<?> request) throws IOException, C0013AuthFailureError {
        byte[] body = request.getBody();
        if (body != null) {
            connection.setDoOutput(true);
            connection.addRequestProperty("Content-Type", request.getBodyContentType());
            DataOutputStream out = new DataOutputStream(connection.getOutputStream());
            out.write(body);
            out.close();
        }
    }
}

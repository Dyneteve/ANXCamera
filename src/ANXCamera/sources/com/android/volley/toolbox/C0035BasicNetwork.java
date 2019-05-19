package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0013AuthFailureError;
import com.android.volley.C0014Cache.Entry;
import com.android.volley.C0018Network;
import com.android.volley.C0020NetworkError;
import com.android.volley.C0021NetworkResponse;
import com.android.volley.C0022NoConnectionError;
import com.android.volley.C0024Request;
import com.android.volley.C0028RetryPolicy;
import com.android.volley.C0029ServerError;
import com.android.volley.C0030TimeoutError;
import com.android.volley.C0031VolleyError;
import com.android.volley.C0032VolleyLog;
import com.ss.android.ttve.common.TEDefine;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.impl.cookie.DateUtils;

/* renamed from: com.android.volley.toolbox.BasicNetwork reason: case insensitive filesystem */
public class C0035BasicNetwork implements C0018Network {
    protected static final boolean DEBUG = C0032VolleyLog.DEBUG;
    private static int DEFAULT_POOL_SIZE = 4096;
    private static int SLOW_REQUEST_THRESHOLD_MS = SLOW_REQUEST_THRESHOLD_MS;
    protected final C0041HttpStack mHttpStack;
    protected final C0036ByteArrayPool mPool;

    public C0035BasicNetwork(C0041HttpStack httpStack) {
        this(httpStack, new C0036ByteArrayPool(DEFAULT_POOL_SIZE));
    }

    public C0035BasicNetwork(C0041HttpStack httpStack, C0036ByteArrayPool pool) {
        this.mHttpStack = httpStack;
        this.mPool = pool;
    }

    /* JADX WARNING: Removed duplicated region for block: B:115:0x0143 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public C0021NetworkResponse performRequest(C0024Request<?> request) throws C0031VolleyError {
        HttpResponse httpResponse;
        byte[] responseContents;
        byte[] responseContents2;
        Map map;
        C0024Request<?> request2 = request;
        long requestStart = SystemClock.elapsedRealtime();
        while (true) {
            long requestStart2 = requestStart;
            byte[] responseContents3 = null;
            Map hashMap = new HashMap();
            try {
                Map<String, String> headers = new HashMap<>();
                addCacheHeaders(headers, request.getCacheEntry());
                httpResponse = this.mHttpStack.performRequest(request2, headers);
                try {
                    StatusLine statusLine = httpResponse.getStatusLine();
                    int statusCode = statusLine.getStatusCode();
                    Map convertHeaders = convertHeaders(httpResponse.getAllHeaders());
                    if (statusCode == 304) {
                        try {
                            return new C0021NetworkResponse(304, request.getCacheEntry() == null ? null : request.getCacheEntry().data, convertHeaders, true);
                        } catch (SocketTimeoutException e) {
                            Map map2 = convertHeaders;
                        } catch (ConnectTimeoutException e2) {
                            Map map3 = convertHeaders;
                            attemptRetryOnException("connection", request2, new C0030TimeoutError());
                            requestStart = requestStart2;
                        } catch (MalformedURLException e3) {
                            e = e3;
                            Map map4 = convertHeaders;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Bad URL ");
                            sb.append(request.getUrl());
                            throw new RuntimeException(sb.toString(), e);
                        } catch (IOException e4) {
                            e = e4;
                            hashMap = convertHeaders;
                            if (httpResponse != null) {
                                int statusCode2 = httpResponse.getStatusLine().getStatusCode();
                                C0032VolleyLog.e("Unexpected response code %d for %s", Integer.valueOf(statusCode2), request.getUrl());
                                if (responseContents3 != null) {
                                    C0021NetworkResponse networkResponse = new C0021NetworkResponse(statusCode2, responseContents3, hashMap, false);
                                    if (statusCode2 == 401 || statusCode2 == 403) {
                                        attemptRetryOnException("auth", request2, new C0013AuthFailureError(networkResponse));
                                        requestStart = requestStart2;
                                    } else {
                                        throw new C0029ServerError(networkResponse);
                                    }
                                } else {
                                    throw new C0020NetworkError((C0021NetworkResponse) null);
                                }
                            } else {
                                throw new C0022NoConnectionError(e);
                            }
                        }
                    } else {
                        try {
                            if (httpResponse.getEntity() != null) {
                                responseContents = entityToBytes(httpResponse.getEntity());
                            } else {
                                responseContents = new byte[0];
                            }
                            byte[] responseContents4 = responseContents;
                            try {
                                responseContents2 = responseContents4;
                                map = convertHeaders;
                            } catch (SocketTimeoutException e5) {
                                byte[] bArr = responseContents4;
                                Map map5 = convertHeaders;
                                attemptRetryOnException("socket", request2, new C0030TimeoutError());
                                requestStart = requestStart2;
                            } catch (ConnectTimeoutException e6) {
                                byte[] bArr2 = responseContents4;
                                Map map6 = convertHeaders;
                                attemptRetryOnException("connection", request2, new C0030TimeoutError());
                                requestStart = requestStart2;
                            } catch (MalformedURLException e7) {
                                e = e7;
                                byte[] bArr3 = responseContents4;
                                Map map7 = convertHeaders;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("Bad URL ");
                                sb2.append(request.getUrl());
                                throw new RuntimeException(sb2.toString(), e);
                            } catch (IOException e8) {
                                e = e8;
                                responseContents3 = responseContents4;
                                hashMap = convertHeaders;
                                if (httpResponse != null) {
                                }
                            }
                            try {
                                logSlowRequests(SystemClock.elapsedRealtime() - requestStart2, request2, responseContents4, statusLine);
                                if (statusCode < 200 || statusCode > 299) {
                                } else {
                                    responseContents3 = responseContents2;
                                    try {
                                        return new C0021NetworkResponse(statusCode, responseContents3, map, false);
                                    } catch (SocketTimeoutException e9) {
                                        Map map8 = map;
                                        attemptRetryOnException("socket", request2, new C0030TimeoutError());
                                        requestStart = requestStart2;
                                    } catch (ConnectTimeoutException e10) {
                                        Map map9 = map;
                                        attemptRetryOnException("connection", request2, new C0030TimeoutError());
                                        requestStart = requestStart2;
                                    } catch (MalformedURLException e11) {
                                        e = e11;
                                        Map map10 = map;
                                        StringBuilder sb22 = new StringBuilder();
                                        sb22.append("Bad URL ");
                                        sb22.append(request.getUrl());
                                        throw new RuntimeException(sb22.toString(), e);
                                    } catch (IOException e12) {
                                        e = e12;
                                        hashMap = map;
                                        if (httpResponse != null) {
                                        }
                                    }
                                }
                            } catch (SocketTimeoutException e13) {
                                byte[] bArr4 = responseContents2;
                                Map map11 = map;
                                attemptRetryOnException("socket", request2, new C0030TimeoutError());
                                requestStart = requestStart2;
                            } catch (ConnectTimeoutException e14) {
                                byte[] bArr5 = responseContents2;
                                Map map12 = map;
                                attemptRetryOnException("connection", request2, new C0030TimeoutError());
                                requestStart = requestStart2;
                            } catch (MalformedURLException e15) {
                                e = e15;
                                byte[] bArr6 = responseContents2;
                                Map map13 = map;
                                StringBuilder sb222 = new StringBuilder();
                                sb222.append("Bad URL ");
                                sb222.append(request.getUrl());
                                throw new RuntimeException(sb222.toString(), e);
                            } catch (IOException e16) {
                                e = e16;
                                responseContents3 = responseContents2;
                                hashMap = map;
                                if (httpResponse != null) {
                                }
                            }
                        } catch (SocketTimeoutException e17) {
                            Map map14 = convertHeaders;
                            attemptRetryOnException("socket", request2, new C0030TimeoutError());
                            requestStart = requestStart2;
                        } catch (ConnectTimeoutException e18) {
                            Map map15 = convertHeaders;
                            attemptRetryOnException("connection", request2, new C0030TimeoutError());
                            requestStart = requestStart2;
                        } catch (MalformedURLException e19) {
                            e = e19;
                            Map map16 = convertHeaders;
                            StringBuilder sb2222 = new StringBuilder();
                            sb2222.append("Bad URL ");
                            sb2222.append(request.getUrl());
                            throw new RuntimeException(sb2222.toString(), e);
                        } catch (IOException e20) {
                            e = e20;
                            hashMap = convertHeaders;
                            if (httpResponse != null) {
                            }
                        }
                    }
                } catch (SocketTimeoutException e21) {
                    attemptRetryOnException("socket", request2, new C0030TimeoutError());
                    requestStart = requestStart2;
                } catch (ConnectTimeoutException e22) {
                    attemptRetryOnException("connection", request2, new C0030TimeoutError());
                    requestStart = requestStart2;
                } catch (MalformedURLException e23) {
                    e = e23;
                    StringBuilder sb22222 = new StringBuilder();
                    sb22222.append("Bad URL ");
                    sb22222.append(request.getUrl());
                    throw new RuntimeException(sb22222.toString(), e);
                } catch (IOException e24) {
                    e = e24;
                    if (httpResponse != null) {
                    }
                }
            } catch (SocketTimeoutException e25) {
                attemptRetryOnException("socket", request2, new C0030TimeoutError());
                requestStart = requestStart2;
            } catch (ConnectTimeoutException e26) {
                attemptRetryOnException("connection", request2, new C0030TimeoutError());
                requestStart = requestStart2;
            } catch (MalformedURLException e27) {
                e = e27;
                StringBuilder sb222222 = new StringBuilder();
                sb222222.append("Bad URL ");
                sb222222.append(request.getUrl());
                throw new RuntimeException(sb222222.toString(), e);
            } catch (IOException e28) {
                e = e28;
                httpResponse = null;
                if (httpResponse != null) {
                }
            }
            requestStart = requestStart2;
        }
        throw new IOException();
    }

    private void logSlowRequests(long requestLifetime, C0024Request<?> request, byte[] responseContents, StatusLine statusLine) {
        if (DEBUG || requestLifetime > ((long) SLOW_REQUEST_THRESHOLD_MS)) {
            String str = "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]";
            Object[] objArr = new Object[5];
            objArr[0] = request;
            objArr[1] = Long.valueOf(requestLifetime);
            objArr[2] = responseContents != null ? Integer.valueOf(responseContents.length) : TEDefine.FACE_BEAUTY_NULL;
            objArr[3] = Integer.valueOf(statusLine.getStatusCode());
            objArr[4] = Integer.valueOf(request.getRetryPolicy().getCurrentRetryCount());
            C0032VolleyLog.d(str, objArr);
        }
    }

    private static void attemptRetryOnException(String logPrefix, C0024Request<?> request, C0031VolleyError exception) throws C0031VolleyError {
        C0028RetryPolicy retryPolicy = request.getRetryPolicy();
        int oldTimeout = request.getTimeoutMs();
        try {
            retryPolicy.retry(exception);
            request.addMarker(String.format("%s-retry [timeout=%s]", new Object[]{logPrefix, Integer.valueOf(oldTimeout)}));
        } catch (C0031VolleyError e) {
            request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[]{logPrefix, Integer.valueOf(oldTimeout)}));
            throw e;
        }
    }

    private void addCacheHeaders(Map<String, String> headers, Entry entry) {
        if (entry != null) {
            if (entry.etag != null) {
                headers.put(HttpRequest.HEADER_IF_NONE_MATCH, entry.etag);
            }
            if (entry.serverDate > 0) {
                headers.put("If-Modified-Since", DateUtils.formatDate(new Date(entry.serverDate)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void logError(String what, String url, long start) {
        C0032VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", what, Long.valueOf(SystemClock.elapsedRealtime() - start), url);
    }

    private byte[] entityToBytes(HttpEntity entity) throws IOException, C0029ServerError {
        C0050PoolingByteArrayOutputStream bytes = new C0050PoolingByteArrayOutputStream(this.mPool, (int) entity.getContentLength());
        byte[] buffer = null;
        try {
            InputStream in = entity.getContent();
            if (in != null) {
                buffer = this.mPool.getBuf(1024);
                while (true) {
                    int read = in.read(buffer);
                    int count = read;
                    if (read == -1) {
                        break;
                    }
                    bytes.write(buffer, 0, count);
                }
                byte[] byteArray = bytes.toByteArray();
                try {
                } catch (IOException e) {
                    C0032VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
                }
                return byteArray;
            }
            throw new C0029ServerError();
        } finally {
            try {
                entity.consumeContent();
            } catch (IOException e2) {
                C0032VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
            }
            this.mPool.returnBuf(buffer);
            bytes.close();
        }
    }

    private static Map<String, String> convertHeaders(Header[] headers) {
        Map<String, String> result = new HashMap<>();
        for (int i = 0; i < headers.length; i++) {
            result.put(headers[i].getName(), headers[i].getValue());
        }
        return result;
    }
}

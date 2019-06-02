package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0017AuthFailureError;
import com.android.volley.C0018Cache.Entry;
import com.android.volley.C0022Network;
import com.android.volley.C0024NetworkError;
import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0026NoConnectionError;
import com.android.volley.C0028Request;
import com.android.volley.C0032RetryPolicy;
import com.android.volley.C0033ServerError;
import com.android.volley.C0034TimeoutError;
import com.android.volley.C0035VolleyError;
import com.android.volley.C0036VolleyLog;
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
public class C0039BasicNetwork implements C0022Network {
    protected static final boolean DEBUG = C0036VolleyLog.DEBUG;
    private static int DEFAULT_POOL_SIZE = 4096;
    private static int SLOW_REQUEST_THRESHOLD_MS = SLOW_REQUEST_THRESHOLD_MS;
    protected final C0045HttpStack mHttpStack;
    protected final C0040ByteArrayPool mPool;

    public C0039BasicNetwork(C0045HttpStack httpStack) {
        this(httpStack, new C0040ByteArrayPool(DEFAULT_POOL_SIZE));
    }

    public C0039BasicNetwork(C0045HttpStack httpStack, C0040ByteArrayPool byteArrayPool) {
        this.mHttpStack = httpStack;
        this.mPool = byteArrayPool;
    }

    private void addCacheHeaders(Map<String, String> map, Entry entry) {
        if (entry != null) {
            if (entry.etag != null) {
                map.put(HttpRequest.HEADER_IF_NONE_MATCH, entry.etag);
            }
            if (entry.serverDate > 0) {
                map.put("If-Modified-Since", DateUtils.formatDate(new Date(entry.serverDate)));
            }
        }
    }

    private static void attemptRetryOnException(String str, C0028Request<?> request, C0035VolleyError volleyError) throws C0035VolleyError {
        C0032RetryPolicy retryPolicy = request.getRetryPolicy();
        int timeoutMs = request.getTimeoutMs();
        try {
            retryPolicy.retry(volleyError);
            request.addMarker(String.format("%s-retry [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
        } catch (C0035VolleyError e) {
            request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
            throw e;
        }
    }

    private static Map<String, String> convertHeaders(Header[] headerArr) {
        HashMap hashMap = new HashMap();
        for (int i = 0; i < headerArr.length; i++) {
            hashMap.put(headerArr[i].getName(), headerArr[i].getValue());
        }
        return hashMap;
    }

    private byte[] entityToBytes(HttpEntity httpEntity) throws IOException, C0033ServerError {
        C0054PoolingByteArrayOutputStream poolingByteArrayOutputStream = new C0054PoolingByteArrayOutputStream(this.mPool, (int) httpEntity.getContentLength());
        byte[] bArr = null;
        try {
            InputStream content = httpEntity.getContent();
            if (content != null) {
                bArr = this.mPool.getBuf(1024);
                while (true) {
                    int read = content.read(bArr);
                    int i = read;
                    if (read == -1) {
                        break;
                    }
                    poolingByteArrayOutputStream.write(bArr, 0, i);
                }
                byte[] byteArray = poolingByteArrayOutputStream.toByteArray();
                try {
                } catch (IOException e) {
                    C0036VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
                }
                return byteArray;
            }
            throw new C0033ServerError();
        } finally {
            try {
                httpEntity.consumeContent();
            } catch (IOException e2) {
                C0036VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
            }
            this.mPool.returnBuf(bArr);
            poolingByteArrayOutputStream.close();
        }
    }

    private void logSlowRequests(long j, C0028Request<?> request, byte[] bArr, StatusLine statusLine) {
        if (DEBUG || j > ((long) SLOW_REQUEST_THRESHOLD_MS)) {
            String str = "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]";
            Object[] objArr = new Object[5];
            objArr[0] = request;
            objArr[1] = Long.valueOf(j);
            objArr[2] = bArr != null ? Integer.valueOf(bArr.length) : TEDefine.FACE_BEAUTY_NULL;
            objArr[3] = Integer.valueOf(statusLine.getStatusCode());
            objArr[4] = Integer.valueOf(request.getRetryPolicy().getCurrentRetryCount());
            C0036VolleyLog.d(str, objArr);
        }
    }

    /* access modifiers changed from: protected */
    public void logError(String str, String str2, long j) {
        C0036VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", str, Long.valueOf(SystemClock.elapsedRealtime() - j), str2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:115:0x0143 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00fe  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public C0025NetworkResponse performRequest(C0028Request<?> request) throws C0035VolleyError {
        HttpResponse httpResponse;
        byte[] bArr;
        Map map;
        C0028Request<?> request2 = request;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            long j = elapsedRealtime;
            byte[] bArr2 = null;
            Map hashMap = new HashMap();
            try {
                HashMap hashMap2 = new HashMap();
                addCacheHeaders(hashMap2, request.getCacheEntry());
                httpResponse = this.mHttpStack.performRequest(request2, hashMap2);
                try {
                    StatusLine statusLine = httpResponse.getStatusLine();
                    int statusCode = statusLine.getStatusCode();
                    Map convertHeaders = convertHeaders(httpResponse.getAllHeaders());
                    if (statusCode == 304) {
                        try {
                            return new C0025NetworkResponse(304, request.getCacheEntry() == null ? null : request.getCacheEntry().data, convertHeaders, true);
                        } catch (SocketTimeoutException e) {
                            Map map2 = convertHeaders;
                        } catch (ConnectTimeoutException e2) {
                            Map map3 = convertHeaders;
                            attemptRetryOnException("connection", request2, new C0034TimeoutError());
                            elapsedRealtime = j;
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
                                C0036VolleyLog.e("Unexpected response code %d for %s", Integer.valueOf(statusCode2), request.getUrl());
                                if (bArr2 != null) {
                                    C0025NetworkResponse networkResponse = new C0025NetworkResponse(statusCode2, bArr2, hashMap, false);
                                    if (statusCode2 == 401 || statusCode2 == 403) {
                                        attemptRetryOnException("auth", request2, new C0017AuthFailureError(networkResponse));
                                        elapsedRealtime = j;
                                    } else {
                                        throw new C0033ServerError(networkResponse);
                                    }
                                } else {
                                    throw new C0024NetworkError((C0025NetworkResponse) null);
                                }
                            } else {
                                throw new C0026NoConnectionError(e);
                            }
                        }
                    } else {
                        try {
                            byte[] entityToBytes = httpResponse.getEntity() != null ? entityToBytes(httpResponse.getEntity()) : new byte[0];
                            try {
                                bArr = entityToBytes;
                                map = convertHeaders;
                            } catch (SocketTimeoutException e5) {
                                byte[] bArr3 = entityToBytes;
                                Map map5 = convertHeaders;
                                attemptRetryOnException("socket", request2, new C0034TimeoutError());
                                elapsedRealtime = j;
                            } catch (ConnectTimeoutException e6) {
                                byte[] bArr4 = entityToBytes;
                                Map map6 = convertHeaders;
                                attemptRetryOnException("connection", request2, new C0034TimeoutError());
                                elapsedRealtime = j;
                            } catch (MalformedURLException e7) {
                                e = e7;
                                byte[] bArr5 = entityToBytes;
                                Map map7 = convertHeaders;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("Bad URL ");
                                sb2.append(request.getUrl());
                                throw new RuntimeException(sb2.toString(), e);
                            } catch (IOException e8) {
                                e = e8;
                                bArr2 = entityToBytes;
                                hashMap = convertHeaders;
                                if (httpResponse != null) {
                                }
                            }
                            try {
                                logSlowRequests(SystemClock.elapsedRealtime() - j, request2, entityToBytes, statusLine);
                                if (statusCode < 200 || statusCode > 299) {
                                    byte[] bArr6 = bArr;
                                } else {
                                    bArr2 = bArr;
                                    try {
                                        return new C0025NetworkResponse(statusCode, bArr2, map, false);
                                    } catch (SocketTimeoutException e9) {
                                        Map map8 = map;
                                        attemptRetryOnException("socket", request2, new C0034TimeoutError());
                                        elapsedRealtime = j;
                                    } catch (ConnectTimeoutException e10) {
                                        Map map9 = map;
                                        attemptRetryOnException("connection", request2, new C0034TimeoutError());
                                        elapsedRealtime = j;
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
                                byte[] bArr7 = bArr;
                                Map map11 = map;
                                attemptRetryOnException("socket", request2, new C0034TimeoutError());
                                elapsedRealtime = j;
                            } catch (ConnectTimeoutException e14) {
                                byte[] bArr8 = bArr;
                                Map map12 = map;
                                attemptRetryOnException("connection", request2, new C0034TimeoutError());
                                elapsedRealtime = j;
                            } catch (MalformedURLException e15) {
                                e = e15;
                                byte[] bArr9 = bArr;
                                Map map13 = map;
                                StringBuilder sb222 = new StringBuilder();
                                sb222.append("Bad URL ");
                                sb222.append(request.getUrl());
                                throw new RuntimeException(sb222.toString(), e);
                            } catch (IOException e16) {
                                e = e16;
                                bArr2 = bArr;
                                hashMap = map;
                                if (httpResponse != null) {
                                }
                            }
                        } catch (SocketTimeoutException e17) {
                            Map map14 = convertHeaders;
                            attemptRetryOnException("socket", request2, new C0034TimeoutError());
                            elapsedRealtime = j;
                        } catch (ConnectTimeoutException e18) {
                            Map map15 = convertHeaders;
                            attemptRetryOnException("connection", request2, new C0034TimeoutError());
                            elapsedRealtime = j;
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
                    attemptRetryOnException("socket", request2, new C0034TimeoutError());
                    elapsedRealtime = j;
                } catch (ConnectTimeoutException e22) {
                    attemptRetryOnException("connection", request2, new C0034TimeoutError());
                    elapsedRealtime = j;
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
                attemptRetryOnException("socket", request2, new C0034TimeoutError());
                elapsedRealtime = j;
            } catch (ConnectTimeoutException e26) {
                attemptRetryOnException("connection", request2, new C0034TimeoutError());
                elapsedRealtime = j;
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
            elapsedRealtime = j;
        }
        byte[] bArr62 = bArr;
        throw new IOException();
    }
}

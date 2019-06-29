package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.text.TextUtils;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.HttpException;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.util.e;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: HttpUrlFetcher */
public class j implements d<InputStream> {
    @VisibleForTesting
    static final b DEFAULT_CONNECTION_FACTORY = new a();
    private static final String TAG = "HttpUrlFetcher";
    private static final int eX = 5;
    private static final int eY = -1;
    private final g eZ;
    private final b fa;
    private InputStream fb;
    private volatile boolean fc;
    private final int timeout;
    private HttpURLConnection urlConnection;

    /* compiled from: HttpUrlFetcher */
    private static class a implements b {
        a() {
        }

        public HttpURLConnection c(URL url) throws IOException {
            return (HttpURLConnection) url.openConnection();
        }
    }

    /* compiled from: HttpUrlFetcher */
    interface b {
        HttpURLConnection c(URL url) throws IOException;
    }

    public j(g gVar, int i) {
        this(gVar, i, DEFAULT_CONNECTION_FACTORY);
    }

    @VisibleForTesting
    j(g gVar, int i, b bVar) {
        this.eZ = gVar;
        this.timeout = i;
        this.fa = bVar;
    }

    private InputStream a(HttpURLConnection httpURLConnection) throws IOException {
        if (TextUtils.isEmpty(httpURLConnection.getContentEncoding())) {
            this.fb = com.bumptech.glide.util.b.a(httpURLConnection.getInputStream(), (long) httpURLConnection.getContentLength());
        } else {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Got non empty content encoding: ");
                sb.append(httpURLConnection.getContentEncoding());
                Log.d(str, sb.toString());
            }
            this.fb = httpURLConnection.getInputStream();
        }
        return this.fb;
    }

    private InputStream a(URL url, int i, URL url2, Map<String, String> map) throws IOException {
        if (i < 5) {
            if (url2 != null) {
                try {
                    if (url.toURI().equals(url2.toURI())) {
                        throw new HttpException("In re-direct loop");
                    }
                } catch (URISyntaxException e) {
                }
            }
            this.urlConnection = this.fa.c(url);
            for (Entry entry : map.entrySet()) {
                this.urlConnection.addRequestProperty((String) entry.getKey(), (String) entry.getValue());
            }
            this.urlConnection.setConnectTimeout(this.timeout);
            this.urlConnection.setReadTimeout(this.timeout);
            this.urlConnection.setUseCaches(false);
            this.urlConnection.setDoInput(true);
            this.urlConnection.setInstanceFollowRedirects(false);
            this.urlConnection.connect();
            this.fb = this.urlConnection.getInputStream();
            if (this.fc) {
                return null;
            }
            int responseCode = this.urlConnection.getResponseCode();
            if (t(responseCode)) {
                return a(this.urlConnection);
            }
            if (u(responseCode)) {
                String headerField = this.urlConnection.getHeaderField(HttpRequest.HEADER_LOCATION);
                if (!TextUtils.isEmpty(headerField)) {
                    URL url3 = new URL(url, headerField);
                    cleanup();
                    return a(url3, i + 1, url, map);
                }
                throw new HttpException("Received empty or null redirect url");
            } else if (responseCode == -1) {
                throw new HttpException(responseCode);
            } else {
                throw new HttpException(this.urlConnection.getResponseMessage(), responseCode);
            }
        } else {
            throw new HttpException("Too many (> 5) redirects!");
        }
    }

    private static boolean t(int i) {
        return i / 100 == 2;
    }

    private static boolean u(int i) {
        return i / 100 == 3;
    }

    public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super InputStream> aVar) {
        StringBuilder sb;
        String str;
        long fm = e.fm();
        try {
            aVar.n(a(this.eZ.toURL(), 0, null, this.eZ.getHeaders()));
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                sb = new StringBuilder();
                sb.append("Finished http url fetcher fetch in ");
                sb.append(e.f(fm));
                Log.v(str, sb.toString());
            }
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to load data for url", e);
            }
            aVar.b(e);
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                sb = new StringBuilder();
            }
        } catch (Throwable th) {
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Finished http url fetcher fetch in ");
                sb2.append(e.f(fm));
                Log.v(TAG, sb2.toString());
            }
            throw th;
        }
    }

    @NonNull
    public Class<InputStream> aJ() {
        return InputStream.class;
    }

    @NonNull
    public DataSource aK() {
        return DataSource.REMOTE;
    }

    public void cancel() {
        this.fc = true;
    }

    public void cleanup() {
        if (this.fb != null) {
            try {
                this.fb.close();
            } catch (IOException e) {
            }
        }
        if (this.urlConnection != null) {
            this.urlConnection.disconnect();
        }
        this.urlConnection = null;
    }
}

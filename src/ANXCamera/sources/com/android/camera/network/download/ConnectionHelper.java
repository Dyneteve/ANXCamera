package com.android.camera.network.download;

import android.net.Uri;
import android.text.TextUtils;
import com.android.camera.fragment.CtaNoticeFragment.CTA;
import com.android.camera.log.Log;
import com.android.camera.network.util.NetworkUtils;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

class ConnectionHelper {
    public static final int NETWORK_TYPE_METERED = 0;
    public static final int NETWORK_TYPE_UNMETERED = 1;
    public static final int REASON_ILLEGAL_ACTIVE_NETWORK = 3;
    public static final int REASON_IO_EXCEPTION = 4;
    public static final int REASON_NETWORK_DENIED = 2;
    public static final int REASON_NO_NETWORK = 1;
    public static final int REASON_SUCCESS = 0;
    private static final String TAG = "ConnectionManager";

    static final class Holder<T> {
        public final int reason;
        public final T value;

        public Holder(int i) {
            this.value = null;
            this.reason = i;
        }

        public Holder(T t) {
            this.value = t;
            this.reason = 0;
        }
    }

    ConnectionHelper() {
    }

    static Holder<HttpURLConnection> open(Uri uri, int i) {
        String scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || TextUtils.equals(scheme, "https")) {
            return open(uri.toString(), i);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("not support scheme ");
        sb.append(scheme);
        throw new IllegalArgumentException(sb.toString());
    }

    static Holder<HttpURLConnection> open(String str, int i) {
        int verify = verify(i);
        if (verify != 0) {
            return new Holder<>(verify);
        }
        try {
            Log.d(TAG, "try open http connection");
            return new Holder<>((HttpURLConnection) new URL(str).openConnection());
        } catch (MalformedURLException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("invalid url ");
            sb.append(str);
            throw new IllegalArgumentException(sb.toString(), e);
        } catch (IOException e2) {
            Log.w(TAG, (Throwable) e2);
            return new Holder<>(4);
        }
    }

    private static int verify(int i) {
        Log.d(TAG, "refreshing network state");
        if (!NetworkUtils.isNetworkConnected()) {
            return 1;
        }
        if (!CTA.canConnectNetwork()) {
            return 2;
        }
        return (i != 1 || !NetworkUtils.isActiveNetworkMetered()) ? 0 : 3;
    }
}

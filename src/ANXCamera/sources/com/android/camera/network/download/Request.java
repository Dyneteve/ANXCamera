package com.android.camera.network.download;

import android.net.Uri;
import android.text.TextUtils;
import com.android.camera.log.Log;
import java.io.File;

public final class Request {
    private static final String TAG = "Request";
    private boolean mAllowedOverMetered;
    private File mDestination;
    private int mMaxRetryTimes = 3;
    private String mTag;
    private Uri mUri;
    private Verifier mVerifier;

    public interface Constants extends OpenConstants {
    }

    public Request(String str, Uri uri, File file) {
        this.mTag = str;
        this.mUri = uri;
        String scheme = uri.getScheme();
        if (TextUtils.equals(scheme, "http") || TextUtils.equals(scheme, "https")) {
            if (file.exists()) {
                if (!file.isDirectory()) {
                    Log.w(TAG, "output file will be overwritten");
                } else {
                    Log.d(TAG, "output file is a directory");
                    throw new IllegalStateException("dst file exists, is a directory");
                }
            }
            this.mDestination = file;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("not support scheme: ");
        sb.append(scheme);
        throw new IllegalArgumentException(sb.toString());
    }

    public File getDestination() {
        return this.mDestination;
    }

    public int getMaxRetryTimes() {
        return this.mMaxRetryTimes;
    }

    /* access modifiers changed from: 0000 */
    public int getNetworkType() {
        return this.mAllowedOverMetered ^ true ? 1 : 0;
    }

    public String getTag() {
        return this.mTag;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public Verifier getVerifier() {
        return this.mVerifier;
    }

    public boolean isAllowedOverMetered() {
        return this.mAllowedOverMetered;
    }

    public void setAllowedOverMetered(boolean z) {
        this.mAllowedOverMetered = z;
    }

    public void setMaxRetryTimes(int i) {
        this.mMaxRetryTimes = i;
    }

    public void setVerifier(Verifier verifier) {
        this.mVerifier = verifier;
    }
}

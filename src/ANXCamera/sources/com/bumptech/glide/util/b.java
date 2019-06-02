package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ContentLengthInputStream */
public final class b extends FilterInputStream {
    private static final String TAG = "ContentLengthStream";
    private static final int UNKNOWN = -1;
    private final long contentLength;
    private int pQ;

    private b(@NonNull InputStream inputStream, long j) {
        super(inputStream);
        this.contentLength = j;
    }

    private static int G(@Nullable String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return Integer.parseInt(str);
            } catch (NumberFormatException e) {
                if (Log.isLoggable(TAG, 3)) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("failed to parse content length header: ");
                    sb.append(str);
                    Log.d(str2, sb.toString(), e);
                }
            }
        }
        return -1;
    }

    private int W(int i) throws IOException {
        if (i >= 0) {
            this.pQ += i;
        } else if (this.contentLength - ((long) this.pQ) > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to read all expected data, expected: ");
            sb.append(this.contentLength);
            sb.append(", but read: ");
            sb.append(this.pQ);
            throw new IOException(sb.toString());
        }
        return i;
    }

    @NonNull
    public static InputStream a(@NonNull InputStream inputStream, long j) {
        return new b(inputStream, j);
    }

    @NonNull
    public static InputStream b(@NonNull InputStream inputStream, @Nullable String str) {
        return a(inputStream, (long) G(str));
    }

    public synchronized int available() throws IOException {
        return (int) Math.max(this.contentLength - ((long) this.pQ), (long) this.in.available());
    }

    public synchronized int read() throws IOException {
        int read;
        read = super.read();
        W(read >= 0 ? 1 : -1);
        return read;
    }

    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    public synchronized int read(byte[] bArr, int i, int i2) throws IOException {
        return W(super.read(bArr, i, i2));
    }
}

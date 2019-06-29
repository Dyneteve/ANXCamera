package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: MarkEnforcingInputStream */
public class g extends FilterInputStream {
    private static final int UNSET = Integer.MIN_VALUE;
    private static final int qX = -1;
    private int qY = Integer.MIN_VALUE;

    public g(@NonNull InputStream inputStream) {
        super(inputStream);
    }

    private long g(long j) {
        if (this.qY == 0) {
            return -1;
        }
        return (this.qY == Integer.MIN_VALUE || j <= ((long) this.qY)) ? j : (long) this.qY;
    }

    private void h(long j) {
        if (this.qY != Integer.MIN_VALUE && j != -1) {
            this.qY = (int) (((long) this.qY) - j);
        }
    }

    public int available() throws IOException {
        return this.qY == Integer.MIN_VALUE ? super.available() : Math.min(this.qY, super.available());
    }

    public synchronized void mark(int i) {
        super.mark(i);
        this.qY = i;
    }

    public int read() throws IOException {
        if (g(1) == -1) {
            return -1;
        }
        int read = super.read();
        h(1);
        return read;
    }

    public int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
        int g = (int) g((long) i2);
        if (g == -1) {
            return -1;
        }
        int read = super.read(bArr, i, g);
        h((long) read);
        return read;
    }

    public synchronized void reset() throws IOException {
        super.reset();
        this.qY = Integer.MIN_VALUE;
    }

    public long skip(long j) throws IOException {
        long g = g(j);
        if (g == -1) {
            return 0;
        }
        long skip = super.skip(g);
        h(skip);
        return skip;
    }
}

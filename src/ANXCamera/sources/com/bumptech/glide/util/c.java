package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> pP = k.Y(0);
    private InputStream pQ;
    private IOException pR;

    c() {
    }

    static void eI() {
        while (!pP.isEmpty()) {
            pP.remove();
        }
    }

    @NonNull
    public static c h(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (pP) {
            cVar = (c) pP.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    public int available() throws IOException {
        return this.pQ.available();
    }

    public void close() throws IOException {
        this.pQ.close();
    }

    @Nullable
    public IOException eJ() {
        return this.pR;
    }

    public void mark(int i) {
        this.pQ.mark(i);
    }

    public boolean markSupported() {
        return this.pQ.markSupported();
    }

    public int read() {
        try {
            return this.pQ.read();
        } catch (IOException e) {
            this.pR = e;
            return -1;
        }
    }

    public int read(byte[] bArr) {
        try {
            return this.pQ.read(bArr);
        } catch (IOException e) {
            this.pR = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.pQ.read(bArr, i, i2);
        } catch (IOException e) {
            this.pR = e;
            return -1;
        }
    }

    public void release() {
        this.pR = null;
        this.pQ = null;
        synchronized (pP) {
            pP.offer(this);
        }
    }

    public synchronized void reset() throws IOException {
        this.pQ.reset();
    }

    /* access modifiers changed from: 0000 */
    public void setInputStream(@NonNull InputStream inputStream) {
        this.pQ = inputStream;
    }

    public long skip(long j) {
        try {
            return this.pQ.skip(j);
        } catch (IOException e) {
            this.pR = e;
            return 0;
        }
    }
}

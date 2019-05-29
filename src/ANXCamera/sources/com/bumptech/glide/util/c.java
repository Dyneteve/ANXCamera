package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> pQ = k.Y(0);
    private InputStream pR;
    private IOException pS;

    c() {
    }

    static void eI() {
        while (!pQ.isEmpty()) {
            pQ.remove();
        }
    }

    @NonNull
    public static c h(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (pQ) {
            cVar = (c) pQ.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    public int available() throws IOException {
        return this.pR.available();
    }

    public void close() throws IOException {
        this.pR.close();
    }

    @Nullable
    public IOException eJ() {
        return this.pS;
    }

    public void mark(int i) {
        this.pR.mark(i);
    }

    public boolean markSupported() {
        return this.pR.markSupported();
    }

    public int read() {
        try {
            return this.pR.read();
        } catch (IOException e) {
            this.pS = e;
            return -1;
        }
    }

    public int read(byte[] bArr) {
        try {
            return this.pR.read(bArr);
        } catch (IOException e) {
            this.pS = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.pR.read(bArr, i, i2);
        } catch (IOException e) {
            this.pS = e;
            return -1;
        }
    }

    public void release() {
        this.pS = null;
        this.pR = null;
        synchronized (pQ) {
            pQ.offer(this);
        }
    }

    public synchronized void reset() throws IOException {
        this.pR.reset();
    }

    /* access modifiers changed from: 0000 */
    public void setInputStream(@NonNull InputStream inputStream) {
        this.pR = inputStream;
    }

    public long skip(long j) {
        try {
            return this.pR.skip(j);
        } catch (IOException e) {
            this.pS = e;
            return 0;
        }
    }
}

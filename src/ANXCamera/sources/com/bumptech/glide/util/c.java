package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> pR = k.Y(0);
    private InputStream pS;
    private IOException pT;

    c() {
    }

    static void eI() {
        while (!pR.isEmpty()) {
            pR.remove();
        }
    }

    @NonNull
    public static c h(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (pR) {
            cVar = (c) pR.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    public int available() throws IOException {
        return this.pS.available();
    }

    public void close() throws IOException {
        this.pS.close();
    }

    @Nullable
    public IOException eJ() {
        return this.pT;
    }

    public void mark(int i) {
        this.pS.mark(i);
    }

    public boolean markSupported() {
        return this.pS.markSupported();
    }

    public int read() {
        try {
            return this.pS.read();
        } catch (IOException e) {
            this.pT = e;
            return -1;
        }
    }

    public int read(byte[] bArr) {
        try {
            return this.pS.read(bArr);
        } catch (IOException e) {
            this.pT = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.pS.read(bArr, i, i2);
        } catch (IOException e) {
            this.pT = e;
            return -1;
        }
    }

    public void release() {
        this.pT = null;
        this.pS = null;
        synchronized (pR) {
            pR.offer(this);
        }
    }

    public synchronized void reset() throws IOException {
        this.pS.reset();
    }

    /* access modifiers changed from: 0000 */
    public void setInputStream(@NonNull InputStream inputStream) {
        this.pS = inputStream;
    }

    public long skip(long j) {
        try {
            return this.pS.skip(j);
        } catch (IOException e) {
            this.pT = e;
            return 0;
        }
    }
}

package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> qR = k.ac(0);
    private InputStream qS;
    private IOException qT;

    c() {
    }

    static void fk() {
        while (!qR.isEmpty()) {
            qR.remove();
        }
    }

    @NonNull
    public static c i(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (qR) {
            cVar = (c) qR.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    public int available() throws IOException {
        return this.qS.available();
    }

    public void close() throws IOException {
        this.qS.close();
    }

    @Nullable
    public IOException fl() {
        return this.qT;
    }

    public void mark(int i) {
        this.qS.mark(i);
    }

    public boolean markSupported() {
        return this.qS.markSupported();
    }

    public int read() {
        try {
            return this.qS.read();
        } catch (IOException e) {
            this.qT = e;
            return -1;
        }
    }

    public int read(byte[] bArr) {
        try {
            return this.qS.read(bArr);
        } catch (IOException e) {
            this.qT = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.qS.read(bArr, i, i2);
        } catch (IOException e) {
            this.qT = e;
            return -1;
        }
    }

    public void release() {
        this.qT = null;
        this.qS = null;
        synchronized (qR) {
            qR.offer(this);
        }
    }

    public synchronized void reset() throws IOException {
        this.qS.reset();
    }

    /* access modifiers changed from: 0000 */
    public void setInputStream(@NonNull InputStream inputStream) {
        this.qS = inputStream;
    }

    public long skip(long j) {
        try {
            return this.qS.skip(j);
        } catch (IOException e) {
            this.qT = e;
            return 0;
        }
    }
}

package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* compiled from: StreamEncoder */
public class s implements a<InputStream> {
    private static final String TAG = "StreamEncoder";
    private final b ef;

    public s(b bVar) {
        this.ef = bVar;
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x003d A[Catch:{ all -> 0x0031 }] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0046 A[SYNTHETIC, Splitter:B:24:0x0046] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0054 A[SYNTHETIC, Splitter:B:30:0x0054] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean a(@NonNull InputStream inputStream, @NonNull File file, @NonNull f fVar) {
        byte[] bArr = (byte[]) this.ef.a(65536, byte[].class);
        boolean z = false;
        OutputStream outputStream = null;
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                } catch (IOException e) {
                    e = e;
                    outputStream = fileOutputStream;
                    try {
                        if (Log.isLoggable(TAG, 3)) {
                        }
                        if (outputStream != null) {
                        }
                        this.ef.put(bArr);
                        return z;
                    } catch (Throwable th) {
                        th = th;
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e2) {
                            }
                        }
                        this.ef.put(bArr);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    outputStream = fileOutputStream;
                    if (outputStream != null) {
                    }
                    this.ef.put(bArr);
                    throw th;
                }
            }
            fileOutputStream.close();
            z = true;
            try {
                fileOutputStream.close();
            } catch (IOException e3) {
            }
        } catch (IOException e4) {
            e = e4;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to encode data onto the OutputStream", e);
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e5) {
                }
            }
            this.ef.put(bArr);
            return z;
        }
        this.ef.put(bArr);
        return z;
    }
}

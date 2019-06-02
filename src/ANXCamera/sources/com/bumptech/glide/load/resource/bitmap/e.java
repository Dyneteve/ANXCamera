package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.a.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.util.k;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* compiled from: BitmapEncoder */
public class e implements h<Bitmap> {
    private static final String TAG = "BitmapEncoder";
    public static final com.bumptech.glide.load.e<Integer> kD = com.bumptech.glide.load.e.a("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", Integer.valueOf(90));
    public static final com.bumptech.glide.load.e<CompressFormat> kE = com.bumptech.glide.load.e.q("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat");
    @Nullable
    private final b ar;

    @Deprecated
    public e() {
        this.ar = null;
    }

    public e(@NonNull b bVar) {
        this.ar = bVar;
    }

    private CompressFormat a(Bitmap bitmap, f fVar) {
        CompressFormat compressFormat = (CompressFormat) fVar.a(kE);
        return compressFormat != null ? compressFormat : bitmap.hasAlpha() ? CompressFormat.PNG : CompressFormat.JPEG;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0065 A[Catch:{ all -> 0x0059 }] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006e A[SYNTHETIC, Splitter:B:30:0x006e] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x007b A[Catch:{ all -> 0x00d0 }] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00ca A[SYNTHETIC, Splitter:B:40:0x00ca] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean a(@NonNull p<Bitmap> pVar, @NonNull File file, @NonNull f fVar) {
        Bitmap bitmap = (Bitmap) pVar.get();
        CompressFormat a = a(bitmap, fVar);
        com.bumptech.glide.util.a.b.a("encode: [%dx%d] %s", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()), a);
        try {
            long eK = com.bumptech.glide.util.e.eK();
            int intValue = ((Integer) fVar.a(kD)).intValue();
            boolean z = false;
            OutputStream outputStream = null;
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                try {
                    outputStream = this.ar != null ? new c(fileOutputStream, this.ar) : fileOutputStream;
                    bitmap.compress(a, intValue, outputStream);
                    outputStream.close();
                    z = true;
                } catch (IOException e) {
                    e = e;
                    outputStream = fileOutputStream;
                    try {
                        if (Log.isLoggable(TAG, 3)) {
                        }
                        if (outputStream != null) {
                        }
                        if (Log.isLoggable(TAG, 2)) {
                        }
                        return z;
                    } catch (Throwable th) {
                        th = th;
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e2) {
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    outputStream = fileOutputStream;
                    if (outputStream != null) {
                    }
                    throw th;
                }
                try {
                    outputStream.close();
                } catch (IOException e3) {
                }
            } catch (IOException e4) {
                e = e4;
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Failed to encode Bitmap", e);
                }
                if (outputStream != null) {
                    outputStream.close();
                }
                if (Log.isLoggable(TAG, 2)) {
                }
                return z;
            }
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Compressed with type: ");
                sb.append(a);
                sb.append(" of size ");
                sb.append(k.p(bitmap));
                sb.append(" in ");
                sb.append(com.bumptech.glide.util.e.f(eK));
                sb.append(", options format: ");
                sb.append(fVar.a(kE));
                sb.append(", hasAlpha: ");
                sb.append(bitmap.hasAlpha());
                Log.v(str, sb.toString());
            }
            return z;
        } finally {
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    @NonNull
    public EncodeStrategy b(@NonNull f fVar) {
        return EncodeStrategy.TRANSFORMED;
    }
}

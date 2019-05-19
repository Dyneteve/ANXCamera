package com.bumptech.glide.load.resource.gif;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.List;

/* compiled from: StreamGifDecoder */
public class h implements g<InputStream, b> {
    private static final String TAG = "StreamGifDecoder";
    private final b ed;
    private final List<ImageHeaderParser> eu;
    private final g<ByteBuffer, b> mG;

    public h(List<ImageHeaderParser> list, g<ByteBuffer, b> gVar, b bVar) {
        this.eu = list;
        this.mG = gVar;
        this.ed = bVar;
    }

    private static byte[] f(InputStream inputStream) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(16384);
        try {
            byte[] bArr = new byte[16384];
            while (true) {
                int read = inputStream.read(bArr);
                if (read != -1) {
                    byteArrayOutputStream.write(bArr, 0, read);
                } else {
                    byteArrayOutputStream.flush();
                    return byteArrayOutputStream.toByteArray();
                }
            }
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Error reading data from stream", e);
            }
            return null;
        }
    }

    public p<b> a(@NonNull InputStream inputStream, int i, int i2, @NonNull f fVar) throws IOException {
        byte[] f = f(inputStream);
        if (f == null) {
            return null;
        }
        return this.mG.a(ByteBuffer.wrap(f), i, i2, fVar);
    }

    public boolean a(@NonNull InputStream inputStream, @NonNull f fVar) throws IOException {
        return !((Boolean) fVar.a(g.mF)).booleanValue() && com.bumptech.glide.load.b.a(this.eu, inputStream, this.ed) == ImageType.GIF;
    }
}

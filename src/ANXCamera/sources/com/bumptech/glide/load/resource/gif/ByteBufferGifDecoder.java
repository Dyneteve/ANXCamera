package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.b.a;
import com.bumptech.glide.b.a.C0003a;
import com.bumptech.glide.b.c;
import com.bumptech.glide.b.d;
import com.bumptech.glide.b.e;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.k;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Queue;

public class ByteBufferGifDecoder implements g<ByteBuffer, b> {
    private static final String TAG = "BufferGifDecoder";
    private static final GifDecoderFactory mf = new GifDecoderFactory();
    private static final GifHeaderParserPool mg = new GifHeaderParserPool();
    private final Context context;
    private final List<ImageHeaderParser> ew;
    private final GifHeaderParserPool mh;
    private final GifDecoderFactory mi;
    private final a mj;

    @VisibleForTesting
    static class GifDecoderFactory {
        GifDecoderFactory() {
        }

        /* access modifiers changed from: 0000 */
        public a a(C0003a aVar, c cVar, ByteBuffer byteBuffer, int i) {
            return new e(aVar, cVar, byteBuffer, i);
        }
    }

    @VisibleForTesting
    static class GifHeaderParserPool {
        private final Queue<d> hV = k.Y(0);

        GifHeaderParserPool() {
        }

        /* access modifiers changed from: 0000 */
        public synchronized void a(d dVar) {
            dVar.clear();
            this.hV.offer(dVar);
        }

        /* access modifiers changed from: 0000 */
        public synchronized d e(ByteBuffer byteBuffer) {
            d dVar;
            dVar = (d) this.hV.poll();
            if (dVar == null) {
                dVar = new d();
            }
            return dVar.a(byteBuffer);
        }
    }

    public ByteBufferGifDecoder(Context context2) {
        this(context2, com.bumptech.glide.c.c(context2).r().w(), com.bumptech.glide.c.c(context2).k(), com.bumptech.glide.c.c(context2).l());
    }

    public ByteBufferGifDecoder(Context context2, List<ImageHeaderParser> list, com.bumptech.glide.load.engine.bitmap_recycle.d dVar, b bVar) {
        this(context2, list, dVar, bVar, mg, mf);
    }

    @VisibleForTesting
    ByteBufferGifDecoder(Context context2, List<ImageHeaderParser> list, com.bumptech.glide.load.engine.bitmap_recycle.d dVar, b bVar, GifHeaderParserPool gifHeaderParserPool, GifDecoderFactory gifDecoderFactory) {
        this.context = context2.getApplicationContext();
        this.ew = list;
        this.mi = gifDecoderFactory;
        this.mj = new a(dVar, bVar);
        this.mh = gifHeaderParserPool;
    }

    private static int a(c cVar, int i, int i2) {
        int min = Math.min(cVar.getHeight() / i2, cVar.getWidth() / i);
        int max = Math.max(1, min == 0 ? 0 : Integer.highestOneBit(min));
        if (Log.isLoggable(TAG, 2) && max > 1) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Downsampling GIF, sampleSize: ");
            sb.append(max);
            sb.append(", target dimens: [");
            sb.append(i);
            sb.append("x");
            sb.append(i2);
            sb.append("], actual dimens: [");
            sb.append(cVar.getWidth());
            sb.append("x");
            sb.append(cVar.getHeight());
            sb.append("]");
            Log.v(str, sb.toString());
        }
        return max;
    }

    @Nullable
    private d a(ByteBuffer byteBuffer, int i, int i2, d dVar, f fVar) {
        long eK = com.bumptech.glide.util.e.eK();
        try {
            c ac = dVar.ac();
            if (ac.ab() > 0) {
                if (ac.getStatus() == 0) {
                    Config config = fVar.a(g.lo) == DecodeFormat.PREFER_RGB_565 ? Config.RGB_565 : Config.ARGB_8888;
                    int i3 = i;
                    int i4 = i2;
                    a a = this.mi.a(this.mj, ac, byteBuffer, a(ac, i3, i4));
                    a.a(config);
                    a.advance();
                    Bitmap aa = a.aa();
                    if (aa == null) {
                        if (Log.isLoggable(TAG, 2)) {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Decoded GIF from stream in ");
                            sb.append(com.bumptech.glide.util.e.f(eK));
                            Log.v(str, sb.toString());
                        }
                        return null;
                    }
                    b bVar = new b(this.context, a, com.bumptech.glide.load.resource.b.cm(), i3, i4, aa);
                    d dVar2 = new d(bVar);
                    if (Log.isLoggable(TAG, 2)) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Decoded GIF from stream in ");
                        sb2.append(com.bumptech.glide.util.e.f(eK));
                        Log.v(str2, sb2.toString());
                    }
                    return dVar2;
                }
            }
            if (Log.isLoggable(TAG, 2)) {
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Decoded GIF from stream in ");
                sb3.append(com.bumptech.glide.util.e.f(eK));
                Log.v(str3, sb3.toString());
            }
            return null;
        } catch (Throwable th) {
            if (Log.isLoggable(TAG, 2)) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Decoded GIF from stream in ");
                sb4.append(com.bumptech.glide.util.e.f(eK));
                Log.v(TAG, sb4.toString());
            }
            throw th;
        }
    }

    public boolean a(@NonNull ByteBuffer byteBuffer, @NonNull f fVar) throws IOException {
        return !((Boolean) fVar.a(g.mH)).booleanValue() && com.bumptech.glide.load.b.a(this.ew, byteBuffer) == ImageType.GIF;
    }

    /* renamed from: b */
    public d a(@NonNull ByteBuffer byteBuffer, int i, int i2, @NonNull f fVar) {
        d e = this.mh.e(byteBuffer);
        try {
            d a = a(byteBuffer, i, i2, e, fVar);
            return a;
        } finally {
            this.mh.a(e);
        }
    }
}

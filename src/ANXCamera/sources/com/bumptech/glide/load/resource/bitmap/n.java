package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import android.support.annotation.Nullable;
import android.util.DisplayMetrics;
import android.util.Log;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.load.e;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy.SampleSizeRounding;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.List;
import java.util.Queue;
import java.util.Set;

/* compiled from: Downsampler */
public final class n {
    static final String TAG = "Downsampler";
    private static final int eG = 10485760;
    public static final e<DecodeFormat> mn = e.a("com.bumptech.glide.load.resource.bitmap.Downsampler.DecodeFormat", DecodeFormat.eq);
    @Deprecated
    public static final e<DownsampleStrategy> mo = DownsampleStrategy.mj;
    public static final e<Boolean> mp = e.a("com.bumptech.glide.load.resource.bitmap.Downsampler.FixBitmapSize", Boolean.valueOf(false));
    public static final e<Boolean> mq = e.q("com.bumtpech.glide.load.resource.bitmap.Downsampler.AllowHardwareDecode");
    private static final String mr = "image/vnd.wap.wbmp";
    private static final String ms = "image/x-ico";
    private static final Set<String> mt = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[]{mr, ms})));
    private static final a mu = new a() {
        public void a(d dVar, Bitmap bitmap) {
        }

        public void cV() {
        }
    };
    private static final Set<ImageType> mv = Collections.unmodifiableSet(EnumSet.of(ImageType.JPEG, ImageType.PNG_A, ImageType.PNG));
    private static final Queue<Options> mw = k.ac(0);
    private final d bm;
    private final b ff;
    private final List<ImageHeaderParser> fw;
    private final DisplayMetrics jE;
    private final r mx = r.cX();

    /* compiled from: Downsampler */
    public interface a {
        void a(d dVar, Bitmap bitmap) throws IOException;

        void cV();
    }

    public n(List<ImageHeaderParser> list, DisplayMetrics displayMetrics, d dVar, b bVar) {
        this.fw = list;
        this.jE = (DisplayMetrics) i.checkNotNull(displayMetrics);
        this.bm = (d) i.checkNotNull(dVar);
        this.ff = (b) i.checkNotNull(bVar);
    }

    private static int a(double d) {
        int b = b(d);
        int c = c(((double) b) * d);
        return c((d / ((double) (((float) c) / ((float) b)))) * ((double) c));
    }

    private Bitmap a(InputStream inputStream, Options options, DownsampleStrategy downsampleStrategy, DecodeFormat decodeFormat, boolean z, int i, int i2, boolean z2, a aVar) throws IOException {
        int i3;
        int i4;
        int i5;
        InputStream inputStream2 = inputStream;
        Options options2 = options;
        a aVar2 = aVar;
        long fm = com.bumptech.glide.util.e.fm();
        int[] a2 = a(inputStream2, options2, aVar2, this.bm);
        boolean z3 = false;
        int i6 = a2[0];
        int i7 = a2[1];
        String str = options2.outMimeType;
        boolean z4 = (i6 == -1 || i7 == -1) ? false : z;
        int b = com.bumptech.glide.load.b.b(this.fw, inputStream2, this.ff);
        int I = w.I(b);
        boolean J = w.J(b);
        int i8 = i;
        int i9 = i8 == Integer.MIN_VALUE ? i6 : i8;
        int i10 = i2;
        int i11 = i10 == Integer.MIN_VALUE ? i7 : i10;
        ImageType a3 = com.bumptech.glide.load.b.a(this.fw, inputStream2, this.ff);
        ImageType imageType = a3;
        a(a3, inputStream2, aVar2, this.bm, downsampleStrategy, I, i6, i7, i9, i11, options2);
        int i12 = b;
        String str2 = str;
        int i13 = i7;
        int i14 = i6;
        a aVar3 = aVar2;
        Options options3 = options2;
        a(inputStream2, decodeFormat, z4, J, options2, i9, i11);
        if (VERSION.SDK_INT >= 19) {
            z3 = true;
        }
        if ((options3.inSampleSize == 1 || z3) && a(imageType)) {
            if (i14 < 0 || i13 < 0 || !z2 || !z3) {
                float f = a(options) ? ((float) options3.inTargetDensity) / ((float) options3.inDensity) : 1.0f;
                int i15 = options3.inSampleSize;
                float f2 = (float) i15;
                int ceil = (int) Math.ceil((double) (((float) i14) / f2));
                int ceil2 = (int) Math.ceil((double) (((float) i13) / f2));
                i5 = Math.round(((float) ceil) * f);
                i4 = Math.round(((float) ceil2) * f);
                if (Log.isLoggable(TAG, 2)) {
                    String str3 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Calculated target [");
                    sb.append(i5);
                    sb.append("x");
                    sb.append(i4);
                    sb.append("] for source [");
                    sb.append(i14);
                    sb.append("x");
                    sb.append(i13);
                    sb.append("], sampleSize: ");
                    sb.append(i15);
                    sb.append(", targetDensity: ");
                    sb.append(options3.inTargetDensity);
                    sb.append(", density: ");
                    sb.append(options3.inDensity);
                    sb.append(", density multiplier: ");
                    sb.append(f);
                    Log.v(str3, sb.toString());
                }
            } else {
                i5 = i9;
                i4 = i11;
            }
            if (i5 > 0 && i4 > 0) {
                a(options3, this.bm, i5, i4);
            }
        }
        Bitmap b2 = b(inputStream, options3, aVar3, this.bm);
        aVar3.a(this.bm, b2);
        if (Log.isLoggable(TAG, 2)) {
            i3 = i12;
            a(i14, i13, str2, options3, b2, i, i2, fm);
        } else {
            i3 = i12;
        }
        Bitmap bitmap = null;
        if (b2 != null) {
            b2.setDensity(this.jE.densityDpi);
            bitmap = w.a(this.bm, b2, i3);
            if (!b2.equals(bitmap)) {
                this.bm.d(b2);
            }
        }
        return bitmap;
    }

    private static IOException a(IllegalArgumentException illegalArgumentException, int i, int i2, String str, Options options) {
        StringBuilder sb = new StringBuilder();
        sb.append("Exception decoding bitmap, outWidth: ");
        sb.append(i);
        sb.append(", outHeight: ");
        sb.append(i2);
        sb.append(", outMimeType: ");
        sb.append(str);
        sb.append(", inBitmap: ");
        sb.append(b(options));
        return new IOException(sb.toString(), illegalArgumentException);
    }

    private static void a(int i, int i2, String str, Options options, Bitmap bitmap, int i3, int i4, long j) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Decoded ");
        sb.append(g(bitmap));
        sb.append(" from [");
        sb.append(i);
        sb.append("x");
        sb.append(i2);
        sb.append("] ");
        sb.append(str);
        sb.append(" with inBitmap ");
        sb.append(b(options));
        sb.append(" for [");
        sb.append(i3);
        sb.append("x");
        sb.append(i4);
        sb.append("], sample size: ");
        sb.append(options.inSampleSize);
        sb.append(", density: ");
        sb.append(options.inDensity);
        sb.append(", target density: ");
        sb.append(options.inTargetDensity);
        sb.append(", thread: ");
        sb.append(Thread.currentThread().getName());
        sb.append(", duration: ");
        sb.append(com.bumptech.glide.util.e.f(j));
        Log.v(str2, sb.toString());
    }

    @TargetApi(26)
    private static void a(Options options, d dVar, int i, int i2) {
        Config config;
        if (VERSION.SDK_INT < 26) {
            config = null;
        } else if (options.inPreferredConfig != Config.HARDWARE) {
            config = options.outConfig;
        } else {
            return;
        }
        if (config == null) {
            config = options.inPreferredConfig;
        }
        options.inBitmap = dVar.g(i, i2, config);
    }

    private static void a(ImageType imageType, InputStream inputStream, a aVar, d dVar, DownsampleStrategy downsampleStrategy, int i, int i2, int i3, int i4, int i5, Options options) throws IOException {
        int i6;
        int i7;
        int i8;
        ImageType imageType2 = imageType;
        DownsampleStrategy downsampleStrategy2 = downsampleStrategy;
        int i9 = i;
        int i10 = i2;
        int i11 = i3;
        int i12 = i4;
        int i13 = i5;
        Options options2 = options;
        if (i10 <= 0 || i11 <= 0) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to determine dimensions for: ");
                sb.append(imageType2);
                sb.append(" with target [");
                sb.append(i12);
                sb.append("x");
                sb.append(i13);
                sb.append("]");
                Log.d(str, sb.toString());
            }
            return;
        }
        float a2 = (i9 == 90 || i9 == 270) ? downsampleStrategy2.a(i11, i10, i12, i13) : downsampleStrategy2.a(i10, i11, i12, i13);
        if (a2 > 0.0f) {
            SampleSizeRounding b = downsampleStrategy2.b(i10, i11, i12, i13);
            if (b != null) {
                float f = (float) i10;
                float f2 = (float) i11;
                int c = i10 / c((double) (a2 * f));
                int c2 = i11 / c((double) (a2 * f2));
                int max = b == SampleSizeRounding.MEMORY ? Math.max(c, c2) : Math.min(c, c2);
                if (VERSION.SDK_INT > 23 || !mt.contains(options2.outMimeType)) {
                    int max2 = Math.max(1, Integer.highestOneBit(max));
                    i6 = (b != SampleSizeRounding.MEMORY || ((float) max2) >= 1.0f / a2) ? max2 : max2 << 1;
                } else {
                    i6 = 1;
                }
                options2.inSampleSize = i6;
                if (imageType2 == ImageType.JPEG) {
                    float min = (float) Math.min(i6, 8);
                    i7 = (int) Math.ceil((double) (f / min));
                    i8 = (int) Math.ceil((double) (f2 / min));
                    int i14 = i6 / 8;
                    if (i14 > 0) {
                        i7 /= i14;
                        i8 /= i14;
                    }
                } else if (imageType2 == ImageType.PNG || imageType2 == ImageType.PNG_A) {
                    float f3 = (float) i6;
                    i7 = (int) Math.floor((double) (f / f3));
                    i8 = (int) Math.floor((double) (f2 / f3));
                } else if (imageType2 == ImageType.WEBP || imageType2 == ImageType.WEBP_A) {
                    if (VERSION.SDK_INT >= 24) {
                        float f4 = (float) i6;
                        i7 = Math.round(f / f4);
                        i8 = Math.round(f2 / f4);
                    } else {
                        float f5 = (float) i6;
                        i7 = (int) Math.floor((double) (f / f5));
                        i8 = (int) Math.floor((double) (f2 / f5));
                    }
                } else if (i10 % i6 == 0 && i11 % i6 == 0) {
                    i7 = i10 / i6;
                    i8 = i11 / i6;
                } else {
                    int[] a3 = a(inputStream, options2, aVar, dVar);
                    i7 = a3[0];
                    i8 = a3[1];
                }
                double a4 = (double) downsampleStrategy2.a(i7, i8, i12, i13);
                if (VERSION.SDK_INT >= 19) {
                    options2.inTargetDensity = a(a4);
                    options2.inDensity = b(a4);
                }
                if (a(options)) {
                    options2.inScaled = true;
                } else {
                    options2.inTargetDensity = 0;
                    options2.inDensity = 0;
                }
                if (Log.isLoggable(TAG, 2)) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Calculate scaling, source: [");
                    sb2.append(i10);
                    sb2.append("x");
                    sb2.append(i11);
                    sb2.append("], target: [");
                    sb2.append(i12);
                    sb2.append("x");
                    sb2.append(i13);
                    sb2.append("], power of two scaled: [");
                    sb2.append(i7);
                    sb2.append("x");
                    sb2.append(i8);
                    sb2.append("], exact scale factor: ");
                    sb2.append(a2);
                    sb2.append(", power of 2 sample size: ");
                    sb2.append(i6);
                    sb2.append(", adjusted scale factor: ");
                    sb2.append(a4);
                    sb2.append(", target density: ");
                    sb2.append(options2.inTargetDensity);
                    sb2.append(", density: ");
                    sb2.append(options2.inDensity);
                    Log.v(str2, sb2.toString());
                }
                return;
            }
            throw new IllegalArgumentException("Cannot round with null rounding");
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Cannot scale with factor: ");
        sb3.append(a2);
        sb3.append(" from: ");
        sb3.append(downsampleStrategy2);
        sb3.append(", source: [");
        sb3.append(i10);
        sb3.append("x");
        sb3.append(i11);
        sb3.append("], target: [");
        sb3.append(i12);
        sb3.append("x");
        sb3.append(i13);
        sb3.append("]");
        throw new IllegalArgumentException(sb3.toString());
    }

    private void a(InputStream inputStream, DecodeFormat decodeFormat, boolean z, boolean z2, Options options, int i, int i2) {
        boolean z3;
        if (!this.mx.a(i, i2, options, decodeFormat, z, z2)) {
            if (decodeFormat == DecodeFormat.PREFER_ARGB_8888 || decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE || VERSION.SDK_INT == 16) {
                options.inPreferredConfig = Config.ARGB_8888;
                return;
            }
            try {
                z3 = com.bumptech.glide.load.b.a(this.fw, inputStream, this.ff).hasAlpha();
            } catch (IOException e) {
                if (Log.isLoggable(TAG, 3)) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Cannot determine whether the image has alpha or not from header, format ");
                    sb.append(decodeFormat);
                    Log.d(str, sb.toString(), e);
                }
                z3 = false;
            }
            options.inPreferredConfig = z3 ? Config.ARGB_8888 : Config.RGB_565;
            if (options.inPreferredConfig == Config.RGB_565) {
                options.inDither = true;
            }
        }
    }

    private static boolean a(Options options) {
        return options.inTargetDensity > 0 && options.inDensity > 0 && options.inTargetDensity != options.inDensity;
    }

    private boolean a(ImageType imageType) {
        if (VERSION.SDK_INT >= 19) {
            return true;
        }
        return mv.contains(imageType);
    }

    private static int[] a(InputStream inputStream, Options options, a aVar, d dVar) throws IOException {
        options.inJustDecodeBounds = true;
        b(inputStream, options, aVar, dVar);
        options.inJustDecodeBounds = false;
        return new int[]{options.outWidth, options.outHeight};
    }

    private static int b(double d) {
        if (d > 1.0d) {
            d = 1.0d / d;
        }
        return (int) Math.round(2.147483647E9d * d);
    }

    private static Bitmap b(InputStream inputStream, Options options, a aVar, d dVar) throws IOException {
        IOException a2;
        if (options.inJustDecodeBounds) {
            inputStream.mark(eG);
        } else {
            aVar.cV();
        }
        int i = options.outWidth;
        int i2 = options.outHeight;
        String str = options.outMimeType;
        w.dc().lock();
        try {
            Bitmap decodeStream = BitmapFactory.decodeStream(inputStream, null, options);
            w.dc().unlock();
            if (options.inJustDecodeBounds) {
                inputStream.reset();
            }
            return decodeStream;
        } catch (IOException e) {
            throw a2;
        } catch (IllegalArgumentException e2) {
            a2 = a(e2, i, i2, str, options);
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to decode with inBitmap, trying again without Bitmap re-use", a2);
            }
            if (options.inBitmap != null) {
                inputStream.reset();
                dVar.d(options.inBitmap);
                options.inBitmap = null;
                Bitmap b = b(inputStream, options, aVar, dVar);
                w.dc().unlock();
                return b;
            }
            throw a2;
        } catch (Throwable th) {
            w.dc().unlock();
            throw th;
        }
    }

    private static String b(Options options) {
        return g(options.inBitmap);
    }

    private static int c(double d) {
        return (int) (d + 0.5d);
    }

    private static void c(Options options) {
        d(options);
        synchronized (mw) {
            mw.offer(options);
        }
    }

    private static synchronized Options cU() {
        Options options;
        synchronized (n.class) {
            synchronized (mw) {
                options = (Options) mw.poll();
            }
            if (options == null) {
                options = new Options();
                d(options);
            }
        }
        return options;
    }

    private static void d(Options options) {
        options.inTempStorage = null;
        options.inDither = false;
        options.inScaled = false;
        options.inSampleSize = 1;
        options.inPreferredConfig = null;
        options.inJustDecodeBounds = false;
        options.inDensity = 0;
        options.inTargetDensity = 0;
        options.outWidth = 0;
        options.outHeight = 0;
        options.outMimeType = null;
        options.inBitmap = null;
        options.inMutable = true;
    }

    @Nullable
    @TargetApi(19)
    private static String g(Bitmap bitmap) {
        String str;
        if (bitmap == null) {
            return null;
        }
        if (VERSION.SDK_INT >= 19) {
            StringBuilder sb = new StringBuilder();
            sb.append(" (");
            sb.append(bitmap.getAllocationByteCount());
            sb.append(")");
            str = sb.toString();
        } else {
            str = "";
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("[");
        sb2.append(bitmap.getWidth());
        sb2.append("x");
        sb2.append(bitmap.getHeight());
        sb2.append("] ");
        sb2.append(bitmap.getConfig());
        sb2.append(str);
        return sb2.toString();
    }

    public p<Bitmap> a(InputStream inputStream, int i, int i2, f fVar) throws IOException {
        return a(inputStream, i, i2, fVar, mu);
    }

    public p<Bitmap> a(InputStream inputStream, int i, int i2, f fVar, a aVar) throws IOException {
        f fVar2 = fVar;
        i.a(inputStream.markSupported(), "You must provide an InputStream that supports mark()");
        byte[] bArr = (byte[]) this.ff.a(65536, byte[].class);
        Options cU = cU();
        cU.inTempStorage = bArr;
        DecodeFormat decodeFormat = (DecodeFormat) fVar2.a(mn);
        try {
            return f.a(a(inputStream, cU, (DownsampleStrategy) fVar2.a(DownsampleStrategy.mj), decodeFormat, decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE ? false : fVar2.a(mq) != null && ((Boolean) fVar2.a(mq)).booleanValue(), i, i2, ((Boolean) fVar2.a(mp)).booleanValue(), aVar), this.bm);
        } finally {
            c(cU);
            this.ff.put(bArr);
        }
    }

    public boolean c(ByteBuffer byteBuffer) {
        return true;
    }

    public boolean f(InputStream inputStream) {
        return true;
    }
}

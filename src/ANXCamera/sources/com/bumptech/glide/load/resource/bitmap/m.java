package com.bumptech.glide.load.resource.bitmap;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.util.i;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;

/* compiled from: DefaultImageHeaderParser */
public final class m implements ImageHeaderParser {
    private static final String TAG = "DfltImageHeaderParser";
    private static final int kF = 4671814;
    private static final int kG = -1991225785;
    static final int kH = 65496;
    private static final int kI = 19789;
    private static final int kJ = 18761;
    private static final String kK = "Exif\u0000\u0000";
    static final byte[] kL = kK.getBytes(Charset.forName("UTF-8"));
    private static final int kM = 218;
    private static final int kN = 217;
    static final int kO = 255;
    static final int kP = 225;
    private static final int kQ = 274;
    private static final int[] kR = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};
    private static final int kS = 1380533830;
    private static final int kT = 1464156752;
    private static final int kU = 1448097792;
    private static final int kV = -256;
    private static final int kW = 255;
    private static final int kX = 88;
    private static final int kY = 76;
    private static final int kZ = 16;
    private static final int la = 8;

    /* compiled from: DefaultImageHeaderParser */
    private static final class a implements c {
        private final ByteBuffer byteBuffer;

        a(ByteBuffer byteBuffer2) {
            this.byteBuffer = byteBuffer2;
            byteBuffer2.order(ByteOrder.BIG_ENDIAN);
        }

        public int cq() {
            return ((getByte() << 8) & 65280) | (getByte() & 255);
        }

        public short cr() {
            return (short) (getByte() & 255);
        }

        public int getByte() {
            if (this.byteBuffer.remaining() < 1) {
                return -1;
            }
            return this.byteBuffer.get();
        }

        public int read(byte[] bArr, int i) {
            int min = Math.min(i, this.byteBuffer.remaining());
            if (min == 0) {
                return -1;
            }
            this.byteBuffer.get(bArr, 0, min);
            return min;
        }

        public long skip(long j) {
            int min = (int) Math.min((long) this.byteBuffer.remaining(), j);
            this.byteBuffer.position(this.byteBuffer.position() + min);
            return (long) min;
        }
    }

    /* compiled from: DefaultImageHeaderParser */
    private static final class b {
        private final ByteBuffer data;

        b(byte[] bArr, int i) {
            this.data = (ByteBuffer) ByteBuffer.wrap(bArr).order(ByteOrder.BIG_ENDIAN).limit(i);
        }

        private boolean l(int i, int i2) {
            return this.data.remaining() - i >= i2;
        }

        /* access modifiers changed from: 0000 */
        public int C(int i) {
            if (l(i, 4)) {
                return this.data.getInt(i);
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public short D(int i) {
            if (l(i, 2)) {
                return this.data.getShort(i);
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public void a(ByteOrder byteOrder) {
            this.data.order(byteOrder);
        }

        /* access modifiers changed from: 0000 */
        public int length() {
            return this.data.remaining();
        }
    }

    /* compiled from: DefaultImageHeaderParser */
    private interface c {
        int cq() throws IOException;

        short cr() throws IOException;

        int getByte() throws IOException;

        int read(byte[] bArr, int i) throws IOException;

        long skip(long j) throws IOException;
    }

    /* compiled from: DefaultImageHeaderParser */
    private static final class d implements c {
        private final InputStream is;

        d(InputStream inputStream) {
            this.is = inputStream;
        }

        public int cq() throws IOException {
            return ((this.is.read() << 8) & 65280) | (this.is.read() & 255);
        }

        public short cr() throws IOException {
            return (short) (this.is.read() & 255);
        }

        public int getByte() throws IOException {
            return this.is.read();
        }

        public int read(byte[] bArr, int i) throws IOException {
            int i2 = i;
            while (i2 > 0) {
                int read = this.is.read(bArr, i - i2, i2);
                if (read == -1) {
                    break;
                }
                i2 -= read;
            }
            return i - i2;
        }

        public long skip(long j) throws IOException {
            if (j < 0) {
                return 0;
            }
            long j2 = j;
            while (j2 > 0) {
                long skip = this.is.skip(j2);
                if (skip <= 0) {
                    if (this.is.read() == -1) {
                        break;
                    }
                    skip = 1;
                }
                j2 -= skip;
            }
            return j - j2;
        }
    }

    private static boolean B(int i) {
        return (i & kH) == kH || i == kI || i == kJ;
    }

    private static int a(b bVar) {
        ByteOrder byteOrder;
        int length = kK.length();
        short D = bVar.D(length);
        if (D == kJ) {
            byteOrder = ByteOrder.LITTLE_ENDIAN;
        } else if (D != kI) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown endianness = ");
                sb.append(D);
                Log.d(str, sb.toString());
            }
            byteOrder = ByteOrder.BIG_ENDIAN;
        } else {
            byteOrder = ByteOrder.BIG_ENDIAN;
        }
        bVar.a(byteOrder);
        int C = bVar.C(length + 4) + length;
        short D2 = bVar.D(C);
        for (int i = 0; i < D2; i++) {
            int k = k(C, i);
            short D3 = bVar.D(k);
            if (D3 == 274) {
                short D4 = bVar.D(k + 2);
                if (D4 >= 1 && D4 <= 12) {
                    int C2 = bVar.C(k + 4);
                    if (C2 >= 0) {
                        if (Log.isLoggable(TAG, 3)) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Got tagIndex=");
                            sb2.append(i);
                            sb2.append(" tagType=");
                            sb2.append(D3);
                            sb2.append(" formatCode=");
                            sb2.append(D4);
                            sb2.append(" componentCount=");
                            sb2.append(C2);
                            Log.d(str2, sb2.toString());
                        }
                        int i2 = C2 + kR[D4];
                        if (i2 <= 4) {
                            int i3 = k + 8;
                            if (i3 < 0 || i3 > bVar.length()) {
                                if (Log.isLoggable(TAG, 3)) {
                                    String str3 = TAG;
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("Illegal tagValueOffset=");
                                    sb3.append(i3);
                                    sb3.append(" tagType=");
                                    sb3.append(D3);
                                    Log.d(str3, sb3.toString());
                                }
                            } else if (i2 >= 0 && i2 + i3 <= bVar.length()) {
                                return bVar.D(i3);
                            } else {
                                if (Log.isLoggable(TAG, 3)) {
                                    String str4 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("Illegal number of bytes for TI tag data tagType=");
                                    sb4.append(D3);
                                    Log.d(str4, sb4.toString());
                                }
                            }
                        } else if (Log.isLoggable(TAG, 3)) {
                            String str5 = TAG;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Got byte count > 4, not orientation, continuing, formatCode=");
                            sb5.append(D4);
                            Log.d(str5, sb5.toString());
                        }
                    } else if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Negative tiff component count");
                    }
                } else if (Log.isLoggable(TAG, 3)) {
                    String str6 = TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("Got invalid format code = ");
                    sb6.append(D4);
                    Log.d(str6, sb6.toString());
                }
            }
        }
        return -1;
    }

    private int a(c cVar, com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        int cq = cVar.cq();
        if (!B(cq)) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Parser doesn't handle magic number: ");
                sb.append(cq);
                Log.d(str, sb.toString());
            }
            return -1;
        }
        int b2 = b(cVar);
        if (b2 == -1) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to parse exif segment length, or exif segment not found");
            }
            return -1;
        }
        byte[] bArr = (byte[]) bVar.a(b2, byte[].class);
        try {
            return a(cVar, bArr, b2);
        } finally {
            bVar.put(bArr);
        }
    }

    private int a(c cVar, byte[] bArr, int i) throws IOException {
        int read = cVar.read(bArr, i);
        if (read != i) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to read exif segment data, length: ");
                sb.append(i);
                sb.append(", actually read: ");
                sb.append(read);
                Log.d(str, sb.toString());
            }
            return -1;
        } else if (a(bArr, i)) {
            return a(new b(bArr, i));
        } else {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Missing jpeg exif preamble");
            }
            return -1;
        }
    }

    @NonNull
    private ImageType a(c cVar) throws IOException {
        int cq = cVar.cq();
        if (cq == kH) {
            return ImageType.JPEG;
        }
        int cq2 = ((cq << 16) & -65536) | (cVar.cq() & 65535);
        if (cq2 == kG) {
            cVar.skip(21);
            return cVar.getByte() >= 3 ? ImageType.PNG_A : ImageType.PNG;
        } else if ((cq2 >> 8) == kF) {
            return ImageType.GIF;
        } else {
            if (cq2 != kS) {
                return ImageType.UNKNOWN;
            }
            cVar.skip(4);
            if ((((cVar.cq() << 16) & -65536) | (cVar.cq() & 65535)) != kT) {
                return ImageType.UNKNOWN;
            }
            int cq3 = ((cVar.cq() << 16) & -65536) | (cVar.cq() & 65535);
            if ((cq3 & kV) != kU) {
                return ImageType.UNKNOWN;
            }
            int i = cq3 & 255;
            if (i == 88) {
                cVar.skip(4);
                return (cVar.getByte() & 16) != 0 ? ImageType.WEBP_A : ImageType.WEBP;
            } else if (i != 76) {
                return ImageType.WEBP;
            } else {
                cVar.skip(4);
                return (cVar.getByte() & 8) != 0 ? ImageType.WEBP_A : ImageType.WEBP;
            }
        }
    }

    private boolean a(byte[] bArr, int i) {
        boolean z = bArr != null && i > kL.length;
        if (!z) {
            return z;
        }
        for (int i2 = 0; i2 < kL.length; i2++) {
            if (bArr[i2] != kL[i2]) {
                return false;
            }
        }
        return z;
    }

    private int b(c cVar) throws IOException {
        while (true) {
            short cr = cVar.cr();
            if (cr != 255) {
                if (Log.isLoggable(TAG, 3)) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown segmentId=");
                    sb.append(cr);
                    Log.d(str, sb.toString());
                }
                return -1;
            }
            short cr2 = cVar.cr();
            if (cr2 == 218) {
                return -1;
            }
            if (cr2 == 217) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Found MARKER_EOI in exif segment");
                }
                return -1;
            }
            int cq = cVar.cq() - 2;
            if (cr2 == 225) {
                return cq;
            }
            long j = (long) cq;
            long skip = cVar.skip(j);
            if (skip != j) {
                if (Log.isLoggable(TAG, 3)) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Unable to skip enough data, type: ");
                    sb2.append(cr2);
                    sb2.append(", wanted to skip: ");
                    sb2.append(cq);
                    sb2.append(", but actually skipped: ");
                    sb2.append(skip);
                    Log.d(str2, sb2.toString());
                }
                return -1;
            }
        }
    }

    private static int k(int i, int i2) {
        return i + 2 + (12 * i2);
    }

    public int a(@NonNull InputStream inputStream, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a((c) new d((InputStream) i.checkNotNull(inputStream)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    public int a(@NonNull ByteBuffer byteBuffer, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a((c) new a((ByteBuffer) i.checkNotNull(byteBuffer)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    @NonNull
    public ImageType b(@NonNull InputStream inputStream) throws IOException {
        return a((c) new d((InputStream) i.checkNotNull(inputStream)));
    }

    @NonNull
    public ImageType b(@NonNull ByteBuffer byteBuffer) throws IOException {
        return a((c) new a((ByteBuffer) i.checkNotNull(byteBuffer)));
    }
}

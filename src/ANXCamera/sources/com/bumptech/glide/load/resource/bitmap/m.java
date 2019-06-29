package com.bumptech.glide.load.resource.bitmap;

import android.support.annotation.NonNull;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.MotionEventCompat;
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
    private static final int lG = 4671814;
    private static final int lH = -1991225785;
    static final int lI = 65496;
    private static final int lJ = 19789;
    private static final int lK = 18761;
    private static final String lL = "Exif\u0000\u0000";
    static final byte[] lM = lL.getBytes(Charset.forName("UTF-8"));
    private static final int lN = 218;
    private static final int lO = 217;
    static final int lP = 255;
    static final int lQ = 225;
    private static final int lR = 274;
    private static final int[] lS = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};
    private static final int lT = 1380533830;
    private static final int lU = 1464156752;
    private static final int lV = 1448097792;
    private static final int lW = -256;
    private static final int lX = 255;
    private static final int lY = 88;
    private static final int lZ = 76;
    private static final int ma = 16;
    private static final int mb = 8;

    /* compiled from: DefaultImageHeaderParser */
    private static final class a implements c {
        private final ByteBuffer byteBuffer;

        a(ByteBuffer byteBuffer2) {
            this.byteBuffer = byteBuffer2;
            byteBuffer2.order(ByteOrder.BIG_ENDIAN);
        }

        public int cS() {
            return ((getByte() << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (getByte() & 255);
        }

        public short cT() {
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

        private boolean m(int i, int i2) {
            return this.data.remaining() - i >= i2;
        }

        /* access modifiers changed from: 0000 */
        public int G(int i) {
            if (m(i, 4)) {
                return this.data.getInt(i);
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public short H(int i) {
            if (m(i, 2)) {
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
        int cS() throws IOException;

        short cT() throws IOException;

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

        public int cS() throws IOException {
            return ((this.is.read() << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (this.is.read() & 255);
        }

        public short cT() throws IOException {
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
                if (skip > 0) {
                    j2 -= skip;
                } else if (this.is.read() == -1) {
                    break;
                } else {
                    j2--;
                }
            }
            return j - j2;
        }
    }

    private static boolean F(int i) {
        return (i & lI) == lI || i == lJ || i == lK;
    }

    private static int a(b bVar) {
        ByteOrder byteOrder;
        int length = lL.length();
        short H = bVar.H(length);
        if (H == lK) {
            byteOrder = ByteOrder.LITTLE_ENDIAN;
        } else if (H != lJ) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown endianness = ");
                sb.append(H);
                Log.d(str, sb.toString());
            }
            byteOrder = ByteOrder.BIG_ENDIAN;
        } else {
            byteOrder = ByteOrder.BIG_ENDIAN;
        }
        bVar.a(byteOrder);
        int G = bVar.G(length + 4) + length;
        short H2 = bVar.H(G);
        for (int i = 0; i < H2; i++) {
            int l = l(G, i);
            short H3 = bVar.H(l);
            if (H3 == 274) {
                short H4 = bVar.H(l + 2);
                if (H4 >= 1 && H4 <= 12) {
                    int G2 = bVar.G(l + 4);
                    if (G2 >= 0) {
                        if (Log.isLoggable(TAG, 3)) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Got tagIndex=");
                            sb2.append(i);
                            sb2.append(" tagType=");
                            sb2.append(H3);
                            sb2.append(" formatCode=");
                            sb2.append(H4);
                            sb2.append(" componentCount=");
                            sb2.append(G2);
                            Log.d(str2, sb2.toString());
                        }
                        int i2 = G2 + lS[H4];
                        if (i2 <= 4) {
                            int i3 = l + 8;
                            if (i3 < 0 || i3 > bVar.length()) {
                                if (Log.isLoggable(TAG, 3)) {
                                    String str3 = TAG;
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("Illegal tagValueOffset=");
                                    sb3.append(i3);
                                    sb3.append(" tagType=");
                                    sb3.append(H3);
                                    Log.d(str3, sb3.toString());
                                }
                            } else if (i2 >= 0 && i2 + i3 <= bVar.length()) {
                                return bVar.H(i3);
                            } else {
                                if (Log.isLoggable(TAG, 3)) {
                                    String str4 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("Illegal number of bytes for TI tag data tagType=");
                                    sb4.append(H3);
                                    Log.d(str4, sb4.toString());
                                }
                            }
                        } else if (Log.isLoggable(TAG, 3)) {
                            String str5 = TAG;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Got byte count > 4, not orientation, continuing, formatCode=");
                            sb5.append(H4);
                            Log.d(str5, sb5.toString());
                        }
                    } else if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Negative tiff component count");
                    }
                } else if (Log.isLoggable(TAG, 3)) {
                    String str6 = TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("Got invalid format code = ");
                    sb6.append(H4);
                    Log.d(str6, sb6.toString());
                }
            }
        }
        return -1;
    }

    private int a(c cVar, com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        int cS = cVar.cS();
        if (!F(cS)) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Parser doesn't handle magic number: ");
                sb.append(cS);
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
        } else if (c(bArr, i)) {
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
        int cS = cVar.cS();
        if (cS == lI) {
            return ImageType.JPEG;
        }
        int cS2 = ((cS << 16) & SupportMenu.CATEGORY_MASK) | (cVar.cS() & SupportMenu.USER_MASK);
        if (cS2 == lH) {
            cVar.skip(21);
            return cVar.getByte() >= 3 ? ImageType.PNG_A : ImageType.PNG;
        } else if ((cS2 >> 8) == lG) {
            return ImageType.GIF;
        } else {
            if (cS2 != lT) {
                return ImageType.UNKNOWN;
            }
            cVar.skip(4);
            if ((((cVar.cS() << 16) & SupportMenu.CATEGORY_MASK) | (cVar.cS() & SupportMenu.USER_MASK)) != lU) {
                return ImageType.UNKNOWN;
            }
            int cS3 = ((cVar.cS() << 16) & SupportMenu.CATEGORY_MASK) | (cVar.cS() & SupportMenu.USER_MASK);
            if ((cS3 & -256) != lV) {
                return ImageType.UNKNOWN;
            }
            int i = cS3 & 255;
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

    private int b(c cVar) throws IOException {
        short cT;
        int cS;
        long j;
        long skip;
        do {
            short cT2 = cVar.cT();
            if (cT2 != 255) {
                if (Log.isLoggable(TAG, 3)) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Unknown segmentId=");
                    sb.append(cT2);
                    Log.d(str, sb.toString());
                }
                return -1;
            }
            cT = cVar.cT();
            if (cT == 218) {
                return -1;
            }
            if (cT == 217) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Found MARKER_EOI in exif segment");
                }
                return -1;
            }
            cS = cVar.cS() - 2;
            if (cT == 225) {
                return cS;
            }
            j = (long) cS;
            skip = cVar.skip(j);
        } while (skip == j);
        if (Log.isLoggable(TAG, 3)) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Unable to skip enough data, type: ");
            sb2.append(cT);
            sb2.append(", wanted to skip: ");
            sb2.append(cS);
            sb2.append(", but actually skipped: ");
            sb2.append(skip);
            Log.d(str2, sb2.toString());
        }
        return -1;
    }

    private boolean c(byte[] bArr, int i) {
        boolean z = bArr != null && i > lM.length;
        if (!z) {
            return z;
        }
        for (int i2 = 0; i2 < lM.length; i2++) {
            if (bArr[i2] != lM[i2]) {
                return false;
            }
        }
        return z;
    }

    private static int l(int i, int i2) {
        return i + 2 + (12 * i2);
    }

    public int a(@NonNull InputStream inputStream, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a((c) new d((InputStream) i.checkNotNull(inputStream)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    public int a(@NonNull ByteBuffer byteBuffer, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a((c) new a((ByteBuffer) i.checkNotNull(byteBuffer)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    @NonNull
    public ImageType b(@NonNull ByteBuffer byteBuffer) throws IOException {
        return a((c) new a((ByteBuffer) i.checkNotNull(byteBuffer)));
    }

    @NonNull
    public ImageType c(@NonNull InputStream inputStream) throws IOException {
        return a((c) new d((InputStream) i.checkNotNull(inputStream)));
    }
}

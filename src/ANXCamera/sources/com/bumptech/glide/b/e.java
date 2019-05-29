package com.bumptech.glide.b;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.b.a.C0001a;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Iterator;

/* compiled from: StandardGifDecoder */
public class e implements a {
    private static final int MAX_STACK_SIZE = 4096;
    private static final String TAG = e.class.getSimpleName();
    private static final int cM = -1;
    private static final int cN = -1;
    private static final int cO = 4;
    @ColorInt
    private static final int cP = 0;
    private static final int cq = 255;
    @ColorInt
    private int[] act;
    private byte[] block;
    private ByteBuffer cK;
    private c cL;
    @ColorInt
    private final int[] cQ;
    private final C0001a cR;
    private d cS;
    private byte[] cT;
    @ColorInt
    private int[] cU;
    private int cV;
    private Bitmap cW;
    private boolean cX;
    private int cY;
    private int cZ;
    @Nullable
    private Boolean da;
    @NonNull
    private Config dc;
    private byte[] pixelStack;
    private short[] prefix;
    private int sampleSize;
    private int status;
    private byte[] suffix;

    public e(@NonNull C0001a aVar) {
        this.cQ = new int[256];
        this.dc = Config.ARGB_8888;
        this.cR = aVar;
        this.cL = new c();
    }

    public e(@NonNull C0001a aVar, c cVar, ByteBuffer byteBuffer) {
        this(aVar, cVar, byteBuffer, 1);
    }

    public e(@NonNull C0001a aVar, c cVar, ByteBuffer byteBuffer, int i) {
        this(aVar);
        a(cVar, byteBuffer, i);
    }

    @ColorInt
    private int a(int i, int i2, int i3) {
        int i4 = i;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        while (i4 < this.sampleSize + i && i4 < this.cT.length && i4 < i2) {
            int i10 = this.act[this.cT[i4] & -1];
            if (i10 != 0) {
                i5 += (i10 >> 24) & 255;
                i6 += (i10 >> 16) & 255;
                i7 += (i10 >> 8) & 255;
                i8 += i10 & 255;
                i9++;
            }
            i4++;
        }
        int i11 = i + i3;
        int i12 = i11;
        while (i12 < this.sampleSize + i11 && i12 < this.cT.length && i12 < i2) {
            int i13 = this.act[this.cT[i12] & -1];
            if (i13 != 0) {
                i5 += (i13 >> 24) & 255;
                i6 += (i13 >> 16) & 255;
                i7 += (i13 >> 8) & 255;
                i8 += i13 & 255;
                i9++;
            }
            i12++;
        }
        if (i9 == 0) {
            return 0;
        }
        return ((i5 / i9) << 24) | ((i6 / i9) << 16) | ((i7 / i9) << 8) | (i8 / i9);
    }

    private Bitmap a(b bVar, b bVar2) {
        int[] iArr = this.cU;
        int i = 0;
        if (bVar2 == null) {
            if (this.cW != null) {
                this.cR.c(this.cW);
            }
            this.cW = null;
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose == 3 && this.cW == null) {
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose > 0) {
            if (bVar2.dispose == 2) {
                if (!bVar.transparency) {
                    int i2 = this.cL.bgColor;
                    if (bVar.lct == null || this.cL.bgIndex != bVar.transIndex) {
                        i = i2;
                    }
                } else if (this.cV == 0) {
                    this.da = Boolean.valueOf(true);
                }
                int i3 = bVar2.ih / this.sampleSize;
                int i4 = bVar2.iy / this.sampleSize;
                int i5 = bVar2.iw / this.sampleSize;
                int i6 = (i4 * this.cZ) + (bVar2.ix / this.sampleSize);
                int i7 = (i3 * this.cZ) + i6;
                while (i6 < i7) {
                    int i8 = i6 + i5;
                    for (int i9 = i6; i9 < i8; i9++) {
                        iArr[i9] = i;
                    }
                    i6 += this.cZ;
                }
            } else if (bVar2.dispose == 3 && this.cW != null) {
                this.cW.getPixels(iArr, 0, this.cZ, 0, 0, this.cZ, this.cY);
            }
        }
        c(bVar);
        if (bVar.interlace || this.sampleSize != 1) {
            b(bVar);
        } else {
            a(bVar);
        }
        if (this.cX && (bVar.dispose == 0 || bVar.dispose == 1)) {
            if (this.cW == null) {
                this.cW = ag();
            }
            this.cW.setPixels(iArr, 0, this.cZ, 0, 0, this.cZ, this.cY);
        }
        Bitmap ag = ag();
        ag.setPixels(iArr, 0, this.cZ, 0, 0, this.cZ, this.cY);
        return ag;
    }

    private void a(b bVar) {
        b bVar2 = bVar;
        int[] iArr = this.cU;
        int i = bVar2.ih;
        int i2 = bVar2.iy;
        int i3 = bVar2.iw;
        int i4 = bVar2.ix;
        boolean z = this.cV == 0;
        int i5 = this.cZ;
        byte[] bArr = this.cT;
        int[] iArr2 = this.act;
        int i6 = 0;
        byte b = -1;
        while (i6 < i) {
            int i7 = (i6 + i2) * i5;
            int i8 = i7 + i4;
            int i9 = i8 + i3;
            int i10 = i7 + i5;
            if (i10 < i9) {
                i9 = i10;
            }
            byte b2 = b;
            int i11 = bVar2.iw * i6;
            int i12 = i8;
            while (i12 < i9) {
                byte b3 = bArr[i11];
                int i13 = i;
                byte b4 = b3 & -1;
                if (b4 != b2) {
                    int i14 = iArr2[b4];
                    if (i14 != 0) {
                        iArr[i12] = i14;
                    } else {
                        b2 = b3;
                    }
                }
                i11++;
                i12++;
                i = i13;
                b bVar3 = bVar;
            }
            int i15 = i;
            i6++;
            b = b2;
            bVar2 = bVar;
        }
        boolean z2 = this.da == null && z && b != -1;
        this.da = Boolean.valueOf(z2);
    }

    @NonNull
    private d af() {
        if (this.cS == null) {
            this.cS = new d();
        }
        return this.cS;
    }

    private Bitmap ag() {
        Config config = (this.da == null || this.da.booleanValue()) ? Config.ARGB_8888 : this.dc;
        Bitmap a = this.cR.a(this.cZ, this.cY, config);
        a.setHasAlpha(true);
        return a;
    }

    private void b(b bVar) {
        Boolean bool;
        int i;
        int i2;
        int i3;
        b bVar2 = bVar;
        int[] iArr = this.cU;
        int i4 = bVar2.ih / this.sampleSize;
        int i5 = bVar2.iy / this.sampleSize;
        int i6 = bVar2.iw / this.sampleSize;
        int i7 = bVar2.ix / this.sampleSize;
        boolean z = this.cV == 0;
        int i8 = this.sampleSize;
        int i9 = this.cZ;
        int i10 = this.cY;
        byte[] bArr = this.cT;
        int[] iArr2 = this.act;
        Boolean bool2 = this.da;
        int i11 = 8;
        int i12 = 0;
        int i13 = 0;
        int i14 = 1;
        while (i13 < i4) {
            if (bVar2.interlace) {
                if (i12 >= i4) {
                    i14++;
                    switch (i14) {
                        case 2:
                            i12 = 4;
                            break;
                        case 3:
                            i11 = 4;
                            i12 = 2;
                            break;
                        case 4:
                            i11 = 2;
                            i12 = 1;
                            break;
                    }
                }
                i = i12 + i11;
            } else {
                i = i12;
                i12 = i13;
            }
            int i15 = i12 + i5;
            int i16 = i4;
            boolean z2 = i8 == 1;
            if (i15 < i10) {
                int i17 = i15 * i9;
                int i18 = i17 + i7;
                i3 = i5;
                int i19 = i18 + i6;
                int i20 = i17 + i9;
                if (i20 < i19) {
                    i19 = i20;
                }
                i2 = i6;
                int i21 = i13 * i8 * bVar2.iw;
                if (z2) {
                    for (int i22 = i18; i22 < i19; i22++) {
                        int i23 = iArr2[bArr[i21] & -1];
                        if (i23 != 0) {
                            iArr[i22] = i23;
                        } else if (z && bool == null) {
                            bool = Boolean.valueOf(true);
                        }
                        i21 += i8;
                    }
                } else {
                    int i24 = ((i19 - i18) * i8) + i21;
                    int i25 = i18;
                    while (i25 < i19) {
                        int i26 = i19;
                        int a = a(i21, i24, bVar2.iw);
                        if (a != 0) {
                            iArr[i25] = a;
                        } else if (z && bool == null) {
                            bool = Boolean.valueOf(true);
                            i21 += i8;
                            i25++;
                            i19 = i26;
                        }
                        i21 += i8;
                        i25++;
                        i19 = i26;
                    }
                }
            } else {
                i3 = i5;
                i2 = i6;
            }
            i13++;
            i12 = i;
            i4 = i16;
            i5 = i3;
            i6 = i2;
        }
        if (this.da == null) {
            Boolean bool3 = bool;
            this.da = Boolean.valueOf(bool3 == null ? false : bool3.booleanValue());
        }
    }

    /* JADX WARNING: type inference failed for: r3v1, types: [short[]] */
    /* JADX WARNING: type inference failed for: r22v0 */
    /* JADX WARNING: type inference failed for: r22v1 */
    /* JADX WARNING: type inference failed for: r28v0 */
    /* JADX WARNING: type inference failed for: r28v1 */
    /* JADX WARNING: type inference failed for: r4v6 */
    /* JADX WARNING: type inference failed for: r22v2 */
    /* JADX WARNING: type inference failed for: r22v3 */
    /* JADX WARNING: type inference failed for: r18v6 */
    /* JADX WARNING: type inference failed for: r28v2 */
    /* JADX WARNING: type inference failed for: r22v4 */
    /* JADX WARNING: type inference failed for: r4v19, types: [short] */
    /* JADX WARNING: type inference failed for: r4v21, types: [int] */
    /* JADX WARNING: type inference failed for: r28v5 */
    /* JADX WARNING: type inference failed for: r28v6 */
    /* JADX WARNING: type inference failed for: r22v5 */
    /* JADX WARNING: type inference failed for: r18v14 */
    /* JADX WARNING: type inference failed for: r28v7 */
    /* JADX WARNING: type inference failed for: r4v25 */
    /* JADX WARNING: type inference failed for: r28v8 */
    /* JADX WARNING: Incorrect type for immutable var: ssa=short, code=int, for r4v19, types: [short] */
    /* JADX WARNING: Incorrect type for immutable var: ssa=short[], code=null, for r3v1, types: [short[]] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r22v3
  assigns: []
  uses: []
  mth insns count: 175
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 10 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void c(b bVar) {
        int i;
        int i2;
        int i3;
        ? r22;
        int i4;
        ? r28;
        int i5;
        ? r4;
        ? r282;
        int i6;
        e eVar = this;
        b bVar2 = bVar;
        if (bVar2 != null) {
            eVar.cK.position(bVar2.cj);
        }
        if (bVar2 == null) {
            i = eVar.cL.width * eVar.cL.height;
        } else {
            i = bVar2.ih * bVar2.iw;
        }
        if (eVar.cT == null || eVar.cT.length < i) {
            eVar.cT = eVar.cR.m(i);
        }
        byte[] bArr = eVar.cT;
        if (eVar.prefix == null) {
            eVar.prefix = new short[4096];
        }
        ? r3 = eVar.prefix;
        if (eVar.suffix == null) {
            eVar.suffix = new byte[4096];
        }
        byte[] bArr2 = eVar.suffix;
        if (eVar.pixelStack == null) {
            eVar.pixelStack = new byte[4097];
        }
        byte[] bArr3 = eVar.pixelStack;
        int readByte = readByte();
        int i7 = 1 << readByte;
        int i8 = i7 + 1;
        int i9 = i7 + 2;
        int i10 = readByte + 1;
        int i11 = (1 << i10) - 1;
        int i12 = 0;
        for (int i13 = 0; i13 < i7; i13++) {
            r3[i13] = 0;
            bArr2[i13] = (byte) i13;
        }
        byte[] bArr4 = eVar.block;
        int i14 = i10;
        int i15 = i9;
        int i16 = i11;
        int i17 = 0;
        int i18 = 0;
        ? r18 = 0;
        int i19 = 0;
        int i20 = 0;
        ? r222 = 0;
        int i21 = 0;
        int i22 = -1;
        while (true) {
            if (i12 >= i) {
                break;
            }
            if (i17 == 0) {
                i17 = readBlock();
                if (i17 <= 0) {
                    eVar.status = 3;
                    break;
                }
                i20 = 0;
            }
            i19 += (bArr4[i20] & -1) << r18;
            i20++;
            i17--;
            int i23 = r18 + 8;
            int i24 = i22;
            ? r283 = r222;
            int i25 = i15;
            int i26 = i18;
            int i27 = i12;
            int i28 = i14;
            while (true) {
                if (i23 < i28) {
                    i15 = i25;
                    r22 = r283;
                    i22 = i24;
                    i14 = i28;
                    i12 = i27;
                    i18 = i26;
                    i4 = i23;
                    eVar = this;
                    break;
                }
                byte b = i19 & i2;
                i19 >>= i28;
                i23 -= i28;
                if (b == i7) {
                    i28 = i10;
                    i25 = i9;
                    i2 = i11;
                    i24 = -1;
                    r282 = r283;
                } else if (b == i8) {
                    i22 = i24;
                    i14 = i28;
                    i12 = i27;
                    i18 = i26;
                    i15 = i25;
                    r22 = r283;
                    i4 = i23;
                    break;
                } else if (i24 == -1) {
                    bArr[i26] = bArr2[b];
                    i26++;
                    i27++;
                    i24 = b;
                    r28 = i24;
                    eVar = this;
                    r283 = r28;
                } else {
                    int i29 = i25;
                    if (b >= i29) {
                        i5 = i23;
                        bArr3[i3] = (byte) r283;
                        i3++;
                        i6 = i24;
                    } else {
                        i5 = i23;
                        i6 = b;
                    }
                    while (r4 >= i7) {
                        bArr3[i3] = bArr2[r4];
                        i3++;
                        r4 = r3[r4];
                    }
                    byte b2 = bArr2[r4] & -1;
                    int i30 = i10;
                    byte b3 = (byte) b2;
                    bArr[i26] = b3;
                    i26++;
                    i27++;
                    while (i3 > 0) {
                        i3--;
                        bArr[i26] = bArr3[i3];
                        i26++;
                        i27++;
                    }
                    byte b4 = b2;
                    if (i29 < 4096) {
                        r3[i29] = (short) i24;
                        bArr2[i29] = b3;
                        i29++;
                        if ((i29 & i2) == 0) {
                            if (i29 < 4096) {
                                i28++;
                                i2 += i29;
                            }
                        }
                    }
                    i25 = i29;
                    i24 = b;
                    i23 = i5;
                    i10 = i30;
                    r282 = b4;
                    eVar = this;
                }
                r28 = r282;
                r283 = r28;
            }
            r222 = r22;
            r18 = i4;
        }
        Arrays.fill(bArr, i18, i, 0);
    }

    private int readBlock() {
        int readByte = readByte();
        if (readByte <= 0) {
            return readByte;
        }
        this.cK.get(this.block, 0, Math.min(readByte, this.cK.remaining()));
        return readByte;
    }

    private int readByte() {
        return this.cK.get() & -1;
    }

    public int U() {
        if (this.cL.cm <= 0 || this.cV < 0) {
            return 0;
        }
        return getDelay(this.cV);
    }

    public int V() {
        return this.cV;
    }

    public void W() {
        this.cV = -1;
    }

    public int X() {
        return this.cL.loopCount;
    }

    public int Y() {
        if (this.cL.loopCount == -1) {
            return 1;
        }
        if (this.cL.loopCount == 0) {
            return 0;
        }
        return this.cL.loopCount + 1;
    }

    public int Z() {
        return this.cK.limit() + this.cT.length + (this.cU.length * 4);
    }

    public int a(@Nullable InputStream inputStream, int i) {
        if (inputStream != null) {
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i > 0 ? i + 4096 : 16384);
                byte[] bArr = new byte[16384];
                while (true) {
                    int read = inputStream.read(bArr, 0, bArr.length);
                    if (read == -1) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, read);
                }
                byteArrayOutputStream.flush();
                read(byteArrayOutputStream.toByteArray());
            } catch (IOException e) {
                Log.w(TAG, "Error reading data from stream", e);
            }
        } else {
            this.status = 2;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e2) {
                Log.w(TAG, "Error closing stream", e2);
            }
        }
        return this.status;
    }

    public void a(@NonNull Config config) {
        if (config == Config.ARGB_8888 || config == Config.RGB_565) {
            this.dc = config;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Unsupported format: ");
        sb.append(config);
        sb.append(", must be one of ");
        sb.append(Config.ARGB_8888);
        sb.append(" or ");
        sb.append(Config.RGB_565);
        throw new IllegalArgumentException(sb.toString());
    }

    public synchronized void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer) {
        a(cVar, byteBuffer, 1);
    }

    public synchronized void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer, int i) {
        if (i > 0) {
            int highestOneBit = Integer.highestOneBit(i);
            this.status = 0;
            this.cL = cVar;
            this.cV = -1;
            this.cK = byteBuffer.asReadOnlyBuffer();
            this.cK.position(0);
            this.cK.order(ByteOrder.LITTLE_ENDIAN);
            this.cX = false;
            Iterator it = cVar.cp.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (((b) it.next()).dispose == 3) {
                    this.cX = true;
                    break;
                }
            }
            this.sampleSize = highestOneBit;
            this.cZ = cVar.width / highestOneBit;
            this.cY = cVar.height / highestOneBit;
            this.cT = this.cR.m(cVar.width * cVar.height);
            this.cU = this.cR.n(this.cZ * this.cY);
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Sample size must be >=0, not: ");
            sb.append(i);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public synchronized void a(@NonNull c cVar, @NonNull byte[] bArr) {
        a(cVar, ByteBuffer.wrap(bArr));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00ea, code lost:
        return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    public synchronized Bitmap aa() {
        if (this.cL.cm <= 0 || this.cV < 0) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to decode frame, frameCount=");
                sb.append(this.cL.cm);
                sb.append(", framePointer=");
                sb.append(this.cV);
                Log.d(str, sb.toString());
            }
            this.status = 1;
        }
        if (this.status != 1) {
            if (this.status != 2) {
                this.status = 0;
                if (this.block == null) {
                    this.block = this.cR.m(255);
                }
                b bVar = (b) this.cL.cp.get(this.cV);
                int i = this.cV - 1;
                b bVar2 = i >= 0 ? (b) this.cL.cp.get(i) : null;
                this.act = bVar.lct != null ? bVar.lct : this.cL.gct;
                if (this.act == null) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("No valid color table found for frame #");
                        sb2.append(this.cV);
                        Log.d(str2, sb2.toString());
                    }
                    this.status = 1;
                    return null;
                }
                if (bVar.transparency) {
                    System.arraycopy(this.act, 0, this.cQ, 0, this.act.length);
                    this.act = this.cQ;
                    this.act[bVar.transIndex] = 0;
                }
                return a(bVar, bVar2);
            }
        }
        if (Log.isLoggable(TAG, 3)) {
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Unable to decode frame, status=");
            sb3.append(this.status);
            Log.d(str3, sb3.toString());
        }
    }

    public void advance() {
        this.cV = (this.cV + 1) % this.cL.cm;
    }

    public void clear() {
        this.cL = null;
        if (this.cT != null) {
            this.cR.c(this.cT);
        }
        if (this.cU != null) {
            this.cR.b(this.cU);
        }
        if (this.cW != null) {
            this.cR.c(this.cW);
        }
        this.cW = null;
        this.cK = null;
        this.da = null;
        if (this.block != null) {
            this.cR.c(this.block);
        }
    }

    @NonNull
    public ByteBuffer getData() {
        return this.cK;
    }

    public int getDelay(int i) {
        if (i < 0 || i >= this.cL.cm) {
            return -1;
        }
        return ((b) this.cL.cp.get(i)).delay;
    }

    public int getFrameCount() {
        return this.cL.cm;
    }

    public int getHeight() {
        return this.cL.height;
    }

    @Deprecated
    public int getLoopCount() {
        if (this.cL.loopCount == -1) {
            return 1;
        }
        return this.cL.loopCount;
    }

    public int getStatus() {
        return this.status;
    }

    public int getWidth() {
        return this.cL.width;
    }

    public synchronized int read(@Nullable byte[] bArr) {
        this.cL = af().d(bArr).ac();
        if (bArr != null) {
            a(this.cL, bArr);
        }
        return this.status;
    }
}

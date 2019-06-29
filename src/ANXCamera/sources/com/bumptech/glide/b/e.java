package com.bumptech.glide.b;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.b.a.C0002a;
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
    private static final int dR = -1;
    private static final int dS = -1;
    private static final int dT = 4;
    @ColorInt
    private static final int dU = 0;
    private static final int dw = 255;
    @ColorInt
    private int[] act;
    private byte[] block;
    private ByteBuffer dP;
    private c dQ;
    @ColorInt
    private final int[] dV;
    private final C0002a dW;
    private d dX;
    private byte[] dY;
    @ColorInt
    private int[] dZ;
    private int ea;
    private Bitmap eb;
    private boolean ec;
    private int ed;
    private int ee;
    @Nullable
    private Boolean ef;
    @NonNull
    private Config eg;
    private byte[] pixelStack;
    private short[] prefix;
    private int sampleSize;
    private int status;
    private byte[] suffix;

    public e(@NonNull C0002a aVar) {
        this.dV = new int[256];
        this.eg = Config.ARGB_8888;
        this.dW = aVar;
        this.dQ = new c();
    }

    public e(@NonNull C0002a aVar, c cVar, ByteBuffer byteBuffer) {
        this(aVar, cVar, byteBuffer, 1);
    }

    public e(@NonNull C0002a aVar, c cVar, ByteBuffer byteBuffer, int i) {
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
        while (i4 < this.sampleSize + i && i4 < this.dY.length && i4 < i2) {
            int i10 = this.act[this.dY[i4] & 255];
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
        while (i12 < this.sampleSize + i11 && i12 < this.dY.length && i12 < i2) {
            int i13 = this.act[this.dY[i12] & 255];
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
        int[] iArr = this.dZ;
        int i = 0;
        if (bVar2 == null) {
            if (this.eb != null) {
                this.dW.c(this.eb);
            }
            this.eb = null;
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose == 3 && this.eb == null) {
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose > 0) {
            if (bVar2.dispose == 2) {
                if (!bVar.transparency) {
                    int i2 = this.dQ.bgColor;
                    if (bVar.lct == null || this.dQ.bgIndex != bVar.transIndex) {
                        i = i2;
                    }
                } else if (this.ea == 0) {
                    this.ef = Boolean.valueOf(true);
                }
                int i3 = bVar2.ih / this.sampleSize;
                int i4 = bVar2.iy / this.sampleSize;
                int i5 = bVar2.iw / this.sampleSize;
                int i6 = (i4 * this.ee) + (bVar2.ix / this.sampleSize);
                int i7 = (i3 * this.ee) + i6;
                while (i6 < i7) {
                    int i8 = i6 + i5;
                    for (int i9 = i6; i9 < i8; i9++) {
                        iArr[i9] = i;
                    }
                    i6 += this.ee;
                }
            } else if (bVar2.dispose == 3 && this.eb != null) {
                this.eb.getPixels(iArr, 0, this.ee, 0, 0, this.ee, this.ed);
            }
        }
        c(bVar);
        if (bVar.interlace || this.sampleSize != 1) {
            b(bVar);
        } else {
            a(bVar);
        }
        if (this.ec && (bVar.dispose == 0 || bVar.dispose == 1)) {
            if (this.eb == null) {
                this.eb = aG();
            }
            this.eb.setPixels(iArr, 0, this.ee, 0, 0, this.ee, this.ed);
        }
        Bitmap aG = aG();
        aG.setPixels(iArr, 0, this.ee, 0, 0, this.ee, this.ed);
        return aG;
    }

    private void a(b bVar) {
        b bVar2 = bVar;
        int[] iArr = this.dZ;
        int i = bVar2.ih;
        int i2 = bVar2.iy;
        int i3 = bVar2.iw;
        int i4 = bVar2.ix;
        boolean z = this.ea == 0;
        int i5 = this.ee;
        byte[] bArr = this.dY;
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
                byte b4 = b3 & 255;
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
        this.ef = Boolean.valueOf(this.ef == null && z && b != -1);
    }

    @NonNull
    private d aF() {
        if (this.dX == null) {
            this.dX = new d();
        }
        return this.dX;
    }

    private Bitmap aG() {
        Bitmap a = this.dW.a(this.ee, this.ed, (this.ef == null || this.ef.booleanValue()) ? Config.ARGB_8888 : this.eg);
        a.setHasAlpha(true);
        return a;
    }

    private void b(b bVar) {
        int i;
        int i2;
        int i3;
        b bVar2 = bVar;
        int[] iArr = this.dZ;
        int i4 = bVar2.ih / this.sampleSize;
        int i5 = bVar2.iy / this.sampleSize;
        int i6 = bVar2.iw / this.sampleSize;
        int i7 = bVar2.ix / this.sampleSize;
        boolean z = this.ea == 0;
        int i8 = this.sampleSize;
        int i9 = this.ee;
        int i10 = this.ed;
        byte[] bArr = this.dY;
        int[] iArr2 = this.act;
        Boolean bool = this.ef;
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
                        int i23 = iArr2[bArr[i21] & 255];
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
        if (this.ef == null) {
            Boolean bool2 = bool;
            this.ef = Boolean.valueOf(bool2 == null ? false : bool2.booleanValue());
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
    private void c(b bVar) {
        int i;
        ? r22;
        int i2;
        ? r28;
        int i3;
        ? r4;
        ? r282;
        int i4;
        e eVar = this;
        b bVar2 = bVar;
        if (bVar2 != null) {
            eVar.dP.position(bVar2.f0do);
        }
        if (bVar2 == null) {
            i = eVar.dQ.width * eVar.dQ.height;
        } else {
            i = bVar2.ih * bVar2.iw;
        }
        if (eVar.dY == null || eVar.dY.length < i) {
            eVar.dY = eVar.dW.q(i);
        }
        byte[] bArr = eVar.dY;
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
        int i5 = 1 << readByte;
        int i6 = i5 + 1;
        int i7 = i5 + 2;
        int i8 = readByte + 1;
        int i9 = (1 << i8) - 1;
        int i10 = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            r3[i11] = 0;
            bArr2[i11] = (byte) i11;
        }
        byte[] bArr4 = eVar.block;
        int i12 = i8;
        int i13 = i7;
        int i14 = i9;
        int i15 = 0;
        int i16 = 0;
        ? r18 = 0;
        int i17 = 0;
        int i18 = 0;
        ? r222 = 0;
        int i19 = 0;
        int i20 = -1;
        while (true) {
            if (i10 >= i) {
                break;
            }
            if (i15 == 0) {
                i15 = readBlock();
                if (i15 <= 0) {
                    eVar.status = 3;
                    break;
                }
                i18 = 0;
            }
            i17 += (bArr4[i18] & 255) << r18;
            i18++;
            i15--;
            int i21 = r18 + 8;
            int i22 = i20;
            ? r283 = r222;
            int i23 = i13;
            int i24 = i16;
            int i25 = i10;
            int i26 = i12;
            while (true) {
                if (i21 < i26) {
                    i13 = i23;
                    r22 = r283;
                    i20 = i22;
                    i12 = i26;
                    i10 = i25;
                    i16 = i24;
                    i2 = i21;
                    eVar = this;
                    break;
                }
                byte b = i17 & i14;
                i17 >>= i26;
                i21 -= i26;
                if (b == i5) {
                    i26 = i8;
                    i23 = i7;
                    i14 = i9;
                    i22 = -1;
                    r282 = r283;
                } else if (b == i6) {
                    i20 = i22;
                    i12 = i26;
                    i10 = i25;
                    i16 = i24;
                    i13 = i23;
                    r22 = r283;
                    i2 = i21;
                    break;
                } else if (i22 == -1) {
                    bArr[i24] = bArr2[b];
                    i24++;
                    i25++;
                    i22 = b;
                    r28 = i22;
                    eVar = this;
                    r283 = r28;
                } else {
                    int i27 = i23;
                    if (b >= i27) {
                        i3 = i21;
                        bArr3[i19] = (byte) r283;
                        i19++;
                        i4 = i22;
                    } else {
                        i3 = i21;
                        i4 = b;
                    }
                    while (r4 >= i5) {
                        bArr3[i19] = bArr2[r4];
                        i19++;
                        r4 = r3[r4];
                    }
                    byte b2 = bArr2[r4] & 255;
                    int i28 = i8;
                    byte b3 = (byte) b2;
                    bArr[i24] = b3;
                    i24++;
                    i25++;
                    while (i19 > 0) {
                        i19--;
                        bArr[i24] = bArr3[i19];
                        i24++;
                        i25++;
                    }
                    byte b4 = b2;
                    if (i27 < 4096) {
                        r3[i27] = (short) i22;
                        bArr2[i27] = b3;
                        i27++;
                        if ((i27 & i14) == 0) {
                            if (i27 < 4096) {
                                i26++;
                                i14 += i27;
                            }
                        }
                    }
                    i23 = i27;
                    i22 = b;
                    i21 = i3;
                    i8 = i28;
                    r282 = b4;
                    eVar = this;
                }
                r28 = r282;
                r283 = r28;
            }
            r222 = r22;
            r18 = i2;
        }
        Arrays.fill(bArr, i16, i, 0);
    }

    private int readBlock() {
        int readByte = readByte();
        if (readByte <= 0) {
            return readByte;
        }
        this.dP.get(this.block, 0, Math.min(readByte, this.dP.remaining()));
        return readByte;
    }

    private int readByte() {
        return this.dP.get() & 255;
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
            this.eg = config;
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
            this.dQ = cVar;
            this.ea = -1;
            this.dP = byteBuffer.asReadOnlyBuffer();
            this.dP.position(0);
            this.dP.order(ByteOrder.LITTLE_ENDIAN);
            this.ec = false;
            Iterator it = cVar.dv.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (((b) it.next()).dispose == 3) {
                    this.ec = true;
                    break;
                }
            }
            this.sampleSize = highestOneBit;
            this.ee = cVar.width / highestOneBit;
            this.ed = cVar.height / highestOneBit;
            this.dY = this.dW.q(cVar.width * cVar.height);
            this.dZ = this.dW.r(this.ee * this.ed);
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
    @Nullable
    public synchronized Bitmap aA() {
        if (this.dQ.dt <= 0 || this.ea < 0) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unable to decode frame, frameCount=");
                sb.append(this.dQ.dt);
                sb.append(", framePointer=");
                sb.append(this.ea);
                Log.d(str, sb.toString());
            }
            this.status = 1;
        }
        if (this.status != 1) {
            if (this.status != 2) {
                this.status = 0;
                if (this.block == null) {
                    this.block = this.dW.q(255);
                }
                b bVar = (b) this.dQ.dv.get(this.ea);
                int i = this.ea - 1;
                b bVar2 = i >= 0 ? (b) this.dQ.dv.get(i) : null;
                this.act = bVar.lct != null ? bVar.lct : this.dQ.gct;
                if (this.act == null) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("No valid color table found for frame #");
                        sb2.append(this.ea);
                        Log.d(str2, sb2.toString());
                    }
                    this.status = 1;
                    return null;
                }
                if (bVar.transparency) {
                    System.arraycopy(this.act, 0, this.dV, 0, this.act.length);
                    this.act = this.dV;
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
        this.ea = (this.ea + 1) % this.dQ.dt;
    }

    public int au() {
        if (this.dQ.dt <= 0 || this.ea < 0) {
            return 0;
        }
        return getDelay(this.ea);
    }

    public int av() {
        return this.ea;
    }

    public void aw() {
        this.ea = -1;
    }

    public int ax() {
        return this.dQ.loopCount;
    }

    public int ay() {
        if (this.dQ.loopCount == -1) {
            return 1;
        }
        if (this.dQ.loopCount == 0) {
            return 0;
        }
        return this.dQ.loopCount + 1;
    }

    public int az() {
        return this.dP.limit() + this.dY.length + (this.dZ.length * 4);
    }

    public void clear() {
        this.dQ = null;
        if (this.dY != null) {
            this.dW.c(this.dY);
        }
        if (this.dZ != null) {
            this.dW.b(this.dZ);
        }
        if (this.eb != null) {
            this.dW.c(this.eb);
        }
        this.eb = null;
        this.dP = null;
        this.ef = null;
        if (this.block != null) {
            this.dW.c(this.block);
        }
    }

    @NonNull
    public ByteBuffer getData() {
        return this.dP;
    }

    public int getDelay(int i) {
        if (i < 0 || i >= this.dQ.dt) {
            return -1;
        }
        return ((b) this.dQ.dv.get(i)).delay;
    }

    public int getFrameCount() {
        return this.dQ.dt;
    }

    public int getHeight() {
        return this.dQ.height;
    }

    @Deprecated
    public int getLoopCount() {
        if (this.dQ.loopCount == -1) {
            return 1;
        }
        return this.dQ.loopCount;
    }

    public int getStatus() {
        return this.status;
    }

    public int getWidth() {
        return this.dQ.width;
    }

    public synchronized int read(@Nullable byte[] bArr) {
        this.dQ = aF().d(bArr).aC();
        if (bArr != null) {
            a(this.dQ, bArr);
        }
        return this.status;
    }
}

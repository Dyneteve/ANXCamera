package com.bumptech.glide.b;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/* compiled from: GifHeaderParser */
public class d {
    private static final String TAG = "GifHeaderParser";
    private static final int cA = 28;
    private static final int cB = 2;
    private static final int cC = 1;
    private static final int cD = 128;
    private static final int cE = 64;
    private static final int cF = 7;
    private static final int cG = 128;
    private static final int cH = 7;
    static final int cI = 2;
    static final int cJ = 10;
    private static final int cK = 256;
    private static final int cr = 255;
    private static final int ct = 44;
    private static final int cu = 33;
    private static final int cv = 59;
    private static final int cw = 249;
    private static final int cx = 255;
    private static final int cy = 254;
    private static final int cz = 1;
    private final byte[] block = new byte[256];
    private int blockSize = 0;
    private ByteBuffer cL;
    private c cM;

    private void ad() {
        read();
        skip();
    }

    private void ae() {
        this.blockSize = read();
        if (this.blockSize > 0) {
            int i = 0;
            int i2 = 0;
            while (i < this.blockSize) {
                try {
                    i2 = this.blockSize - i;
                    this.cL.get(this.block, i, i2);
                    i += i2;
                } catch (Exception e) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Error Reading Block n: ");
                        sb.append(i);
                        sb.append(" count: ");
                        sb.append(i2);
                        sb.append(" blockSize: ");
                        sb.append(this.blockSize);
                        Log.d(str, sb.toString(), e);
                    }
                    this.cM.status = 1;
                    return;
                }
            }
        }
    }

    private boolean err() {
        return this.cM.status != 0;
    }

    private void o(int i) {
        boolean z = false;
        while (!z && !err() && this.cM.cn <= i) {
            int read = read();
            if (read == 33) {
                int read2 = read();
                if (read2 == 1) {
                    skip();
                } else if (read2 != 249) {
                    switch (read2) {
                        case 254:
                            skip();
                            break;
                        case 255:
                            ae();
                            StringBuilder sb = new StringBuilder();
                            for (int i2 = 0; i2 < 11; i2++) {
                                sb.append((char) this.block[i2]);
                            }
                            if (!sb.toString().equals("NETSCAPE2.0")) {
                                skip();
                                break;
                            } else {
                                readNetscapeExt();
                                break;
                            }
                        default:
                            skip();
                            break;
                    }
                } else {
                    this.cM.cp = new b();
                    readGraphicControlExt();
                }
            } else if (read == 44) {
                if (this.cM.cp == null) {
                    this.cM.cp = new b();
                }
                readBitmap();
            } else if (read != 59) {
                this.cM.status = 1;
            } else {
                z = true;
            }
        }
    }

    private int read() {
        try {
            return this.cL.get() & -1;
        } catch (Exception e) {
            this.cM.status = 1;
            return 0;
        }
    }

    private void readBitmap() {
        this.cM.cp.ix = readShort();
        this.cM.cp.iy = readShort();
        this.cM.cp.iw = readShort();
        this.cM.cp.ih = readShort();
        int read = read();
        boolean z = false;
        boolean z2 = (read & 128) != 0;
        int pow = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        b bVar = this.cM.cp;
        if ((read & 64) != 0) {
            z = true;
        }
        bVar.interlace = z;
        if (z2) {
            this.cM.cp.lct = readColorTable(pow);
        } else {
            this.cM.cp.lct = null;
        }
        this.cM.cp.ck = this.cL.position();
        ad();
        if (!err()) {
            this.cM.cn++;
            this.cM.cq.add(this.cM.cp);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0046  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    private int[] readColorTable(int i) {
        int[] iArr;
        byte[] bArr = new byte[(3 * i)];
        try {
            this.cL.get(bArr);
            iArr = new int[256];
            int i2 = 0;
            int i3 = 0;
            while (i2 < i) {
                int i4 = i3 + 1;
                try {
                    int i5 = i4 + 1;
                    int i6 = i5 + 1;
                    int i7 = i2 + 1;
                    iArr[i2] = ((bArr[i3] & -1) << 16) | 0 | ((bArr[i4] & -1) << 8) | (bArr[i5] & -1);
                    i3 = i6;
                    i2 = i7;
                } catch (BufferUnderflowException e) {
                    e = e;
                    if (Log.isLoggable(TAG, 3)) {
                    }
                    this.cM.status = 1;
                    return iArr;
                }
            }
        } catch (BufferUnderflowException e2) {
            e = e2;
            iArr = null;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Format Error Reading Color Table", e);
            }
            this.cM.status = 1;
            return iArr;
        }
        return iArr;
    }

    private void readContents() {
        o(Integer.MAX_VALUE);
    }

    private void readGraphicControlExt() {
        read();
        int read = read();
        this.cM.cp.dispose = (read & 28) >> 2;
        boolean z = true;
        if (this.cM.cp.dispose == 0) {
            this.cM.cp.dispose = 1;
        }
        b bVar = this.cM.cp;
        if ((read & 1) == 0) {
            z = false;
        }
        bVar.transparency = z;
        int readShort = readShort();
        if (readShort < 2) {
            readShort = 10;
        }
        this.cM.cp.delay = readShort * 10;
        this.cM.cp.transIndex = read();
        read();
    }

    private void readHeader() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append((char) read());
        }
        if (!sb.toString().startsWith("GIF")) {
            this.cM.status = 1;
            return;
        }
        readLSD();
        if (this.cM.gctFlag && !err()) {
            this.cM.gct = readColorTable(this.cM.gctSize);
            this.cM.bgColor = this.cM.gct[this.cM.bgIndex];
        }
    }

    private void readLSD() {
        this.cM.width = readShort();
        this.cM.height = readShort();
        int read = read();
        this.cM.gctFlag = (read & 128) != 0;
        this.cM.gctSize = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        this.cM.bgIndex = read();
        this.cM.pixelAspect = read();
    }

    private void readNetscapeExt() {
        do {
            ae();
            if (this.block[0] == 1) {
                this.cM.loopCount = (this.block[1] & -1) | ((this.block[2] & -1) << 8);
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private int readShort() {
        return this.cL.getShort();
    }

    private void reset() {
        this.cL = null;
        Arrays.fill(this.block, 0);
        this.cM = new c();
        this.blockSize = 0;
    }

    private void skip() {
        int read;
        do {
            read = read();
            this.cL.position(Math.min(this.cL.position() + read, this.cL.limit()));
        } while (read > 0);
    }

    public d a(@NonNull ByteBuffer byteBuffer) {
        reset();
        this.cL = byteBuffer.asReadOnlyBuffer();
        this.cL.position(0);
        this.cL.order(ByteOrder.LITTLE_ENDIAN);
        return this;
    }

    @NonNull
    public c ac() {
        if (this.cL == null) {
            throw new IllegalStateException("You must call setData() before parseHeader()");
        } else if (err()) {
            return this.cM;
        } else {
            readHeader();
            if (!err()) {
                readContents();
                if (this.cM.cn < 0) {
                    this.cM.status = 1;
                }
            }
            return this.cM;
        }
    }

    public void clear() {
        this.cL = null;
        this.cM = null;
    }

    public d d(@Nullable byte[] bArr) {
        if (bArr != null) {
            a(ByteBuffer.wrap(bArr));
        } else {
            this.cL = null;
            this.cM.status = 2;
        }
        return this;
    }

    public boolean isAnimated() {
        readHeader();
        if (!err()) {
            o(2);
        }
        return this.cM.cn > 1;
    }
}

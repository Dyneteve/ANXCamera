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
    private static final int dA = 249;
    private static final int dB = 255;
    private static final int dC = 254;
    private static final int dD = 1;
    private static final int dE = 28;
    private static final int dF = 2;
    private static final int dG = 1;
    private static final int dH = 128;
    private static final int dI = 64;
    private static final int dJ = 7;
    private static final int dK = 128;
    private static final int dL = 7;
    static final int dM = 2;
    static final int dN = 10;
    private static final int dO = 256;
    private static final int dw = 255;
    private static final int dx = 44;
    private static final int dy = 33;
    private static final int dz = 59;
    private final byte[] block = new byte[256];
    private int blockSize = 0;
    private ByteBuffer dP;
    private c dQ;

    private void aD() {
        read();
        skip();
    }

    private void aE() {
        this.blockSize = read();
        if (this.blockSize > 0) {
            int i = 0;
            int i2 = 0;
            while (i < this.blockSize) {
                try {
                    i2 = this.blockSize - i;
                    this.dP.get(this.block, i, i2);
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
                    this.dQ.status = 1;
                    return;
                }
            }
        }
    }

    private boolean err() {
        return this.dQ.status != 0;
    }

    private int read() {
        try {
            return this.dP.get() & 255;
        } catch (Exception e) {
            this.dQ.status = 1;
            return 0;
        }
    }

    private void readBitmap() {
        this.dQ.du.ix = readShort();
        this.dQ.du.iy = readShort();
        this.dQ.du.iw = readShort();
        this.dQ.du.ih = readShort();
        int read = read();
        boolean z = false;
        boolean z2 = (read & 128) != 0;
        int pow = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        b bVar = this.dQ.du;
        if ((read & 64) != 0) {
            z = true;
        }
        bVar.interlace = z;
        if (z2) {
            this.dQ.du.lct = readColorTable(pow);
        } else {
            this.dQ.du.lct = null;
        }
        this.dQ.du.f0do = this.dP.position();
        aD();
        if (!err()) {
            this.dQ.dt++;
            this.dQ.dv.add(this.dQ.du);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0046  */
    @Nullable
    private int[] readColorTable(int i) {
        int[] iArr;
        byte[] bArr = new byte[(3 * i)];
        try {
            this.dP.get(bArr);
            iArr = new int[256];
            int i2 = 0;
            int i3 = 0;
            while (i2 < i) {
                int i4 = i3 + 1;
                try {
                    int i5 = i4 + 1;
                    int i6 = i5 + 1;
                    int i7 = i2 + 1;
                    iArr[i2] = ((bArr[i3] & 255) << 16) | -16777216 | ((bArr[i4] & 255) << 8) | (bArr[i5] & 255);
                    i3 = i6;
                    i2 = i7;
                } catch (BufferUnderflowException e) {
                    e = e;
                    if (Log.isLoggable(TAG, 3)) {
                    }
                    this.dQ.status = 1;
                    return iArr;
                }
            }
        } catch (BufferUnderflowException e2) {
            e = e2;
            iArr = null;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Format Error Reading Color Table", e);
            }
            this.dQ.status = 1;
            return iArr;
        }
        return iArr;
    }

    private void readContents() {
        s(Integer.MAX_VALUE);
    }

    private void readGraphicControlExt() {
        read();
        int read = read();
        this.dQ.du.dispose = (read & 28) >> 2;
        boolean z = true;
        if (this.dQ.du.dispose == 0) {
            this.dQ.du.dispose = 1;
        }
        b bVar = this.dQ.du;
        if ((read & 1) == 0) {
            z = false;
        }
        bVar.transparency = z;
        int readShort = readShort();
        if (readShort < 2) {
            readShort = 10;
        }
        this.dQ.du.delay = readShort * 10;
        this.dQ.du.transIndex = read();
        read();
    }

    private void readHeader() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append((char) read());
        }
        if (!sb.toString().startsWith("GIF")) {
            this.dQ.status = 1;
            return;
        }
        readLSD();
        if (this.dQ.gctFlag && !err()) {
            this.dQ.gct = readColorTable(this.dQ.gctSize);
            this.dQ.bgColor = this.dQ.gct[this.dQ.bgIndex];
        }
    }

    private void readLSD() {
        this.dQ.width = readShort();
        this.dQ.height = readShort();
        int read = read();
        this.dQ.gctFlag = (read & 128) != 0;
        this.dQ.gctSize = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        this.dQ.bgIndex = read();
        this.dQ.pixelAspect = read();
    }

    private void readNetscapeExt() {
        do {
            aE();
            if (this.block[0] == 1) {
                this.dQ.loopCount = (this.block[1] & 255) | ((this.block[2] & 255) << 8);
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private int readShort() {
        return this.dP.getShort();
    }

    private void reset() {
        this.dP = null;
        Arrays.fill(this.block, 0);
        this.dQ = new c();
        this.blockSize = 0;
    }

    private void s(int i) {
        boolean z = false;
        while (!z && !err() && this.dQ.dt <= i) {
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
                            aE();
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
                    this.dQ.du = new b();
                    readGraphicControlExt();
                }
            } else if (read == 44) {
                if (this.dQ.du == null) {
                    this.dQ.du = new b();
                }
                readBitmap();
            } else if (read != 59) {
                this.dQ.status = 1;
            } else {
                z = true;
            }
        }
    }

    private void skip() {
        int read;
        do {
            read = read();
            this.dP.position(Math.min(this.dP.position() + read, this.dP.limit()));
        } while (read > 0);
    }

    public d a(@NonNull ByteBuffer byteBuffer) {
        reset();
        this.dP = byteBuffer.asReadOnlyBuffer();
        this.dP.position(0);
        this.dP.order(ByteOrder.LITTLE_ENDIAN);
        return this;
    }

    @NonNull
    public c aC() {
        if (this.dP == null) {
            throw new IllegalStateException("You must call setData() before parseHeader()");
        } else if (err()) {
            return this.dQ;
        } else {
            readHeader();
            if (!err()) {
                readContents();
                if (this.dQ.dt < 0) {
                    this.dQ.status = 1;
                }
            }
            return this.dQ;
        }
    }

    public void clear() {
        this.dP = null;
        this.dQ = null;
    }

    public d d(@Nullable byte[] bArr) {
        if (bArr != null) {
            a(ByteBuffer.wrap(bArr));
        } else {
            this.dP = null;
            this.dQ.status = 2;
        }
        return this;
    }

    public boolean isAnimated() {
        readHeader();
        if (!err()) {
            s(2);
        }
        return this.dQ.dt > 1;
    }
}

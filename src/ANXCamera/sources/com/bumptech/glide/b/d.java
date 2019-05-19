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
    private static final int cA = 1;
    private static final int cB = 128;
    private static final int cC = 64;
    private static final int cD = 7;
    private static final int cE = 128;
    private static final int cF = 7;
    static final int cG = 2;
    static final int cH = 10;
    private static final int cI = 256;
    private static final int cp = 255;
    private static final int cq = 44;
    private static final int cr = 33;
    private static final int ct = 59;
    private static final int cu = 249;
    private static final int cv = 255;
    private static final int cw = 254;
    private static final int cx = 1;
    private static final int cy = 28;
    private static final int cz = 2;
    private final byte[] block = new byte[256];
    private int blockSize = 0;
    private ByteBuffer cJ;
    private c cK;

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
                    this.cJ.get(this.block, i, i2);
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
                    this.cK.status = 1;
                    return;
                }
            }
        }
    }

    private boolean err() {
        return this.cK.status != 0;
    }

    private void o(int i) {
        boolean z = false;
        while (!z && !err() && this.cK.cl <= i) {
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
                    this.cK.cm = new b();
                    readGraphicControlExt();
                }
            } else if (read == 44) {
                if (this.cK.cm == null) {
                    this.cK.cm = new b();
                }
                readBitmap();
            } else if (read != 59) {
                this.cK.status = 1;
            } else {
                z = true;
            }
        }
    }

    private int read() {
        try {
            return this.cJ.get() & -1;
        } catch (Exception e) {
            this.cK.status = 1;
            return 0;
        }
    }

    private void readBitmap() {
        this.cK.cm.ix = readShort();
        this.cK.cm.iy = readShort();
        this.cK.cm.iw = readShort();
        this.cK.cm.ih = readShort();
        int read = read();
        boolean z = false;
        boolean z2 = (read & 128) != 0;
        int pow = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        b bVar = this.cK.cm;
        if ((read & 64) != 0) {
            z = true;
        }
        bVar.interlace = z;
        if (z2) {
            this.cK.cm.lct = readColorTable(pow);
        } else {
            this.cK.cm.lct = null;
        }
        this.cK.cm.ci = this.cJ.position();
        ad();
        if (!err()) {
            this.cK.cl++;
            this.cK.cn.add(this.cK.cm);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0046  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    private int[] readColorTable(int i) {
        int[] iArr;
        byte[] bArr = new byte[(3 * i)];
        try {
            this.cJ.get(bArr);
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
                    this.cK.status = 1;
                    return iArr;
                }
            }
        } catch (BufferUnderflowException e2) {
            e = e2;
            iArr = null;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Format Error Reading Color Table", e);
            }
            this.cK.status = 1;
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
        this.cK.cm.dispose = (read & 28) >> 2;
        boolean z = true;
        if (this.cK.cm.dispose == 0) {
            this.cK.cm.dispose = 1;
        }
        b bVar = this.cK.cm;
        if ((read & 1) == 0) {
            z = false;
        }
        bVar.transparency = z;
        int readShort = readShort();
        if (readShort < 2) {
            readShort = 10;
        }
        this.cK.cm.delay = readShort * 10;
        this.cK.cm.transIndex = read();
        read();
    }

    private void readHeader() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append((char) read());
        }
        if (!sb.toString().startsWith("GIF")) {
            this.cK.status = 1;
            return;
        }
        readLSD();
        if (this.cK.gctFlag && !err()) {
            this.cK.gct = readColorTable(this.cK.gctSize);
            this.cK.bgColor = this.cK.gct[this.cK.bgIndex];
        }
    }

    private void readLSD() {
        this.cK.width = readShort();
        this.cK.height = readShort();
        int read = read();
        this.cK.gctFlag = (read & 128) != 0;
        this.cK.gctSize = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        this.cK.bgIndex = read();
        this.cK.pixelAspect = read();
    }

    private void readNetscapeExt() {
        do {
            ae();
            if (this.block[0] == 1) {
                this.cK.loopCount = (this.block[1] & -1) | ((this.block[2] & -1) << 8);
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private int readShort() {
        return this.cJ.getShort();
    }

    private void reset() {
        this.cJ = null;
        Arrays.fill(this.block, 0);
        this.cK = new c();
        this.blockSize = 0;
    }

    private void skip() {
        int read;
        do {
            read = read();
            this.cJ.position(Math.min(this.cJ.position() + read, this.cJ.limit()));
        } while (read > 0);
    }

    public d a(@NonNull ByteBuffer byteBuffer) {
        reset();
        this.cJ = byteBuffer.asReadOnlyBuffer();
        this.cJ.position(0);
        this.cJ.order(ByteOrder.LITTLE_ENDIAN);
        return this;
    }

    @NonNull
    public c ac() {
        if (this.cJ == null) {
            throw new IllegalStateException("You must call setData() before parseHeader()");
        } else if (err()) {
            return this.cK;
        } else {
            readHeader();
            if (!err()) {
                readContents();
                if (this.cK.cl < 0) {
                    this.cK.status = 1;
                }
            }
            return this.cK;
        }
    }

    public void clear() {
        this.cJ = null;
        this.cK = null;
    }

    public d d(@Nullable byte[] bArr) {
        if (bArr != null) {
            a(ByteBuffer.wrap(bArr));
        } else {
            this.cJ = null;
            this.cK.status = 2;
        }
        return this;
    }

    public boolean isAnimated() {
        readHeader();
        if (!err()) {
            o(2);
        }
        return this.cK.cl > 1;
    }
}

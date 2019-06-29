package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ExifOrientationStream */
public final class g extends FilterInputStream {
    private static final int eS = 2;
    private static final byte[] eT = {-1, -31, 0, 28, 69, 120, 105, 102, 0, 0, 77, 77, 0, 0, 0, 0, 0, 8, 0, 1, 1, 18, 0, 2, 0, 0, 0, 1, 0};
    private static final int eU = eT.length;
    private static final int eV = (eU + 2);
    private final byte eW;
    private int position;

    public g(InputStream inputStream, int i) {
        super(inputStream);
        if (i < -1 || i > 8) {
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot add invalid orientation: ");
            sb.append(i);
            throw new IllegalArgumentException(sb.toString());
        }
        this.eW = (byte) i;
    }

    public void mark(int i) {
        throw new UnsupportedOperationException();
    }

    public boolean markSupported() {
        return false;
    }

    public int read() throws IOException {
        int i = (this.position < 2 || this.position > eV) ? super.read() : this.position == eV ? this.eW : eT[this.position - 2] & 255;
        if (i != -1) {
            this.position++;
        }
        return i;
    }

    public int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (this.position > eV) {
            i3 = super.read(bArr, i, i2);
        } else if (this.position == eV) {
            bArr[i] = this.eW;
            i3 = 1;
        } else if (this.position < 2) {
            i3 = super.read(bArr, i, 2 - this.position);
        } else {
            int min = Math.min(eV - this.position, i2);
            System.arraycopy(eT, this.position - 2, bArr, i, min);
            i3 = min;
        }
        if (i3 > 0) {
            this.position += i3;
        }
        return i3;
    }

    public void reset() throws IOException {
        throw new UnsupportedOperationException();
    }

    public long skip(long j) throws IOException {
        long skip = super.skip(j);
        if (skip > 0) {
            this.position = (int) (((long) this.position) + skip);
        }
        return skip;
    }
}

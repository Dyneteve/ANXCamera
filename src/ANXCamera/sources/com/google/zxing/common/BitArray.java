package com.google.zxing.common;

import java.util.Arrays;

public final class BitArray implements Cloneable {
    private int[] bits;
    private int size;

    public BitArray() {
        this.size = 0;
        this.bits = new int[1];
    }

    public BitArray(int i) {
        this.size = i;
        this.bits = makeArray(i);
    }

    BitArray(int[] iArr, int i) {
        this.bits = iArr;
        this.size = i;
    }

    private void ensureCapacity(int i) {
        if (i > this.bits.length * 32) {
            int[] makeArray = makeArray(i);
            System.arraycopy(this.bits, 0, makeArray, 0, this.bits.length);
            this.bits = makeArray;
        }
    }

    private static int[] makeArray(int i) {
        return new int[((i + 31) / 32)];
    }

    public void appendBit(boolean z) {
        ensureCapacity(this.size + 1);
        if (z) {
            int[] iArr = this.bits;
            int i = this.size / 32;
            iArr[i] = iArr[i] | (1 << (this.size & 31));
        }
        this.size++;
    }

    public void appendBitArray(BitArray bitArray) {
        int i = bitArray.size;
        ensureCapacity(this.size + i);
        for (int i2 = 0; i2 < i; i2++) {
            appendBit(bitArray.get(i2));
        }
    }

    public void appendBits(int i, int i2) {
        if (i2 < 0 || i2 > 32) {
            throw new IllegalArgumentException("Num bits must be between 0 and 32");
        }
        ensureCapacity(this.size + i2);
        for (int i3 = i2; i3 > 0; i3--) {
            boolean z = true;
            if (((i >> (i3 - 1)) & 1) != 1) {
                z = false;
            }
            appendBit(z);
        }
    }

    public void clear() {
        int length = this.bits.length;
        for (int i = 0; i < length; i++) {
            this.bits[i] = 0;
        }
    }

    public BitArray clone() {
        return new BitArray((int[]) this.bits.clone(), this.size);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof BitArray)) {
            return false;
        }
        BitArray bitArray = (BitArray) obj;
        if (this.size == bitArray.size && Arrays.equals(this.bits, bitArray.bits)) {
            z = true;
        }
        return z;
    }

    public void flip(int i) {
        int[] iArr = this.bits;
        int i2 = i / 32;
        iArr[i2] = iArr[i2] ^ (1 << (i & 31));
    }

    public boolean get(int i) {
        return (this.bits[i / 32] & (1 << (i & 31))) != 0;
    }

    public int[] getBitArray() {
        return this.bits;
    }

    public int getNextSet(int i) {
        if (i >= this.size) {
            return this.size;
        }
        int i2 = i / 32;
        int i3 = this.bits[i2] & (~((1 << (i & 31)) - 1));
        while (i3 == 0) {
            i2++;
            if (i2 == this.bits.length) {
                return this.size;
            }
            i3 = this.bits[i2];
        }
        int numberOfTrailingZeros = (i2 * 32) + Integer.numberOfTrailingZeros(i3);
        return numberOfTrailingZeros > this.size ? this.size : numberOfTrailingZeros;
    }

    public int getNextUnset(int i) {
        if (i >= this.size) {
            return this.size;
        }
        int i2 = i / 32;
        int i3 = (~this.bits[i2]) & (~((1 << (i & 31)) - 1));
        while (i3 == 0) {
            i2++;
            if (i2 == this.bits.length) {
                return this.size;
            }
            i3 = ~this.bits[i2];
        }
        int numberOfTrailingZeros = (i2 * 32) + Integer.numberOfTrailingZeros(i3);
        return numberOfTrailingZeros > this.size ? this.size : numberOfTrailingZeros;
    }

    public int getSize() {
        return this.size;
    }

    public int getSizeInBytes() {
        return (this.size + 7) / 8;
    }

    public int hashCode() {
        return (31 * this.size) + Arrays.hashCode(this.bits);
    }

    public boolean isRange(int i, int i2, boolean z) {
        int i3;
        if (i2 < i) {
            throw new IllegalArgumentException();
        } else if (i2 == i) {
            return true;
        } else {
            int i4 = i2 - 1;
            int i5 = i / 32;
            int i6 = i4 / 32;
            int i7 = i5;
            while (i7 <= i6) {
                int i8 = i7 > i5 ? 0 : i & 31;
                int i9 = i7 < i6 ? 31 : i4 & 31;
                if (i8 == 0 && i9 == 31) {
                    i3 = -1;
                } else {
                    i3 = 0;
                    for (int i10 = i8; i10 <= i9; i10++) {
                        i3 |= 1 << i10;
                    }
                }
                if ((this.bits[i7] & i3) != (z ? i3 : 0)) {
                    return false;
                }
                i7++;
            }
            return true;
        }
    }

    public void reverse() {
        int[] iArr = new int[this.bits.length];
        int i = (this.size - 1) / 32;
        int i2 = i + 1;
        for (int i3 = 0; i3 < i2; i3++) {
            long j = (long) this.bits[i3];
            long j2 = ((j >> 1) & 1431655765) | ((1431655765 & j) << 1);
            long j3 = ((j2 >> 2) & 858993459) | ((858993459 & j2) << 2);
            long j4 = ((j3 >> 4) & 252645135) | ((252645135 & j3) << 4);
            long j5 = ((j4 >> 8) & 16711935) | ((16711935 & j4) << 8);
            iArr[i - i3] = (int) (((j5 >> 16) & 65535) | ((65535 & j5) << 16));
        }
        if (this.size != i2 * 32) {
            int i4 = (i2 * 32) - this.size;
            int i5 = 1;
            for (int i6 = 0; i6 < 31 - i4; i6++) {
                i5 = (i5 << 1) | 1;
            }
            int i7 = (iArr[0] >> i4) & i5;
            for (int i8 = 1; i8 < i2; i8++) {
                int i9 = iArr[i8];
                iArr[i8 - 1] = i7 | (i9 << (32 - i4));
                i7 = (i9 >> i4) & i5;
            }
            iArr[i2 - 1] = i7;
        }
        this.bits = iArr;
    }

    public void set(int i) {
        int[] iArr = this.bits;
        int i2 = i / 32;
        iArr[i2] = iArr[i2] | (1 << (i & 31));
    }

    public void setBulk(int i, int i2) {
        this.bits[i / 32] = i2;
    }

    public void setRange(int i, int i2) {
        int i3;
        if (i2 < i) {
            throw new IllegalArgumentException();
        } else if (i2 != i) {
            int i4 = i2 - 1;
            int i5 = i / 32;
            int i6 = i4 / 32;
            int i7 = i5;
            while (i7 <= i6) {
                int i8 = i7 > i5 ? 0 : i & 31;
                int i9 = i7 < i6 ? 31 : i4 & 31;
                if (i8 == 0 && i9 == 31) {
                    i3 = -1;
                } else {
                    i3 = 0;
                    for (int i10 = i8; i10 <= i9; i10++) {
                        i3 |= 1 << i10;
                    }
                }
                int[] iArr = this.bits;
                iArr[i7] = iArr[i7] | i3;
                i7++;
            }
        }
    }

    public void toBytes(int i, byte[] bArr, int i2, int i3) {
        for (int i4 = 0; i4 < i3; i4++) {
            int i5 = 0;
            for (int i6 = 0; i6 < 8; i6++) {
                if (get(i)) {
                    i5 |= 1 << (7 - i6);
                }
                i++;
            }
            bArr[i2 + i4] = (byte) i5;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(this.size);
        for (int i = 0; i < this.size; i++) {
            if ((i & 7) == 0) {
                sb.append(' ');
            }
            sb.append(get(i) ? 'X' : '.');
        }
        return sb.toString();
    }

    public void xor(BitArray bitArray) {
        if (this.bits.length == bitArray.bits.length) {
            for (int i = 0; i < this.bits.length; i++) {
                int[] iArr = this.bits;
                iArr[i] = iArr[i] ^ bitArray.bits[i];
            }
            return;
        }
        throw new IllegalArgumentException("Sizes don't match");
    }
}

package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;

final class BinaryShiftToken extends Token {
    private final short binaryShiftByteCount;
    private final short binaryShiftStart;

    BinaryShiftToken(Token token, int i, int i2) {
        super(token);
        this.binaryShiftStart = (short) i;
        this.binaryShiftByteCount = (short) i2;
    }

    public void appendTo(BitArray bitArray, byte[] bArr) {
        int i = 0;
        while (i < this.binaryShiftByteCount) {
            if (i == 0 || (i == 31 && this.binaryShiftByteCount <= 62)) {
                bitArray.appendBits(31, 5);
                if (this.binaryShiftByteCount > 62) {
                    bitArray.appendBits(this.binaryShiftByteCount - 31, 16);
                } else if (i == 0) {
                    bitArray.appendBits(Math.min(this.binaryShiftByteCount, 31), 5);
                } else {
                    bitArray.appendBits(this.binaryShiftByteCount - 31, 5);
                }
            }
            bitArray.appendBits(bArr[this.binaryShiftStart + i], 8);
            i++;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(this.binaryShiftStart);
        sb.append("::");
        sb.append((this.binaryShiftStart + this.binaryShiftByteCount) - 1);
        sb.append('>');
        return sb.toString();
    }
}

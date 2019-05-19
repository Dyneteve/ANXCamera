package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;

abstract class Token {
    static final Token EMPTY = new SimpleToken(null, 0, 0);
    private final Token previous;

    public abstract void appendTo(BitArray bitArray, byte[] bArr);

    Token(Token previous2) {
        this.previous = previous2;
    }

    /* access modifiers changed from: 0000 */
    public final Token getPrevious() {
        return this.previous;
    }

    /* access modifiers changed from: 0000 */
    public final Token add(int value, int bitCount) {
        return new SimpleToken(this, value, bitCount);
    }

    /* access modifiers changed from: 0000 */
    public final Token addBinaryShift(int start, int byteCount) {
        return new BinaryShiftToken(this, start, byteCount);
    }
}

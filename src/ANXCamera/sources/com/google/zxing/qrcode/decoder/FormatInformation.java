package com.google.zxing.qrcode.decoder;

final class FormatInformation {
    private static final int[] BITS_SET_IN_HALF_BYTE;
    private static final int[][] FORMAT_INFO_DECODE_LOOKUP;
    private static final int FORMAT_INFO_MASK_QR = 21522;
    private final byte dataMask;
    private final ErrorCorrectionLevel errorCorrectionLevel;

    static {
        int[] iArr = new int[2];
        iArr[0] = FORMAT_INFO_MASK_QR;
        FORMAT_INFO_DECODE_LOOKUP = new int[][]{iArr, new int[]{20773, 1}, new int[]{24188, 2}, new int[]{23371, 3}, new int[]{17913, 4}, new int[]{16590, 5}, new int[]{20375, 6}, new int[]{19104, 7}, new int[]{30660, 8}, new int[]{29427, 9}, new int[]{32170, 10}, new int[]{30877, 11}, new int[]{26159, 12}, new int[]{25368, 13}, new int[]{27713, 14}, new int[]{26998, 15}, new int[]{5769, 16}, new int[]{5054, 17}, new int[]{7399, 18}, new int[]{6608, 19}, new int[]{1890, 20}, new int[]{597, 21}, new int[]{3340, 22}, new int[]{2107, 23}, new int[]{13663, 24}, new int[]{12392, 25}, new int[]{16177, 26}, new int[]{14854, 27}, new int[]{9396, 28}, new int[]{8579, 29}, new int[]{11994, 30}, new int[]{11245, 31}};
        int[] iArr2 = new int[16];
        iArr2[1] = 1;
        iArr2[2] = 1;
        iArr2[3] = 2;
        iArr2[4] = 1;
        iArr2[5] = 2;
        iArr2[6] = 2;
        iArr2[7] = 3;
        iArr2[8] = 1;
        iArr2[9] = 2;
        iArr2[10] = 2;
        iArr2[11] = 3;
        iArr2[12] = 2;
        iArr2[13] = 3;
        iArr2[14] = 3;
        iArr2[15] = 4;
        BITS_SET_IN_HALF_BYTE = iArr2;
    }

    private FormatInformation(int i) {
        this.errorCorrectionLevel = ErrorCorrectionLevel.forBits((i >> 3) & 3);
        this.dataMask = (byte) (i & 7);
    }

    static FormatInformation decodeFormatInformation(int i, int i2) {
        FormatInformation doDecodeFormatInformation = doDecodeFormatInformation(i, i2);
        return doDecodeFormatInformation != null ? doDecodeFormatInformation : doDecodeFormatInformation(i ^ FORMAT_INFO_MASK_QR, i2 ^ FORMAT_INFO_MASK_QR);
    }

    private static FormatInformation doDecodeFormatInformation(int i, int i2) {
        int[][] iArr;
        int i3 = 0;
        int i4 = Integer.MAX_VALUE;
        for (int[] iArr2 : FORMAT_INFO_DECODE_LOOKUP) {
            int i5 = iArr2[0];
            if (i5 == i || i5 == i2) {
                return new FormatInformation(iArr2[1]);
            }
            int numBitsDiffering = numBitsDiffering(i, i5);
            if (numBitsDiffering < i4) {
                i3 = iArr2[1];
                i4 = numBitsDiffering;
            }
            if (i != i2) {
                int numBitsDiffering2 = numBitsDiffering(i2, i5);
                if (numBitsDiffering2 < i4) {
                    i3 = iArr2[1];
                    i4 = numBitsDiffering2;
                }
            }
        }
        if (i4 <= 3) {
            return new FormatInformation(i3);
        }
        return null;
    }

    static int numBitsDiffering(int i, int i2) {
        int i3 = i ^ i2;
        return BITS_SET_IN_HALF_BYTE[i3 & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 4) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 8) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 12) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 16) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 20) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 24) & 15] + BITS_SET_IN_HALF_BYTE[(i3 >>> 28) & 15];
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof FormatInformation)) {
            return false;
        }
        FormatInformation formatInformation = (FormatInformation) obj;
        if (this.errorCorrectionLevel == formatInformation.errorCorrectionLevel && this.dataMask == formatInformation.dataMask) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public byte getDataMask() {
        return this.dataMask;
    }

    /* access modifiers changed from: 0000 */
    public ErrorCorrectionLevel getErrorCorrectionLevel() {
        return this.errorCorrectionLevel;
    }

    public int hashCode() {
        return (this.errorCorrectionLevel.ordinal() << 3) | this.dataMask;
    }
}

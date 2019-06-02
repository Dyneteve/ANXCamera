package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

public final class EAN13Reader extends UPCEANReader {
    static final int[] FIRST_DIGIT_ENCODINGS;
    private final int[] decodeMiddleCounters = new int[4];

    static {
        int[] iArr = new int[10];
        iArr[1] = 11;
        iArr[2] = 13;
        iArr[3] = 14;
        iArr[4] = 19;
        iArr[5] = 25;
        iArr[6] = 28;
        iArr[7] = 21;
        iArr[8] = 22;
        iArr[9] = 26;
        FIRST_DIGIT_ENCODINGS = iArr;
    }

    private static void determineFirstDigit(StringBuilder sb, int i) throws NotFoundException {
        for (int i2 = 0; i2 < 10; i2++) {
            if (i == FIRST_DIGIT_ENCODINGS[i2]) {
                sb.insert(0, (char) (48 + i2));
                return;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* access modifiers changed from: protected */
    public int decodeMiddle(BitArray bitArray, int[] iArr, StringBuilder sb) throws NotFoundException {
        BitArray bitArray2 = bitArray;
        StringBuilder sb2 = sb;
        int[] iArr2 = this.decodeMiddleCounters;
        iArr2[0] = 0;
        iArr2[1] = 0;
        iArr2[2] = 0;
        iArr2[3] = 0;
        int size = bitArray.getSize();
        int i = iArr[1];
        int i2 = 0;
        int i3 = 0;
        while (i3 < 6 && i < size) {
            int decodeDigit = decodeDigit(bitArray2, iArr2, i, L_AND_G_PATTERNS);
            sb2.append((char) (48 + (decodeDigit % 10)));
            int i4 = i;
            for (int i5 : iArr2) {
                i4 += i5;
            }
            if (decodeDigit >= 10) {
                i2 = (1 << (5 - i3)) | i2;
            }
            i3++;
            i = i4;
        }
        determineFirstDigit(sb2, i2);
        int i6 = findGuardPattern(bitArray2, i, true, MIDDLE_PATTERN)[1];
        int i7 = 0;
        while (i7 < 6 && i6 < size) {
            sb2.append((char) (48 + decodeDigit(bitArray2, iArr2, i6, L_PATTERNS)));
            int i8 = i6;
            for (int i9 : iArr2) {
                i8 += i9;
            }
            i7++;
            i6 = i8;
        }
        return i6;
    }

    /* access modifiers changed from: 0000 */
    public BarcodeFormat getBarcodeFormat() {
        return BarcodeFormat.EAN_13;
    }
}

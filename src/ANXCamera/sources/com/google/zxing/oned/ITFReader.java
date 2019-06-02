package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Map;

public final class ITFReader extends OneDReader {
    private static final int[] DEFAULT_ALLOWED_LENGTHS = {6, 8, 10, 12, 14};
    private static final int[] END_PATTERN_REVERSED = {1, 1, 3};
    private static final float MAX_AVG_VARIANCE = 0.38f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.78f;
    private static final int N = 1;
    static final int[][] PATTERNS = {new int[]{1, 1, 3, 3, 1}, new int[]{3, 1, 1, 1, 3}, new int[]{1, 3, 1, 1, 3}, new int[]{3, 3, 1, 1, 1}, new int[]{1, 1, 3, 1, 3}, new int[]{3, 1, 3, 1, 1}, new int[]{1, 3, 3, 1, 1}, new int[]{1, 1, 1, 3, 3}, new int[]{3, 1, 1, 3, 1}, new int[]{1, 3, 1, 3, 1}};
    private static final int[] START_PATTERN = {1, 1, 1, 1};
    private static final int W = 3;
    private int narrowLineWidth = -1;

    private static int decodeDigit(int[] iArr) throws NotFoundException {
        float f = MAX_AVG_VARIANCE;
        int i = -1;
        int length = PATTERNS.length;
        for (int i2 = 0; i2 < length; i2++) {
            float patternMatchVariance = patternMatchVariance(iArr, PATTERNS[i2], MAX_INDIVIDUAL_VARIANCE);
            if (patternMatchVariance < f) {
                f = patternMatchVariance;
                i = i2;
            }
        }
        if (i >= 0) {
            return i;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static void decodeMiddle(BitArray bitArray, int i, int i2, StringBuilder sb) throws NotFoundException {
        int[] iArr = new int[10];
        int[] iArr2 = new int[5];
        int[] iArr3 = new int[5];
        while (i < i2) {
            recordPattern(bitArray, i, iArr);
            for (int i3 = 0; i3 < 5; i3++) {
                int i4 = 2 * i3;
                iArr2[i3] = iArr[i4];
                iArr3[i3] = iArr[i4 + 1];
            }
            sb.append((char) (48 + decodeDigit(iArr2)));
            sb.append((char) (48 + decodeDigit(iArr3)));
            for (int i5 : iArr) {
                i += i5;
            }
        }
    }

    private static int[] findGuardPattern(BitArray bitArray, int i, int[] iArr) throws NotFoundException {
        int length = iArr.length;
        int[] iArr2 = new int[length];
        int size = bitArray.getSize();
        boolean z = false;
        int i2 = 0;
        int i3 = i;
        for (int i4 = i; i4 < size; i4++) {
            boolean z2 = true;
            if (bitArray.get(i4) ^ z) {
                iArr2[i2] = iArr2[i2] + 1;
            } else {
                if (i2 != length - 1) {
                    i2++;
                } else if (patternMatchVariance(iArr2, iArr, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{i3, i4};
                } else {
                    i3 += iArr2[0] + iArr2[1];
                    System.arraycopy(iArr2, 2, iArr2, 0, length - 2);
                    iArr2[length - 2] = 0;
                    iArr2[length - 1] = 0;
                    i2--;
                }
                iArr2[i2] = 1;
                if (z) {
                    z2 = false;
                }
                z = z2;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int skipWhiteSpace(BitArray bitArray) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        if (nextSet != size) {
            return nextSet;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void validateQuietZone(BitArray bitArray, int i) throws NotFoundException {
        int i2 = this.narrowLineWidth * 10;
        int i3 = i2 < i ? i2 : i;
        int i4 = i - 1;
        while (i3 > 0 && i4 >= 0 && !bitArray.get(i4)) {
            i3--;
            i4--;
        }
        if (i3 != 0) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    /* access modifiers changed from: 0000 */
    public int[] decodeEnd(BitArray bitArray) throws NotFoundException {
        bitArray.reverse();
        try {
            int[] findGuardPattern = findGuardPattern(bitArray, skipWhiteSpace(bitArray), END_PATTERN_REVERSED);
            validateQuietZone(bitArray, findGuardPattern[0]);
            int i = findGuardPattern[0];
            findGuardPattern[0] = bitArray.getSize() - findGuardPattern[1];
            findGuardPattern[1] = bitArray.getSize() - i;
            return findGuardPattern;
        } finally {
            bitArray.reverse();
        }
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws FormatException, NotFoundException {
        int i2 = i;
        BitArray bitArray2 = bitArray;
        Map<DecodeHintType, ?> map2 = map;
        int[] decodeStart = decodeStart(bitArray2);
        int[] decodeEnd = decodeEnd(bitArray2);
        StringBuilder sb = new StringBuilder(20);
        char c = 1;
        decodeMiddle(bitArray2, decodeStart[1], decodeEnd[0], sb);
        String sb2 = sb.toString();
        int[] iArr = null;
        if (map2 != null) {
            iArr = (int[]) map2.get(DecodeHintType.ALLOWED_LENGTHS);
        }
        if (iArr == null) {
            iArr = DEFAULT_ALLOWED_LENGTHS;
        }
        int length = sb2.length();
        boolean z = false;
        int length2 = iArr.length;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i4 >= length2) {
                break;
            }
            int i5 = iArr[i4];
            if (length == i5) {
                z = true;
                break;
            }
            char c2 = c;
            if (i5 > i3) {
                i3 = i5;
            }
            i4++;
            c = c2;
        }
        if (!z && length > i3) {
            z = true;
        }
        if (z) {
            return new Result(sb2, null, new ResultPoint[]{new ResultPoint((float) decodeStart[c], (float) i2), new ResultPoint((float) decodeEnd[0], (float) i2)}, BarcodeFormat.ITF);
        }
        throw FormatException.getFormatInstance();
    }

    /* access modifiers changed from: 0000 */
    public int[] decodeStart(BitArray bitArray) throws NotFoundException {
        int[] findGuardPattern = findGuardPattern(bitArray, skipWhiteSpace(bitArray), START_PATTERN);
        this.narrowLineWidth = (findGuardPattern[1] - findGuardPattern[0]) / 4;
        validateQuietZone(bitArray, findGuardPattern[0]);
        return findGuardPattern;
    }
}

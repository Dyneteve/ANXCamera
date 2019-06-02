package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public final class CodaBarReader extends OneDReader {
    static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final String ALPHABET_STRING = "0123456789-$:/.+ABCD";
    static final int[] CHARACTER_ENCODINGS = {3, 6, 9, 96, 18, 66, 33, 36, 48, 72, 12, 24, 69, 81, 84, 21, 26, 41, 11, 14};
    private static final float MAX_ACCEPTABLE = 2.0f;
    private static final int MIN_CHARACTER_LENGTH = 3;
    private static final float PADDING = 1.5f;
    private static final char[] STARTEND_ENCODING = {'A', 'B', 'C', 'D'};
    private int counterLength = 0;
    private int[] counters = new int[80];
    private final StringBuilder decodeRowResult = new StringBuilder(20);

    static boolean arrayContains(char[] cArr, char c) {
        if (cArr != null) {
            for (char c2 : cArr) {
                if (c2 == c) {
                    return true;
                }
            }
        }
        return false;
    }

    private void counterAppend(int i) {
        this.counters[this.counterLength] = i;
        this.counterLength++;
        if (this.counterLength >= this.counters.length) {
            int[] iArr = new int[(this.counterLength * 2)];
            System.arraycopy(this.counters, 0, iArr, 0, this.counterLength);
            this.counters = iArr;
        }
    }

    private int findStartPattern() throws NotFoundException {
        int i = 1;
        while (i < this.counterLength) {
            int narrowWidePattern = toNarrowWidePattern(i);
            if (narrowWidePattern != -1 && arrayContains(STARTEND_ENCODING, ALPHABET[narrowWidePattern])) {
                int i2 = 0;
                for (int i3 = i; i3 < i + 7; i3++) {
                    i2 += this.counters[i3];
                }
                if (i == 1 || this.counters[i - 1] >= i2 / 2) {
                    return i;
                }
            }
            i += 2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void setCounters(BitArray bitArray) throws NotFoundException {
        this.counterLength = 0;
        int nextUnset = bitArray.getNextUnset(0);
        int size = bitArray.getSize();
        if (nextUnset < size) {
            boolean z = true;
            int i = 0;
            while (nextUnset < size) {
                if (bitArray.get(nextUnset) ^ z) {
                    i++;
                } else {
                    counterAppend(i);
                    i = 1;
                    z = !z;
                }
                nextUnset++;
            }
            counterAppend(i);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private int toNarrowWidePattern(int i) {
        int i2 = i + 7;
        if (i2 >= this.counterLength) {
            return -1;
        }
        int[] iArr = this.counters;
        int i3 = 0;
        int i4 = Integer.MAX_VALUE;
        for (int i5 = i; i5 < i2; i5 += 2) {
            int i6 = iArr[i5];
            if (i6 < i4) {
                i4 = i6;
            }
            if (i6 > i3) {
                i3 = i6;
            }
        }
        int i7 = (i4 + i3) / 2;
        int i8 = 0;
        int i9 = Integer.MAX_VALUE;
        for (int i10 = i + 1; i10 < i2; i10 += 2) {
            int i11 = iArr[i10];
            if (i11 < i9) {
                i9 = i11;
            }
            if (i11 > i8) {
                i8 = i11;
            }
        }
        int i12 = (i9 + i8) / 2;
        int i13 = 128;
        int i14 = 0;
        for (int i15 = 0; i15 < 7; i15++) {
            i13 >>= 1;
            if (iArr[i + i15] > ((i15 & 1) == 0 ? i7 : i12)) {
                i14 |= i13;
            }
        }
        for (int i16 = 0; i16 < CHARACTER_ENCODINGS.length; i16++) {
            if (CHARACTER_ENCODINGS[i16] == i14) {
                return i16;
            }
        }
        return -1;
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException {
        int i2;
        int i3 = i;
        Map<DecodeHintType, ?> map2 = map;
        int i4 = 0;
        Arrays.fill(this.counters, 0);
        setCounters(bitArray);
        int findStartPattern = findStartPattern();
        int i5 = findStartPattern;
        this.decodeRowResult.setLength(0);
        while (true) {
            int narrowWidePattern = toNarrowWidePattern(i5);
            if (narrowWidePattern != -1) {
                this.decodeRowResult.append((char) narrowWidePattern);
                i5 += 8;
                i2 = 1;
                if ((this.decodeRowResult.length() <= 1 || !arrayContains(STARTEND_ENCODING, ALPHABET[narrowWidePattern])) && i5 < this.counterLength) {
                    BitArray bitArray2 = bitArray;
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        int i6 = this.counters[i5 - 1];
        int i7 = 0;
        int i8 = -8;
        while (i8 < -1) {
            i7 += this.counters[i5 + i8];
            i8++;
            i4 = i4;
            map2 = map;
            BitArray bitArray3 = bitArray;
        }
        if (i5 >= this.counterLength || i6 >= i7 / 2) {
            validatePattern(findStartPattern);
            int i9 = 0;
            while (i9 < this.decodeRowResult.length()) {
                int i10 = i4;
                int i11 = i2;
                this.decodeRowResult.setCharAt(i9, ALPHABET[this.decodeRowResult.charAt(i9)]);
                i9++;
                i4 = i10;
                i2 = i11;
                map2 = map;
                BitArray bitArray4 = bitArray;
            }
            if (arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(i4))) {
                if (!arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(this.decodeRowResult.length() - i2))) {
                    throw NotFoundException.getNotFoundInstance();
                } else if (this.decodeRowResult.length() > 3) {
                    if (map2 == null || !map2.containsKey(DecodeHintType.RETURN_CODABAR_START_END)) {
                        this.decodeRowResult.deleteCharAt(this.decodeRowResult.length() - i2);
                        this.decodeRowResult.deleteCharAt(i4);
                    }
                    int i12 = 0;
                    int i13 = 0;
                    while (i13 < findStartPattern) {
                        int i14 = i4;
                        int i15 = i2;
                        i12 += this.counters[i13];
                        i13++;
                        Map<DecodeHintType, ?> map3 = map;
                        BitArray bitArray5 = bitArray;
                    }
                    float f = (float) i12;
                    int i16 = findStartPattern;
                    while (i16 < i5 - 1) {
                        int i17 = i4;
                        int i18 = i2;
                        i12 += this.counters[i16];
                        i16++;
                        Map<DecodeHintType, ?> map4 = map;
                        BitArray bitArray6 = bitArray;
                    }
                    float f2 = (float) i12;
                    return new Result(this.decodeRowResult.toString(), null, new ResultPoint[]{new ResultPoint(f, (float) i3), new ResultPoint(f2, (float) i3)}, BarcodeFormat.CODABAR);
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    /* access modifiers changed from: 0000 */
    public void validatePattern(int i) throws NotFoundException {
        int[] iArr = new int[4];
        int[] iArr2 = new int[4];
        int length = this.decodeRowResult.length() - 1;
        int i2 = 0;
        int i3 = i;
        int i4 = 0;
        while (true) {
            int i5 = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i4)];
            for (int i6 = 6; i6 >= 0; i6--) {
                int i7 = (i6 & 1) + ((i5 & 1) * 2);
                iArr[i7] = iArr[i7] + this.counters[i3 + i6];
                iArr2[i7] = iArr2[i7] + 1;
                i5 >>= 1;
            }
            if (i4 >= length) {
                break;
            }
            i3 += 8;
            i4++;
        }
        float[] fArr = new float[4];
        float[] fArr2 = new float[4];
        for (int i8 = 0; i8 < 2; i8++) {
            fArr2[i8] = 0.0f;
            fArr2[i8 + 2] = ((((float) iArr[i8]) / ((float) iArr2[i8])) + (((float) iArr[i8 + 2]) / ((float) iArr2[i8 + 2]))) / 2.0f;
            fArr[i8] = fArr2[i8 + 2];
            fArr[i8 + 2] = ((((float) iArr[i8 + 2]) * 2.0f) + PADDING) / ((float) iArr2[i8 + 2]);
        }
        int i9 = i;
        loop3:
        while (true) {
            int i10 = i2;
            int i11 = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i10)];
            int i12 = 6;
            while (i12 >= 0) {
                int i13 = (i12 & 1) + ((i11 & 1) * 2);
                int i14 = this.counters[i9 + i12];
                if (((float) i14) >= fArr2[i13] && ((float) i14) <= fArr[i13]) {
                    i11 >>= 1;
                    i12--;
                }
            }
            if (i10 < length) {
                i9 += 8;
                i2 = i10 + 1;
            } else {
                return;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

package com.google.zxing.oned;

import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public final class Code39Reader extends OneDReader {
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. *$/+%";
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[39];
    static final int[] CHARACTER_ENCODINGS = {52, 289, 97, 352, 49, 304, 112, 37, 292, 100, 265, 73, 328, 25, 280, 88, 13, 268, 76, 28, 259, 67, 322, 19, 274, 82, 7, 262, 70, 22, 385, 193, 448, 145, MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME, 208, 133, 388, 196, 148, 168, 162, 138, 42};
    private final int[] counters;
    private final StringBuilder decodeRowResult;
    private final boolean extendedMode;
    private final boolean usingCheckDigit;

    public Code39Reader() {
        this(false);
    }

    public Code39Reader(boolean z) {
        this(z, false);
    }

    public Code39Reader(boolean z, boolean z2) {
        this.usingCheckDigit = z;
        this.extendedMode = z2;
        this.decodeRowResult = new StringBuilder(20);
        this.counters = new int[9];
    }

    private static String decodeExtended(CharSequence charSequence) throws FormatException {
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt == '+' || charAt == '$' || charAt == '%' || charAt == '/') {
                char charAt2 = charSequence.charAt(i + 1);
                char c = 0;
                if (charAt != '+') {
                    if (charAt != '/') {
                        switch (charAt) {
                            case '$':
                                if (charAt2 >= 'A' && charAt2 <= 'Z') {
                                    c = (char) (charAt2 - '@');
                                    break;
                                } else {
                                    throw FormatException.getFormatInstance();
                                }
                                break;
                            case '%':
                                if (charAt2 < 'A' || charAt2 > 'E') {
                                    if (charAt2 >= 'F' && charAt2 <= 'W') {
                                        c = (char) (charAt2 - 11);
                                        break;
                                    } else {
                                        throw FormatException.getFormatInstance();
                                    }
                                } else {
                                    c = (char) (charAt2 - '&');
                                    break;
                                }
                                break;
                        }
                    } else if (charAt2 >= 'A' && charAt2 <= 'O') {
                        c = (char) (charAt2 - ' ');
                    } else if (charAt2 == 'Z') {
                        c = ':';
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                } else if (charAt2 < 'A' || charAt2 > 'Z') {
                    throw FormatException.getFormatInstance();
                } else {
                    c = (char) (charAt2 + ' ');
                }
                sb.append(c);
                i++;
            } else {
                sb.append(charAt);
            }
            i++;
        }
        return sb.toString();
    }

    private static int[] findAsteriskPattern(BitArray bitArray, int[] iArr) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i = 0;
        int i2 = nextSet;
        boolean z = false;
        int length = iArr.length;
        int i3 = nextSet;
        while (i3 < size) {
            boolean z2 = true;
            if (bitArray.get(i3) ^ z) {
                iArr[i] = iArr[i] + 1;
            } else {
                if (i != length - 1) {
                    i++;
                } else if (toNarrowWidePattern(iArr) != ASTERISK_ENCODING || !bitArray.isRange(Math.max(0, i2 - ((i3 - i2) / 2)), i2, false)) {
                    i2 += iArr[0] + iArr[1];
                    System.arraycopy(iArr, 2, iArr, 0, length - 2);
                    iArr[length - 2] = 0;
                    iArr[length - 1] = 0;
                    i--;
                } else {
                    return new int[]{i2, i3};
                }
                iArr[i] = 1;
                if (z) {
                    z2 = false;
                }
                z = z2;
            }
            i3++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static char patternToChar(int i) throws NotFoundException {
        for (int i2 = 0; i2 < CHARACTER_ENCODINGS.length; i2++) {
            if (CHARACTER_ENCODINGS[i2] == i) {
                return ALPHABET[i2];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toNarrowWidePattern(int[] iArr) {
        int length = iArr.length;
        int i = 0;
        while (true) {
            int length2 = iArr.length;
            int i2 = Integer.MAX_VALUE;
            for (int i3 = 0; i3 < length2; i3++) {
                int i4 = iArr[i3];
                if (i4 < i2 && i4 > i) {
                    i2 = i4;
                }
            }
            int i5 = i2;
            int i6 = 0;
            int i7 = 0;
            int i8 = 0;
            for (int i9 = 0; i9 < length; i9++) {
                int i10 = iArr[i9];
                if (i10 > i5) {
                    i8 |= 1 << ((length - 1) - i9);
                    i6++;
                    i7 += i10;
                }
            }
            if (i6 == 3) {
                for (int i11 = 0; i11 < length && i6 > 0; i11++) {
                    int i12 = iArr[i11];
                    if (i12 > i5) {
                        i6--;
                        if (i12 * 2 >= i7) {
                            return -1;
                        }
                    }
                }
                return i8;
            } else if (i6 <= 3) {
                return -1;
            } else {
                i = i5;
            }
        }
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        Code39Reader code39Reader = this;
        int i2 = i;
        BitArray bitArray2 = bitArray;
        int[] iArr = code39Reader.counters;
        Arrays.fill(iArr, 0);
        StringBuilder sb = code39Reader.decodeRowResult;
        sb.setLength(0);
        int[] findAsteriskPattern = findAsteriskPattern(bitArray2, iArr);
        int nextSet = bitArray2.getNextSet(findAsteriskPattern[1]);
        int size = bitArray.getSize();
        while (true) {
            recordPattern(bitArray2, nextSet, iArr);
            int narrowWidePattern = toNarrowWidePattern(iArr);
            if (narrowWidePattern >= 0) {
                char patternToChar = patternToChar(narrowWidePattern);
                sb.append(patternToChar);
                int i3 = nextSet;
                int i4 = nextSet;
                int i5 = 0;
                while (i5 < iArr.length) {
                    i4 += iArr[i5];
                    i5++;
                    sb = sb;
                    code39Reader = this;
                    bitArray2 = bitArray;
                }
                nextSet = bitArray2.getNextSet(i4);
                if (patternToChar == '*') {
                    sb.setLength(sb.length() - 1);
                    int i6 = 0;
                    int i7 = 0;
                    while (i7 < iArr.length) {
                        i6 += iArr[i7];
                        i7++;
                        sb = sb;
                        code39Reader = this;
                        BitArray bitArray3 = bitArray;
                    }
                    int i8 = (nextSet - i3) - i6;
                    if (nextSet == size || i8 * 2 >= i6) {
                        if (code39Reader.usingCheckDigit) {
                            int length = sb.length() - 1;
                            int i9 = 0;
                            for (int i10 = 0; i10 < length; i10++) {
                                i9 += ALPHABET_STRING.indexOf(code39Reader.decodeRowResult.charAt(i10));
                            }
                            if (sb.charAt(length) == ALPHABET[i9 % 43]) {
                                sb.setLength(length);
                            } else {
                                throw ChecksumException.getChecksumInstance();
                            }
                        }
                        if (sb.length() != 0) {
                            StringBuilder sb2 = sb;
                            return new Result(code39Reader.extendedMode ? decodeExtended(sb) : sb.toString(), null, new ResultPoint[]{new ResultPoint(((float) (findAsteriskPattern[1] + findAsteriskPattern[0])) / 2.0f, (float) i2), new ResultPoint(((float) i3) + (((float) i6) / 2.0f), (float) i2)}, BarcodeFormat.CODE_39);
                        }
                        StringBuilder sb3 = sb;
                        throw NotFoundException.getNotFoundInstance();
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
                StringBuilder sb4 = sb;
            } else {
                StringBuilder sb5 = sb;
                throw NotFoundException.getNotFoundInstance();
            }
        }
    }
}

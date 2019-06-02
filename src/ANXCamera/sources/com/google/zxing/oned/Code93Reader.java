package com.google.zxing.oned;

import android.provider.MiuiSettings.ScreenEffect;
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

public final class Code93Reader extends OneDReader {
    private static final char[] ALPHABET = ALPHABET_STRING.toCharArray();
    private static final String ALPHABET_STRING = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*";
    private static final int ASTERISK_ENCODING = CHARACTER_ENCODINGS[47];
    private static final int[] CHARACTER_ENCODINGS = {276, 328, 324, 322, 296, 292, 290, 336, 274, 266, 424, 420, 418, 404, 402, 394, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT, 356, 354, 308, 282, 344, 332, 326, 300, 278, 436, 434, 428, 422, 406, 410, 364, 358, 310, 314, 302, 468, 466, 458, 366, 374, 430, 294, 474, 470, 306, 350};
    private final int[] counters = new int[6];
    private final StringBuilder decodeRowResult = new StringBuilder(20);

    private static void checkChecksums(CharSequence charSequence) throws ChecksumException {
        int length = charSequence.length();
        checkOneChecksum(charSequence, length - 2, 20);
        checkOneChecksum(charSequence, length - 1, 15);
    }

    private static void checkOneChecksum(CharSequence charSequence, int i, int i2) throws ChecksumException {
        int i3 = 1;
        int i4 = 0;
        for (int i5 = i - 1; i5 >= 0; i5--) {
            i4 += ALPHABET_STRING.indexOf(charSequence.charAt(i5)) * i3;
            i3++;
            if (i3 > i2) {
                i3 = 1;
            }
        }
        if (charSequence.charAt(i) != ALPHABET[i4 % 47]) {
            throw ChecksumException.getChecksumInstance();
        }
    }

    private static String decodeExtended(CharSequence charSequence) throws FormatException {
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (charAt < 'a' || charAt > 'd') {
                sb.append(charAt);
            } else if (i < length - 1) {
                char charAt2 = charSequence.charAt(i + 1);
                char c = 0;
                switch (charAt) {
                    case 'a':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 - '@');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    case 'b':
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
                    case 'c':
                        if (charAt2 >= 'A' && charAt2 <= 'O') {
                            c = (char) (charAt2 - ' ');
                            break;
                        } else if (charAt2 == 'Z') {
                            c = ':';
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    case 'd':
                        if (charAt2 >= 'A' && charAt2 <= 'Z') {
                            c = (char) (charAt2 + ' ');
                            break;
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                        break;
                }
                sb.append(c);
                i++;
            } else {
                throw FormatException.getFormatInstance();
            }
            i++;
        }
        return sb.toString();
    }

    private int[] findAsteriskPattern(BitArray bitArray) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        Arrays.fill(this.counters, 0);
        int[] iArr = this.counters;
        int i = nextSet;
        boolean z = false;
        int length = iArr.length;
        int i2 = 0;
        for (int i3 = nextSet; i3 < size; i3++) {
            boolean z2 = true;
            if (bitArray.get(i3) ^ z) {
                iArr[i2] = iArr[i2] + 1;
            } else {
                if (i2 != length - 1) {
                    i2++;
                } else if (toPattern(iArr) == ASTERISK_ENCODING) {
                    return new int[]{i, i3};
                } else {
                    i += iArr[0] + iArr[1];
                    System.arraycopy(iArr, 2, iArr, 0, length - 2);
                    iArr[length - 2] = 0;
                    iArr[length - 1] = 0;
                    i2--;
                }
                iArr[i2] = 1;
                if (z) {
                    z2 = false;
                }
                z = z2;
            }
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

    private static int toPattern(int[] iArr) {
        int length = iArr.length;
        int i = 0;
        for (int i2 : iArr) {
            i += i2;
        }
        int i3 = 0;
        for (int i4 = 0; i4 < length; i4++) {
            int round = Math.round((((float) iArr[i4]) * 9.0f) / ((float) i));
            if (round < 1 || round > 4) {
                return -1;
            }
            if ((i4 & 1) == 0) {
                for (int i5 = 0; i5 < round; i5++) {
                    i3 = (i3 << 1) | 1;
                }
            } else {
                i3 <<= round;
            }
        }
        return i3;
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        int i2 = i;
        BitArray bitArray2 = bitArray;
        int[] findAsteriskPattern = findAsteriskPattern(bitArray2);
        int nextSet = bitArray2.getNextSet(findAsteriskPattern[1]);
        int size = bitArray.getSize();
        int[] iArr = this.counters;
        Arrays.fill(iArr, 0);
        StringBuilder sb = this.decodeRowResult;
        sb.setLength(0);
        while (true) {
            recordPattern(bitArray2, nextSet, iArr);
            int pattern = toPattern(iArr);
            if (pattern >= 0) {
                char patternToChar = patternToChar(pattern);
                sb.append(patternToChar);
                int i3 = nextSet;
                int i4 = nextSet;
                int i5 = 0;
                while (i5 < iArr.length) {
                    i4 += iArr[i5];
                    i5++;
                    bitArray2 = bitArray;
                }
                nextSet = bitArray2.getNextSet(i4);
                if (patternToChar == '*') {
                    sb.deleteCharAt(sb.length() - 1);
                    int i6 = 0;
                    int i7 = 0;
                    while (i7 < iArr.length) {
                        i6 += iArr[i7];
                        i7++;
                        bitArray2 = bitArray;
                    }
                    if (nextSet == size || !bitArray2.get(nextSet)) {
                        throw NotFoundException.getNotFoundInstance();
                    } else if (sb.length() >= 2) {
                        checkChecksums(sb);
                        sb.setLength(sb.length() - 2);
                        return new Result(decodeExtended(sb), null, new ResultPoint[]{new ResultPoint(((float) (findAsteriskPattern[1] + findAsteriskPattern[0])) / 2.0f, (float) i2), new ResultPoint(((float) i3) + (((float) i6) / 2.0f), (float) i2)}, BarcodeFormat.CODE_93);
                    } else {
                        throw NotFoundException.getNotFoundInstance();
                    }
                } else {
                    bitArray2 = bitArray;
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
    }
}

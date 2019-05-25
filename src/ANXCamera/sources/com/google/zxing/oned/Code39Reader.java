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

    public Code39Reader(boolean usingCheckDigit2) {
        this(usingCheckDigit2, false);
    }

    public Code39Reader(boolean usingCheckDigit2, boolean extendedMode2) {
        this.usingCheckDigit = usingCheckDigit2;
        this.extendedMode = extendedMode2;
        this.decodeRowResult = new StringBuilder(20);
        this.counters = new int[9];
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        String resultString;
        Code39Reader code39Reader = this;
        int i = rowNumber;
        BitArray bitArray = row;
        int[] theCounters = code39Reader.counters;
        Arrays.fill(theCounters, 0);
        StringBuilder result = code39Reader.decodeRowResult;
        result.setLength(0);
        int[] start = findAsteriskPattern(bitArray, theCounters);
        int nextStart = bitArray.getNextSet(start[1]);
        int end = row.getSize();
        while (true) {
            recordPattern(bitArray, nextStart, theCounters);
            int pattern = toNarrowWidePattern(theCounters);
            if (pattern >= 0) {
                char decodedChar = patternToChar(pattern);
                result.append(decodedChar);
                int lastStart = nextStart;
                int nextStart2 = nextStart;
                int nextStart3 = 0;
                while (nextStart3 < theCounters.length) {
                    nextStart2 += theCounters[nextStart3];
                    nextStart3++;
                    result = result;
                    code39Reader = this;
                    bitArray = row;
                }
                nextStart = bitArray.getNextSet(nextStart2);
                if (decodedChar == '*') {
                    result.setLength(result.length() - 1);
                    int lastPatternSize = 0;
                    int lastPatternSize2 = 0;
                    while (lastPatternSize2 < theCounters.length) {
                        lastPatternSize += theCounters[lastPatternSize2];
                        lastPatternSize2++;
                        result = result;
                        code39Reader = this;
                        BitArray bitArray2 = row;
                    }
                    int whiteSpaceAfterEnd = (nextStart - lastStart) - lastPatternSize;
                    if (nextStart == end || whiteSpaceAfterEnd * 2 >= lastPatternSize) {
                        if (code39Reader.usingCheckDigit) {
                            int max = result.length() - 1;
                            int total = 0;
                            for (int i2 = 0; i2 < max; i2++) {
                                total += ALPHABET_STRING.indexOf(code39Reader.decodeRowResult.charAt(i2));
                            }
                            if (result.charAt(max) == ALPHABET[total % 43]) {
                                result.setLength(max);
                            } else {
                                throw ChecksumException.getChecksumInstance();
                            }
                        }
                        if (result.length() != 0) {
                            if (code39Reader.extendedMode) {
                                resultString = decodeExtended(result);
                            } else {
                                resultString = result.toString();
                            }
                            StringBuilder sb = result;
                            return new Result(resultString, null, new ResultPoint[]{new ResultPoint(((float) (start[1] + start[0])) / 2.0f, (float) i), new ResultPoint(((float) lastStart) + (((float) lastPatternSize) / 2.0f), (float) i)}, BarcodeFormat.CODE_39);
                        }
                        throw NotFoundException.getNotFoundInstance();
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
    }

    private static int[] findAsteriskPattern(BitArray row, int[] counters2) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters2.length;
        int i = rowOffset;
        while (i < width) {
            boolean z = true;
            if (row.get(i) ^ isWhite) {
                counters2[counterPosition] = counters2[counterPosition] + 1;
            } else {
                if (counterPosition != patternLength - 1) {
                    counterPosition++;
                } else if (toNarrowWidePattern(counters2) != ASTERISK_ENCODING || !row.isRange(Math.max(0, patternStart - ((i - patternStart) / 2)), patternStart, false)) {
                    patternStart += counters2[0] + counters2[1];
                    System.arraycopy(counters2, 2, counters2, 0, patternLength - 2);
                    counters2[patternLength - 2] = 0;
                    counters2[patternLength - 1] = 0;
                    counterPosition--;
                } else {
                    return new int[]{patternStart, i};
                }
                counters2[counterPosition] = 1;
                if (isWhite) {
                    z = false;
                }
                isWhite = z;
            }
            i++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int toNarrowWidePattern(int[] counters2) {
        int numCounters = counters2.length;
        int wideCounters = 0;
        while (true) {
            int length = counters2.length;
            int minCounter = Integer.MAX_VALUE;
            for (int minCounter2 = 0; minCounter2 < length; minCounter2++) {
                int counter = counters2[minCounter2];
                if (counter < minCounter && counter > wideCounters) {
                    minCounter = counter;
                }
            }
            int maxNarrowCounter = minCounter;
            int wideCounters2 = 0;
            int totalWideCountersWidth = 0;
            int pattern = 0;
            for (int i = 0; i < numCounters; i++) {
                int counter2 = counters2[i];
                if (counter2 > maxNarrowCounter) {
                    pattern |= 1 << ((numCounters - 1) - i);
                    wideCounters2++;
                    totalWideCountersWidth += counter2;
                }
            }
            if (wideCounters2 == 3) {
                for (int i2 = 0; i2 < numCounters && wideCounters2 > 0; i2++) {
                    int counter3 = counters2[i2];
                    if (counter3 > maxNarrowCounter) {
                        wideCounters2--;
                        if (counter3 * 2 >= totalWideCountersWidth) {
                            return -1;
                        }
                    }
                }
                return pattern;
            } else if (wideCounters2 <= 3) {
                return -1;
            } else {
                wideCounters = maxNarrowCounter;
            }
        }
    }

    private static char patternToChar(int pattern) throws NotFoundException {
        for (int i = 0; i < CHARACTER_ENCODINGS.length; i++) {
            if (CHARACTER_ENCODINGS[i] == pattern) {
                return ALPHABET[i];
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static String decodeExtended(CharSequence encoded) throws FormatException {
        int length = encoded.length();
        StringBuilder decoded = new StringBuilder(length);
        int i = 0;
        while (i < length) {
            char c = encoded.charAt(i);
            if (c == '+' || c == '$' || c == '%' || c == '/') {
                char next = encoded.charAt(i + 1);
                char decodedChar = 0;
                if (c != '+') {
                    if (c != '/') {
                        switch (c) {
                            case '$':
                                if (next >= 'A' && next <= 'Z') {
                                    decodedChar = (char) (next - '@');
                                    break;
                                } else {
                                    throw FormatException.getFormatInstance();
                                }
                                break;
                            case '%':
                                if (next < 'A' || next > 'E') {
                                    if (next >= 'F' && next <= 'W') {
                                        decodedChar = (char) (next - 11);
                                        break;
                                    } else {
                                        throw FormatException.getFormatInstance();
                                    }
                                } else {
                                    decodedChar = (char) (next - '&');
                                    break;
                                }
                                break;
                        }
                    } else if (next >= 'A' && next <= 'O') {
                        decodedChar = (char) (next - ' ');
                    } else if (next == 'Z') {
                        decodedChar = ':';
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                } else if (next < 'A' || next > 'Z') {
                    throw FormatException.getFormatInstance();
                } else {
                    decodedChar = (char) (next + ' ');
                }
                decoded.append(decodedChar);
                i++;
            } else {
                decoded.append(c);
            }
            i++;
        }
        return decoded.toString();
    }
}

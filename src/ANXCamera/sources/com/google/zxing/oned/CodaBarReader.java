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

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int i;
        int i2 = rowNumber;
        Map<DecodeHintType, ?> map = hints;
        int i3 = 0;
        Arrays.fill(this.counters, 0);
        setCounters(row);
        int startOffset = findStartPattern();
        int nextStart = startOffset;
        this.decodeRowResult.setLength(0);
        while (true) {
            int charOffset = toNarrowWidePattern(nextStart);
            if (charOffset != -1) {
                this.decodeRowResult.append((char) charOffset);
                nextStart += 8;
                i = 1;
                if ((this.decodeRowResult.length() <= 1 || !arrayContains(STARTEND_ENCODING, ALPHABET[charOffset])) && nextStart < this.counterLength) {
                    BitArray bitArray = row;
                }
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        int trailingWhitespace = this.counters[nextStart - 1];
        int lastPatternSize = 0;
        int i4 = -8;
        while (i4 < -1) {
            lastPatternSize += this.counters[nextStart + i4];
            i4++;
            i3 = i3;
            map = hints;
            BitArray bitArray2 = row;
        }
        if (nextStart >= this.counterLength || trailingWhitespace >= lastPatternSize / 2) {
            validatePattern(startOffset);
            int i5 = 0;
            while (i5 < this.decodeRowResult.length()) {
                int i6 = i3;
                int i7 = i;
                this.decodeRowResult.setCharAt(i5, ALPHABET[this.decodeRowResult.charAt(i5)]);
                i5++;
                i3 = i6;
                i = i7;
                map = hints;
                BitArray bitArray3 = row;
            }
            if (arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(i3))) {
                if (!arrayContains(STARTEND_ENCODING, this.decodeRowResult.charAt(this.decodeRowResult.length() - i))) {
                    throw NotFoundException.getNotFoundInstance();
                } else if (this.decodeRowResult.length() > 3) {
                    if (map == null || !map.containsKey(DecodeHintType.RETURN_CODABAR_START_END)) {
                        this.decodeRowResult.deleteCharAt(this.decodeRowResult.length() - i);
                        this.decodeRowResult.deleteCharAt(i3);
                    }
                    int runningCount = 0;
                    int i8 = 0;
                    while (i8 < startOffset) {
                        int i9 = i3;
                        int i10 = i;
                        runningCount += this.counters[i8];
                        i8++;
                        Map<DecodeHintType, ?> map2 = hints;
                        BitArray bitArray4 = row;
                    }
                    float left = (float) runningCount;
                    int i11 = startOffset;
                    while (i11 < nextStart - 1) {
                        int i12 = i3;
                        int i13 = i;
                        runningCount += this.counters[i11];
                        i11++;
                        Map<DecodeHintType, ?> map3 = hints;
                        BitArray bitArray5 = row;
                    }
                    float right = (float) runningCount;
                    return new Result(this.decodeRowResult.toString(), null, new ResultPoint[]{new ResultPoint(left, (float) i2), new ResultPoint(right, (float) i2)}, BarcodeFormat.CODABAR);
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
    public void validatePattern(int start) throws NotFoundException {
        int[] sizes = new int[4];
        int[] counts = new int[4];
        int end = this.decodeRowResult.length() - 1;
        int pattern = 0;
        int pos = start;
        int i = 0;
        while (true) {
            int pattern2 = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i)];
            for (int j = 6; j >= 0; j--) {
                int category = (j & 1) + ((pattern2 & 1) * 2);
                sizes[category] = sizes[category] + this.counters[pos + j];
                counts[category] = counts[category] + 1;
                pattern2 >>= 1;
            }
            if (i >= end) {
                break;
            }
            pos += 8;
            i++;
        }
        float[] maxes = new float[4];
        float[] mins = new float[4];
        for (int i2 = 0; i2 < 2; i2++) {
            mins[i2] = 0.0f;
            mins[i2 + 2] = ((((float) sizes[i2]) / ((float) counts[i2])) + (((float) sizes[i2 + 2]) / ((float) counts[i2 + 2]))) / 2.0f;
            maxes[i2] = mins[i2 + 2];
            maxes[i2 + 2] = ((((float) sizes[i2 + 2]) * 2.0f) + PADDING) / ((float) counts[i2 + 2]);
        }
        int pos2 = start;
        loop3:
        while (true) {
            int i3 = pattern;
            int pattern3 = CHARACTER_ENCODINGS[this.decodeRowResult.charAt(i3)];
            int j2 = 6;
            while (j2 >= 0) {
                int category2 = (j2 & 1) + ((pattern3 & 1) * 2);
                int size = this.counters[pos2 + j2];
                if (((float) size) >= mins[category2] && ((float) size) <= maxes[category2]) {
                    pattern3 >>= 1;
                    j2--;
                }
            }
            if (i3 < end) {
                pos2 += 8;
                pattern = i3 + 1;
            } else {
                return;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void setCounters(BitArray row) throws NotFoundException {
        this.counterLength = 0;
        int i = row.getNextUnset(0);
        int end = row.getSize();
        if (i < end) {
            boolean isWhite = true;
            int count = 0;
            while (i < end) {
                if (row.get(i) ^ isWhite) {
                    count++;
                } else {
                    counterAppend(count);
                    count = 1;
                    isWhite = !isWhite;
                }
                i++;
            }
            counterAppend(count);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void counterAppend(int e) {
        this.counters[this.counterLength] = e;
        this.counterLength++;
        if (this.counterLength >= this.counters.length) {
            int[] temp = new int[(this.counterLength * 2)];
            System.arraycopy(this.counters, 0, temp, 0, this.counterLength);
            this.counters = temp;
        }
    }

    private int findStartPattern() throws NotFoundException {
        int i = 1;
        while (i < this.counterLength) {
            int charOffset = toNarrowWidePattern(i);
            if (charOffset != -1 && arrayContains(STARTEND_ENCODING, ALPHABET[charOffset])) {
                int patternSize = 0;
                for (int j = i; j < i + 7; j++) {
                    patternSize += this.counters[j];
                }
                if (i == 1 || this.counters[i - 1] >= patternSize / 2) {
                    return i;
                }
            }
            i += 2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static boolean arrayContains(char[] array, char key) {
        if (array != null) {
            for (char c : array) {
                if (c == key) {
                    return true;
                }
            }
        }
        return false;
    }

    private int toNarrowWidePattern(int position) {
        int end = position + 7;
        if (end >= this.counterLength) {
            return -1;
        }
        int[] theCounters = this.counters;
        int maxBar = 0;
        int minBar = Integer.MAX_VALUE;
        for (int j = position; j < end; j += 2) {
            int currentCounter = theCounters[j];
            if (currentCounter < minBar) {
                minBar = currentCounter;
            }
            if (currentCounter > maxBar) {
                maxBar = currentCounter;
            }
        }
        int thresholdBar = (minBar + maxBar) / 2;
        int maxSpace = 0;
        int minSpace = Integer.MAX_VALUE;
        for (int j2 = position + 1; j2 < end; j2 += 2) {
            int currentCounter2 = theCounters[j2];
            if (currentCounter2 < minSpace) {
                minSpace = currentCounter2;
            }
            if (currentCounter2 > maxSpace) {
                maxSpace = currentCounter2;
            }
        }
        int thresholdSpace = (minSpace + maxSpace) / 2;
        int bitmask = 128;
        int pattern = 0;
        for (int i = 0; i < 7; i++) {
            bitmask >>= 1;
            if (theCounters[position + i] > ((i & 1) == 0 ? thresholdBar : thresholdSpace)) {
                pattern |= bitmask;
            }
        }
        for (int i2 = 0; i2 < CHARACTER_ENCODINGS.length; i2++) {
            if (CHARACTER_ENCODINGS[i2] == pattern) {
                return i2;
            }
        }
        return -1;
    }
}

package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public final class Code128Reader extends OneDReader {
    private static final int CODE_CODE_A = 101;
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_A = 101;
    private static final int CODE_FNC_4_B = 100;
    static final int[][] CODE_PATTERNS = {new int[]{2, 1, 2, 2, 2, 2}, new int[]{2, 2, 2, 1, 2, 2}, new int[]{2, 2, 2, 2, 2, 1}, new int[]{1, 2, 1, 2, 2, 3}, new int[]{1, 2, 1, 3, 2, 2}, new int[]{1, 3, 1, 2, 2, 2}, new int[]{1, 2, 2, 2, 1, 3}, new int[]{1, 2, 2, 3, 1, 2}, new int[]{1, 3, 2, 2, 1, 2}, new int[]{2, 2, 1, 2, 1, 3}, new int[]{2, 2, 1, 3, 1, 2}, new int[]{2, 3, 1, 2, 1, 2}, new int[]{1, 1, 2, 2, 3, 2}, new int[]{1, 2, 2, 1, 3, 2}, new int[]{1, 2, 2, 2, 3, 1}, new int[]{1, 1, 3, 2, 2, 2}, new int[]{1, 2, 3, 1, 2, 2}, new int[]{1, 2, 3, 2, 2, 1}, new int[]{2, 2, 3, 2, 1, 1}, new int[]{2, 2, 1, 1, 3, 2}, new int[]{2, 2, 1, 2, 3, 1}, new int[]{2, 1, 3, 2, 1, 2}, new int[]{2, 2, 3, 1, 1, 2}, new int[]{3, 1, 2, 1, 3, 1}, new int[]{3, 1, 1, 2, 2, 2}, new int[]{3, 2, 1, 1, 2, 2}, new int[]{3, 2, 1, 2, 2, 1}, new int[]{3, 1, 2, 2, 1, 2}, new int[]{3, 2, 2, 1, 1, 2}, new int[]{3, 2, 2, 2, 1, 1}, new int[]{2, 1, 2, 1, 2, 3}, new int[]{2, 1, 2, 3, 2, 1}, new int[]{2, 3, 2, 1, 2, 1}, new int[]{1, 1, 1, 3, 2, 3}, new int[]{1, 3, 1, 1, 2, 3}, new int[]{1, 3, 1, 3, 2, 1}, new int[]{1, 1, 2, 3, 1, 3}, new int[]{1, 3, 2, 1, 1, 3}, new int[]{1, 3, 2, 3, 1, 1}, new int[]{2, 1, 1, 3, 1, 3}, new int[]{2, 3, 1, 1, 1, 3}, new int[]{2, 3, 1, 3, 1, 1}, new int[]{1, 1, 2, 1, 3, 3}, new int[]{1, 1, 2, 3, 3, 1}, new int[]{1, 3, 2, 1, 3, 1}, new int[]{1, 1, 3, 1, 2, 3}, new int[]{1, 1, 3, 3, 2, 1}, new int[]{1, 3, 3, 1, 2, 1}, new int[]{3, 1, 3, 1, 2, 1}, new int[]{2, 1, 1, 3, 3, 1}, new int[]{2, 3, 1, 1, 3, 1}, new int[]{2, 1, 3, 1, 1, 3}, new int[]{2, 1, 3, 3, 1, 1}, new int[]{2, 1, 3, 1, 3, 1}, new int[]{3, 1, 1, 1, 2, 3}, new int[]{3, 1, 1, 3, 2, 1}, new int[]{3, 3, 1, 1, 2, 1}, new int[]{3, 1, 2, 1, 1, 3}, new int[]{3, 1, 2, 3, 1, 1}, new int[]{3, 3, 2, 1, 1, 1}, new int[]{3, 1, 4, 1, 1, 1}, new int[]{2, 2, 1, 4, 1, 1}, new int[]{4, 3, 1, 1, 1, 1}, new int[]{1, 1, 1, 2, 2, 4}, new int[]{1, 1, 1, 4, 2, 2}, new int[]{1, 2, 1, 1, 2, 4}, new int[]{1, 2, 1, 4, 2, 1}, new int[]{1, 4, 1, 1, 2, 2}, new int[]{1, 4, 1, 2, 2, 1}, new int[]{1, 1, 2, 2, 1, 4}, new int[]{1, 1, 2, 4, 1, 2}, new int[]{1, 2, 2, 1, 1, 4}, new int[]{1, 2, 2, 4, 1, 1}, new int[]{1, 4, 2, 1, 1, 2}, new int[]{1, 4, 2, 2, 1, 1}, new int[]{2, 4, 1, 2, 1, 1}, new int[]{2, 2, 1, 1, 1, 4}, new int[]{4, 1, 3, 1, 1, 1}, new int[]{2, 4, 1, 1, 1, 2}, new int[]{1, 3, 4, 1, 1, 1}, new int[]{1, 1, 1, 2, 4, 2}, new int[]{1, 2, 1, 1, 4, 2}, new int[]{1, 2, 1, 2, 4, 1}, new int[]{1, 1, 4, 2, 1, 2}, new int[]{1, 2, 4, 1, 1, 2}, new int[]{1, 2, 4, 2, 1, 1}, new int[]{4, 1, 1, 2, 1, 2}, new int[]{4, 2, 1, 1, 1, 2}, new int[]{4, 2, 1, 2, 1, 1}, new int[]{2, 1, 2, 1, 4, 1}, new int[]{2, 1, 4, 1, 2, 1}, new int[]{4, 1, 2, 1, 2, 1}, new int[]{1, 1, 1, 1, 4, 3}, new int[]{1, 1, 1, 3, 4, 1}, new int[]{1, 3, 1, 1, 4, 1}, new int[]{1, 1, 4, 1, 1, 3}, new int[]{1, 1, 4, 3, 1, 1}, new int[]{4, 1, 1, 1, 1, 3}, new int[]{4, 1, 1, 3, 1, 1}, new int[]{1, 1, 3, 1, 4, 1}, new int[]{1, 1, 4, 1, 3, 1}, new int[]{3, 1, 1, 1, 4, 1}, new int[]{4, 1, 1, 1, 3, 1}, new int[]{2, 1, 1, 4, 1, 2}, new int[]{2, 1, 1, 2, 1, 4}, new int[]{2, 1, 1, 2, 3, 2}, new int[]{2, 3, 3, 1, 1, 1, 2}};
    private static final int CODE_SHIFT = 98;
    private static final int CODE_START_A = 103;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final float MAX_AVG_VARIANCE = 0.25f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.7f;

    private static int[] findStartPattern(BitArray row) throws NotFoundException {
        int width = row.getSize();
        int rowOffset = row.getNextSet(0);
        int counterPosition = 0;
        int[] counters = new int[6];
        int patternStart = rowOffset;
        boolean isWhite = false;
        int patternLength = counters.length;
        int i = rowOffset;
        while (i < width) {
            boolean z = true;
            if (row.get(i) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    float bestVariance = MAX_AVG_VARIANCE;
                    int bestMatch = -1;
                    for (int startCode = 103; startCode <= 105; startCode++) {
                        float variance = patternMatchVariance(counters, CODE_PATTERNS[startCode], 0.7f);
                        if (variance < bestVariance) {
                            bestVariance = variance;
                            bestMatch = startCode;
                        }
                    }
                    if (bestMatch < 0 || !row.isRange(Math.max(0, patternStart - ((i - patternStart) / 2)), patternStart, false)) {
                        patternStart += counters[0] + counters[1];
                        System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                        counters[patternLength - 2] = 0;
                        counters[patternLength - 1] = 0;
                        counterPosition--;
                    } else {
                        return new int[]{patternStart, i, bestMatch};
                    }
                } else {
                    counterPosition++;
                }
                counters[counterPosition] = 1;
                if (isWhite) {
                    z = false;
                }
                isWhite = z;
            }
            i++;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int decodeCode(BitArray row, int[] counters, int rowOffset) throws NotFoundException {
        recordPattern(row, rowOffset, counters);
        float bestVariance = MAX_AVG_VARIANCE;
        int bestMatch = -1;
        for (int d = 0; d < CODE_PATTERNS.length; d++) {
            float variance = patternMatchVariance(counters, CODE_PATTERNS[d], 0.7f);
            if (variance < bestVariance) {
                bestVariance = variance;
                bestMatch = d;
            }
        }
        if (bestMatch >= 0) {
            return bestMatch;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:106:0x0274, code lost:
        r13 = false;
        r25 = r7;
        r26 = r12;
        r12 = r33;
        r15 = 'd';
     */
    /* JADX WARNING: Code restructure failed: missing block: B:113:0x028f, code lost:
        r8 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:115:0x0295, code lost:
        r26 = r12;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:133:0x02d1, code lost:
        r8 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:135:0x02db, code lost:
        r26 = r12;
        r25 = r13;
        r12 = r33;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:136:0x02e1, code lost:
        r13 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:137:0x02e2, code lost:
        if (r2 == false) goto L_0x02ed;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:139:0x02e6, code lost:
        if (r8 != 101) goto L_0x02e9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:140:0x02e9, code lost:
        r15 = 'e';
     */
    /* JADX WARNING: Code restructure failed: missing block: B:141:0x02ea, code lost:
        r24 = r15;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:142:0x02ed, code lost:
        r24 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:143:0x02ef, code lost:
        r3 = r17;
        r15 = r18;
        r8 = r27;
        r2 = r40;
        r7 = 2;
        r18 = r6;
        r6 = r29;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x0242, code lost:
        r26 = r7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:92:0x0244, code lost:
        r25 = r13;
        r12 = r33;
        r15 = 'd';
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException, ChecksumException {
        int codeSet;
        char c;
        boolean upperMode;
        boolean shiftUpperMode;
        int codeSet2;
        boolean upperMode2;
        boolean shiftUpperMode2;
        int codeSet3;
        boolean shiftUpperMode3;
        boolean upperMode3;
        boolean shiftUpperMode4;
        int i = rowNumber;
        BitArray bitArray = row;
        Map<DecodeHintType, ?> map = hints;
        int i2 = 0;
        boolean convertFNC1 = map != null && map.containsKey(DecodeHintType.ASSUME_GS1);
        int[] startPatternInfo = findStartPattern(row);
        char c2 = 2;
        int startCode = startPatternInfo[2];
        List<Byte> rawCodes = new ArrayList<>(20);
        rawCodes.add(Byte.valueOf((byte) startCode));
        switch (startCode) {
            case 103:
                codeSet = 101;
                break;
            case 104:
                codeSet = 100;
                break;
            case 105:
                codeSet = 99;
                break;
            default:
                int[] iArr = startPatternInfo;
                int i3 = startCode;
                throw FormatException.getFormatInstance();
        }
        boolean done = false;
        boolean isNextShifted = false;
        StringBuilder result = new StringBuilder(20);
        int lastStart = startPatternInfo[0];
        int nextStart = startPatternInfo[1];
        int[] counters = new int[6];
        int code = 0;
        int checksumTotal = startCode;
        int multiplier = 0;
        boolean lastCharacterWasPrintable = true;
        int codeSet4 = codeSet;
        int codeSet5 = 0;
        boolean upperMode4 = false;
        boolean shiftUpperMode5 = false;
        while (!done) {
            int i4 = i2;
            int[] iArr2 = startPatternInfo;
            int i5 = startCode;
            int i6 = codeSet5;
            boolean done2 = done;
            int i7 = lastStart;
            int codeSet6 = codeSet4;
            char c3 = c2;
            boolean unshift = isNextShifted;
            boolean isNextShifted2 = false;
            codeSet5 = code;
            int code2 = decodeCode(bitArray, counters, nextStart);
            rawCodes.add(Byte.valueOf((byte) code2));
            if (code2 != 106) {
                lastCharacterWasPrintable = true;
            }
            if (code2 != 106) {
                multiplier++;
                checksumTotal += multiplier * code2;
            }
            lastStart = nextStart;
            int nextStart2 = nextStart;
            for (int nextStart3 = i4; nextStart3 < counters.length; nextStart3++) {
                boolean done3 = shiftUpperMode5;
                nextStart2 += counters[nextStart3];
            }
            switch (code2) {
                case 103:
                case 104:
                case 105:
                    throw FormatException.getFormatInstance();
                default:
                    switch (codeSet6) {
                        case 99:
                            upperMode = upperMode4;
                            shiftUpperMode = shiftUpperMode5;
                            c = 'd';
                            if (code2 >= 100) {
                                if (code2 != 106) {
                                    boolean lastCharacterWasPrintable2 = false;
                                }
                                if (code2 == 106) {
                                    shiftUpperMode5 = shiftUpperMode;
                                    upperMode4 = upperMode;
                                    isNextShifted = false;
                                    done = true;
                                    break;
                                } else {
                                    switch (code2) {
                                        case 100:
                                            codeSet2 = 100;
                                            break;
                                        case 101:
                                            codeSet2 = 101;
                                            break;
                                        case 102:
                                            if (convertFNC1) {
                                                if (result.length() != 0) {
                                                    result.append(29);
                                                    break;
                                                } else {
                                                    result.append("]C1");
                                                    break;
                                                }
                                            }
                                            break;
                                    }
                                }
                            } else {
                                if (code2 < 10) {
                                    result.append('0');
                                }
                                result.append(code2);
                                break;
                            }
                            break;
                        case 100:
                            upperMode2 = upperMode4;
                            shiftUpperMode2 = shiftUpperMode5;
                            if (code2 >= 96) {
                                if (code2 != 106) {
                                    boolean lastCharacterWasPrintable3 = false;
                                }
                                if (code2 == 106) {
                                    done2 = true;
                                    break;
                                } else {
                                    switch (code2) {
                                        case 98:
                                            isNextShifted2 = true;
                                            codeSet3 = 101;
                                            break;
                                        case 99:
                                            codeSet3 = 99;
                                            break;
                                        case 100:
                                            if (upperMode2 || !shiftUpperMode2) {
                                                if (upperMode2 && shiftUpperMode2) {
                                                    upperMode3 = false;
                                                    shiftUpperMode3 = false;
                                                    break;
                                                } else {
                                                    shiftUpperMode4 = true;
                                                    break;
                                                }
                                            } else {
                                                upperMode3 = true;
                                                shiftUpperMode3 = false;
                                                break;
                                            }
                                        case 101:
                                            codeSet3 = 101;
                                            break;
                                        case 102:
                                            if (convertFNC1) {
                                                if (result.length() != 0) {
                                                    result.append(29);
                                                    break;
                                                } else {
                                                    result.append("]C1");
                                                    break;
                                                }
                                            }
                                            break;
                                    }
                                }
                            } else {
                                if (shiftUpperMode2 == upperMode2) {
                                    result.append((char) (32 + code2));
                                } else {
                                    result.append((char) (32 + code2 + 128));
                                }
                                shiftUpperMode4 = false;
                                break;
                            }
                            break;
                        case 101:
                            if (code2 >= 64) {
                                upperMode2 = upperMode4;
                                shiftUpperMode2 = shiftUpperMode5;
                                if (code2 >= 96) {
                                    if (code2 != 106) {
                                        lastCharacterWasPrintable = false;
                                    }
                                    if (code2 == 106) {
                                        done2 = true;
                                        break;
                                    } else {
                                        switch (code2) {
                                            case 98:
                                                isNextShifted2 = true;
                                                codeSet3 = 100;
                                                break;
                                            case 99:
                                                codeSet3 = 99;
                                                break;
                                            case 100:
                                                codeSet3 = 100;
                                                break;
                                            case 101:
                                                if (upperMode2 || !shiftUpperMode2) {
                                                    if (upperMode2 && shiftUpperMode2) {
                                                        upperMode3 = false;
                                                        shiftUpperMode3 = false;
                                                        break;
                                                    } else {
                                                        shiftUpperMode4 = true;
                                                        break;
                                                    }
                                                } else {
                                                    upperMode3 = true;
                                                    shiftUpperMode3 = false;
                                                    break;
                                                }
                                                break;
                                            case 102:
                                                if (convertFNC1) {
                                                    if (result.length() != 0) {
                                                        result.append(29);
                                                        break;
                                                    } else {
                                                        result.append("]C1");
                                                        break;
                                                    }
                                                }
                                                break;
                                        }
                                    }
                                } else {
                                    if (shiftUpperMode2 == upperMode2) {
                                        result.append((char) (code2 - 64));
                                    } else {
                                        result.append((char) (code2 + 64));
                                    }
                                    shiftUpperMode4 = false;
                                    break;
                                }
                            } else {
                                upperMode2 = upperMode4;
                                if (shiftUpperMode5 == upperMode2) {
                                    result.append((char) (32 + code2));
                                } else {
                                    result.append((char) (32 + code2 + 128));
                                }
                                shiftUpperMode4 = false;
                                break;
                            }
                            break;
                        default:
                            upperMode = upperMode4;
                            shiftUpperMode = shiftUpperMode5;
                            c = 'd';
                            break;
                    }
            }
        }
        int lastPatternSize = nextStart - lastStart;
        int nextStart4 = bitArray.getNextUnset(nextStart);
        if (!bitArray.isRange(nextStart4, Math.min(row.getSize(), nextStart4 + ((nextStart4 - lastStart) / 2)), false)) {
            int[] iArr3 = startPatternInfo;
            int i8 = startCode;
            int i9 = codeSet5;
            boolean z = done;
            int i10 = lastStart;
            int i11 = nextStart4;
            int startCode2 = codeSet4;
            throw NotFoundException.getNotFoundInstance();
        } else if ((checksumTotal - (multiplier * codeSet5)) % 103 == codeSet5) {
            int resultLength = result.length();
            if (resultLength != 0) {
                if (resultLength <= 0 || !lastCharacterWasPrintable) {
                    int startCode3 = codeSet4;
                } else {
                    int i12 = startCode;
                    if (codeSet4 == 99) {
                        result.delete(resultLength - 2, resultLength);
                    } else {
                        result.delete(resultLength - 1, resultLength);
                    }
                }
                float left = ((float) (startPatternInfo[1] + startPatternInfo[0])) / 2.0f;
                int i13 = resultLength;
                int[] iArr4 = startPatternInfo;
                float right = ((float) lastStart) + (((float) lastPatternSize) / 2.0f);
                int rawCodesSize = rawCodes.size();
                int i14 = lastPatternSize;
                byte[] rawBytes = new byte[rawCodesSize];
                int i15 = codeSet5;
                int i16 = 0;
                while (i16 < rawCodesSize) {
                    int rawCodesSize2 = rawCodesSize;
                    boolean done4 = done;
                    int i17 = lastStart;
                    int i18 = nextStart4;
                    rawBytes[i16] = ((Byte) rawCodes.get(i16)).byteValue();
                    i16++;
                    rawCodesSize = rawCodesSize2;
                    done = done4;
                }
                int i19 = rawCodesSize;
                boolean z2 = done;
                int i20 = lastStart;
                int i21 = nextStart4;
                return new Result(result.toString(), rawBytes, new ResultPoint[]{new ResultPoint(left, (float) i), new ResultPoint(right, (float) i)}, BarcodeFormat.CODE_128);
            }
            int i22 = lastPatternSize;
            int[] iArr5 = startPatternInfo;
            int i23 = startCode;
            int i24 = codeSet5;
            boolean z3 = done;
            int i25 = lastStart;
            int i26 = nextStart4;
            int startCode4 = codeSet4;
            throw NotFoundException.getNotFoundInstance();
        } else {
            int[] iArr6 = startPatternInfo;
            int i27 = startCode;
            int i28 = codeSet5;
            boolean z4 = done;
            int i29 = lastStart;
            int i30 = nextStart4;
            int startCode5 = codeSet4;
            throw ChecksumException.getChecksumInstance();
        }
    }
}

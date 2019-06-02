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

    private static int decodeCode(BitArray bitArray, int[] iArr, int i) throws NotFoundException {
        recordPattern(bitArray, i, iArr);
        float f = MAX_AVG_VARIANCE;
        int i2 = -1;
        for (int i3 = 0; i3 < CODE_PATTERNS.length; i3++) {
            float patternMatchVariance = patternMatchVariance(iArr, CODE_PATTERNS[i3], 0.7f);
            if (patternMatchVariance < f) {
                f = patternMatchVariance;
                i2 = i3;
            }
        }
        if (i2 >= 0) {
            return i2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int[] findStartPattern(BitArray bitArray) throws NotFoundException {
        int size = bitArray.getSize();
        int nextSet = bitArray.getNextSet(0);
        int i = 0;
        int[] iArr = new int[6];
        int i2 = nextSet;
        boolean z = false;
        int length = iArr.length;
        int i3 = nextSet;
        while (i3 < size) {
            boolean z2 = true;
            if (bitArray.get(i3) ^ z) {
                iArr[i] = iArr[i] + 1;
            } else {
                if (i == length - 1) {
                    float f = MAX_AVG_VARIANCE;
                    int i4 = -1;
                    for (int i5 = 103; i5 <= 105; i5++) {
                        float patternMatchVariance = patternMatchVariance(iArr, CODE_PATTERNS[i5], 0.7f);
                        if (patternMatchVariance < f) {
                            f = patternMatchVariance;
                            i4 = i5;
                        }
                    }
                    if (i4 < 0 || !bitArray.isRange(Math.max(0, i2 - ((i3 - i2) / 2)), i2, false)) {
                        i2 += iArr[0] + iArr[1];
                        System.arraycopy(iArr, 2, iArr, 0, length - 2);
                        iArr[length - 2] = 0;
                        iArr[length - 1] = 0;
                        i--;
                    } else {
                        return new int[]{i2, i3, i4};
                    }
                } else {
                    i++;
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
        if (r8 != 'e') goto L_0x02e9;
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
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException, ChecksumException {
        char c;
        char c2;
        boolean z;
        boolean z2;
        char c3;
        boolean z3;
        boolean z4;
        char c4;
        boolean z5;
        boolean z6;
        boolean z7;
        int i2 = i;
        BitArray bitArray2 = bitArray;
        Map<DecodeHintType, ?> map2 = map;
        int i3 = 0;
        boolean z8 = map2 != null && map2.containsKey(DecodeHintType.ASSUME_GS1);
        int[] findStartPattern = findStartPattern(bitArray);
        char c5 = 2;
        int i4 = findStartPattern[2];
        ArrayList arrayList = new ArrayList(20);
        arrayList.add(Byte.valueOf((byte) i4));
        switch (i4) {
            case 103:
                c = 'e';
                break;
            case 104:
                c = 'd';
                break;
            case 105:
                c = 'c';
                break;
            default:
                int[] iArr = findStartPattern;
                int i5 = i4;
                throw FormatException.getFormatInstance();
        }
        boolean z9 = false;
        boolean z10 = false;
        StringBuilder sb = new StringBuilder(20);
        int i6 = findStartPattern[0];
        int i7 = findStartPattern[1];
        int[] iArr2 = new int[6];
        int i8 = 0;
        int i9 = i4;
        int i10 = 0;
        boolean z11 = true;
        char c6 = c;
        int i11 = 0;
        boolean z12 = false;
        boolean z13 = false;
        while (!z9) {
            int i12 = i3;
            int[] iArr3 = findStartPattern;
            int i13 = i4;
            int i14 = i11;
            boolean z14 = z9;
            int i15 = i6;
            char c7 = c6;
            char c8 = c5;
            boolean z15 = z10;
            boolean z16 = false;
            i11 = i8;
            int decodeCode = decodeCode(bitArray2, iArr2, i7);
            arrayList.add(Byte.valueOf((byte) decodeCode));
            if (decodeCode != 106) {
                z11 = true;
            }
            if (decodeCode != 106) {
                i10++;
                i9 += i10 * decodeCode;
            }
            i6 = i7;
            int i16 = i7;
            for (int i17 = i12; i17 < iArr2.length; i17++) {
                boolean z17 = z13;
                i16 += iArr2[i17];
            }
            switch (decodeCode) {
                case 103:
                case 104:
                case 105:
                    throw FormatException.getFormatInstance();
                default:
                    switch (c7) {
                        case 'c':
                            z = z12;
                            z2 = z13;
                            c2 = 'd';
                            if (decodeCode >= 100) {
                                if (decodeCode != 106) {
                                    boolean z18 = false;
                                }
                                if (decodeCode == 106) {
                                    z13 = z2;
                                    z12 = z;
                                    z10 = false;
                                    z9 = true;
                                    break;
                                } else {
                                    switch (decodeCode) {
                                        case 100:
                                            c3 = 'd';
                                            break;
                                        case 101:
                                            c3 = 'e';
                                            break;
                                        case 102:
                                            if (z8) {
                                                if (sb.length() != 0) {
                                                    sb.append(29);
                                                    break;
                                                } else {
                                                    sb.append("]C1");
                                                    break;
                                                }
                                            }
                                            break;
                                    }
                                }
                            } else {
                                if (decodeCode < 10) {
                                    sb.append('0');
                                }
                                sb.append(decodeCode);
                                break;
                            }
                            break;
                        case 'd':
                            z3 = z12;
                            z4 = z13;
                            if (decodeCode >= 96) {
                                if (decodeCode != 106) {
                                    boolean z19 = false;
                                }
                                if (decodeCode == 106) {
                                    z14 = true;
                                    break;
                                } else {
                                    switch (decodeCode) {
                                        case 98:
                                            z16 = true;
                                            c4 = 'e';
                                            break;
                                        case 99:
                                            c4 = 'c';
                                            break;
                                        case 100:
                                            if (z3 || !z4) {
                                                if (z3 && z4) {
                                                    z6 = false;
                                                    z5 = false;
                                                    break;
                                                } else {
                                                    z7 = true;
                                                    break;
                                                }
                                            } else {
                                                z6 = true;
                                                z5 = false;
                                                break;
                                            }
                                        case 101:
                                            c4 = 'e';
                                            break;
                                        case 102:
                                            if (z8) {
                                                if (sb.length() != 0) {
                                                    sb.append(29);
                                                    break;
                                                } else {
                                                    sb.append("]C1");
                                                    break;
                                                }
                                            }
                                            break;
                                    }
                                }
                            } else {
                                if (z4 == z3) {
                                    sb.append((char) (32 + decodeCode));
                                } else {
                                    sb.append((char) (32 + decodeCode + 128));
                                }
                                z7 = false;
                                break;
                            }
                            break;
                        case 'e':
                            if (decodeCode >= 64) {
                                z3 = z12;
                                z4 = z13;
                                if (decodeCode >= 96) {
                                    if (decodeCode != 106) {
                                        z11 = false;
                                    }
                                    if (decodeCode == 106) {
                                        z14 = true;
                                        break;
                                    } else {
                                        switch (decodeCode) {
                                            case 98:
                                                z16 = true;
                                                c4 = 'd';
                                                break;
                                            case 99:
                                                c4 = 'c';
                                                break;
                                            case 100:
                                                c4 = 'd';
                                                break;
                                            case 101:
                                                if (z3 || !z4) {
                                                    if (z3 && z4) {
                                                        z6 = false;
                                                        z5 = false;
                                                        break;
                                                    } else {
                                                        z7 = true;
                                                        break;
                                                    }
                                                } else {
                                                    z6 = true;
                                                    z5 = false;
                                                    break;
                                                }
                                                break;
                                            case 102:
                                                if (z8) {
                                                    if (sb.length() != 0) {
                                                        sb.append(29);
                                                        break;
                                                    } else {
                                                        sb.append("]C1");
                                                        break;
                                                    }
                                                }
                                                break;
                                        }
                                    }
                                } else {
                                    if (z4 == z3) {
                                        sb.append((char) (decodeCode - 64));
                                    } else {
                                        sb.append((char) (decodeCode + 64));
                                    }
                                    z7 = false;
                                    break;
                                }
                            } else {
                                z3 = z12;
                                if (z13 == z3) {
                                    sb.append((char) (32 + decodeCode));
                                } else {
                                    sb.append((char) (32 + decodeCode + 128));
                                }
                                z7 = false;
                                break;
                            }
                            break;
                        default:
                            z = z12;
                            z2 = z13;
                            c2 = 'd';
                            break;
                    }
            }
        }
        int i18 = i7 - i6;
        int nextUnset = bitArray2.getNextUnset(i7);
        if (!bitArray2.isRange(nextUnset, Math.min(bitArray.getSize(), nextUnset + ((nextUnset - i6) / 2)), false)) {
            int i19 = i18;
            int[] iArr4 = findStartPattern;
            int i20 = i4;
            int i21 = i11;
            boolean z20 = z9;
            int i22 = i6;
            int i23 = nextUnset;
            char c9 = c6;
            throw NotFoundException.getNotFoundInstance();
        } else if ((i9 - (i10 * i11)) % 103 == i11) {
            int length = sb.length();
            if (length != 0) {
                if (length <= 0 || !z11) {
                    int i24 = i4;
                    char c10 = c6;
                } else {
                    int i25 = i4;
                    if (c6 == 'c') {
                        sb.delete(length - 2, length);
                    } else {
                        sb.delete(length - 1, length);
                    }
                }
                float f = ((float) (findStartPattern[1] + findStartPattern[0])) / 2.0f;
                int i26 = length;
                int[] iArr5 = findStartPattern;
                float f2 = ((float) i6) + (((float) i18) / 2.0f);
                int size = arrayList.size();
                int i27 = i18;
                byte[] bArr = new byte[size];
                int i28 = i11;
                int i29 = 0;
                while (i29 < size) {
                    int i30 = size;
                    boolean z21 = z9;
                    int i31 = i6;
                    int i32 = nextUnset;
                    bArr[i29] = ((Byte) arrayList.get(i29)).byteValue();
                    i29++;
                    size = i30;
                    z9 = z21;
                }
                int i33 = size;
                boolean z22 = z9;
                int i34 = i6;
                int i35 = nextUnset;
                return new Result(sb.toString(), bArr, new ResultPoint[]{new ResultPoint(f, (float) i2), new ResultPoint(f2, (float) i2)}, BarcodeFormat.CODE_128);
            }
            int i36 = length;
            int i37 = i18;
            int[] iArr6 = findStartPattern;
            int i38 = i4;
            int i39 = i11;
            boolean z23 = z9;
            int i40 = i6;
            int i41 = nextUnset;
            char c11 = c6;
            throw NotFoundException.getNotFoundInstance();
        } else {
            int i42 = i18;
            int[] iArr7 = findStartPattern;
            int i43 = i4;
            int i44 = i11;
            boolean z24 = z9;
            int i45 = i6;
            int i46 = nextUnset;
            char c12 = c6;
            throw ChecksumException.getChecksumInstance();
        }
    }
}

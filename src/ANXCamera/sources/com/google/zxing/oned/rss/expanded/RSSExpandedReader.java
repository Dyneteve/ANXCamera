package com.google.zxing.oned.rss.expanded;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import com.google.zxing.oned.rss.AbstractRSSReader;
import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.google.zxing.oned.rss.RSSUtils;
import com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class RSSExpandedReader extends AbstractRSSReader {
    private static final int[] EVEN_TOTAL_SUBSET = {4, 20, 52, 104, 204};
    private static final int[][] FINDER_PATTERNS = {new int[]{1, 8, 4, 1}, new int[]{3, 6, 4, 1}, new int[]{3, 4, 6, 1}, new int[]{3, 2, 8, 1}, new int[]{2, 6, 5, 1}, new int[]{2, 2, 9, 1}};
    private static final int[][] FINDER_PATTERN_SEQUENCES;
    private static final int FINDER_PAT_A = 0;
    private static final int FINDER_PAT_B = 1;
    private static final int FINDER_PAT_C = 2;
    private static final int FINDER_PAT_D = 3;
    private static final int FINDER_PAT_E = 4;
    private static final int FINDER_PAT_F = 5;
    private static final int[] GSUM;
    private static final int MAX_PAIRS = 11;
    private static final int[] SYMBOL_WIDEST = {7, 5, 4, 3, 1};
    private static final int[][] WEIGHTS = {new int[]{1, 3, 9, 27, 81, 32, 96, 77}, new int[]{20, 60, 180, 118, 143, 7, 21, 63}, new int[]{189, 145, 13, 39, 117, 140, 209, 205}, new int[]{193, 157, 49, 147, 19, 57, 171, 91}, new int[]{62, 186, 136, 197, 169, 85, 44, 132}, new int[]{185, 133, 188, 142, 4, 12, 36, 108}, new int[]{113, 128, 173, 97, 80, 29, 87, 50}, new int[]{150, 28, 84, 41, 123, 158, 52, 156}, new int[]{46, 138, 203, 187, 139, 206, 196, 166}, new int[]{76, 17, 51, 153, 37, 111, 122, 155}, new int[]{43, 129, 176, 106, 107, 110, 119, 146}, new int[]{16, 48, 144, 10, 30, 90, 59, 177}, new int[]{109, 116, 137, 200, 178, 112, 125, 164}, new int[]{70, 210, 208, 202, 184, 130, 179, 115}, new int[]{134, 191, 151, 31, 93, 68, 204, 190}, new int[]{148, 22, 66, 198, 172, 94, 71, 2}, new int[]{6, 18, 54, 162, 64, 192, 154, 40}, new int[]{120, 149, 25, 75, 14, 42, 126, 167}, new int[]{79, 26, 78, 23, 69, 207, 199, 175}, new int[]{103, 98, 83, 38, 114, 131, 182, 124}, new int[]{161, 61, 183, 127, 170, 88, 53, 159}, new int[]{55, 165, 73, 8, 24, 72, 5, 15}, new int[]{45, 135, 194, 160, 58, 174, 100, 89}};
    private final List<ExpandedPair> pairs = new ArrayList(11);
    private final List<ExpandedRow> rows = new ArrayList();
    private final int[] startEnd = new int[2];
    private boolean startFromEven = false;

    static {
        int[] iArr = new int[5];
        iArr[1] = 348;
        iArr[2] = 1388;
        iArr[3] = 2948;
        iArr[4] = 3988;
        GSUM = iArr;
        int[] iArr2 = new int[3];
        iArr2[1] = 1;
        iArr2[2] = 1;
        int[] iArr3 = new int[4];
        iArr3[1] = 2;
        iArr3[2] = 1;
        iArr3[3] = 3;
        int[] iArr4 = new int[5];
        iArr4[1] = 4;
        iArr4[2] = 1;
        iArr4[3] = 3;
        iArr4[4] = 2;
        int[] iArr5 = new int[6];
        iArr5[1] = 4;
        iArr5[2] = 1;
        iArr5[3] = 3;
        iArr5[4] = 3;
        iArr5[5] = 5;
        int[] iArr6 = new int[7];
        iArr6[1] = 4;
        iArr6[2] = 1;
        iArr6[3] = 3;
        iArr6[4] = 4;
        iArr6[5] = 5;
        iArr6[6] = 5;
        int[] iArr7 = new int[8];
        iArr7[2] = 1;
        iArr7[3] = 1;
        iArr7[4] = 2;
        iArr7[5] = 2;
        iArr7[6] = 3;
        iArr7[7] = 3;
        int[] iArr8 = new int[9];
        iArr8[2] = 1;
        iArr8[3] = 1;
        iArr8[4] = 2;
        iArr8[5] = 2;
        iArr8[6] = 3;
        iArr8[7] = 4;
        iArr8[8] = 4;
        int[] iArr9 = new int[10];
        iArr9[2] = 1;
        iArr9[3] = 1;
        iArr9[4] = 2;
        iArr9[5] = 2;
        iArr9[6] = 3;
        iArr9[7] = 4;
        iArr9[8] = 5;
        iArr9[9] = 5;
        int[] iArr10 = new int[11];
        iArr10[2] = 1;
        iArr10[3] = 1;
        iArr10[4] = 2;
        iArr10[5] = 3;
        iArr10[6] = 3;
        iArr10[7] = 4;
        iArr10[8] = 4;
        iArr10[9] = 5;
        iArr10[10] = 5;
        FINDER_PATTERN_SEQUENCES = new int[][]{new int[2], iArr2, iArr3, iArr4, iArr5, iArr6, iArr7, iArr8, iArr9, iArr10};
    }

    private void adjustOddEvenCounts(int i) throws NotFoundException {
        int count = count(getOddCounts());
        int count2 = count(getEvenCounts());
        int i2 = (count + count2) - i;
        boolean z = false;
        boolean z2 = (count & 1) == 1;
        if ((count2 & 1) == 0) {
            z = true;
        }
        boolean z3 = false;
        boolean z4 = false;
        if (count > 13) {
            z4 = true;
        } else if (count < 4) {
            z3 = true;
        }
        boolean z5 = false;
        boolean z6 = false;
        if (count2 > 13) {
            z6 = true;
        } else if (count2 < 4) {
            z5 = true;
        }
        if (i2 == 1) {
            if (z2) {
                if (!z) {
                    z4 = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (z) {
                z6 = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (i2 == -1) {
            if (z2) {
                if (!z) {
                    z3 = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (z) {
                z5 = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (i2 != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else if (z2) {
            if (!z) {
                throw NotFoundException.getNotFoundInstance();
            } else if (count < count2) {
                z3 = true;
                z6 = true;
            } else {
                z4 = true;
                z5 = true;
            }
        } else if (z) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (z3) {
            if (!z4) {
                increment(getOddCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z4) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (z5) {
            if (!z6) {
                increment(getEvenCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z6) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }

    private boolean checkChecksum() {
        boolean z = false;
        ExpandedPair expandedPair = (ExpandedPair) this.pairs.get(0);
        DataCharacter leftChar = expandedPair.getLeftChar();
        DataCharacter rightChar = expandedPair.getRightChar();
        if (rightChar == null) {
            return false;
        }
        int checksumPortion = rightChar.getChecksumPortion();
        int i = 2;
        for (int i2 = 1; i2 < this.pairs.size(); i2++) {
            ExpandedPair expandedPair2 = (ExpandedPair) this.pairs.get(i2);
            checksumPortion += expandedPair2.getLeftChar().getChecksumPortion();
            i++;
            DataCharacter rightChar2 = expandedPair2.getRightChar();
            if (rightChar2 != null) {
                checksumPortion += rightChar2.getChecksumPortion();
                i++;
            }
        }
        if ((211 * (i - 4)) + (checksumPortion % 211) == leftChar.getValue()) {
            z = true;
        }
        return z;
    }

    private List<ExpandedPair> checkRows(List<ExpandedRow> list, int i) throws NotFoundException {
        for (int i2 = i; i2 < this.rows.size(); i2++) {
            ExpandedRow expandedRow = (ExpandedRow) this.rows.get(i2);
            this.pairs.clear();
            int size = list.size();
            for (int i3 = 0; i3 < size; i3++) {
                this.pairs.addAll(((ExpandedRow) list.get(i3)).getPairs());
            }
            this.pairs.addAll(expandedRow.getPairs());
            if (isValidSequence(this.pairs)) {
                if (checkChecksum()) {
                    return this.pairs;
                }
                ArrayList arrayList = new ArrayList();
                arrayList.addAll(list);
                arrayList.add(expandedRow);
                try {
                    return checkRows(arrayList, i2 + 1);
                } catch (NotFoundException e) {
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private List<ExpandedPair> checkRows(boolean z) {
        if (this.rows.size() > 25) {
            this.rows.clear();
            return null;
        }
        this.pairs.clear();
        if (z) {
            Collections.reverse(this.rows);
        }
        List<ExpandedPair> list = null;
        try {
            list = checkRows(new ArrayList(), 0);
        } catch (NotFoundException e) {
        }
        if (z) {
            Collections.reverse(this.rows);
        }
        return list;
    }

    static Result constructResult(List<ExpandedPair> list) throws NotFoundException, FormatException {
        String parseInformation = AbstractExpandedDecoder.createDecoder(BitArrayBuilder.buildBitArray(list)).parseInformation();
        ResultPoint[] resultPoints = ((ExpandedPair) list.get(0)).getFinderPattern().getResultPoints();
        ResultPoint[] resultPoints2 = ((ExpandedPair) list.get(list.size() - 1)).getFinderPattern().getResultPoints();
        return new Result(parseInformation, null, new ResultPoint[]{resultPoints[0], resultPoints[1], resultPoints2[0], resultPoints2[1]}, BarcodeFormat.RSS_EXPANDED);
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0057  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0065  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void findNextPair(BitArray bitArray, List<ExpandedPair> list, int i) throws NotFoundException {
        int i2;
        int i3;
        BitArray bitArray2 = bitArray;
        int[] decodeFinderCounters = getDecodeFinderCounters();
        decodeFinderCounters[0] = 0;
        decodeFinderCounters[1] = 0;
        decodeFinderCounters[2] = 0;
        decodeFinderCounters[3] = 0;
        int size = bitArray.getSize();
        if (i >= 0) {
            i2 = i;
        } else if (list.isEmpty()) {
            i2 = 0;
        } else {
            i2 = ((ExpandedPair) list.get(list.size() - 1)).getFinderPattern().getStartEnd()[1];
            boolean z = list.size() % 2 == 0;
            if (this.startFromEven) {
                z = !z;
            }
            boolean z2 = false;
            while (i2 < size) {
                z2 = !bitArray2.get(i2);
                if (!z2) {
                    break;
                }
                i2++;
            }
            int i4 = 0;
            int i5 = i2;
            for (i3 = i2; i3 < size; i3++) {
                if (bitArray2.get(i3) ^ z2) {
                    decodeFinderCounters[i4] = decodeFinderCounters[i4] + 1;
                } else {
                    if (i4 == 3) {
                        if (z) {
                            reverseCounters(decodeFinderCounters);
                        }
                        if (isFinderPattern(decodeFinderCounters)) {
                            this.startEnd[0] = i5;
                            this.startEnd[1] = i3;
                            return;
                        }
                        if (z) {
                            reverseCounters(decodeFinderCounters);
                        }
                        i5 += decodeFinderCounters[0] + decodeFinderCounters[1];
                        decodeFinderCounters[0] = decodeFinderCounters[2];
                        decodeFinderCounters[1] = decodeFinderCounters[3];
                        decodeFinderCounters[2] = 0;
                        decodeFinderCounters[3] = 0;
                        i4--;
                    } else {
                        i4++;
                    }
                    decodeFinderCounters[i4] = 1;
                    z2 = !z2;
                }
            }
            throw NotFoundException.getNotFoundInstance();
        }
        List<ExpandedPair> list2 = list;
        if (list.size() % 2 == 0) {
        }
        if (this.startFromEven) {
        }
        boolean z22 = false;
        while (i2 < size) {
        }
        int i42 = 0;
        int i52 = i2;
        while (i3 < size) {
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int getNextSecondBar(BitArray bitArray, int i) {
        return bitArray.get(i) ? bitArray.getNextSet(bitArray.getNextUnset(i)) : bitArray.getNextUnset(bitArray.getNextSet(i));
    }

    private static boolean isNotA1left(FinderPattern finderPattern, boolean z, boolean z2) {
        return finderPattern.getValue() != 0 || !z || !z2;
    }

    private static boolean isPartialRow(Iterable<ExpandedPair> iterable, Iterable<ExpandedRow> iterable2) {
        for (ExpandedRow expandedRow : iterable2) {
            boolean z = true;
            Iterator it = iterable.iterator();
            while (true) {
                if (it.hasNext()) {
                    ExpandedPair expandedPair = (ExpandedPair) it.next();
                    boolean z2 = false;
                    Iterator it2 = expandedRow.getPairs().iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            if (expandedPair.equals((ExpandedPair) it2.next())) {
                                z2 = true;
                                continue;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (!z2) {
                        z = false;
                        continue;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    private static boolean isValidSequence(List<ExpandedPair> list) {
        int[][] iArr;
        for (int[] iArr2 : FINDER_PATTERN_SEQUENCES) {
            if (list.size() <= iArr2.length) {
                boolean z = true;
                int i = 0;
                while (true) {
                    if (i >= list.size()) {
                        break;
                    } else if (((ExpandedPair) list.get(i)).getFinderPattern().getValue() != iArr2[i]) {
                        z = false;
                        break;
                    } else {
                        i++;
                    }
                }
                if (z) {
                    return true;
                }
            }
        }
        return false;
    }

    private FinderPattern parseFoundFinderPattern(BitArray bitArray, int i, boolean z) {
        int i2;
        int i3;
        int i4;
        BitArray bitArray2 = bitArray;
        if (z) {
            int i5 = this.startEnd[0] - 1;
            while (i5 >= 0 && !bitArray2.get(i5)) {
                i5--;
            }
            int i6 = i5 + 1;
            i3 = this.startEnd[0] - i6;
            i2 = i6;
            i4 = this.startEnd[1];
        } else {
            i2 = this.startEnd[0];
            i4 = bitArray2.getNextUnset(this.startEnd[1] + 1);
            i3 = i4 - this.startEnd[1];
        }
        int i7 = i2;
        int[] decodeFinderCounters = getDecodeFinderCounters();
        System.arraycopy(decodeFinderCounters, 0, decodeFinderCounters, 1, decodeFinderCounters.length - 1);
        decodeFinderCounters[0] = i3;
        try {
            FinderPattern finderPattern = new FinderPattern(parseFinderValue(decodeFinderCounters, FINDER_PATTERNS), new int[]{i7, i4}, i7, i4, i);
            return finderPattern;
        } catch (NotFoundException e) {
            return null;
        }
    }

    private static void removePartialRows(List<ExpandedPair> list, List<ExpandedRow> list2) {
        Iterator it = list2.iterator();
        while (it.hasNext()) {
            ExpandedRow expandedRow = (ExpandedRow) it.next();
            if (expandedRow.getPairs().size() != list.size()) {
                boolean z = true;
                Iterator it2 = expandedRow.getPairs().iterator();
                while (true) {
                    if (it2.hasNext()) {
                        ExpandedPair expandedPair = (ExpandedPair) it2.next();
                        boolean z2 = false;
                        Iterator it3 = list.iterator();
                        while (true) {
                            if (it3.hasNext()) {
                                if (expandedPair.equals((ExpandedPair) it3.next())) {
                                    z2 = true;
                                    continue;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                        if (!z2) {
                            z = false;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                if (z) {
                    it.remove();
                }
            }
        }
    }

    private static void reverseCounters(int[] iArr) {
        int length = iArr.length;
        for (int i = 0; i < length / 2; i++) {
            int i2 = iArr[i];
            iArr[i] = iArr[(length - i) - 1];
            iArr[(length - i) - 1] = i2;
        }
    }

    private void storeRow(int i, boolean z) {
        int i2 = 0;
        boolean z2 = false;
        boolean z3 = false;
        while (true) {
            if (i2 >= this.rows.size()) {
                break;
            }
            ExpandedRow expandedRow = (ExpandedRow) this.rows.get(i2);
            if (expandedRow.getRowNumber() > i) {
                z3 = expandedRow.isEquivalent(this.pairs);
                break;
            } else {
                z2 = expandedRow.isEquivalent(this.pairs);
                i2++;
            }
        }
        if (!z3 && !z2 && !isPartialRow(this.pairs, this.rows)) {
            this.rows.add(i2, new ExpandedRow(this.pairs, i, z));
            removePartialRows(this.pairs, this.rows);
        }
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter decodeDataCharacter(BitArray bitArray, FinderPattern finderPattern, boolean z, boolean z2) throws NotFoundException {
        char c;
        BitArray bitArray2 = bitArray;
        int[] dataCharacterCounters = getDataCharacterCounters();
        int i = 0;
        dataCharacterCounters[0] = 0;
        int i2 = 1;
        dataCharacterCounters[1] = 0;
        int i3 = 2;
        dataCharacterCounters[2] = 0;
        dataCharacterCounters[3] = 0;
        int i4 = 4;
        dataCharacterCounters[4] = 0;
        dataCharacterCounters[5] = 0;
        dataCharacterCounters[6] = 0;
        dataCharacterCounters[7] = 0;
        if (z2) {
            recordPatternInReverse(bitArray2, finderPattern.getStartEnd()[0], dataCharacterCounters);
        } else {
            recordPattern(bitArray2, finderPattern.getStartEnd()[1], dataCharacterCounters);
            int i5 = 0;
            int length = dataCharacterCounters.length - 1;
            while (i5 < length) {
                int i6 = i;
                int i7 = i2;
                int i8 = dataCharacterCounters[i5];
                dataCharacterCounters[i5] = dataCharacterCounters[length];
                dataCharacterCounters[length] = i8;
                i5++;
                length--;
                i2 = i7;
                i = i6;
                BitArray bitArray3 = bitArray;
                i3 = 2;
                i4 = 4;
            }
        }
        int i9 = 17;
        float count = ((float) count(dataCharacterCounters)) / ((float) 17);
        float f = ((float) (finderPattern.getStartEnd()[i2] - finderPattern.getStartEnd()[i])) / 15.0f;
        if (Math.abs(count - f) / f <= 0.3f) {
            int[] oddCounts = getOddCounts();
            int[] evenCounts = getEvenCounts();
            float[] oddRoundingErrors = getOddRoundingErrors();
            float[] evenRoundingErrors = getEvenRoundingErrors();
            int i10 = 0;
            while (i10 < dataCharacterCounters.length) {
                int i11 = i4;
                int i12 = i9;
                int i13 = i;
                float f2 = (1.0f * ((float) dataCharacterCounters[i10])) / count;
                int i14 = (int) (0.5f + f2);
                if (i14 < 1) {
                    c = 39322;
                    if (f2 >= 0.3f) {
                        i14 = 1;
                    } else {
                        throw NotFoundException.getNotFoundInstance();
                    }
                } else {
                    c = 39322;
                    if (i14 > 8) {
                        if (f2 <= 8.7f) {
                            i14 = 8;
                        } else {
                            throw NotFoundException.getNotFoundInstance();
                        }
                    }
                }
                int i15 = i10 / 2;
                if ((i10 & 1) == 0) {
                    oddCounts[i15] = i14;
                    oddRoundingErrors[i15] = f2 - ((float) i14);
                } else {
                    evenCounts[i15] = i14;
                    evenRoundingErrors[i15] = f2 - ((float) i14);
                }
                i10++;
                i = i13;
                i2 = 1;
                char c2 = c;
                i9 = i12;
                BitArray bitArray4 = bitArray;
                i3 = 2;
                i4 = 4;
            }
            adjustOddEvenCounts(i9);
            int value = (((finderPattern.getValue() * i4) + (z ? i : i3)) + (z2 ^ true ? 1 : 0)) - 1;
            int i16 = 0;
            int i17 = 0;
            int length2 = oddCounts.length - i2;
            while (length2 >= 0) {
                int i18 = i4;
                int i19 = i9;
                if (isNotA1left(finderPattern, z, z2)) {
                    i17 += oddCounts[length2] * WEIGHTS[value][2 * length2];
                }
                i16 += oddCounts[length2];
                length2--;
                i4 = i18;
                i9 = i19;
                BitArray bitArray5 = bitArray;
                i2 = 1;
            }
            int i20 = 0;
            int length3 = evenCounts.length - i2;
            while (length3 >= 0) {
                int i21 = i4;
                int i22 = i9;
                if (isNotA1left(finderPattern, z, z2)) {
                    i20 += evenCounts[length3] * WEIGHTS[value][(2 * length3) + 1];
                }
                length3--;
                i4 = i21;
                i9 = i22;
                BitArray bitArray6 = bitArray;
            }
            int i23 = i17 + i20;
            if ((i16 & 1) != 0 || i16 > 13 || i16 < i4) {
                int i24 = i9;
                throw NotFoundException.getNotFoundInstance();
            }
            int i25 = (13 - i16) / 2;
            int i26 = SYMBOL_WIDEST[i25];
            int i27 = 9 - i26;
            int i28 = i9;
            int i29 = i26;
            int i30 = i27;
            int i31 = i25;
            return new DataCharacter((RSSUtils.getRSSvalue(oddCounts, i26, true) * EVEN_TOTAL_SUBSET[i25]) + RSSUtils.getRSSvalue(evenCounts, i27, false) + GSUM[i25], i23);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        this.pairs.clear();
        this.startFromEven = false;
        try {
            return constructResult(decodeRow2pairs(i, bitArray));
        } catch (NotFoundException e) {
            this.pairs.clear();
            this.startFromEven = true;
            return constructResult(decodeRow2pairs(i, bitArray));
        }
    }

    /* access modifiers changed from: 0000 */
    public List<ExpandedPair> decodeRow2pairs(int i, BitArray bitArray) throws NotFoundException {
        while (true) {
            try {
                this.pairs.add(retrieveNextPair(bitArray, this.pairs, i));
            } catch (NotFoundException e) {
                if (this.pairs.isEmpty()) {
                    throw e;
                } else if (checkChecksum()) {
                    return this.pairs;
                } else {
                    boolean z = !this.rows.isEmpty();
                    storeRow(i, false);
                    if (z) {
                        List<ExpandedPair> checkRows = checkRows(false);
                        if (checkRows != null) {
                            return checkRows;
                        }
                        List<ExpandedPair> checkRows2 = checkRows(true);
                        if (checkRows2 != null) {
                            return checkRows2;
                        }
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public List<ExpandedRow> getRows() {
        return this.rows;
    }

    public void reset() {
        this.pairs.clear();
        this.rows.clear();
    }

    /* access modifiers changed from: 0000 */
    public ExpandedPair retrieveNextPair(BitArray bitArray, List<ExpandedPair> list, int i) throws NotFoundException {
        FinderPattern parseFoundFinderPattern;
        DataCharacter dataCharacter;
        boolean z = list.size() % 2 == 0;
        if (this.startFromEven) {
            z = !z;
        }
        boolean z2 = true;
        int i2 = -1;
        do {
            findNextPair(bitArray, list, i2);
            parseFoundFinderPattern = parseFoundFinderPattern(bitArray, i, z);
            if (parseFoundFinderPattern == null) {
                i2 = getNextSecondBar(bitArray, this.startEnd[0]);
                continue;
            } else {
                z2 = false;
                continue;
            }
        } while (z2);
        DataCharacter decodeDataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, z, true);
        if (list.isEmpty() || !((ExpandedPair) list.get(list.size() - 1)).mustBeLast()) {
            try {
                dataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, z, false);
            } catch (NotFoundException e) {
                dataCharacter = null;
            }
            return new ExpandedPair(decodeDataCharacter, dataCharacter, parseFoundFinderPattern, true);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

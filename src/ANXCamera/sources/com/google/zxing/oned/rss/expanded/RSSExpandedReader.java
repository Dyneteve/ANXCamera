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

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        this.pairs.clear();
        this.startFromEven = false;
        try {
            return constructResult(decodeRow2pairs(rowNumber, row));
        } catch (NotFoundException e) {
            this.pairs.clear();
            this.startFromEven = true;
            return constructResult(decodeRow2pairs(rowNumber, row));
        }
    }

    public void reset() {
        this.pairs.clear();
        this.rows.clear();
    }

    /* access modifiers changed from: 0000 */
    public List<ExpandedPair> decodeRow2pairs(int rowNumber, BitArray row) throws NotFoundException {
        while (true) {
            try {
                this.pairs.add(retrieveNextPair(row, this.pairs, rowNumber));
            } catch (NotFoundException nfe) {
                if (this.pairs.isEmpty()) {
                    throw nfe;
                } else if (checkChecksum()) {
                    return this.pairs;
                } else {
                    boolean tryStackedDecode = !this.rows.isEmpty();
                    storeRow(rowNumber, false);
                    if (tryStackedDecode) {
                        List<ExpandedPair> ps = checkRows(false);
                        if (ps != null) {
                            return ps;
                        }
                        List<ExpandedPair> ps2 = checkRows(true);
                        if (ps2 != null) {
                            return ps2;
                        }
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
            }
        }
    }

    private List<ExpandedPair> checkRows(boolean reverse) {
        if (this.rows.size() > 25) {
            this.rows.clear();
            return null;
        }
        this.pairs.clear();
        if (reverse) {
            Collections.reverse(this.rows);
        }
        List<ExpandedPair> ps = null;
        try {
            ps = checkRows(new ArrayList(), 0);
        } catch (NotFoundException e) {
        }
        if (reverse) {
            Collections.reverse(this.rows);
        }
        return ps;
    }

    private List<ExpandedPair> checkRows(List<ExpandedRow> collectedRows, int currentRow) throws NotFoundException {
        for (int i = currentRow; i < this.rows.size(); i++) {
            ExpandedRow row = (ExpandedRow) this.rows.get(i);
            this.pairs.clear();
            int size = collectedRows.size();
            for (int j = 0; j < size; j++) {
                this.pairs.addAll(((ExpandedRow) collectedRows.get(j)).getPairs());
            }
            this.pairs.addAll(row.getPairs());
            if (isValidSequence(this.pairs)) {
                if (checkChecksum()) {
                    return this.pairs;
                }
                List<ExpandedRow> rs = new ArrayList<>();
                rs.addAll(collectedRows);
                rs.add(row);
                try {
                    return checkRows(rs, i + 1);
                } catch (NotFoundException e) {
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static boolean isValidSequence(List<ExpandedPair> pairs2) {
        int[][] iArr;
        for (int[] sequence : FINDER_PATTERN_SEQUENCES) {
            if (pairs2.size() <= sequence.length) {
                boolean stop = true;
                int j = 0;
                while (true) {
                    if (j >= pairs2.size()) {
                        break;
                    } else if (((ExpandedPair) pairs2.get(j)).getFinderPattern().getValue() != sequence[j]) {
                        stop = false;
                        break;
                    } else {
                        j++;
                    }
                }
                if (stop) {
                    return true;
                }
            }
        }
        return false;
    }

    private void storeRow(int rowNumber, boolean wasReversed) {
        int insertPos = 0;
        boolean prevIsSame = false;
        boolean nextIsSame = false;
        while (true) {
            if (insertPos >= this.rows.size()) {
                break;
            }
            ExpandedRow erow = (ExpandedRow) this.rows.get(insertPos);
            if (erow.getRowNumber() > rowNumber) {
                nextIsSame = erow.isEquivalent(this.pairs);
                break;
            } else {
                prevIsSame = erow.isEquivalent(this.pairs);
                insertPos++;
            }
        }
        if (!nextIsSame && !prevIsSame && !isPartialRow(this.pairs, this.rows)) {
            this.rows.add(insertPos, new ExpandedRow(this.pairs, rowNumber, wasReversed));
            removePartialRows(this.pairs, this.rows);
        }
    }

    private static void removePartialRows(List<ExpandedPair> pairs2, List<ExpandedRow> rows2) {
        Iterator<ExpandedRow> iterator = rows2.iterator();
        while (iterator.hasNext()) {
            ExpandedRow r = (ExpandedRow) iterator.next();
            if (r.getPairs().size() != pairs2.size()) {
                boolean allFound = true;
                Iterator it = r.getPairs().iterator();
                while (true) {
                    if (it.hasNext()) {
                        ExpandedPair p = (ExpandedPair) it.next();
                        boolean found = false;
                        Iterator it2 = pairs2.iterator();
                        while (true) {
                            if (it2.hasNext()) {
                                if (p.equals((ExpandedPair) it2.next())) {
                                    found = true;
                                    continue;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                        if (!found) {
                            allFound = false;
                            break;
                        }
                    } else {
                        break;
                    }
                }
                if (allFound) {
                    iterator.remove();
                }
            }
        }
    }

    private static boolean isPartialRow(Iterable<ExpandedPair> pairs2, Iterable<ExpandedRow> rows2) {
        for (ExpandedRow r : rows2) {
            boolean allFound = true;
            Iterator it = pairs2.iterator();
            while (true) {
                if (it.hasNext()) {
                    ExpandedPair p = (ExpandedPair) it.next();
                    boolean found = false;
                    Iterator it2 = r.getPairs().iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            if (p.equals((ExpandedPair) it2.next())) {
                                found = true;
                                continue;
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    if (!found) {
                        allFound = false;
                        continue;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (allFound) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public List<ExpandedRow> getRows() {
        return this.rows;
    }

    static Result constructResult(List<ExpandedPair> pairs2) throws NotFoundException, FormatException {
        String resultingString = AbstractExpandedDecoder.createDecoder(BitArrayBuilder.buildBitArray(pairs2)).parseInformation();
        ResultPoint[] firstPoints = ((ExpandedPair) pairs2.get(0)).getFinderPattern().getResultPoints();
        ResultPoint[] lastPoints = ((ExpandedPair) pairs2.get(pairs2.size() - 1)).getFinderPattern().getResultPoints();
        return new Result(resultingString, null, new ResultPoint[]{firstPoints[0], firstPoints[1], lastPoints[0], lastPoints[1]}, BarcodeFormat.RSS_EXPANDED);
    }

    private boolean checkChecksum() {
        boolean z = false;
        ExpandedPair firstPair = (ExpandedPair) this.pairs.get(0);
        DataCharacter checkCharacter = firstPair.getLeftChar();
        DataCharacter firstCharacter = firstPair.getRightChar();
        if (firstCharacter == null) {
            return false;
        }
        int checksum = firstCharacter.getChecksumPortion();
        int s = 2;
        for (int i = 1; i < this.pairs.size(); i++) {
            ExpandedPair currentPair = (ExpandedPair) this.pairs.get(i);
            checksum += currentPair.getLeftChar().getChecksumPortion();
            s++;
            DataCharacter currentRightChar = currentPair.getRightChar();
            if (currentRightChar != null) {
                checksum += currentRightChar.getChecksumPortion();
                s++;
            }
        }
        if ((211 * (s - 4)) + (checksum % 211) == checkCharacter.getValue()) {
            z = true;
        }
        return z;
    }

    private static int getNextSecondBar(BitArray row, int initialPos) {
        if (row.get(initialPos)) {
            return row.getNextSet(row.getNextUnset(initialPos));
        }
        return row.getNextUnset(row.getNextSet(initialPos));
    }

    /* access modifiers changed from: 0000 */
    public ExpandedPair retrieveNextPair(BitArray row, List<ExpandedPair> previousPairs, int rowNumber) throws NotFoundException {
        FinderPattern pattern;
        DataCharacter rightChar;
        boolean isOddPattern = previousPairs.size() % 2 == 0;
        if (this.startFromEven) {
            isOddPattern = !isOddPattern;
        }
        boolean keepFinding = true;
        int forcedOffset = -1;
        do {
            findNextPair(row, previousPairs, forcedOffset);
            pattern = parseFoundFinderPattern(row, rowNumber, isOddPattern);
            if (pattern == null) {
                forcedOffset = getNextSecondBar(row, this.startEnd[0]);
                continue;
            } else {
                keepFinding = false;
                continue;
            }
        } while (keepFinding);
        DataCharacter leftChar = decodeDataCharacter(row, pattern, isOddPattern, true);
        if (previousPairs.isEmpty() || !((ExpandedPair) previousPairs.get(previousPairs.size() - 1)).mustBeLast()) {
            try {
                rightChar = decodeDataCharacter(row, pattern, isOddPattern, false);
            } catch (NotFoundException e) {
                rightChar = null;
            }
            return new ExpandedPair(leftChar, rightChar, pattern, true);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0057  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0065  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void findNextPair(BitArray row, List<ExpandedPair> previousPairs, int forcedOffset) throws NotFoundException {
        int rowOffset;
        int x;
        BitArray bitArray = row;
        int[] counters = getDecodeFinderCounters();
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int width = row.getSize();
        if (forcedOffset >= 0) {
            rowOffset = forcedOffset;
        } else if (previousPairs.isEmpty() != 0) {
            rowOffset = 0;
        } else {
            rowOffset = ((ExpandedPair) previousPairs.get(previousPairs.size() - 1)).getFinderPattern().getStartEnd()[1];
            boolean searchingEvenPair = previousPairs.size() % 2 == 0;
            if (this.startFromEven) {
                searchingEvenPair = !searchingEvenPair;
            }
            boolean isWhite = false;
            while (rowOffset < width) {
                isWhite = !bitArray.get(rowOffset);
                if (!isWhite) {
                    break;
                }
                rowOffset++;
            }
            int counterPosition = 0;
            int patternStart = rowOffset;
            for (x = rowOffset; x < width; x++) {
                if (bitArray.get(x) ^ isWhite) {
                    counters[counterPosition] = counters[counterPosition] + 1;
                } else {
                    if (counterPosition == 3) {
                        if (searchingEvenPair) {
                            reverseCounters(counters);
                        }
                        if (isFinderPattern(counters)) {
                            this.startEnd[0] = patternStart;
                            this.startEnd[1] = x;
                            return;
                        }
                        if (searchingEvenPair) {
                            reverseCounters(counters);
                        }
                        patternStart += counters[0] + counters[1];
                        counters[0] = counters[2];
                        counters[1] = counters[3];
                        counters[2] = 0;
                        counters[3] = 0;
                        counterPosition--;
                    } else {
                        counterPosition++;
                    }
                    counters[counterPosition] = 1;
                    isWhite = !isWhite;
                }
            }
            throw NotFoundException.getNotFoundInstance();
        }
        List<ExpandedPair> list = previousPairs;
        if (previousPairs.size() % 2 == 0) {
        }
        if (this.startFromEven) {
        }
        boolean isWhite2 = false;
        while (rowOffset < width) {
        }
        int counterPosition2 = 0;
        int patternStart2 = rowOffset;
        while (x < width) {
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static void reverseCounters(int[] counters) {
        int length = counters.length;
        for (int i = 0; i < length / 2; i++) {
            int tmp = counters[i];
            counters[i] = counters[(length - i) - 1];
            counters[(length - i) - 1] = tmp;
        }
    }

    private FinderPattern parseFoundFinderPattern(BitArray row, int rowNumber, boolean oddPattern) {
        int start;
        int firstCounter;
        int firstElementStart;
        BitArray bitArray = row;
        if (oddPattern) {
            int firstElementStart2 = this.startEnd[0] - 1;
            while (firstElementStart2 >= 0 && !bitArray.get(firstElementStart2)) {
                firstElementStart2--;
            }
            int firstElementStart3 = firstElementStart2 + 1;
            firstCounter = this.startEnd[0] - firstElementStart3;
            start = firstElementStart3;
            firstElementStart = this.startEnd[1];
        } else {
            start = this.startEnd[0];
            firstElementStart = bitArray.getNextUnset(this.startEnd[1] + 1);
            firstCounter = firstElementStart - this.startEnd[1];
        }
        int start2 = start;
        int[] counters = getDecodeFinderCounters();
        System.arraycopy(counters, 0, counters, 1, counters.length - 1);
        counters[0] = firstCounter;
        try {
            FinderPattern finderPattern = new FinderPattern(parseFinderValue(counters, FINDER_PATTERNS), new int[]{start2, firstElementStart}, start2, firstElementStart, rowNumber);
            return finderPattern;
        } catch (NotFoundException e) {
            return null;
        }
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter decodeDataCharacter(BitArray row, FinderPattern pattern, boolean isOddPattern, boolean leftChar) throws NotFoundException {
        char c;
        BitArray bitArray = row;
        int[] counters = getDataCharacterCounters();
        int i = 0;
        counters[0] = 0;
        int i2 = 1;
        counters[1] = 0;
        int i3 = 2;
        counters[2] = 0;
        counters[3] = 0;
        int i4 = 4;
        counters[4] = 0;
        counters[5] = 0;
        counters[6] = 0;
        counters[7] = 0;
        if (leftChar) {
            recordPatternInReverse(bitArray, pattern.getStartEnd()[0], counters);
        } else {
            recordPattern(bitArray, pattern.getStartEnd()[1], counters);
            int i5 = 0;
            int j = counters.length - 1;
            while (i5 < j) {
                int i6 = i;
                int i7 = i2;
                int temp = counters[i5];
                counters[i5] = counters[j];
                counters[j] = temp;
                i5++;
                j--;
                i2 = i7;
                i = i6;
                BitArray bitArray2 = row;
                i3 = 2;
                i4 = 4;
            }
        }
        int numModules = 17;
        float elementWidth = ((float) count(counters)) / ((float) 17);
        float expectedElementWidth = ((float) (pattern.getStartEnd()[i2] - pattern.getStartEnd()[i])) / 15.0f;
        if (Math.abs(elementWidth - expectedElementWidth) / expectedElementWidth <= 0.3f) {
            int[] oddCounts = getOddCounts();
            int[] evenCounts = getEvenCounts();
            float[] oddRoundingErrors = getOddRoundingErrors();
            float[] evenRoundingErrors = getEvenRoundingErrors();
            int i8 = 0;
            while (i8 < counters.length) {
                int i9 = i4;
                int numModules2 = numModules;
                int i10 = i;
                float value = (1.0f * ((float) counters[i8])) / elementWidth;
                int count = (int) (0.5f + value);
                if (count < 1) {
                    c = 39322;
                    if (value >= 0.3f) {
                        count = 1;
                    } else {
                        throw NotFoundException.getNotFoundInstance();
                    }
                } else {
                    c = 39322;
                    if (count > 8) {
                        if (value <= 8.7f) {
                            count = 8;
                        } else {
                            throw NotFoundException.getNotFoundInstance();
                        }
                    }
                }
                int offset = i8 / 2;
                if ((i8 & 1) == 0) {
                    oddCounts[offset] = count;
                    oddRoundingErrors[offset] = value - ((float) count);
                } else {
                    evenCounts[offset] = count;
                    evenRoundingErrors[offset] = value - ((float) count);
                }
                i8++;
                i = i10;
                i2 = 1;
                char c2 = c;
                numModules = numModules2;
                BitArray bitArray3 = row;
                i3 = 2;
                i4 = 4;
            }
            adjustOddEvenCounts(numModules);
            int weightRowNumber = (((pattern.getValue() * i4) + (isOddPattern ? i : i3)) + (leftChar ^ true ? 1 : 0)) - 1;
            int oddSum = 0;
            int oddChecksumPortion = 0;
            int i11 = oddCounts.length - i2;
            while (i11 >= 0) {
                int i12 = i4;
                int numModules3 = numModules;
                if (isNotA1left(pattern, isOddPattern, leftChar)) {
                    oddChecksumPortion += oddCounts[i11] * WEIGHTS[weightRowNumber][2 * i11];
                }
                oddSum += oddCounts[i11];
                i11--;
                i4 = i12;
                numModules = numModules3;
                BitArray bitArray4 = row;
                i2 = 1;
            }
            int evenChecksumPortion = 0;
            int i13 = evenCounts.length - i2;
            while (i13 >= 0) {
                int i14 = i4;
                int numModules4 = numModules;
                if (isNotA1left(pattern, isOddPattern, leftChar)) {
                    evenChecksumPortion += evenCounts[i13] * WEIGHTS[weightRowNumber][(2 * i13) + 1];
                }
                i13--;
                i4 = i14;
                numModules = numModules4;
                BitArray bitArray5 = row;
            }
            int checksumPortion = oddChecksumPortion + evenChecksumPortion;
            if ((oddSum & 1) != 0 || oddSum > 13 || oddSum < i4) {
                throw NotFoundException.getNotFoundInstance();
            }
            int group = (13 - oddSum) / 2;
            int oddWidest = SYMBOL_WIDEST[group];
            int evenWidest = 9 - oddWidest;
            int i15 = numModules;
            int i16 = oddWidest;
            int i17 = evenWidest;
            int i18 = group;
            return new DataCharacter((RSSUtils.getRSSvalue(oddCounts, oddWidest, true) * EVEN_TOTAL_SUBSET[group]) + RSSUtils.getRSSvalue(evenCounts, evenWidest, false) + GSUM[group], checksumPortion);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static boolean isNotA1left(FinderPattern pattern, boolean isOddPattern, boolean leftChar) {
        return pattern.getValue() != 0 || !isOddPattern || !leftChar;
    }

    private void adjustOddEvenCounts(int numModules) throws NotFoundException {
        int oddSum = count(getOddCounts());
        int evenSum = count(getEvenCounts());
        int mismatch = (oddSum + evenSum) - numModules;
        boolean evenParityBad = false;
        boolean oddParityBad = (oddSum & 1) == 1;
        if ((evenSum & 1) == 0) {
            evenParityBad = true;
        }
        boolean incrementOdd = false;
        boolean decrementOdd = false;
        if (oddSum > 13) {
            decrementOdd = true;
        } else if (oddSum < 4) {
            incrementOdd = true;
        }
        boolean incrementEven = false;
        boolean decrementEven = false;
        if (evenSum > 13) {
            decrementEven = true;
        } else if (evenSum < 4) {
            incrementEven = true;
        }
        if (mismatch == 1) {
            if (oddParityBad) {
                if (!evenParityBad) {
                    decrementOdd = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (evenParityBad) {
                decrementEven = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (mismatch == -1) {
            if (oddParityBad) {
                if (!evenParityBad) {
                    incrementOdd = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (evenParityBad) {
                incrementEven = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (mismatch != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else if (oddParityBad) {
            if (!evenParityBad) {
                throw NotFoundException.getNotFoundInstance();
            } else if (oddSum < evenSum) {
                incrementOdd = true;
                decrementEven = true;
            } else {
                decrementOdd = true;
                incrementEven = true;
            }
        } else if (evenParityBad) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (incrementOdd) {
            if (!decrementOdd) {
                increment(getOddCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (decrementOdd) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (incrementEven) {
            if (!decrementEven) {
                increment(getEvenCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (decrementEven) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }
}

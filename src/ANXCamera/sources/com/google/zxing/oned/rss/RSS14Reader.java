package com.google.zxing.oned.rss;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class RSS14Reader extends AbstractRSSReader {
    private static final int[][] FINDER_PATTERNS = {new int[]{3, 8, 2, 1}, new int[]{3, 5, 5, 1}, new int[]{3, 3, 7, 1}, new int[]{3, 1, 9, 1}, new int[]{2, 7, 4, 1}, new int[]{2, 5, 6, 1}, new int[]{2, 3, 8, 1}, new int[]{1, 5, 7, 1}, new int[]{1, 3, 9, 1}};
    private static final int[] INSIDE_GSUM;
    private static final int[] INSIDE_ODD_TOTAL_SUBSET = {4, 20, 48, 81};
    private static final int[] INSIDE_ODD_WIDEST = {2, 4, 6, 8};
    private static final int[] OUTSIDE_EVEN_TOTAL_SUBSET = {1, 10, 34, 70, 126};
    private static final int[] OUTSIDE_GSUM;
    private static final int[] OUTSIDE_ODD_WIDEST = {8, 6, 4, 3, 1};
    private final List<Pair> possibleLeftPairs = new ArrayList();
    private final List<Pair> possibleRightPairs = new ArrayList();

    static {
        int[] iArr = new int[5];
        iArr[1] = 161;
        iArr[2] = 961;
        iArr[3] = 2015;
        iArr[4] = 2715;
        OUTSIDE_GSUM = iArr;
        int[] iArr2 = new int[4];
        iArr2[1] = 336;
        iArr2[2] = 1036;
        iArr2[3] = 1516;
        INSIDE_GSUM = iArr2;
    }

    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        addOrTally(this.possibleLeftPairs, decodePair(row, false, rowNumber, hints));
        row.reverse();
        addOrTally(this.possibleRightPairs, decodePair(row, true, rowNumber, hints));
        row.reverse();
        int lefSize = this.possibleLeftPairs.size();
        for (int i = 0; i < lefSize; i++) {
            Pair left = (Pair) this.possibleLeftPairs.get(i);
            if (left.getCount() > 1) {
                int rightSize = this.possibleRightPairs.size();
                for (int j = 0; j < rightSize; j++) {
                    Pair right = (Pair) this.possibleRightPairs.get(j);
                    if (right.getCount() > 1 && checkChecksum(left, right)) {
                        return constructResult(left, right);
                    }
                }
                continue;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static void addOrTally(Collection<Pair> possiblePairs, Pair pair) {
        if (pair != null) {
            boolean found = false;
            Iterator it = possiblePairs.iterator();
            while (true) {
                if (it.hasNext()) {
                    Pair other = (Pair) it.next();
                    if (other.getValue() == pair.getValue()) {
                        other.incrementCount();
                        found = true;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (!found) {
                possiblePairs.add(pair);
            }
        }
    }

    public void reset() {
        this.possibleLeftPairs.clear();
        this.possibleRightPairs.clear();
    }

    private static Result constructResult(Pair leftPair, Pair rightPair) {
        String text = String.valueOf((4537077 * ((long) leftPair.getValue())) + ((long) rightPair.getValue()));
        StringBuilder buffer = new StringBuilder(14);
        for (int i = 13 - text.length(); i > 0; i--) {
            buffer.append('0');
        }
        buffer.append(text);
        int checkDigit = 0;
        for (int i2 = 0; i2 < 13; i2++) {
            int digit = buffer.charAt(i2) - '0';
            checkDigit += (i2 & 1) == 0 ? 3 * digit : digit;
        }
        int checkDigit2 = 10 - (checkDigit % 10);
        if (checkDigit2 == 10) {
            checkDigit2 = 0;
        }
        buffer.append(checkDigit2);
        ResultPoint[] leftPoints = leftPair.getFinderPattern().getResultPoints();
        ResultPoint[] rightPoints = rightPair.getFinderPattern().getResultPoints();
        return new Result(String.valueOf(buffer.toString()), null, new ResultPoint[]{leftPoints[0], leftPoints[1], rightPoints[0], rightPoints[1]}, BarcodeFormat.RSS_14);
    }

    private static boolean checkChecksum(Pair leftPair, Pair rightPair) {
        int checkValue = (leftPair.getChecksumPortion() + (16 * rightPair.getChecksumPortion())) % 79;
        int targetCheckValue = (9 * leftPair.getFinderPattern().getValue()) + rightPair.getFinderPattern().getValue();
        if (targetCheckValue > 72) {
            targetCheckValue--;
        }
        if (targetCheckValue > 8) {
            targetCheckValue--;
        }
        return checkValue == targetCheckValue;
    }

    private Pair decodePair(BitArray row, boolean right, int rowNumber, Map<DecodeHintType, ?> hints) {
        ResultPointCallback resultPointCallback;
        try {
            int[] startEnd = findFinderPattern(row, 0, right);
            FinderPattern pattern = parseFoundFinderPattern(row, rowNumber, right, startEnd);
            if (hints == null) {
                resultPointCallback = null;
            } else {
                resultPointCallback = (ResultPointCallback) hints.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
            }
            if (resultPointCallback != null) {
                float center = ((float) (startEnd[0] + startEnd[1])) / 2.0f;
                if (right) {
                    center = ((float) (row.getSize() - 1)) - center;
                }
                resultPointCallback.foundPossibleResultPoint(new ResultPoint(center, (float) rowNumber));
            }
            DataCharacter outside = decodeDataCharacter(row, pattern, true);
            DataCharacter inside = decodeDataCharacter(row, pattern, false);
            return new Pair((1597 * outside.getValue()) + inside.getValue(), outside.getChecksumPortion() + (4 * inside.getChecksumPortion()), pattern);
        } catch (NotFoundException e) {
            return null;
        }
    }

    private DataCharacter decodeDataCharacter(BitArray row, FinderPattern pattern, boolean outsideChar) throws NotFoundException {
        BitArray bitArray = row;
        boolean z = outsideChar;
        int[] counters = getDataCharacterCounters();
        boolean z2 = false;
        counters[0] = 0;
        int i = 1;
        counters[1] = 0;
        char c = 2;
        counters[2] = 0;
        counters[3] = 0;
        counters[4] = 0;
        counters[5] = 0;
        counters[6] = 0;
        counters[7] = 0;
        if (z) {
            recordPatternInReverse(bitArray, pattern.getStartEnd()[0], counters);
        } else {
            recordPattern(bitArray, pattern.getStartEnd()[1] + 1, counters);
            int i2 = 0;
            int j = counters.length - 1;
            while (i2 < j) {
                int temp = counters[i2];
                counters[i2] = counters[j];
                counters[j] = temp;
                i2++;
                j--;
                BitArray bitArray2 = row;
                z = outsideChar;
                z2 = false;
                c = 2;
            }
        }
        int numModules = z ? 16 : 15;
        float elementWidth = ((float) count(counters)) / ((float) numModules);
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        int i3 = 0;
        while (i3 < counters.length) {
            boolean z3 = z2;
            char c2 = c;
            float value = ((float) counters[i3]) / elementWidth;
            int count = (int) (0.5f + value);
            if (count < 1) {
                count = 1;
            } else if (count > 8) {
                count = 8;
            }
            int offset = i3 / 2;
            if ((i3 & 1) == 0) {
                oddCounts[offset] = count;
                oddRoundingErrors[offset] = value - ((float) count);
            } else {
                evenCounts[offset] = count;
                evenRoundingErrors[offset] = value - ((float) count);
            }
            i3++;
            i = 1;
            BitArray bitArray3 = row;
            z = outsideChar;
            z2 = false;
            c = 2;
        }
        adjustOddEvenCounts(z, numModules);
        int oddSum = 0;
        int oddChecksumPortion = 0;
        int i4 = oddCounts.length - i;
        while (i4 >= 0) {
            char c3 = c;
            oddChecksumPortion = (oddChecksumPortion * 9) + oddCounts[i4];
            oddSum += oddCounts[i4];
            i4--;
            BitArray bitArray4 = row;
            z = outsideChar;
            i = 1;
        }
        int evenChecksumPortion = 0;
        int i5 = evenCounts.length - i;
        int evenSum = 0;
        while (i5 >= 0) {
            evenChecksumPortion = (evenChecksumPortion * 9) + evenCounts[i5];
            evenSum += evenCounts[i5];
            i5--;
            BitArray bitArray5 = row;
            z = outsideChar;
        }
        int checksumPortion = oddChecksumPortion + (3 * evenChecksumPortion);
        if (!z) {
            int evenSum2 = evenSum;
            if ((evenSum2 & 1) != 0 || evenSum2 > 10 || evenSum2 < 4) {
                throw NotFoundException.getNotFoundInstance();
            }
            int group = (10 - evenSum2) / 2;
            int oddWidest = INSIDE_ODD_WIDEST[group];
            int evenWidest = 9 - oddWidest;
            int vOdd = RSSUtils.getRSSvalue(oddCounts, oddWidest, true);
            int i6 = oddWidest;
            int oddWidest2 = RSSUtils.getRSSvalue(evenCounts, evenWidest, false);
            int i7 = group;
            int i8 = oddWidest2;
            return new DataCharacter((oddWidest2 * INSIDE_ODD_TOTAL_SUBSET[group]) + vOdd + INSIDE_GSUM[group], checksumPortion);
        } else if ((oddSum & 1) != 0 || oddSum > 12 || oddSum < 4) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            int group2 = (12 - oddSum) / 2;
            int oddWidest3 = OUTSIDE_ODD_WIDEST[group2];
            int evenWidest2 = 9 - oddWidest3;
            int vOdd2 = RSSUtils.getRSSvalue(oddCounts, oddWidest3, false);
            int i9 = evenWidest2;
            int i10 = vOdd2;
            return new DataCharacter((vOdd2 * OUTSIDE_EVEN_TOTAL_SUBSET[group2]) + RSSUtils.getRSSvalue(evenCounts, evenWidest2, true) + OUTSIDE_GSUM[group2], checksumPortion);
        }
    }

    private int[] findFinderPattern(BitArray row, int rowOffset, boolean rightFinderPattern) throws NotFoundException {
        int[] counters = getDecodeFinderCounters();
        counters[0] = 0;
        counters[1] = 0;
        counters[2] = 0;
        counters[3] = 0;
        int width = row.getSize();
        boolean isWhite = false;
        while (rowOffset < width) {
            isWhite = !row.get(rowOffset);
            if (rightFinderPattern == isWhite) {
                break;
            }
            rowOffset++;
        }
        int counterPosition = 0;
        int patternStart = rowOffset;
        for (int x = rowOffset; x < width; x++) {
            if (row.get(x) ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition != 3) {
                    counterPosition++;
                } else if (isFinderPattern(counters)) {
                    return new int[]{patternStart, x};
                } else {
                    patternStart += counters[0] + counters[1];
                    counters[0] = counters[2];
                    counters[1] = counters[3];
                    counters[2] = 0;
                    counters[3] = 0;
                    counterPosition--;
                }
                counters[counterPosition] = 1;
                isWhite = !isWhite;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private FinderPattern parseFoundFinderPattern(BitArray row, int rowNumber, boolean right, int[] startEnd) throws NotFoundException {
        int end;
        int start;
        BitArray bitArray = row;
        boolean firstIsBlack = bitArray.get(startEnd[0]);
        int firstElementStart = startEnd[0] - 1;
        while (firstElementStart >= 0 && (bitArray.get(firstElementStart) ^ firstIsBlack)) {
            firstElementStart--;
        }
        int firstElementStart2 = firstElementStart + 1;
        int firstCounter = startEnd[0] - firstElementStart2;
        int[] counters = getDecodeFinderCounters();
        System.arraycopy(counters, 0, counters, 1, counters.length - 1);
        counters[0] = firstCounter;
        int value = parseFinderValue(counters, FINDER_PATTERNS);
        int start2 = firstElementStart2;
        int end2 = startEnd[1];
        if (right) {
            end = (row.getSize() - 1) - end2;
            start = (row.getSize() - 1) - start2;
        } else {
            start = start2;
            end = end2;
        }
        FinderPattern finderPattern = new FinderPattern(value, new int[]{firstElementStart2, startEnd[1]}, start, end, rowNumber);
        return finderPattern;
    }

    private void adjustOddEvenCounts(boolean outsideChar, int numModules) throws NotFoundException {
        int oddSum = count(getOddCounts());
        int evenSum = count(getEvenCounts());
        int mismatch = (oddSum + evenSum) - numModules;
        boolean evenParityBad = false;
        boolean oddParityBad = (oddSum & true) == outsideChar;
        if ((evenSum & 1) == 1) {
            evenParityBad = true;
        }
        boolean incrementOdd = false;
        boolean decrementOdd = false;
        boolean incrementEven = false;
        boolean decrementEven = false;
        if (outsideChar) {
            if (oddSum > 12) {
                decrementOdd = true;
            } else if (oddSum < 4) {
                incrementOdd = true;
            }
            if (evenSum > 12) {
                decrementEven = true;
            } else if (evenSum < 4) {
                incrementEven = true;
            }
        } else {
            if (oddSum > 11) {
                decrementOdd = true;
            } else if (oddSum < 5) {
                incrementOdd = true;
            }
            if (evenSum > 10) {
                decrementEven = true;
            } else if (evenSum < 4) {
                incrementEven = true;
            }
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

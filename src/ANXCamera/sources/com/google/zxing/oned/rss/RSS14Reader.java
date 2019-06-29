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

    private static void addOrTally(Collection<Pair> collection, Pair pair) {
        if (pair != null) {
            boolean z = false;
            Iterator it = collection.iterator();
            while (true) {
                if (it.hasNext()) {
                    Pair pair2 = (Pair) it.next();
                    if (pair2.getValue() == pair.getValue()) {
                        pair2.incrementCount();
                        z = true;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (!z) {
                collection.add(pair);
            }
        }
    }

    private void adjustOddEvenCounts(boolean z, int i) throws NotFoundException {
        int count = count(getOddCounts());
        int count2 = count(getEvenCounts());
        int i2 = (count + count2) - i;
        boolean z2 = false;
        boolean z3 = (count & true) == z;
        if ((count2 & 1) == 1) {
            z2 = true;
        }
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        boolean z7 = false;
        if (z) {
            if (count > 12) {
                z5 = true;
            } else if (count < 4) {
                z4 = true;
            }
            if (count2 > 12) {
                z7 = true;
            } else if (count2 < 4) {
                z6 = true;
            }
        } else {
            if (count > 11) {
                z5 = true;
            } else if (count < 5) {
                z4 = true;
            }
            if (count2 > 10) {
                z7 = true;
            } else if (count2 < 4) {
                z6 = true;
            }
        }
        if (i2 == 1) {
            if (z3) {
                if (!z2) {
                    z5 = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (z2) {
                z7 = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (i2 == -1) {
            if (z3) {
                if (!z2) {
                    z4 = true;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            } else if (z2) {
                z6 = true;
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        } else if (i2 != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else if (z3) {
            if (!z2) {
                throw NotFoundException.getNotFoundInstance();
            } else if (count < count2) {
                z4 = true;
                z7 = true;
            } else {
                z5 = true;
                z6 = true;
            }
        } else if (z2) {
            throw NotFoundException.getNotFoundInstance();
        }
        if (z4) {
            if (!z5) {
                increment(getOddCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z5) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (z6) {
            if (!z7) {
                increment(getEvenCounts(), getOddRoundingErrors());
            } else {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z7) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }

    private static boolean checkChecksum(Pair pair, Pair pair2) {
        int checksumPortion = (pair.getChecksumPortion() + (16 * pair2.getChecksumPortion())) % 79;
        int value = (9 * pair.getFinderPattern().getValue()) + pair2.getFinderPattern().getValue();
        if (value > 72) {
            value--;
        }
        if (value > 8) {
            value--;
        }
        return checksumPortion == value;
    }

    private static Result constructResult(Pair pair, Pair pair2) {
        String valueOf = String.valueOf((4537077 * ((long) pair.getValue())) + ((long) pair2.getValue()));
        StringBuilder sb = new StringBuilder(14);
        for (int length = 13 - valueOf.length(); length > 0; length--) {
            sb.append('0');
        }
        sb.append(valueOf);
        int i = 0;
        for (int i2 = 0; i2 < 13; i2++) {
            int charAt = sb.charAt(i2) - '0';
            i += (i2 & 1) == 0 ? 3 * charAt : charAt;
        }
        int i3 = 10 - (i % 10);
        if (i3 == 10) {
            i3 = 0;
        }
        sb.append(i3);
        ResultPoint[] resultPoints = pair.getFinderPattern().getResultPoints();
        ResultPoint[] resultPoints2 = pair2.getFinderPattern().getResultPoints();
        return new Result(String.valueOf(sb.toString()), null, new ResultPoint[]{resultPoints[0], resultPoints[1], resultPoints2[0], resultPoints2[1]}, BarcodeFormat.RSS_14);
    }

    private DataCharacter decodeDataCharacter(BitArray bitArray, FinderPattern finderPattern, boolean z) throws NotFoundException {
        BitArray bitArray2 = bitArray;
        boolean z2 = z;
        int[] dataCharacterCounters = getDataCharacterCounters();
        boolean z3 = false;
        dataCharacterCounters[0] = 0;
        int i = 1;
        dataCharacterCounters[1] = 0;
        char c = 2;
        dataCharacterCounters[2] = 0;
        dataCharacterCounters[3] = 0;
        dataCharacterCounters[4] = 0;
        dataCharacterCounters[5] = 0;
        dataCharacterCounters[6] = 0;
        dataCharacterCounters[7] = 0;
        if (z2) {
            recordPatternInReverse(bitArray2, finderPattern.getStartEnd()[0], dataCharacterCounters);
        } else {
            recordPattern(bitArray2, finderPattern.getStartEnd()[1] + 1, dataCharacterCounters);
            int i2 = 0;
            int length = dataCharacterCounters.length - 1;
            while (i2 < length) {
                int i3 = dataCharacterCounters[i2];
                dataCharacterCounters[i2] = dataCharacterCounters[length];
                dataCharacterCounters[length] = i3;
                i2++;
                length--;
                BitArray bitArray3 = bitArray;
                z2 = z;
                z3 = false;
                c = 2;
            }
        }
        int i4 = z2 ? 16 : 15;
        float count = ((float) count(dataCharacterCounters)) / ((float) i4);
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        int i5 = 0;
        while (i5 < dataCharacterCounters.length) {
            boolean z4 = z3;
            char c2 = c;
            float f = ((float) dataCharacterCounters[i5]) / count;
            int i6 = (int) (0.5f + f);
            if (i6 < 1) {
                i6 = 1;
            } else if (i6 > 8) {
                i6 = 8;
            }
            int i7 = i5 / 2;
            if ((i5 & 1) == 0) {
                oddCounts[i7] = i6;
                oddRoundingErrors[i7] = f - ((float) i6);
            } else {
                evenCounts[i7] = i6;
                evenRoundingErrors[i7] = f - ((float) i6);
            }
            i5++;
            i = 1;
            BitArray bitArray4 = bitArray;
            z2 = z;
            z3 = false;
            c = 2;
        }
        adjustOddEvenCounts(z2, i4);
        int i8 = 0;
        int i9 = 0;
        int length2 = oddCounts.length - i;
        while (length2 >= 0) {
            char c3 = c;
            i9 = (i9 * 9) + oddCounts[length2];
            i8 += oddCounts[length2];
            length2--;
            BitArray bitArray5 = bitArray;
            z2 = z;
            i = 1;
        }
        int i10 = 0;
        int length3 = evenCounts.length - i;
        int i11 = 0;
        while (length3 >= 0) {
            i10 = (i10 * 9) + evenCounts[length3];
            i11 += evenCounts[length3];
            length3--;
            BitArray bitArray6 = bitArray;
            z2 = z;
        }
        int i12 = i9 + (3 * i10);
        if (!z2) {
            int i13 = i11;
            if ((i13 & 1) != 0 || i13 > 10 || i13 < 4) {
                throw NotFoundException.getNotFoundInstance();
            }
            int i14 = (10 - i13) / 2;
            int i15 = INSIDE_ODD_WIDEST[i14];
            int i16 = 9 - i15;
            int rSSvalue = RSSUtils.getRSSvalue(oddCounts, i15, true);
            int i17 = i15;
            int rSSvalue2 = RSSUtils.getRSSvalue(evenCounts, i16, false);
            int i18 = i14;
            int i19 = rSSvalue2;
            return new DataCharacter((rSSvalue2 * INSIDE_ODD_TOTAL_SUBSET[i14]) + rSSvalue + INSIDE_GSUM[i14], i12);
        } else if ((i8 & 1) != 0 || i8 > 12 || i8 < 4) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            int i20 = (12 - i8) / 2;
            int i21 = OUTSIDE_ODD_WIDEST[i20];
            int i22 = 9 - i21;
            int rSSvalue3 = RSSUtils.getRSSvalue(oddCounts, i21, false);
            int i23 = i22;
            int i24 = rSSvalue3;
            return new DataCharacter((rSSvalue3 * OUTSIDE_EVEN_TOTAL_SUBSET[i20]) + RSSUtils.getRSSvalue(evenCounts, i22, true) + OUTSIDE_GSUM[i20], i12);
        }
    }

    private Pair decodePair(BitArray bitArray, boolean z, int i, Map<DecodeHintType, ?> map) {
        try {
            int[] findFinderPattern = findFinderPattern(bitArray, 0, z);
            FinderPattern parseFoundFinderPattern = parseFoundFinderPattern(bitArray, i, z, findFinderPattern);
            ResultPointCallback resultPointCallback = map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
            if (resultPointCallback != null) {
                float f = ((float) (findFinderPattern[0] + findFinderPattern[1])) / 2.0f;
                if (z) {
                    f = ((float) (bitArray.getSize() - 1)) - f;
                }
                resultPointCallback.foundPossibleResultPoint(new ResultPoint(f, (float) i));
            }
            DataCharacter decodeDataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, true);
            DataCharacter decodeDataCharacter2 = decodeDataCharacter(bitArray, parseFoundFinderPattern, false);
            return new Pair((1597 * decodeDataCharacter.getValue()) + decodeDataCharacter2.getValue(), decodeDataCharacter.getChecksumPortion() + (4 * decodeDataCharacter2.getChecksumPortion()), parseFoundFinderPattern);
        } catch (NotFoundException e) {
            return null;
        }
    }

    private int[] findFinderPattern(BitArray bitArray, int i, boolean z) throws NotFoundException {
        int[] decodeFinderCounters = getDecodeFinderCounters();
        decodeFinderCounters[0] = 0;
        decodeFinderCounters[1] = 0;
        decodeFinderCounters[2] = 0;
        decodeFinderCounters[3] = 0;
        int size = bitArray.getSize();
        boolean z2 = false;
        while (i < size) {
            z2 = !bitArray.get(i);
            if (z == z2) {
                break;
            }
            i++;
        }
        int i2 = 0;
        int i3 = i;
        for (int i4 = i; i4 < size; i4++) {
            if (bitArray.get(i4) ^ z2) {
                decodeFinderCounters[i2] = decodeFinderCounters[i2] + 1;
            } else {
                if (i2 != 3) {
                    i2++;
                } else if (isFinderPattern(decodeFinderCounters)) {
                    return new int[]{i3, i4};
                } else {
                    i3 += decodeFinderCounters[0] + decodeFinderCounters[1];
                    decodeFinderCounters[0] = decodeFinderCounters[2];
                    decodeFinderCounters[1] = decodeFinderCounters[3];
                    decodeFinderCounters[2] = 0;
                    decodeFinderCounters[3] = 0;
                    i2--;
                }
                decodeFinderCounters[i2] = 1;
                z2 = !z2;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private FinderPattern parseFoundFinderPattern(BitArray bitArray, int i, boolean z, int[] iArr) throws NotFoundException {
        int i2;
        int i3;
        BitArray bitArray2 = bitArray;
        boolean z2 = bitArray2.get(iArr[0]);
        int i4 = iArr[0] - 1;
        while (i4 >= 0 && (bitArray2.get(i4) ^ z2)) {
            i4--;
        }
        int i5 = i4 + 1;
        int i6 = iArr[0] - i5;
        int[] decodeFinderCounters = getDecodeFinderCounters();
        System.arraycopy(decodeFinderCounters, 0, decodeFinderCounters, 1, decodeFinderCounters.length - 1);
        decodeFinderCounters[0] = i6;
        int parseFinderValue = parseFinderValue(decodeFinderCounters, FINDER_PATTERNS);
        int i7 = i5;
        int i8 = iArr[1];
        if (z) {
            i2 = (bitArray.getSize() - 1) - i8;
            i3 = (bitArray.getSize() - 1) - i7;
        } else {
            i3 = i7;
            i2 = i8;
        }
        FinderPattern finderPattern = new FinderPattern(parseFinderValue, new int[]{i5, iArr[1]}, i3, i2, i);
        return finderPattern;
    }

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException {
        addOrTally(this.possibleLeftPairs, decodePair(bitArray, false, i, map));
        bitArray.reverse();
        addOrTally(this.possibleRightPairs, decodePair(bitArray, true, i, map));
        bitArray.reverse();
        int size = this.possibleLeftPairs.size();
        for (int i2 = 0; i2 < size; i2++) {
            Pair pair = (Pair) this.possibleLeftPairs.get(i2);
            if (pair.getCount() > 1) {
                int size2 = this.possibleRightPairs.size();
                for (int i3 = 0; i3 < size2; i3++) {
                    Pair pair2 = (Pair) this.possibleRightPairs.get(i3);
                    if (pair2.getCount() > 1 && checkChecksum(pair, pair2)) {
                        return constructResult(pair, pair2);
                    }
                }
                continue;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public void reset() {
        this.possibleLeftPairs.clear();
        this.possibleRightPairs.clear();
    }
}

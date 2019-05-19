package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

public class FinderPatternFinder {
    private static final int CENTER_QUORUM = 2;
    protected static final int MAX_MODULES = 57;
    protected static final int MIN_SKIP = 3;
    private final int[] crossCheckStateCount;
    private boolean hasSkipped;
    private final BitMatrix image;
    private final List<FinderPattern> possibleCenters;
    private final ResultPointCallback resultPointCallback;

    private static final class CenterComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private CenterComparator(float f) {
            this.average = f;
        }

        /* synthetic */ CenterComparator(float f, CenterComparator centerComparator) {
            this(f);
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            if (center2.getCount() != center1.getCount()) {
                return center2.getCount() - center1.getCount();
            }
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            int i = dA < dB ? 1 : dA == dB ? 0 : -1;
            return i;
        }
    }

    private static final class FurthestFromAverageComparator implements Comparator<FinderPattern>, Serializable {
        private final float average;

        private FurthestFromAverageComparator(float f) {
            this.average = f;
        }

        /* synthetic */ FurthestFromAverageComparator(float f, FurthestFromAverageComparator furthestFromAverageComparator) {
            this(f);
        }

        public int compare(FinderPattern center1, FinderPattern center2) {
            float dA = Math.abs(center2.getEstimatedModuleSize() - this.average);
            float dB = Math.abs(center1.getEstimatedModuleSize() - this.average);
            if (dA < dB) {
                return -1;
            }
            return dA == dB ? 0 : 1;
        }
    }

    public FinderPatternFinder(BitMatrix image2) {
        this(image2, null);
    }

    public FinderPatternFinder(BitMatrix image2, ResultPointCallback resultPointCallback2) {
        this.image = image2;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback2;
    }

    /* access modifiers changed from: protected */
    public final BitMatrix getImage() {
        return this.image;
    }

    /* access modifiers changed from: protected */
    public final List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    /* access modifiers changed from: 0000 */
    public final FinderPatternInfo find(Map<DecodeHintType, ?> hints) throws NotFoundException {
        int iSkip;
        int i;
        int j;
        int iSkip2;
        char c;
        int i2;
        int currentState;
        Map<DecodeHintType, ?> map = hints;
        int i3 = 1;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = map != null && map.containsKey(DecodeHintType.PURE_BARCODE);
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        char c2 = 3;
        int iSkip3 = (3 * maxI) / 228;
        if (iSkip3 < 3 || tryHarder) {
            iSkip3 = 3;
        }
        boolean done = false;
        int[] stateCount = new int[5];
        int i4 = iSkip - 1;
        while (i < maxI && !done) {
            stateCount[0] = 0;
            stateCount[i3] = 0;
            stateCount[2] = 0;
            stateCount[c2] = 0;
            int i5 = 4;
            stateCount[4] = 0;
            int currentState2 = 0;
            boolean z = done;
            int iSkip4 = iSkip;
            int j2 = 0;
            boolean done2 = z;
            while (j < maxJ) {
                if (this.image.get(j, i)) {
                    if ((currentState2 & 1) == i3) {
                        currentState2++;
                    }
                    stateCount[currentState2] = stateCount[currentState2] + i3;
                    i2 = i3;
                    currentState = i5;
                    c = 3;
                } else if ((currentState2 & 1) != 0) {
                    i2 = i3;
                    currentState = i5;
                    c = 3;
                    stateCount[currentState2] = stateCount[currentState2] + 1;
                } else if (currentState2 != i5) {
                    i2 = i3;
                    currentState = i5;
                    c = 3;
                    currentState2++;
                    stateCount[currentState2] = stateCount[currentState2] + 1;
                } else if (foundPatternCross(stateCount)) {
                    if (handlePossibleCenter(stateCount, i, j, pureBarcode)) {
                        iSkip4 = 2;
                        if (this.hasSkipped) {
                            done2 = haveMultiplyConfirmedCenters();
                        } else {
                            int rowSkip = findRowSkip();
                            if (rowSkip > stateCount[2]) {
                                i += (rowSkip - stateCount[2]) - 2;
                                j = maxJ - 1;
                            }
                        }
                        stateCount[0] = 0;
                        stateCount[1] = 0;
                        stateCount[2] = 0;
                        c = 3;
                        stateCount[3] = 0;
                        stateCount[4] = 0;
                        currentState2 = 0;
                        currentState = 4;
                    } else {
                        int i6 = i5;
                        c = 3;
                        stateCount[0] = stateCount[2];
                        stateCount[1] = stateCount[3];
                        stateCount[2] = stateCount[i6];
                        stateCount[3] = 1;
                        stateCount[i6] = 0;
                        currentState2 = 3;
                        currentState = 4;
                    }
                    i2 = 1;
                } else {
                    c = 3;
                    stateCount[0] = stateCount[2];
                    i2 = 1;
                    stateCount[1] = stateCount[3];
                    currentState = 4;
                    stateCount[2] = stateCount[4];
                    stateCount[3] = 1;
                    stateCount[4] = 0;
                    currentState2 = 3;
                }
                j2 = j + i2;
                char c3 = c;
                i5 = currentState;
                i3 = i2;
                c2 = c3;
            }
            if (foundPatternCross(stateCount) != 0 && handlePossibleCenter(stateCount, i, maxJ, pureBarcode)) {
                iSkip2 = stateCount[0];
                if (this.hasSkipped) {
                    int i7 = iSkip2;
                    done = haveMultiplyConfirmedCenters();
                    iSkip = i7;
                    i4 = i + iSkip;
                }
            }
            iSkip = iSkip2;
            done = done2;
            i4 = i + iSkip;
        }
        FinderPattern[] patternInfo = selectBestPatterns();
        ResultPoint.orderBestPatterns(patternInfo);
        return new FinderPatternInfo(patternInfo);
    }

    private static float centerFromEnd(int[] stateCount, int end) {
        return ((float) ((end - stateCount[4]) - stateCount[3])) - (((float) stateCount[2]) / 2.0f);
    }

    protected static boolean foundPatternCross(int[] stateCount) {
        int totalModuleSize = 0;
        for (int i = 0; i < 5; i++) {
            int count = stateCount[i];
            if (count == 0) {
                return false;
            }
            totalModuleSize += count;
        }
        if (totalModuleSize < 7) {
            return false;
        }
        float moduleSize = ((float) totalModuleSize) / 7.0f;
        float maxVariance = moduleSize / 2.0f;
        if (Math.abs(moduleSize - ((float) stateCount[0])) >= maxVariance || Math.abs(moduleSize - ((float) stateCount[1])) >= maxVariance || Math.abs((3.0f * moduleSize) - ((float) stateCount[2])) >= 3.0f * maxVariance || Math.abs(moduleSize - ((float) stateCount[3])) >= maxVariance || Math.abs(moduleSize - ((float) stateCount[4])) >= maxVariance) {
            return false;
        }
        return true;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    private boolean crossCheckDiagonal(int startI, int centerJ, int maxCount, int originalStateCountTotal) {
        int i = startI;
        int i2 = centerJ;
        int i3 = maxCount;
        int[] stateCount = getCrossCheckStateCount();
        int i4 = 0;
        while (i >= i4 && i2 >= i4 && this.image.get(i2 - i4, i - i4)) {
            stateCount[2] = stateCount[2] + 1;
            i4++;
        }
        if (i < i4 || i2 < i4) {
            return false;
        }
        while (i >= i4 && i2 >= i4 && !this.image.get(i2 - i4, i - i4) && stateCount[1] <= i3) {
            stateCount[1] = stateCount[1] + 1;
            i4++;
        }
        if (i < i4 || i2 < i4 || stateCount[1] > i3) {
            return false;
        }
        while (i >= i4 && i2 >= i4 && this.image.get(i2 - i4, i - i4) && stateCount[0] <= i3) {
            stateCount[0] = stateCount[0] + 1;
            i4++;
        }
        if (stateCount[0] > i3) {
            return false;
        }
        int maxI = this.image.getHeight();
        int maxJ = this.image.getWidth();
        int i5 = 1;
        while (i + i5 < maxI && i2 + i5 < maxJ && this.image.get(i2 + i5, i + i5)) {
            stateCount[2] = stateCount[2] + 1;
            i5++;
        }
        if (i + i5 >= maxI || i2 + i5 >= maxJ) {
            return false;
        }
        while (i + i5 < maxI && i2 + i5 < maxJ && !this.image.get(i2 + i5, i + i5) && stateCount[3] < i3) {
            stateCount[3] = stateCount[3] + 1;
            i5++;
        }
        if (i + i5 >= maxI || i2 + i5 >= maxJ || stateCount[3] >= i3) {
            return false;
        }
        while (i + i5 < maxI && i2 + i5 < maxJ && this.image.get(i2 + i5, i + i5) && stateCount[4] < i3) {
            stateCount[4] = stateCount[4] + 1;
            i5++;
        }
        if (stateCount[4] < i3 && Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) < 2 * originalStateCountTotal && foundPatternCross(stateCount)) {
            return true;
        }
        return false;
    }

    private float crossCheckVertical(int startI, int centerJ, int maxCount, int originalStateCountTotal) {
        BitMatrix image2 = this.image;
        int maxI = image2.getHeight();
        int[] stateCount = getCrossCheckStateCount();
        int i = startI;
        while (i >= 0 && image2.get(centerJ, i)) {
            stateCount[2] = stateCount[2] + 1;
            i--;
        }
        float f = Float.NaN;
        if (i < 0) {
            return Float.NaN;
        }
        while (i >= 0 && !image2.get(centerJ, i) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            i--;
        }
        if (i < 0 || stateCount[1] > maxCount) {
            return Float.NaN;
        }
        while (i >= 0 && image2.get(centerJ, i) && stateCount[0] <= maxCount) {
            stateCount[0] = stateCount[0] + 1;
            i--;
        }
        if (stateCount[0] > maxCount) {
            return Float.NaN;
        }
        int i2 = startI + 1;
        while (i2 < maxI && image2.get(centerJ, i2)) {
            stateCount[2] = stateCount[2] + 1;
            i2++;
        }
        if (i2 == maxI) {
            return Float.NaN;
        }
        while (i2 < maxI && !image2.get(centerJ, i2) && stateCount[3] < maxCount) {
            stateCount[3] = stateCount[3] + 1;
            i2++;
        }
        if (i2 == maxI || stateCount[3] >= maxCount) {
            return Float.NaN;
        }
        while (i2 < maxI && image2.get(centerJ, i2) && stateCount[4] < maxCount) {
            stateCount[4] = stateCount[4] + 1;
            i2++;
        }
        if (stateCount[4] >= maxCount || 5 * Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) >= 2 * originalStateCountTotal) {
            return Float.NaN;
        }
        if (foundPatternCross(stateCount)) {
            f = centerFromEnd(stateCount, i2);
        }
        return f;
    }

    private float crossCheckHorizontal(int startJ, int centerI, int maxCount, int originalStateCountTotal) {
        BitMatrix image2 = this.image;
        int maxJ = image2.getWidth();
        int[] stateCount = getCrossCheckStateCount();
        int j = startJ;
        while (j >= 0 && image2.get(j, centerI)) {
            stateCount[2] = stateCount[2] + 1;
            j--;
        }
        float f = Float.NaN;
        if (j < 0) {
            return Float.NaN;
        }
        while (j >= 0 && !image2.get(j, centerI) && stateCount[1] <= maxCount) {
            stateCount[1] = stateCount[1] + 1;
            j--;
        }
        if (j < 0 || stateCount[1] > maxCount) {
            return Float.NaN;
        }
        while (j >= 0 && image2.get(j, centerI) && stateCount[0] <= maxCount) {
            stateCount[0] = stateCount[0] + 1;
            j--;
        }
        if (stateCount[0] > maxCount) {
            return Float.NaN;
        }
        int j2 = startJ + 1;
        while (j2 < maxJ && image2.get(j2, centerI)) {
            stateCount[2] = stateCount[2] + 1;
            j2++;
        }
        if (j2 == maxJ) {
            return Float.NaN;
        }
        while (j2 < maxJ && !image2.get(j2, centerI) && stateCount[3] < maxCount) {
            stateCount[3] = stateCount[3] + 1;
            j2++;
        }
        if (j2 == maxJ || stateCount[3] >= maxCount) {
            return Float.NaN;
        }
        while (j2 < maxJ && image2.get(j2, centerI) && stateCount[4] < maxCount) {
            stateCount[4] = stateCount[4] + 1;
            j2++;
        }
        if (stateCount[4] >= maxCount || 5 * Math.abs(((((stateCount[0] + stateCount[1]) + stateCount[2]) + stateCount[3]) + stateCount[4]) - originalStateCountTotal) >= originalStateCountTotal) {
            return Float.NaN;
        }
        if (foundPatternCross(stateCount)) {
            f = centerFromEnd(stateCount, j2);
        }
        return f;
    }

    /* access modifiers changed from: protected */
    public final boolean handlePossibleCenter(int[] stateCount, int i, int j, boolean pureBarcode) {
        int stateCountTotal = stateCount[0] + stateCount[1] + stateCount[2] + stateCount[3] + stateCount[4];
        float centerJ = centerFromEnd(stateCount, j);
        float centerI = crossCheckVertical(i, (int) centerJ, stateCount[2], stateCountTotal);
        if (!Float.isNaN(centerI)) {
            float centerJ2 = crossCheckHorizontal((int) centerJ, (int) centerI, stateCount[2], stateCountTotal);
            if (!Float.isNaN(centerJ2) && (!pureBarcode || crossCheckDiagonal((int) centerI, (int) centerJ2, stateCount[2], stateCountTotal))) {
                float estimatedModuleSize = ((float) stateCountTotal) / 7.0f;
                boolean found = false;
                int index = 0;
                while (true) {
                    if (index >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern center = (FinderPattern) this.possibleCenters.get(index);
                    if (center.aboutEquals(estimatedModuleSize, centerI, centerJ2)) {
                        this.possibleCenters.set(index, center.combineEstimate(centerI, centerJ2, estimatedModuleSize));
                        found = true;
                        break;
                    }
                    index++;
                }
                if (!found) {
                    FinderPattern point = new FinderPattern(centerJ2, centerI, estimatedModuleSize);
                    this.possibleCenters.add(point);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(point);
                    }
                }
                return true;
            }
        }
        return false;
    }

    private int findRowSkip() {
        if (this.possibleCenters.size() <= 1) {
            return 0;
        }
        FinderPattern finderPattern = null;
        for (FinderPattern center : this.possibleCenters) {
            if (center.getCount() >= 2) {
                if (finderPattern == null) {
                    finderPattern = center;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(finderPattern.getX() - center.getX()) - Math.abs(finderPattern.getY() - center.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    private boolean haveMultiplyConfirmedCenters() {
        int confirmedCount = 0;
        float totalModuleSize = 0.0f;
        int max = this.possibleCenters.size();
        for (FinderPattern pattern : this.possibleCenters) {
            if (pattern.getCount() >= 2) {
                confirmedCount++;
                totalModuleSize += pattern.getEstimatedModuleSize();
            }
        }
        boolean z = false;
        if (confirmedCount < 3) {
            return false;
        }
        float average = totalModuleSize / ((float) max);
        float totalDeviation = 0.0f;
        for (FinderPattern pattern2 : this.possibleCenters) {
            totalDeviation += Math.abs(pattern2.getEstimatedModuleSize() - average);
        }
        if (totalDeviation <= 0.05f * totalModuleSize) {
            z = true;
        }
        return z;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int startSize = this.possibleCenters.size();
        if (startSize >= 3) {
            if (startSize > 3) {
                float totalModuleSize = 0.0f;
                float square = 0.0f;
                for (FinderPattern center : this.possibleCenters) {
                    float size = center.getEstimatedModuleSize();
                    totalModuleSize += size;
                    square += size * size;
                }
                float average = totalModuleSize / ((float) startSize);
                float stdDev = (float) Math.sqrt((double) ((square / ((float) startSize)) - (average * average)));
                Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(average, null));
                float limit = Math.max(0.2f * average, stdDev);
                int i = 0;
                while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                    if (Math.abs(((FinderPattern) this.possibleCenters.get(i)).getEstimatedModuleSize() - average) > limit) {
                        this.possibleCenters.remove(i);
                        i--;
                    }
                    i++;
                }
            }
            if (this.possibleCenters.size() > 3) {
                float totalModuleSize2 = 0.0f;
                for (FinderPattern possibleCenter : this.possibleCenters) {
                    totalModuleSize2 += possibleCenter.getEstimatedModuleSize();
                }
                Collections.sort(this.possibleCenters, new CenterComparator(totalModuleSize2 / ((float) this.possibleCenters.size()), null));
                this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
            }
            return new FinderPattern[]{(FinderPattern) this.possibleCenters.get(0), (FinderPattern) this.possibleCenters.get(1), (FinderPattern) this.possibleCenters.get(2)};
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

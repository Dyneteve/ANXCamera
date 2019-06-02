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

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            if (finderPattern2.getCount() != finderPattern.getCount()) {
                return finderPattern2.getCount() - finderPattern.getCount();
            }
            float abs = Math.abs(finderPattern2.getEstimatedModuleSize() - this.average);
            float abs2 = Math.abs(finderPattern.getEstimatedModuleSize() - this.average);
            int i = abs < abs2 ? 1 : abs == abs2 ? 0 : -1;
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

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            float abs = Math.abs(finderPattern2.getEstimatedModuleSize() - this.average);
            float abs2 = Math.abs(finderPattern.getEstimatedModuleSize() - this.average);
            if (abs < abs2) {
                return -1;
            }
            return abs == abs2 ? 0 : 1;
        }
    }

    public FinderPatternFinder(BitMatrix bitMatrix) {
        this(bitMatrix, null);
    }

    public FinderPatternFinder(BitMatrix bitMatrix, ResultPointCallback resultPointCallback2) {
        this.image = bitMatrix;
        this.possibleCenters = new ArrayList();
        this.crossCheckStateCount = new int[5];
        this.resultPointCallback = resultPointCallback2;
    }

    private static float centerFromEnd(int[] iArr, int i) {
        return ((float) ((i - iArr[4]) - iArr[3])) - (((float) iArr[2]) / 2.0f);
    }

    private boolean crossCheckDiagonal(int i, int i2, int i3, int i4) {
        int i5 = i;
        int i6 = i2;
        int i7 = i3;
        int[] crossCheckStateCount2 = getCrossCheckStateCount();
        int i8 = 0;
        while (i5 >= i8 && i6 >= i8 && this.image.get(i6 - i8, i5 - i8)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i8++;
        }
        if (i5 < i8 || i6 < i8) {
            return false;
        }
        while (i5 >= i8 && i6 >= i8 && !this.image.get(i6 - i8, i5 - i8) && crossCheckStateCount2[1] <= i7) {
            crossCheckStateCount2[1] = crossCheckStateCount2[1] + 1;
            i8++;
        }
        if (i5 < i8 || i6 < i8 || crossCheckStateCount2[1] > i7) {
            return false;
        }
        while (i5 >= i8 && i6 >= i8 && this.image.get(i6 - i8, i5 - i8) && crossCheckStateCount2[0] <= i7) {
            crossCheckStateCount2[0] = crossCheckStateCount2[0] + 1;
            i8++;
        }
        if (crossCheckStateCount2[0] > i7) {
            return false;
        }
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int i9 = 1;
        while (i5 + i9 < height && i6 + i9 < width && this.image.get(i6 + i9, i5 + i9)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i9++;
        }
        if (i5 + i9 >= height || i6 + i9 >= width) {
            return false;
        }
        while (i5 + i9 < height && i6 + i9 < width && !this.image.get(i6 + i9, i5 + i9) && crossCheckStateCount2[3] < i7) {
            crossCheckStateCount2[3] = crossCheckStateCount2[3] + 1;
            i9++;
        }
        if (i5 + i9 >= height || i6 + i9 >= width || crossCheckStateCount2[3] >= i7) {
            return false;
        }
        while (i5 + i9 < height && i6 + i9 < width && this.image.get(i6 + i9, i5 + i9) && crossCheckStateCount2[4] < i7) {
            crossCheckStateCount2[4] = crossCheckStateCount2[4] + 1;
            i9++;
        }
        return crossCheckStateCount2[4] < i7 && Math.abs(((((crossCheckStateCount2[0] + crossCheckStateCount2[1]) + crossCheckStateCount2[2]) + crossCheckStateCount2[3]) + crossCheckStateCount2[4]) - i4) < 2 * i4 && foundPatternCross(crossCheckStateCount2);
    }

    private float crossCheckHorizontal(int i, int i2, int i3, int i4) {
        BitMatrix bitMatrix = this.image;
        int width = bitMatrix.getWidth();
        int[] crossCheckStateCount2 = getCrossCheckStateCount();
        int i5 = i;
        while (i5 >= 0 && bitMatrix.get(i5, i2)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i5--;
        }
        float f = Float.NaN;
        if (i5 < 0) {
            return Float.NaN;
        }
        while (i5 >= 0 && !bitMatrix.get(i5, i2) && crossCheckStateCount2[1] <= i3) {
            crossCheckStateCount2[1] = crossCheckStateCount2[1] + 1;
            i5--;
        }
        if (i5 < 0 || crossCheckStateCount2[1] > i3) {
            return Float.NaN;
        }
        while (i5 >= 0 && bitMatrix.get(i5, i2) && crossCheckStateCount2[0] <= i3) {
            crossCheckStateCount2[0] = crossCheckStateCount2[0] + 1;
            i5--;
        }
        if (crossCheckStateCount2[0] > i3) {
            return Float.NaN;
        }
        int i6 = i + 1;
        while (i6 < width && bitMatrix.get(i6, i2)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i6++;
        }
        if (i6 == width) {
            return Float.NaN;
        }
        while (i6 < width && !bitMatrix.get(i6, i2) && crossCheckStateCount2[3] < i3) {
            crossCheckStateCount2[3] = crossCheckStateCount2[3] + 1;
            i6++;
        }
        if (i6 == width || crossCheckStateCount2[3] >= i3) {
            return Float.NaN;
        }
        while (i6 < width && bitMatrix.get(i6, i2) && crossCheckStateCount2[4] < i3) {
            crossCheckStateCount2[4] = crossCheckStateCount2[4] + 1;
            i6++;
        }
        if (crossCheckStateCount2[4] >= i3 || 5 * Math.abs(((((crossCheckStateCount2[0] + crossCheckStateCount2[1]) + crossCheckStateCount2[2]) + crossCheckStateCount2[3]) + crossCheckStateCount2[4]) - i4) >= i4) {
            return Float.NaN;
        }
        if (foundPatternCross(crossCheckStateCount2)) {
            f = centerFromEnd(crossCheckStateCount2, i6);
        }
        return f;
    }

    private float crossCheckVertical(int i, int i2, int i3, int i4) {
        BitMatrix bitMatrix = this.image;
        int height = bitMatrix.getHeight();
        int[] crossCheckStateCount2 = getCrossCheckStateCount();
        int i5 = i;
        while (i5 >= 0 && bitMatrix.get(i2, i5)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i5--;
        }
        float f = Float.NaN;
        if (i5 < 0) {
            return Float.NaN;
        }
        while (i5 >= 0 && !bitMatrix.get(i2, i5) && crossCheckStateCount2[1] <= i3) {
            crossCheckStateCount2[1] = crossCheckStateCount2[1] + 1;
            i5--;
        }
        if (i5 < 0 || crossCheckStateCount2[1] > i3) {
            return Float.NaN;
        }
        while (i5 >= 0 && bitMatrix.get(i2, i5) && crossCheckStateCount2[0] <= i3) {
            crossCheckStateCount2[0] = crossCheckStateCount2[0] + 1;
            i5--;
        }
        if (crossCheckStateCount2[0] > i3) {
            return Float.NaN;
        }
        int i6 = i + 1;
        while (i6 < height && bitMatrix.get(i2, i6)) {
            crossCheckStateCount2[2] = crossCheckStateCount2[2] + 1;
            i6++;
        }
        if (i6 == height) {
            return Float.NaN;
        }
        while (i6 < height && !bitMatrix.get(i2, i6) && crossCheckStateCount2[3] < i3) {
            crossCheckStateCount2[3] = crossCheckStateCount2[3] + 1;
            i6++;
        }
        if (i6 == height || crossCheckStateCount2[3] >= i3) {
            return Float.NaN;
        }
        while (i6 < height && bitMatrix.get(i2, i6) && crossCheckStateCount2[4] < i3) {
            crossCheckStateCount2[4] = crossCheckStateCount2[4] + 1;
            i6++;
        }
        if (crossCheckStateCount2[4] >= i3 || 5 * Math.abs(((((crossCheckStateCount2[0] + crossCheckStateCount2[1]) + crossCheckStateCount2[2]) + crossCheckStateCount2[3]) + crossCheckStateCount2[4]) - i4) >= 2 * i4) {
            return Float.NaN;
        }
        if (foundPatternCross(crossCheckStateCount2)) {
            f = centerFromEnd(crossCheckStateCount2, i6);
        }
        return f;
    }

    private int findRowSkip() {
        if (this.possibleCenters.size() <= 1) {
            return 0;
        }
        FinderPattern finderPattern = null;
        for (FinderPattern finderPattern2 : this.possibleCenters) {
            if (finderPattern2.getCount() >= 2) {
                if (finderPattern == null) {
                    finderPattern = finderPattern2;
                } else {
                    this.hasSkipped = true;
                    return ((int) (Math.abs(finderPattern.getX() - finderPattern2.getX()) - Math.abs(finderPattern.getY() - finderPattern2.getY()))) / 2;
                }
            }
        }
        return 0;
    }

    protected static boolean foundPatternCross(int[] iArr) {
        int i = 0;
        for (int i2 = 0; i2 < 5; i2++) {
            int i3 = iArr[i2];
            if (i3 == 0) {
                return false;
            }
            i += i3;
        }
        if (i < 7) {
            return false;
        }
        float f = ((float) i) / 7.0f;
        float f2 = f / 2.0f;
        return Math.abs(f - ((float) iArr[0])) < f2 && Math.abs(f - ((float) iArr[1])) < f2 && Math.abs((3.0f * f) - ((float) iArr[2])) < 3.0f * f2 && Math.abs(f - ((float) iArr[3])) < f2 && Math.abs(f - ((float) iArr[4])) < f2;
    }

    private int[] getCrossCheckStateCount() {
        this.crossCheckStateCount[0] = 0;
        this.crossCheckStateCount[1] = 0;
        this.crossCheckStateCount[2] = 0;
        this.crossCheckStateCount[3] = 0;
        this.crossCheckStateCount[4] = 0;
        return this.crossCheckStateCount;
    }

    private boolean haveMultiplyConfirmedCenters() {
        int i = 0;
        float f = 0.0f;
        int size = this.possibleCenters.size();
        for (FinderPattern finderPattern : this.possibleCenters) {
            if (finderPattern.getCount() >= 2) {
                i++;
                f += finderPattern.getEstimatedModuleSize();
            }
        }
        boolean z = false;
        if (i < 3) {
            return false;
        }
        float f2 = f / ((float) size);
        float f3 = 0.0f;
        for (FinderPattern estimatedModuleSize : this.possibleCenters) {
            f3 += Math.abs(estimatedModuleSize.getEstimatedModuleSize() - f2);
        }
        if (f3 <= 0.05f * f) {
            z = true;
        }
        return z;
    }

    private FinderPattern[] selectBestPatterns() throws NotFoundException {
        int size = this.possibleCenters.size();
        if (size >= 3) {
            if (size > 3) {
                float f = 0.0f;
                float f2 = 0.0f;
                for (FinderPattern estimatedModuleSize : this.possibleCenters) {
                    float estimatedModuleSize2 = estimatedModuleSize.getEstimatedModuleSize();
                    f += estimatedModuleSize2;
                    f2 += estimatedModuleSize2 * estimatedModuleSize2;
                }
                float f3 = f / ((float) size);
                float sqrt = (float) Math.sqrt((double) ((f2 / ((float) size)) - (f3 * f3)));
                Collections.sort(this.possibleCenters, new FurthestFromAverageComparator(f3, null));
                float max = Math.max(0.2f * f3, sqrt);
                int i = 0;
                while (i < this.possibleCenters.size() && this.possibleCenters.size() > 3) {
                    if (Math.abs(((FinderPattern) this.possibleCenters.get(i)).getEstimatedModuleSize() - f3) > max) {
                        this.possibleCenters.remove(i);
                        i--;
                    }
                    i++;
                }
            }
            if (this.possibleCenters.size() > 3) {
                float f4 = 0.0f;
                for (FinderPattern estimatedModuleSize3 : this.possibleCenters) {
                    f4 += estimatedModuleSize3.getEstimatedModuleSize();
                }
                Collections.sort(this.possibleCenters, new CenterComparator(f4 / ((float) this.possibleCenters.size()), null));
                this.possibleCenters.subList(3, this.possibleCenters.size()).clear();
            }
            return new FinderPattern[]{(FinderPattern) this.possibleCenters.get(0), (FinderPattern) this.possibleCenters.get(1), (FinderPattern) this.possibleCenters.get(2)};
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* access modifiers changed from: 0000 */
    public final FinderPatternInfo find(Map<DecodeHintType, ?> map) throws NotFoundException {
        int i;
        int i2;
        int i3;
        int i4;
        char c;
        int i5;
        int i6;
        Map<DecodeHintType, ?> map2 = map;
        int i7 = 1;
        boolean z = map2 != null && map2.containsKey(DecodeHintType.TRY_HARDER);
        boolean z2 = map2 != null && map2.containsKey(DecodeHintType.PURE_BARCODE);
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        char c2 = 3;
        int i8 = (3 * height) / 228;
        if (i8 < 3 || z) {
            i8 = 3;
        }
        boolean z3 = false;
        int[] iArr = new int[5];
        int i9 = i - 1;
        while (i2 < height && !z3) {
            iArr[0] = 0;
            iArr[i7] = 0;
            iArr[2] = 0;
            iArr[c2] = 0;
            int i10 = 4;
            iArr[4] = 0;
            int i11 = 0;
            boolean z4 = z3;
            int i12 = i;
            int i13 = 0;
            boolean z5 = z4;
            while (i3 < width) {
                if (this.image.get(i3, i2)) {
                    if ((i11 & 1) == i7) {
                        i11++;
                    }
                    iArr[i11] = iArr[i11] + i7;
                    i5 = i7;
                    i6 = i10;
                    c = 3;
                } else if ((i11 & 1) != 0) {
                    i5 = i7;
                    i6 = i10;
                    c = 3;
                    iArr[i11] = iArr[i11] + 1;
                } else if (i11 != i10) {
                    i5 = i7;
                    i6 = i10;
                    c = 3;
                    i11++;
                    iArr[i11] = iArr[i11] + 1;
                } else if (foundPatternCross(iArr)) {
                    if (handlePossibleCenter(iArr, i2, i3, z2)) {
                        i12 = 2;
                        if (this.hasSkipped) {
                            z5 = haveMultiplyConfirmedCenters();
                        } else {
                            int findRowSkip = findRowSkip();
                            if (findRowSkip > iArr[2]) {
                                i2 += (findRowSkip - iArr[2]) - 2;
                                i3 = width - 1;
                            }
                        }
                        iArr[0] = 0;
                        iArr[1] = 0;
                        iArr[2] = 0;
                        c = 3;
                        iArr[3] = 0;
                        iArr[4] = 0;
                        i11 = 0;
                        i6 = 4;
                    } else {
                        int i14 = i10;
                        c = 3;
                        iArr[0] = iArr[2];
                        iArr[1] = iArr[3];
                        iArr[2] = iArr[i14];
                        iArr[3] = 1;
                        iArr[i14] = 0;
                        i11 = 3;
                        i6 = 4;
                    }
                    i5 = 1;
                } else {
                    c = 3;
                    iArr[0] = iArr[2];
                    i5 = 1;
                    iArr[1] = iArr[3];
                    i6 = 4;
                    iArr[2] = iArr[4];
                    iArr[3] = 1;
                    iArr[4] = 0;
                    i11 = 3;
                }
                i13 = i3 + i5;
                char c3 = c;
                i10 = i6;
                i7 = i5;
                c2 = c3;
            }
            if (foundPatternCross(iArr) && handlePossibleCenter(iArr, i2, width, z2)) {
                i4 = iArr[0];
                if (this.hasSkipped) {
                    int i15 = i4;
                    z3 = haveMultiplyConfirmedCenters();
                    i = i15;
                    i9 = i2 + i;
                }
            }
            i = i4;
            z3 = z5;
            i9 = i2 + i;
        }
        FinderPattern[] selectBestPatterns = selectBestPatterns();
        ResultPoint.orderBestPatterns(selectBestPatterns);
        return new FinderPatternInfo(selectBestPatterns);
    }

    /* access modifiers changed from: protected */
    public final BitMatrix getImage() {
        return this.image;
    }

    /* access modifiers changed from: protected */
    public final List<FinderPattern> getPossibleCenters() {
        return this.possibleCenters;
    }

    /* access modifiers changed from: protected */
    public final boolean handlePossibleCenter(int[] iArr, int i, int i2, boolean z) {
        int i3 = iArr[0] + iArr[1] + iArr[2] + iArr[3] + iArr[4];
        float centerFromEnd = centerFromEnd(iArr, i2);
        float crossCheckVertical = crossCheckVertical(i, (int) centerFromEnd, iArr[2], i3);
        if (!Float.isNaN(crossCheckVertical)) {
            float crossCheckHorizontal = crossCheckHorizontal((int) centerFromEnd, (int) crossCheckVertical, iArr[2], i3);
            if (!Float.isNaN(crossCheckHorizontal) && (!z || crossCheckDiagonal((int) crossCheckVertical, (int) crossCheckHorizontal, iArr[2], i3))) {
                float f = ((float) i3) / 7.0f;
                boolean z2 = false;
                int i4 = 0;
                while (true) {
                    if (i4 >= this.possibleCenters.size()) {
                        break;
                    }
                    FinderPattern finderPattern = (FinderPattern) this.possibleCenters.get(i4);
                    if (finderPattern.aboutEquals(f, crossCheckVertical, crossCheckHorizontal)) {
                        this.possibleCenters.set(i4, finderPattern.combineEstimate(crossCheckVertical, crossCheckHorizontal, f));
                        z2 = true;
                        break;
                    }
                    i4++;
                }
                if (!z2) {
                    FinderPattern finderPattern2 = new FinderPattern(crossCheckHorizontal, crossCheckVertical, f);
                    this.possibleCenters.add(finderPattern2);
                    if (this.resultPointCallback != null) {
                        this.resultPointCallback.foundPossibleResultPoint(finderPattern2);
                    }
                }
                return true;
            }
        }
        return false;
    }
}

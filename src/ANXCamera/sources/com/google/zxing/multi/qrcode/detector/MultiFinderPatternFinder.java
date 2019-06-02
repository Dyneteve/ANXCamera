package com.google.zxing.multi.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.detector.FinderPattern;
import com.google.zxing.qrcode.detector.FinderPatternFinder;
import com.google.zxing.qrcode.detector.FinderPatternInfo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

final class MultiFinderPatternFinder extends FinderPatternFinder {
    private static final float DIFF_MODSIZE_CUTOFF = 0.5f;
    private static final float DIFF_MODSIZE_CUTOFF_PERCENT = 0.05f;
    private static final FinderPatternInfo[] EMPTY_RESULT_ARRAY = new FinderPatternInfo[0];
    private static final float MAX_MODULE_COUNT_PER_EDGE = 180.0f;
    private static final float MIN_MODULE_COUNT_PER_EDGE = 9.0f;

    private static final class ModuleSizeComparator implements Comparator<FinderPattern>, Serializable {
        private ModuleSizeComparator() {
        }

        /* synthetic */ ModuleSizeComparator(ModuleSizeComparator moduleSizeComparator) {
            this();
        }

        public int compare(FinderPattern finderPattern, FinderPattern finderPattern2) {
            float estimatedModuleSize = finderPattern2.getEstimatedModuleSize() - finderPattern.getEstimatedModuleSize();
            if (((double) estimatedModuleSize) < 0.0d) {
                return -1;
            }
            return ((double) estimatedModuleSize) > 0.0d ? 1 : 0;
        }
    }

    MultiFinderPatternFinder(BitMatrix bitMatrix) {
        super(bitMatrix);
    }

    MultiFinderPatternFinder(BitMatrix bitMatrix, ResultPointCallback resultPointCallback) {
        super(bitMatrix, resultPointCallback);
    }

    private FinderPattern[][] selectMutipleBestPatterns() throws NotFoundException {
        int i;
        List list;
        boolean z;
        boolean z2;
        char c;
        List possibleCenters = getPossibleCenters();
        int size = possibleCenters.size();
        int i2 = 3;
        if (size >= 3) {
            boolean z3 = false;
            boolean z4 = true;
            if (size == 3) {
                return new FinderPattern[][]{new FinderPattern[]{(FinderPattern) possibleCenters.get(0), (FinderPattern) possibleCenters.get(1), (FinderPattern) possibleCenters.get(2)}};
            }
            Collections.sort(possibleCenters, new ModuleSizeComparator(null));
            ArrayList arrayList = new ArrayList();
            for (int i3 = 0; i3 < size - 2; i3++) {
                FinderPattern finderPattern = (FinderPattern) possibleCenters.get(i3);
                if (finderPattern != null) {
                    int i4 = i3 + 1;
                    while (i4 < size - 1) {
                        FinderPattern finderPattern2 = (FinderPattern) possibleCenters.get(i4);
                        if (finderPattern2 != null) {
                            float estimatedModuleSize = (finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) / Math.min(finderPattern.getEstimatedModuleSize(), finderPattern2.getEstimatedModuleSize());
                            float f = 0.5f;
                            int i5 = (Math.abs(finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) > 0.5f ? 1 : (Math.abs(finderPattern.getEstimatedModuleSize() - finderPattern2.getEstimatedModuleSize()) == 0.5f ? 0 : -1));
                            float f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            if (i5 > 0 && estimatedModuleSize >= DIFF_MODSIZE_CUTOFF_PERCENT) {
                                break;
                            }
                            int i6 = i4 + 1;
                            while (i6 < size) {
                                FinderPattern finderPattern3 = (FinderPattern) possibleCenters.get(i6);
                                if (finderPattern3 != null) {
                                    float estimatedModuleSize2 = (finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) / Math.min(finderPattern2.getEstimatedModuleSize(), finderPattern3.getEstimatedModuleSize());
                                    if (Math.abs(finderPattern2.getEstimatedModuleSize() - finderPattern3.getEstimatedModuleSize()) > f && estimatedModuleSize2 >= f2) {
                                        break;
                                    }
                                    FinderPattern[] finderPatternArr = new FinderPattern[i2];
                                    z2 = false;
                                    finderPatternArr[0] = finderPattern;
                                    z = true;
                                    finderPatternArr[1] = finderPattern2;
                                    c = 2;
                                    finderPatternArr[2] = finderPattern3;
                                    ResultPoint.orderBestPatterns(finderPatternArr);
                                    FinderPatternInfo finderPatternInfo = new FinderPatternInfo(finderPatternArr);
                                    float distance = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getBottomLeft());
                                    list = possibleCenters;
                                    float distance2 = ResultPoint.distance(finderPatternInfo.getTopRight(), finderPatternInfo.getBottomLeft());
                                    i = size;
                                    float distance3 = ResultPoint.distance(finderPatternInfo.getTopLeft(), finderPatternInfo.getTopRight());
                                    float estimatedModuleSize3 = (distance + distance3) / (finderPattern.getEstimatedModuleSize() * 2.0f);
                                    if (estimatedModuleSize3 <= MAX_MODULE_COUNT_PER_EDGE && estimatedModuleSize3 >= 9.0f) {
                                        FinderPatternInfo finderPatternInfo2 = finderPatternInfo;
                                        float abs = Math.abs((distance - distance3) / Math.min(distance, distance3));
                                        if (abs < 0.1f) {
                                            float f3 = distance3;
                                            float f4 = abs;
                                            float sqrt = (float) Math.sqrt((double) ((distance * distance) + (distance3 * distance3)));
                                            if (Math.abs((distance2 - sqrt) / Math.min(distance2, sqrt)) < 0.1f) {
                                                arrayList.add(finderPatternArr);
                                            }
                                        }
                                    }
                                } else {
                                    list = possibleCenters;
                                    i = size;
                                    z2 = z3;
                                    z = z4;
                                    c = 2;
                                }
                                i6++;
                                char c2 = c;
                                z3 = z2;
                                z4 = z;
                                possibleCenters = list;
                                size = i;
                                i2 = 3;
                                f = 0.5f;
                                f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            }
                        }
                        i4++;
                        z3 = false;
                        z4 = true;
                    }
                }
            }
            if (!arrayList.isEmpty()) {
                return (FinderPattern[][]) arrayList.toArray(new FinderPattern[arrayList.size()][]);
            }
            throw NotFoundException.getNotFoundInstance();
        }
        List list2 = possibleCenters;
        int i7 = size;
        throw NotFoundException.getNotFoundInstance();
    }

    public FinderPatternInfo[] findMulti(Map<DecodeHintType, ?> map) throws NotFoundException {
        Map<DecodeHintType, ?> map2 = map;
        boolean z = map2 != null && map2.containsKey(DecodeHintType.TRY_HARDER);
        boolean z2 = map2 != null && map2.containsKey(DecodeHintType.PURE_BARCODE);
        BitMatrix image = getImage();
        int height = image.getHeight();
        int width = image.getWidth();
        int i = (int) ((((float) height) / 228.0f) * 3.0f);
        char c = 3;
        if (i < 3 || z) {
            i = 3;
        }
        int[] iArr = new int[5];
        int i2 = i - 1;
        while (i2 < height) {
            iArr[0] = 0;
            iArr[1] = 0;
            iArr[2] = 0;
            iArr[c] = 0;
            iArr[4] = 0;
            int i3 = 0;
            int i4 = 0;
            while (i4 < width) {
                if (image.get(i4, i2)) {
                    if ((i3 & 1) == 1) {
                        i3++;
                    }
                    iArr[i3] = iArr[i3] + 1;
                } else if ((i3 & 1) != 0) {
                    iArr[i3] = iArr[i3] + 1;
                } else if (i3 != 4) {
                    i3++;
                    iArr[i3] = iArr[i3] + 1;
                } else if (!foundPatternCross(iArr) || !handlePossibleCenter(iArr, i2, i4, z2)) {
                    iArr[0] = iArr[2];
                    iArr[1] = iArr[3];
                    iArr[2] = iArr[4];
                    iArr[3] = 1;
                    iArr[4] = 0;
                    i3 = 3;
                } else {
                    i3 = 0;
                    iArr[0] = 0;
                    iArr[1] = 0;
                    iArr[2] = 0;
                    iArr[3] = 0;
                    iArr[4] = 0;
                }
                i4++;
            }
            if (foundPatternCross(iArr)) {
                handlePossibleCenter(iArr, i2, width, z2);
            }
            i2 += i;
            c = 3;
        }
        FinderPattern[][] selectMutipleBestPatterns = selectMutipleBestPatterns();
        ArrayList arrayList = new ArrayList();
        for (FinderPattern[] finderPatternArr : selectMutipleBestPatterns) {
            ResultPoint.orderBestPatterns(finderPatternArr);
            arrayList.add(new FinderPatternInfo(finderPatternArr));
        }
        return arrayList.isEmpty() ? EMPTY_RESULT_ARRAY : (FinderPatternInfo[]) arrayList.toArray(new FinderPatternInfo[arrayList.size()]);
    }
}

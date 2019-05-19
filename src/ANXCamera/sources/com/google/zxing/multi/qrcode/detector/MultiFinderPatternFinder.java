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

        public int compare(FinderPattern center1, FinderPattern center2) {
            float value = center2.getEstimatedModuleSize() - center1.getEstimatedModuleSize();
            if (((double) value) < 0.0d) {
                return -1;
            }
            return ((double) value) > 0.0d ? 1 : 0;
        }
    }

    MultiFinderPatternFinder(BitMatrix image) {
        super(image);
    }

    MultiFinderPatternFinder(BitMatrix image, ResultPointCallback resultPointCallback) {
        super(image, resultPointCallback);
    }

    private FinderPattern[][] selectMutipleBestPatterns() throws NotFoundException {
        int size;
        List list;
        boolean z;
        boolean z2;
        char c;
        List possibleCenters = getPossibleCenters();
        int size2 = possibleCenters.size();
        int i = 3;
        if (size2 >= 3) {
            boolean z3 = false;
            boolean z4 = true;
            if (size2 == 3) {
                return new FinderPattern[][]{new FinderPattern[]{(FinderPattern) possibleCenters.get(0), (FinderPattern) possibleCenters.get(1), (FinderPattern) possibleCenters.get(2)}};
            }
            Collections.sort(possibleCenters, new ModuleSizeComparator(null));
            List<FinderPattern[]> results = new ArrayList<>();
            for (int i1 = 0; i1 < size2 - 2; i1++) {
                FinderPattern p1 = (FinderPattern) possibleCenters.get(i1);
                if (p1 != null) {
                    int i2 = i1 + 1;
                    while (i2 < size2 - 1) {
                        FinderPattern p2 = (FinderPattern) possibleCenters.get(i2);
                        if (p2 != null) {
                            float vModSize12 = (p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) / Math.min(p1.getEstimatedModuleSize(), p2.getEstimatedModuleSize());
                            float f = 0.5f;
                            int i3 = (Math.abs(p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) > 0.5f ? 1 : (Math.abs(p1.getEstimatedModuleSize() - p2.getEstimatedModuleSize()) == 0.5f ? 0 : -1));
                            float f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            if (i3 > 0 && vModSize12 >= DIFF_MODSIZE_CUTOFF_PERCENT) {
                                break;
                            }
                            int i32 = i2 + 1;
                            while (i32 < size2) {
                                FinderPattern p3 = (FinderPattern) possibleCenters.get(i32);
                                if (p3 != null) {
                                    float vModSize23 = (p2.getEstimatedModuleSize() - p3.getEstimatedModuleSize()) / Math.min(p2.getEstimatedModuleSize(), p3.getEstimatedModuleSize());
                                    if (Math.abs(p2.getEstimatedModuleSize() - p3.getEstimatedModuleSize()) > f && vModSize23 >= f2) {
                                        break;
                                    }
                                    FinderPattern[] test = new FinderPattern[i];
                                    z2 = false;
                                    test[0] = p1;
                                    z = true;
                                    test[1] = p2;
                                    c = 2;
                                    test[2] = p3;
                                    ResultPoint.orderBestPatterns(test);
                                    FinderPatternInfo info = new FinderPatternInfo(test);
                                    float dA = ResultPoint.distance(info.getTopLeft(), info.getBottomLeft());
                                    list = possibleCenters;
                                    float dC = ResultPoint.distance(info.getTopRight(), info.getBottomLeft());
                                    size = size2;
                                    float dB = ResultPoint.distance(info.getTopLeft(), info.getTopRight());
                                    float estimatedModuleCount = (dA + dB) / (p1.getEstimatedModuleSize() * 2.0f);
                                    if (estimatedModuleCount <= MAX_MODULE_COUNT_PER_EDGE && estimatedModuleCount >= 9.0f) {
                                        FinderPatternInfo finderPatternInfo = info;
                                        float vABBC = Math.abs((dA - dB) / Math.min(dA, dB));
                                        if (vABBC < 0.1f) {
                                            float f3 = dB;
                                            float f4 = vABBC;
                                            float dCpy = (float) Math.sqrt((double) ((dA * dA) + (dB * dB)));
                                            if (Math.abs((dC - dCpy) / Math.min(dC, dCpy)) < 0.1f) {
                                                results.add(test);
                                            }
                                        }
                                    }
                                } else {
                                    list = possibleCenters;
                                    size = size2;
                                    z2 = z3;
                                    z = z4;
                                    c = 2;
                                }
                                i32++;
                                char c2 = c;
                                z3 = z2;
                                z4 = z;
                                possibleCenters = list;
                                size2 = size;
                                i = 3;
                                f = 0.5f;
                                f2 = DIFF_MODSIZE_CUTOFF_PERCENT;
                            }
                        }
                        i2++;
                        z3 = false;
                        z4 = true;
                    }
                }
            }
            if (!results.isEmpty()) {
                return (FinderPattern[][]) results.toArray(new FinderPattern[results.size()][]);
            }
            throw NotFoundException.getNotFoundInstance();
        }
        List list2 = possibleCenters;
        int i4 = size2;
        throw NotFoundException.getNotFoundInstance();
    }

    public FinderPatternInfo[] findMulti(Map<DecodeHintType, ?> hints) throws NotFoundException {
        Map<DecodeHintType, ?> map = hints;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        boolean pureBarcode = map != null && map.containsKey(DecodeHintType.PURE_BARCODE);
        BitMatrix image = getImage();
        int maxI = image.getHeight();
        int maxJ = image.getWidth();
        int iSkip = (int) ((((float) maxI) / 228.0f) * 3.0f);
        char c = 3;
        if (iSkip < 3 || tryHarder) {
            iSkip = 3;
        }
        int[] stateCount = new int[5];
        int i = iSkip - 1;
        while (i < maxI) {
            stateCount[0] = 0;
            stateCount[1] = 0;
            stateCount[2] = 0;
            stateCount[c] = 0;
            stateCount[4] = 0;
            int currentState = 0;
            int j = 0;
            while (j < maxJ) {
                if (image.get(j, i)) {
                    if ((currentState & 1) == 1) {
                        currentState++;
                    }
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if ((currentState & 1) != 0) {
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if (currentState != 4) {
                    currentState++;
                    stateCount[currentState] = stateCount[currentState] + 1;
                } else if (!foundPatternCross(stateCount) || !handlePossibleCenter(stateCount, i, j, pureBarcode)) {
                    stateCount[0] = stateCount[2];
                    stateCount[1] = stateCount[3];
                    stateCount[2] = stateCount[4];
                    stateCount[3] = 1;
                    stateCount[4] = 0;
                    currentState = 3;
                } else {
                    currentState = 0;
                    stateCount[0] = 0;
                    stateCount[1] = 0;
                    stateCount[2] = 0;
                    stateCount[3] = 0;
                    stateCount[4] = 0;
                }
                j++;
            }
            if (foundPatternCross(stateCount)) {
                handlePossibleCenter(stateCount, i, maxJ, pureBarcode);
            }
            i += iSkip;
            c = 3;
        }
        FinderPattern[][] patternInfo = selectMutipleBestPatterns();
        List<FinderPatternInfo> result = new ArrayList<>();
        for (FinderPattern[] pattern : patternInfo) {
            ResultPoint.orderBestPatterns(pattern);
            result.add(new FinderPatternInfo(pattern));
        }
        if (result.isEmpty()) {
            return EMPTY_RESULT_ARRAY;
        }
        return (FinderPatternInfo[]) result.toArray(new FinderPatternInfo[result.size()]);
    }
}

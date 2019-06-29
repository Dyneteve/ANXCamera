package com.google.zxing.datamatrix.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.detector.MathUtils;
import com.google.zxing.common.detector.WhiteRectangleDetector;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public final class Detector {
    private final BitMatrix image;
    private final WhiteRectangleDetector rectangleDetector;

    private static final class ResultPointsAndTransitions {
        private final ResultPoint from;
        private final ResultPoint to;
        private final int transitions;

        private ResultPointsAndTransitions(ResultPoint resultPoint, ResultPoint resultPoint2, int i) {
            this.from = resultPoint;
            this.to = resultPoint2;
            this.transitions = i;
        }

        /* synthetic */ ResultPointsAndTransitions(ResultPoint resultPoint, ResultPoint resultPoint2, int i, ResultPointsAndTransitions resultPointsAndTransitions) {
            this(resultPoint, resultPoint2, i);
        }

        /* access modifiers changed from: 0000 */
        public ResultPoint getFrom() {
            return this.from;
        }

        /* access modifiers changed from: 0000 */
        public ResultPoint getTo() {
            return this.to;
        }

        public int getTransitions() {
            return this.transitions;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.from);
            sb.append("/");
            sb.append(this.to);
            sb.append('/');
            sb.append(this.transitions);
            return sb.toString();
        }
    }

    private static final class ResultPointsAndTransitionsComparator implements Comparator<ResultPointsAndTransitions>, Serializable {
        private ResultPointsAndTransitionsComparator() {
        }

        /* synthetic */ ResultPointsAndTransitionsComparator(ResultPointsAndTransitionsComparator resultPointsAndTransitionsComparator) {
            this();
        }

        public int compare(ResultPointsAndTransitions resultPointsAndTransitions, ResultPointsAndTransitions resultPointsAndTransitions2) {
            return resultPointsAndTransitions.getTransitions() - resultPointsAndTransitions2.getTransitions();
        }
    }

    public Detector(BitMatrix bitMatrix) throws NotFoundException {
        this.image = bitMatrix;
        this.rectangleDetector = new WhiteRectangleDetector(bitMatrix);
    }

    private ResultPoint correctTopRight(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i) {
        float distance = ((float) distance(resultPoint, resultPoint2)) / ((float) i);
        int distance2 = distance(resultPoint3, resultPoint4);
        ResultPoint resultPoint5 = new ResultPoint(resultPoint4.getX() + (distance * ((resultPoint4.getX() - resultPoint3.getX()) / ((float) distance2))), resultPoint4.getY() + (distance * ((resultPoint4.getY() - resultPoint3.getY()) / ((float) distance2))));
        float distance3 = ((float) distance(resultPoint, resultPoint3)) / ((float) i);
        int distance4 = distance(resultPoint2, resultPoint4);
        ResultPoint resultPoint6 = new ResultPoint(resultPoint4.getX() + (distance3 * ((resultPoint4.getX() - resultPoint2.getX()) / ((float) distance4))), resultPoint4.getY() + (distance3 * ((resultPoint4.getY() - resultPoint2.getY()) / ((float) distance4))));
        if (!isValid(resultPoint5)) {
            if (isValid(resultPoint6)) {
                return resultPoint6;
            }
            return null;
        } else if (!isValid(resultPoint6)) {
            return resultPoint5;
        } else {
            return Math.abs(transitionsBetween(resultPoint3, resultPoint5).getTransitions() - transitionsBetween(resultPoint2, resultPoint5).getTransitions()) <= Math.abs(transitionsBetween(resultPoint3, resultPoint6).getTransitions() - transitionsBetween(resultPoint2, resultPoint6).getTransitions()) ? resultPoint5 : resultPoint6;
        }
    }

    private ResultPoint correctTopRightRectangular(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i, int i2) {
        float distance = ((float) distance(resultPoint, resultPoint2)) / ((float) i);
        int distance2 = distance(resultPoint3, resultPoint4);
        ResultPoint resultPoint5 = new ResultPoint(resultPoint4.getX() + (distance * ((resultPoint4.getX() - resultPoint3.getX()) / ((float) distance2))), resultPoint4.getY() + (distance * ((resultPoint4.getY() - resultPoint3.getY()) / ((float) distance2))));
        float distance3 = ((float) distance(resultPoint, resultPoint3)) / ((float) i2);
        int distance4 = distance(resultPoint2, resultPoint4);
        ResultPoint resultPoint6 = new ResultPoint(resultPoint4.getX() + (distance3 * ((resultPoint4.getX() - resultPoint2.getX()) / ((float) distance4))), resultPoint4.getY() + (distance3 * ((resultPoint4.getY() - resultPoint2.getY()) / ((float) distance4))));
        if (isValid(resultPoint5)) {
            return (isValid(resultPoint6) && Math.abs(i - transitionsBetween(resultPoint3, resultPoint5).getTransitions()) + Math.abs(i2 - transitionsBetween(resultPoint2, resultPoint5).getTransitions()) > Math.abs(i - transitionsBetween(resultPoint3, resultPoint6).getTransitions()) + Math.abs(i2 - transitionsBetween(resultPoint2, resultPoint6).getTransitions())) ? resultPoint6 : resultPoint5;
        }
        if (isValid(resultPoint6)) {
            return resultPoint6;
        }
        return null;
    }

    private static int distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        return MathUtils.round(ResultPoint.distance(resultPoint, resultPoint2));
    }

    private static void increment(Map<ResultPoint, Integer> map, ResultPoint resultPoint) {
        Integer num = (Integer) map.get(resultPoint);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        map.put(resultPoint, Integer.valueOf(i));
    }

    private boolean isValid(ResultPoint resultPoint) {
        return resultPoint.getX() >= 0.0f && resultPoint.getX() < ((float) this.image.getWidth()) && resultPoint.getY() > 0.0f && resultPoint.getY() < ((float) this.image.getHeight());
    }

    private static BitMatrix sampleGrid(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i, int i2) throws NotFoundException {
        int i3 = i;
        int i4 = i2;
        return GridSampler.getInstance().sampleGrid(bitMatrix, i3, i4, 0.5f, 0.5f, ((float) i3) - 0.5f, 0.5f, ((float) i3) - 0.5f, ((float) i4) - 0.5f, 0.5f, ((float) i4) - 0.5f, resultPoint.getX(), resultPoint.getY(), resultPoint4.getX(), resultPoint4.getY(), resultPoint3.getX(), resultPoint3.getY(), resultPoint2.getX(), resultPoint2.getY());
    }

    private ResultPointsAndTransitions transitionsBetween(ResultPoint resultPoint, ResultPoint resultPoint2) {
        int i;
        int i2;
        Detector detector = this;
        int x = (int) resultPoint.getX();
        int y = (int) resultPoint.getY();
        int x2 = (int) resultPoint2.getX();
        int y2 = (int) resultPoint2.getY();
        int i3 = 1;
        boolean z = Math.abs(y2 - y) > Math.abs(x2 - x);
        if (z) {
            int i4 = x;
            x = y;
            y = i4;
            int i5 = x2;
            x2 = y2;
            y2 = i5;
        }
        int abs = Math.abs(x2 - x);
        int abs2 = Math.abs(y2 - y);
        int i6 = (-abs) / 2;
        int i7 = y < y2 ? 1 : -1;
        if (x >= x2) {
            i3 = -1;
        }
        int i8 = 0;
        boolean z2 = detector.image.get(z ? y : x, z ? x : y);
        int i9 = x;
        int i10 = y;
        while (true) {
            if (i9 == x2) {
                int i11 = x;
                break;
            }
            BitMatrix bitMatrix = detector.image;
            int i12 = z ? i10 : i9;
            if (z) {
                i = x;
                i2 = i9;
            } else {
                i = x;
                i2 = i10;
            }
            boolean z3 = bitMatrix.get(i12, i2);
            if (z3 != z2) {
                i8++;
                z2 = z3;
            }
            i6 += abs2;
            if (i6 <= 0) {
                ResultPoint resultPoint3 = resultPoint;
            } else if (i10 == y2) {
                break;
            } else {
                ResultPoint resultPoint4 = resultPoint;
                i10 += i7;
                i6 -= abs;
            }
            i9 += i3;
            x = i;
            detector = this;
        }
        return new ResultPointsAndTransitions(resultPoint, resultPoint2, i8, null);
    }

    public DetectorResult detect() throws NotFoundException {
        ResultPoint resultPoint;
        BitMatrix bitMatrix;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        ResultPoint[] detect = this.rectangleDetector.detect();
        char c = 0;
        ResultPoint resultPoint4 = detect[0];
        ResultPoint resultPoint5 = detect[1];
        char c2 = 2;
        ResultPoint resultPoint6 = detect[2];
        int i = 3;
        ResultPoint resultPoint7 = detect[3];
        ArrayList arrayList = new ArrayList(4);
        arrayList.add(transitionsBetween(resultPoint4, resultPoint5));
        arrayList.add(transitionsBetween(resultPoint4, resultPoint6));
        arrayList.add(transitionsBetween(resultPoint5, resultPoint7));
        arrayList.add(transitionsBetween(resultPoint6, resultPoint7));
        Collections.sort(arrayList, new ResultPointsAndTransitionsComparator(null));
        ResultPointsAndTransitions resultPointsAndTransitions = (ResultPointsAndTransitions) arrayList.get(0);
        ResultPointsAndTransitions resultPointsAndTransitions2 = (ResultPointsAndTransitions) arrayList.get(1);
        HashMap hashMap = new HashMap();
        increment(hashMap, resultPointsAndTransitions.getFrom());
        increment(hashMap, resultPointsAndTransitions.getTo());
        increment(hashMap, resultPointsAndTransitions2.getFrom());
        increment(hashMap, resultPointsAndTransitions2.getTo());
        ResultPoint resultPoint8 = null;
        ResultPoint resultPoint9 = null;
        ResultPoint resultPoint10 = null;
        for (Entry entry : hashMap.entrySet()) {
            HashMap hashMap2 = hashMap;
            ResultPointsAndTransitions resultPointsAndTransitions3 = resultPointsAndTransitions2;
            ResultPointsAndTransitions resultPointsAndTransitions4 = resultPointsAndTransitions;
            ArrayList arrayList2 = arrayList;
            ResultPoint resultPoint11 = resultPoint7;
            ResultPoint[] resultPointArr = detect;
            char c3 = c;
            int i2 = i;
            ResultPoint resultPoint12 = (ResultPoint) entry.getKey();
            if (((Integer) entry.getValue()).intValue() == 2) {
                resultPoint10 = resultPoint12;
            } else if (resultPoint9 == null) {
                resultPoint9 = resultPoint12;
            } else {
                resultPoint8 = resultPoint12;
            }
            c2 = 2;
            i = i2;
            hashMap = hashMap2;
            resultPointsAndTransitions2 = resultPointsAndTransitions3;
            resultPointsAndTransitions = resultPointsAndTransitions4;
            arrayList = arrayList2;
            detect = resultPointArr;
            c = c3;
            resultPoint7 = resultPoint11;
        }
        if (resultPoint9 == null || resultPoint10 == null || resultPoint8 == null) {
            HashMap hashMap3 = hashMap;
            ResultPointsAndTransitions resultPointsAndTransitions5 = resultPointsAndTransitions2;
            ResultPointsAndTransitions resultPointsAndTransitions6 = resultPointsAndTransitions;
            ArrayList arrayList3 = arrayList;
            ResultPoint resultPoint13 = resultPoint7;
            ResultPoint[] resultPointArr2 = detect;
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint[] resultPointArr3 = new ResultPoint[i];
        resultPointArr3[c] = resultPoint9;
        resultPointArr3[1] = resultPoint10;
        resultPointArr3[c2] = resultPoint8;
        ResultPoint.orderBestPatterns(resultPointArr3);
        ResultPoint resultPoint14 = resultPointArr3[c];
        ResultPoint resultPoint15 = resultPointArr3[1];
        ResultPoint resultPoint16 = resultPointArr3[c2];
        ResultPoint resultPoint17 = !hashMap.containsKey(resultPoint4) ? resultPoint4 : !hashMap.containsKey(resultPoint5) ? resultPoint5 : !hashMap.containsKey(resultPoint6) ? resultPoint6 : resultPoint7;
        ResultPoint resultPoint18 = resultPoint17;
        int transitions = transitionsBetween(resultPoint16, resultPoint18).getTransitions();
        int transitions2 = transitionsBetween(resultPoint14, resultPoint18).getTransitions();
        ResultPoint resultPoint19 = resultPoint16;
        HashMap hashMap4 = hashMap;
        if ((transitions & 1) == 1) {
            transitions++;
        }
        int i3 = transitions + 2;
        if ((transitions2 & 1) == 1) {
            transitions2++;
        }
        int i4 = transitions2 + 2;
        ResultPointsAndTransitions resultPointsAndTransitions7 = resultPointsAndTransitions2;
        if (4 * i3 >= 7 * i4) {
            ResultPointsAndTransitions resultPointsAndTransitions8 = resultPointsAndTransitions;
            ResultPoint[] resultPointArr4 = detect;
            ResultPoint[] resultPointArr5 = resultPointArr3;
            resultPoint3 = resultPoint19;
            HashMap hashMap5 = hashMap4;
            ResultPointsAndTransitions resultPointsAndTransitions9 = resultPointsAndTransitions7;
            ArrayList arrayList4 = arrayList;
        } else if (4 * i4 >= 7 * i3) {
            ResultPointsAndTransitions resultPointsAndTransitions10 = resultPointsAndTransitions;
            ResultPoint[] resultPointArr6 = detect;
            ResultPoint[] resultPointArr7 = resultPointArr3;
            resultPoint3 = resultPoint19;
            HashMap hashMap6 = hashMap4;
            ResultPointsAndTransitions resultPointsAndTransitions11 = resultPointsAndTransitions7;
            ArrayList arrayList5 = arrayList;
        } else {
            ResultPoint resultPoint20 = resultPoint19;
            HashMap hashMap7 = hashMap4;
            ResultPoint resultPoint21 = resultPoint20;
            ResultPointsAndTransitions resultPointsAndTransitions12 = resultPointsAndTransitions7;
            ResultPointsAndTransitions resultPointsAndTransitions13 = resultPointsAndTransitions;
            ArrayList arrayList6 = arrayList;
            ResultPoint[] resultPointArr8 = detect;
            ResultPoint[] resultPointArr9 = resultPointArr3;
            resultPoint2 = correctTopRight(resultPoint15, resultPoint14, resultPoint21, resultPoint18, Math.min(i4, i3));
            if (resultPoint2 == null) {
                resultPoint2 = resultPoint18;
            }
            ResultPoint resultPoint22 = resultPoint21;
            int max = Math.max(transitionsBetween(resultPoint22, resultPoint2).getTransitions(), transitionsBetween(resultPoint14, resultPoint2).getTransitions()) + 1;
            if ((max & 1) == 1) {
                max++;
            }
            bitMatrix = sampleGrid(this.image, resultPoint22, resultPoint15, resultPoint14, resultPoint2, max, max);
            resultPoint = resultPoint22;
            ResultPoint resultPoint23 = resultPoint7;
            int i5 = i4;
            return new DetectorResult(bitMatrix, new ResultPoint[]{resultPoint, resultPoint15, resultPoint14, resultPoint2});
        }
        resultPoint = resultPoint3;
        ResultPoint resultPoint24 = resultPoint7;
        ResultPoint correctTopRightRectangular = correctTopRightRectangular(resultPoint15, resultPoint14, resultPoint3, resultPoint18, i3, i4);
        if (correctTopRightRectangular == null) {
            correctTopRightRectangular = resultPoint18;
        }
        int transitions3 = transitionsBetween(resultPoint, resultPoint2).getTransitions();
        int transitions4 = transitionsBetween(resultPoint14, resultPoint2).getTransitions();
        if ((transitions3 & 1) == 1) {
            transitions3++;
        }
        if ((transitions4 & 1) == 1) {
            transitions4++;
        }
        int i6 = transitions3;
        bitMatrix = sampleGrid(this.image, resultPoint, resultPoint15, resultPoint14, resultPoint2, transitions3, transitions4);
        return new DetectorResult(bitMatrix, new ResultPoint[]{resultPoint, resultPoint15, resultPoint14, resultPoint2});
    }
}

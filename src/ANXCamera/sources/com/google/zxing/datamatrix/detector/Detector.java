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

        private ResultPointsAndTransitions(ResultPoint from2, ResultPoint to2, int transitions2) {
            this.from = from2;
            this.to = to2;
            this.transitions = transitions2;
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

        public int compare(ResultPointsAndTransitions o1, ResultPointsAndTransitions o2) {
            return o1.getTransitions() - o2.getTransitions();
        }
    }

    public Detector(BitMatrix image2) throws NotFoundException {
        this.image = image2;
        this.rectangleDetector = new WhiteRectangleDetector(image2);
    }

    public DetectorResult detect() throws NotFoundException {
        ResultPoint topRight;
        ResultPoint topLeft;
        BitMatrix bits;
        ResultPoint correctedTopRight;
        ResultPoint topLeft2;
        ResultPoint[] cornerPoints = this.rectangleDetector.detect();
        char c = 0;
        ResultPoint pointA = cornerPoints[0];
        ResultPoint pointB = cornerPoints[1];
        char c2 = 2;
        ResultPoint pointC = cornerPoints[2];
        int i = 3;
        ResultPoint pointD = cornerPoints[3];
        ArrayList arrayList = new ArrayList(4);
        arrayList.add(transitionsBetween(pointA, pointB));
        arrayList.add(transitionsBetween(pointA, pointC));
        arrayList.add(transitionsBetween(pointB, pointD));
        arrayList.add(transitionsBetween(pointC, pointD));
        Collections.sort(arrayList, new ResultPointsAndTransitionsComparator(null));
        ResultPointsAndTransitions lSideOne = (ResultPointsAndTransitions) arrayList.get(0);
        ResultPointsAndTransitions lSideTwo = (ResultPointsAndTransitions) arrayList.get(1);
        Map<ResultPoint, Integer> hashMap = new HashMap<>();
        increment(hashMap, lSideOne.getFrom());
        increment(hashMap, lSideOne.getTo());
        increment(hashMap, lSideTwo.getFrom());
        increment(hashMap, lSideTwo.getTo());
        ResultPoint maybeBottomRight = null;
        ResultPoint bottomLeft = null;
        ResultPoint bottomLeft2 = null;
        for (Entry<ResultPoint, Integer> entry : hashMap.entrySet()) {
            HashMap hashMap2 = hashMap;
            ResultPointsAndTransitions resultPointsAndTransitions = lSideTwo;
            ResultPointsAndTransitions resultPointsAndTransitions2 = lSideOne;
            ArrayList arrayList2 = arrayList;
            ResultPoint resultPoint = pointD;
            ResultPoint[] resultPointArr = cornerPoints;
            char c3 = c;
            int i2 = i;
            ResultPoint point = (ResultPoint) entry.getKey();
            if (((Integer) entry.getValue()).intValue() == 2) {
                bottomLeft2 = point;
            } else if (bottomLeft == null) {
                bottomLeft = point;
            } else {
                maybeBottomRight = point;
            }
            c2 = 2;
            i = i2;
            hashMap = hashMap2;
            lSideTwo = resultPointsAndTransitions;
            lSideOne = resultPointsAndTransitions2;
            arrayList = arrayList2;
            cornerPoints = resultPointArr;
            c = c3;
            pointD = resultPoint;
        }
        if (bottomLeft == null || bottomLeft2 == null || maybeBottomRight == null) {
            Map<ResultPoint, Integer> pointCount = hashMap;
            ResultPointsAndTransitions resultPointsAndTransitions3 = lSideTwo;
            ResultPointsAndTransitions resultPointsAndTransitions4 = lSideOne;
            ArrayList arrayList3 = arrayList;
            ResultPoint resultPoint2 = pointD;
            ResultPoint[] resultPointArr2 = cornerPoints;
            throw NotFoundException.getNotFoundInstance();
        }
        ResultPoint[] corners = new ResultPoint[i];
        corners[c] = bottomLeft;
        corners[1] = bottomLeft2;
        corners[c2] = maybeBottomRight;
        ResultPoint.orderBestPatterns(corners);
        ResultPoint bottomRight = corners[c];
        ResultPoint bottomLeft3 = corners[1];
        ResultPoint topLeft3 = corners[c2];
        if (!hashMap.containsKey(pointA)) {
            topRight = pointA;
        } else if (!hashMap.containsKey(pointB)) {
            topRight = pointB;
        } else if (!hashMap.containsKey(pointC)) {
            topRight = pointC;
        } else {
            topRight = pointD;
        }
        ResultPoint topRight2 = topRight;
        int dimensionTop = transitionsBetween(topLeft3, topRight2).getTransitions();
        int dimensionRight = transitionsBetween(bottomRight, topRight2).getTransitions();
        ResultPoint topLeft4 = topLeft3;
        HashMap hashMap3 = hashMap;
        if ((dimensionTop & 1) == 1) {
            dimensionTop++;
        }
        int dimensionTop2 = dimensionTop + 2;
        if ((dimensionRight & 1) == 1) {
            dimensionRight++;
        }
        int dimensionRight2 = dimensionRight + 2;
        ResultPointsAndTransitions lSideTwo2 = lSideTwo;
        if (4 * dimensionTop2 >= 7 * dimensionRight2) {
            ResultPoint[] resultPointArr3 = cornerPoints;
            ResultPoint[] resultPointArr4 = corners;
            topLeft2 = topLeft4;
            HashMap hashMap4 = hashMap3;
            ResultPointsAndTransitions resultPointsAndTransitions5 = lSideTwo2;
            ArrayList arrayList4 = arrayList;
        } else if (4 * dimensionRight2 >= 7 * dimensionTop2) {
            ResultPointsAndTransitions resultPointsAndTransitions6 = lSideOne;
            ResultPoint[] resultPointArr5 = cornerPoints;
            ResultPoint[] resultPointArr6 = corners;
            topLeft2 = topLeft4;
            HashMap hashMap5 = hashMap3;
            ResultPointsAndTransitions resultPointsAndTransitions7 = lSideTwo2;
            ArrayList arrayList5 = arrayList;
        } else {
            ResultPoint topLeft5 = topLeft4;
            HashMap hashMap6 = hashMap3;
            ResultPoint topLeft6 = topLeft5;
            ResultPointsAndTransitions resultPointsAndTransitions8 = lSideTwo2;
            ResultPointsAndTransitions resultPointsAndTransitions9 = lSideOne;
            ArrayList arrayList6 = arrayList;
            ResultPoint[] resultPointArr7 = cornerPoints;
            ResultPoint[] resultPointArr8 = corners;
            correctedTopRight = correctTopRight(bottomLeft3, bottomRight, topLeft6, topRight2, Math.min(dimensionRight2, dimensionTop2));
            if (correctedTopRight == null) {
                correctedTopRight = topRight2;
            }
            ResultPoint topLeft7 = topLeft6;
            int dimensionCorrected = Math.max(transitionsBetween(topLeft7, correctedTopRight).getTransitions(), transitionsBetween(bottomRight, correctedTopRight).getTransitions()) + 1;
            if ((dimensionCorrected & 1) == 1) {
                dimensionCorrected++;
            }
            bits = sampleGrid(this.image, topLeft7, bottomLeft3, bottomRight, correctedTopRight, dimensionCorrected, dimensionCorrected);
            topLeft = topLeft7;
            ResultPoint resultPoint3 = pointD;
            int i3 = dimensionRight2;
            return new DetectorResult(bits, new ResultPoint[]{topLeft, bottomLeft3, bottomRight, correctedTopRight});
        }
        topLeft = topLeft2;
        ResultPoint resultPoint4 = pointD;
        ResultPoint correctedTopRight2 = correctTopRightRectangular(bottomLeft3, bottomRight, topLeft2, topRight2, dimensionTop2, dimensionRight2);
        if (correctedTopRight2 == null) {
            correctedTopRight2 = topRight2;
        }
        int dimensionTop3 = transitionsBetween(topLeft, correctedTopRight).getTransitions();
        int dimensionRight3 = transitionsBetween(bottomRight, correctedTopRight).getTransitions();
        if ((dimensionTop3 & 1) == 1) {
            dimensionTop3++;
        }
        if ((dimensionRight3 & 1) == 1) {
            dimensionRight3++;
        }
        int i4 = dimensionTop3;
        bits = sampleGrid(this.image, topLeft, bottomLeft3, bottomRight, correctedTopRight, dimensionTop3, dimensionRight3);
        return new DetectorResult(bits, new ResultPoint[]{topLeft, bottomLeft3, bottomRight, correctedTopRight});
    }

    private ResultPoint correctTopRightRectangular(ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topLeft, ResultPoint topRight, int dimensionTop, int dimensionRight) {
        float corr = ((float) distance(bottomLeft, bottomRight)) / ((float) dimensionTop);
        int norm = distance(topLeft, topRight);
        ResultPoint c1 = new ResultPoint(topRight.getX() + (corr * ((topRight.getX() - topLeft.getX()) / ((float) norm))), topRight.getY() + (corr * ((topRight.getY() - topLeft.getY()) / ((float) norm))));
        float corr2 = ((float) distance(bottomLeft, topLeft)) / ((float) dimensionRight);
        int norm2 = distance(bottomRight, topRight);
        ResultPoint c2 = new ResultPoint(topRight.getX() + (corr2 * ((topRight.getX() - bottomRight.getX()) / ((float) norm2))), topRight.getY() + (corr2 * ((topRight.getY() - bottomRight.getY()) / ((float) norm2))));
        if (!isValid(c1)) {
            if (isValid(c2)) {
                return c2;
            }
            return null;
        } else if (isValid(c2) && Math.abs(dimensionTop - transitionsBetween(topLeft, c1).getTransitions()) + Math.abs(dimensionRight - transitionsBetween(bottomRight, c1).getTransitions()) > Math.abs(dimensionTop - transitionsBetween(topLeft, c2).getTransitions()) + Math.abs(dimensionRight - transitionsBetween(bottomRight, c2).getTransitions())) {
            return c2;
        } else {
            return c1;
        }
    }

    private ResultPoint correctTopRight(ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topLeft, ResultPoint topRight, int dimension) {
        float corr = ((float) distance(bottomLeft, bottomRight)) / ((float) dimension);
        int norm = distance(topLeft, topRight);
        ResultPoint c1 = new ResultPoint(topRight.getX() + (corr * ((topRight.getX() - topLeft.getX()) / ((float) norm))), topRight.getY() + (corr * ((topRight.getY() - topLeft.getY()) / ((float) norm))));
        float corr2 = ((float) distance(bottomLeft, topLeft)) / ((float) dimension);
        int norm2 = distance(bottomRight, topRight);
        ResultPoint c2 = new ResultPoint(topRight.getX() + (corr2 * ((topRight.getX() - bottomRight.getX()) / ((float) norm2))), topRight.getY() + (corr2 * ((topRight.getY() - bottomRight.getY()) / ((float) norm2))));
        if (!isValid(c1)) {
            if (isValid(c2)) {
                return c2;
            }
            return null;
        } else if (!isValid(c2)) {
            return c1;
        } else {
            return Math.abs(transitionsBetween(topLeft, c1).getTransitions() - transitionsBetween(bottomRight, c1).getTransitions()) <= Math.abs(transitionsBetween(topLeft, c2).getTransitions() - transitionsBetween(bottomRight, c2).getTransitions()) ? c1 : c2;
        }
    }

    private boolean isValid(ResultPoint p) {
        return p.getX() >= 0.0f && p.getX() < ((float) this.image.getWidth()) && p.getY() > 0.0f && p.getY() < ((float) this.image.getHeight());
    }

    private static int distance(ResultPoint a, ResultPoint b) {
        return MathUtils.round(ResultPoint.distance(a, b));
    }

    private static void increment(Map<ResultPoint, Integer> table, ResultPoint key) {
        Integer value = (Integer) table.get(key);
        int i = 1;
        if (value != null) {
            i = 1 + value.intValue();
        }
        table.put(key, Integer.valueOf(i));
    }

    private static BitMatrix sampleGrid(BitMatrix image2, ResultPoint topLeft, ResultPoint bottomLeft, ResultPoint bottomRight, ResultPoint topRight, int dimensionX, int dimensionY) throws NotFoundException {
        int i = dimensionX;
        int i2 = dimensionY;
        return GridSampler.getInstance().sampleGrid(image2, i, i2, 0.5f, 0.5f, ((float) i) - 0.5f, 0.5f, ((float) i) - 0.5f, ((float) i2) - 0.5f, 0.5f, ((float) i2) - 0.5f, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRight.getX(), bottomRight.getY(), bottomLeft.getX(), bottomLeft.getY());
    }

    private ResultPointsAndTransitions transitionsBetween(ResultPoint from, ResultPoint to) {
        int fromX;
        int fromX2;
        Detector detector = this;
        int fromX3 = (int) from.getX();
        int fromY = (int) from.getY();
        int toX = (int) to.getX();
        int toY = (int) to.getY();
        int xstep = 1;
        boolean steep = Math.abs(toY - fromY) > Math.abs(toX - fromX3);
        if (steep) {
            int temp = fromX3;
            fromX3 = fromY;
            fromY = temp;
            int temp2 = toX;
            toX = toY;
            toY = temp2;
        }
        int dx = Math.abs(toX - fromX3);
        int dy = Math.abs(toY - fromY);
        int error = (-dx) / 2;
        int ystep = fromY < toY ? 1 : -1;
        if (fromX3 >= toX) {
            xstep = -1;
        }
        int transitions = 0;
        boolean inBlack = detector.image.get(steep ? fromY : fromX3, steep ? fromX3 : fromY);
        int x = fromX3;
        int y = fromY;
        while (true) {
            if (x == toX) {
                int i = fromX3;
                break;
            }
            BitMatrix bitMatrix = detector.image;
            int i2 = steep ? y : x;
            if (steep) {
                fromX = fromX3;
                fromX2 = x;
            } else {
                fromX = fromX3;
                fromX2 = y;
            }
            boolean isBlack = bitMatrix.get(i2, fromX2);
            if (isBlack != inBlack) {
                transitions++;
                inBlack = isBlack;
            }
            error += dy;
            if (error <= 0) {
                ResultPoint resultPoint = from;
            } else if (y == toY) {
                break;
            } else {
                ResultPoint resultPoint2 = from;
                y += ystep;
                error -= dx;
            }
            x += xstep;
            fromX3 = fromX;
            detector = this;
        }
        return new ResultPointsAndTransitions(from, to, transitions, null);
    }
}

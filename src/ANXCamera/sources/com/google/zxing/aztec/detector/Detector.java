package com.google.zxing.aztec.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.detector.MathUtils;
import com.google.zxing.common.detector.WhiteRectangleDetector;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;

public final class Detector {
    private static final int[] EXPECTED_CORNER_BITS = {3808, 476, 2107, 1799};
    private boolean compact;
    private final BitMatrix image;
    private int nbCenterLayers;
    private int nbDataBlocks;
    private int nbLayers;
    private int shift;

    static final class Point {
        private final int x;
        private final int y;

        Point(int i, int i2) {
            this.x = i;
            this.y = i2;
        }

        /* access modifiers changed from: 0000 */
        public int getX() {
            return this.x;
        }

        /* access modifiers changed from: 0000 */
        public int getY() {
            return this.y;
        }

        /* access modifiers changed from: 0000 */
        public ResultPoint toResultPoint() {
            return new ResultPoint((float) getX(), (float) getY());
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("<");
            sb.append(this.x);
            sb.append(' ');
            sb.append(this.y);
            sb.append('>');
            return sb.toString();
        }
    }

    public Detector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    private static float distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        return MathUtils.distance(resultPoint.getX(), resultPoint.getY(), resultPoint2.getX(), resultPoint2.getY());
    }

    private static float distance(Point point, Point point2) {
        return MathUtils.distance(point.getX(), point.getY(), point2.getX(), point2.getY());
    }

    private static ResultPoint[] expandSquare(ResultPoint[] resultPointArr, float f, float f2) {
        float f3 = f2 / (2.0f * f);
        float x = resultPointArr[0].getX() - resultPointArr[2].getX();
        float y = resultPointArr[0].getY() - resultPointArr[2].getY();
        float x2 = (resultPointArr[0].getX() + resultPointArr[2].getX()) / 2.0f;
        float y2 = (resultPointArr[0].getY() + resultPointArr[2].getY()) / 2.0f;
        ResultPoint resultPoint = new ResultPoint((f3 * x) + x2, (f3 * y) + y2);
        ResultPoint resultPoint2 = new ResultPoint(x2 - (f3 * x), y2 - (f3 * y));
        float x3 = resultPointArr[1].getX() - resultPointArr[3].getX();
        float y3 = resultPointArr[1].getY() - resultPointArr[3].getY();
        float x4 = (resultPointArr[1].getX() + resultPointArr[3].getX()) / 2.0f;
        float y4 = (resultPointArr[1].getY() + resultPointArr[3].getY()) / 2.0f;
        return new ResultPoint[]{resultPoint, new ResultPoint((f3 * x3) + x4, (f3 * y3) + y4), resultPoint2, new ResultPoint(x4 - (f3 * x3), y4 - (f3 * y3))};
    }

    private void extractParameters(ResultPoint[] resultPointArr) throws NotFoundException {
        int i;
        long j;
        if (!isValid(resultPointArr[0]) || !isValid(resultPointArr[1]) || !isValid(resultPointArr[2]) || !isValid(resultPointArr[3])) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i2 = this.nbCenterLayers * 2;
        int[] iArr = {sampleLine(resultPointArr[0], resultPointArr[1], i2), sampleLine(resultPointArr[1], resultPointArr[2], i2), sampleLine(resultPointArr[2], resultPointArr[3], i2), sampleLine(resultPointArr[3], resultPointArr[0], i2)};
        this.shift = getRotation(iArr, i2);
        long j2 = 0;
        for (int i3 = 0; i3 < 4; i3++) {
            int i4 = iArr[(this.shift + i3) % 4];
            if (this.compact) {
                j = j2 << 7;
                i = (i4 >> 1) & 127;
            } else {
                j = j2 << 10;
                i = ((i4 >> 2) & 992) + ((i4 >> 1) & 31);
            }
            j2 = j + ((long) i);
        }
        int correctedParameterData = getCorrectedParameterData(j2, this.compact);
        if (this.compact) {
            this.nbLayers = (correctedParameterData >> 6) + 1;
            this.nbDataBlocks = (correctedParameterData & 63) + 1;
            return;
        }
        this.nbLayers = (correctedParameterData >> 11) + 1;
        this.nbDataBlocks = (correctedParameterData & 2047) + 1;
    }

    private ResultPoint[] getBullsEyeCorners(Point point) throws NotFoundException {
        Point point2 = point;
        Point point3 = point;
        Point point4 = point;
        Point point5 = point;
        boolean z = true;
        this.nbCenterLayers = 1;
        while (true) {
            boolean z2 = false;
            if (this.nbCenterLayers >= 9) {
                break;
            }
            Point firstDifferent = getFirstDifferent(point2, z, 1, -1);
            Point firstDifferent2 = getFirstDifferent(point3, z, 1, 1);
            Point firstDifferent3 = getFirstDifferent(point4, z, -1, 1);
            Point firstDifferent4 = getFirstDifferent(point5, z, -1, -1);
            if (this.nbCenterLayers > 2) {
                float distance = (distance(firstDifferent4, firstDifferent) * ((float) this.nbCenterLayers)) / (distance(point5, point2) * ((float) (this.nbCenterLayers + 2)));
                if (((double) distance) >= 0.75d) {
                    if (((double) distance) <= 1.25d) {
                        if (!isWhiteOrBlackRectangle(firstDifferent, firstDifferent2, firstDifferent3, firstDifferent4)) {
                            break;
                        }
                    } else {
                        break;
                    }
                } else {
                    break;
                }
            }
            point2 = firstDifferent;
            point3 = firstDifferent2;
            point4 = firstDifferent3;
            point5 = firstDifferent4;
            if (!z) {
                z2 = true;
            }
            z = z2;
            this.nbCenterLayers++;
        }
        if (this.nbCenterLayers == 5 || this.nbCenterLayers == 7) {
            this.compact = this.nbCenterLayers == 5;
            return expandSquare(new ResultPoint[]{new ResultPoint(((float) point2.getX()) + 0.5f, ((float) point2.getY()) - 0.5f), new ResultPoint(((float) point3.getX()) + 0.5f, ((float) point3.getY()) + 0.5f), new ResultPoint(((float) point4.getX()) - 0.5f, ((float) point4.getY()) + 0.5f), new ResultPoint(((float) point5.getX()) - 0.5f, ((float) point5.getY()) - 0.5f)}, (float) ((this.nbCenterLayers * 2) - 3), (float) (2 * this.nbCenterLayers));
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private int getColor(Point point, Point point2) {
        float distance = distance(point, point2);
        float x = ((float) (point2.getX() - point.getX())) / distance;
        float y = ((float) (point2.getY() - point.getY())) / distance;
        int i = 0;
        float x2 = (float) point.getX();
        float y2 = (float) point.getY();
        boolean z = this.image.get(point.getX(), point.getY());
        for (int i2 = 0; ((float) i2) < distance; i2++) {
            x2 += x;
            y2 += y;
            if (this.image.get(MathUtils.round(x2), MathUtils.round(y2)) != z) {
                i++;
            }
        }
        float f = ((float) i) / distance;
        boolean z2 = false;
        if (f > 0.1f && f < 0.9f) {
            return 0;
        }
        int i3 = 1;
        if (f <= 0.1f) {
            z2 = true;
        }
        if (z2 != z) {
            i3 = -1;
        }
        return i3;
    }

    private static int getCorrectedParameterData(long j, boolean z) throws NotFoundException {
        int i;
        int i2;
        if (z) {
            i2 = 7;
            i = 2;
        } else {
            i2 = 10;
            i = 4;
        }
        int i3 = i2 - i;
        int[] iArr = new int[i2];
        for (int i4 = i2 - 1; i4 >= 0; i4--) {
            iArr[i4] = ((int) j) & 15;
            j >>= 4;
        }
        try {
            new ReedSolomonDecoder(GenericGF.AZTEC_PARAM).decode(iArr, i3);
            int i5 = 0;
            for (int i6 = 0; i6 < i; i6++) {
                i5 = (i5 << 4) + iArr[i6];
            }
            return i5;
        } catch (ReedSolomonException e) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private int getDimension() {
        return this.compact ? (4 * this.nbLayers) + 11 : this.nbLayers <= 4 ? (4 * this.nbLayers) + 15 : (this.nbLayers * 4) + (2 * (((this.nbLayers - 4) / 8) + 1)) + 15;
    }

    private Point getFirstDifferent(Point point, boolean z, int i, int i2) {
        int x = point.getX() + i;
        int y = point.getY();
        while (true) {
            y += i2;
            if (!isValid(x, y) || this.image.get(x, y) != z) {
                int i3 = x - i;
                int i4 = y - i2;
            } else {
                x += i;
            }
        }
        int i32 = x - i;
        int i42 = y - i2;
        while (isValid(i32, i42) && this.image.get(i32, i42) == z) {
            i32 += i;
        }
        int i5 = i32 - i;
        while (isValid(i5, i42) && this.image.get(i5, i42) == z) {
            i42 += i2;
        }
        return new Point(i5, i42 - i2);
    }

    private Point getMatrixCenter() {
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        ResultPoint resultPoint4;
        ResultPoint resultPoint5;
        ResultPoint resultPoint6;
        ResultPoint resultPoint7;
        ResultPoint resultPoint8;
        try {
            ResultPoint[] detect = new WhiteRectangleDetector(this.image).detect();
            resultPoint3 = detect[0];
            resultPoint2 = detect[1];
            resultPoint = detect[2];
            resultPoint4 = detect[3];
        } catch (NotFoundException e) {
            int width = this.image.getWidth() / 2;
            int height = this.image.getHeight() / 2;
            ResultPoint resultPoint9 = getFirstDifferent(new Point(width + 7, height - 7), false, 1, -1).toResultPoint();
            ResultPoint resultPoint10 = getFirstDifferent(new Point(width + 7, height + 7), false, 1, 1).toResultPoint();
            ResultPoint resultPoint11 = getFirstDifferent(new Point(width - 7, height + 7), false, -1, 1).toResultPoint();
            resultPoint4 = getFirstDifferent(new Point(width - 7, height - 7), false, -1, -1).toResultPoint();
            resultPoint3 = resultPoint9;
            resultPoint2 = resultPoint10;
            resultPoint = resultPoint11;
        }
        int round = MathUtils.round((((resultPoint3.getX() + resultPoint4.getX()) + resultPoint2.getX()) + resultPoint.getX()) / 4.0f);
        int round2 = MathUtils.round((((resultPoint3.getY() + resultPoint4.getY()) + resultPoint2.getY()) + resultPoint.getY()) / 4.0f);
        try {
            ResultPoint[] detect2 = new WhiteRectangleDetector(this.image, 15, round, round2).detect();
            resultPoint7 = detect2[0];
            resultPoint6 = detect2[1];
            resultPoint5 = detect2[2];
            resultPoint8 = detect2[3];
        } catch (NotFoundException e2) {
            resultPoint7 = getFirstDifferent(new Point(round + 7, round2 - 7), false, 1, -1).toResultPoint();
            resultPoint6 = getFirstDifferent(new Point(round + 7, round2 + 7), false, 1, 1).toResultPoint();
            resultPoint5 = getFirstDifferent(new Point(round - 7, round2 + 7), false, -1, 1).toResultPoint();
            resultPoint8 = getFirstDifferent(new Point(round - 7, round2 - 7), false, -1, -1).toResultPoint();
        }
        return new Point(MathUtils.round((((resultPoint7.getX() + resultPoint8.getX()) + resultPoint6.getX()) + resultPoint5.getX()) / 4.0f), MathUtils.round((((resultPoint7.getY() + resultPoint8.getY()) + resultPoint6.getY()) + resultPoint5.getY()) / 4.0f));
    }

    private ResultPoint[] getMatrixCornerPoints(ResultPoint[] resultPointArr) {
        return expandSquare(resultPointArr, (float) (2 * this.nbCenterLayers), (float) getDimension());
    }

    private static int getRotation(int[] iArr, int i) throws NotFoundException {
        int i2 = 0;
        for (int i3 : iArr) {
            i2 = (i2 << 3) + ((i3 >> (i - 2)) << 1) + (i3 & 1);
        }
        int i4 = ((i2 & 1) << 11) + (i2 >> 1);
        for (int i5 = 0; i5 < 4; i5++) {
            if (Integer.bitCount(EXPECTED_CORNER_BITS[i5] ^ i4) <= 2) {
                return i5;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private boolean isValid(int i, int i2) {
        return i >= 0 && i < this.image.getWidth() && i2 > 0 && i2 < this.image.getHeight();
    }

    private boolean isValid(ResultPoint resultPoint) {
        return isValid(MathUtils.round(resultPoint.getX()), MathUtils.round(resultPoint.getY()));
    }

    private boolean isWhiteOrBlackRectangle(Point point, Point point2, Point point3, Point point4) {
        Point point5 = new Point(point.getX() - 3, point.getY() + 3);
        Point point6 = new Point(point2.getX() - 3, point2.getY() - 3);
        Point point7 = new Point(point3.getX() + 3, point3.getY() - 3);
        Point point8 = new Point(point4.getX() + 3, point4.getY() + 3);
        int color = getColor(point8, point5);
        boolean z = false;
        if (color == 0 || getColor(point5, point6) != color || getColor(point6, point7) != color) {
            return false;
        }
        if (getColor(point7, point8) == color) {
            z = true;
        }
        return z;
    }

    private BitMatrix sampleGrid(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4) throws NotFoundException {
        GridSampler instance = GridSampler.getInstance();
        int dimension = getDimension();
        float f = (((float) dimension) / 2.0f) - ((float) this.nbCenterLayers);
        float f2 = (((float) dimension) / 2.0f) + ((float) this.nbCenterLayers);
        int i = dimension;
        return instance.sampleGrid(bitMatrix, dimension, dimension, f, f, f2, f, f2, f2, f, f2, resultPoint.getX(), resultPoint.getY(), resultPoint2.getX(), resultPoint2.getY(), resultPoint3.getX(), resultPoint3.getY(), resultPoint4.getX(), resultPoint4.getY());
    }

    private int sampleLine(ResultPoint resultPoint, ResultPoint resultPoint2, int i) {
        int i2 = 0;
        float distance = distance(resultPoint, resultPoint2);
        float f = distance / ((float) i);
        float x = resultPoint.getX();
        float y = resultPoint.getY();
        float x2 = ((resultPoint2.getX() - resultPoint.getX()) * f) / distance;
        float y2 = ((resultPoint2.getY() - resultPoint.getY()) * f) / distance;
        for (int i3 = 0; i3 < i; i3++) {
            if (this.image.get(MathUtils.round((((float) i3) * x2) + x), MathUtils.round((((float) i3) * y2) + y))) {
                i2 |= 1 << ((i - i3) - 1);
            }
        }
        return i2;
    }

    public AztecDetectorResult detect() throws NotFoundException {
        return detect(false);
    }

    public AztecDetectorResult detect(boolean z) throws NotFoundException {
        ResultPoint[] bullsEyeCorners = getBullsEyeCorners(getMatrixCenter());
        if (z) {
            ResultPoint resultPoint = bullsEyeCorners[0];
            bullsEyeCorners[0] = bullsEyeCorners[2];
            bullsEyeCorners[2] = resultPoint;
        }
        extractParameters(bullsEyeCorners);
        BitMatrix sampleGrid = sampleGrid(this.image, bullsEyeCorners[this.shift % 4], bullsEyeCorners[(this.shift + 1) % 4], bullsEyeCorners[(this.shift + 2) % 4], bullsEyeCorners[(this.shift + 3) % 4]);
        AztecDetectorResult aztecDetectorResult = new AztecDetectorResult(sampleGrid, getMatrixCornerPoints(bullsEyeCorners), this.compact, this.nbDataBlocks, this.nbLayers);
        return aztecDetectorResult;
    }
}

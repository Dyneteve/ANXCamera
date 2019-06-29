package com.google.zxing.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import com.google.zxing.common.PerspectiveTransform;
import com.google.zxing.common.detector.MathUtils;
import com.google.zxing.qrcode.decoder.Version;
import java.util.Map;

public class Detector {
    private final BitMatrix image;
    private ResultPointCallback resultPointCallback;

    public Detector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    private float calculateModuleSizeOneWay(ResultPoint resultPoint, ResultPoint resultPoint2) {
        float sizeOfBlackWhiteBlackRunBothWays = sizeOfBlackWhiteBlackRunBothWays((int) resultPoint.getX(), (int) resultPoint.getY(), (int) resultPoint2.getX(), (int) resultPoint2.getY());
        float sizeOfBlackWhiteBlackRunBothWays2 = sizeOfBlackWhiteBlackRunBothWays((int) resultPoint2.getX(), (int) resultPoint2.getY(), (int) resultPoint.getX(), (int) resultPoint.getY());
        return Float.isNaN(sizeOfBlackWhiteBlackRunBothWays) ? sizeOfBlackWhiteBlackRunBothWays2 / 7.0f : Float.isNaN(sizeOfBlackWhiteBlackRunBothWays2) ? sizeOfBlackWhiteBlackRunBothWays / 7.0f : (sizeOfBlackWhiteBlackRunBothWays + sizeOfBlackWhiteBlackRunBothWays2) / 14.0f;
    }

    private static int computeDimension(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, float f) throws NotFoundException {
        int round = ((MathUtils.round(ResultPoint.distance(resultPoint, resultPoint2) / f) + MathUtils.round(ResultPoint.distance(resultPoint, resultPoint3) / f)) / 2) + 7;
        int i = round & 3;
        if (i == 0) {
            return round + 1;
        }
        switch (i) {
            case 2:
                return round - 1;
            case 3:
                throw NotFoundException.getNotFoundInstance();
            default:
                return round;
        }
    }

    private static PerspectiveTransform createTransform(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i) {
        float f;
        float f2;
        float f3;
        float f4;
        float f5 = ((float) i) - 3.5f;
        if (resultPoint4 != null) {
            float f6 = f5 - 3.0f;
            f2 = resultPoint4.getX();
            f = resultPoint4.getY();
            f3 = f6;
            f4 = f6;
        } else {
            f4 = f5;
            f2 = (resultPoint2.getX() - resultPoint.getX()) + resultPoint3.getX();
            f = (resultPoint2.getY() - resultPoint.getY()) + resultPoint3.getY();
            f3 = f5;
        }
        return PerspectiveTransform.quadrilateralToQuadrilateral(3.5f, 3.5f, f5, 3.5f, f3, f4, 3.5f, f5, resultPoint.getX(), resultPoint.getY(), resultPoint2.getX(), resultPoint2.getY(), f2, f, resultPoint3.getX(), resultPoint3.getY());
    }

    private static BitMatrix sampleGrid(BitMatrix bitMatrix, PerspectiveTransform perspectiveTransform, int i) throws NotFoundException {
        return GridSampler.getInstance().sampleGrid(bitMatrix, i, i, perspectiveTransform);
    }

    private float sizeOfBlackWhiteBlackRun(int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        char c;
        int i9 = 1;
        boolean z = Math.abs(i4 - i2) > Math.abs(i3 - i);
        if (z) {
            i6 = i2;
            i8 = i;
            i5 = i4;
            i7 = i3;
        } else {
            i6 = i;
            i8 = i2;
            i5 = i3;
            i7 = i4;
        }
        int abs = Math.abs(i5 - i6);
        int abs2 = Math.abs(i7 - i8);
        int i10 = (-abs) / 2;
        int i11 = -1;
        int i12 = i6 < i5 ? 1 : -1;
        if (i8 < i7) {
            i11 = 1;
        }
        int i13 = 0;
        int i14 = i5 + i12;
        int i15 = i6;
        int i16 = i10;
        int i17 = i8;
        while (true) {
            if (i15 == i14) {
                boolean z2 = z;
                break;
            }
            boolean z3 = z;
            if ((i13 == i9 ? i9 : false) == this.image.get(z ? i17 : i15, z ? i15 : i17)) {
                if (i13 == 2) {
                    return MathUtils.distance(i15, i17, i6, i8);
                }
                i13++;
            }
            i16 += abs2;
            if (i16 <= 0) {
                c = 2;
            } else if (i17 == i7) {
                break;
            } else {
                c = 2;
                i17 += i11;
                i16 -= abs;
            }
            i15 += i12;
            char c2 = c;
            z = z3;
            i9 = 1;
        }
        if (i13 == 2) {
            return MathUtils.distance(i5 + i12, i7, i6, i8);
        }
        return Float.NaN;
    }

    private float sizeOfBlackWhiteBlackRunBothWays(int i, int i2, int i3, int i4) {
        float sizeOfBlackWhiteBlackRun = sizeOfBlackWhiteBlackRun(i, i2, i3, i4);
        float f = 1.0f;
        int i5 = i - (i3 - i);
        if (i5 < 0) {
            f = ((float) i) / ((float) (i - i5));
            i5 = 0;
        } else if (i5 >= this.image.getWidth()) {
            f = ((float) ((this.image.getWidth() - 1) - i)) / ((float) (i5 - i));
            i5 = this.image.getWidth() - 1;
        }
        int i6 = (int) (((float) i2) - (((float) (i4 - i2)) * f));
        float f2 = 1.0f;
        if (i6 < 0) {
            f2 = ((float) i2) / ((float) (i2 - i6));
            i6 = 0;
        } else if (i6 >= this.image.getHeight()) {
            f2 = ((float) ((this.image.getHeight() - 1) - i2)) / ((float) (i6 - i2));
            i6 = this.image.getHeight() - 1;
        }
        return (sizeOfBlackWhiteBlackRun + sizeOfBlackWhiteBlackRun(i, i2, (int) (((float) i) + (((float) (i5 - i)) * f2)), i6)) - 1.0f;
    }

    /* access modifiers changed from: protected */
    public final float calculateModuleSize(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3) {
        return (calculateModuleSizeOneWay(resultPoint, resultPoint2) + calculateModuleSizeOneWay(resultPoint, resultPoint3)) / 2.0f;
    }

    public DetectorResult detect() throws NotFoundException, FormatException {
        return detect(null);
    }

    public final DetectorResult detect(Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        this.resultPointCallback = map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        return processFinderPatternInfo(new FinderPatternFinder(this.image, this.resultPointCallback).find(map));
    }

    /* access modifiers changed from: protected */
    public final AlignmentPattern findAlignmentInRegion(float f, int i, int i2, float f2) throws NotFoundException {
        int i3 = (int) (f2 * f);
        int max = Math.max(0, i - i3);
        int min = Math.min(this.image.getWidth() - 1, i + i3);
        if (((float) (min - max)) >= f * 3.0f) {
            int max2 = Math.max(0, i2 - i3);
            int min2 = Math.min(this.image.getHeight() - 1, i2 + i3);
            if (((float) (min2 - max2)) >= f * 3.0f) {
                AlignmentPatternFinder alignmentPatternFinder = new AlignmentPatternFinder(this.image, max, max2, min - max, min2 - max2, f, this.resultPointCallback);
                return alignmentPatternFinder.find();
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* access modifiers changed from: protected */
    public final BitMatrix getImage() {
        return this.image;
    }

    /* access modifiers changed from: protected */
    public final ResultPointCallback getResultPointCallback() {
        return this.resultPointCallback;
    }

    /* access modifiers changed from: protected */
    public final DetectorResult processFinderPatternInfo(FinderPatternInfo finderPatternInfo) throws NotFoundException, FormatException {
        ResultPoint[] resultPointArr;
        FinderPattern topLeft = finderPatternInfo.getTopLeft();
        FinderPattern topRight = finderPatternInfo.getTopRight();
        FinderPattern bottomLeft = finderPatternInfo.getBottomLeft();
        float calculateModuleSize = calculateModuleSize(topLeft, topRight, bottomLeft);
        if (calculateModuleSize >= 1.0f) {
            int computeDimension = computeDimension(topLeft, topRight, bottomLeft, calculateModuleSize);
            Version provisionalVersionForDimension = Version.getProvisionalVersionForDimension(computeDimension);
            int dimensionForVersion = provisionalVersionForDimension.getDimensionForVersion() - 7;
            ResultPoint resultPoint = null;
            if (provisionalVersionForDimension.getAlignmentPatternCenters().length > 0) {
                float f = 1.0f - (3.0f / ((float) dimensionForVersion));
                int x = (int) (topLeft.getX() + ((((topRight.getX() - topLeft.getX()) + bottomLeft.getX()) - topLeft.getX()) * f));
                int y = (int) (topLeft.getY() + ((((topRight.getY() - topLeft.getY()) + bottomLeft.getY()) - topLeft.getY()) * f));
                int i = 4;
                while (true) {
                    if (i > 16) {
                        break;
                    }
                    try {
                        resultPoint = findAlignmentInRegion(calculateModuleSize, x, y, (float) i);
                        break;
                    } catch (NotFoundException e) {
                        i <<= 1;
                    }
                }
            }
            BitMatrix sampleGrid = sampleGrid(this.image, createTransform(topLeft, topRight, bottomLeft, resultPoint, computeDimension), computeDimension);
            if (resultPoint == null) {
                resultPointArr = new ResultPoint[]{bottomLeft, topLeft, topRight};
            } else {
                resultPointArr = new ResultPoint[]{bottomLeft, topLeft, topRight, resultPoint};
            }
            return new DetectorResult(sampleGrid, resultPointArr);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

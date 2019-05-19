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

    public Detector(BitMatrix image2) {
        this.image = image2;
    }

    /* access modifiers changed from: protected */
    public final BitMatrix getImage() {
        return this.image;
    }

    /* access modifiers changed from: protected */
    public final ResultPointCallback getResultPointCallback() {
        return this.resultPointCallback;
    }

    public DetectorResult detect() throws NotFoundException, FormatException {
        return detect(null);
    }

    public final DetectorResult detect(Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        ResultPointCallback resultPointCallback2;
        if (hints == null) {
            resultPointCallback2 = null;
        } else {
            resultPointCallback2 = (ResultPointCallback) hints.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        }
        this.resultPointCallback = resultPointCallback2;
        return processFinderPatternInfo(new FinderPatternFinder(this.image, this.resultPointCallback).find(hints));
    }

    /* access modifiers changed from: protected */
    public final DetectorResult processFinderPatternInfo(FinderPatternInfo info) throws NotFoundException, FormatException {
        ResultPoint[] points;
        FinderPattern topLeft = info.getTopLeft();
        FinderPattern topRight = info.getTopRight();
        FinderPattern bottomLeft = info.getBottomLeft();
        float moduleSize = calculateModuleSize(topLeft, topRight, bottomLeft);
        if (moduleSize >= 1.0f) {
            int dimension = computeDimension(topLeft, topRight, bottomLeft, moduleSize);
            Version provisionalVersion = Version.getProvisionalVersionForDimension(dimension);
            int modulesBetweenFPCenters = provisionalVersion.getDimensionForVersion() - 7;
            AlignmentPattern alignmentPattern = null;
            if (provisionalVersion.getAlignmentPatternCenters().length > 0) {
                float correctionToTopLeft = 1.0f - (3.0f / ((float) modulesBetweenFPCenters));
                int estAlignmentX = (int) (topLeft.getX() + ((((topRight.getX() - topLeft.getX()) + bottomLeft.getX()) - topLeft.getX()) * correctionToTopLeft));
                int estAlignmentY = (int) (topLeft.getY() + ((((topRight.getY() - topLeft.getY()) + bottomLeft.getY()) - topLeft.getY()) * correctionToTopLeft));
                int i = 4;
                while (true) {
                    if (i > 16) {
                        break;
                    }
                    try {
                        alignmentPattern = findAlignmentInRegion(moduleSize, estAlignmentX, estAlignmentY, (float) i);
                        break;
                    } catch (NotFoundException e) {
                        i <<= 1;
                    }
                }
            }
            BitMatrix bits = sampleGrid(this.image, createTransform(topLeft, topRight, bottomLeft, alignmentPattern, dimension), dimension);
            if (alignmentPattern == null) {
                points = new ResultPoint[]{bottomLeft, topLeft, topRight};
            } else {
                points = new ResultPoint[]{bottomLeft, topLeft, topRight, alignmentPattern};
            }
            return new DetectorResult(bits, points);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static PerspectiveTransform createTransform(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, ResultPoint alignmentPattern, int dimension) {
        float bottomRightY;
        float bottomRightX;
        float sourceBottomRightX;
        float sourceBottomRightY;
        float dimMinusThree = ((float) dimension) - 3.5f;
        if (alignmentPattern != null) {
            float sourceBottomRightX2 = dimMinusThree - 3.0f;
            bottomRightX = alignmentPattern.getX();
            bottomRightY = alignmentPattern.getY();
            sourceBottomRightX = sourceBottomRightX2;
            sourceBottomRightY = sourceBottomRightX2;
        } else {
            sourceBottomRightY = dimMinusThree;
            bottomRightX = (topRight.getX() - topLeft.getX()) + bottomLeft.getX();
            bottomRightY = (topRight.getY() - topLeft.getY()) + bottomLeft.getY();
            sourceBottomRightX = dimMinusThree;
        }
        return PerspectiveTransform.quadrilateralToQuadrilateral(3.5f, 3.5f, dimMinusThree, 3.5f, sourceBottomRightX, sourceBottomRightY, 3.5f, dimMinusThree, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRightX, bottomRightY, bottomLeft.getX(), bottomLeft.getY());
    }

    private static BitMatrix sampleGrid(BitMatrix image2, PerspectiveTransform transform, int dimension) throws NotFoundException {
        return GridSampler.getInstance().sampleGrid(image2, dimension, dimension, transform);
    }

    private static int computeDimension(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, float moduleSize) throws NotFoundException {
        int dimension = ((MathUtils.round(ResultPoint.distance(topLeft, topRight) / moduleSize) + MathUtils.round(ResultPoint.distance(topLeft, bottomLeft) / moduleSize)) / 2) + 7;
        int i = dimension & 3;
        if (i == 0) {
            return dimension + 1;
        }
        switch (i) {
            case 2:
                return dimension - 1;
            case 3:
                throw NotFoundException.getNotFoundInstance();
            default:
                return dimension;
        }
    }

    /* access modifiers changed from: protected */
    public final float calculateModuleSize(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft) {
        return (calculateModuleSizeOneWay(topLeft, topRight) + calculateModuleSizeOneWay(topLeft, bottomLeft)) / 2.0f;
    }

    private float calculateModuleSizeOneWay(ResultPoint pattern, ResultPoint otherPattern) {
        float moduleSizeEst1 = sizeOfBlackWhiteBlackRunBothWays((int) pattern.getX(), (int) pattern.getY(), (int) otherPattern.getX(), (int) otherPattern.getY());
        float moduleSizeEst2 = sizeOfBlackWhiteBlackRunBothWays((int) otherPattern.getX(), (int) otherPattern.getY(), (int) pattern.getX(), (int) pattern.getY());
        if (Float.isNaN(moduleSizeEst1)) {
            return moduleSizeEst2 / 7.0f;
        }
        if (Float.isNaN(moduleSizeEst2)) {
            return moduleSizeEst1 / 7.0f;
        }
        return (moduleSizeEst1 + moduleSizeEst2) / 14.0f;
    }

    private float sizeOfBlackWhiteBlackRunBothWays(int fromX, int fromY, int toX, int toY) {
        float result = sizeOfBlackWhiteBlackRun(fromX, fromY, toX, toY);
        float scale = 1.0f;
        int otherToX = fromX - (toX - fromX);
        if (otherToX < 0) {
            scale = ((float) fromX) / ((float) (fromX - otherToX));
            otherToX = 0;
        } else if (otherToX >= this.image.getWidth()) {
            scale = ((float) ((this.image.getWidth() - 1) - fromX)) / ((float) (otherToX - fromX));
            otherToX = this.image.getWidth() - 1;
        }
        int otherToY = (int) (((float) fromY) - (((float) (toY - fromY)) * scale));
        float scale2 = 1.0f;
        if (otherToY < 0) {
            scale2 = ((float) fromY) / ((float) (fromY - otherToY));
            otherToY = 0;
        } else if (otherToY >= this.image.getHeight()) {
            scale2 = ((float) ((this.image.getHeight() - 1) - fromY)) / ((float) (otherToY - fromY));
            otherToY = this.image.getHeight() - 1;
        }
        return (result + sizeOfBlackWhiteBlackRun(fromX, fromY, (int) (((float) fromX) + (((float) (otherToX - fromX)) * scale2)), otherToY)) - 1.0f;
    }

    private float sizeOfBlackWhiteBlackRun(int fromX, int fromY, int toX, int toY) {
        int toX2;
        int fromX2;
        int toY2;
        int fromY2;
        char c;
        int i = 1;
        boolean steep = Math.abs(toY - fromY) > Math.abs(toX - fromX);
        if (steep) {
            fromX2 = fromY;
            fromY2 = fromX;
            toX2 = toY;
            toY2 = toX;
        } else {
            fromX2 = fromX;
            fromY2 = fromY;
            toX2 = toX;
            toY2 = toY;
        }
        int dx = Math.abs(toX2 - fromX2);
        int dy = Math.abs(toY2 - fromY2);
        int error = (-dx) / 2;
        int ystep = -1;
        int xstep = fromX2 < toX2 ? 1 : -1;
        if (fromY2 < toY2) {
            ystep = 1;
        }
        int state = 0;
        int xLimit = toX2 + xstep;
        int x = fromX2;
        int error2 = error;
        int y = fromY2;
        while (true) {
            if (x == xLimit) {
                boolean z = steep;
                break;
            }
            boolean steep2 = steep;
            if ((state == i ? i : false) == this.image.get(steep ? y : x, steep ? x : y)) {
                if (state == 2) {
                    return MathUtils.distance(x, y, fromX2, fromY2);
                }
                state++;
            }
            error2 += dy;
            if (error2 <= 0) {
                c = 2;
            } else if (y == toY2) {
                break;
            } else {
                c = 2;
                y += ystep;
                error2 -= dx;
            }
            x += xstep;
            char c2 = c;
            steep = steep2;
            i = 1;
        }
        if (state == 2) {
            return MathUtils.distance(toX2 + xstep, toY2, fromX2, fromY2);
        }
        return Float.NaN;
    }

    /* access modifiers changed from: protected */
    public final AlignmentPattern findAlignmentInRegion(float overallEstModuleSize, int estAlignmentX, int estAlignmentY, float allowanceFactor) throws NotFoundException {
        int allowance = (int) (allowanceFactor * overallEstModuleSize);
        int alignmentAreaLeftX = Math.max(0, estAlignmentX - allowance);
        int alignmentAreaRightX = Math.min(this.image.getWidth() - 1, estAlignmentX + allowance);
        if (((float) (alignmentAreaRightX - alignmentAreaLeftX)) >= overallEstModuleSize * 3.0f) {
            int alignmentAreaTopY = Math.max(0, estAlignmentY - allowance);
            int alignmentAreaBottomY = Math.min(this.image.getHeight() - 1, estAlignmentY + allowance);
            if (((float) (alignmentAreaBottomY - alignmentAreaTopY)) >= overallEstModuleSize * 3.0f) {
                AlignmentPatternFinder alignmentFinder = new AlignmentPatternFinder(this.image, alignmentAreaLeftX, alignmentAreaTopY, alignmentAreaRightX - alignmentAreaLeftX, alignmentAreaBottomY - alignmentAreaTopY, overallEstModuleSize, this.resultPointCallback);
                return alignmentFinder.find();
            }
            throw NotFoundException.getNotFoundInstance();
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

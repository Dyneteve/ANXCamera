package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

public final class WhiteRectangleDetector {
    private static final int CORR = 1;
    private static final int INIT_SIZE = 10;
    private final int downInit;
    private final int height;
    private final BitMatrix image;
    private final int leftInit;
    private final int rightInit;
    private final int upInit;
    private final int width;

    public WhiteRectangleDetector(BitMatrix image2) throws NotFoundException {
        this(image2, 10, image2.getWidth() / 2, image2.getHeight() / 2);
    }

    public WhiteRectangleDetector(BitMatrix image2, int initSize, int x, int y) throws NotFoundException {
        this.image = image2;
        this.height = image2.getHeight();
        this.width = image2.getWidth();
        int halfsize = initSize / 2;
        this.leftInit = x - halfsize;
        this.rightInit = x + halfsize;
        this.upInit = y - halfsize;
        this.downInit = y + halfsize;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    public ResultPoint[] detect() throws NotFoundException {
        int down;
        int up;
        int right;
        int left;
        int left2 = this.leftInit;
        int right2 = this.rightInit;
        int up2 = this.upInit;
        int down2 = this.downInit;
        boolean sizeExceeded = false;
        boolean aBlackPointFoundOnBorder = true;
        boolean atLeastOneBlackPointFoundOnBorder = false;
        boolean atLeastOneBlackPointFoundOnRight = false;
        boolean atLeastOneBlackPointFoundOnBottom = false;
        boolean atLeastOneBlackPointFoundOnLeft = false;
        boolean atLeastOneBlackPointFoundOnTop = false;
        while (true) {
            if (!aBlackPointFoundOnBorder) {
                break;
            }
            aBlackPointFoundOnBorder = false;
            boolean rightBorderNotWhite = true;
            while (true) {
                if ((rightBorderNotWhite || !atLeastOneBlackPointFoundOnRight) && right2 < this.width) {
                    boolean atLeastOneBlackPointFoundOnBorder2 = atLeastOneBlackPointFoundOnBorder;
                    rightBorderNotWhite = containsBlackPoint(up2, down2, right2, false);
                    if (rightBorderNotWhite) {
                        right2++;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnRight = true;
                    } else if (!atLeastOneBlackPointFoundOnRight) {
                        right2++;
                    }
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder2;
                }
            }
            if (right2 >= this.width) {
                sizeExceeded = true;
                break;
            }
            boolean bottomBorderNotWhite = true;
            while (true) {
                if ((bottomBorderNotWhite || !atLeastOneBlackPointFoundOnBottom) && down2 < this.height) {
                    boolean atLeastOneBlackPointFoundOnBorder3 = atLeastOneBlackPointFoundOnBorder;
                    bottomBorderNotWhite = containsBlackPoint(left2, right2, down2, true);
                    if (bottomBorderNotWhite) {
                        down2++;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnBottom = true;
                    } else if (!atLeastOneBlackPointFoundOnBottom) {
                        down2++;
                    }
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder3;
                }
            }
            if (down2 >= this.height) {
                sizeExceeded = true;
                break;
            }
            boolean leftBorderNotWhite = true;
            while (true) {
                if ((leftBorderNotWhite || !atLeastOneBlackPointFoundOnLeft) && left2 >= 0) {
                    boolean atLeastOneBlackPointFoundOnBorder4 = atLeastOneBlackPointFoundOnBorder;
                    leftBorderNotWhite = containsBlackPoint(up2, down2, left2, false);
                    if (leftBorderNotWhite) {
                        left2--;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnLeft = true;
                    } else if (!atLeastOneBlackPointFoundOnLeft) {
                        left2--;
                    }
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder4;
                }
            }
            if (left2 < 0) {
                sizeExceeded = true;
                break;
            }
            boolean topBorderNotWhite = true;
            while (true) {
                if ((topBorderNotWhite || !atLeastOneBlackPointFoundOnTop) && up2 >= 0) {
                    boolean atLeastOneBlackPointFoundOnBorder5 = atLeastOneBlackPointFoundOnBorder;
                    topBorderNotWhite = containsBlackPoint(left2, right2, up2, true);
                    if (topBorderNotWhite) {
                        up2--;
                        aBlackPointFoundOnBorder = true;
                        atLeastOneBlackPointFoundOnTop = true;
                    } else if (!atLeastOneBlackPointFoundOnTop) {
                        up2--;
                    }
                    atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder5;
                }
            }
            if (up2 < 0) {
                sizeExceeded = true;
                break;
            }
            boolean atLeastOneBlackPointFoundOnBorder6 = atLeastOneBlackPointFoundOnBorder;
            if (aBlackPointFoundOnBorder) {
                atLeastOneBlackPointFoundOnBorder = true;
            } else {
                atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder6;
            }
        }
        if (sizeExceeded || !atLeastOneBlackPointFoundOnBorder) {
            int i = right;
            int i2 = up;
            boolean z = sizeExceeded;
            boolean z2 = aBlackPointFoundOnBorder;
            boolean z3 = atLeastOneBlackPointFoundOnBorder;
            throw NotFoundException.getNotFoundInstance();
        }
        int maxSize = right - left;
        ResultPoint z4 = null;
        int i3 = 1;
        while (true) {
            if (i3 >= maxSize) {
                boolean z5 = sizeExceeded;
                boolean z6 = aBlackPointFoundOnBorder;
                boolean z7 = atLeastOneBlackPointFoundOnBorder;
                break;
            }
            boolean sizeExceeded2 = sizeExceeded;
            boolean aBlackPointFoundOnBorder2 = aBlackPointFoundOnBorder;
            boolean atLeastOneBlackPointFoundOnBorder7 = atLeastOneBlackPointFoundOnBorder;
            z4 = getBlackPointOnSegment((float) left, (float) (down - i3), (float) (left + i3), (float) down);
            if (z4 != null) {
                break;
            }
            int i4 = right;
            int i5 = up;
            i3++;
            sizeExceeded = sizeExceeded2;
            aBlackPointFoundOnBorder = aBlackPointFoundOnBorder2;
            atLeastOneBlackPointFoundOnBorder = atLeastOneBlackPointFoundOnBorder7;
        }
        if (z4 != null) {
            ResultPoint t = null;
            int i6 = 1;
            while (true) {
                if (i6 >= maxSize) {
                    int i7 = left;
                    break;
                }
                int left3 = left;
                t = getBlackPointOnSegment((float) left, (float) (up + i6), (float) (left + i6), (float) up);
                if (t != null) {
                    break;
                }
                int i8 = up;
                i6++;
                left = left3;
            }
            if (t != null) {
                ResultPoint x = null;
                for (int i9 = 1; i9 < maxSize; i9++) {
                    ResultPoint resultPoint = x;
                    x = getBlackPointOnSegment((float) right, (float) (up + i9), (float) (right - i9), (float) up);
                    if (x != null) {
                        break;
                    }
                    int i10 = up;
                }
                if (x != null) {
                    ResultPoint y = null;
                    int i11 = 1;
                    while (true) {
                        if (i11 >= maxSize) {
                            int i12 = right;
                            int i13 = up;
                            break;
                        }
                        int up3 = up;
                        int right3 = right;
                        y = getBlackPointOnSegment((float) right, (float) (down - i11), (float) (right - i11), (float) down);
                        if (y != null) {
                            break;
                        }
                        i11++;
                        up = up3;
                        right = right3;
                    }
                    if (y != null) {
                        return centerEdges(y, z4, x, t);
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
                int i14 = up;
                throw NotFoundException.getNotFoundInstance();
            }
            int i15 = up;
            throw NotFoundException.getNotFoundInstance();
        }
        int i16 = right;
        int i17 = up;
        throw NotFoundException.getNotFoundInstance();
    }

    private ResultPoint getBlackPointOnSegment(float aX, float aY, float bX, float bY) {
        int dist = MathUtils.round(MathUtils.distance(aX, aY, bX, bY));
        float xStep = (bX - aX) / ((float) dist);
        float yStep = (bY - aY) / ((float) dist);
        for (int i = 0; i < dist; i++) {
            int x = MathUtils.round((((float) i) * xStep) + aX);
            int y = MathUtils.round((((float) i) * yStep) + aY);
            if (this.image.get(x, y)) {
                return new ResultPoint((float) x, (float) y);
            }
        }
        return null;
    }

    private ResultPoint[] centerEdges(ResultPoint y, ResultPoint z, ResultPoint x, ResultPoint t) {
        float yi = y.getX();
        float yj = y.getY();
        float zi = z.getX();
        float zj = z.getY();
        float xi = x.getX();
        float xj = x.getY();
        float ti = t.getX();
        float tj = t.getY();
        if (yi < ((float) this.width) / 2.0f) {
            return new ResultPoint[]{new ResultPoint(ti - 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj + 1.0f), new ResultPoint(xi - 1.0f, xj - 1.0f), new ResultPoint(yi + 1.0f, yj - 1.0f)};
        }
        return new ResultPoint[]{new ResultPoint(ti + 1.0f, tj + 1.0f), new ResultPoint(zi + 1.0f, zj - 1.0f), new ResultPoint(xi - 1.0f, xj + 1.0f), new ResultPoint(yi - 1.0f, yj - 1.0f)};
    }

    private boolean containsBlackPoint(int a, int b, int fixed, boolean horizontal) {
        if (horizontal) {
            for (int x = a; x <= b; x++) {
                if (this.image.get(x, fixed)) {
                    return true;
                }
            }
        } else {
            for (int y = a; y <= b; y++) {
                if (this.image.get(fixed, y)) {
                    return true;
                }
            }
        }
        return false;
    }
}

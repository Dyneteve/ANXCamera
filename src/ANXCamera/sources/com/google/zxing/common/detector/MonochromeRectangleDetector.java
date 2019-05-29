package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix image2) {
        this.image = image2;
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int halfHeight = height / 2;
        int halfWidth = width / 2;
        int deltaY = Math.max(1, height / 256);
        int deltaX = Math.max(1, width / 256);
        int bottom = height;
        ResultPoint pointA = findCornerFromCenter(halfWidth, 0, 0, width, halfHeight, -deltaY, 0, bottom, halfWidth / 2);
        int top = ((int) pointA.getY()) - 1;
        int i = -deltaX;
        int deltaX2 = deltaX;
        int deltaX3 = halfWidth;
        int deltaY2 = deltaY;
        int i2 = width;
        int i3 = height;
        int height2 = halfHeight;
        int i4 = top;
        int i5 = bottom;
        ResultPoint pointB = findCornerFromCenter(deltaX3, i, 0, width, height2, 0, i4, i5, halfHeight / 2);
        int left = ((int) pointB.getX()) - 1;
        int i6 = left;
        ResultPoint pointC = findCornerFromCenter(deltaX3, deltaX2, i6, width, height2, 0, i4, i5, halfHeight / 2);
        int right = ((int) pointC.getX()) + 1;
        ResultPoint pointD = findCornerFromCenter(deltaX3, 0, i6, right, height2, deltaY2, i4, i5, halfWidth / 2);
        ResultPoint pointC2 = pointC;
        ResultPoint pointB2 = pointB;
        int i7 = deltaY2;
        ResultPoint resultPoint = pointA;
        return new ResultPoint[]{findCornerFromCenter(halfWidth, 0, left, right, halfHeight, -deltaY2, top, ((int) pointD.getY()) + 1, halfWidth / 4), pointB2, pointC2, pointD};
    }

    private ResultPoint findCornerFromCenter(int centerX, int deltaX, int left, int right, int centerY, int deltaY, int top, int bottom, int maxWhiteRun) throws NotFoundException {
        int[] range;
        int i = centerX;
        int i2 = centerY;
        int y = i2;
        int[] lastRange = null;
        int x = i;
        while (true) {
            int i3 = bottom;
            if (y >= i3) {
                int i4 = top;
                break;
            }
            int i5 = top;
            if (y < i5) {
                break;
            }
            int i6 = right;
            if (x >= i6) {
                break;
            }
            int i7 = left;
            if (x < i7) {
                break;
            }
            if (deltaX == 0) {
                range = blackWhiteRange(y, maxWhiteRun, i7, i6, true);
            } else {
                range = blackWhiteRange(x, maxWhiteRun, i5, i3, false);
            }
            int[] range2 = range;
            if (range2 != null) {
                lastRange = range2;
                y += deltaY;
                x += deltaX;
            } else if (lastRange == null) {
                throw NotFoundException.getNotFoundInstance();
            } else if (deltaX == 0) {
                int lastY = y - deltaY;
                if (lastRange[0] >= i) {
                    return new ResultPoint((float) lastRange[1], (float) lastY);
                }
                if (lastRange[1] <= i) {
                    return new ResultPoint((float) lastRange[0], (float) lastY);
                }
                return new ResultPoint((float) (deltaY > 0 ? lastRange[0] : lastRange[1]), (float) lastY);
            } else {
                int lastY2 = x - deltaX;
                if (lastRange[0] >= i2) {
                    return new ResultPoint((float) lastY2, (float) lastRange[1]);
                }
                if (lastRange[1] <= i2) {
                    return new ResultPoint((float) lastY2, (float) lastRange[0]);
                }
                return new ResultPoint((float) lastY2, (float) (deltaX < 0 ? lastRange[0] : lastRange[1]));
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0023  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x0036 A[EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  
EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0074 A[EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  
EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  , SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int[] blackWhiteRange(int fixedDimension, int maxWhiteRun, int minDim, int maxDim, boolean horizontal) {
        int end;
        int start;
        int center = (minDim + maxDim) / 2;
        int start2 = center;
        while (true) {
            if (start2 < minDim) {
                break;
            }
            if (!horizontal) {
                start = start2;
                while (true) {
                    start--;
                    if (start < minDim) {
                    }
                }
                int whiteRunSize = start2 - start;
                if (start < minDim) {
                    break;
                }
                break;
            }
            start = start2;
            while (true) {
                start--;
                if (start < minDim) {
                    break;
                } else if (horizontal) {
                    if (this.image.get(start, fixedDimension)) {
                        break;
                    }
                } else if (this.image.get(fixedDimension, start)) {
                    break;
                }
            }
            int whiteRunSize2 = start2 - start;
            if (start < minDim || whiteRunSize2 > maxWhiteRun) {
            } else {
                start2 = start;
            }
            start2--;
        }
        int start3 = start2 + 1;
        int end2 = center;
        while (true) {
            if (end2 >= maxDim) {
                break;
            }
            if (!horizontal) {
                end = end2;
                while (true) {
                    end++;
                    if (end >= maxDim) {
                    }
                }
                int whiteRunSize3 = end - end2;
                if (end >= maxDim) {
                    break;
                }
                break;
            }
            end = end2;
            while (true) {
                end++;
                if (end >= maxDim) {
                    break;
                } else if (horizontal) {
                    if (this.image.get(end, fixedDimension)) {
                        break;
                    }
                } else if (this.image.get(fixedDimension, end)) {
                    break;
                }
            }
            int whiteRunSize32 = end - end2;
            if (end >= maxDim || whiteRunSize32 > maxWhiteRun) {
            } else {
                end2 = end;
            }
            end2++;
        }
        int end3 = end2 - 1;
        if (end3 <= start3) {
            return null;
        }
        return new int[]{start3, end3};
    }
}

package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0023  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x0036 A[EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  
EDGE_INSN: B:53:0x0036->B:16:0x0036 ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0074 A[EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  
EDGE_INSN: B:67:0x0074->B:37:0x0074 ?: BREAK  , SYNTHETIC] */
    private int[] blackWhiteRange(int i, int i2, int i3, int i4, boolean z) {
        int i5;
        int i6;
        int i7 = (i3 + i4) / 2;
        int i8 = i7;
        while (true) {
            if (i8 < i3) {
                break;
            }
            if (!z) {
                i6 = i8;
                while (true) {
                    i6--;
                    if (i6 < i3) {
                    }
                }
                int i9 = i8 - i6;
                if (i6 < i3) {
                    break;
                }
                break;
            }
            i6 = i8;
            while (true) {
                i6--;
                if (i6 < i3) {
                    break;
                } else if (z) {
                    if (this.image.get(i6, i)) {
                        break;
                    }
                } else if (this.image.get(i, i6)) {
                    break;
                }
            }
            int i92 = i8 - i6;
            if (i6 < i3 || i92 > i2) {
                int i10 = i8;
            } else {
                i8 = i6;
            }
            i8--;
        }
        int i102 = i8;
        int i11 = i8 + 1;
        int i12 = i7;
        while (true) {
            if (i12 >= i4) {
                break;
            }
            if (!z) {
                i5 = i12;
                while (true) {
                    i5++;
                    if (i5 >= i4) {
                    }
                }
                int i13 = i5 - i12;
                if (i5 >= i4) {
                    break;
                }
                break;
            }
            i5 = i12;
            while (true) {
                i5++;
                if (i5 >= i4) {
                    break;
                } else if (z) {
                    if (this.image.get(i5, i)) {
                        break;
                    }
                } else if (this.image.get(i, i5)) {
                    break;
                }
            }
            int i132 = i5 - i12;
            if (i5 >= i4 || i132 > i2) {
                int i14 = i12;
            } else {
                i12 = i5;
            }
            i12++;
        }
        int i142 = i12;
        int i15 = i12 - 1;
        if (i15 <= i11) {
            return null;
        }
        return new int[]{i11, i15};
    }

    private ResultPoint findCornerFromCenter(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) throws NotFoundException {
        int i10 = i;
        int i11 = i5;
        int i12 = i11;
        int[] iArr = null;
        int i13 = i10;
        while (true) {
            int i14 = i8;
            if (i12 >= i14) {
                int i15 = i7;
                break;
            }
            int i16 = i7;
            if (i12 < i16) {
                break;
            }
            int i17 = i4;
            if (i13 >= i17) {
                break;
            }
            int i18 = i3;
            if (i13 < i18) {
                break;
            }
            int[] blackWhiteRange = i2 == 0 ? blackWhiteRange(i12, i9, i18, i17, true) : blackWhiteRange(i13, i9, i16, i14, false);
            if (blackWhiteRange != null) {
                iArr = blackWhiteRange;
                i12 += i6;
                i13 += i2;
            } else if (iArr == null) {
                throw NotFoundException.getNotFoundInstance();
            } else if (i2 == 0) {
                int i19 = i12 - i6;
                if (iArr[0] >= i10) {
                    return new ResultPoint((float) iArr[1], (float) i19);
                }
                if (iArr[1] <= i10) {
                    return new ResultPoint((float) iArr[0], (float) i19);
                }
                return new ResultPoint((float) (i6 > 0 ? iArr[0] : iArr[1]), (float) i19);
            } else {
                int i20 = i13 - i2;
                if (iArr[0] >= i11) {
                    return new ResultPoint((float) i20, (float) iArr[1]);
                }
                if (iArr[1] <= i11) {
                    return new ResultPoint((float) i20, (float) iArr[0]);
                }
                return new ResultPoint((float) i20, (float) (i2 < 0 ? iArr[0] : iArr[1]));
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int i = height / 2;
        int i2 = width / 2;
        int max = Math.max(1, height / 256);
        int max2 = Math.max(1, width / 256);
        int i3 = height;
        ResultPoint findCornerFromCenter = findCornerFromCenter(i2, 0, 0, width, i, -max, 0, i3, i2 / 2);
        int y = ((int) findCornerFromCenter.getY()) - 1;
        int i4 = -max2;
        int i5 = max2;
        int i6 = i2;
        int i7 = max;
        int i8 = width;
        int i9 = height;
        int i10 = i;
        int i11 = y;
        int i12 = i3;
        ResultPoint findCornerFromCenter2 = findCornerFromCenter(i6, i4, 0, width, i10, 0, i11, i12, i / 2);
        int x = ((int) findCornerFromCenter2.getX()) - 1;
        int i13 = x;
        ResultPoint findCornerFromCenter3 = findCornerFromCenter(i6, i5, i13, width, i10, 0, i11, i12, i / 2);
        int x2 = ((int) findCornerFromCenter3.getX()) + 1;
        ResultPoint findCornerFromCenter4 = findCornerFromCenter(i6, 0, i13, x2, i10, i7, i11, i12, i2 / 2);
        ResultPoint resultPoint = findCornerFromCenter3;
        ResultPoint resultPoint2 = findCornerFromCenter2;
        int i14 = i7;
        ResultPoint resultPoint3 = findCornerFromCenter;
        return new ResultPoint[]{findCornerFromCenter(i2, 0, x, x2, i, -i7, y, ((int) findCornerFromCenter4.getY()) + 1, i2 / 4), resultPoint2, resultPoint, findCornerFromCenter4};
    }
}

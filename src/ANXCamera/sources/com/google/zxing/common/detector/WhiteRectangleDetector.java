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

    public WhiteRectangleDetector(BitMatrix bitMatrix) throws NotFoundException {
        this(bitMatrix, 10, bitMatrix.getWidth() / 2, bitMatrix.getHeight() / 2);
    }

    public WhiteRectangleDetector(BitMatrix bitMatrix, int i, int i2, int i3) throws NotFoundException {
        this.image = bitMatrix;
        this.height = bitMatrix.getHeight();
        this.width = bitMatrix.getWidth();
        int i4 = i / 2;
        this.leftInit = i2 - i4;
        this.rightInit = i2 + i4;
        this.upInit = i3 - i4;
        this.downInit = i3 + i4;
        if (this.upInit < 0 || this.leftInit < 0 || this.downInit >= this.height || this.rightInit >= this.width) {
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private ResultPoint[] centerEdges(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4) {
        float x = resultPoint.getX();
        float y = resultPoint.getY();
        float x2 = resultPoint2.getX();
        float y2 = resultPoint2.getY();
        float x3 = resultPoint3.getX();
        float y3 = resultPoint3.getY();
        float x4 = resultPoint4.getX();
        float y4 = resultPoint4.getY();
        if (x < ((float) this.width) / 2.0f) {
            return new ResultPoint[]{new ResultPoint(x4 - 1.0f, y4 + 1.0f), new ResultPoint(x2 + 1.0f, y2 + 1.0f), new ResultPoint(x3 - 1.0f, y3 - 1.0f), new ResultPoint(x + 1.0f, y - 1.0f)};
        }
        return new ResultPoint[]{new ResultPoint(x4 + 1.0f, y4 + 1.0f), new ResultPoint(x2 + 1.0f, y2 - 1.0f), new ResultPoint(x3 - 1.0f, y3 + 1.0f), new ResultPoint(x - 1.0f, y - 1.0f)};
    }

    private boolean containsBlackPoint(int i, int i2, int i3, boolean z) {
        if (z) {
            for (int i4 = i; i4 <= i2; i4++) {
                if (this.image.get(i4, i3)) {
                    return true;
                }
            }
        } else {
            for (int i5 = i; i5 <= i2; i5++) {
                if (this.image.get(i3, i5)) {
                    return true;
                }
            }
        }
        return false;
    }

    private ResultPoint getBlackPointOnSegment(float f, float f2, float f3, float f4) {
        int round = MathUtils.round(MathUtils.distance(f, f2, f3, f4));
        float f5 = (f3 - f) / ((float) round);
        float f6 = (f4 - f2) / ((float) round);
        for (int i = 0; i < round; i++) {
            int round2 = MathUtils.round((((float) i) * f5) + f);
            int round3 = MathUtils.round((((float) i) * f6) + f2);
            if (this.image.get(round2, round3)) {
                return new ResultPoint((float) round2, (float) round3);
            }
        }
        return null;
    }

    public ResultPoint[] detect() throws NotFoundException {
        int i;
        int i2;
        int i3;
        int i4;
        int i5 = this.leftInit;
        int i6 = this.rightInit;
        int i7 = this.upInit;
        int i8 = this.downInit;
        boolean z = false;
        boolean z2 = true;
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        boolean z7 = false;
        while (true) {
            if (!z2) {
                break;
            }
            z2 = false;
            boolean z8 = true;
            while (true) {
                if ((z8 || !z4) && i6 < this.width) {
                    boolean z9 = z3;
                    z8 = containsBlackPoint(i7, i8, i6, false);
                    if (z8) {
                        i6++;
                        z2 = true;
                        z4 = true;
                    } else if (!z4) {
                        i6++;
                    }
                    z3 = z9;
                }
            }
            if (i6 >= this.width) {
                z = true;
                break;
            }
            boolean z10 = true;
            while (true) {
                if ((z10 || !z5) && i8 < this.height) {
                    boolean z11 = z3;
                    z10 = containsBlackPoint(i5, i6, i8, true);
                    if (z10) {
                        i8++;
                        z2 = true;
                        z5 = true;
                    } else if (!z5) {
                        i8++;
                    }
                    z3 = z11;
                }
            }
            if (i8 >= this.height) {
                z = true;
                break;
            }
            boolean z12 = true;
            while (true) {
                if ((z12 || !z6) && i5 >= 0) {
                    boolean z13 = z3;
                    z12 = containsBlackPoint(i7, i8, i5, false);
                    if (z12) {
                        i5--;
                        z2 = true;
                        z6 = true;
                    } else if (!z6) {
                        i5--;
                    }
                    z3 = z13;
                }
            }
            if (i5 < 0) {
                z = true;
                break;
            }
            boolean z14 = true;
            while (true) {
                if ((z14 || !z7) && i7 >= 0) {
                    boolean z15 = z3;
                    z14 = containsBlackPoint(i5, i6, i7, true);
                    if (z14) {
                        i7--;
                        z2 = true;
                        z7 = true;
                    } else if (!z7) {
                        i7--;
                    }
                    z3 = z15;
                }
            }
            if (i7 < 0) {
                z = true;
                break;
            }
            z3 = z2 ? true : z3;
        }
        if (z || !z3) {
            int i9 = i4;
            int i10 = i3;
            int i11 = i2;
            boolean z16 = z;
            boolean z17 = z2;
            boolean z18 = z3;
            throw NotFoundException.getNotFoundInstance();
        }
        int i12 = i3 - i4;
        ResultPoint resultPoint = null;
        int i13 = 1;
        while (true) {
            if (i13 >= i12) {
                boolean z19 = z;
                boolean z20 = z2;
                boolean z21 = z3;
                break;
            }
            boolean z22 = z;
            boolean z23 = z2;
            boolean z24 = z3;
            resultPoint = getBlackPointOnSegment((float) i4, (float) (i - i13), (float) (i4 + i13), (float) i);
            if (resultPoint != null) {
                break;
            }
            int i14 = i4;
            int i15 = i3;
            int i16 = i2;
            i13++;
            z = z22;
            z2 = z23;
            z3 = z24;
        }
        if (resultPoint != null) {
            ResultPoint resultPoint2 = null;
            int i17 = 1;
            while (true) {
                if (i17 >= i12) {
                    int i18 = i4;
                    break;
                }
                int i19 = i4;
                resultPoint2 = getBlackPointOnSegment((float) i4, (float) (i2 + i17), (float) (i4 + i17), (float) i2);
                if (resultPoint2 != null) {
                    break;
                }
                int i20 = i3;
                int i21 = i2;
                i17++;
                i4 = i19;
            }
            if (resultPoint2 != null) {
                ResultPoint resultPoint3 = null;
                for (int i22 = 1; i22 < i12; i22++) {
                    ResultPoint resultPoint4 = resultPoint3;
                    resultPoint3 = getBlackPointOnSegment((float) i3, (float) (i2 + i22), (float) (i3 - i22), (float) i2);
                    if (resultPoint3 != null) {
                        break;
                    }
                    int i23 = i3;
                    int i24 = i2;
                }
                if (resultPoint3 != null) {
                    ResultPoint resultPoint5 = null;
                    int i25 = 1;
                    while (true) {
                        if (i25 >= i12) {
                            int i26 = i3;
                            int i27 = i2;
                            break;
                        }
                        int i28 = i2;
                        int i29 = i3;
                        resultPoint5 = getBlackPointOnSegment((float) i3, (float) (i - i25), (float) (i3 - i25), (float) i);
                        if (resultPoint5 != null) {
                            break;
                        }
                        i25++;
                        i2 = i28;
                        i3 = i29;
                    }
                    if (resultPoint5 != null) {
                        return centerEdges(resultPoint5, resultPoint, resultPoint3, resultPoint2);
                    }
                    throw NotFoundException.getNotFoundInstance();
                }
                int i30 = i3;
                int i31 = i2;
                throw NotFoundException.getNotFoundInstance();
            }
            int i32 = i3;
            int i33 = i2;
            throw NotFoundException.getNotFoundInstance();
        }
        int i34 = i4;
        int i35 = i3;
        int i36 = i2;
        throw NotFoundException.getNotFoundInstance();
    }
}

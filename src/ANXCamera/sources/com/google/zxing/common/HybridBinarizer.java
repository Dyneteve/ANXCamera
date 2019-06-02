package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;
import java.lang.reflect.Array;

public final class HybridBinarizer extends GlobalHistogramBinarizer {
    private static final int BLOCK_SIZE = 8;
    private static final int BLOCK_SIZE_MASK = 7;
    private static final int BLOCK_SIZE_POWER = 3;
    private static final int MINIMUM_DIMENSION = 40;
    private static final int MIN_DYNAMIC_RANGE = 24;
    private BitMatrix matrix;

    public HybridBinarizer(LuminanceSource luminanceSource) {
        super(luminanceSource);
    }

    private static int[][] calculateBlackPoints(byte[] bArr, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8 = i;
        int i9 = i2;
        int[][] iArr = (int[][]) Array.newInstance(int.class, new int[]{i9, i8});
        for (int i10 = 0; i10 < i9; i10++) {
            int i11 = i10 << 3;
            int i12 = i4 - 8;
            if (i11 > i12) {
                i11 = i12;
            }
            int i13 = 0;
            while (i13 < i8) {
                int i14 = i13 << 3;
                int i15 = i3 - 8;
                if (i14 > i15) {
                    i14 = i15;
                }
                int i16 = 0;
                byte b = -1;
                byte b2 = 0;
                int i17 = 0;
                int i18 = (i11 * i3) + i14;
                while (true) {
                    int i19 = 8;
                    if (i17 >= 8) {
                        break;
                    }
                    int i20 = i16;
                    int i21 = 0;
                    while (i21 < i19) {
                        int i22 = i19;
                        byte b3 = bArr[i18 + i21] & -1;
                        i20 += b3;
                        if (b3 < b) {
                            b = b3;
                        }
                        if (b3 > b2) {
                            b2 = b3;
                        }
                        i21++;
                        i19 = i22;
                        int i23 = i2;
                    }
                    if (b2 - b > 24) {
                        int i24 = i17 + 1;
                        i7 = i18 + i3;
                        while (true) {
                            if (i24 >= 8) {
                                break;
                            }
                            int i25 = 0;
                            for (int i26 = 8; i25 < i26; i26 = 8) {
                                i20 += bArr[i7 + i25] & -1;
                                i25++;
                            }
                            i24++;
                            i7 += i3;
                            int i27 = i2;
                        }
                        i17 = i24;
                    } else {
                        i7 = i18;
                    }
                    i17++;
                    i18 = i7 + i3;
                    i16 = i6;
                    int i28 = i;
                    i9 = i2;
                }
                int i29 = i16 >> 6;
                if (b2 - b <= 24) {
                    i5 = b / 2;
                    if (i10 > 0 && i13 > 0) {
                        int i30 = ((iArr[i10 - 1][i13] + (2 * iArr[i10][i13 - 1])) + iArr[i10 - 1][i13 - 1]) / 4;
                        if (b < i30) {
                            i5 = i30;
                        }
                    }
                } else {
                    i5 = i29;
                }
                iArr[i10][i13] = i5;
                i13++;
                i8 = i;
            }
        }
        return iArr;
    }

    private static void calculateThresholdForBlock(byte[] bArr, int i, int i2, int i3, int i4, int[][] iArr, BitMatrix bitMatrix) {
        int i5 = i;
        int i6 = i2;
        for (int i7 = 0; i7 < i6; i7++) {
            int i8 = i7 << 3;
            int i9 = i4 - 8;
            if (i8 > i9) {
                i8 = i9;
            }
            for (int i10 = 0; i10 < i5; i10++) {
                int i11 = i10 << 3;
                int i12 = i3 - 8;
                if (i11 > i12) {
                    i11 = i12;
                }
                int i13 = i11;
                int cap = cap(i10, 2, i5 - 3);
                int cap2 = cap(i7, 2, i6 - 3);
                int i14 = 0;
                for (int i15 = -2; i15 <= 2; i15++) {
                    int[] iArr2 = iArr[cap2 + i15];
                    i14 += iArr2[cap - 2] + iArr2[cap - 1] + iArr2[cap] + iArr2[cap + 1] + iArr2[cap + 2];
                }
                thresholdBlock(bArr, i13, i8, i14 / 25, i3, bitMatrix);
            }
        }
    }

    private static int cap(int i, int i2, int i3) {
        return i < i2 ? i2 : i > i3 ? i3 : i;
    }

    private static void thresholdBlock(byte[] bArr, int i, int i2, int i3, int i4, BitMatrix bitMatrix) {
        int i5 = 0;
        int i6 = (i2 * i4) + i;
        while (i5 < 8) {
            for (int i7 = 0; i7 < 8; i7++) {
                if ((bArr[i6 + i7] & -1) <= i3) {
                    bitMatrix.set(i + i7, i2 + i5);
                }
            }
            i5++;
            i6 += i4;
        }
    }

    public Binarizer createBinarizer(LuminanceSource luminanceSource) {
        return new HybridBinarizer(luminanceSource);
    }

    public BitMatrix getBlackMatrix() throws NotFoundException {
        if (this.matrix != null) {
            return this.matrix;
        }
        LuminanceSource luminanceSource = getLuminanceSource();
        int width = luminanceSource.getWidth();
        int height = luminanceSource.getHeight();
        if (width < 40 || height < 40) {
            this.matrix = super.getBlackMatrix();
        } else {
            byte[] matrix2 = luminanceSource.getMatrix();
            int i = width >> 3;
            if ((width & 7) != 0) {
                i++;
            }
            int i2 = i;
            int i3 = height >> 3;
            if ((height & 7) != 0) {
                i3++;
            }
            int i4 = i3;
            int[][] calculateBlackPoints = calculateBlackPoints(matrix2, i2, i4, width, height);
            BitMatrix bitMatrix = new BitMatrix(width, height);
            calculateThresholdForBlock(matrix2, i2, i4, width, height, calculateBlackPoints, bitMatrix);
            this.matrix = bitMatrix;
        }
        return this.matrix;
    }
}

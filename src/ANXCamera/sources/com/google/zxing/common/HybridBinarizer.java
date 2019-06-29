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
        int i7 = i;
        int i8 = i2;
        int[][] iArr = (int[][]) Array.newInstance(int.class, new int[]{i8, i7});
        for (int i9 = 0; i9 < i8; i9++) {
            int i10 = i9 << 3;
            int i11 = i4 - 8;
            if (i10 > i11) {
                i10 = i11;
            }
            int i12 = 0;
            while (i12 < i7) {
                int i13 = i12 << 3;
                int i14 = i3 - 8;
                if (i13 > i14) {
                    i13 = i14;
                }
                int i15 = 0;
                byte b = 255;
                byte b2 = 0;
                int i16 = 0;
                int i17 = (i10 * i3) + i13;
                while (true) {
                    int i18 = 8;
                    if (i16 >= 8) {
                        break;
                    }
                    int i19 = i15;
                    int i20 = 0;
                    while (i20 < i18) {
                        int i21 = i18;
                        byte b3 = bArr[i17 + i20] & 255;
                        i19 += b3;
                        if (b3 < b) {
                            b = b3;
                        }
                        if (b3 > b2) {
                            b2 = b3;
                        }
                        i20++;
                        i18 = i21;
                        int i22 = i2;
                    }
                    if (b2 - b > 24) {
                        int i23 = i16 + 1;
                        i6 = i17 + i3;
                        while (true) {
                            if (i23 >= 8) {
                                break;
                            }
                            int i24 = 0;
                            for (int i25 = 8; i24 < i25; i25 = 8) {
                                i19 += bArr[i6 + i24] & 255;
                                i24++;
                            }
                            i23++;
                            i6 += i3;
                            int i26 = i2;
                        }
                        i16 = i23;
                    } else {
                        i6 = i17;
                    }
                    i16++;
                    i17 = i6 + i3;
                    i15 = i19;
                    int i27 = i;
                    i8 = i2;
                }
                int i28 = i15 >> 6;
                if (b2 - b <= 24) {
                    i5 = b / 2;
                    if (i9 > 0 && i12 > 0) {
                        int i29 = ((iArr[i9 - 1][i12] + (2 * iArr[i9][i12 - 1])) + iArr[i9 - 1][i12 - 1]) / 4;
                        if (b < i29) {
                            i5 = i29;
                        }
                    }
                } else {
                    i5 = i28;
                }
                iArr[i9][i12] = i5;
                i12++;
                i7 = i;
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
                if ((bArr[i6 + i7] & 255) <= i3) {
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

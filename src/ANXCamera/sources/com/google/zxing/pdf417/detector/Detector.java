package com.google.zxing.pdf417.detector;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public final class Detector {
    private static final int BARCODE_MIN_HEIGHT = 10;
    private static final int[] INDEXES_START_PATTERN;
    private static final int[] INDEXES_STOP_PATTERN = {6, 2, 7, 3};
    private static final float MAX_AVG_VARIANCE = 0.42f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.8f;
    private static final int MAX_PATTERN_DRIFT = 5;
    private static final int MAX_PIXEL_DRIFT = 3;
    private static final int ROW_STEP = 5;
    private static final int SKIPPED_ROW_COUNT_MAX = 25;
    private static final int[] START_PATTERN = {8, 1, 1, 1, 1, 1, 1, 3};
    private static final int[] STOP_PATTERN = {7, 1, 1, 3, 1, 1, 1, 2, 1};

    static {
        int[] iArr = new int[4];
        iArr[1] = 4;
        iArr[2] = 1;
        iArr[3] = 5;
        INDEXES_START_PATTERN = iArr;
    }

    private Detector() {
    }

    private static void copyToResult(ResultPoint[] resultPointArr, ResultPoint[] resultPointArr2, int[] iArr) {
        for (int i = 0; i < iArr.length; i++) {
            resultPointArr[iArr[i]] = resultPointArr2[i];
        }
    }

    public static PDF417DetectorResult detect(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map, boolean z) throws NotFoundException {
        BitMatrix blackMatrix = binaryBitmap.getBlackMatrix();
        List detect = detect(z, blackMatrix);
        if (detect.isEmpty()) {
            blackMatrix = blackMatrix.clone();
            blackMatrix.rotate180();
            detect = detect(z, blackMatrix);
        }
        return new PDF417DetectorResult(blackMatrix, detect);
    }

    private static List<ResultPoint[]> detect(boolean z, BitMatrix bitMatrix) {
        ArrayList<ResultPoint[]> arrayList = new ArrayList<>();
        int i = 0;
        int i2 = 0;
        boolean z2 = false;
        while (i < bitMatrix.getHeight()) {
            ResultPoint[] findVertices = findVertices(bitMatrix, i, i2);
            if (findVertices[0] != null || findVertices[3] != null) {
                z2 = true;
                arrayList.add(findVertices);
                if (!z) {
                    break;
                } else if (findVertices[2] != null) {
                    i2 = (int) findVertices[2].getX();
                    i = (int) findVertices[2].getY();
                } else {
                    i2 = (int) findVertices[4].getX();
                    i = (int) findVertices[4].getY();
                }
            } else if (!z2) {
                break;
            } else {
                for (ResultPoint[] resultPointArr : arrayList) {
                    if (resultPointArr[1] != null) {
                        i = (int) Math.max((float) i, resultPointArr[1].getY());
                    }
                    if (resultPointArr[3] != null) {
                        i = Math.max(i, (int) resultPointArr[3].getY());
                    }
                }
                i += 5;
                z2 = false;
                i2 = 0;
            }
        }
        return arrayList;
    }

    /* JADX WARNING: type inference failed for: r5v0 */
    /* JADX WARNING: type inference failed for: r5v1 */
    /* JADX WARNING: type inference failed for: r11v3 */
    /* JADX WARNING: type inference failed for: r5v4 */
    /* JADX WARNING: type inference failed for: r11v10 */
    /* JADX WARNING: type inference failed for: r5v15 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 2 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int[] findGuardPattern(BitMatrix bitMatrix, int i, int i2, int i3, boolean z, int[] iArr, int[] iArr2) {
        int i4;
        boolean z2;
        BitMatrix bitMatrix2 = bitMatrix;
        int i5 = i2;
        int[] iArr3 = iArr;
        int[] iArr4 = iArr2;
        ? r5 = 0;
        Arrays.fill(iArr4, 0, iArr4.length, 0);
        int length = iArr3.length;
        boolean z3 = z;
        int i6 = i;
        int i7 = 0;
        while (true) {
            if (!bitMatrix2.get(i4, i5) || i4 <= 0) {
                break;
            }
            int i8 = i7 + 1;
            if (i7 >= 3) {
                int i9 = i8;
                break;
            }
            i6 = i4 - 1;
            i7 = i8;
        }
        int i10 = i4;
        int i11 = 0;
        ? r52 = r5;
        while (i10 < i3) {
            if (bitMatrix2.get(i10, i5) ^ z3) {
                iArr4[i11] = iArr4[i11] + 1;
                z2 = r52;
            } else {
                if (i11 != length - 1) {
                    z2 = false;
                    i11++;
                } else if (patternMatchVariance(iArr4, iArr3, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{i4, i10};
                } else {
                    z2 = false;
                    i4 += iArr4[0] + iArr4[1];
                    System.arraycopy(iArr4, 2, iArr4, 0, length - 2);
                    iArr4[length - 2] = 0;
                    iArr4[length - 1] = 0;
                    i11--;
                }
                boolean z4 = true;
                iArr4[i11] = 1;
                if (z3) {
                    z4 = z2;
                }
                z3 = z4;
            }
            i10++;
            r52 = z2;
        }
        if (i11 != length - 1 || patternMatchVariance(iArr4, iArr3, MAX_INDIVIDUAL_VARIANCE) >= MAX_AVG_VARIANCE) {
            return null;
        }
        int[] iArr5 = new int[2];
        iArr5[r52] = i4;
        iArr5[1] = i10 - 1;
        return iArr5;
    }

    private static ResultPoint[] findRowsWithPattern(BitMatrix bitMatrix, int i, int i2, int i3, int i4, int[] iArr) {
        int i5;
        int i6;
        char c;
        int i7 = i;
        ResultPoint[] resultPointArr = new ResultPoint[4];
        boolean z = false;
        int[] iArr2 = iArr;
        int[] iArr3 = new int[iArr2.length];
        int i8 = i3;
        while (true) {
            if (i8 >= i7) {
                break;
            }
            int[] findGuardPattern = findGuardPattern(bitMatrix, i4, i8, i2, false, iArr2, iArr3);
            if (findGuardPattern != null) {
                int[] iArr4 = findGuardPattern;
                while (true) {
                    if (i8 > 0) {
                        i8--;
                        int[] findGuardPattern2 = findGuardPattern(bitMatrix, i4, i8, i2, false, iArr2, iArr3);
                        if (findGuardPattern2 == null) {
                            i8++;
                            break;
                        }
                        iArr4 = findGuardPattern2;
                    } else {
                        break;
                    }
                }
                resultPointArr[0] = new ResultPoint((float) iArr4[0], (float) i8);
                resultPointArr[1] = new ResultPoint((float) iArr4[1], (float) i8);
                z = true;
            } else {
                i8 += 5;
            }
        }
        int i9 = i8 + 1;
        if (z) {
            int i10 = i9;
            int i11 = 0;
            int[] iArr5 = {(int) resultPointArr[0].getX(), (int) resultPointArr[1].getX()};
            while (true) {
                if (i10 >= i7) {
                    i5 = i11;
                    i6 = i10;
                    break;
                }
                i5 = i11;
                i6 = i10;
                int[] findGuardPattern3 = findGuardPattern(bitMatrix, iArr5[0], i10, i2, false, iArr2, iArr3);
                if (findGuardPattern3 != null && Math.abs(iArr5[0] - findGuardPattern3[0]) < 5 && Math.abs(iArr5[1] - findGuardPattern3[1]) < 5) {
                    iArr5 = findGuardPattern3;
                    i11 = 0;
                    c = 2;
                } else if (i5 > 25) {
                    break;
                } else {
                    c = 2;
                    i11 = i5 + 1;
                }
                i10 = i6 + 1;
                char c2 = c;
            }
            i9 = i6 - (i5 + 1);
            resultPointArr[2] = new ResultPoint((float) iArr5[0], (float) i9);
            resultPointArr[3] = new ResultPoint((float) iArr5[1], (float) i9);
        }
        if (i9 - i8 < 10) {
            for (int i12 = 0; i12 < resultPointArr.length; i12++) {
                resultPointArr[i12] = null;
            }
        }
        return resultPointArr;
    }

    private static ResultPoint[] findVertices(BitMatrix bitMatrix, int i, int i2) {
        int height = bitMatrix.getHeight();
        int width = bitMatrix.getWidth();
        ResultPoint[] resultPointArr = new ResultPoint[8];
        copyToResult(resultPointArr, findRowsWithPattern(bitMatrix, height, width, i, i2, START_PATTERN), INDEXES_START_PATTERN);
        if (resultPointArr[4] != null) {
            i2 = (int) resultPointArr[4].getX();
            i = (int) resultPointArr[4].getY();
        }
        copyToResult(resultPointArr, findRowsWithPattern(bitMatrix, height, width, i, i2, STOP_PATTERN), INDEXES_STOP_PATTERN);
        return resultPointArr;
    }

    private static float patternMatchVariance(int[] iArr, int[] iArr2, float f) {
        int length = iArr.length;
        int i = 0;
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            i += iArr[i3];
            i2 += iArr2[i3];
        }
        if (i < i2) {
            return Float.POSITIVE_INFINITY;
        }
        float f2 = ((float) i) / ((float) i2);
        float f3 = f * f2;
        float f4 = 0.0f;
        for (int i4 = 0; i4 < length; i4++) {
            int i5 = iArr[i4];
            float f5 = ((float) iArr2[i4]) * f2;
            float f6 = ((float) i5) > f5 ? ((float) i5) - f5 : f5 - ((float) i5);
            if (f6 > f3) {
                return Float.POSITIVE_INFINITY;
            }
            f4 += f6;
        }
        return f4 / ((float) i);
    }
}

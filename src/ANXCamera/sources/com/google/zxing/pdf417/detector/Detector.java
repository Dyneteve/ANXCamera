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

    public static PDF417DetectorResult detect(BinaryBitmap image, Map<DecodeHintType, ?> map, boolean multiple) throws NotFoundException {
        BitMatrix bitMatrix = image.getBlackMatrix();
        List<ResultPoint[]> barcodeCoordinates = detect(multiple, bitMatrix);
        if (barcodeCoordinates.isEmpty()) {
            bitMatrix = bitMatrix.clone();
            bitMatrix.rotate180();
            barcodeCoordinates = detect(multiple, bitMatrix);
        }
        return new PDF417DetectorResult(bitMatrix, barcodeCoordinates);
    }

    private static List<ResultPoint[]> detect(boolean multiple, BitMatrix bitMatrix) {
        List<ResultPoint[]> barcodeCoordinates = new ArrayList<>();
        int row = 0;
        int column = 0;
        boolean foundBarcodeInRow = false;
        while (row < bitMatrix.getHeight()) {
            ResultPoint[] vertices = findVertices(bitMatrix, row, column);
            if (vertices[0] != null || vertices[3] != null) {
                foundBarcodeInRow = true;
                barcodeCoordinates.add(vertices);
                if (!multiple) {
                    break;
                } else if (vertices[2] != null) {
                    column = (int) vertices[2].getX();
                    row = (int) vertices[2].getY();
                } else {
                    column = (int) vertices[4].getX();
                    row = (int) vertices[4].getY();
                }
            } else if (!foundBarcodeInRow) {
                break;
            } else {
                for (ResultPoint[] barcodeCoordinate : barcodeCoordinates) {
                    if (barcodeCoordinate[1] != null) {
                        row = (int) Math.max((float) row, barcodeCoordinate[1].getY());
                    }
                    if (barcodeCoordinate[3] != null) {
                        row = Math.max(row, (int) barcodeCoordinate[3].getY());
                    }
                }
                row += 5;
                foundBarcodeInRow = false;
                column = 0;
            }
        }
        return barcodeCoordinates;
    }

    private static ResultPoint[] findVertices(BitMatrix matrix, int startRow, int startColumn) {
        int height = matrix.getHeight();
        int width = matrix.getWidth();
        ResultPoint[] result = new ResultPoint[8];
        copyToResult(result, findRowsWithPattern(matrix, height, width, startRow, startColumn, START_PATTERN), INDEXES_START_PATTERN);
        if (result[4] != null) {
            startColumn = (int) result[4].getX();
            startRow = (int) result[4].getY();
        }
        copyToResult(result, findRowsWithPattern(matrix, height, width, startRow, startColumn, STOP_PATTERN), INDEXES_STOP_PATTERN);
        return result;
    }

    private static void copyToResult(ResultPoint[] result, ResultPoint[] tmpResult, int[] destinationIndexes) {
        for (int i = 0; i < destinationIndexes.length; i++) {
            result[destinationIndexes[i]] = tmpResult[i];
        }
    }

    private static ResultPoint[] findRowsWithPattern(BitMatrix matrix, int height, int width, int startRow, int startColumn, int[] pattern) {
        int skippedRowCount;
        int stopRow;
        char c;
        int i = height;
        ResultPoint[] result = new ResultPoint[4];
        boolean found = false;
        int[] iArr = pattern;
        int[] counters = new int[iArr.length];
        int startRow2 = startRow;
        while (true) {
            if (startRow2 >= i) {
                break;
            }
            int[] loc = findGuardPattern(matrix, startColumn, startRow2, width, false, iArr, counters);
            if (loc != null) {
                int[] loc2 = loc;
                while (true) {
                    if (startRow2 > 0) {
                        startRow2--;
                        int[] previousRowLoc = findGuardPattern(matrix, startColumn, startRow2, width, false, iArr, counters);
                        if (previousRowLoc == null) {
                            startRow2++;
                            break;
                        }
                        loc2 = previousRowLoc;
                    } else {
                        break;
                    }
                }
                result[0] = new ResultPoint((float) loc2[0], (float) startRow2);
                result[1] = new ResultPoint((float) loc2[1], (float) startRow2);
                found = true;
            } else {
                startRow2 += 5;
            }
        }
        int stopRow2 = startRow2 + 1;
        if (found) {
            int stopRow3 = stopRow2;
            int skippedRowCount2 = 0;
            int[] previousRowLoc2 = {(int) result[0].getX(), (int) result[1].getX()};
            while (true) {
                if (stopRow3 >= i) {
                    skippedRowCount = skippedRowCount2;
                    stopRow = stopRow3;
                    break;
                }
                skippedRowCount = skippedRowCount2;
                stopRow = stopRow3;
                int[] loc3 = findGuardPattern(matrix, previousRowLoc2[0], stopRow3, width, false, iArr, counters);
                if (loc3 != null && Math.abs(previousRowLoc2[0] - loc3[0]) < 5 && Math.abs(previousRowLoc2[1] - loc3[1]) < 5) {
                    previousRowLoc2 = loc3;
                    skippedRowCount2 = 0;
                    c = 2;
                } else if (skippedRowCount > 25) {
                    break;
                } else {
                    c = 2;
                    skippedRowCount2 = skippedRowCount + 1;
                }
                stopRow3 = stopRow + 1;
                char c2 = c;
            }
            stopRow2 = stopRow - (skippedRowCount + 1);
            result[2] = new ResultPoint((float) previousRowLoc2[0], (float) stopRow2);
            result[3] = new ResultPoint((float) previousRowLoc2[1], (float) stopRow2);
        }
        if (stopRow2 - startRow2 < 10) {
            for (int i2 = 0; i2 < result.length; i2++) {
                result[i2] = null;
            }
        }
        return result;
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
    private static int[] findGuardPattern(BitMatrix matrix, int column, int row, int width, boolean whiteFirst, int[] pattern, int[] counters) {
        int patternStart;
        boolean z;
        BitMatrix bitMatrix = matrix;
        int i = row;
        int[] iArr = pattern;
        int[] iArr2 = counters;
        ? r5 = 0;
        Arrays.fill(iArr2, 0, iArr2.length, 0);
        int patternLength = iArr.length;
        boolean isWhite = whiteFirst;
        int patternStart2 = column;
        int pixelDrift = 0;
        while (true) {
            if (!bitMatrix.get(patternStart, i) || patternStart <= 0) {
                break;
            }
            int pixelDrift2 = pixelDrift + 1;
            if (pixelDrift >= 3) {
                break;
            }
            patternStart2 = patternStart - 1;
            pixelDrift = pixelDrift2;
        }
        int x = patternStart;
        int counterPosition = 0;
        ? r52 = r5;
        while (x < width) {
            if (bitMatrix.get(x, i) ^ isWhite) {
                iArr2[counterPosition] = iArr2[counterPosition] + 1;
                z = r52;
            } else {
                if (counterPosition != patternLength - 1) {
                    z = false;
                    counterPosition++;
                } else if (patternMatchVariance(iArr2, iArr, MAX_INDIVIDUAL_VARIANCE) < MAX_AVG_VARIANCE) {
                    return new int[]{patternStart, x};
                } else {
                    z = false;
                    patternStart += iArr2[0] + iArr2[1];
                    System.arraycopy(iArr2, 2, iArr2, 0, patternLength - 2);
                    iArr2[patternLength - 2] = 0;
                    iArr2[patternLength - 1] = 0;
                    counterPosition--;
                }
                boolean z2 = true;
                iArr2[counterPosition] = 1;
                if (isWhite) {
                    z2 = z;
                }
                isWhite = z2;
            }
            x++;
            r52 = z;
        }
        if (counterPosition != patternLength - 1 || patternMatchVariance(iArr2, iArr, MAX_INDIVIDUAL_VARIANCE) >= MAX_AVG_VARIANCE) {
            return null;
        }
        int[] iArr3 = new int[2];
        iArr3[r52] = patternStart;
        iArr3[1] = x - 1;
        return iArr3;
    }

    private static float patternMatchVariance(int[] counters, int[] pattern, float maxIndividualVariance) {
        int numCounters = counters.length;
        int total = 0;
        int patternLength = 0;
        for (int i = 0; i < numCounters; i++) {
            total += counters[i];
            patternLength += pattern[i];
        }
        if (total < patternLength) {
            return Float.POSITIVE_INFINITY;
        }
        float unitBarWidth = ((float) total) / ((float) patternLength);
        float maxIndividualVariance2 = maxIndividualVariance * unitBarWidth;
        float totalVariance = 0.0f;
        for (int x = 0; x < numCounters; x++) {
            int counter = counters[x];
            float scaledPattern = ((float) pattern[x]) * unitBarWidth;
            float variance = ((float) counter) > scaledPattern ? ((float) counter) - scaledPattern : scaledPattern - ((float) counter);
            if (variance > maxIndividualVariance2) {
                return Float.POSITIVE_INFINITY;
            }
            totalVariance += variance;
        }
        return totalVariance / ((float) total);
    }
}

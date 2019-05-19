package com.google.zxing.pdf417.decoder;

import com.google.zxing.ChecksumException;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.pdf417.PDF417Common;
import com.google.zxing.pdf417.decoder.ec.ErrorCorrection;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Formatter;
import java.util.List;

public final class PDF417ScanningDecoder {
    private static final int CODEWORD_SKEW_SIZE = 2;
    private static final int MAX_EC_CODEWORDS = 512;
    private static final int MAX_ERRORS = 3;
    private static final ErrorCorrection errorCorrection = new ErrorCorrection();

    private PDF417ScanningDecoder() {
    }

    public static DecoderResult decode(BitMatrix image, ResultPoint imageTopLeft, ResultPoint imageBottomLeft, ResultPoint imageTopRight, ResultPoint imageBottomRight, int minCodewordWidth, int maxCodewordWidth) throws NotFoundException, FormatException, ChecksumException {
        DetectionResultRowIndicatorColumn rightRowIndicatorColumn;
        DetectionResultRowIndicatorColumn leftRowIndicatorColumn;
        DetectionResultColumn detectionResultColumn;
        int barcodeColumn;
        DetectionResultColumn detectionResultColumn2;
        BoundingBox boundingBox = new BoundingBox(image, imageTopLeft, imageBottomLeft, imageTopRight, imageBottomRight);
        DetectionResultRowIndicatorColumn leftRowIndicatorColumn2 = null;
        DetectionResultRowIndicatorColumn rightRowIndicatorColumn2 = null;
        DetectionResult detectionResult = null;
        int i = 0;
        while (true) {
            if (i >= 2) {
                break;
            }
            if (imageTopLeft != null) {
                leftRowIndicatorColumn2 = getRowIndicatorColumn(image, boundingBox, imageTopLeft, true, minCodewordWidth, maxCodewordWidth);
            }
            if (imageTopRight != null) {
                rightRowIndicatorColumn2 = getRowIndicatorColumn(image, boundingBox, imageTopRight, false, minCodewordWidth, maxCodewordWidth);
            }
            detectionResult = merge(leftRowIndicatorColumn2, rightRowIndicatorColumn2);
            if (detectionResult == null) {
                throw NotFoundException.getNotFoundInstance();
            } else if (i != 0 || detectionResult.getBoundingBox() == null || (detectionResult.getBoundingBox().getMinY() >= boundingBox.getMinY() && detectionResult.getBoundingBox().getMaxY() <= boundingBox.getMaxY())) {
                detectionResult.setBoundingBox(boundingBox);
            } else {
                boundingBox = detectionResult.getBoundingBox();
                i++;
            }
        }
        DetectionResultRowIndicatorColumn leftRowIndicatorColumn3 = leftRowIndicatorColumn;
        DetectionResultRowIndicatorColumn rightRowIndicatorColumn3 = rightRowIndicatorColumn;
        DetectionResult detectionResult2 = detectionResult;
        boolean z = true;
        int maxBarcodeColumn = detectionResult2.getBarcodeColumnCount() + 1;
        boolean z2 = false;
        detectionResult2.setDetectionResultColumn(0, leftRowIndicatorColumn3);
        detectionResult2.setDetectionResultColumn(maxBarcodeColumn, rightRowIndicatorColumn3);
        boolean leftToRight = leftRowIndicatorColumn3 != null;
        int barcodeColumnCount = 1;
        int imageRow = minCodewordWidth;
        int maxCodewordWidth2 = maxCodewordWidth;
        while (barcodeColumnCount <= maxBarcodeColumn) {
            int barcodeColumn2 = leftToRight ? barcodeColumnCount : maxBarcodeColumn - barcodeColumnCount;
            if (detectionResult2.getDetectionResultColumn(barcodeColumn2) == null) {
                if (barcodeColumn2 == 0 || barcodeColumn2 == maxBarcodeColumn) {
                    detectionResultColumn = new DetectionResultRowIndicatorColumn(boundingBox, barcodeColumn2 == 0 ? z : z2);
                } else {
                    detectionResultColumn = new DetectionResultColumn(boundingBox);
                }
                DetectionResultColumn detectionResultColumn3 = detectionResultColumn;
                detectionResult2.setDetectionResultColumn(barcodeColumn2, detectionResultColumn3);
                int minCodewordWidth2 = imageRow;
                int maxCodewordWidth3 = maxCodewordWidth2;
                int previousStartColumn = -1;
                int imageRow2 = boundingBox.getMinY();
                while (imageRow2 <= boundingBox.getMaxY()) {
                    int startColumn = getStartColumn(detectionResult2, barcodeColumn2, imageRow2, leftToRight);
                    if (startColumn < 0 || startColumn > boundingBox.getMaxX()) {
                        if (previousStartColumn == -1) {
                            int i2 = startColumn;
                            detectionResultColumn2 = detectionResultColumn3;
                            barcodeColumn = barcodeColumn2;
                            imageRow2++;
                            detectionResultColumn3 = detectionResultColumn2;
                            barcodeColumn2 = barcodeColumn;
                            z2 = false;
                        } else {
                            startColumn = previousStartColumn;
                        }
                    }
                    detectionResultColumn2 = detectionResultColumn3;
                    barcodeColumn = barcodeColumn2;
                    Codeword codeword = detectCodeword(image, boundingBox.getMinX(), boundingBox.getMaxX(), leftToRight, startColumn, imageRow2, minCodewordWidth2, maxCodewordWidth3);
                    if (codeword != null) {
                        detectionResultColumn2.setCodeword(imageRow2, codeword);
                        previousStartColumn = startColumn;
                        minCodewordWidth2 = Math.min(minCodewordWidth2, codeword.getWidth());
                        maxCodewordWidth3 = Math.max(maxCodewordWidth3, codeword.getWidth());
                        int i3 = startColumn;
                    } else {
                        int i4 = minCodewordWidth2;
                        int i5 = maxCodewordWidth3;
                        int i6 = startColumn;
                    }
                    imageRow2++;
                    detectionResultColumn3 = detectionResultColumn2;
                    barcodeColumn2 = barcodeColumn;
                    z2 = false;
                }
                imageRow = minCodewordWidth2;
                maxCodewordWidth2 = maxCodewordWidth3;
            }
            barcodeColumnCount++;
            z = true;
        }
        return createDecoderResult(detectionResult2);
    }

    private static DetectionResult merge(DetectionResultRowIndicatorColumn leftRowIndicatorColumn, DetectionResultRowIndicatorColumn rightRowIndicatorColumn) throws NotFoundException, FormatException {
        if (leftRowIndicatorColumn == null && rightRowIndicatorColumn == null) {
            return null;
        }
        BarcodeMetadata barcodeMetadata = getBarcodeMetadata(leftRowIndicatorColumn, rightRowIndicatorColumn);
        if (barcodeMetadata == null) {
            return null;
        }
        return new DetectionResult(barcodeMetadata, BoundingBox.merge(adjustBoundingBox(leftRowIndicatorColumn), adjustBoundingBox(rightRowIndicatorColumn)));
    }

    private static BoundingBox adjustBoundingBox(DetectionResultRowIndicatorColumn rowIndicatorColumn) throws NotFoundException, FormatException {
        if (rowIndicatorColumn == null) {
            return null;
        }
        int[] rowHeights = rowIndicatorColumn.getRowHeights();
        if (rowHeights == null) {
            return null;
        }
        int maxRowHeight = getMax(rowHeights);
        int missingStartRows = 0;
        for (int rowHeight : rowHeights) {
            missingStartRows += maxRowHeight - rowHeight;
            if (rowHeight > 0) {
                break;
            }
        }
        Codeword[] codewords = rowIndicatorColumn.getCodewords();
        int row = 0;
        int missingStartRows2 = missingStartRows;
        while (missingStartRows2 > 0 && codewords[row] == null) {
            missingStartRows2--;
            row++;
        }
        int missingEndRows = 0;
        for (int row2 = rowHeights.length - 1; row2 >= 0; row2--) {
            missingEndRows += maxRowHeight - rowHeights[row2];
            if (rowHeights[row2] > 0) {
                break;
            }
        }
        int row3 = codewords.length - 1;
        while (missingEndRows > 0 && codewords[row3] == null) {
            missingEndRows--;
            row3--;
        }
        return rowIndicatorColumn.getBoundingBox().addMissingRows(missingStartRows2, missingEndRows, rowIndicatorColumn.isLeft());
    }

    private static int getMax(int[] values) {
        int maxValue = -1;
        for (int value : values) {
            maxValue = Math.max(maxValue, value);
        }
        return maxValue;
    }

    private static BarcodeMetadata getBarcodeMetadata(DetectionResultRowIndicatorColumn leftRowIndicatorColumn, DetectionResultRowIndicatorColumn rightRowIndicatorColumn) {
        BarcodeMetadata barcodeMetadata = null;
        if (leftRowIndicatorColumn != null) {
            BarcodeMetadata barcodeMetadata2 = leftRowIndicatorColumn.getBarcodeMetadata();
            BarcodeMetadata leftBarcodeMetadata = barcodeMetadata2;
            if (barcodeMetadata2 != null) {
                if (rightRowIndicatorColumn != null) {
                    BarcodeMetadata barcodeMetadata3 = rightRowIndicatorColumn.getBarcodeMetadata();
                    BarcodeMetadata rightBarcodeMetadata = barcodeMetadata3;
                    if (barcodeMetadata3 == null || leftBarcodeMetadata.getColumnCount() == rightBarcodeMetadata.getColumnCount() || leftBarcodeMetadata.getErrorCorrectionLevel() == rightBarcodeMetadata.getErrorCorrectionLevel() || leftBarcodeMetadata.getRowCount() == rightBarcodeMetadata.getRowCount()) {
                        return leftBarcodeMetadata;
                    }
                    return null;
                }
                return leftBarcodeMetadata;
            }
        }
        if (rightRowIndicatorColumn != null) {
            barcodeMetadata = rightRowIndicatorColumn.getBarcodeMetadata();
        }
        return barcodeMetadata;
    }

    private static DetectionResultRowIndicatorColumn getRowIndicatorColumn(BitMatrix image, BoundingBox boundingBox, ResultPoint startPoint, boolean leftToRight, int minCodewordWidth, int maxCodewordWidth) {
        boolean z = leftToRight;
        DetectionResultRowIndicatorColumn rowIndicatorColumn = new DetectionResultRowIndicatorColumn(boundingBox, z);
        int i = 0;
        while (i < 2) {
            int increment = i == 0 ? 1 : -1;
            int startColumn = (int) startPoint.getX();
            int imageRow = (int) startPoint.getY();
            while (imageRow <= boundingBox.getMaxY() && imageRow >= boundingBox.getMinY()) {
                Codeword codeword = detectCodeword(image, 0, image.getWidth(), z, startColumn, imageRow, minCodewordWidth, maxCodewordWidth);
                if (codeword != null) {
                    rowIndicatorColumn.setCodeword(imageRow, codeword);
                    if (z) {
                        startColumn = codeword.getStartX();
                    } else {
                        startColumn = codeword.getEndX();
                    }
                }
                imageRow += increment;
            }
            i++;
        }
        return rowIndicatorColumn;
    }

    private static void adjustCodewordCount(DetectionResult detectionResult, BarcodeValue[][] barcodeMatrix) throws NotFoundException {
        int[] numberOfCodewords = barcodeMatrix[0][1].getValue();
        int calculatedNumberOfCodewords = (detectionResult.getBarcodeColumnCount() * detectionResult.getBarcodeRowCount()) - getNumberOfECCodeWords(detectionResult.getBarcodeECLevel());
        if (numberOfCodewords.length == 0) {
            if (calculatedNumberOfCodewords < 1 || calculatedNumberOfCodewords > 928) {
                throw NotFoundException.getNotFoundInstance();
            }
            barcodeMatrix[0][1].setValue(calculatedNumberOfCodewords);
        } else if (numberOfCodewords[0] != calculatedNumberOfCodewords) {
            barcodeMatrix[0][1].setValue(calculatedNumberOfCodewords);
        }
    }

    private static DecoderResult createDecoderResult(DetectionResult detectionResult) throws FormatException, ChecksumException, NotFoundException {
        BarcodeValue[][] barcodeMatrix = createBarcodeMatrix(detectionResult);
        adjustCodewordCount(detectionResult, barcodeMatrix);
        Collection<Integer> erasures = new ArrayList<>();
        int[] codewords = new int[(detectionResult.getBarcodeRowCount() * detectionResult.getBarcodeColumnCount())];
        List<int[]> ambiguousIndexValuesList = new ArrayList<>();
        List<Integer> ambiguousIndexesList = new ArrayList<>();
        for (int row = 0; row < detectionResult.getBarcodeRowCount(); row++) {
            for (int column = 0; column < detectionResult.getBarcodeColumnCount(); column++) {
                int[] values = barcodeMatrix[row][column + 1].getValue();
                int codewordIndex = (detectionResult.getBarcodeColumnCount() * row) + column;
                if (values.length == 0) {
                    erasures.add(Integer.valueOf(codewordIndex));
                } else if (values.length == 1) {
                    codewords[codewordIndex] = values[0];
                } else {
                    ambiguousIndexesList.add(Integer.valueOf(codewordIndex));
                    ambiguousIndexValuesList.add(values);
                }
            }
        }
        int[][] ambiguousIndexValues = new int[ambiguousIndexValuesList.size()][];
        for (int i = 0; i < ambiguousIndexValues.length; i++) {
            ambiguousIndexValues[i] = (int[]) ambiguousIndexValuesList.get(i);
        }
        return createDecoderResultFromAmbiguousValues(detectionResult.getBarcodeECLevel(), codewords, PDF417Common.toIntArray(erasures), PDF417Common.toIntArray(ambiguousIndexesList), ambiguousIndexValues);
    }

    private static DecoderResult createDecoderResultFromAmbiguousValues(int ecLevel, int[] codewords, int[] erasureArray, int[] ambiguousIndexes, int[][] ambiguousIndexValues) throws FormatException, ChecksumException {
        int[] ambiguousIndexCount = new int[ambiguousIndexes.length];
        int i = 100;
        while (true) {
            int tries = i - 1;
            if (i > 0) {
                for (int i2 = 0; i2 < ambiguousIndexCount.length; i2++) {
                    codewords[ambiguousIndexes[i2]] = ambiguousIndexValues[i2][ambiguousIndexCount[i2]];
                }
                try {
                    return decodeCodewords(codewords, ecLevel, erasureArray);
                } catch (ChecksumException e) {
                    if (ambiguousIndexCount.length != 0) {
                        int i3 = 0;
                        while (true) {
                            if (i3 >= ambiguousIndexCount.length) {
                                break;
                            } else if (ambiguousIndexCount[i3] < ambiguousIndexValues[i3].length - 1) {
                                ambiguousIndexCount[i3] = ambiguousIndexCount[i3] + 1;
                                break;
                            } else {
                                ambiguousIndexCount[i3] = 0;
                                if (i3 != ambiguousIndexCount.length - 1) {
                                    i3++;
                                } else {
                                    throw ChecksumException.getChecksumInstance();
                                }
                            }
                        }
                        i = tries;
                    } else {
                        throw ChecksumException.getChecksumInstance();
                    }
                }
            } else {
                throw ChecksumException.getChecksumInstance();
            }
        }
    }

    private static BarcodeValue[][] createBarcodeMatrix(DetectionResult detectionResult) throws FormatException {
        DetectionResultColumn[] detectionResultColumns;
        Codeword[] codewords;
        BarcodeValue[][] barcodeMatrix = (BarcodeValue[][]) Array.newInstance(BarcodeValue.class, new int[]{detectionResult.getBarcodeRowCount(), detectionResult.getBarcodeColumnCount() + 2});
        for (int row = 0; row < barcodeMatrix.length; row++) {
            for (int column = 0; column < barcodeMatrix[row].length; column++) {
                barcodeMatrix[row][column] = new BarcodeValue();
            }
        }
        int column2 = 0;
        for (DetectionResultColumn detectionResultColumn : detectionResult.getDetectionResultColumns()) {
            if (detectionResultColumn != null) {
                for (Codeword codeword : detectionResultColumn.getCodewords()) {
                    if (codeword != null) {
                        int rowNumber = codeword.getRowNumber();
                        if (rowNumber < 0) {
                            continue;
                        } else if (rowNumber < barcodeMatrix.length) {
                            barcodeMatrix[rowNumber][column2].setValue(codeword.getValue());
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    }
                }
                continue;
            }
            column2++;
        }
        return barcodeMatrix;
    }

    private static boolean isValidBarcodeColumn(DetectionResult detectionResult, int barcodeColumn) {
        return barcodeColumn >= 0 && barcodeColumn <= detectionResult.getBarcodeColumnCount() + 1;
    }

    private static int getStartColumn(DetectionResult detectionResult, int barcodeColumn, int imageRow, boolean leftToRight) {
        int offset = leftToRight ? 1 : -1;
        Codeword codeword = null;
        if (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            codeword = detectionResult.getDetectionResultColumn(barcodeColumn - offset).getCodeword(imageRow);
        }
        if (codeword != null) {
            return leftToRight ? codeword.getEndX() : codeword.getStartX();
        }
        Codeword codeword2 = detectionResult.getDetectionResultColumn(barcodeColumn).getCodewordNearby(imageRow);
        if (codeword2 != null) {
            return leftToRight ? codeword2.getStartX() : codeword2.getEndX();
        }
        if (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            codeword2 = detectionResult.getDetectionResultColumn(barcodeColumn - offset).getCodewordNearby(imageRow);
        }
        if (codeword2 != null) {
            return leftToRight ? codeword2.getEndX() : codeword2.getStartX();
        }
        int skippedColumns = 0;
        while (isValidBarcodeColumn(detectionResult, barcodeColumn - offset)) {
            barcodeColumn -= offset;
            Codeword[] codewords = detectionResult.getDetectionResultColumn(barcodeColumn).getCodewords();
            int length = codewords.length;
            for (int i = 0; i < length; i++) {
                Codeword previousRowCodeword = codewords[i];
                if (previousRowCodeword != null) {
                    return (leftToRight ? previousRowCodeword.getEndX() : previousRowCodeword.getStartX()) + (offset * skippedColumns * (previousRowCodeword.getEndX() - previousRowCodeword.getStartX()));
                }
            }
            skippedColumns++;
        }
        return leftToRight ? detectionResult.getBoundingBox().getMinX() : detectionResult.getBoundingBox().getMaxX();
    }

    private static Codeword detectCodeword(BitMatrix image, int minColumn, int maxColumn, boolean leftToRight, int startColumn, int imageRow, int minCodewordWidth, int maxCodewordWidth) {
        int endColumn;
        int startColumn2 = adjustCodewordStartColumn(image, minColumn, maxColumn, leftToRight, startColumn, imageRow);
        int[] moduleBitCount = getModuleBitCount(image, minColumn, maxColumn, leftToRight, startColumn2, imageRow);
        if (moduleBitCount == null) {
            return null;
        }
        int codewordBitCount = PDF417Common.getBitCountSum(moduleBitCount);
        if (leftToRight) {
            endColumn = startColumn2 + codewordBitCount;
        } else {
            for (int i = 0; i < moduleBitCount.length / 2; i++) {
                int decodedValue = moduleBitCount[i];
                moduleBitCount[i] = moduleBitCount[(moduleBitCount.length - 1) - i];
                moduleBitCount[(moduleBitCount.length - 1) - i] = decodedValue;
            }
            endColumn = startColumn2;
            startColumn2 = endColumn - codewordBitCount;
        }
        if (!checkCodewordSkew(codewordBitCount, minCodewordWidth, maxCodewordWidth)) {
            return null;
        }
        int decodedValue2 = PDF417CodewordDecoder.getDecodedValue(moduleBitCount);
        int codeword = PDF417Common.getCodeword(decodedValue2);
        if (codeword == -1) {
            return null;
        }
        return new Codeword(startColumn2, endColumn, getCodewordBucketNumber(decodedValue2), codeword);
    }

    private static int[] getModuleBitCount(BitMatrix image, int minColumn, int maxColumn, boolean leftToRight, int startColumn, int imageRow) {
        int imageColumn = startColumn;
        int[] moduleBitCount = new int[8];
        int moduleNumber = 0;
        int increment = leftToRight ? 1 : -1;
        boolean previousPixelValue = leftToRight;
        while (true) {
            if (((leftToRight && imageColumn < maxColumn) || (!leftToRight && imageColumn >= minColumn)) && moduleNumber < moduleBitCount.length) {
                if (image.get(imageColumn, imageRow) == previousPixelValue) {
                    moduleBitCount[moduleNumber] = moduleBitCount[moduleNumber] + 1;
                    imageColumn += increment;
                } else {
                    moduleNumber++;
                    previousPixelValue = !previousPixelValue;
                }
            }
        }
        if (moduleNumber == moduleBitCount.length || (((leftToRight && imageColumn == maxColumn) || (!leftToRight && imageColumn == minColumn)) && moduleNumber == moduleBitCount.length - 1)) {
            return moduleBitCount;
        }
        return null;
    }

    private static int getNumberOfECCodeWords(int barcodeECLevel) {
        return 2 << barcodeECLevel;
    }

    private static int adjustCodewordStartColumn(BitMatrix image, int minColumn, int maxColumn, boolean leftToRight, int codewordStartColumn, int imageRow) {
        int correctedStartColumn = codewordStartColumn;
        int increment = leftToRight ? -1 : 1;
        for (int i = 0; i < 2; i++) {
            while (true) {
                if (((!leftToRight || correctedStartColumn < minColumn) && (leftToRight || correctedStartColumn >= maxColumn)) || leftToRight != image.get(correctedStartColumn, imageRow)) {
                    increment = -increment;
                } else if (Math.abs(codewordStartColumn - correctedStartColumn) > 2) {
                    return codewordStartColumn;
                } else {
                    correctedStartColumn += increment;
                }
            }
            increment = -increment;
            leftToRight = !leftToRight;
        }
        return correctedStartColumn;
    }

    private static boolean checkCodewordSkew(int codewordSize, int minCodewordWidth, int maxCodewordWidth) {
        return minCodewordWidth + -2 <= codewordSize && codewordSize <= maxCodewordWidth + 2;
    }

    private static DecoderResult decodeCodewords(int[] codewords, int ecLevel, int[] erasures) throws FormatException, ChecksumException {
        if (codewords.length != 0) {
            int numECCodewords = 1 << (ecLevel + 1);
            int correctedErrorsCount = correctErrors(codewords, erasures, numECCodewords);
            verifyCodewordCount(codewords, numECCodewords);
            DecoderResult decoderResult = DecodedBitStreamParser.decode(codewords, String.valueOf(ecLevel));
            decoderResult.setErrorsCorrected(Integer.valueOf(correctedErrorsCount));
            decoderResult.setErasures(Integer.valueOf(erasures.length));
            return decoderResult;
        }
        throw FormatException.getFormatInstance();
    }

    private static int correctErrors(int[] codewords, int[] erasures, int numECCodewords) throws ChecksumException {
        if ((erasures == null || erasures.length <= (numECCodewords / 2) + 3) && numECCodewords >= 0 && numECCodewords <= 512) {
            return errorCorrection.decode(codewords, numECCodewords, erasures);
        }
        throw ChecksumException.getChecksumInstance();
    }

    private static void verifyCodewordCount(int[] codewords, int numECCodewords) throws FormatException {
        if (codewords.length >= 4) {
            int numberOfCodewords = codewords[0];
            if (numberOfCodewords > codewords.length) {
                throw FormatException.getFormatInstance();
            } else if (numberOfCodewords != 0) {
            } else {
                if (numECCodewords < codewords.length) {
                    codewords[0] = codewords.length - numECCodewords;
                    return;
                }
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static int[] getBitCountForCodeword(int codeword) {
        int[] result = new int[8];
        int previousValue = 0;
        int i = result.length - 1;
        while (true) {
            if ((codeword & 1) != previousValue) {
                previousValue = codeword & 1;
                i--;
                if (i < 0) {
                    return result;
                }
            }
            result[i] = result[i] + 1;
            codeword >>= 1;
        }
    }

    private static int getCodewordBucketNumber(int codeword) {
        return getCodewordBucketNumber(getBitCountForCodeword(codeword));
    }

    private static int getCodewordBucketNumber(int[] moduleBitCount) {
        return ((((moduleBitCount[0] - moduleBitCount[2]) + moduleBitCount[4]) - moduleBitCount[6]) + 9) % 9;
    }

    public static String toString(BarcodeValue[][] barcodeMatrix) {
        Formatter formatter = new Formatter();
        for (int row = 0; row < barcodeMatrix.length; row++) {
            formatter.format("Row %2d: ", new Object[]{Integer.valueOf(row)});
            for (BarcodeValue barcodeValue : barcodeMatrix[row]) {
                if (barcodeValue.getValue().length == 0) {
                    formatter.format("        ", null);
                } else {
                    formatter.format("%4d(%2d)", new Object[]{Integer.valueOf(barcodeValue.getValue()[0]), barcodeValue.getConfidence(barcodeValue.getValue()[0])});
                }
            }
            formatter.format("%n", new Object[0]);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }
}

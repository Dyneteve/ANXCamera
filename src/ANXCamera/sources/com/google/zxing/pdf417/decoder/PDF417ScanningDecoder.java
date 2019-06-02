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
import java.util.Formatter;

public final class PDF417ScanningDecoder {
    private static final int CODEWORD_SKEW_SIZE = 2;
    private static final int MAX_EC_CODEWORDS = 512;
    private static final int MAX_ERRORS = 3;
    private static final ErrorCorrection errorCorrection = new ErrorCorrection();

    private PDF417ScanningDecoder() {
    }

    private static BoundingBox adjustBoundingBox(DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn) throws NotFoundException, FormatException {
        if (detectionResultRowIndicatorColumn == null) {
            return null;
        }
        int[] rowHeights = detectionResultRowIndicatorColumn.getRowHeights();
        if (rowHeights == null) {
            return null;
        }
        int max = getMax(rowHeights);
        int i = 0;
        for (int i2 : rowHeights) {
            i += max - i2;
            if (i2 > 0) {
                break;
            }
        }
        Codeword[] codewords = detectionResultRowIndicatorColumn.getCodewords();
        int i3 = 0;
        int i4 = i;
        while (i4 > 0 && codewords[i3] == null) {
            i4--;
            i3++;
        }
        int i5 = 0;
        for (int length = rowHeights.length - 1; length >= 0; length--) {
            i5 += max - rowHeights[length];
            if (rowHeights[length] > 0) {
                break;
            }
        }
        int length2 = codewords.length - 1;
        while (i5 > 0 && codewords[length2] == null) {
            i5--;
            length2--;
        }
        return detectionResultRowIndicatorColumn.getBoundingBox().addMissingRows(i4, i5, detectionResultRowIndicatorColumn.isLeft());
    }

    private static void adjustCodewordCount(DetectionResult detectionResult, BarcodeValue[][] barcodeValueArr) throws NotFoundException {
        int[] value = barcodeValueArr[0][1].getValue();
        int barcodeColumnCount = (detectionResult.getBarcodeColumnCount() * detectionResult.getBarcodeRowCount()) - getNumberOfECCodeWords(detectionResult.getBarcodeECLevel());
        if (value.length == 0) {
            if (barcodeColumnCount < 1 || barcodeColumnCount > 928) {
                throw NotFoundException.getNotFoundInstance();
            }
            barcodeValueArr[0][1].setValue(barcodeColumnCount);
        } else if (value[0] != barcodeColumnCount) {
            barcodeValueArr[0][1].setValue(barcodeColumnCount);
        }
    }

    private static int adjustCodewordStartColumn(BitMatrix bitMatrix, int i, int i2, boolean z, int i3, int i4) {
        int i5 = i3;
        int i6 = z ? -1 : 1;
        for (int i7 = 0; i7 < 2; i7++) {
            while (true) {
                if (((!z || i5 < i) && (z || i5 >= i2)) || z != bitMatrix.get(i5, i4)) {
                    i6 = -i6;
                } else if (Math.abs(i3 - i5) > 2) {
                    return i3;
                } else {
                    i5 += i6;
                }
            }
            i6 = -i6;
            z = !z;
        }
        return i5;
    }

    private static boolean checkCodewordSkew(int i, int i2, int i3) {
        return i2 + -2 <= i && i <= i3 + 2;
    }

    private static int correctErrors(int[] iArr, int[] iArr2, int i) throws ChecksumException {
        if ((iArr2 == null || iArr2.length <= (i / 2) + 3) && i >= 0 && i <= 512) {
            return errorCorrection.decode(iArr, i, iArr2);
        }
        throw ChecksumException.getChecksumInstance();
    }

    private static BarcodeValue[][] createBarcodeMatrix(DetectionResult detectionResult) throws FormatException {
        DetectionResultColumn[] detectionResultColumns;
        Codeword[] codewords;
        BarcodeValue[][] barcodeValueArr = (BarcodeValue[][]) Array.newInstance(BarcodeValue.class, new int[]{detectionResult.getBarcodeRowCount(), detectionResult.getBarcodeColumnCount() + 2});
        for (int i = 0; i < barcodeValueArr.length; i++) {
            for (int i2 = 0; i2 < barcodeValueArr[i].length; i2++) {
                barcodeValueArr[i][i2] = new BarcodeValue();
            }
        }
        int i3 = 0;
        for (DetectionResultColumn detectionResultColumn : detectionResult.getDetectionResultColumns()) {
            if (detectionResultColumn != null) {
                for (Codeword codeword : detectionResultColumn.getCodewords()) {
                    if (codeword != null) {
                        int rowNumber = codeword.getRowNumber();
                        if (rowNumber < 0) {
                            continue;
                        } else if (rowNumber < barcodeValueArr.length) {
                            barcodeValueArr[rowNumber][i3].setValue(codeword.getValue());
                        } else {
                            throw FormatException.getFormatInstance();
                        }
                    }
                }
                continue;
            }
            i3++;
        }
        return barcodeValueArr;
    }

    private static DecoderResult createDecoderResult(DetectionResult detectionResult) throws FormatException, ChecksumException, NotFoundException {
        BarcodeValue[][] createBarcodeMatrix = createBarcodeMatrix(detectionResult);
        adjustCodewordCount(detectionResult, createBarcodeMatrix);
        ArrayList arrayList = new ArrayList();
        int[] iArr = new int[(detectionResult.getBarcodeRowCount() * detectionResult.getBarcodeColumnCount())];
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        for (int i = 0; i < detectionResult.getBarcodeRowCount(); i++) {
            for (int i2 = 0; i2 < detectionResult.getBarcodeColumnCount(); i2++) {
                int[] value = createBarcodeMatrix[i][i2 + 1].getValue();
                int barcodeColumnCount = (detectionResult.getBarcodeColumnCount() * i) + i2;
                if (value.length == 0) {
                    arrayList.add(Integer.valueOf(barcodeColumnCount));
                } else if (value.length == 1) {
                    iArr[barcodeColumnCount] = value[0];
                } else {
                    arrayList3.add(Integer.valueOf(barcodeColumnCount));
                    arrayList2.add(value);
                }
            }
        }
        int[][] iArr2 = new int[arrayList2.size()][];
        for (int i3 = 0; i3 < iArr2.length; i3++) {
            iArr2[i3] = (int[]) arrayList2.get(i3);
        }
        return createDecoderResultFromAmbiguousValues(detectionResult.getBarcodeECLevel(), iArr, PDF417Common.toIntArray(arrayList), PDF417Common.toIntArray(arrayList3), iArr2);
    }

    private static DecoderResult createDecoderResultFromAmbiguousValues(int i, int[] iArr, int[] iArr2, int[] iArr3, int[][] iArr4) throws FormatException, ChecksumException {
        int[] iArr5 = new int[iArr3.length];
        int i2 = 100;
        while (true) {
            int i3 = i2 - 1;
            if (i2 > 0) {
                for (int i4 = 0; i4 < iArr5.length; i4++) {
                    iArr[iArr3[i4]] = iArr4[i4][iArr5[i4]];
                }
                try {
                    return decodeCodewords(iArr, i, iArr2);
                } catch (ChecksumException e) {
                    if (iArr5.length != 0) {
                        int i5 = 0;
                        while (true) {
                            if (i5 >= iArr5.length) {
                                break;
                            } else if (iArr5[i5] < iArr4[i5].length - 1) {
                                iArr5[i5] = iArr5[i5] + 1;
                                break;
                            } else {
                                iArr5[i5] = 0;
                                if (i5 != iArr5.length - 1) {
                                    i5++;
                                } else {
                                    throw ChecksumException.getChecksumInstance();
                                }
                            }
                        }
                        i2 = i3;
                    } else {
                        throw ChecksumException.getChecksumInstance();
                    }
                }
            } else {
                throw ChecksumException.getChecksumInstance();
            }
        }
    }

    public static DecoderResult decode(BitMatrix bitMatrix, ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3, ResultPoint resultPoint4, int i, int i2) throws NotFoundException, FormatException, ChecksumException {
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn;
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn2;
        DetectionResultColumn detectionResultColumn;
        int i3;
        DetectionResultColumn detectionResultColumn2;
        BoundingBox boundingBox = new BoundingBox(bitMatrix, resultPoint, resultPoint2, resultPoint3, resultPoint4);
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn3 = null;
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn4 = null;
        DetectionResult detectionResult = null;
        int i4 = 0;
        while (true) {
            if (i4 >= 2) {
                break;
            }
            if (resultPoint != null) {
                detectionResultRowIndicatorColumn3 = getRowIndicatorColumn(bitMatrix, boundingBox, resultPoint, true, i, i2);
            }
            if (resultPoint3 != null) {
                detectionResultRowIndicatorColumn4 = getRowIndicatorColumn(bitMatrix, boundingBox, resultPoint3, false, i, i2);
            }
            detectionResult = merge(detectionResultRowIndicatorColumn3, detectionResultRowIndicatorColumn4);
            if (detectionResult == null) {
                throw NotFoundException.getNotFoundInstance();
            } else if (i4 != 0 || detectionResult.getBoundingBox() == null || (detectionResult.getBoundingBox().getMinY() >= boundingBox.getMinY() && detectionResult.getBoundingBox().getMaxY() <= boundingBox.getMaxY())) {
                detectionResult.setBoundingBox(boundingBox);
            } else {
                boundingBox = detectionResult.getBoundingBox();
                i4++;
            }
        }
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn5 = detectionResultRowIndicatorColumn2;
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn6 = detectionResultRowIndicatorColumn;
        DetectionResult detectionResult2 = detectionResult;
        boolean z = true;
        int barcodeColumnCount = detectionResult2.getBarcodeColumnCount() + 1;
        boolean z2 = false;
        detectionResult2.setDetectionResultColumn(0, detectionResultRowIndicatorColumn5);
        detectionResult2.setDetectionResultColumn(barcodeColumnCount, detectionResultRowIndicatorColumn6);
        boolean z3 = detectionResultRowIndicatorColumn5 != null;
        int i5 = 1;
        int i6 = i;
        int i7 = i2;
        while (i5 <= barcodeColumnCount) {
            int i8 = z3 ? i5 : barcodeColumnCount - i5;
            if (detectionResult2.getDetectionResultColumn(i8) == null) {
                if (i8 == 0 || i8 == barcodeColumnCount) {
                    detectionResultColumn = new DetectionResultRowIndicatorColumn(boundingBox, i8 == 0 ? z : z2);
                } else {
                    detectionResultColumn = new DetectionResultColumn(boundingBox);
                }
                DetectionResultColumn detectionResultColumn3 = detectionResultColumn;
                detectionResult2.setDetectionResultColumn(i8, detectionResultColumn3);
                int i9 = i6;
                int i10 = i7;
                int i11 = -1;
                int minY = boundingBox.getMinY();
                while (minY <= boundingBox.getMaxY()) {
                    int startColumn = getStartColumn(detectionResult2, i8, minY, z3);
                    if (startColumn < 0 || startColumn > boundingBox.getMaxX()) {
                        if (i11 == -1) {
                            int i12 = startColumn;
                            detectionResultColumn2 = detectionResultColumn3;
                            i3 = i8;
                            minY++;
                            detectionResultColumn3 = detectionResultColumn2;
                            i8 = i3;
                            z2 = false;
                        } else {
                            startColumn = i11;
                        }
                    }
                    detectionResultColumn2 = detectionResultColumn3;
                    i3 = i8;
                    Codeword detectCodeword = detectCodeword(bitMatrix, boundingBox.getMinX(), boundingBox.getMaxX(), z3, startColumn, minY, i9, i10);
                    if (detectCodeword != null) {
                        detectionResultColumn2.setCodeword(minY, detectCodeword);
                        i11 = startColumn;
                        i9 = Math.min(i9, detectCodeword.getWidth());
                        i10 = Math.max(i10, detectCodeword.getWidth());
                        int i13 = startColumn;
                    } else {
                        int i14 = i9;
                        int i15 = i10;
                        int i16 = startColumn;
                    }
                    minY++;
                    detectionResultColumn3 = detectionResultColumn2;
                    i8 = i3;
                    z2 = false;
                }
                i6 = i9;
                i7 = i10;
            }
            i5++;
            z = true;
        }
        return createDecoderResult(detectionResult2);
    }

    private static DecoderResult decodeCodewords(int[] iArr, int i, int[] iArr2) throws FormatException, ChecksumException {
        if (iArr.length != 0) {
            int i2 = 1 << (i + 1);
            int correctErrors = correctErrors(iArr, iArr2, i2);
            verifyCodewordCount(iArr, i2);
            DecoderResult decode = DecodedBitStreamParser.decode(iArr, String.valueOf(i));
            decode.setErrorsCorrected(Integer.valueOf(correctErrors));
            decode.setErasures(Integer.valueOf(iArr2.length));
            return decode;
        }
        throw FormatException.getFormatInstance();
    }

    private static Codeword detectCodeword(BitMatrix bitMatrix, int i, int i2, boolean z, int i3, int i4, int i5, int i6) {
        int i7;
        int adjustCodewordStartColumn = adjustCodewordStartColumn(bitMatrix, i, i2, z, i3, i4);
        int[] moduleBitCount = getModuleBitCount(bitMatrix, i, i2, z, adjustCodewordStartColumn, i4);
        if (moduleBitCount == null) {
            return null;
        }
        int bitCountSum = PDF417Common.getBitCountSum(moduleBitCount);
        if (z) {
            i7 = adjustCodewordStartColumn + bitCountSum;
        } else {
            for (int i8 = 0; i8 < moduleBitCount.length / 2; i8++) {
                int i9 = moduleBitCount[i8];
                moduleBitCount[i8] = moduleBitCount[(moduleBitCount.length - 1) - i8];
                moduleBitCount[(moduleBitCount.length - 1) - i8] = i9;
            }
            i7 = adjustCodewordStartColumn;
            adjustCodewordStartColumn = i7 - bitCountSum;
        }
        if (!checkCodewordSkew(bitCountSum, i5, i6)) {
            return null;
        }
        int decodedValue = PDF417CodewordDecoder.getDecodedValue(moduleBitCount);
        int codeword = PDF417Common.getCodeword(decodedValue);
        if (codeword == -1) {
            return null;
        }
        return new Codeword(adjustCodewordStartColumn, i7, getCodewordBucketNumber(decodedValue), codeword);
    }

    private static BarcodeMetadata getBarcodeMetadata(DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn, DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn2) {
        BarcodeMetadata barcodeMetadata = null;
        if (detectionResultRowIndicatorColumn != null) {
            BarcodeMetadata barcodeMetadata2 = detectionResultRowIndicatorColumn.getBarcodeMetadata();
            BarcodeMetadata barcodeMetadata3 = barcodeMetadata2;
            if (barcodeMetadata2 != null) {
                if (detectionResultRowIndicatorColumn2 != null) {
                    BarcodeMetadata barcodeMetadata4 = detectionResultRowIndicatorColumn2.getBarcodeMetadata();
                    BarcodeMetadata barcodeMetadata5 = barcodeMetadata4;
                    if (barcodeMetadata4 == null || barcodeMetadata3.getColumnCount() == barcodeMetadata5.getColumnCount() || barcodeMetadata3.getErrorCorrectionLevel() == barcodeMetadata5.getErrorCorrectionLevel() || barcodeMetadata3.getRowCount() == barcodeMetadata5.getRowCount()) {
                        return barcodeMetadata3;
                    }
                    return null;
                }
                return barcodeMetadata3;
            }
        }
        if (detectionResultRowIndicatorColumn2 != null) {
            barcodeMetadata = detectionResultRowIndicatorColumn2.getBarcodeMetadata();
        }
        return barcodeMetadata;
    }

    private static int[] getBitCountForCodeword(int i) {
        int[] iArr = new int[8];
        int i2 = 0;
        int length = iArr.length - 1;
        while (true) {
            if ((i & 1) != i2) {
                i2 = i & 1;
                length--;
                if (length < 0) {
                    return iArr;
                }
            }
            iArr[length] = iArr[length] + 1;
            i >>= 1;
        }
    }

    private static int getCodewordBucketNumber(int i) {
        return getCodewordBucketNumber(getBitCountForCodeword(i));
    }

    private static int getCodewordBucketNumber(int[] iArr) {
        return ((((iArr[0] - iArr[2]) + iArr[4]) - iArr[6]) + 9) % 9;
    }

    private static int getMax(int[] iArr) {
        int i = -1;
        for (int max : iArr) {
            i = Math.max(i, max);
        }
        return i;
    }

    private static int[] getModuleBitCount(BitMatrix bitMatrix, int i, int i2, boolean z, int i3, int i4) {
        int i5 = i3;
        int[] iArr = new int[8];
        int i6 = 0;
        int i7 = z ? 1 : -1;
        boolean z2 = z;
        while (true) {
            if (((z && i5 < i2) || (!z && i5 >= i)) && i6 < iArr.length) {
                if (bitMatrix.get(i5, i4) == z2) {
                    iArr[i6] = iArr[i6] + 1;
                    i5 += i7;
                } else {
                    i6++;
                    z2 = !z2;
                }
            }
        }
        if (i6 == iArr.length || (((z && i5 == i2) || (!z && i5 == i)) && i6 == iArr.length - 1)) {
            return iArr;
        }
        return null;
    }

    private static int getNumberOfECCodeWords(int i) {
        return 2 << i;
    }

    private static DetectionResultRowIndicatorColumn getRowIndicatorColumn(BitMatrix bitMatrix, BoundingBox boundingBox, ResultPoint resultPoint, boolean z, int i, int i2) {
        boolean z2 = z;
        DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn = new DetectionResultRowIndicatorColumn(boundingBox, z2);
        int i3 = 0;
        while (i3 < 2) {
            int i4 = i3 == 0 ? 1 : -1;
            int x = (int) resultPoint.getX();
            int y = (int) resultPoint.getY();
            while (y <= boundingBox.getMaxY() && y >= boundingBox.getMinY()) {
                Codeword detectCodeword = detectCodeword(bitMatrix, 0, bitMatrix.getWidth(), z2, x, y, i, i2);
                if (detectCodeword != null) {
                    detectionResultRowIndicatorColumn.setCodeword(y, detectCodeword);
                    x = z2 ? detectCodeword.getStartX() : detectCodeword.getEndX();
                }
                y += i4;
            }
            i3++;
        }
        return detectionResultRowIndicatorColumn;
    }

    private static int getStartColumn(DetectionResult detectionResult, int i, int i2, boolean z) {
        int i3 = z ? 1 : -1;
        Codeword codeword = null;
        if (isValidBarcodeColumn(detectionResult, i - i3)) {
            codeword = detectionResult.getDetectionResultColumn(i - i3).getCodeword(i2);
        }
        if (codeword != null) {
            return z ? codeword.getEndX() : codeword.getStartX();
        }
        Codeword codewordNearby = detectionResult.getDetectionResultColumn(i).getCodewordNearby(i2);
        if (codewordNearby != null) {
            return z ? codewordNearby.getStartX() : codewordNearby.getEndX();
        }
        if (isValidBarcodeColumn(detectionResult, i - i3)) {
            codewordNearby = detectionResult.getDetectionResultColumn(i - i3).getCodewordNearby(i2);
        }
        if (codewordNearby != null) {
            return z ? codewordNearby.getEndX() : codewordNearby.getStartX();
        }
        int i4 = 0;
        while (isValidBarcodeColumn(detectionResult, i - i3)) {
            i -= i3;
            Codeword[] codewords = detectionResult.getDetectionResultColumn(i).getCodewords();
            int length = codewords.length;
            for (int i5 = 0; i5 < length; i5++) {
                Codeword codeword2 = codewords[i5];
                if (codeword2 != null) {
                    return (z ? codeword2.getEndX() : codeword2.getStartX()) + (i3 * i4 * (codeword2.getEndX() - codeword2.getStartX()));
                }
            }
            i4++;
        }
        return z ? detectionResult.getBoundingBox().getMinX() : detectionResult.getBoundingBox().getMaxX();
    }

    private static boolean isValidBarcodeColumn(DetectionResult detectionResult, int i) {
        return i >= 0 && i <= detectionResult.getBarcodeColumnCount() + 1;
    }

    private static DetectionResult merge(DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn, DetectionResultRowIndicatorColumn detectionResultRowIndicatorColumn2) throws NotFoundException, FormatException {
        if (detectionResultRowIndicatorColumn == null && detectionResultRowIndicatorColumn2 == null) {
            return null;
        }
        BarcodeMetadata barcodeMetadata = getBarcodeMetadata(detectionResultRowIndicatorColumn, detectionResultRowIndicatorColumn2);
        if (barcodeMetadata == null) {
            return null;
        }
        return new DetectionResult(barcodeMetadata, BoundingBox.merge(adjustBoundingBox(detectionResultRowIndicatorColumn), adjustBoundingBox(detectionResultRowIndicatorColumn2)));
    }

    public static String toString(BarcodeValue[][] barcodeValueArr) {
        Formatter formatter = new Formatter();
        for (int i = 0; i < barcodeValueArr.length; i++) {
            formatter.format("Row %2d: ", new Object[]{Integer.valueOf(i)});
            for (BarcodeValue barcodeValue : barcodeValueArr[i]) {
                if (barcodeValue.getValue().length == 0) {
                    formatter.format("        ", null);
                } else {
                    formatter.format("%4d(%2d)", new Object[]{Integer.valueOf(barcodeValue.getValue()[0]), barcodeValue.getConfidence(barcodeValue.getValue()[0])});
                }
            }
            formatter.format("%n", new Object[0]);
        }
        String formatter2 = formatter.toString();
        formatter.close();
        return formatter2;
    }

    private static void verifyCodewordCount(int[] iArr, int i) throws FormatException {
        if (iArr.length >= 4) {
            int i2 = iArr[0];
            if (i2 > iArr.length) {
                throw FormatException.getFormatInstance();
            } else if (i2 != 0) {
            } else {
                if (i < iArr.length) {
                    iArr[0] = iArr.length - i;
                    return;
                }
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }
}

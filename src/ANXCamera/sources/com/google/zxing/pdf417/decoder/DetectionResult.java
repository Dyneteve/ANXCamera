package com.google.zxing.pdf417.decoder;

import com.google.zxing.pdf417.PDF417Common;
import java.util.Formatter;

final class DetectionResult {
    private static final int ADJUST_ROW_NUMBER_SKIP = 2;
    private final int barcodeColumnCount;
    private final BarcodeMetadata barcodeMetadata;
    private BoundingBox boundingBox;
    private final DetectionResultColumn[] detectionResultColumns = new DetectionResultColumn[(this.barcodeColumnCount + 2)];

    DetectionResult(BarcodeMetadata barcodeMetadata2, BoundingBox boundingBox2) {
        this.barcodeMetadata = barcodeMetadata2;
        this.barcodeColumnCount = barcodeMetadata2.getColumnCount();
        this.boundingBox = boundingBox2;
    }

    private void adjustIndicatorColumnRowNumbers(DetectionResultColumn detectionResultColumn) {
        if (detectionResultColumn != null) {
            ((DetectionResultRowIndicatorColumn) detectionResultColumn).adjustCompleteIndicatorColumnRowNumbers(this.barcodeMetadata);
        }
    }

    private static boolean adjustRowNumber(Codeword codeword, Codeword codeword2) {
        if (codeword2 == null || !codeword2.hasValidRowNumber() || codeword2.getBucket() != codeword.getBucket()) {
            return false;
        }
        codeword.setRowNumber(codeword2.getRowNumber());
        return true;
    }

    private static int adjustRowNumberIfValid(int i, int i2, Codeword codeword) {
        if (codeword == null) {
            return i2;
        }
        if (!codeword.hasValidRowNumber()) {
            if (codeword.isValidRowNumber(i)) {
                codeword.setRowNumber(i);
                i2 = 0;
            } else {
                i2++;
            }
        }
        return i2;
    }

    private int adjustRowNumbers() {
        int adjustRowNumbersByRow = adjustRowNumbersByRow();
        if (adjustRowNumbersByRow == 0) {
            return 0;
        }
        for (int i = 1; i < this.barcodeColumnCount + 1; i++) {
            Codeword[] codewords = this.detectionResultColumns[i].getCodewords();
            for (int i2 = 0; i2 < codewords.length; i2++) {
                if (codewords[i2] != null && !codewords[i2].hasValidRowNumber()) {
                    adjustRowNumbers(i, i2, codewords);
                }
            }
        }
        return adjustRowNumbersByRow;
    }

    private void adjustRowNumbers(int i, int i2, Codeword[] codewordArr) {
        Codeword codeword = codewordArr[i2];
        Codeword[] codewords = this.detectionResultColumns[i - 1].getCodewords();
        Codeword[] codewordArr2 = codewords;
        if (this.detectionResultColumns[i + 1] != null) {
            codewordArr2 = this.detectionResultColumns[i + 1].getCodewords();
        }
        Codeword[] codewordArr3 = new Codeword[14];
        codewordArr3[2] = codewords[i2];
        codewordArr3[3] = codewordArr2[i2];
        int i3 = 0;
        if (i2 > 0) {
            codewordArr3[0] = codewordArr[i2 - 1];
            codewordArr3[4] = codewords[i2 - 1];
            codewordArr3[5] = codewordArr2[i2 - 1];
        }
        if (i2 > 1) {
            codewordArr3[8] = codewordArr[i2 - 2];
            codewordArr3[10] = codewords[i2 - 2];
            codewordArr3[11] = codewordArr2[i2 - 2];
        }
        if (i2 < codewordArr.length - 1) {
            codewordArr3[1] = codewordArr[i2 + 1];
            codewordArr3[6] = codewords[i2 + 1];
            codewordArr3[7] = codewordArr2[i2 + 1];
        }
        if (i2 < codewordArr.length - 2) {
            codewordArr3[9] = codewordArr[i2 + 2];
            codewordArr3[12] = codewords[i2 + 2];
            codewordArr3[13] = codewordArr2[i2 + 2];
        }
        int length = codewordArr3.length;
        while (i3 < length && !adjustRowNumber(codeword, codewordArr3[i3])) {
            i3++;
        }
    }

    private int adjustRowNumbersByRow() {
        adjustRowNumbersFromBothRI();
        return adjustRowNumbersFromRRI() + adjustRowNumbersFromLRI();
    }

    private void adjustRowNumbersFromBothRI() {
        if (this.detectionResultColumns[0] != null && this.detectionResultColumns[this.barcodeColumnCount + 1] != null) {
            Codeword[] codewords = this.detectionResultColumns[0].getCodewords();
            Codeword[] codewords2 = this.detectionResultColumns[this.barcodeColumnCount + 1].getCodewords();
            for (int i = 0; i < codewords.length; i++) {
                if (!(codewords[i] == null || codewords2[i] == null || codewords[i].getRowNumber() != codewords2[i].getRowNumber())) {
                    for (int i2 = 1; i2 <= this.barcodeColumnCount; i2++) {
                        Codeword codeword = this.detectionResultColumns[i2].getCodewords()[i];
                        if (codeword != null) {
                            codeword.setRowNumber(codewords[i].getRowNumber());
                            if (!codeword.hasValidRowNumber()) {
                                this.detectionResultColumns[i2].getCodewords()[i] = null;
                            }
                        }
                    }
                }
            }
        }
    }

    private int adjustRowNumbersFromLRI() {
        if (this.detectionResultColumns[0] == null) {
            return 0;
        }
        int i = 0;
        Codeword[] codewords = this.detectionResultColumns[0].getCodewords();
        for (int i2 = 0; i2 < codewords.length; i2++) {
            if (codewords[i2] != null) {
                int rowNumber = codewords[i2].getRowNumber();
                int i3 = 0;
                for (int i4 = 1; i4 < this.barcodeColumnCount + 1 && i3 < 2; i4++) {
                    Codeword codeword = this.detectionResultColumns[i4].getCodewords()[i2];
                    if (codeword != null) {
                        i3 = adjustRowNumberIfValid(rowNumber, i3, codeword);
                        if (!codeword.hasValidRowNumber()) {
                            i++;
                        }
                    }
                }
            }
        }
        return i;
    }

    private int adjustRowNumbersFromRRI() {
        if (this.detectionResultColumns[this.barcodeColumnCount + 1] == null) {
            return 0;
        }
        int i = 0;
        Codeword[] codewords = this.detectionResultColumns[this.barcodeColumnCount + 1].getCodewords();
        for (int i2 = 0; i2 < codewords.length; i2++) {
            if (codewords[i2] != null) {
                int rowNumber = codewords[i2].getRowNumber();
                int i3 = 0;
                for (int i4 = this.barcodeColumnCount + 1; i4 > 0 && i3 < 2; i4--) {
                    Codeword codeword = this.detectionResultColumns[i4].getCodewords()[i2];
                    if (codeword != null) {
                        i3 = adjustRowNumberIfValid(rowNumber, i3, codeword);
                        if (!codeword.hasValidRowNumber()) {
                            i++;
                        }
                    }
                }
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public int getBarcodeColumnCount() {
        return this.barcodeColumnCount;
    }

    /* access modifiers changed from: 0000 */
    public int getBarcodeECLevel() {
        return this.barcodeMetadata.getErrorCorrectionLevel();
    }

    /* access modifiers changed from: 0000 */
    public int getBarcodeRowCount() {
        return this.barcodeMetadata.getRowCount();
    }

    /* access modifiers changed from: 0000 */
    public BoundingBox getBoundingBox() {
        return this.boundingBox;
    }

    /* access modifiers changed from: 0000 */
    public DetectionResultColumn getDetectionResultColumn(int i) {
        return this.detectionResultColumns[i];
    }

    /* access modifiers changed from: 0000 */
    public DetectionResultColumn[] getDetectionResultColumns() {
        int i;
        adjustIndicatorColumnRowNumbers(this.detectionResultColumns[0]);
        adjustIndicatorColumnRowNumbers(this.detectionResultColumns[this.barcodeColumnCount + 1]);
        int i2 = PDF417Common.MAX_CODEWORDS_IN_BARCODE;
        do {
            i = i2;
            i2 = adjustRowNumbers();
            if (i2 <= 0) {
                break;
            }
        } while (i2 < i);
        return this.detectionResultColumns;
    }

    public void setBoundingBox(BoundingBox boundingBox2) {
        this.boundingBox = boundingBox2;
    }

    /* access modifiers changed from: 0000 */
    public void setDetectionResultColumn(int i, DetectionResultColumn detectionResultColumn) {
        this.detectionResultColumns[i] = detectionResultColumn;
    }

    public String toString() {
        DetectionResultColumn detectionResultColumn = this.detectionResultColumns[0];
        if (detectionResultColumn == null) {
            detectionResultColumn = this.detectionResultColumns[this.barcodeColumnCount + 1];
        }
        Formatter formatter = new Formatter();
        for (int i = 0; i < detectionResultColumn.getCodewords().length; i++) {
            formatter.format("CW %3d:", new Object[]{Integer.valueOf(i)});
            for (int i2 = 0; i2 < this.barcodeColumnCount + 2; i2++) {
                if (this.detectionResultColumns[i2] == null) {
                    formatter.format("    |   ", new Object[0]);
                } else {
                    Codeword codeword = this.detectionResultColumns[i2].getCodewords()[i];
                    if (codeword == null) {
                        formatter.format("    |   ", new Object[0]);
                    } else {
                        formatter.format(" %3d|%3d", new Object[]{Integer.valueOf(codeword.getRowNumber()), Integer.valueOf(codeword.getValue())});
                    }
                }
            }
            formatter.format("%n", new Object[0]);
        }
        String formatter2 = formatter.toString();
        formatter.close();
        return formatter2;
    }
}

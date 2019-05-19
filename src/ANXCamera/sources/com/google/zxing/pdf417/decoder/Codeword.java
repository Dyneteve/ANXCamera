package com.google.zxing.pdf417.decoder;

final class Codeword {
    private static final int BARCODE_ROW_UNKNOWN = -1;
    private final int bucket;
    private final int endX;
    private int rowNumber = -1;
    private final int startX;
    private final int value;

    Codeword(int startX2, int endX2, int bucket2, int value2) {
        this.startX = startX2;
        this.endX = endX2;
        this.bucket = bucket2;
        this.value = value2;
    }

    /* access modifiers changed from: 0000 */
    public boolean hasValidRowNumber() {
        return isValidRowNumber(this.rowNumber);
    }

    /* access modifiers changed from: 0000 */
    public boolean isValidRowNumber(int rowNumber2) {
        return rowNumber2 != -1 && this.bucket == (rowNumber2 % 3) * 3;
    }

    /* access modifiers changed from: 0000 */
    public void setRowNumberAsRowIndicatorColumn() {
        this.rowNumber = ((this.value / 30) * 3) + (this.bucket / 3);
    }

    /* access modifiers changed from: 0000 */
    public int getWidth() {
        return this.endX - this.startX;
    }

    /* access modifiers changed from: 0000 */
    public int getStartX() {
        return this.startX;
    }

    /* access modifiers changed from: 0000 */
    public int getEndX() {
        return this.endX;
    }

    /* access modifiers changed from: 0000 */
    public int getBucket() {
        return this.bucket;
    }

    /* access modifiers changed from: 0000 */
    public int getValue() {
        return this.value;
    }

    /* access modifiers changed from: 0000 */
    public int getRowNumber() {
        return this.rowNumber;
    }

    /* access modifiers changed from: 0000 */
    public void setRowNumber(int rowNumber2) {
        this.rowNumber = rowNumber2;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(String.valueOf(this.rowNumber));
        sb.append("|");
        sb.append(this.value);
        return sb.toString();
    }
}

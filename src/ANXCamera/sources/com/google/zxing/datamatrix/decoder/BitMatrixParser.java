package com.google.zxing.datamatrix.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

final class BitMatrixParser {
    private final BitMatrix mappingBitMatrix;
    private final BitMatrix readMappingMatrix;
    private final Version version;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int dimension = bitMatrix.getHeight();
        if (dimension < 8 || dimension > 144 || (dimension & 1) != 0) {
            throw FormatException.getFormatInstance();
        }
        this.version = readVersion(bitMatrix);
        this.mappingBitMatrix = extractDataRegion(bitMatrix);
        this.readMappingMatrix = new BitMatrix(this.mappingBitMatrix.getWidth(), this.mappingBitMatrix.getHeight());
    }

    /* access modifiers changed from: 0000 */
    public Version getVersion() {
        return this.version;
    }

    private static Version readVersion(BitMatrix bitMatrix) throws FormatException {
        return Version.getVersionForDimensions(bitMatrix.getHeight(), bitMatrix.getWidth());
    }

    /* access modifiers changed from: 0000 */
    public byte[] readCodewords() throws FormatException {
        int resultOffset;
        byte[] result = new byte[this.version.getTotalCodewords()];
        int resultOffset2 = 0;
        int row = 4;
        int column = 0;
        int numRows = this.mappingBitMatrix.getHeight();
        int numColumns = this.mappingBitMatrix.getWidth();
        boolean corner1Read = false;
        boolean corner2Read = false;
        boolean corner3Read = false;
        boolean corner4Read = false;
        while (true) {
            if (row == numRows && column == 0 && !corner1Read) {
                resultOffset = resultOffset2 + 1;
                result[resultOffset2] = (byte) readCorner1(numRows, numColumns);
                row -= 2;
                column += 2;
                corner1Read = true;
            } else if (row == numRows - 2 && column == 0 && (numColumns & 3) != 0 && !corner2Read) {
                resultOffset = resultOffset2 + 1;
                result[resultOffset2] = (byte) readCorner2(numRows, numColumns);
                row -= 2;
                column += 2;
                corner2Read = true;
            } else if (row == numRows + 4 && column == 2 && (numColumns & 7) == 0 && !corner3Read) {
                resultOffset = resultOffset2 + 1;
                result[resultOffset2] = (byte) readCorner3(numRows, numColumns);
                row -= 2;
                column += 2;
                corner3Read = true;
            } else if (row != numRows - 2 || column != 0 || (numColumns & 7) != 4 || corner4Read) {
                do {
                    if (row < numRows && column >= 0 && !this.readMappingMatrix.get(column, row)) {
                        int resultOffset3 = resultOffset2 + 1;
                        result[resultOffset2] = (byte) readUtah(row, column, numRows, numColumns);
                        resultOffset2 = resultOffset3;
                    }
                    row -= 2;
                    column += 2;
                    if (row < 0) {
                        break;
                    }
                } while (column < numColumns);
                int row2 = row + 1;
                int column2 = column + 3;
                do {
                    if (row2 >= 0 && column2 < numColumns && !this.readMappingMatrix.get(column2, row2)) {
                        int resultOffset4 = resultOffset2 + 1;
                        result[resultOffset2] = (byte) readUtah(row2, column2, numRows, numColumns);
                        resultOffset2 = resultOffset4;
                    }
                    row2 += 2;
                    column2 -= 2;
                    if (row2 >= numRows) {
                        break;
                    }
                } while (column2 >= 0);
                row = row2 + 3;
                column = column2 + 1;
                if (row < numRows && column >= numColumns) {
                    break;
                }
            } else {
                resultOffset = resultOffset2 + 1;
                result[resultOffset2] = (byte) readCorner4(numRows, numColumns);
                row -= 2;
                column += 2;
                corner4Read = true;
            }
            resultOffset2 = resultOffset;
            if (row < numRows) {
            }
        }
        if (resultOffset2 == this.version.getTotalCodewords()) {
            return result;
        }
        throw FormatException.getFormatInstance();
    }

    /* access modifiers changed from: 0000 */
    public boolean readModule(int row, int column, int numRows, int numColumns) {
        if (row < 0) {
            row += numRows;
            column += 4 - ((numRows + 4) & 7);
        }
        if (column < 0) {
            column += numColumns;
            row += 4 - ((numColumns + 4) & 7);
        }
        this.readMappingMatrix.set(column, row);
        return this.mappingBitMatrix.get(column, row);
    }

    /* access modifiers changed from: 0000 */
    public int readUtah(int row, int column, int numRows, int numColumns) {
        int currentByte = 0;
        if (readModule(row - 2, column - 2, numRows, numColumns)) {
            currentByte = 0 | 1;
        }
        int currentByte2 = currentByte << 1;
        if (readModule(row - 2, column - 1, numRows, numColumns)) {
            currentByte2 |= 1;
        }
        int currentByte3 = currentByte2 << 1;
        if (readModule(row - 1, column - 2, numRows, numColumns)) {
            currentByte3 |= 1;
        }
        int currentByte4 = currentByte3 << 1;
        if (readModule(row - 1, column - 1, numRows, numColumns)) {
            currentByte4 |= 1;
        }
        int currentByte5 = currentByte4 << 1;
        if (readModule(row - 1, column, numRows, numColumns)) {
            currentByte5 |= 1;
        }
        int currentByte6 = currentByte5 << 1;
        if (readModule(row, column - 2, numRows, numColumns)) {
            currentByte6 |= 1;
        }
        int currentByte7 = currentByte6 << 1;
        if (readModule(row, column - 1, numRows, numColumns)) {
            currentByte7 |= 1;
        }
        int currentByte8 = currentByte7 << 1;
        if (readModule(row, column, numRows, numColumns)) {
            return currentByte8 | 1;
        }
        return currentByte8;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner1(int numRows, int numColumns) {
        int currentByte = 0;
        if (readModule(numRows - 1, 0, numRows, numColumns)) {
            currentByte = 0 | 1;
        }
        int currentByte2 = currentByte << 1;
        if (readModule(numRows - 1, 1, numRows, numColumns)) {
            currentByte2 |= 1;
        }
        int currentByte3 = currentByte2 << 1;
        if (readModule(numRows - 1, 2, numRows, numColumns)) {
            currentByte3 |= 1;
        }
        int currentByte4 = currentByte3 << 1;
        if (readModule(0, numColumns - 2, numRows, numColumns)) {
            currentByte4 |= 1;
        }
        int currentByte5 = currentByte4 << 1;
        if (readModule(0, numColumns - 1, numRows, numColumns)) {
            currentByte5 |= 1;
        }
        int currentByte6 = currentByte5 << 1;
        if (readModule(1, numColumns - 1, numRows, numColumns)) {
            currentByte6 |= 1;
        }
        int currentByte7 = currentByte6 << 1;
        if (readModule(2, numColumns - 1, numRows, numColumns)) {
            currentByte7 |= 1;
        }
        int currentByte8 = currentByte7 << 1;
        if (readModule(3, numColumns - 1, numRows, numColumns)) {
            return currentByte8 | 1;
        }
        return currentByte8;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner2(int numRows, int numColumns) {
        int currentByte = 0;
        if (readModule(numRows - 3, 0, numRows, numColumns)) {
            currentByte = 0 | 1;
        }
        int currentByte2 = currentByte << 1;
        if (readModule(numRows - 2, 0, numRows, numColumns)) {
            currentByte2 |= 1;
        }
        int currentByte3 = currentByte2 << 1;
        if (readModule(numRows - 1, 0, numRows, numColumns)) {
            currentByte3 |= 1;
        }
        int currentByte4 = currentByte3 << 1;
        if (readModule(0, numColumns - 4, numRows, numColumns)) {
            currentByte4 |= 1;
        }
        int currentByte5 = currentByte4 << 1;
        if (readModule(0, numColumns - 3, numRows, numColumns)) {
            currentByte5 |= 1;
        }
        int currentByte6 = currentByte5 << 1;
        if (readModule(0, numColumns - 2, numRows, numColumns)) {
            currentByte6 |= 1;
        }
        int currentByte7 = currentByte6 << 1;
        if (readModule(0, numColumns - 1, numRows, numColumns)) {
            currentByte7 |= 1;
        }
        int currentByte8 = currentByte7 << 1;
        if (readModule(1, numColumns - 1, numRows, numColumns)) {
            return currentByte8 | 1;
        }
        return currentByte8;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner3(int numRows, int numColumns) {
        int currentByte = 0;
        if (readModule(numRows - 1, 0, numRows, numColumns)) {
            currentByte = 0 | 1;
        }
        int currentByte2 = currentByte << 1;
        if (readModule(numRows - 1, numColumns - 1, numRows, numColumns)) {
            currentByte2 |= 1;
        }
        int currentByte3 = currentByte2 << 1;
        if (readModule(0, numColumns - 3, numRows, numColumns)) {
            currentByte3 |= 1;
        }
        int currentByte4 = currentByte3 << 1;
        if (readModule(0, numColumns - 2, numRows, numColumns)) {
            currentByte4 |= 1;
        }
        int currentByte5 = currentByte4 << 1;
        if (readModule(0, numColumns - 1, numRows, numColumns)) {
            currentByte5 |= 1;
        }
        int currentByte6 = currentByte5 << 1;
        if (readModule(1, numColumns - 3, numRows, numColumns)) {
            currentByte6 |= 1;
        }
        int currentByte7 = currentByte6 << 1;
        if (readModule(1, numColumns - 2, numRows, numColumns)) {
            currentByte7 |= 1;
        }
        int currentByte8 = currentByte7 << 1;
        if (readModule(1, numColumns - 1, numRows, numColumns)) {
            return currentByte8 | 1;
        }
        return currentByte8;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner4(int numRows, int numColumns) {
        int currentByte = 0;
        if (readModule(numRows - 3, 0, numRows, numColumns)) {
            currentByte = 0 | 1;
        }
        int currentByte2 = currentByte << 1;
        if (readModule(numRows - 2, 0, numRows, numColumns)) {
            currentByte2 |= 1;
        }
        int currentByte3 = currentByte2 << 1;
        if (readModule(numRows - 1, 0, numRows, numColumns)) {
            currentByte3 |= 1;
        }
        int currentByte4 = currentByte3 << 1;
        if (readModule(0, numColumns - 2, numRows, numColumns)) {
            currentByte4 |= 1;
        }
        int currentByte5 = currentByte4 << 1;
        if (readModule(0, numColumns - 1, numRows, numColumns)) {
            currentByte5 |= 1;
        }
        int currentByte6 = currentByte5 << 1;
        if (readModule(1, numColumns - 1, numRows, numColumns)) {
            currentByte6 |= 1;
        }
        int currentByte7 = currentByte6 << 1;
        if (readModule(2, numColumns - 1, numRows, numColumns)) {
            currentByte7 |= 1;
        }
        int currentByte8 = currentByte7 << 1;
        if (readModule(3, numColumns - 1, numRows, numColumns)) {
            return currentByte8 | 1;
        }
        return currentByte8;
    }

    /* access modifiers changed from: 0000 */
    public BitMatrix extractDataRegion(BitMatrix bitMatrix) {
        int symbolSizeRows = this.version.getSymbolSizeRows();
        int symbolSizeColumns = this.version.getSymbolSizeColumns();
        if (bitMatrix.getHeight() == symbolSizeRows) {
            int dataRegionSizeRows = this.version.getDataRegionSizeRows();
            int dataRegionSizeColumns = this.version.getDataRegionSizeColumns();
            int numDataRegionsRow = symbolSizeRows / dataRegionSizeRows;
            int numDataRegionsColumn = symbolSizeColumns / dataRegionSizeColumns;
            BitMatrix bitMatrixWithoutAlignment = new BitMatrix(numDataRegionsColumn * dataRegionSizeColumns, numDataRegionsRow * dataRegionSizeRows);
            for (int dataRegionRow = 0; dataRegionRow < numDataRegionsRow; dataRegionRow++) {
                int dataRegionRowOffset = dataRegionRow * dataRegionSizeRows;
                for (int dataRegionColumn = 0; dataRegionColumn < numDataRegionsColumn; dataRegionColumn++) {
                    int dataRegionColumnOffset = dataRegionColumn * dataRegionSizeColumns;
                    int i = 0;
                    while (i < dataRegionSizeRows) {
                        int readRowOffset = ((dataRegionSizeRows + 2) * dataRegionRow) + 1 + i;
                        int writeRowOffset = dataRegionRowOffset + i;
                        int symbolSizeRows2 = symbolSizeRows;
                        int j = 0;
                        while (j < dataRegionSizeColumns) {
                            int symbolSizeColumns2 = symbolSizeColumns;
                            int symbolSizeColumns3 = ((dataRegionSizeColumns + 2) * dataRegionColumn) + 1 + j;
                            int dataRegionSizeRows2 = dataRegionSizeRows;
                            if (bitMatrix.get(symbolSizeColumns3, readRowOffset)) {
                                int i2 = symbolSizeColumns3;
                                bitMatrixWithoutAlignment.set(dataRegionColumnOffset + j, writeRowOffset);
                            }
                            j++;
                            symbolSizeColumns = symbolSizeColumns2;
                            dataRegionSizeRows = dataRegionSizeRows2;
                        }
                        i++;
                        symbolSizeRows = symbolSizeRows2;
                    }
                }
            }
            return bitMatrixWithoutAlignment;
        }
        BitMatrix bitMatrix2 = bitMatrix;
        int i3 = symbolSizeRows;
        int i4 = symbolSizeColumns;
        throw new IllegalArgumentException("Dimension of bitMarix must match the version size");
    }
}

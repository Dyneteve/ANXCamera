package com.google.zxing.datamatrix.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

final class BitMatrixParser {
    private final BitMatrix mappingBitMatrix;
    private final BitMatrix readMappingMatrix;
    private final Version version;

    BitMatrixParser(BitMatrix bitMatrix) throws FormatException {
        int height = bitMatrix.getHeight();
        if (height < 8 || height > 144 || (height & 1) != 0) {
            throw FormatException.getFormatInstance();
        }
        this.version = readVersion(bitMatrix);
        this.mappingBitMatrix = extractDataRegion(bitMatrix);
        this.readMappingMatrix = new BitMatrix(this.mappingBitMatrix.getWidth(), this.mappingBitMatrix.getHeight());
    }

    private static Version readVersion(BitMatrix bitMatrix) throws FormatException {
        return Version.getVersionForDimensions(bitMatrix.getHeight(), bitMatrix.getWidth());
    }

    /* access modifiers changed from: 0000 */
    public BitMatrix extractDataRegion(BitMatrix bitMatrix) {
        int symbolSizeRows = this.version.getSymbolSizeRows();
        int symbolSizeColumns = this.version.getSymbolSizeColumns();
        if (bitMatrix.getHeight() == symbolSizeRows) {
            int dataRegionSizeRows = this.version.getDataRegionSizeRows();
            int dataRegionSizeColumns = this.version.getDataRegionSizeColumns();
            int i = symbolSizeRows / dataRegionSizeRows;
            int i2 = symbolSizeColumns / dataRegionSizeColumns;
            BitMatrix bitMatrix2 = new BitMatrix(i2 * dataRegionSizeColumns, i * dataRegionSizeRows);
            for (int i3 = 0; i3 < i; i3++) {
                int i4 = i3 * dataRegionSizeRows;
                for (int i5 = 0; i5 < i2; i5++) {
                    int i6 = i5 * dataRegionSizeColumns;
                    int i7 = 0;
                    while (i7 < dataRegionSizeRows) {
                        int i8 = ((dataRegionSizeRows + 2) * i3) + 1 + i7;
                        int i9 = i4 + i7;
                        int i10 = symbolSizeRows;
                        int i11 = 0;
                        while (i11 < dataRegionSizeColumns) {
                            int i12 = symbolSizeColumns;
                            int i13 = ((dataRegionSizeColumns + 2) * i5) + 1 + i11;
                            int i14 = dataRegionSizeRows;
                            if (bitMatrix.get(i13, i8)) {
                                int i15 = i13;
                                bitMatrix2.set(i6 + i11, i9);
                            }
                            i11++;
                            symbolSizeColumns = i12;
                            dataRegionSizeRows = i14;
                        }
                        i7++;
                        symbolSizeRows = i10;
                    }
                }
            }
            return bitMatrix2;
        }
        BitMatrix bitMatrix3 = bitMatrix;
        int i16 = symbolSizeRows;
        int i17 = symbolSizeColumns;
        throw new IllegalArgumentException("Dimension of bitMarix must match the version size");
    }

    /* access modifiers changed from: 0000 */
    public Version getVersion() {
        return this.version;
    }

    /* access modifiers changed from: 0000 */
    public byte[] readCodewords() throws FormatException {
        int i;
        byte[] bArr = new byte[this.version.getTotalCodewords()];
        int i2 = 0;
        int i3 = 4;
        int i4 = 0;
        int height = this.mappingBitMatrix.getHeight();
        int width = this.mappingBitMatrix.getWidth();
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        while (true) {
            if (i3 == height && i4 == 0 && !z) {
                i = i2 + 1;
                bArr[i2] = (byte) readCorner1(height, width);
                i3 -= 2;
                i4 += 2;
                z = true;
            } else if (i3 == height - 2 && i4 == 0 && (width & 3) != 0 && !z2) {
                i = i2 + 1;
                bArr[i2] = (byte) readCorner2(height, width);
                i3 -= 2;
                i4 += 2;
                z2 = true;
            } else if (i3 == height + 4 && i4 == 2 && (width & 7) == 0 && !z3) {
                i = i2 + 1;
                bArr[i2] = (byte) readCorner3(height, width);
                i3 -= 2;
                i4 += 2;
                z3 = true;
            } else if (i3 != height - 2 || i4 != 0 || (width & 7) != 4 || z4) {
                do {
                    if (i3 < height && i4 >= 0 && !this.readMappingMatrix.get(i4, i3)) {
                        int i5 = i2 + 1;
                        bArr[i2] = (byte) readUtah(i3, i4, height, width);
                        i2 = i5;
                    }
                    i3 -= 2;
                    i4 += 2;
                    if (i3 < 0) {
                        break;
                    }
                } while (i4 < width);
                int i6 = i3 + 1;
                int i7 = i4 + 3;
                do {
                    if (i6 >= 0 && i7 < width && !this.readMappingMatrix.get(i7, i6)) {
                        int i8 = i2 + 1;
                        bArr[i2] = (byte) readUtah(i6, i7, height, width);
                        i2 = i8;
                    }
                    i6 += 2;
                    i7 -= 2;
                    if (i6 >= height) {
                        break;
                    }
                } while (i7 >= 0);
                i3 = i6 + 3;
                i4 = i7 + 1;
                if (i3 < height && i4 >= width) {
                    break;
                }
            } else {
                i = i2 + 1;
                bArr[i2] = (byte) readCorner4(height, width);
                i3 -= 2;
                i4 += 2;
                z4 = true;
            }
            i2 = i;
            if (i3 < height) {
            }
        }
        if (i2 == this.version.getTotalCodewords()) {
            return bArr;
        }
        throw FormatException.getFormatInstance();
    }

    /* access modifiers changed from: 0000 */
    public int readCorner1(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 1, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        if (readModule(i - 1, 1, i, i2)) {
            i4 |= 1;
        }
        int i5 = i4 << 1;
        if (readModule(i - 1, 2, i, i2)) {
            i5 |= 1;
        }
        int i6 = i5 << 1;
        if (readModule(0, i2 - 2, i, i2)) {
            i6 |= 1;
        }
        int i7 = i6 << 1;
        if (readModule(0, i2 - 1, i, i2)) {
            i7 |= 1;
        }
        int i8 = i7 << 1;
        if (readModule(1, i2 - 1, i, i2)) {
            i8 |= 1;
        }
        int i9 = i8 << 1;
        if (readModule(2, i2 - 1, i, i2)) {
            i9 |= 1;
        }
        int i10 = i9 << 1;
        return readModule(3, i2 + -1, i, i2) ? i10 | 1 : i10;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner2(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 3, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        if (readModule(i - 2, 0, i, i2)) {
            i4 |= 1;
        }
        int i5 = i4 << 1;
        if (readModule(i - 1, 0, i, i2)) {
            i5 |= 1;
        }
        int i6 = i5 << 1;
        if (readModule(0, i2 - 4, i, i2)) {
            i6 |= 1;
        }
        int i7 = i6 << 1;
        if (readModule(0, i2 - 3, i, i2)) {
            i7 |= 1;
        }
        int i8 = i7 << 1;
        if (readModule(0, i2 - 2, i, i2)) {
            i8 |= 1;
        }
        int i9 = i8 << 1;
        if (readModule(0, i2 - 1, i, i2)) {
            i9 |= 1;
        }
        int i10 = i9 << 1;
        return readModule(1, i2 + -1, i, i2) ? i10 | 1 : i10;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner3(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 1, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        if (readModule(i - 1, i2 - 1, i, i2)) {
            i4 |= 1;
        }
        int i5 = i4 << 1;
        if (readModule(0, i2 - 3, i, i2)) {
            i5 |= 1;
        }
        int i6 = i5 << 1;
        if (readModule(0, i2 - 2, i, i2)) {
            i6 |= 1;
        }
        int i7 = i6 << 1;
        if (readModule(0, i2 - 1, i, i2)) {
            i7 |= 1;
        }
        int i8 = i7 << 1;
        if (readModule(1, i2 - 3, i, i2)) {
            i8 |= 1;
        }
        int i9 = i8 << 1;
        if (readModule(1, i2 - 2, i, i2)) {
            i9 |= 1;
        }
        int i10 = i9 << 1;
        return readModule(1, i2 + -1, i, i2) ? i10 | 1 : i10;
    }

    /* access modifiers changed from: 0000 */
    public int readCorner4(int i, int i2) {
        int i3 = 0;
        if (readModule(i - 3, 0, i, i2)) {
            i3 = 0 | 1;
        }
        int i4 = i3 << 1;
        if (readModule(i - 2, 0, i, i2)) {
            i4 |= 1;
        }
        int i5 = i4 << 1;
        if (readModule(i - 1, 0, i, i2)) {
            i5 |= 1;
        }
        int i6 = i5 << 1;
        if (readModule(0, i2 - 2, i, i2)) {
            i6 |= 1;
        }
        int i7 = i6 << 1;
        if (readModule(0, i2 - 1, i, i2)) {
            i7 |= 1;
        }
        int i8 = i7 << 1;
        if (readModule(1, i2 - 1, i, i2)) {
            i8 |= 1;
        }
        int i9 = i8 << 1;
        if (readModule(2, i2 - 1, i, i2)) {
            i9 |= 1;
        }
        int i10 = i9 << 1;
        return readModule(3, i2 + -1, i, i2) ? i10 | 1 : i10;
    }

    /* access modifiers changed from: 0000 */
    public boolean readModule(int i, int i2, int i3, int i4) {
        if (i < 0) {
            i += i3;
            i2 += 4 - ((i3 + 4) & 7);
        }
        if (i2 < 0) {
            i2 += i4;
            i += 4 - ((i4 + 4) & 7);
        }
        this.readMappingMatrix.set(i2, i);
        return this.mappingBitMatrix.get(i2, i);
    }

    /* access modifiers changed from: 0000 */
    public int readUtah(int i, int i2, int i3, int i4) {
        int i5 = 0;
        if (readModule(i - 2, i2 - 2, i3, i4)) {
            i5 = 0 | 1;
        }
        int i6 = i5 << 1;
        if (readModule(i - 2, i2 - 1, i3, i4)) {
            i6 |= 1;
        }
        int i7 = i6 << 1;
        if (readModule(i - 1, i2 - 2, i3, i4)) {
            i7 |= 1;
        }
        int i8 = i7 << 1;
        if (readModule(i - 1, i2 - 1, i3, i4)) {
            i8 |= 1;
        }
        int i9 = i8 << 1;
        if (readModule(i - 1, i2, i3, i4)) {
            i9 |= 1;
        }
        int i10 = i9 << 1;
        if (readModule(i, i2 - 2, i3, i4)) {
            i10 |= 1;
        }
        int i11 = i10 << 1;
        if (readModule(i, i2 - 1, i3, i4)) {
            i11 |= 1;
        }
        int i12 = i11 << 1;
        return readModule(i, i2, i3, i4) ? i12 | 1 : i12;
    }
}

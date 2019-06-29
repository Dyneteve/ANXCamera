package com.google.zxing.qrcode.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;

final class BitMatrixParser {
    private final BitMatrix bitMatrix;
    private boolean mirror;
    private FormatInformation parsedFormatInfo;
    private Version parsedVersion;

    BitMatrixParser(BitMatrix bitMatrix2) throws FormatException {
        int height = bitMatrix2.getHeight();
        if (height < 21 || (height & 3) != 1) {
            throw FormatException.getFormatInstance();
        }
        this.bitMatrix = bitMatrix2;
    }

    private int copyBit(int i, int i2, int i3) {
        return this.mirror ? this.bitMatrix.get(i2, i) : this.bitMatrix.get(i, i2) ? (i3 << 1) | 1 : i3 << 1;
    }

    /* access modifiers changed from: 0000 */
    public void mirror() {
        for (int i = 0; i < this.bitMatrix.getWidth(); i++) {
            for (int i2 = i + 1; i2 < this.bitMatrix.getHeight(); i2++) {
                if (this.bitMatrix.get(i, i2) != this.bitMatrix.get(i2, i)) {
                    this.bitMatrix.flip(i2, i);
                    this.bitMatrix.flip(i, i2);
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public byte[] readCodewords() throws FormatException {
        BitMatrixParser bitMatrixParser = this;
        FormatInformation readFormatInformation = readFormatInformation();
        Version readVersion = readVersion();
        DataMask forReference = DataMask.forReference(readFormatInformation.getDataMask());
        int height = bitMatrixParser.bitMatrix.getHeight();
        forReference.unmaskBitMatrix(bitMatrixParser.bitMatrix, height);
        BitMatrix buildFunctionPattern = readVersion.buildFunctionPattern();
        boolean z = true;
        byte[] bArr = new byte[readVersion.getTotalCodewords()];
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = height - 1;
        while (i4 > 0) {
            if (i4 == 6) {
                i4--;
            }
            int i5 = 0;
            while (i5 < height) {
                int i6 = z ? (height - 1) - i5 : i5;
                int i7 = 0;
                while (i7 < 2) {
                    if (!buildFunctionPattern.get(i4 - i7, i6)) {
                        i3++;
                        i2 <<= 1;
                        if (bitMatrixParser.bitMatrix.get(i4 - i7, i6)) {
                            i2 |= 1;
                        }
                        if (i3 == 8) {
                            int i8 = i + 1;
                            bArr[i] = (byte) i2;
                            i2 = 0;
                            i3 = 0;
                            i = i8;
                        }
                    }
                    i7++;
                    bitMatrixParser = this;
                }
                i5++;
            }
            z = !z;
            i4 -= 2;
        }
        if (i == readVersion.getTotalCodewords()) {
            return bArr;
        }
        throw FormatException.getFormatInstance();
    }

    /* access modifiers changed from: 0000 */
    public FormatInformation readFormatInformation() throws FormatException {
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        int i = 0;
        for (int i2 = 0; i2 < 6; i2++) {
            i = copyBit(i2, 8, i);
        }
        int copyBit = copyBit(8, 7, copyBit(8, 8, copyBit(7, 8, i)));
        for (int i3 = 5; i3 >= 0; i3--) {
            copyBit = copyBit(8, i3, copyBit);
        }
        int height = this.bitMatrix.getHeight();
        int i4 = 0;
        int i5 = height - 7;
        for (int i6 = height - 1; i6 >= i5; i6--) {
            i4 = copyBit(8, i6, i4);
        }
        for (int i7 = height - 8; i7 < height; i7++) {
            i4 = copyBit(i7, 8, i4);
        }
        this.parsedFormatInfo = FormatInformation.decodeFormatInformation(copyBit, i4);
        if (this.parsedFormatInfo != null) {
            return this.parsedFormatInfo;
        }
        throw FormatException.getFormatInstance();
    }

    /* access modifiers changed from: 0000 */
    public Version readVersion() throws FormatException {
        if (this.parsedVersion != null) {
            return this.parsedVersion;
        }
        int height = this.bitMatrix.getHeight();
        int i = (height - 17) / 4;
        if (i <= 6) {
            return Version.getVersionForNumber(i);
        }
        int i2 = 0;
        int i3 = height - 11;
        for (int i4 = 5; i4 >= 0; i4--) {
            for (int i5 = height - 9; i5 >= i3; i5--) {
                i2 = copyBit(i5, i4, i2);
            }
        }
        Version decodeVersionInformation = Version.decodeVersionInformation(i2);
        if (decodeVersionInformation == null || decodeVersionInformation.getDimensionForVersion() != height) {
            int i6 = 0;
            for (int i7 = 5; i7 >= 0; i7--) {
                for (int i8 = height - 9; i8 >= i3; i8--) {
                    i6 = copyBit(i7, i8, i6);
                }
            }
            Version decodeVersionInformation2 = Version.decodeVersionInformation(i6);
            if (decodeVersionInformation2 == null || decodeVersionInformation2.getDimensionForVersion() != height) {
                throw FormatException.getFormatInstance();
            }
            this.parsedVersion = decodeVersionInformation2;
            return decodeVersionInformation2;
        }
        this.parsedVersion = decodeVersionInformation;
        return decodeVersionInformation;
    }

    /* access modifiers changed from: 0000 */
    public void remask() {
        if (this.parsedFormatInfo != null) {
            DataMask.forReference(this.parsedFormatInfo.getDataMask()).unmaskBitMatrix(this.bitMatrix, this.bitMatrix.getHeight());
        }
    }

    /* access modifiers changed from: 0000 */
    public void setMirror(boolean z) {
        this.parsedVersion = null;
        this.parsedFormatInfo = null;
        this.mirror = z;
    }
}

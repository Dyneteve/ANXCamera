package com.google.zxing.datamatrix.decoder;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int i, byte[] bArr) {
        this.numDataCodewords = i;
        this.codewords = bArr;
    }

    static DataBlock[] getDataBlocks(byte[] bArr, Version version) {
        byte[] bArr2 = bArr;
        ECBlocks eCBlocks = version.getECBlocks();
        ECB[] eCBlocks2 = eCBlocks.getECBlocks();
        int i = 0;
        for (ECB count : eCBlocks2) {
            i += count.getCount();
        }
        DataBlock[] dataBlockArr = new DataBlock[i];
        int i2 = 0;
        for (ECB ecb : eCBlocks2) {
            int i3 = 0;
            while (i3 < ecb.getCount()) {
                int dataCodewords = ecb.getDataCodewords();
                int i4 = i2 + 1;
                dataBlockArr[i2] = new DataBlock(dataCodewords, new byte[(eCBlocks.getECCodewords() + dataCodewords)]);
                i3++;
                i2 = i4;
            }
        }
        int length = dataBlockArr[0].codewords.length;
        int eCCodewords = length - eCBlocks.getECCodewords();
        int i5 = eCCodewords - 1;
        int i6 = 0;
        int i7 = 0;
        while (i7 < i5) {
            int i8 = length;
            int i9 = 0;
            while (i9 < i2) {
                int i10 = i6 + 1;
                dataBlockArr[i9].codewords[i7] = bArr2[i6];
                i9++;
                i6 = i10;
            }
            i7++;
            length = i8;
        }
        boolean z = version.getVersionNumber() == 24;
        int i11 = z ? 8 : i2;
        int i12 = 0;
        while (i12 < i11) {
            int i13 = length;
            int i14 = i6 + 1;
            dataBlockArr[i12].codewords[eCCodewords - 1] = bArr2[i6];
            i12++;
            i6 = i14;
            length = i13;
        }
        int length2 = dataBlockArr[0].codewords.length;
        for (int i15 = eCCodewords; i15 < length2; i15++) {
            int i16 = 0;
            while (i16 < i2) {
                int i17 = (!z || i16 <= 7) ? i15 : i15 - 1;
                int i18 = length;
                int i19 = i6 + 1;
                dataBlockArr[i16].codewords[i17] = bArr2[i6];
                i16++;
                length = i18;
                i6 = i19;
            }
        }
        if (i6 == bArr2.length) {
            return dataBlockArr;
        }
        throw new IllegalArgumentException();
    }

    /* access modifiers changed from: 0000 */
    public byte[] getCodewords() {
        return this.codewords;
    }

    /* access modifiers changed from: 0000 */
    public int getNumDataCodewords() {
        return this.numDataCodewords;
    }
}

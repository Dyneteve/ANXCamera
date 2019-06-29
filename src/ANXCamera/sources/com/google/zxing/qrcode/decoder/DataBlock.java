package com.google.zxing.qrcode.decoder;

import com.google.zxing.qrcode.decoder.Version.ECB;
import com.google.zxing.qrcode.decoder.Version.ECBlocks;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int i, byte[] bArr) {
        this.numDataCodewords = i;
        this.codewords = bArr;
    }

    static DataBlock[] getDataBlocks(byte[] bArr, Version version, ErrorCorrectionLevel errorCorrectionLevel) {
        byte[] bArr2 = bArr;
        if (bArr2.length == version.getTotalCodewords()) {
            ECBlocks eCBlocksForLevel = version.getECBlocksForLevel(errorCorrectionLevel);
            ECB[] eCBlocks = eCBlocksForLevel.getECBlocks();
            int i = 0;
            for (ECB count : eCBlocks) {
                i += count.getCount();
            }
            DataBlock[] dataBlockArr = new DataBlock[i];
            int i2 = 0;
            for (ECB ecb : eCBlocks) {
                int i3 = 0;
                while (i3 < ecb.getCount()) {
                    int dataCodewords = ecb.getDataCodewords();
                    int i4 = i2 + 1;
                    dataBlockArr[i2] = new DataBlock(dataCodewords, new byte[(eCBlocksForLevel.getECCodewordsPerBlock() + dataCodewords)]);
                    i3++;
                    i2 = i4;
                }
            }
            int length = dataBlockArr[0].codewords.length;
            int length2 = dataBlockArr.length - 1;
            while (length2 >= 0 && dataBlockArr[length2].codewords.length != length) {
                length2--;
            }
            int i5 = length2 + 1;
            int eCCodewordsPerBlock = length - eCBlocksForLevel.getECCodewordsPerBlock();
            int i6 = 0;
            for (int i7 = 0; i7 < eCCodewordsPerBlock; i7++) {
                int i8 = 0;
                while (i8 < i2) {
                    int i9 = i6 + 1;
                    dataBlockArr[i8].codewords[i7] = bArr2[i6];
                    i8++;
                    i6 = i9;
                }
            }
            int i10 = i5;
            while (i10 < i2) {
                int i11 = i6 + 1;
                dataBlockArr[i10].codewords[eCCodewordsPerBlock] = bArr2[i6];
                i10++;
                i6 = i11;
            }
            int length3 = dataBlockArr[0].codewords.length;
            int i12 = eCCodewordsPerBlock;
            while (i12 < length3) {
                int i13 = 0;
                while (i13 < i2) {
                    int i14 = i6 + 1;
                    dataBlockArr[i13].codewords[i13 < i5 ? i12 : i12 + 1] = bArr2[i6];
                    i13++;
                    i6 = i14;
                }
                i12++;
            }
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

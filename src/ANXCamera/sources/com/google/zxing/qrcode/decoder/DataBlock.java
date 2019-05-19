package com.google.zxing.qrcode.decoder;

import com.google.zxing.qrcode.decoder.Version.ECB;
import com.google.zxing.qrcode.decoder.Version.ECBlocks;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int numDataCodewords2, byte[] codewords2) {
        this.numDataCodewords = numDataCodewords2;
        this.codewords = codewords2;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version, ErrorCorrectionLevel ecLevel) {
        byte[] bArr = rawCodewords;
        if (bArr.length == version.getTotalCodewords()) {
            ECBlocks ecBlocks = version.getECBlocksForLevel(ecLevel);
            ECB[] ecBlockArray = ecBlocks.getECBlocks();
            int totalBlocks = 0;
            for (ECB ecBlock : ecBlockArray) {
                totalBlocks += ecBlock.getCount();
            }
            DataBlock[] result = new DataBlock[totalBlocks];
            int numResultBlocks = 0;
            for (ECB ecBlock2 : ecBlockArray) {
                int i = 0;
                while (i < ecBlock2.getCount()) {
                    int numDataCodewords2 = ecBlock2.getDataCodewords();
                    int numResultBlocks2 = numResultBlocks + 1;
                    result[numResultBlocks] = new DataBlock(numDataCodewords2, new byte[(ecBlocks.getECCodewordsPerBlock() + numDataCodewords2)]);
                    i++;
                    numResultBlocks = numResultBlocks2;
                }
            }
            int shorterBlocksTotalCodewords = result[0].codewords.length;
            int longerBlocksStartAt = result.length - 1;
            while (longerBlocksStartAt >= 0 && result[longerBlocksStartAt].codewords.length != shorterBlocksTotalCodewords) {
                longerBlocksStartAt--;
            }
            int longerBlocksStartAt2 = longerBlocksStartAt + 1;
            int shorterBlocksNumDataCodewords = shorterBlocksTotalCodewords - ecBlocks.getECCodewordsPerBlock();
            int rawCodewordsOffset = 0;
            for (int i2 = 0; i2 < shorterBlocksNumDataCodewords; i2++) {
                int j = 0;
                while (j < numResultBlocks) {
                    int rawCodewordsOffset2 = rawCodewordsOffset + 1;
                    result[j].codewords[i2] = bArr[rawCodewordsOffset];
                    j++;
                    rawCodewordsOffset = rawCodewordsOffset2;
                }
            }
            int j2 = longerBlocksStartAt2;
            while (j2 < numResultBlocks) {
                int rawCodewordsOffset3 = rawCodewordsOffset + 1;
                result[j2].codewords[shorterBlocksNumDataCodewords] = bArr[rawCodewordsOffset];
                j2++;
                rawCodewordsOffset = rawCodewordsOffset3;
            }
            int max = result[0].codewords.length;
            int i3 = shorterBlocksNumDataCodewords;
            while (i3 < max) {
                int j3 = 0;
                while (j3 < numResultBlocks) {
                    int rawCodewordsOffset4 = rawCodewordsOffset + 1;
                    result[j3].codewords[j3 < longerBlocksStartAt2 ? i3 : i3 + 1] = bArr[rawCodewordsOffset];
                    j3++;
                    rawCodewordsOffset = rawCodewordsOffset4;
                }
                i3++;
            }
            return result;
        }
        throw new IllegalArgumentException();
    }

    /* access modifiers changed from: 0000 */
    public int getNumDataCodewords() {
        return this.numDataCodewords;
    }

    /* access modifiers changed from: 0000 */
    public byte[] getCodewords() {
        return this.codewords;
    }
}

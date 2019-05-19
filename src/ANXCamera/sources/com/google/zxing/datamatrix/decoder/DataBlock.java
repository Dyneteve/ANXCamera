package com.google.zxing.datamatrix.decoder;

final class DataBlock {
    private final byte[] codewords;
    private final int numDataCodewords;

    private DataBlock(int numDataCodewords2, byte[] codewords2) {
        this.numDataCodewords = numDataCodewords2;
        this.codewords = codewords2;
    }

    static DataBlock[] getDataBlocks(byte[] rawCodewords, Version version) {
        byte[] bArr = rawCodewords;
        ECBlocks ecBlocks = version.getECBlocks();
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
                result[numResultBlocks] = new DataBlock(numDataCodewords2, new byte[(ecBlocks.getECCodewords() + numDataCodewords2)]);
                i++;
                numResultBlocks = numResultBlocks2;
            }
        }
        int longerBlocksTotalCodewords = result[0].codewords.length;
        int longerBlocksNumDataCodewords = longerBlocksTotalCodewords - ecBlocks.getECCodewords();
        int shorterBlocksNumDataCodewords = longerBlocksNumDataCodewords - 1;
        int rawCodewordsOffset = 0;
        int i2 = 0;
        while (i2 < shorterBlocksNumDataCodewords) {
            int longerBlocksTotalCodewords2 = longerBlocksTotalCodewords;
            int j = 0;
            while (j < numResultBlocks) {
                int rawCodewordsOffset2 = rawCodewordsOffset + 1;
                result[j].codewords[i2] = bArr[rawCodewordsOffset];
                j++;
                rawCodewordsOffset = rawCodewordsOffset2;
            }
            i2++;
            longerBlocksTotalCodewords = longerBlocksTotalCodewords2;
        }
        boolean specialVersion = version.getVersionNumber() == 24;
        int numLongerBlocks = specialVersion ? 8 : numResultBlocks;
        int j2 = 0;
        while (j2 < numLongerBlocks) {
            int longerBlocksTotalCodewords3 = longerBlocksTotalCodewords;
            int rawCodewordsOffset3 = rawCodewordsOffset + 1;
            result[j2].codewords[longerBlocksNumDataCodewords - 1] = bArr[rawCodewordsOffset];
            j2++;
            rawCodewordsOffset = rawCodewordsOffset3;
            longerBlocksTotalCodewords = longerBlocksTotalCodewords3;
        }
        int max = result[0].codewords.length;
        for (int i3 = longerBlocksNumDataCodewords; i3 < max; i3++) {
            int j3 = 0;
            while (j3 < numResultBlocks) {
                int iOffset = (!specialVersion || j3 <= 7) ? i3 : i3 - 1;
                int longerBlocksTotalCodewords4 = longerBlocksTotalCodewords;
                int rawCodewordsOffset4 = rawCodewordsOffset + 1;
                result[j3].codewords[iOffset] = bArr[rawCodewordsOffset];
                j3++;
                longerBlocksTotalCodewords = longerBlocksTotalCodewords4;
                rawCodewordsOffset = rawCodewordsOffset4;
            }
        }
        if (rawCodewordsOffset == bArr.length) {
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

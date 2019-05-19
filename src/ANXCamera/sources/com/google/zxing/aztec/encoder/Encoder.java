package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonEncoder;

public final class Encoder {
    public static final int DEFAULT_AZTEC_LAYERS = 0;
    public static final int DEFAULT_EC_PERCENT = 33;
    private static final int MAX_NB_BITS = 32;
    private static final int MAX_NB_BITS_COMPACT = 4;
    private static final int[] WORD_SIZE = {4, 6, 6, 8, 8, 8, 8, 8, 8, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

    private Encoder() {
    }

    public static AztecCode encode(byte[] data) {
        return encode(data, 33, 0);
    }

    public static AztecCode encode(byte[] data, int minECCPercent, int userSpecifiedLayers) {
        int totalBitsInLayer;
        int layers;
        boolean compact;
        int wordSize;
        BitArray stuffedBits;
        int matrixSize;
        int totalSizeBits;
        BitArray stuffedBits2;
        int totalSizeBits2;
        int eccBits;
        BitArray bits;
        boolean z;
        BitArray bits2 = new HighLevelEncoder(data).encode();
        int i = 11;
        int eccBits2 = ((bits2.getSize() * minECCPercent) / 100) + 11;
        int totalSizeBits3 = bits2.getSize() + eccBits2;
        int i2 = 32;
        boolean z2 = false;
        boolean z3 = true;
        if (userSpecifiedLayers != 0) {
            compact = userSpecifiedLayers < 0;
            layers = Math.abs(userSpecifiedLayers);
            if (compact) {
                i2 = 4;
            }
            if (layers <= i2) {
                int totalBitsInLayer2 = totalBitsInLayer(layers, compact);
                wordSize = WORD_SIZE[layers];
                int usableBitsInLayers = totalBitsInLayer2 - (totalBitsInLayer2 % wordSize);
                BitArray stuffedBits3 = stuffBits(bits2, wordSize);
                if (stuffedBits3.getSize() + eccBits2 > usableBitsInLayers) {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                } else if (!compact || stuffedBits3.getSize() <= wordSize * 64) {
                    totalBitsInLayer = totalBitsInLayer2;
                    stuffedBits = stuffedBits3;
                } else {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                }
            } else {
                throw new IllegalArgumentException(String.format("Illegal value %s for layers", new Object[]{Integer.valueOf(userSpecifiedLayers)}));
            }
        } else {
            BitArray stuffedBits4 = null;
            int wordSize2 = 0;
            int i3 = 0;
            while (i3 <= i2) {
                boolean compact2 = i3 <= 3 ? z3 : z2;
                int layers2 = compact2 ? i3 + 1 : i3;
                totalBitsInLayer = totalBitsInLayer(layers2, compact2);
                if (totalSizeBits3 > totalBitsInLayer) {
                    bits = bits2;
                    eccBits = eccBits2;
                    totalSizeBits2 = totalSizeBits3;
                    z = z3;
                } else {
                    if (wordSize2 != WORD_SIZE[layers2]) {
                        int wordSize3 = WORD_SIZE[layers2];
                        stuffedBits4 = stuffBits(bits2, wordSize3);
                        wordSize2 = wordSize3;
                    }
                    int usableBitsInLayers2 = totalBitsInLayer - (totalBitsInLayer % wordSize2);
                    if (compact2 && stuffedBits4.getSize() > wordSize2 * 64) {
                        bits = bits2;
                        eccBits = eccBits2;
                        totalSizeBits2 = totalSizeBits3;
                        z = true;
                    } else if (stuffedBits4.getSize() + eccBits2 <= usableBitsInLayers2) {
                        stuffedBits = stuffedBits4;
                        wordSize = wordSize2;
                        compact = compact2;
                        layers = layers2;
                    } else {
                        bits = bits2;
                        eccBits = eccBits2;
                        totalSizeBits2 = totalSizeBits3;
                        z = true;
                    }
                }
                i3++;
                z3 = z;
                bits2 = bits;
                eccBits2 = eccBits;
                totalSizeBits3 = totalSizeBits2;
                byte[] bArr = data;
                i2 = 32;
                z2 = false;
            }
            int i4 = eccBits2;
            int i5 = totalSizeBits3;
            throw new IllegalArgumentException("Data too large for an Aztec code");
        }
        boolean compact3 = compact;
        int layers3 = layers;
        BitArray messageBits = generateCheckWords(stuffedBits, totalBitsInLayer, wordSize);
        int messageSizeInWords = stuffedBits.getSize() / wordSize;
        BitArray modeMessage = generateModeMessage(compact3, layers3, messageSizeInWords);
        if (!compact3) {
            i = 14;
        }
        int baseMatrixSize = i + (layers3 * 4);
        int[] alignmentMap = new int[baseMatrixSize];
        if (compact3) {
            matrixSize = baseMatrixSize;
            int i6 = 0;
            while (true) {
                BitArray bits3 = bits2;
                if (i6 >= alignmentMap.length) {
                    break;
                }
                alignmentMap[i6] = i6;
                i6++;
                bits2 = bits3;
            }
        } else {
            matrixSize = baseMatrixSize + 1 + ((((baseMatrixSize / 2) - 1) / 15) * 2);
            int origCenter = baseMatrixSize / 2;
            int center = matrixSize / 2;
            int i7 = 0;
            while (i7 < origCenter) {
                int eccBits3 = eccBits2;
                int totalSizeBits4 = totalSizeBits3;
                BitArray stuffedBits5 = stuffedBits;
                int newOffset = (i7 / 15) + i7;
                alignmentMap[(origCenter - i7) - 1] = (center - newOffset) - 1;
                alignmentMap[origCenter + i7] = center + newOffset + 1;
                i7++;
                int eccBits4 = eccBits3;
                int totalSizeBits5 = totalSizeBits4;
                BitArray stuffedBits6 = stuffedBits5;
            }
        }
        int matrixSize2 = matrixSize;
        BitMatrix matrix = new BitMatrix(matrixSize2);
        int i8 = 0;
        int rowOffset = 0;
        while (i8 < layers3) {
            int eccBits5 = eccBits2;
            int rowSize = compact3 ? ((layers3 - i8) * 4) + 9 : ((layers3 - i8) * 4) + 12;
            int j = 0;
            while (j < rowSize) {
                int columnOffset = j * 2;
                int matrixSize3 = matrixSize2;
                int k = 0;
                while (true) {
                    totalSizeBits = totalSizeBits3;
                    if (k >= 2) {
                        break;
                    }
                    if (messageBits.get(rowOffset + columnOffset + k)) {
                        stuffedBits2 = stuffedBits;
                        matrix.set(alignmentMap[(i8 * 2) + k], alignmentMap[(i8 * 2) + j]);
                    } else {
                        stuffedBits2 = stuffedBits;
                    }
                    if (messageBits.get(rowOffset + (rowSize * 2) + columnOffset + k)) {
                        matrix.set(alignmentMap[(i8 * 2) + j], alignmentMap[((baseMatrixSize - 1) - (i8 * 2)) - k]);
                    }
                    if (messageBits.get(rowOffset + (rowSize * 4) + columnOffset + k)) {
                        matrix.set(alignmentMap[((baseMatrixSize - 1) - (i8 * 2)) - k], alignmentMap[((baseMatrixSize - 1) - (i8 * 2)) - j]);
                    }
                    if (messageBits.get(rowOffset + (rowSize * 6) + columnOffset + k)) {
                        matrix.set(alignmentMap[((baseMatrixSize - 1) - (i8 * 2)) - j], alignmentMap[(i8 * 2) + k]);
                    }
                    k++;
                    totalSizeBits3 = totalSizeBits;
                    stuffedBits = stuffedBits2;
                }
                j++;
                matrixSize2 = matrixSize3;
                totalSizeBits3 = totalSizeBits;
            }
            rowOffset += rowSize * 8;
            i8++;
            eccBits2 = eccBits5;
        }
        drawModeMessage(matrix, compact3, matrixSize2, modeMessage);
        if (compact3) {
            int i9 = eccBits2;
            drawBullsEye(matrix, matrixSize2 / 2, 5);
        } else {
            drawBullsEye(matrix, matrixSize2 / 2, 7);
            int j2 = 0;
            int i10 = 0;
            while (i10 < (baseMatrixSize / 2) - 1) {
                int k2 = (matrixSize2 / 2) & 1;
                while (k2 < matrixSize2) {
                    int i11 = i10;
                    matrix.set((matrixSize2 / 2) - j2, k2);
                    matrix.set((matrixSize2 / 2) + j2, k2);
                    matrix.set(k2, (matrixSize2 / 2) - j2);
                    matrix.set(k2, (matrixSize2 / 2) + j2);
                    k2 += 2;
                    i10 = i11;
                }
                i10 += 15;
                j2 += 16;
            }
        }
        AztecCode aztec = new AztecCode();
        aztec.setCompact(compact3);
        aztec.setSize(matrixSize2);
        aztec.setLayers(layers3);
        aztec.setCodeWords(messageSizeInWords);
        aztec.setMatrix(matrix);
        return aztec;
    }

    private static void drawBullsEye(BitMatrix matrix, int center, int size) {
        for (int i = 0; i < size; i += 2) {
            for (int j = center - i; j <= center + i; j++) {
                matrix.set(j, center - i);
                matrix.set(j, center + i);
                matrix.set(center - i, j);
                matrix.set(center + i, j);
            }
        }
        matrix.set(center - size, center - size);
        matrix.set((center - size) + 1, center - size);
        matrix.set(center - size, (center - size) + 1);
        matrix.set(center + size, center - size);
        matrix.set(center + size, (center - size) + 1);
        matrix.set(center + size, (center + size) - 1);
    }

    static BitArray generateModeMessage(boolean compact, int layers, int messageSizeInWords) {
        BitArray modeMessage = new BitArray();
        if (compact) {
            modeMessage.appendBits(layers - 1, 2);
            modeMessage.appendBits(messageSizeInWords - 1, 6);
            return generateCheckWords(modeMessage, 28, 4);
        }
        modeMessage.appendBits(layers - 1, 5);
        modeMessage.appendBits(messageSizeInWords - 1, 11);
        return generateCheckWords(modeMessage, 40, 4);
    }

    private static void drawModeMessage(BitMatrix matrix, boolean compact, int matrixSize, BitArray modeMessage) {
        int center = matrixSize / 2;
        if (compact) {
            for (int i = 0; i < 7; i++) {
                int offset = (center - 3) + i;
                if (modeMessage.get(i)) {
                    matrix.set(offset, center - 5);
                }
                if (modeMessage.get(i + 7)) {
                    matrix.set(center + 5, offset);
                }
                if (modeMessage.get(20 - i)) {
                    matrix.set(offset, center + 5);
                }
                if (modeMessage.get(27 - i)) {
                    matrix.set(center - 5, offset);
                }
            }
            return;
        }
        for (int i2 = 0; i2 < 10; i2++) {
            int offset2 = (center - 5) + i2 + (i2 / 5);
            if (modeMessage.get(i2)) {
                matrix.set(offset2, center - 7);
            }
            if (modeMessage.get(i2 + 10)) {
                matrix.set(center + 7, offset2);
            }
            if (modeMessage.get(29 - i2)) {
                matrix.set(offset2, center + 7);
            }
            if (modeMessage.get(39 - i2)) {
                matrix.set(center - 7, offset2);
            }
        }
    }

    private static BitArray generateCheckWords(BitArray bitArray, int totalBits, int wordSize) {
        int messageSizeInWords = bitArray.getSize() / wordSize;
        ReedSolomonEncoder rs = new ReedSolomonEncoder(getGF(wordSize));
        int totalWords = totalBits / wordSize;
        int[] messageWords = bitsToWords(bitArray, wordSize, totalWords);
        rs.encode(messageWords, totalWords - messageSizeInWords);
        int startPad = totalBits % wordSize;
        BitArray messageBits = new BitArray();
        messageBits.appendBits(0, startPad);
        for (int messageWord : messageWords) {
            messageBits.appendBits(messageWord, wordSize);
        }
        return messageBits;
    }

    private static int[] bitsToWords(BitArray stuffedBits, int wordSize, int totalWords) {
        int[] message = new int[totalWords];
        int n = stuffedBits.getSize() / wordSize;
        for (int i = 0; i < n; i++) {
            int value = 0;
            for (int j = 0; j < wordSize; j++) {
                value |= stuffedBits.get((i * wordSize) + j) ? 1 << ((wordSize - j) - 1) : 0;
            }
            message[i] = value;
        }
        return message;
    }

    private static GenericGF getGF(int wordSize) {
        if (wordSize == 4) {
            return GenericGF.AZTEC_PARAM;
        }
        if (wordSize == 6) {
            return GenericGF.AZTEC_DATA_6;
        }
        if (wordSize == 8) {
            return GenericGF.AZTEC_DATA_8;
        }
        if (wordSize == 10) {
            return GenericGF.AZTEC_DATA_10;
        }
        if (wordSize != 12) {
            return null;
        }
        return GenericGF.AZTEC_DATA_12;
    }

    static BitArray stuffBits(BitArray bits, int wordSize) {
        BitArray out = new BitArray();
        int n = bits.getSize();
        int mask = (1 << wordSize) - 2;
        int i = 0;
        while (i < n) {
            int word = 0;
            int j = 0;
            while (j < wordSize) {
                if (i + j >= n || bits.get(i + j)) {
                    word |= 1 << ((wordSize - 1) - j);
                }
                j++;
            }
            if ((word & mask) == mask) {
                out.appendBits(word & mask, wordSize);
                i--;
            } else if ((word & mask) == 0) {
                out.appendBits(word | 1, wordSize);
                i--;
            } else {
                out.appendBits(word, wordSize);
            }
            i += wordSize;
        }
        return out;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (16 * layers)) * layers;
    }
}

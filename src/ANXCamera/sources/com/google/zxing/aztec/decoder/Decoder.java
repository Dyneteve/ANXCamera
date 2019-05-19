package com.google.zxing.aztec.decoder;

import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.gallery3d.exif.ExifInterface.GpsLatitudeRef;
import com.android.gallery3d.exif.ExifInterface.GpsLongitudeRef;
import com.android.gallery3d.exif.ExifInterface.GpsSpeedRef;
import com.android.gallery3d.exif.ExifInterface.GpsStatus;
import com.android.gallery3d.exif.ExifInterface.GpsTrackRef;
import com.google.zxing.FormatException;
import com.google.zxing.aztec.AztecDetectorResult;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import java.util.Arrays;

public final class Decoder {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table;
    private static final String[] DIGIT_TABLE = {"CTRL_PS", " ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", "CTRL_UL", "CTRL_US"};
    private static final String[] LOWER_TABLE = {"CTRL_PS", " ", SupportedConfigFactory.CLOSE_BY_HHT, SupportedConfigFactory.CLOSE_BY_GROUP, SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION, SupportedConfigFactory.CLOSE_BY_BURST_SHOOT, SupportedConfigFactory.CLOSE_BY_AI, SupportedConfigFactory.CLOSE_BY_BOKEH, SupportedConfigFactory.CLOSE_BY_HDR, SupportedConfigFactory.CLOSE_BY_VIDEO, SupportedConfigFactory.CLOSE_BY_ULTRA_WIDE, SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, SupportedConfigFactory.CLOSE_BY_FILTER, SupportedConfigFactory.CLOSE_BY_SQUARE, SupportedConfigFactory.CLOSE_BY_MACRO_MODE, "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = {"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = {"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] UPPER_TABLE = {"CTRL_PS", " ", GpsStatus.IN_PROGRESS, "B", "C", "D", GpsLongitudeRef.EAST, "F", "G", "H", "I", "J", GpsSpeedRef.KILOMETERS, "L", "M", "N", "O", "P", "Q", "R", GpsLatitudeRef.SOUTH, GpsTrackRef.TRUE_DIRECTION, "U", GpsStatus.INTEROPERABILITY, GpsLongitudeRef.WEST, "X", "Y", "Z", "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private AztecDetectorResult ddata;

    private enum Table {
        UPPER,
        LOWER,
        MIXED,
        DIGIT,
        PUNCT,
        BINARY
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table;
        if (iArr != null) {
            return iArr;
        }
        int[] iArr2 = new int[Table.values().length];
        try {
            iArr2[Table.BINARY.ordinal()] = 6;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr2[Table.DIGIT.ordinal()] = 4;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr2[Table.LOWER.ordinal()] = 2;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr2[Table.MIXED.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr2[Table.PUNCT.ordinal()] = 5;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr2[Table.UPPER.ordinal()] = 1;
        } catch (NoSuchFieldError e6) {
        }
        $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table = iArr2;
        return iArr2;
    }

    public DecoderResult decode(AztecDetectorResult detectorResult) throws FormatException {
        this.ddata = detectorResult;
        return new DecoderResult(null, getEncodedData(correctBits(extractBits(detectorResult.getBits()))), null, null);
    }

    public static String highLevelDecode(boolean[] correctedBits) {
        return getEncodedData(correctedBits);
    }

    private static String getEncodedData(boolean[] correctedBits) {
        int endIndex = correctedBits.length;
        Table latchTable = Table.UPPER;
        Table shiftTable = Table.UPPER;
        StringBuilder result = new StringBuilder(20);
        int index = 0;
        while (index < endIndex) {
            if (shiftTable != Table.BINARY) {
                int size = shiftTable == Table.DIGIT ? 4 : 5;
                if (endIndex - index < size) {
                    break;
                }
                int code = readCode(correctedBits, index, size);
                index += size;
                String str = getCharacter(shiftTable, code);
                if (str.startsWith("CTRL_")) {
                    shiftTable = getTable(str.charAt(5));
                    if (str.charAt(6) == 'L') {
                        latchTable = shiftTable;
                    }
                } else {
                    result.append(str);
                    shiftTable = latchTable;
                }
            } else if (endIndex - index < 5) {
                break;
            } else {
                int length = readCode(correctedBits, index, 5);
                index += 5;
                if (length == 0) {
                    if (endIndex - index < 11) {
                        break;
                    }
                    length = readCode(correctedBits, index, 11) + 31;
                    index += 11;
                }
                int charCount = 0;
                while (true) {
                    if (charCount >= length) {
                        break;
                    } else if (endIndex - index < 8) {
                        index = endIndex;
                        break;
                    } else {
                        result.append((char) readCode(correctedBits, index, 8));
                        index += 8;
                        charCount++;
                    }
                }
                shiftTable = latchTable;
            }
        }
        return result.toString();
    }

    private static Table getTable(char t) {
        if (t == 'B') {
            return Table.BINARY;
        }
        if (t == 'D') {
            return Table.DIGIT;
        }
        if (t == 'P') {
            return Table.PUNCT;
        }
        switch (t) {
            case 'L':
                return Table.LOWER;
            case 'M':
                return Table.MIXED;
            default:
                return Table.UPPER;
        }
    }

    private static String getCharacter(Table table, int code) {
        switch ($SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[table.ordinal()]) {
            case 1:
                return UPPER_TABLE[code];
            case 2:
                return LOWER_TABLE[code];
            case 3:
                return MIXED_TABLE[code];
            case 4:
                return DIGIT_TABLE[code];
            case 5:
                return PUNCT_TABLE[code];
            default:
                throw new IllegalStateException("Bad table");
        }
    }

    private boolean[] correctBits(boolean[] rawbits) throws FormatException {
        int codewordSize;
        GenericGF gf;
        boolean[] zArr = rawbits;
        if (this.ddata.getNbLayers() <= 2) {
            codewordSize = 6;
            gf = GenericGF.AZTEC_DATA_6;
        } else if (this.ddata.getNbLayers() <= 8) {
            codewordSize = 8;
            gf = GenericGF.AZTEC_DATA_8;
        } else if (this.ddata.getNbLayers() <= 22) {
            codewordSize = 10;
            gf = GenericGF.AZTEC_DATA_10;
        } else {
            codewordSize = 12;
            gf = GenericGF.AZTEC_DATA_12;
        }
        int codewordSize2 = codewordSize;
        int numDataCodewords = this.ddata.getNbDatablocks();
        int numCodewords = zArr.length / codewordSize2;
        if (numCodewords >= numDataCodewords) {
            int numECCodewords = numCodewords - numDataCodewords;
            int[] dataWords = new int[numCodewords];
            int i = 0;
            int offset = zArr.length % codewordSize2;
            while (i < numCodewords) {
                dataWords[i] = readCode(zArr, offset, codewordSize2);
                i++;
                offset += codewordSize2;
            }
            try {
                new ReedSolomonDecoder(gf).decode(dataWords, numECCodewords);
                int i2 = 1;
                int mask = (1 << codewordSize2) - 1;
                int stuffedBits = 0;
                int i3 = 0;
                while (i3 < numDataCodewords) {
                    int dataWord = dataWords[i3];
                    if (dataWord == 0 || dataWord == mask) {
                        throw FormatException.getFormatInstance();
                    }
                    if (dataWord == 1 || dataWord == mask - 1) {
                        stuffedBits++;
                    }
                    i3++;
                    i2 = 1;
                }
                boolean[] correctedBits = new boolean[((numDataCodewords * codewordSize2) - stuffedBits)];
                int index = 0;
                int i4 = 0;
                while (i4 < numDataCodewords) {
                    int dataWord2 = dataWords[i4];
                    if (dataWord2 == i2 || dataWord2 == mask - 1) {
                        Arrays.fill(correctedBits, index, (index + codewordSize2) - 1, dataWord2 > 1);
                        index += codewordSize2 - 1;
                    } else {
                        int bit = codewordSize2 - 1;
                        while (bit >= 0) {
                            int index2 = index + 1;
                            correctedBits[index] = (dataWord2 & (1 << bit)) != 0;
                            bit--;
                            index = index2;
                        }
                    }
                    i4++;
                    i2 = 1;
                }
                return correctedBits;
            } catch (ReedSolomonException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean[] extractBits(BitMatrix matrix) {
        BitMatrix bitMatrix = matrix;
        boolean compact = this.ddata.isCompact();
        int layers = this.ddata.getNbLayers();
        int baseMatrixSize = (compact ? 11 : 14) + (layers * 4);
        int[] alignmentMap = new int[baseMatrixSize];
        boolean[] rawbits = new boolean[totalBitsInLayer(layers, compact)];
        int i = 2;
        if (compact) {
            for (int i2 = 0; i2 < alignmentMap.length; i2++) {
                alignmentMap[i2] = i2;
            }
        } else {
            int origCenter = baseMatrixSize / 2;
            int center = ((baseMatrixSize + 1) + ((((baseMatrixSize / 2) - 1) / 15) * 2)) / 2;
            int i3 = 0;
            while (i3 < origCenter) {
                int newOffset = (i3 / 15) + i3;
                alignmentMap[(origCenter - i3) - 1] = (center - newOffset) - 1;
                alignmentMap[origCenter + i3] = center + newOffset + 1;
                i3++;
                i = 2;
            }
        }
        int rowOffset = 0;
        for (int i4 = 0; i4 < layers; i4++) {
            int rowSize = compact ? ((layers - i4) * 4) + 9 : ((layers - i4) * 4) + 12;
            int low = i4 * 2;
            int high = (baseMatrixSize - 1) - low;
            for (int j = 0; j < rowSize; j++) {
                int columnOffset = j * 2;
                int k = 0;
                while (k < i) {
                    rawbits[rowOffset + columnOffset + k] = bitMatrix.get(alignmentMap[low + k], alignmentMap[low + j]);
                    rawbits[(i * rowSize) + rowOffset + columnOffset + k] = bitMatrix.get(alignmentMap[low + j], alignmentMap[high - k]);
                    rawbits[(4 * rowSize) + rowOffset + columnOffset + k] = bitMatrix.get(alignmentMap[high - k], alignmentMap[high - j]);
                    rawbits[(6 * rowSize) + rowOffset + columnOffset + k] = bitMatrix.get(alignmentMap[high - j], alignmentMap[low + k]);
                    k++;
                    i = 2;
                }
            }
            rowOffset += rowSize * 8;
        }
        return rawbits;
    }

    private static int readCode(boolean[] rawbits, int startIndex, int length) {
        int res = 0;
        for (int i = startIndex; i < startIndex + length; i++) {
            res <<= 1;
            if (rawbits[i]) {
                res |= 1;
            }
        }
        return res;
    }

    private static int totalBitsInLayer(int layers, boolean compact) {
        return ((compact ? 88 : 112) + (16 * layers)) * layers;
    }
}

package com.google.zxing.aztec.decoder;

import com.android.camera.data.data.config.SupportedConfigFactory;
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
import miui.reflect.Field;

public final class Decoder {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table;
    private static final String[] DIGIT_TABLE = {"CTRL_PS", " ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ".", "CTRL_UL", "CTRL_US"};
    private static final String[] LOWER_TABLE = {"CTRL_PS", " ", SupportedConfigFactory.CLOSE_BY_HHT, SupportedConfigFactory.CLOSE_BY_GROUP, SupportedConfigFactory.CLOSE_BY_SUPER_RESOLUTION, SupportedConfigFactory.CLOSE_BY_BURST_SHOOT, SupportedConfigFactory.CLOSE_BY_AI, SupportedConfigFactory.CLOSE_BY_BOKEH, SupportedConfigFactory.CLOSE_BY_HDR, SupportedConfigFactory.CLOSE_BY_VIDEO, SupportedConfigFactory.CLOSE_BY_ULTRA_WIDE, SupportedConfigFactory.CLOSE_BY_ULTRA_PIXEL, SupportedConfigFactory.CLOSE_BY_FILTER, SupportedConfigFactory.CLOSE_BY_SQUARE, SupportedConfigFactory.CLOSE_BY_MACRO_MODE, "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "CTRL_US", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
    private static final String[] MIXED_TABLE = {"CTRL_PS", " ", "\u0001", "\u0002", "\u0003", "\u0004", "\u0005", "\u0006", "\u0007", "\b", "\t", "\n", "\u000b", "\f", "\r", "\u001b", "\u001c", "\u001d", "\u001e", "\u001f", "@", "\\", "^", "_", "`", "|", "~", "", "CTRL_LL", "CTRL_UL", "CTRL_PL", "CTRL_BS"};
    private static final String[] PUNCT_TABLE = {"", "\r", "\r\n", ". ", ", ", ": ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "[", "]", "{", "}", "CTRL_UL"};
    private static final String[] UPPER_TABLE = {"CTRL_PS", " ", GpsStatus.IN_PROGRESS, Field.BYTE_SIGNATURE_PRIMITIVE, Field.CHAR_SIGNATURE_PRIMITIVE, Field.DOUBLE_SIGNATURE_PRIMITIVE, GpsLongitudeRef.EAST, Field.FLOAT_SIGNATURE_PRIMITIVE, "G", "H", Field.INT_SIGNATURE_PRIMITIVE, Field.LONG_SIGNATURE_PRIMITIVE, GpsSpeedRef.KILOMETERS, "L", "M", "N", "O", "P", "Q", "R", "S", GpsTrackRef.TRUE_DIRECTION, "U", "V", GpsLongitudeRef.WEST, "X", "Y", Field.BOOLEAN_SIGNATURE_PRIMITIVE, "CTRL_LL", "CTRL_ML", "CTRL_DL", "CTRL_BS"};
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

    private boolean[] correctBits(boolean[] zArr) throws FormatException {
        int i;
        GenericGF genericGF;
        boolean[] zArr2 = zArr;
        if (this.ddata.getNbLayers() <= 2) {
            i = 6;
            genericGF = GenericGF.AZTEC_DATA_6;
        } else if (this.ddata.getNbLayers() <= 8) {
            i = 8;
            genericGF = GenericGF.AZTEC_DATA_8;
        } else if (this.ddata.getNbLayers() <= 22) {
            i = 10;
            genericGF = GenericGF.AZTEC_DATA_10;
        } else {
            i = 12;
            genericGF = GenericGF.AZTEC_DATA_12;
        }
        int i2 = i;
        int nbDatablocks = this.ddata.getNbDatablocks();
        int length = zArr2.length / i2;
        if (length >= nbDatablocks) {
            int i3 = length - nbDatablocks;
            int[] iArr = new int[length];
            int i4 = 0;
            int length2 = zArr2.length % i2;
            while (i4 < length) {
                iArr[i4] = readCode(zArr2, length2, i2);
                i4++;
                length2 += i2;
            }
            try {
                new ReedSolomonDecoder(genericGF).decode(iArr, i3);
                int i5 = 1;
                int i6 = (1 << i2) - 1;
                int i7 = 0;
                int i8 = 0;
                while (i8 < nbDatablocks) {
                    int i9 = iArr[i8];
                    if (i9 == 0 || i9 == i6) {
                        throw FormatException.getFormatInstance();
                    }
                    if (i9 == 1 || i9 == i6 - 1) {
                        i7++;
                    }
                    i8++;
                    i5 = 1;
                }
                boolean[] zArr3 = new boolean[((nbDatablocks * i2) - i7)];
                int i10 = 0;
                int i11 = 0;
                while (i11 < nbDatablocks) {
                    int i12 = iArr[i11];
                    if (i12 == i5 || i12 == i6 - 1) {
                        Arrays.fill(zArr3, i10, (i10 + i2) - 1, i12 > 1);
                        i10 += i2 - 1;
                    } else {
                        int i13 = i2 - 1;
                        while (i13 >= 0) {
                            int i14 = i10 + 1;
                            zArr3[i10] = (i12 & (1 << i13)) != 0;
                            i13--;
                            i10 = i14;
                        }
                    }
                    i11++;
                    i5 = 1;
                }
                return zArr3;
            } catch (ReedSolomonException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static String getCharacter(Table table, int i) {
        switch ($SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[table.ordinal()]) {
            case 1:
                return UPPER_TABLE[i];
            case 2:
                return LOWER_TABLE[i];
            case 3:
                return MIXED_TABLE[i];
            case 4:
                return DIGIT_TABLE[i];
            case 5:
                return PUNCT_TABLE[i];
            default:
                throw new IllegalStateException("Bad table");
        }
    }

    private static String getEncodedData(boolean[] zArr) {
        int length = zArr.length;
        Table table = Table.UPPER;
        Table table2 = Table.UPPER;
        StringBuilder sb = new StringBuilder(20);
        int i = 0;
        while (i < length) {
            if (table2 != Table.BINARY) {
                int i2 = table2 == Table.DIGIT ? 4 : 5;
                if (length - i < i2) {
                    break;
                }
                int readCode = readCode(zArr, i, i2);
                i += i2;
                String character = getCharacter(table2, readCode);
                if (character.startsWith("CTRL_")) {
                    table2 = getTable(character.charAt(5));
                    if (character.charAt(6) == 'L') {
                        table = table2;
                    }
                } else {
                    sb.append(character);
                    table2 = table;
                }
            } else if (length - i < 5) {
                break;
            } else {
                int readCode2 = readCode(zArr, i, 5);
                i += 5;
                if (readCode2 == 0) {
                    if (length - i < 11) {
                        break;
                    }
                    readCode2 = readCode(zArr, i, 11) + 31;
                    i += 11;
                }
                int i3 = 0;
                while (true) {
                    if (i3 >= readCode2) {
                        break;
                    } else if (length - i < 8) {
                        i = length;
                        break;
                    } else {
                        sb.append((char) readCode(zArr, i, 8));
                        i += 8;
                        i3++;
                    }
                }
                table2 = table;
            }
        }
        return sb.toString();
    }

    private static Table getTable(char c) {
        if (c == 'B') {
            return Table.BINARY;
        }
        if (c == 'D') {
            return Table.DIGIT;
        }
        if (c == 'P') {
            return Table.PUNCT;
        }
        switch (c) {
            case 'L':
                return Table.LOWER;
            case 'M':
                return Table.MIXED;
            default:
                return Table.UPPER;
        }
    }

    public static String highLevelDecode(boolean[] zArr) {
        return getEncodedData(zArr);
    }

    private static int readCode(boolean[] zArr, int i, int i2) {
        int i3 = 0;
        for (int i4 = i; i4 < i + i2; i4++) {
            i3 <<= 1;
            if (zArr[i4]) {
                i3 |= 1;
            }
        }
        return i3;
    }

    private static int totalBitsInLayer(int i, boolean z) {
        return ((z ? 88 : 112) + (16 * i)) * i;
    }

    public DecoderResult decode(AztecDetectorResult aztecDetectorResult) throws FormatException {
        this.ddata = aztecDetectorResult;
        return new DecoderResult(null, getEncodedData(correctBits(extractBits(aztecDetectorResult.getBits()))), null, null);
    }

    /* access modifiers changed from: 0000 */
    public boolean[] extractBits(BitMatrix bitMatrix) {
        BitMatrix bitMatrix2 = bitMatrix;
        boolean isCompact = this.ddata.isCompact();
        int nbLayers = this.ddata.getNbLayers();
        int i = (isCompact ? 11 : 14) + (nbLayers * 4);
        int[] iArr = new int[i];
        boolean[] zArr = new boolean[totalBitsInLayer(nbLayers, isCompact)];
        int i2 = 2;
        if (isCompact) {
            for (int i3 = 0; i3 < iArr.length; i3++) {
                iArr[i3] = i3;
            }
        } else {
            int i4 = i / 2;
            int i5 = ((i + 1) + ((((i / 2) - 1) / 15) * 2)) / 2;
            int i6 = 0;
            while (i6 < i4) {
                int i7 = (i6 / 15) + i6;
                iArr[(i4 - i6) - 1] = (i5 - i7) - 1;
                iArr[i4 + i6] = i5 + i7 + 1;
                i6++;
                i2 = 2;
            }
        }
        int i8 = 0;
        for (int i9 = 0; i9 < nbLayers; i9++) {
            int i10 = isCompact ? ((nbLayers - i9) * 4) + 9 : ((nbLayers - i9) * 4) + 12;
            int i11 = i9 * 2;
            int i12 = (i - 1) - i11;
            for (int i13 = 0; i13 < i10; i13++) {
                int i14 = i13 * 2;
                int i15 = 0;
                while (i15 < i2) {
                    zArr[i8 + i14 + i15] = bitMatrix2.get(iArr[i11 + i15], iArr[i11 + i13]);
                    zArr[(i2 * i10) + i8 + i14 + i15] = bitMatrix2.get(iArr[i11 + i13], iArr[i12 - i15]);
                    zArr[(4 * i10) + i8 + i14 + i15] = bitMatrix2.get(iArr[i12 - i15], iArr[i12 - i13]);
                    zArr[(6 * i10) + i8 + i14 + i15] = bitMatrix2.get(iArr[i12 - i13], iArr[i11 + i15]);
                    i15++;
                    i2 = 2;
                }
            }
            i8 += i10 * 8;
        }
        return zArr;
    }
}

package com.google.zxing.pdf417.decoder;

import com.google.zxing.FormatException;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.pdf417.PDF417ResultMetadata;
import java.io.ByteArrayOutputStream;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

final class DecodedBitStreamParser {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = null;
    private static final int AL = 28;
    private static final int AS = 27;
    private static final int BEGIN_MACRO_PDF417_CONTROL_BLOCK = 928;
    private static final int BEGIN_MACRO_PDF417_OPTIONAL_FIELD = 923;
    private static final int BYTE_COMPACTION_MODE_LATCH = 901;
    private static final int BYTE_COMPACTION_MODE_LATCH_6 = 924;
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final int ECI_CHARSET = 927;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_USER_DEFINED = 925;
    private static final BigInteger[] EXP900 = new BigInteger[16];
    private static final int LL = 27;
    private static final int MACRO_PDF417_TERMINATOR = 922;
    private static final int MAX_NUMERIC_CODEWORDS = 15;
    private static final char[] MIXED_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '&', 13, 9, ',', ':', '#', '-', '.', '$', '/', '+', '%', '*', '=', '^'};
    private static final int ML = 28;
    private static final int MODE_SHIFT_TO_BYTE_COMPACTION_MODE = 913;
    private static final int NUMBER_OF_SEQUENCE_CODEWORDS = 2;
    private static final int NUMERIC_COMPACTION_MODE_LATCH = 902;
    private static final int PAL = 29;
    private static final int PL = 25;
    private static final int PS = 29;
    private static final char[] PUNCT_CHARS = {';', '<', '>', '@', '[', '\\', ']', '_', '`', '~', '!', 13, 9, ',', ':', 10, '-', '.', '$', '/', '\"', '|', '*', '(', ')', '?', '{', '}', '\''};
    private static final int TEXT_COMPACTION_MODE_LATCH = 900;

    private enum Mode {
        ALPHA,
        LOWER,
        MIXED,
        PUNCT,
        ALPHA_SHIFT,
        PUNCT_SHIFT
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode;
        if (iArr != null) {
            return iArr;
        }
        int[] iArr2 = new int[Mode.values().length];
        try {
            iArr2[Mode.ALPHA.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr2[Mode.ALPHA_SHIFT.ordinal()] = 5;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr2[Mode.LOWER.ordinal()] = 2;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr2[Mode.MIXED.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr2[Mode.PUNCT.ordinal()] = 4;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr2[Mode.PUNCT_SHIFT.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode = iArr2;
        return iArr2;
    }

    static {
        EXP900[0] = BigInteger.ONE;
        BigInteger valueOf = BigInteger.valueOf(900);
        EXP900[1] = valueOf;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(valueOf);
        }
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00d5, code lost:
        if (r1 == MACRO_PDF417_TERMINATOR) goto L_0x00de;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int byteCompaction(int i, int[] iArr, Charset charset, int i2, StringBuilder sb) {
        int i3;
        int i4;
        int i5 = i;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i6 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
        int i7 = 928;
        int i8 = NUMERIC_COMPACTION_MODE_LATCH;
        long j = 900;
        int i9 = BYTE_COMPACTION_MODE_LATCH_6;
        if (i5 == BYTE_COMPACTION_MODE_LATCH) {
            int i10 = 0;
            long j2 = 0;
            int[] iArr2 = new int[6];
            boolean z = false;
            int i11 = i2 + 1;
            int i12 = iArr[i2];
            i3 = i11;
            while (i3 < iArr[0] && !z) {
                int i13 = i10 + 1;
                iArr2[i10] = i12;
                j2 = (j * j2) + ((long) i12);
                int i14 = i3 + 1;
                i12 = iArr[i3];
                if (i12 == TEXT_COMPACTION_MODE_LATCH || i12 == BYTE_COMPACTION_MODE_LATCH || i12 == NUMERIC_COMPACTION_MODE_LATCH || i12 == BYTE_COMPACTION_MODE_LATCH_6 || i12 == i7 || i12 == i6 || i12 == MACRO_PDF417_TERMINATOR) {
                    i3 = i14 - 1;
                    z = true;
                    i10 = i13;
                } else if (i13 % 5 != 0 || i13 <= 0) {
                    i10 = i13;
                    i3 = i14;
                } else {
                    int i15 = 0;
                    while (i15 < 6) {
                        byteArrayOutputStream.write((byte) ((int) (j2 >> ((5 - i15) * 8))));
                        i15++;
                        i6 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
                        i7 = 928;
                    }
                    j2 = 0;
                    i10 = 0;
                    i3 = i14;
                    j = 900;
                }
                i6 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
                i7 = 928;
                j = 900;
            }
            if (i3 != iArr[0] || i12 >= TEXT_COMPACTION_MODE_LATCH) {
                i4 = i10;
            } else {
                i4 = i10 + 1;
                iArr2[i10] = i12;
            }
            for (int i16 = 0; i16 < i4; i16++) {
                byteArrayOutputStream.write((byte) iArr2[i16]);
            }
        } else if (i5 == BYTE_COMPACTION_MODE_LATCH_6) {
            int i17 = 0;
            long j3 = 0;
            boolean z2 = false;
            int i18 = i2;
            for (char c = 0; i3 < iArr[c] && !z2; c = 0) {
                int i19 = i3 + 1;
                int i20 = iArr[i3];
                if (i20 < TEXT_COMPACTION_MODE_LATCH) {
                    i17++;
                    j3 = (900 * j3) + ((long) i20);
                } else {
                    if (i20 != TEXT_COMPACTION_MODE_LATCH && i20 != BYTE_COMPACTION_MODE_LATCH && i20 != i8 && i20 != i9) {
                        if (i20 != 928) {
                            if (i20 != BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
                            }
                            i19--;
                            z2 = true;
                        }
                    }
                    i19--;
                    z2 = true;
                }
                if (i17 % 5 != 0 || i17 <= 0) {
                    i18 = i19;
                    i8 = NUMERIC_COMPACTION_MODE_LATCH;
                    i9 = BYTE_COMPACTION_MODE_LATCH_6;
                } else {
                    int i21 = 0;
                    while (i21 < 6) {
                        byteArrayOutputStream.write((byte) ((int) (j3 >> ((5 - i21) * 8))));
                        i21++;
                        i9 = BYTE_COMPACTION_MODE_LATCH_6;
                    }
                    j3 = 0;
                    i17 = 0;
                    i18 = i19;
                    i8 = NUMERIC_COMPACTION_MODE_LATCH;
                }
            }
        } else {
            i3 = i2;
        }
        sb.append(new String(byteArrayOutputStream.toByteArray(), charset));
        return i3;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x006a, code lost:
        r3 = byteCompaction(r2, r8, r1, r3, r0);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static DecoderResult decode(int[] iArr, String str) throws FormatException {
        int i;
        int i2;
        StringBuilder sb = new StringBuilder(iArr.length * 2);
        Charset charset = DEFAULT_ENCODING;
        int i3 = 1 + 1;
        int i4 = iArr[1];
        PDF417ResultMetadata pDF417ResultMetadata = new PDF417ResultMetadata();
        while (i3 < iArr[0]) {
            if (i4 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                switch (i4) {
                    case TEXT_COMPACTION_MODE_LATCH /*900*/:
                        i = textCompaction(iArr, i3, sb);
                        break;
                    case BYTE_COMPACTION_MODE_LATCH /*901*/:
                        break;
                    case NUMERIC_COMPACTION_MODE_LATCH /*902*/:
                        i = numericCompaction(iArr, i3, sb);
                        break;
                    default:
                        switch (i4) {
                            case MACRO_PDF417_TERMINATOR /*922*/:
                            case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /*923*/:
                                throw FormatException.getFormatInstance();
                            case BYTE_COMPACTION_MODE_LATCH_6 /*924*/:
                                break;
                            case ECI_USER_DEFINED /*925*/:
                                i = i3 + 1;
                                break;
                            case ECI_GENERAL_PURPOSE /*926*/:
                                i = i3 + 2;
                                break;
                            case ECI_CHARSET /*927*/:
                                i2 = i3 + 1;
                                charset = Charset.forName(CharacterSetECI.getCharacterSetECIByValue(iArr[i3]).name());
                                break;
                            case 928:
                                i = decodeMacroBlock(iArr, i3, pDF417ResultMetadata);
                                break;
                            default:
                                i = textCompaction(iArr, i3 - 1, sb);
                                break;
                        }
                }
            } else {
                i2 = i3 + 1;
                sb.append((char) iArr[i3]);
            }
            i = i2;
            if (i < iArr.length) {
                int i5 = i + 1;
                i4 = iArr[i];
                i3 = i5;
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (sb.length() != 0) {
            DecoderResult decoderResult = new DecoderResult(null, sb.toString(), null, str);
            decoderResult.setOther(pDF417ResultMetadata);
            return decoderResult;
        }
        throw FormatException.getFormatInstance();
    }

    private static String decodeBase900toBase10(int[] iArr, int i) throws FormatException {
        BigInteger bigInteger = BigInteger.ZERO;
        for (int i2 = 0; i2 < i; i2++) {
            bigInteger = bigInteger.add(EXP900[(i - i2) - 1].multiply(BigInteger.valueOf((long) iArr[i2])));
        }
        String bigInteger2 = bigInteger.toString();
        if (bigInteger2.charAt(0) == '1') {
            return bigInteger2.substring(1);
        }
        throw FormatException.getFormatInstance();
    }

    private static int decodeMacroBlock(int[] iArr, int i, PDF417ResultMetadata pDF417ResultMetadata) throws FormatException {
        if (i + 2 <= iArr[0]) {
            int[] iArr2 = new int[2];
            int i2 = 0;
            while (i2 < 2) {
                iArr2[i2] = iArr[i];
                i2++;
                i++;
            }
            pDF417ResultMetadata.setSegmentIndex(Integer.parseInt(decodeBase900toBase10(iArr2, 2)));
            StringBuilder sb = new StringBuilder();
            int textCompaction = textCompaction(iArr, i, sb);
            pDF417ResultMetadata.setFileId(sb.toString());
            if (iArr[textCompaction] == BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
                int i3 = textCompaction + 1;
                int[] iArr3 = new int[(iArr[0] - i3)];
                int i4 = 0;
                boolean z = false;
                while (i3 < iArr[0] && !z) {
                    int i5 = i3 + 1;
                    int i6 = iArr[i3];
                    if (i6 < TEXT_COMPACTION_MODE_LATCH) {
                        int i7 = i4 + 1;
                        iArr3[i4] = i6;
                        i3 = i5;
                        i4 = i7;
                    } else if (i6 == MACRO_PDF417_TERMINATOR) {
                        pDF417ResultMetadata.setLastSegment(true);
                        z = true;
                        i3 = i5 + 1;
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                }
                pDF417ResultMetadata.setOptionalData(Arrays.copyOf(iArr3, i4));
                return i3;
            } else if (iArr[textCompaction] != MACRO_PDF417_TERMINATOR) {
                return textCompaction;
            } else {
                pDF417ResultMetadata.setLastSegment(true);
                return textCompaction + 1;
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeTextCompaction(int[] iArr, int[] iArr2, int i, StringBuilder sb) {
        StringBuilder sb2 = sb;
        Mode mode = Mode.ALPHA;
        Mode mode2 = Mode.ALPHA;
        for (int i2 = 0; i2 < i; i2++) {
            int i3 = iArr[i2];
            char c = 0;
            switch ($SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[mode.ordinal()]) {
                case 1:
                    if (i3 >= 26) {
                        if (i3 != 26) {
                            if (i3 != 27) {
                                if (i3 != 28) {
                                    if (i3 != 29) {
                                        if (i3 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                                mode = Mode.ALPHA;
                                                break;
                                            }
                                        } else {
                                            sb2.append((char) iArr2[i2]);
                                            break;
                                        }
                                    } else {
                                        mode2 = mode;
                                        mode = Mode.PUNCT_SHIFT;
                                        break;
                                    }
                                } else {
                                    mode = Mode.MIXED;
                                    break;
                                }
                            } else {
                                mode = Mode.LOWER;
                                break;
                            }
                        } else {
                            c = ' ';
                            break;
                        }
                    } else {
                        c = (char) (65 + i3);
                        break;
                    }
                    break;
                case 2:
                    if (i3 >= 26) {
                        if (i3 != 26) {
                            if (i3 != 27) {
                                if (i3 != 28) {
                                    if (i3 != 29) {
                                        if (i3 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                                mode = Mode.ALPHA;
                                                break;
                                            }
                                        } else {
                                            sb2.append((char) iArr2[i2]);
                                            break;
                                        }
                                    } else {
                                        mode2 = mode;
                                        mode = Mode.PUNCT_SHIFT;
                                        break;
                                    }
                                } else {
                                    mode = Mode.MIXED;
                                    break;
                                }
                            } else {
                                mode2 = mode;
                                mode = Mode.ALPHA_SHIFT;
                                break;
                            }
                        } else {
                            c = ' ';
                            break;
                        }
                    } else {
                        c = (char) (97 + i3);
                        break;
                    }
                    break;
                case 3:
                    if (i3 >= 25) {
                        if (i3 != 25) {
                            if (i3 != 26) {
                                if (i3 != 27) {
                                    if (i3 != 28) {
                                        if (i3 != 29) {
                                            if (i3 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                                if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                                    mode = Mode.ALPHA;
                                                    break;
                                                }
                                            } else {
                                                sb2.append((char) iArr2[i2]);
                                                break;
                                            }
                                        } else {
                                            mode2 = mode;
                                            mode = Mode.PUNCT_SHIFT;
                                            break;
                                        }
                                    } else {
                                        mode = Mode.ALPHA;
                                        break;
                                    }
                                } else {
                                    mode = Mode.LOWER;
                                    break;
                                }
                            } else {
                                c = ' ';
                                break;
                            }
                        } else {
                            mode = Mode.PUNCT;
                            break;
                        }
                    } else {
                        c = MIXED_CHARS[i3];
                        break;
                    }
                    break;
                case 4:
                    if (i3 >= 29) {
                        if (i3 != 29) {
                            if (i3 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                    mode = Mode.ALPHA;
                                    break;
                                }
                            } else {
                                sb2.append((char) iArr2[i2]);
                                break;
                            }
                        } else {
                            mode = Mode.ALPHA;
                            break;
                        }
                    } else {
                        c = PUNCT_CHARS[i3];
                        break;
                    }
                    break;
                case 5:
                    mode = mode2;
                    if (i3 >= 26) {
                        if (i3 != 26) {
                            if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                mode = Mode.ALPHA;
                                break;
                            }
                        } else {
                            c = ' ';
                            break;
                        }
                    } else {
                        c = (char) (65 + i3);
                        break;
                    }
                    break;
                case 6:
                    mode = mode2;
                    if (i3 >= 29) {
                        if (i3 != 29) {
                            if (i3 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (i3 == TEXT_COMPACTION_MODE_LATCH) {
                                    mode = Mode.ALPHA;
                                    break;
                                }
                            } else {
                                sb2.append((char) iArr2[i2]);
                                break;
                            }
                        } else {
                            mode = Mode.ALPHA;
                            break;
                        }
                    } else {
                        c = PUNCT_CHARS[i3];
                        break;
                    }
                    break;
            }
            if (c != 0) {
                sb2.append(c);
            }
        }
    }

    private static int numericCompaction(int[] iArr, int i, StringBuilder sb) throws FormatException {
        int i2 = 0;
        boolean z = false;
        int[] iArr2 = new int[15];
        while (i < iArr[0] && !z) {
            int i3 = i + 1;
            int i4 = iArr[i];
            if (i3 == iArr[0]) {
                z = true;
            }
            if (i4 < TEXT_COMPACTION_MODE_LATCH) {
                iArr2[i2] = i4;
                i2++;
            } else if (i4 == TEXT_COMPACTION_MODE_LATCH || i4 == BYTE_COMPACTION_MODE_LATCH || i4 == BYTE_COMPACTION_MODE_LATCH_6 || i4 == 928 || i4 == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || i4 == MACRO_PDF417_TERMINATOR) {
                i3--;
                z = true;
            }
            if ((i2 % 15 == 0 || i4 == NUMERIC_COMPACTION_MODE_LATCH || z) && i2 > 0) {
                sb.append(decodeBase900toBase10(iArr2, i2));
                i2 = 0;
            }
            i = i3;
        }
        return i;
    }

    private static int textCompaction(int[] iArr, int i, StringBuilder sb) {
        int[] iArr2 = new int[((iArr[0] - i) * 2)];
        int[] iArr3 = new int[((iArr[0] - i) * 2)];
        int i2 = 0;
        boolean z = false;
        while (i < iArr[0] && !z) {
            int i3 = i + 1;
            int i4 = iArr[i];
            if (i4 < TEXT_COMPACTION_MODE_LATCH) {
                iArr2[i2] = i4 / 30;
                iArr2[i2 + 1] = i4 % 30;
                i2 += 2;
            } else if (i4 != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                if (i4 != 928) {
                    switch (i4) {
                        case TEXT_COMPACTION_MODE_LATCH /*900*/:
                            int i5 = i2 + 1;
                            iArr2[i2] = TEXT_COMPACTION_MODE_LATCH;
                            i = i3;
                            i2 = i5;
                            continue;
                        case BYTE_COMPACTION_MODE_LATCH /*901*/:
                        case NUMERIC_COMPACTION_MODE_LATCH /*902*/:
                            break;
                        default:
                            switch (i4) {
                                case MACRO_PDF417_TERMINATOR /*922*/:
                                case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /*923*/:
                                case BYTE_COMPACTION_MODE_LATCH_6 /*924*/:
                                    break;
                            }
                    }
                }
                i3--;
                z = true;
            } else {
                iArr2[i2] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                int i6 = i3 + 1;
                iArr3[i2] = iArr[i3];
                i2++;
                i = i6;
            }
            i = i3;
            continue;
        }
        decodeTextCompaction(iArr2, iArr3, i2, sb);
        return i;
    }
}

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
        BigInteger nineHundred = BigInteger.valueOf(900);
        EXP900[1] = nineHundred;
        for (int i = 2; i < EXP900.length; i++) {
            EXP900[i] = EXP900[i - 1].multiply(nineHundred);
        }
    }

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x006a, code lost:
        r3 = byteCompaction(r2, r8, r1, r3, r0);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static DecoderResult decode(int[] codewords, String ecLevel) throws FormatException {
        int codeIndex;
        int codeIndex2;
        StringBuilder result = new StringBuilder(codewords.length * 2);
        Charset encoding = DEFAULT_ENCODING;
        int codeIndex3 = 1 + 1;
        int code = codewords[1];
        PDF417ResultMetadata resultMetadata = new PDF417ResultMetadata();
        while (codeIndex3 < codewords[0]) {
            if (code != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                switch (code) {
                    case TEXT_COMPACTION_MODE_LATCH /*900*/:
                        codeIndex = textCompaction(codewords, codeIndex3, result);
                        break;
                    case BYTE_COMPACTION_MODE_LATCH /*901*/:
                        break;
                    case NUMERIC_COMPACTION_MODE_LATCH /*902*/:
                        codeIndex = numericCompaction(codewords, codeIndex3, result);
                        break;
                    default:
                        switch (code) {
                            case MACRO_PDF417_TERMINATOR /*922*/:
                            case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /*923*/:
                                throw FormatException.getFormatInstance();
                            case BYTE_COMPACTION_MODE_LATCH_6 /*924*/:
                                break;
                            case ECI_USER_DEFINED /*925*/:
                                codeIndex = codeIndex3 + 1;
                                break;
                            case ECI_GENERAL_PURPOSE /*926*/:
                                codeIndex = codeIndex3 + 2;
                                break;
                            case ECI_CHARSET /*927*/:
                                codeIndex2 = codeIndex3 + 1;
                                encoding = Charset.forName(CharacterSetECI.getCharacterSetECIByValue(codewords[codeIndex3]).name());
                                break;
                            case 928:
                                codeIndex = decodeMacroBlock(codewords, codeIndex3, resultMetadata);
                                break;
                            default:
                                codeIndex = textCompaction(codewords, codeIndex3 - 1, result);
                                break;
                        }
                }
            } else {
                codeIndex2 = codeIndex3 + 1;
                result.append((char) codewords[codeIndex3]);
            }
            codeIndex = codeIndex2;
            if (codeIndex < codewords.length) {
                int codeIndex4 = codeIndex + 1;
                code = codewords[codeIndex];
                codeIndex3 = codeIndex4;
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (result.length() != 0) {
            DecoderResult decoderResult = new DecoderResult(null, result.toString(), null, ecLevel);
            decoderResult.setOther(resultMetadata);
            return decoderResult;
        }
        throw FormatException.getFormatInstance();
    }

    private static int decodeMacroBlock(int[] codewords, int codeIndex, PDF417ResultMetadata resultMetadata) throws FormatException {
        if (codeIndex + 2 <= codewords[0]) {
            int[] segmentIndexArray = new int[2];
            int i = 0;
            while (i < 2) {
                segmentIndexArray[i] = codewords[codeIndex];
                i++;
                codeIndex++;
            }
            resultMetadata.setSegmentIndex(Integer.parseInt(decodeBase900toBase10(segmentIndexArray, 2)));
            StringBuilder fileId = new StringBuilder();
            int codeIndex2 = textCompaction(codewords, codeIndex, fileId);
            resultMetadata.setFileId(fileId.toString());
            if (codewords[codeIndex2] == BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
                int code = codeIndex2 + 1;
                int[] additionalOptionCodeWords = new int[(codewords[0] - code)];
                int additionalOptionCodeWordsIndex = 0;
                boolean end = false;
                while (code < codewords[0] && !end) {
                    int codeIndex3 = code + 1;
                    int codeIndex4 = codewords[code];
                    if (codeIndex4 < TEXT_COMPACTION_MODE_LATCH) {
                        int additionalOptionCodeWordsIndex2 = additionalOptionCodeWordsIndex + 1;
                        additionalOptionCodeWords[additionalOptionCodeWordsIndex] = codeIndex4;
                        code = codeIndex3;
                        additionalOptionCodeWordsIndex = additionalOptionCodeWordsIndex2;
                    } else if (codeIndex4 == MACRO_PDF417_TERMINATOR) {
                        resultMetadata.setLastSegment(true);
                        end = true;
                        code = codeIndex3 + 1;
                    } else {
                        throw FormatException.getFormatInstance();
                    }
                }
                resultMetadata.setOptionalData(Arrays.copyOf(additionalOptionCodeWords, additionalOptionCodeWordsIndex));
                return code;
            } else if (codewords[codeIndex2] != MACRO_PDF417_TERMINATOR) {
                return codeIndex2;
            } else {
                resultMetadata.setLastSegment(true);
                return codeIndex2 + 1;
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static int textCompaction(int[] codewords, int codeIndex, StringBuilder result) {
        int[] textCompactionData = new int[((codewords[0] - codeIndex) * 2)];
        int[] byteCompactionData = new int[((codewords[0] - codeIndex) * 2)];
        int index = 0;
        boolean end = false;
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            int code = codewords[codeIndex];
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                textCompactionData[index] = code / 30;
                textCompactionData[index + 1] = code % 30;
                index += 2;
            } else if (code != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                if (code != 928) {
                    switch (code) {
                        case TEXT_COMPACTION_MODE_LATCH /*900*/:
                            int index2 = index + 1;
                            textCompactionData[index] = TEXT_COMPACTION_MODE_LATCH;
                            codeIndex = codeIndex2;
                            index = index2;
                            continue;
                        case BYTE_COMPACTION_MODE_LATCH /*901*/:
                        case NUMERIC_COMPACTION_MODE_LATCH /*902*/:
                            break;
                        default:
                            switch (code) {
                                case MACRO_PDF417_TERMINATOR /*922*/:
                                case BEGIN_MACRO_PDF417_OPTIONAL_FIELD /*923*/:
                                case BYTE_COMPACTION_MODE_LATCH_6 /*924*/:
                                    break;
                            }
                    }
                }
                codeIndex2--;
                end = true;
            } else {
                textCompactionData[index] = MODE_SHIFT_TO_BYTE_COMPACTION_MODE;
                int codeIndex3 = codeIndex2 + 1;
                byteCompactionData[index] = codewords[codeIndex2];
                index++;
                codeIndex = codeIndex3;
            }
            codeIndex = codeIndex2;
            continue;
        }
        decodeTextCompaction(textCompactionData, byteCompactionData, index, result);
        return codeIndex;
    }

    private static void decodeTextCompaction(int[] textCompactionData, int[] byteCompactionData, int length, StringBuilder result) {
        StringBuilder sb = result;
        Mode subMode = Mode.ALPHA;
        Mode priorToShiftMode = Mode.ALPHA;
        for (int i = 0; i < length; i++) {
            int subModeCh = textCompactionData[i];
            char ch = 0;
            switch ($SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[subMode.ordinal()]) {
                case 1:
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh != 27) {
                                if (subModeCh != 28) {
                                    if (subModeCh != 29) {
                                        if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                subMode = Mode.ALPHA;
                                                break;
                                            }
                                        } else {
                                            sb.append((char) byteCompactionData[i]);
                                            break;
                                        }
                                    } else {
                                        priorToShiftMode = subMode;
                                        subMode = Mode.PUNCT_SHIFT;
                                        break;
                                    }
                                } else {
                                    subMode = Mode.MIXED;
                                    break;
                                }
                            } else {
                                subMode = Mode.LOWER;
                                break;
                            }
                        } else {
                            ch = ' ';
                            break;
                        }
                    } else {
                        ch = (char) (65 + subModeCh);
                        break;
                    }
                    break;
                case 2:
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh != 27) {
                                if (subModeCh != 28) {
                                    if (subModeCh != 29) {
                                        if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                subMode = Mode.ALPHA;
                                                break;
                                            }
                                        } else {
                                            sb.append((char) byteCompactionData[i]);
                                            break;
                                        }
                                    } else {
                                        priorToShiftMode = subMode;
                                        subMode = Mode.PUNCT_SHIFT;
                                        break;
                                    }
                                } else {
                                    subMode = Mode.MIXED;
                                    break;
                                }
                            } else {
                                priorToShiftMode = subMode;
                                subMode = Mode.ALPHA_SHIFT;
                                break;
                            }
                        } else {
                            ch = ' ';
                            break;
                        }
                    } else {
                        ch = (char) (97 + subModeCh);
                        break;
                    }
                    break;
                case 3:
                    if (subModeCh >= 25) {
                        if (subModeCh != 25) {
                            if (subModeCh != 26) {
                                if (subModeCh != 27) {
                                    if (subModeCh != 28) {
                                        if (subModeCh != 29) {
                                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                                    subMode = Mode.ALPHA;
                                                    break;
                                                }
                                            } else {
                                                sb.append((char) byteCompactionData[i]);
                                                break;
                                            }
                                        } else {
                                            priorToShiftMode = subMode;
                                            subMode = Mode.PUNCT_SHIFT;
                                            break;
                                        }
                                    } else {
                                        subMode = Mode.ALPHA;
                                        break;
                                    }
                                } else {
                                    subMode = Mode.LOWER;
                                    break;
                                }
                            } else {
                                ch = ' ';
                                break;
                            }
                        } else {
                            subMode = Mode.PUNCT;
                            break;
                        }
                    } else {
                        ch = MIXED_CHARS[subModeCh];
                        break;
                    }
                    break;
                case 4:
                    if (subModeCh >= 29) {
                        if (subModeCh != 29) {
                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                    subMode = Mode.ALPHA;
                                    break;
                                }
                            } else {
                                sb.append((char) byteCompactionData[i]);
                                break;
                            }
                        } else {
                            subMode = Mode.ALPHA;
                            break;
                        }
                    } else {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    }
                    break;
                case 5:
                    subMode = priorToShiftMode;
                    if (subModeCh >= 26) {
                        if (subModeCh != 26) {
                            if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                subMode = Mode.ALPHA;
                                break;
                            }
                        } else {
                            ch = ' ';
                            break;
                        }
                    } else {
                        ch = (char) (65 + subModeCh);
                        break;
                    }
                    break;
                case 6:
                    subMode = priorToShiftMode;
                    if (subModeCh >= 29) {
                        if (subModeCh != 29) {
                            if (subModeCh != MODE_SHIFT_TO_BYTE_COMPACTION_MODE) {
                                if (subModeCh == TEXT_COMPACTION_MODE_LATCH) {
                                    subMode = Mode.ALPHA;
                                    break;
                                }
                            } else {
                                sb.append((char) byteCompactionData[i]);
                                break;
                            }
                        } else {
                            subMode = Mode.ALPHA;
                            break;
                        }
                    } else {
                        ch = PUNCT_CHARS[subModeCh];
                        break;
                    }
                    break;
            }
            if (ch != 0) {
                sb.append(ch);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00d5, code lost:
        if (r1 == MACRO_PDF417_TERMINATOR) goto L_0x00de;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int byteCompaction(int mode, int[] codewords, Charset encoding, int codeIndex, StringBuilder result) {
        int codeIndex2;
        int count;
        int i = mode;
        ByteArrayOutputStream decodedBytes = new ByteArrayOutputStream();
        int i2 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
        int i3 = 928;
        int i4 = NUMERIC_COMPACTION_MODE_LATCH;
        long j = 900;
        int i5 = BYTE_COMPACTION_MODE_LATCH_6;
        if (i == BYTE_COMPACTION_MODE_LATCH) {
            int count2 = 0;
            long value = 0;
            int[] byteCompactedCodewords = new int[6];
            boolean end = false;
            int codeIndex3 = codeIndex + 1;
            int nextCode = codewords[codeIndex];
            codeIndex2 = codeIndex3;
            while (codeIndex2 < codewords[0] && !end) {
                int count3 = count2 + 1;
                byteCompactedCodewords[count2] = nextCode;
                value = (j * value) + ((long) nextCode);
                int codeIndex4 = codeIndex2 + 1;
                nextCode = codewords[codeIndex2];
                if (nextCode == TEXT_COMPACTION_MODE_LATCH || nextCode == BYTE_COMPACTION_MODE_LATCH || nextCode == NUMERIC_COMPACTION_MODE_LATCH || nextCode == BYTE_COMPACTION_MODE_LATCH_6 || nextCode == i3 || nextCode == i2 || nextCode == MACRO_PDF417_TERMINATOR) {
                    codeIndex2 = codeIndex4 - 1;
                    end = true;
                    count2 = count3;
                } else if (count3 % 5 != 0 || count3 <= 0) {
                    count2 = count3;
                    codeIndex2 = codeIndex4;
                } else {
                    int j2 = 0;
                    while (j2 < 6) {
                        decodedBytes.write((byte) ((int) (value >> ((5 - j2) * 8))));
                        j2++;
                        i2 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
                        i3 = 928;
                    }
                    value = 0;
                    count2 = 0;
                    codeIndex2 = codeIndex4;
                    j = 900;
                }
                i2 = BEGIN_MACRO_PDF417_OPTIONAL_FIELD;
                i3 = 928;
                j = 900;
            }
            if (codeIndex2 != codewords[0] || nextCode >= TEXT_COMPACTION_MODE_LATCH) {
                count = count2;
            } else {
                count = count2 + 1;
                byteCompactedCodewords[count2] = nextCode;
            }
            for (int i6 = 0; i6 < count; i6++) {
                decodedBytes.write((byte) byteCompactedCodewords[i6]);
            }
        } else if (i == BYTE_COMPACTION_MODE_LATCH_6) {
            int count4 = 0;
            long value2 = 0;
            boolean end2 = false;
            int codeIndex5 = codeIndex;
            for (char c = 0; codeIndex2 < codewords[c] && !end2; c = 0) {
                int codeIndex6 = codeIndex2 + 1;
                int code = codewords[codeIndex2];
                if (code < TEXT_COMPACTION_MODE_LATCH) {
                    count4++;
                    value2 = (900 * value2) + ((long) code);
                } else {
                    if (code != TEXT_COMPACTION_MODE_LATCH && code != BYTE_COMPACTION_MODE_LATCH && code != i4 && code != i5) {
                        if (code != 928) {
                            if (code != BEGIN_MACRO_PDF417_OPTIONAL_FIELD) {
                            }
                            codeIndex6--;
                            end2 = true;
                        }
                    }
                    codeIndex6--;
                    end2 = true;
                }
                if (count4 % 5 != 0 || count4 <= 0) {
                    codeIndex5 = codeIndex6;
                    i4 = NUMERIC_COMPACTION_MODE_LATCH;
                    i5 = BYTE_COMPACTION_MODE_LATCH_6;
                } else {
                    int j3 = 0;
                    while (j3 < 6) {
                        decodedBytes.write((byte) ((int) (value2 >> ((5 - j3) * 8))));
                        j3++;
                        i5 = BYTE_COMPACTION_MODE_LATCH_6;
                    }
                    value2 = 0;
                    count4 = 0;
                    codeIndex5 = codeIndex6;
                    i4 = NUMERIC_COMPACTION_MODE_LATCH;
                }
            }
        } else {
            codeIndex2 = codeIndex;
        }
        result.append(new String(decodedBytes.toByteArray(), encoding));
        return codeIndex2;
    }

    private static int numericCompaction(int[] codewords, int codeIndex, StringBuilder result) throws FormatException {
        int count = 0;
        boolean end = false;
        int[] numericCodewords = new int[15];
        while (codeIndex < codewords[0] && !end) {
            int codeIndex2 = codeIndex + 1;
            int code = codewords[codeIndex];
            if (codeIndex2 == codewords[0]) {
                end = true;
            }
            if (code < TEXT_COMPACTION_MODE_LATCH) {
                numericCodewords[count] = code;
                count++;
            } else if (code == TEXT_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH || code == BYTE_COMPACTION_MODE_LATCH_6 || code == 928 || code == BEGIN_MACRO_PDF417_OPTIONAL_FIELD || code == MACRO_PDF417_TERMINATOR) {
                codeIndex2--;
                end = true;
            }
            if ((count % 15 == 0 || code == NUMERIC_COMPACTION_MODE_LATCH || end) && count > 0) {
                result.append(decodeBase900toBase10(numericCodewords, count));
                count = 0;
            }
            codeIndex = codeIndex2;
        }
        return codeIndex;
    }

    private static String decodeBase900toBase10(int[] codewords, int count) throws FormatException {
        BigInteger result = BigInteger.ZERO;
        for (int i = 0; i < count; i++) {
            result = result.add(EXP900[(count - i) - 1].multiply(BigInteger.valueOf((long) codewords[i])));
        }
        String resultString = result.toString();
        if (resultString.charAt(0) == '1') {
            return resultString.substring(1);
        }
        throw FormatException.getFormatInstance();
    }
}

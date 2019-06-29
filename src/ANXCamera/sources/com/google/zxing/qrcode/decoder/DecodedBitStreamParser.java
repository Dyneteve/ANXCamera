package com.google.zxing.qrcode.decoder;

import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitSource;
import com.google.zxing.common.CharacterSetECI;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.StringUtils;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

final class DecodedBitStreamParser {
    private static final char[] ALPHANUMERIC_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '$', '%', '*', '+', '-', '.', '/', ':'};
    private static final int GB2312_SUBSET = 1;

    private DecodedBitStreamParser() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:64:0x0107 A[LOOP:0: B:1:0x0020->B:64:0x0107, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00e4 A[SYNTHETIC] */
    static DecoderResult decode(byte[] bArr, Version version, ErrorCorrectionLevel errorCorrectionLevel, Map<DecodeHintType, ?> map) throws FormatException {
        CharacterSetECI characterSetECI;
        Mode mode;
        Mode mode2;
        CharacterSetECI characterSetECI2;
        Version version2 = version;
        byte[] bArr2 = bArr;
        BitSource bitSource = new BitSource(bArr2);
        StringBuilder sb = new StringBuilder(50);
        int i = 1;
        ArrayList arrayList = new ArrayList(1);
        boolean z = false;
        int i2 = -1;
        int i3 = -1;
        CharacterSetECI characterSetECI3 = null;
        while (true) {
            boolean z2 = z;
            try {
                Mode forBits = bitSource.available() < 4 ? Mode.TERMINATOR : Mode.forBits(bitSource.readBits(4));
                if (forBits != Mode.TERMINATOR) {
                    if (forBits == Mode.FNC1_FIRST_POSITION) {
                        characterSetECI2 = characterSetECI3;
                        mode = forBits;
                    } else if (forBits == Mode.FNC1_SECOND_POSITION) {
                        characterSetECI2 = characterSetECI3;
                        mode = forBits;
                    } else {
                        if (forBits == Mode.STRUCTURED_APPEND) {
                            if (bitSource.available() >= 16) {
                                i2 = bitSource.readBits(8);
                                characterSetECI = characterSetECI3;
                                i3 = bitSource.readBits(8);
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else if (forBits == Mode.ECI) {
                            CharacterSetECI characterSetECIByValue = CharacterSetECI.getCharacterSetECIByValue(parseECIValue(bitSource));
                            if (characterSetECIByValue != null) {
                                characterSetECI = characterSetECIByValue;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else {
                            if (forBits == Mode.HANZI) {
                                int readBits = bitSource.readBits(4);
                                int readBits2 = bitSource.readBits(forBits.getCharacterCountBits(version2));
                                if (readBits == i) {
                                    decodeHanziSegment(bitSource, sb, readBits2);
                                }
                            } else {
                                int readBits3 = bitSource.readBits(forBits.getCharacterCountBits(version2));
                                if (forBits == Mode.NUMERIC) {
                                    decodeNumericSegment(bitSource, sb, readBits3);
                                } else if (forBits == Mode.ALPHANUMERIC) {
                                    decodeAlphanumericSegment(bitSource, sb, readBits3, z2);
                                } else if (forBits == Mode.BYTE) {
                                    int i4 = readBits3;
                                    characterSetECI = characterSetECI3;
                                    mode2 = forBits;
                                    decodeByteSegment(bitSource, sb, readBits3, characterSetECI3, arrayList, map);
                                } else {
                                    characterSetECI = characterSetECI3;
                                    int i5 = readBits3;
                                    mode2 = forBits;
                                    if (mode2 == Mode.KANJI) {
                                        decodeKanjiSegment(bitSource, sb, i5);
                                    } else {
                                        throw FormatException.getFormatInstance();
                                    }
                                }
                            }
                            characterSetECI = characterSetECI3;
                        }
                        mode2 = forBits;
                    }
                    z = true;
                    if (mode != Mode.TERMINATOR) {
                        DecoderResult decoderResult = new DecoderResult(bArr2, sb.toString(), arrayList.isEmpty() ? null : arrayList, errorCorrectionLevel == null ? null : errorCorrectionLevel.toString(), i2, i3);
                        return decoderResult;
                    }
                    characterSetECI3 = characterSetECI;
                    i = 1;
                } else {
                    characterSetECI = characterSetECI3;
                    mode2 = forBits;
                }
                z = z2;
                if (mode != Mode.TERMINATOR) {
                }
            } catch (IllegalArgumentException e) {
                throw FormatException.getFormatInstance();
            }
        }
    }

    private static void decodeAlphanumericSegment(BitSource bitSource, StringBuilder sb, int i, boolean z) throws FormatException {
        int length = sb.length();
        while (i > 1) {
            if (bitSource.available() >= 11) {
                int readBits = bitSource.readBits(11);
                sb.append(toAlphaNumericChar(readBits / 45));
                sb.append(toAlphaNumericChar(readBits % 45));
                i -= 2;
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (i == 1) {
            if (bitSource.available() >= 6) {
                sb.append(toAlphaNumericChar(bitSource.readBits(6)));
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (z) {
            for (int i2 = length; i2 < sb.length(); i2++) {
                if (sb.charAt(i2) == '%') {
                    if (i2 >= sb.length() - 1 || sb.charAt(i2 + 1) != '%') {
                        sb.setCharAt(i2, 29);
                    } else {
                        sb.deleteCharAt(i2 + 1);
                    }
                }
            }
        }
    }

    private static void decodeByteSegment(BitSource bitSource, StringBuilder sb, int i, CharacterSetECI characterSetECI, Collection<byte[]> collection, Map<DecodeHintType, ?> map) throws FormatException {
        if (8 * i <= bitSource.available()) {
            byte[] bArr = new byte[i];
            for (int i2 = 0; i2 < i; i2++) {
                bArr[i2] = (byte) bitSource.readBits(8);
            }
            try {
                sb.append(new String(bArr, characterSetECI == null ? StringUtils.guessEncoding(bArr, map) : characterSetECI.name()));
                collection.add(bArr);
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeHanziSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        if (i * 13 <= bitSource.available()) {
            byte[] bArr = new byte[(2 * i)];
            int i2 = 0;
            while (i > 0) {
                int readBits = bitSource.readBits(13);
                int i3 = ((readBits / 96) << 8) | (readBits % 96);
                int i4 = i3 + (i3 < 959 ? 41377 : 42657);
                bArr[i2] = (byte) ((i4 >> 8) & 255);
                bArr[i2 + 1] = (byte) (i4 & 255);
                i2 += 2;
                i--;
            }
            try {
                sb.append(new String(bArr, StringUtils.GB2312));
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeKanjiSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        if (i * 13 <= bitSource.available()) {
            byte[] bArr = new byte[(2 * i)];
            int i2 = 0;
            while (i > 0) {
                int readBits = bitSource.readBits(13);
                int i3 = ((readBits / 192) << 8) | (readBits % 192);
                int i4 = i3 + (i3 < 7936 ? 33088 : 49472);
                bArr[i2] = (byte) (i4 >> 8);
                bArr[i2 + 1] = (byte) i4;
                i2 += 2;
                i--;
            }
            try {
                sb.append(new String(bArr, StringUtils.SHIFT_JIS));
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeNumericSegment(BitSource bitSource, StringBuilder sb, int i) throws FormatException {
        while (i >= 3) {
            if (bitSource.available() >= 10) {
                int readBits = bitSource.readBits(10);
                if (readBits < 1000) {
                    sb.append(toAlphaNumericChar(readBits / 100));
                    sb.append(toAlphaNumericChar((readBits / 10) % 10));
                    sb.append(toAlphaNumericChar(readBits % 10));
                    i -= 3;
                } else {
                    throw FormatException.getFormatInstance();
                }
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (i == 2) {
            if (bitSource.available() >= 7) {
                int readBits2 = bitSource.readBits(7);
                if (readBits2 < 100) {
                    sb.append(toAlphaNumericChar(readBits2 / 10));
                    sb.append(toAlphaNumericChar(readBits2 % 10));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        } else if (i != 1) {
        } else {
            if (bitSource.available() >= 4) {
                int readBits3 = bitSource.readBits(4);
                if (readBits3 < 10) {
                    sb.append(toAlphaNumericChar(readBits3));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        }
    }

    private static int parseECIValue(BitSource bitSource) throws FormatException {
        int readBits = bitSource.readBits(8);
        if ((readBits & 128) == 0) {
            return readBits & 127;
        }
        if ((readBits & 192) == 128) {
            return ((readBits & 63) << 8) | bitSource.readBits(8);
        } else if ((readBits & 224) == 192) {
            return ((readBits & 31) << 16) | bitSource.readBits(16);
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static char toAlphaNumericChar(int i) throws FormatException {
        if (i < ALPHANUMERIC_CHARS.length) {
            return ALPHANUMERIC_CHARS[i];
        }
        throw FormatException.getFormatInstance();
    }
}

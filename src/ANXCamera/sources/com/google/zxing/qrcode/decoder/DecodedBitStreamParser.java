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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static DecoderResult decode(byte[] bytes, Version version, ErrorCorrectionLevel ecLevel, Map<DecodeHintType, ?> hints) throws FormatException {
        Mode mode;
        CharacterSetECI currentCharacterSetECI;
        Mode mode2;
        String str;
        Mode mode3;
        CharacterSetECI currentCharacterSetECI2;
        Version version2 = version;
        byte[] bArr = bytes;
        BitSource bits = new BitSource(bArr);
        StringBuilder result = new StringBuilder(50);
        int i = 1;
        ArrayList arrayList = new ArrayList(1);
        boolean fc1InEffect = false;
        int symbolSequence = -1;
        int parityData = -1;
        CharacterSetECI currentCharacterSetECI3 = null;
        while (true) {
            boolean fc1InEffect2 = fc1InEffect;
            try {
                if (bits.available() < 4) {
                    mode = Mode.TERMINATOR;
                } else {
                    mode = Mode.forBits(bits.readBits(4));
                }
                Mode mode4 = mode;
                if (mode4 != Mode.TERMINATOR) {
                    if (mode4 == Mode.FNC1_FIRST_POSITION) {
                        currentCharacterSetECI2 = currentCharacterSetECI3;
                        mode2 = mode4;
                    } else if (mode4 == Mode.FNC1_SECOND_POSITION) {
                        currentCharacterSetECI2 = currentCharacterSetECI3;
                        mode2 = mode4;
                    } else {
                        if (mode4 == Mode.STRUCTURED_APPEND) {
                            if (bits.available() >= 16) {
                                symbolSequence = bits.readBits(8);
                                currentCharacterSetECI = currentCharacterSetECI3;
                                parityData = bits.readBits(8);
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else if (mode4 == Mode.ECI) {
                            CharacterSetECI currentCharacterSetECI4 = CharacterSetECI.getCharacterSetECIByValue(parseECIValue(bits));
                            if (currentCharacterSetECI4 != null) {
                                currentCharacterSetECI = currentCharacterSetECI4;
                            } else {
                                throw FormatException.getFormatInstance();
                            }
                        } else {
                            if (mode4 == Mode.HANZI) {
                                int subset = bits.readBits(4);
                                int countHanzi = bits.readBits(mode4.getCharacterCountBits(version2));
                                if (subset == i) {
                                    decodeHanziSegment(bits, result, countHanzi);
                                }
                            } else {
                                int count = bits.readBits(mode4.getCharacterCountBits(version2));
                                if (mode4 == Mode.NUMERIC) {
                                    decodeNumericSegment(bits, result, count);
                                } else if (mode4 == Mode.ALPHANUMERIC) {
                                    decodeAlphanumericSegment(bits, result, count, fc1InEffect2);
                                } else if (mode4 == Mode.BYTE) {
                                    int i2 = count;
                                    currentCharacterSetECI = currentCharacterSetECI3;
                                    mode3 = mode4;
                                    decodeByteSegment(bits, result, count, currentCharacterSetECI3, arrayList, hints);
                                } else {
                                    currentCharacterSetECI = currentCharacterSetECI3;
                                    int count2 = count;
                                    mode3 = mode4;
                                    if (mode3 == Mode.KANJI) {
                                        decodeKanjiSegment(bits, result, count2);
                                    } else {
                                        throw FormatException.getFormatInstance();
                                    }
                                }
                            }
                            currentCharacterSetECI = currentCharacterSetECI3;
                        }
                        mode3 = mode4;
                    }
                    fc1InEffect = true;
                    if (mode2 != Mode.TERMINATOR) {
                        String sb = result.toString();
                        ArrayList arrayList2 = arrayList.isEmpty() ? null : arrayList;
                        if (ecLevel == null) {
                            str = null;
                        } else {
                            str = ecLevel.toString();
                        }
                        DecoderResult decoderResult = new DecoderResult(bArr, sb, arrayList2, str, symbolSequence, parityData);
                        return decoderResult;
                    }
                    currentCharacterSetECI3 = currentCharacterSetECI;
                    i = 1;
                } else {
                    currentCharacterSetECI = currentCharacterSetECI3;
                    mode3 = mode4;
                }
                fc1InEffect = fc1InEffect2;
                if (mode2 != Mode.TERMINATOR) {
                }
            } catch (IllegalArgumentException e) {
                throw FormatException.getFormatInstance();
            }
        }
    }

    private static void decodeHanziSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        int i;
        if (count * 13 <= bits.available()) {
            byte[] buffer = new byte[(2 * count)];
            int offset = 0;
            while (count > 0) {
                int twoBytes = bits.readBits(13);
                int assembledTwoBytes = ((twoBytes / 96) << 8) | (twoBytes % 96);
                if (assembledTwoBytes < 959) {
                    i = 41377;
                } else {
                    i = 42657;
                }
                int assembledTwoBytes2 = assembledTwoBytes + i;
                buffer[offset] = (byte) ((assembledTwoBytes2 >> 8) & 255);
                buffer[offset + 1] = (byte) (assembledTwoBytes2 & 255);
                offset += 2;
                count--;
            }
            try {
                result.append(new String(buffer, StringUtils.GB2312));
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeKanjiSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        int i;
        if (count * 13 <= bits.available()) {
            byte[] buffer = new byte[(2 * count)];
            int offset = 0;
            while (count > 0) {
                int twoBytes = bits.readBits(13);
                int assembledTwoBytes = ((twoBytes / 192) << 8) | (twoBytes % 192);
                if (assembledTwoBytes < 7936) {
                    i = 33088;
                } else {
                    i = 49472;
                }
                int assembledTwoBytes2 = assembledTwoBytes + i;
                buffer[offset] = (byte) (assembledTwoBytes2 >> 8);
                buffer[offset + 1] = (byte) assembledTwoBytes2;
                offset += 2;
                count--;
            }
            try {
                result.append(new String(buffer, StringUtils.SHIFT_JIS));
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static void decodeByteSegment(BitSource bits, StringBuilder result, int count, CharacterSetECI currentCharacterSetECI, Collection<byte[]> byteSegments, Map<DecodeHintType, ?> hints) throws FormatException {
        String encoding;
        if (8 * count <= bits.available()) {
            byte[] readBytes = new byte[count];
            for (int i = 0; i < count; i++) {
                readBytes[i] = (byte) bits.readBits(8);
            }
            if (currentCharacterSetECI == null) {
                encoding = StringUtils.guessEncoding(readBytes, hints);
            } else {
                encoding = currentCharacterSetECI.name();
            }
            try {
                result.append(new String(readBytes, encoding));
                byteSegments.add(readBytes);
            } catch (UnsupportedEncodingException e) {
                throw FormatException.getFormatInstance();
            }
        } else {
            throw FormatException.getFormatInstance();
        }
    }

    private static char toAlphaNumericChar(int value) throws FormatException {
        if (value < ALPHANUMERIC_CHARS.length) {
            return ALPHANUMERIC_CHARS[value];
        }
        throw FormatException.getFormatInstance();
    }

    private static void decodeAlphanumericSegment(BitSource bits, StringBuilder result, int count, boolean fc1InEffect) throws FormatException {
        int start = result.length();
        while (count > 1) {
            if (bits.available() >= 11) {
                int nextTwoCharsBits = bits.readBits(11);
                result.append(toAlphaNumericChar(nextTwoCharsBits / 45));
                result.append(toAlphaNumericChar(nextTwoCharsBits % 45));
                count -= 2;
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (count == 1) {
            if (bits.available() >= 6) {
                result.append(toAlphaNumericChar(bits.readBits(6)));
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (fc1InEffect) {
            int i = start;
            while (i < result.length()) {
                if (result.charAt(i) == '%') {
                    if (i >= result.length() - 1 || result.charAt(i + 1) != '%') {
                        result.setCharAt(i, 29);
                    } else {
                        result.deleteCharAt(i + 1);
                    }
                }
                i++;
            }
        }
    }

    private static void decodeNumericSegment(BitSource bits, StringBuilder result, int count) throws FormatException {
        while (count >= 3) {
            if (bits.available() >= 10) {
                int threeDigitsBits = bits.readBits(10);
                if (threeDigitsBits < 1000) {
                    result.append(toAlphaNumericChar(threeDigitsBits / 100));
                    result.append(toAlphaNumericChar((threeDigitsBits / 10) % 10));
                    result.append(toAlphaNumericChar(threeDigitsBits % 10));
                    count -= 3;
                } else {
                    throw FormatException.getFormatInstance();
                }
            } else {
                throw FormatException.getFormatInstance();
            }
        }
        if (count == 2) {
            if (bits.available() >= 7) {
                int twoDigitsBits = bits.readBits(7);
                if (twoDigitsBits < 100) {
                    result.append(toAlphaNumericChar(twoDigitsBits / 10));
                    result.append(toAlphaNumericChar(twoDigitsBits % 10));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        } else if (count != 1) {
        } else {
            if (bits.available() >= 4) {
                int digitBits = bits.readBits(4);
                if (digitBits < 10) {
                    result.append(toAlphaNumericChar(digitBits));
                    return;
                }
                throw FormatException.getFormatInstance();
            }
            throw FormatException.getFormatInstance();
        }
    }

    private static int parseECIValue(BitSource bits) throws FormatException {
        int firstByte = bits.readBits(8);
        if ((firstByte & 128) == 0) {
            return firstByte & 127;
        }
        if ((firstByte & 192) == 128) {
            return ((firstByte & 63) << 8) | bits.readBits(8);
        } else if ((firstByte & 224) == 192) {
            return ((firstByte & 31) << 16) | bits.readBits(16);
        } else {
            throw FormatException.getFormatInstance();
        }
    }
}

package com.google.zxing.pdf417.encoder;

import com.google.zxing.WriterException;
import com.google.zxing.common.CharacterSetECI;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.util.Arrays;

final class PDF417HighLevelEncoder {
    private static final int BYTE_COMPACTION = 1;
    private static final Charset DEFAULT_ENCODING = Charset.forName("ISO-8859-1");
    private static final int ECI_CHARSET = 927;
    private static final int ECI_GENERAL_PURPOSE = 926;
    private static final int ECI_USER_DEFINED = 925;
    private static final int LATCH_TO_BYTE = 924;
    private static final int LATCH_TO_BYTE_PADDED = 901;
    private static final int LATCH_TO_NUMERIC = 902;
    private static final int LATCH_TO_TEXT = 900;
    private static final byte[] MIXED = new byte[128];
    private static final int NUMERIC_COMPACTION = 2;
    private static final byte[] PUNCTUATION = new byte[128];
    private static final int SHIFT_TO_BYTE = 913;
    private static final int SUBMODE_ALPHA = 0;
    private static final int SUBMODE_LOWER = 1;
    private static final int SUBMODE_MIXED = 2;
    private static final int SUBMODE_PUNCTUATION = 3;
    private static final int TEXT_COMPACTION = 0;
    private static final byte[] TEXT_MIXED_RAW;
    private static final byte[] TEXT_PUNCTUATION_RAW;

    static {
        byte[] bArr = new byte[30];
        bArr[0] = 48;
        bArr[1] = 49;
        bArr[2] = 50;
        bArr[3] = 51;
        bArr[4] = 52;
        bArr[5] = 53;
        bArr[6] = 54;
        bArr[7] = 55;
        bArr[8] = 56;
        bArr[9] = 57;
        bArr[10] = 38;
        bArr[11] = 13;
        bArr[12] = 9;
        bArr[13] = 44;
        bArr[14] = 58;
        bArr[15] = 35;
        bArr[16] = 45;
        bArr[17] = 46;
        bArr[18] = 36;
        bArr[19] = 47;
        bArr[20] = 43;
        bArr[21] = 37;
        bArr[22] = 42;
        bArr[23] = 61;
        bArr[24] = 94;
        bArr[26] = 32;
        TEXT_MIXED_RAW = bArr;
        byte[] bArr2 = new byte[30];
        bArr2[0] = 59;
        bArr2[1] = 60;
        bArr2[2] = 62;
        bArr2[3] = 64;
        bArr2[4] = 91;
        bArr2[5] = 92;
        bArr2[6] = 93;
        bArr2[7] = 95;
        bArr2[8] = 96;
        bArr2[9] = 126;
        bArr2[10] = 33;
        bArr2[11] = 13;
        bArr2[12] = 9;
        bArr2[13] = 44;
        bArr2[14] = 58;
        bArr2[15] = 10;
        bArr2[16] = 45;
        bArr2[17] = 46;
        bArr2[18] = 36;
        bArr2[19] = 47;
        bArr2[20] = 34;
        bArr2[21] = 124;
        bArr2[22] = 42;
        bArr2[23] = 40;
        bArr2[24] = 41;
        bArr2[25] = 63;
        bArr2[26] = 123;
        bArr2[27] = 125;
        bArr2[28] = 39;
        TEXT_PUNCTUATION_RAW = bArr2;
        Arrays.fill(MIXED, -1);
        for (byte i = 0; i < TEXT_MIXED_RAW.length; i = (byte) (i + 1)) {
            byte b = TEXT_MIXED_RAW[i];
            if (b > 0) {
                MIXED[b] = i;
            }
        }
        Arrays.fill(PUNCTUATION, -1);
        for (byte i2 = 0; i2 < TEXT_PUNCTUATION_RAW.length; i2 = (byte) (i2 + 1)) {
            byte b2 = TEXT_PUNCTUATION_RAW[i2];
            if (b2 > 0) {
                PUNCTUATION[b2] = i2;
            }
        }
    }

    private PDF417HighLevelEncoder() {
    }

    static String encodeHighLevel(String msg, Compaction compaction, Charset encoding) throws WriterException {
        StringBuilder sb = new StringBuilder(msg.length());
        if (encoding == null) {
            encoding = DEFAULT_ENCODING;
        } else if (!DEFAULT_ENCODING.equals(encoding)) {
            CharacterSetECI eci = CharacterSetECI.getCharacterSetECIByName(encoding.name());
            if (eci != null) {
                encodingECI(eci.getValue(), sb);
            }
        }
        int len = msg.length();
        int p = 0;
        int textSubMode = 0;
        byte[] bytes = null;
        if (compaction == Compaction.TEXT) {
            encodeText(msg, 0, len, sb, 0);
        } else if (compaction == Compaction.BYTE) {
            byte[] bytes2 = msg.getBytes(encoding);
            encodeBinary(bytes2, 0, bytes2.length, 1, sb);
        } else if (compaction == Compaction.NUMERIC) {
            sb.append(902);
            encodeNumeric(msg, 0, len, sb);
        } else {
            int encodingMode = 0;
            while (p < len) {
                int n = determineConsecutiveDigitCount(msg, p);
                if (n >= 13) {
                    sb.append(902);
                    encodingMode = 2;
                    textSubMode = 0;
                    encodeNumeric(msg, p, n, sb);
                    p += n;
                } else {
                    int t = determineConsecutiveTextCount(msg, p);
                    if (t >= 5 || n == len) {
                        if (encodingMode != 0) {
                            sb.append(900);
                            encodingMode = 0;
                            textSubMode = 0;
                        }
                        textSubMode = encodeText(msg, p, t, sb, textSubMode);
                        p += t;
                    } else {
                        if (bytes == null) {
                            bytes = msg.getBytes(encoding);
                        }
                        int b = determineConsecutiveBinaryCount(msg, bytes, p);
                        if (b == 0) {
                            b = 1;
                        }
                        if (b == 1 && encodingMode == 0) {
                            encodeBinary(bytes, p, 1, 0, sb);
                        } else {
                            encodeBinary(bytes, p, b, encodingMode, sb);
                            encodingMode = 1;
                            textSubMode = 0;
                        }
                        p += b;
                    }
                }
            }
        }
        return sb.toString();
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int encodeText(CharSequence msg, int startpos, int count, StringBuilder sb, int initialSubmode) {
        CharSequence charSequence = msg;
        int i = count;
        StringBuilder sb2 = sb;
        StringBuilder tmp = new StringBuilder(i);
        int submode = initialSubmode;
        int idx = 0;
        while (true) {
            char ch = charSequence.charAt(startpos + idx);
            switch (submode) {
                case 0:
                    if (isAlphaUpper(ch)) {
                        if (ch == ' ') {
                            tmp.append(26);
                        } else {
                            tmp.append((char) (ch - 'A'));
                        }
                    } else if (isAlphaLower(ch)) {
                        submode = 1;
                        tmp.append(27);
                        break;
                    } else if (isMixed(ch)) {
                        submode = 2;
                        tmp.append(28);
                        break;
                    } else {
                        tmp.append(29);
                        tmp.append((char) PUNCTUATION[ch]);
                    }
                case 1:
                    if (isAlphaLower(ch)) {
                        if (ch == ' ') {
                            tmp.append(26);
                        } else {
                            tmp.append((char) (ch - 'a'));
                        }
                    } else if (isAlphaUpper(ch)) {
                        tmp.append(27);
                        tmp.append((char) (ch - 'A'));
                    } else if (isMixed(ch)) {
                        submode = 2;
                        tmp.append(28);
                        break;
                    } else {
                        tmp.append(29);
                        tmp.append((char) PUNCTUATION[ch]);
                    }
                case 2:
                    if (!isMixed(ch)) {
                        if (!isAlphaUpper(ch)) {
                            if (!isAlphaLower(ch)) {
                                if (startpos + idx + 1 < i && isPunctuation(charSequence.charAt(startpos + idx + 1))) {
                                    submode = 3;
                                    tmp.append(25);
                                    break;
                                } else {
                                    tmp.append(29);
                                    tmp.append((char) PUNCTUATION[ch]);
                                }
                            } else {
                                submode = 1;
                                tmp.append(27);
                                break;
                            }
                        } else {
                            submode = 0;
                            tmp.append(28);
                            break;
                        }
                    } else {
                        tmp.append((char) MIXED[ch]);
                    }
                    break;
                default:
                    if (!isPunctuation(ch)) {
                        submode = 0;
                        tmp.append(29);
                        break;
                    } else {
                        tmp.append((char) PUNCTUATION[ch]);
                        idx++;
                        if (idx < i) {
                            break;
                        } else {
                            char h = 0;
                            int len = tmp.length();
                            for (int i2 = 0; i2 < len; i2++) {
                                if (i2 % 2 != 0) {
                                    h = (char) ((h * 30) + tmp.charAt(i2));
                                    sb2.append(h);
                                } else {
                                    h = tmp.charAt(i2);
                                }
                            }
                            if (len % 2 != 0) {
                                sb2.append((char) ((h * 30) + 29));
                            }
                            return submode;
                        }
                    }
            }
        }
    }

    private static void encodeBinary(byte[] bytes, int startpos, int count, int startmode, StringBuilder sb) {
        int idx;
        int i = count;
        StringBuilder sb2 = sb;
        int i2 = 1;
        if (i == 1 && startmode == 0) {
            sb2.append(913);
        } else {
            if (i % 6 == 0) {
                sb2.append(924);
            } else {
                sb2.append(901);
            }
        }
        int idx2 = startpos;
        if (i >= 6) {
            char[] chars = new char[5];
            idx = idx2;
            while ((startpos + i) - idx >= 6) {
                long t = 0;
                int i3 = 0;
                while (i3 < 6) {
                    t = ((long) (bytes[idx + i3] & -1)) + (t << 8);
                    i3++;
                    i2 = 1;
                }
                int i4 = 0;
                while (i4 < 5) {
                    chars[i4] = (char) ((int) (t % 900));
                    t /= 900;
                    i4++;
                    i2 = 1;
                }
                for (int i5 = chars.length - i2; i5 >= 0; i5--) {
                    sb2.append(chars[i5]);
                }
                idx += 6;
            }
        } else {
            idx = idx2;
        }
        for (int i6 = idx; i6 < startpos + i; i6++) {
            sb2.append((char) (bytes[i6] & 255));
        }
    }

    private static void encodeNumeric(String msg, int startpos, int count, StringBuilder sb) {
        int idx = 0;
        StringBuilder tmp = new StringBuilder((count / 3) + 1);
        BigInteger num900 = BigInteger.valueOf(900);
        BigInteger num0 = BigInteger.valueOf(0);
        while (idx < count - 1) {
            tmp.setLength(0);
            int len = Math.min(44, count - idx);
            StringBuilder sb2 = new StringBuilder(String.valueOf('1'));
            sb2.append(msg.substring(startpos + idx, startpos + idx + len));
            BigInteger bigint = new BigInteger(sb2.toString());
            do {
                tmp.append((char) bigint.mod(num900).intValue());
                bigint = bigint.divide(num900);
            } while (!bigint.equals(num0));
            for (int i = tmp.length() - 1; i >= 0; i--) {
                sb.append(tmp.charAt(i));
            }
            idx += len;
        }
    }

    private static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }

    private static boolean isAlphaUpper(char ch) {
        return ch == ' ' || (ch >= 'A' && ch <= 'Z');
    }

    private static boolean isAlphaLower(char ch) {
        return ch == ' ' || (ch >= 'a' && ch <= 'z');
    }

    private static boolean isMixed(char ch) {
        return MIXED[ch] != -1;
    }

    private static boolean isPunctuation(char ch) {
        return PUNCTUATION[ch] != -1;
    }

    private static boolean isText(char ch) {
        return ch == 9 || ch == 10 || ch == 13 || (ch >= ' ' && ch <= '~');
    }

    private static int determineConsecutiveDigitCount(CharSequence msg, int startpos) {
        int count = 0;
        int len = msg.length();
        int idx = startpos;
        if (idx < len) {
            char ch = msg.charAt(idx);
            while (isDigit(ch) && idx < len) {
                count++;
                idx++;
                if (idx < len) {
                    ch = msg.charAt(idx);
                }
            }
        }
        return count;
    }

    private static int determineConsecutiveTextCount(CharSequence msg, int startpos) {
        int idx;
        int len = msg.length();
        int idx2 = startpos;
        while (idx2 < len) {
            char ch = msg.charAt(idx2);
            int numericCount = 0;
            while (numericCount < 13 && isDigit(ch) && idx2 < len) {
                numericCount++;
                idx2++;
                if (idx2 < len) {
                    ch = msg.charAt(idx2);
                }
            }
            if (numericCount >= 13) {
                return (idx2 - startpos) - numericCount;
            }
            if (numericCount <= 0) {
                if (!isText(msg.charAt(idx2))) {
                    break;
                }
                idx2++;
            }
        }
        return idx - startpos;
    }

    private static int determineConsecutiveBinaryCount(CharSequence msg, byte[] bytes, int startpos) throws WriterException {
        int len = msg.length();
        int idx = startpos;
        while (idx < len) {
            char ch = msg.charAt(idx);
            int numericCount = 0;
            while (numericCount < 13 && isDigit(ch)) {
                numericCount++;
                int i = idx + numericCount;
                if (i >= len) {
                    break;
                }
                ch = msg.charAt(i);
            }
            if (numericCount >= 13) {
                return idx - startpos;
            }
            char ch2 = msg.charAt(idx);
            if (bytes[idx] != 63 || ch2 == '?') {
                idx++;
            } else {
                StringBuilder sb = new StringBuilder("Non-encodable character detected: ");
                sb.append(ch2);
                sb.append(" (Unicode: ");
                sb.append(ch2);
                sb.append(')');
                throw new WriterException(sb.toString());
            }
        }
        return idx - startpos;
    }

    private static void encodingECI(int eci, StringBuilder sb) throws WriterException {
        if (eci >= 0 && eci < LATCH_TO_TEXT) {
            sb.append(927);
            sb.append((char) eci);
        } else if (eci < 810900) {
            sb.append(926);
            sb.append((char) ((eci / LATCH_TO_TEXT) - 1));
            sb.append((char) (eci % LATCH_TO_TEXT));
        } else if (eci < 811800) {
            sb.append(925);
            sb.append((char) (810900 - eci));
        } else {
            StringBuilder sb2 = new StringBuilder("ECI number not in valid range from 0..811799, but was ");
            sb2.append(eci);
            throw new WriterException(sb2.toString());
        }
    }
}

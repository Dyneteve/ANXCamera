package com.google.zxing.common;

import com.google.zxing.DecodeHintType;
import java.nio.charset.Charset;
import java.util.Map;

public final class StringUtils {
    private static final boolean ASSUME_SHIFT_JIS;
    private static final String EUC_JP = "EUC_JP";
    public static final String GB2312 = "GB2312";
    private static final String ISO88591 = "ISO8859_1";
    private static final String PLATFORM_DEFAULT_ENCODING = Charset.defaultCharset().name();
    public static final String SHIFT_JIS = "SJIS";
    private static final String UTF8 = "UTF8";

    static {
        boolean z = SHIFT_JIS.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING) || EUC_JP.equalsIgnoreCase(PLATFORM_DEFAULT_ENCODING);
        ASSUME_SHIFT_JIS = z;
    }

    private StringUtils() {
    }

    public static String guessEncoding(byte[] bytes, Map<DecodeHintType, ?> hints) {
        int length;
        String str;
        boolean canBeShiftJIS;
        boolean canBeUTF8;
        byte[] bArr = bytes;
        Map<DecodeHintType, ?> map = hints;
        if (map != null) {
            String characterSet = (String) map.get(DecodeHintType.CHARACTER_SET);
            if (characterSet != null) {
                return characterSet;
            }
        }
        int length2 = bArr.length;
        boolean canBeShiftJIS2 = true;
        boolean canBeUTF82 = true;
        int utf8BytesLeft = 0;
        int utf2BytesChars = 0;
        int utf3BytesChars = 0;
        int utf4BytesChars = 0;
        int sjisBytesLeft = 0;
        int sjisKatakanaChars = 0;
        int sjisCurKatakanaWordLength = 0;
        int sjisCurDoubleBytesWordLength = 0;
        int sjisMaxKatakanaWordLength = 0;
        int sjisMaxDoubleBytesWordLength = 0;
        int isoHighOther = 0;
        boolean z = false;
        boolean canBeISO88591 = true;
        if (bArr.length > 3 && bArr[0] == -17 && bArr[1] == -69 && bArr[2] == -65) {
            z = true;
        }
        boolean utf8bom = z;
        int i = 0;
        while (true) {
            if (i < length2) {
                if (!canBeISO88591 && !canBeShiftJIS2 && !canBeUTF82) {
                    length = length2;
                    break;
                }
                int length3 = length2;
                int value = bArr[i] & 255;
                if (canBeUTF82) {
                    if (utf8BytesLeft > 0) {
                        if ((value & 128) == 0) {
                            canBeUTF8 = false;
                        } else {
                            utf8BytesLeft--;
                        }
                    } else if ((value & 128) != 0) {
                        if ((value & 64) == 0) {
                            canBeUTF8 = false;
                        } else {
                            utf8BytesLeft++;
                            if ((value & 32) == 0) {
                                utf2BytesChars++;
                            } else {
                                utf8BytesLeft++;
                                if ((value & 16) == 0) {
                                    utf3BytesChars++;
                                } else {
                                    utf8BytesLeft++;
                                    if ((value & 8) == 0) {
                                        utf4BytesChars++;
                                    } else {
                                        canBeUTF8 = false;
                                    }
                                }
                            }
                        }
                    }
                    canBeUTF82 = canBeUTF8;
                }
                if (canBeISO88591) {
                    if (value > 127 && value < 160) {
                        canBeISO88591 = false;
                    } else if (value > 159 && (value < 192 || value == 215 || value == 247)) {
                        isoHighOther++;
                    }
                }
                if (canBeShiftJIS2) {
                    if (sjisBytesLeft > 0) {
                        if (value < 64 || value == 127 || value > 252) {
                            canBeShiftJIS = false;
                        } else {
                            sjisBytesLeft--;
                        }
                    } else if (value == 128 || value == 160 || value > 239) {
                        canBeShiftJIS = false;
                    } else if (value > 160 && value < 224) {
                        sjisKatakanaChars++;
                        sjisCurKatakanaWordLength++;
                        if (sjisCurKatakanaWordLength > sjisMaxKatakanaWordLength) {
                            sjisMaxKatakanaWordLength = sjisCurKatakanaWordLength;
                        }
                        sjisCurDoubleBytesWordLength = 0;
                    } else if (value > 127) {
                        sjisBytesLeft++;
                        sjisCurDoubleBytesWordLength++;
                        if (sjisCurDoubleBytesWordLength > sjisMaxDoubleBytesWordLength) {
                            sjisMaxDoubleBytesWordLength = sjisCurDoubleBytesWordLength;
                        }
                        sjisCurKatakanaWordLength = 0;
                    } else {
                        sjisCurKatakanaWordLength = 0;
                        sjisCurDoubleBytesWordLength = 0;
                    }
                    canBeShiftJIS2 = canBeShiftJIS;
                }
                i++;
                length2 = length3;
                bArr = bytes;
            } else {
                length = length2;
                break;
            }
        }
        if (canBeUTF82 && utf8BytesLeft > 0) {
            canBeUTF82 = false;
        }
        if (canBeShiftJIS2 && sjisBytesLeft > 0) {
            canBeShiftJIS2 = false;
        }
        if (canBeUTF82 && (utf8bom || utf2BytesChars + utf3BytesChars + utf4BytesChars > 0)) {
            return UTF8;
        }
        if (canBeShiftJIS2 && (ASSUME_SHIFT_JIS || sjisMaxKatakanaWordLength >= 3 || sjisMaxDoubleBytesWordLength >= 3)) {
            return SHIFT_JIS;
        }
        if (!canBeISO88591 || !canBeShiftJIS2) {
            if (canBeISO88591) {
                return ISO88591;
            }
            if (canBeShiftJIS2) {
                return SHIFT_JIS;
            }
            if (canBeUTF82) {
                return UTF8;
            }
            return PLATFORM_DEFAULT_ENCODING;
        }
        if (sjisMaxKatakanaWordLength == 2 && sjisKatakanaChars == 2) {
            int i2 = length;
        } else if (isoHighOther * 10 < length) {
            str = ISO88591;
            return str;
        }
        str = SHIFT_JIS;
        return str;
    }
}

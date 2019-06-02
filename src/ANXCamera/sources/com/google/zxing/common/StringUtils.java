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

    public static String guessEncoding(byte[] bArr, Map<DecodeHintType, ?> map) {
        int i;
        String str;
        boolean z;
        boolean z2;
        byte[] bArr2 = bArr;
        Map<DecodeHintType, ?> map2 = map;
        if (map2 != null) {
            String str2 = (String) map2.get(DecodeHintType.CHARACTER_SET);
            if (str2 != null) {
                return str2;
            }
        }
        int length = bArr2.length;
        boolean z3 = true;
        boolean z4 = true;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        int i10 = 0;
        int i11 = 0;
        int i12 = 0;
        boolean z5 = false;
        boolean z6 = true;
        if (bArr2.length > 3 && bArr2[0] == -17 && bArr2[1] == -69 && bArr2[2] == -65) {
            z5 = true;
        }
        boolean z7 = z5;
        int i13 = 0;
        while (true) {
            if (i13 < length) {
                if (!z6 && !z3 && !z4) {
                    i = length;
                    break;
                }
                int i14 = length;
                byte b = bArr2[i13] & -1;
                if (z4) {
                    if (i2 > 0) {
                        if ((b & Byte.MIN_VALUE) == 0) {
                            z2 = false;
                        } else {
                            i2--;
                        }
                    } else if ((b & Byte.MIN_VALUE) != 0) {
                        if ((b & 64) == 0) {
                            z2 = false;
                        } else {
                            i2++;
                            if ((b & 32) == 0) {
                                i3++;
                            } else {
                                i2++;
                                if ((b & 16) == 0) {
                                    i4++;
                                } else {
                                    i2++;
                                    if ((b & 8) == 0) {
                                        i5++;
                                    } else {
                                        z2 = false;
                                    }
                                }
                            }
                        }
                    }
                    z4 = z2;
                }
                if (z6) {
                    if (b > Byte.MAX_VALUE && b < -96) {
                        z6 = false;
                    } else if (b > -97 && (b < -64 || b == -41 || b == -9)) {
                        i12++;
                    }
                }
                if (z3) {
                    if (i6 > 0) {
                        if (b < 64 || b == Byte.MAX_VALUE || b > -4) {
                            z = false;
                        } else {
                            i6--;
                        }
                    } else if (b == Byte.MIN_VALUE || b == -96 || b > -17) {
                        z = false;
                    } else if (b > -96 && b < -32) {
                        i7++;
                        i8++;
                        if (i8 > i10) {
                            i10 = i8;
                        }
                        i9 = 0;
                    } else if (b > Byte.MAX_VALUE) {
                        i6++;
                        i9++;
                        if (i9 > i11) {
                            i11 = i9;
                        }
                        i8 = 0;
                    } else {
                        i8 = 0;
                        i9 = 0;
                    }
                    z3 = z;
                }
                i13++;
                length = i14;
                bArr2 = bArr;
            } else {
                i = length;
                break;
            }
        }
        if (z4 && i2 > 0) {
            z4 = false;
        }
        if (z3 && i6 > 0) {
            z3 = false;
        }
        if (z4 && (z7 || i3 + i4 + i5 > 0)) {
            return UTF8;
        }
        if (z3 && (ASSUME_SHIFT_JIS || i10 >= 3 || i11 >= 3)) {
            return SHIFT_JIS;
        }
        if (!z6 || !z3) {
            int i15 = i;
            return z6 ? ISO88591 : z3 ? SHIFT_JIS : z4 ? UTF8 : PLATFORM_DEFAULT_ENCODING;
        }
        if (i10 == 2 && i7 == 2) {
            int i16 = i;
        } else if (i12 * 10 < i) {
            str = ISO88591;
            return str;
        }
        str = SHIFT_JIS;
        return str;
    }
}

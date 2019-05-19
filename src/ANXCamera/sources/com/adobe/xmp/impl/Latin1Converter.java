package com.adobe.xmp.impl;

import java.io.UnsupportedEncodingException;

public class Latin1Converter {
    private static final int STATE_START = 0;
    private static final int STATE_UTF8CHAR = 11;

    private Latin1Converter() {
    }

    public static ByteBuffer convert(ByteBuffer byteBuffer) {
        int i;
        if (!"UTF-8".equals(byteBuffer.getEncoding())) {
            return byteBuffer;
        }
        byte[] bArr = new byte[8];
        ByteBuffer byteBuffer2 = new ByteBuffer((byteBuffer.length() * 4) / 3);
        int i2 = 0;
        boolean z = false;
        int i3 = 0;
        int i4 = 0;
        while (i < byteBuffer.length()) {
            int charAt = byteBuffer.charAt(i);
            if (z) {
                if (i3 <= 0 || (charAt & 192) != 128) {
                    byteBuffer2.append(convertToUTF8(bArr[0]));
                    i -= i4;
                } else {
                    int i5 = i4 + 1;
                    bArr[i4] = (byte) charAt;
                    i3--;
                    if (i3 == 0) {
                        byteBuffer2.append(bArr, 0, i5);
                    } else {
                        i4 = i5;
                    }
                }
                z = false;
                i4 = 0;
            } else if (charAt < 127) {
                byteBuffer2.append((byte) charAt);
            } else if (charAt >= 192) {
                int i6 = -1;
                int i7 = charAt;
                while (i6 < 8 && (i7 & 128) == 128) {
                    i6++;
                    i7 <<= 1;
                }
                int i8 = i4 + 1;
                bArr[i4] = (byte) charAt;
                i4 = i8;
                i3 = i6;
                z = true;
            } else {
                byteBuffer2.append(convertToUTF8((byte) charAt));
            }
            i2 = i + 1;
        }
        if (z) {
            for (int i9 = 0; i9 < i4; i9++) {
                byteBuffer2.append(convertToUTF8(bArr[i9]));
            }
        }
        return byteBuffer2;
    }

    private static byte[] convertToUTF8(byte b) {
        byte b2 = b & -1;
        if (b2 >= Byte.MIN_VALUE) {
            if (b2 == -127 || b2 == -115 || b2 == -113 || b2 == -112 || b2 == -99) {
                return new byte[]{32};
            }
            try {
                return new String(new byte[]{b}, "cp1252").getBytes("UTF-8");
            } catch (UnsupportedEncodingException e) {
            }
        }
        return new byte[]{b};
    }
}

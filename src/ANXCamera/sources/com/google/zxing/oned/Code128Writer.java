package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.Map;

public final class Code128Writer extends OneDimensionalCodeWriter {
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_B = 100;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final char ESCAPE_FNC_1 = 'ñ';
    private static final char ESCAPE_FNC_2 = 'ò';
    private static final char ESCAPE_FNC_3 = 'ó';
    private static final char ESCAPE_FNC_4 = 'ô';

    private static boolean isDigits(CharSequence charSequence, int i, int i2) {
        int i3 = i + i2;
        int length = charSequence.length();
        int i4 = i;
        while (i4 < i3 && i4 < length) {
            char charAt = charSequence.charAt(i4);
            if (charAt < '0' || charAt > '9') {
                if (charAt != 241) {
                    return false;
                }
                i3++;
            }
            i4++;
        }
        return i3 <= length;
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat == BarcodeFormat.CODE_128) {
            return super.encode(str, barcodeFormat, i, i2, map);
        }
        StringBuilder sb = new StringBuilder("Can only encode CODE_128, but got ");
        sb.append(barcodeFormat);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String str) {
        int i;
        int length = str.length();
        if (length < 1 || length > 80) {
            StringBuilder sb = new StringBuilder("Contents length should be between 1 and 80 characters, but got ");
            sb.append(length);
            throw new IllegalArgumentException(sb.toString());
        }
        for (int i2 = 0; i2 < length; i2++) {
            char charAt = str.charAt(i2);
            if (charAt < ' ' || charAt > '~') {
                switch (charAt) {
                    case 241:
                    case 242:
                    case 243:
                    case 244:
                        break;
                    default:
                        StringBuilder sb2 = new StringBuilder("Bad character in input: ");
                        sb2.append(charAt);
                        throw new IllegalArgumentException(sb2.toString());
                }
            }
        }
        ArrayList<int[]> arrayList = new ArrayList<>();
        int i3 = 0;
        int i4 = 1;
        int i5 = 0;
        int i6 = 0;
        while (i6 < length) {
            int i7 = isDigits(str, i6, i5 == 99 ? 2 : 4) ? 99 : 100;
            if (i7 == i5) {
                switch (str.charAt(i6)) {
                    case 241:
                        i = 102;
                        break;
                    case 242:
                        i = 97;
                        break;
                    case 243:
                        i = 96;
                        break;
                    case 244:
                        i = 100;
                        break;
                    default:
                        if (i5 != 100) {
                            i = Integer.parseInt(str.substring(i6, i6 + 2));
                            i6++;
                            break;
                        } else {
                            i = str.charAt(i6) - ' ';
                            break;
                        }
                }
                i6++;
            } else {
                int i8 = i5 == 0 ? i7 == 100 ? 104 : 105 : i7;
                i5 = i7;
            }
            arrayList.add(Code128Reader.CODE_PATTERNS[i]);
            i3 += i * i4;
            if (i6 != 0) {
                i4++;
            }
        }
        arrayList.add(Code128Reader.CODE_PATTERNS[i3 % 103]);
        arrayList.add(Code128Reader.CODE_PATTERNS[106]);
        int i9 = 0;
        for (int[] iArr : arrayList) {
            for (int i10 : (int[]) r9.next()) {
                i9 += i10;
            }
        }
        boolean[] zArr = new boolean[i9];
        int i11 = 0;
        for (int[] appendPattern : arrayList) {
            i11 += appendPattern(zArr, i11, appendPattern, true);
        }
        return zArr;
    }
}

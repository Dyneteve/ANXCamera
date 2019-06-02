package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class EAN8Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 67;

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat == BarcodeFormat.EAN_8) {
            return super.encode(str, barcodeFormat, i, i2, map);
        }
        StringBuilder sb = new StringBuilder("Can only encode EAN_8, but got ");
        sb.append(barcodeFormat);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String str) {
        if (str.length() == 8) {
            boolean[] zArr = new boolean[67];
            int appendPattern = 0 + appendPattern(zArr, 0, UPCEANReader.START_END_PATTERN, true);
            for (int i = 0; i <= 3; i++) {
                appendPattern += appendPattern(zArr, appendPattern, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i, i + 1))], false);
            }
            int appendPattern2 = appendPattern + appendPattern(zArr, appendPattern, UPCEANReader.MIDDLE_PATTERN, false);
            for (int i2 = 4; i2 <= 7; i2++) {
                appendPattern2 += appendPattern(zArr, appendPattern2, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i2, i2 + 1))], true);
            }
            appendPattern(zArr, appendPattern2, UPCEANReader.START_END_PATTERN, true);
            return zArr;
        }
        StringBuilder sb = new StringBuilder("Requested contents should be 8 digits long, but got ");
        sb.append(str.length());
        throw new IllegalArgumentException(sb.toString());
    }
}

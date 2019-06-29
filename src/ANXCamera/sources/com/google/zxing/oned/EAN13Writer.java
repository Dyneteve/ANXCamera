package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class EAN13Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 95;

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (barcodeFormat == BarcodeFormat.EAN_13) {
            return super.encode(str, barcodeFormat, i, i2, map);
        }
        StringBuilder sb = new StringBuilder("Can only encode EAN_13, but got ");
        sb.append(barcodeFormat);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String str) {
        if (str.length() == 13) {
            try {
                if (UPCEANReader.checkStandardUPCEANChecksum(str)) {
                    int i = EAN13Reader.FIRST_DIGIT_ENCODINGS[Integer.parseInt(str.substring(0, 1))];
                    boolean[] zArr = new boolean[95];
                    int appendPattern = 0 + appendPattern(zArr, 0, UPCEANReader.START_END_PATTERN, true);
                    for (int i2 = 1; i2 <= 6; i2++) {
                        int parseInt = Integer.parseInt(str.substring(i2, i2 + 1));
                        if (((i >> (6 - i2)) & 1) == 1) {
                            parseInt += 10;
                        }
                        appendPattern += appendPattern(zArr, appendPattern, UPCEANReader.L_AND_G_PATTERNS[parseInt], false);
                    }
                    int appendPattern2 = appendPattern + appendPattern(zArr, appendPattern, UPCEANReader.MIDDLE_PATTERN, false);
                    for (int i3 = 7; i3 <= 12; i3++) {
                        appendPattern2 += appendPattern(zArr, appendPattern2, UPCEANReader.L_PATTERNS[Integer.parseInt(str.substring(i3, i3 + 1))], true);
                    }
                    appendPattern(zArr, appendPattern2, UPCEANReader.START_END_PATTERN, true);
                    return zArr;
                }
                throw new IllegalArgumentException("Contents do not pass checksum");
            } catch (FormatException e) {
                throw new IllegalArgumentException("Illegal contents");
            }
        } else {
            StringBuilder sb = new StringBuilder("Requested contents should be 13 digits long, but got ");
            sb.append(str.length());
            throw new IllegalArgumentException(sb.toString());
        }
    }
}

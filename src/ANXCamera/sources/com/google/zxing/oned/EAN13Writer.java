package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public final class EAN13Writer extends UPCEANWriter {
    private static final int CODE_WIDTH = 95;

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.EAN_13) {
            return super.encode(contents, format, width, height, hints);
        }
        StringBuilder sb = new StringBuilder("Can only encode EAN_13, but got ");
        sb.append(format);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String contents) {
        if (contents.length() == 13) {
            try {
                if (UPCEANReader.checkStandardUPCEANChecksum(contents)) {
                    int parities = EAN13Reader.FIRST_DIGIT_ENCODINGS[Integer.parseInt(contents.substring(0, 1))];
                    boolean[] result = new boolean[95];
                    int pos = 0 + appendPattern(result, 0, UPCEANReader.START_END_PATTERN, true);
                    for (int i = 1; i <= 6; i++) {
                        int digit = Integer.parseInt(contents.substring(i, i + 1));
                        if (((parities >> (6 - i)) & 1) == 1) {
                            digit += 10;
                        }
                        pos += appendPattern(result, pos, UPCEANReader.L_AND_G_PATTERNS[digit], false);
                    }
                    int pos2 = pos + appendPattern(result, pos, UPCEANReader.MIDDLE_PATTERN, false);
                    for (int i2 = 7; i2 <= 12; i2++) {
                        pos2 += appendPattern(result, pos2, UPCEANReader.L_PATTERNS[Integer.parseInt(contents.substring(i2, i2 + 1))], true);
                    }
                    appendPattern(result, pos2, UPCEANReader.START_END_PATTERN, true);
                    return result;
                }
                throw new IllegalArgumentException("Contents do not pass checksum");
            } catch (FormatException e) {
                throw new IllegalArgumentException("Illegal contents");
            }
        } else {
            StringBuilder sb = new StringBuilder("Requested contents should be 13 digits long, but got ");
            sb.append(contents.length());
            throw new IllegalArgumentException(sb.toString());
        }
    }
}

package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.Map;

public abstract class OneDimensionalCodeWriter implements Writer {
    protected static int appendPattern(boolean[] zArr, int i, int[] iArr, boolean z) {
        boolean z2 = z;
        int i2 = 0;
        boolean z3 = z2;
        int i3 = i;
        for (int i4 : iArr) {
            int i5 = 0;
            while (i5 < i4) {
                int i6 = i3 + 1;
                zArr[i3] = z3;
                i5++;
                i3 = i6;
            }
            i2 += i4;
            z3 = !z3;
        }
        return i2;
    }

    private static BitMatrix renderResult(boolean[] zArr, int i, int i2, int i3) {
        int length = zArr.length;
        int i4 = length + i3;
        int max = Math.max(i, i4);
        int max2 = Math.max(1, i2);
        int i5 = max / i4;
        int i6 = (max - (length * i5)) / 2;
        BitMatrix bitMatrix = new BitMatrix(max, max2);
        int i7 = 0;
        int i8 = i6;
        while (i7 < length) {
            if (zArr[i7]) {
                bitMatrix.setRegion(i8, 0, i5, max2);
            }
            i7++;
            i8 += i5;
        }
        return bitMatrix;
    }

    public final BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        } else if (i < 0 || i2 < 0) {
            StringBuilder sb = new StringBuilder("Negative size is not allowed. Input: ");
            sb.append(i);
            sb.append('x');
            sb.append(i2);
            throw new IllegalArgumentException(sb.toString());
        } else {
            int defaultMargin = getDefaultMargin();
            if (map != null) {
                Integer num = (Integer) map.get(EncodeHintType.MARGIN);
                if (num != null) {
                    defaultMargin = num.intValue();
                }
            }
            return renderResult(encode(str), i, i2, defaultMargin);
        }
    }

    public abstract boolean[] encode(String str);

    public int getDefaultMargin() {
        return 10;
    }
}

package com.google.zxing.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.encoder.ByteMatrix;
import com.google.zxing.qrcode.encoder.Encoder;
import com.google.zxing.qrcode.encoder.QRCode;
import java.util.Map;

public final class QRCodeWriter implements Writer {
    private static final int QUIET_ZONE_SIZE = 4;

    private static BitMatrix renderResult(QRCode qRCode, int i, int i2, int i3) {
        ByteMatrix matrix = qRCode.getMatrix();
        if (matrix != null) {
            int width = matrix.getWidth();
            int height = matrix.getHeight();
            int i4 = (i3 * 2) + width;
            int i5 = (i3 * 2) + height;
            int max = Math.max(i, i4);
            int max2 = Math.max(i2, i5);
            int min = Math.min(max / i4, max2 / i5);
            int i6 = (max - (width * min)) / 2;
            int i7 = (max2 - (height * min)) / 2;
            BitMatrix bitMatrix = new BitMatrix(max, max2);
            int i8 = 0;
            int i9 = i7;
            while (i8 < height) {
                int i10 = height;
                int i11 = 0;
                int i12 = i6;
                while (i11 < width) {
                    int i13 = width;
                    ByteMatrix byteMatrix = matrix;
                    if (matrix.get(i11, i8) == 1) {
                        bitMatrix.setRegion(i12, i9, min, min);
                    }
                    i11++;
                    i12 += min;
                    width = i13;
                    matrix = byteMatrix;
                }
                i8++;
                i9 += min;
                height = i10;
            }
            return bitMatrix;
        }
        int i14 = i;
        int i15 = i2;
        ByteMatrix byteMatrix2 = matrix;
        throw new IllegalStateException();
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        } else if (barcodeFormat != BarcodeFormat.QR_CODE) {
            StringBuilder sb = new StringBuilder("Can only encode QR_CODE, but got ");
            sb.append(barcodeFormat);
            throw new IllegalArgumentException(sb.toString());
        } else if (i < 0 || i2 < 0) {
            StringBuilder sb2 = new StringBuilder("Requested dimensions are too small: ");
            sb2.append(i);
            sb2.append('x');
            sb2.append(i2);
            throw new IllegalArgumentException(sb2.toString());
        } else {
            ErrorCorrectionLevel errorCorrectionLevel = ErrorCorrectionLevel.L;
            int i3 = 4;
            if (map != null) {
                ErrorCorrectionLevel errorCorrectionLevel2 = (ErrorCorrectionLevel) map.get(EncodeHintType.ERROR_CORRECTION);
                if (errorCorrectionLevel2 != null) {
                    errorCorrectionLevel = errorCorrectionLevel2;
                }
                Integer num = (Integer) map.get(EncodeHintType.MARGIN);
                if (num != null) {
                    i3 = num.intValue();
                }
            }
            return renderResult(Encoder.encode(str, errorCorrectionLevel, map), i, i2, i3);
        }
    }
}

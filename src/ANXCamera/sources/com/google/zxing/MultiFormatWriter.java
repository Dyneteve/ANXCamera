package com.google.zxing;

import com.google.zxing.aztec.AztecWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.datamatrix.DataMatrixWriter;
import com.google.zxing.oned.CodaBarWriter;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.oned.Code39Writer;
import com.google.zxing.oned.EAN13Writer;
import com.google.zxing.oned.EAN8Writer;
import com.google.zxing.oned.ITFWriter;
import com.google.zxing.oned.UPCAWriter;
import com.google.zxing.pdf417.PDF417Writer;
import com.google.zxing.qrcode.QRCodeWriter;
import java.util.Map;

public final class MultiFormatWriter implements Writer {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$BarcodeFormat;

    static /* synthetic */ int[] $SWITCH_TABLE$com$google$zxing$BarcodeFormat() {
        int[] iArr = $SWITCH_TABLE$com$google$zxing$BarcodeFormat;
        if (iArr != null) {
            return iArr;
        }
        int[] iArr2 = new int[BarcodeFormat.values().length];
        try {
            iArr2[BarcodeFormat.AZTEC.ordinal()] = 1;
        } catch (NoSuchFieldError e) {
        }
        try {
            iArr2[BarcodeFormat.CODABAR.ordinal()] = 2;
        } catch (NoSuchFieldError e2) {
        }
        try {
            iArr2[BarcodeFormat.CODE_128.ordinal()] = 5;
        } catch (NoSuchFieldError e3) {
        }
        try {
            iArr2[BarcodeFormat.CODE_39.ordinal()] = 3;
        } catch (NoSuchFieldError e4) {
        }
        try {
            iArr2[BarcodeFormat.CODE_93.ordinal()] = 4;
        } catch (NoSuchFieldError e5) {
        }
        try {
            iArr2[BarcodeFormat.DATA_MATRIX.ordinal()] = 6;
        } catch (NoSuchFieldError e6) {
        }
        try {
            iArr2[BarcodeFormat.EAN_13.ordinal()] = 8;
        } catch (NoSuchFieldError e7) {
        }
        try {
            iArr2[BarcodeFormat.EAN_8.ordinal()] = 7;
        } catch (NoSuchFieldError e8) {
        }
        try {
            iArr2[BarcodeFormat.ITF.ordinal()] = 9;
        } catch (NoSuchFieldError e9) {
        }
        try {
            iArr2[BarcodeFormat.MAXICODE.ordinal()] = 10;
        } catch (NoSuchFieldError e10) {
        }
        try {
            iArr2[BarcodeFormat.PDF_417.ordinal()] = 11;
        } catch (NoSuchFieldError e11) {
        }
        try {
            iArr2[BarcodeFormat.QR_CODE.ordinal()] = 12;
        } catch (NoSuchFieldError e12) {
        }
        try {
            iArr2[BarcodeFormat.RSS_14.ordinal()] = 13;
        } catch (NoSuchFieldError e13) {
        }
        try {
            iArr2[BarcodeFormat.RSS_EXPANDED.ordinal()] = 14;
        } catch (NoSuchFieldError e14) {
        }
        try {
            iArr2[BarcodeFormat.UPC_A.ordinal()] = 15;
        } catch (NoSuchFieldError e15) {
        }
        try {
            iArr2[BarcodeFormat.UPC_E.ordinal()] = 16;
        } catch (NoSuchFieldError e16) {
        }
        try {
            iArr2[BarcodeFormat.UPC_EAN_EXTENSION.ordinal()] = 17;
        } catch (NoSuchFieldError e17) {
        }
        $SWITCH_TABLE$com$google$zxing$BarcodeFormat = iArr2;
        return iArr2;
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException {
        return encode(str, barcodeFormat, i, i2, null);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException {
        Writer writer;
        switch ($SWITCH_TABLE$com$google$zxing$BarcodeFormat()[barcodeFormat.ordinal()]) {
            case 1:
                writer = new AztecWriter();
                break;
            case 2:
                writer = new CodaBarWriter();
                break;
            case 3:
                writer = new Code39Writer();
                break;
            case 5:
                writer = new Code128Writer();
                break;
            case 6:
                writer = new DataMatrixWriter();
                break;
            case 7:
                writer = new EAN8Writer();
                break;
            case 8:
                writer = new EAN13Writer();
                break;
            case 9:
                writer = new ITFWriter();
                break;
            case 11:
                writer = new PDF417Writer();
                break;
            case 12:
                writer = new QRCodeWriter();
                break;
            case 15:
                writer = new UPCAWriter();
                break;
            default:
                StringBuilder sb = new StringBuilder("No encoder available for format ");
                sb.append(barcodeFormat);
                throw new IllegalArgumentException(sb.toString());
        }
        return writer.encode(str, barcodeFormat, i, i2, map);
    }
}

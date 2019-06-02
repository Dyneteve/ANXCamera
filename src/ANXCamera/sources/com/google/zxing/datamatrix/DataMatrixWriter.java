package com.google.zxing.datamatrix;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Dimension;
import com.google.zxing.EncodeHintType;
import com.google.zxing.Writer;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.datamatrix.encoder.DefaultPlacement;
import com.google.zxing.datamatrix.encoder.ErrorCorrection;
import com.google.zxing.datamatrix.encoder.HighLevelEncoder;
import com.google.zxing.datamatrix.encoder.SymbolInfo;
import com.google.zxing.datamatrix.encoder.SymbolShapeHint;
import com.google.zxing.qrcode.encoder.ByteMatrix;
import java.util.Map;

public final class DataMatrixWriter implements Writer {
    private static BitMatrix convertByteMatrixToBitMatrix(ByteMatrix byteMatrix) {
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        BitMatrix bitMatrix = new BitMatrix(width, height);
        bitMatrix.clear();
        for (int i = 0; i < width; i++) {
            for (int i2 = 0; i2 < height; i2++) {
                if (byteMatrix.get(i, i2) == 1) {
                    bitMatrix.set(i, i2);
                }
            }
        }
        return bitMatrix;
    }

    private static BitMatrix encodeLowLevel(DefaultPlacement defaultPlacement, SymbolInfo symbolInfo) {
        int symbolDataWidth = symbolInfo.getSymbolDataWidth();
        int symbolDataHeight = symbolInfo.getSymbolDataHeight();
        ByteMatrix byteMatrix = new ByteMatrix(symbolInfo.getSymbolWidth(), symbolInfo.getSymbolHeight());
        int i = 0;
        for (int i2 = 0; i2 < symbolDataHeight; i2++) {
            if (i2 % symbolInfo.matrixHeight == 0) {
                int i3 = 0;
                for (int i4 = 0; i4 < symbolInfo.getSymbolWidth(); i4++) {
                    byteMatrix.set(i3, i, i4 % 2 == 0);
                    i3++;
                }
                i++;
            }
            int i5 = 0;
            for (int i6 = 0; i6 < symbolDataWidth; i6++) {
                if (i6 % symbolInfo.matrixWidth == 0) {
                    byteMatrix.set(i5, i, true);
                    i5++;
                }
                byteMatrix.set(i5, i, defaultPlacement.getBit(i6, i2));
                i5++;
                if (i6 % symbolInfo.matrixWidth == symbolInfo.matrixWidth - 1) {
                    byteMatrix.set(i5, i, i2 % 2 == 0);
                    i5++;
                }
            }
            i++;
            if (i2 % symbolInfo.matrixHeight == symbolInfo.matrixHeight - 1) {
                int i7 = 0;
                for (int i8 = 0; i8 < symbolInfo.getSymbolWidth(); i8++) {
                    byteMatrix.set(i7, i, true);
                    i7++;
                }
                i++;
            }
        }
        return convertByteMatrixToBitMatrix(byteMatrix);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) {
        return encode(str, barcodeFormat, i, i2, null);
    }

    public BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) {
        if (str.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        } else if (barcodeFormat != BarcodeFormat.DATA_MATRIX) {
            StringBuilder sb = new StringBuilder("Can only encode DATA_MATRIX, but got ");
            sb.append(barcodeFormat);
            throw new IllegalArgumentException(sb.toString());
        } else if (i < 0 || i2 < 0) {
            StringBuilder sb2 = new StringBuilder("Requested dimensions are too small: ");
            sb2.append(i);
            sb2.append('x');
            sb2.append(i2);
            throw new IllegalArgumentException(sb2.toString());
        } else {
            SymbolShapeHint symbolShapeHint = SymbolShapeHint.FORCE_NONE;
            Dimension dimension = null;
            Dimension dimension2 = null;
            if (map != null) {
                SymbolShapeHint symbolShapeHint2 = (SymbolShapeHint) map.get(EncodeHintType.DATA_MATRIX_SHAPE);
                if (symbolShapeHint2 != null) {
                    symbolShapeHint = symbolShapeHint2;
                }
                Dimension dimension3 = (Dimension) map.get(EncodeHintType.MIN_SIZE);
                if (dimension3 != null) {
                    dimension = dimension3;
                }
                Dimension dimension4 = (Dimension) map.get(EncodeHintType.MAX_SIZE);
                if (dimension4 != null) {
                    dimension2 = dimension4;
                }
            }
            String encodeHighLevel = HighLevelEncoder.encodeHighLevel(str, symbolShapeHint, dimension, dimension2);
            SymbolInfo lookup = SymbolInfo.lookup(encodeHighLevel.length(), symbolShapeHint, dimension, dimension2, true);
            DefaultPlacement defaultPlacement = new DefaultPlacement(ErrorCorrection.encodeECC200(encodeHighLevel, lookup), lookup.getSymbolDataWidth(), lookup.getSymbolDataHeight());
            defaultPlacement.place();
            return encodeLowLevel(defaultPlacement, lookup);
        }
    }
}

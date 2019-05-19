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
    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height) {
        return encode(contents, format, width, height, null);
    }

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) {
        if (contents.isEmpty()) {
            throw new IllegalArgumentException("Found empty contents");
        } else if (format != BarcodeFormat.DATA_MATRIX) {
            StringBuilder sb = new StringBuilder("Can only encode DATA_MATRIX, but got ");
            sb.append(format);
            throw new IllegalArgumentException(sb.toString());
        } else if (width < 0 || height < 0) {
            StringBuilder sb2 = new StringBuilder("Requested dimensions are too small: ");
            sb2.append(width);
            sb2.append('x');
            sb2.append(height);
            throw new IllegalArgumentException(sb2.toString());
        } else {
            SymbolShapeHint shape = SymbolShapeHint.FORCE_NONE;
            Dimension minSize = null;
            Dimension maxSize = null;
            if (hints != null) {
                SymbolShapeHint requestedShape = (SymbolShapeHint) hints.get(EncodeHintType.DATA_MATRIX_SHAPE);
                if (requestedShape != null) {
                    shape = requestedShape;
                }
                Dimension requestedMinSize = (Dimension) hints.get(EncodeHintType.MIN_SIZE);
                if (requestedMinSize != null) {
                    minSize = requestedMinSize;
                }
                Dimension requestedMaxSize = (Dimension) hints.get(EncodeHintType.MAX_SIZE);
                if (requestedMaxSize != null) {
                    maxSize = requestedMaxSize;
                }
            }
            String encoded = HighLevelEncoder.encodeHighLevel(contents, shape, minSize, maxSize);
            SymbolInfo symbolInfo = SymbolInfo.lookup(encoded.length(), shape, minSize, maxSize, true);
            DefaultPlacement placement = new DefaultPlacement(ErrorCorrection.encodeECC200(encoded, symbolInfo), symbolInfo.getSymbolDataWidth(), symbolInfo.getSymbolDataHeight());
            placement.place();
            return encodeLowLevel(placement, symbolInfo);
        }
    }

    private static BitMatrix encodeLowLevel(DefaultPlacement placement, SymbolInfo symbolInfo) {
        int symbolWidth = symbolInfo.getSymbolDataWidth();
        int symbolHeight = symbolInfo.getSymbolDataHeight();
        ByteMatrix matrix = new ByteMatrix(symbolInfo.getSymbolWidth(), symbolInfo.getSymbolHeight());
        int matrixY = 0;
        for (int y = 0; y < symbolHeight; y++) {
            if (y % symbolInfo.matrixHeight == 0) {
                int matrixX = 0;
                for (int x = 0; x < symbolInfo.getSymbolWidth(); x++) {
                    matrix.set(matrixX, matrixY, x % 2 == 0);
                    matrixX++;
                }
                matrixY++;
            }
            int matrixX2 = 0;
            for (int x2 = 0; x2 < symbolWidth; x2++) {
                if (x2 % symbolInfo.matrixWidth == 0) {
                    matrix.set(matrixX2, matrixY, true);
                    matrixX2++;
                }
                matrix.set(matrixX2, matrixY, placement.getBit(x2, y));
                matrixX2++;
                if (x2 % symbolInfo.matrixWidth == symbolInfo.matrixWidth - 1) {
                    matrix.set(matrixX2, matrixY, y % 2 == 0);
                    matrixX2++;
                }
            }
            matrixY++;
            if (y % symbolInfo.matrixHeight == symbolInfo.matrixHeight - 1) {
                int matrixX3 = 0;
                for (int x3 = 0; x3 < symbolInfo.getSymbolWidth(); x3++) {
                    matrix.set(matrixX3, matrixY, true);
                    matrixX3++;
                }
                matrixY++;
            }
        }
        return convertByteMatrixToBitMatrix(matrix);
    }

    private static BitMatrix convertByteMatrixToBitMatrix(ByteMatrix matrix) {
        int matrixWidgth = matrix.getWidth();
        int matrixHeight = matrix.getHeight();
        BitMatrix output = new BitMatrix(matrixWidgth, matrixHeight);
        output.clear();
        for (int i = 0; i < matrixWidgth; i++) {
            for (int j = 0; j < matrixHeight; j++) {
                if (matrix.get(i, j) == 1) {
                    output.set(i, j);
                }
            }
        }
        return output;
    }
}

package com.google.zxing.datamatrix.encoder;

import com.google.zxing.Dimension;
import com.sensetime.stmobile.STMobileHumanActionNative;

public class SymbolInfo {
    static final SymbolInfo[] PROD_SYMBOLS;
    private static SymbolInfo[] symbols = PROD_SYMBOLS;
    private final int dataCapacity;
    private final int dataRegions;
    private final int errorCodewords;
    public final int matrixHeight;
    public final int matrixWidth;
    private final boolean rectangular;
    private final int rsBlockData;
    private final int rsBlockError;

    static {
        SymbolInfo symbolInfo = new SymbolInfo(false, 3, 5, 8, 8, 1);
        SymbolInfo symbolInfo2 = new SymbolInfo(false, 5, 7, 10, 10, 1);
        SymbolInfo symbolInfo3 = new SymbolInfo(true, 5, 7, 16, 6, 1);
        SymbolInfo symbolInfo4 = new SymbolInfo(false, 8, 10, 12, 12, 1);
        SymbolInfo symbolInfo5 = new SymbolInfo(true, 10, 11, 14, 6, 2);
        SymbolInfo symbolInfo6 = new SymbolInfo(false, 12, 12, 14, 14, 1);
        SymbolInfo symbolInfo7 = new SymbolInfo(true, 16, 14, 24, 10, 1);
        SymbolInfo symbolInfo8 = new SymbolInfo(false, 18, 14, 16, 16, 1);
        SymbolInfo symbolInfo9 = new SymbolInfo(false, 22, 18, 18, 18, 1);
        SymbolInfo symbolInfo10 = new SymbolInfo(true, 22, 18, 16, 10, 2);
        SymbolInfo symbolInfo11 = new SymbolInfo(false, 30, 20, 20, 20, 1);
        SymbolInfo symbolInfo12 = new SymbolInfo(true, 32, 24, 16, 14, 2);
        SymbolInfo symbolInfo13 = new SymbolInfo(false, 36, 24, 22, 22, 1);
        SymbolInfo symbolInfo14 = new SymbolInfo(false, 44, 28, 24, 24, 1);
        SymbolInfo symbolInfo15 = new SymbolInfo(true, 49, 28, 22, 14, 2);
        SymbolInfo symbolInfo16 = new SymbolInfo(false, 62, 36, 14, 14, 4);
        SymbolInfo symbolInfo17 = new SymbolInfo(false, 86, 42, 16, 16, 4);
        SymbolInfo symbolInfo18 = new SymbolInfo(false, 114, 48, 18, 18, 4);
        SymbolInfo symbolInfo19 = new SymbolInfo(false, 144, 56, 20, 20, 4);
        SymbolInfo symbolInfo20 = new SymbolInfo(false, 174, 68, 22, 22, 4);
        SymbolInfo symbolInfo21 = new SymbolInfo(false, 204, 84, 24, 24, 4, 102, 42);
        SymbolInfo symbolInfo22 = new SymbolInfo(false, 280, 112, 14, 14, 16, 140, 56);
        SymbolInfo symbolInfo23 = new SymbolInfo(false, 368, 144, 16, 16, 16, 92, 36);
        SymbolInfo symbolInfo24 = new SymbolInfo(false, 456, 192, 18, 18, 16, 114, 48);
        SymbolInfo symbolInfo25 = new SymbolInfo(false, 576, 224, 20, 20, 16, 144, 56);
        SymbolInfo symbolInfo26 = new SymbolInfo(false, 696, 272, 22, 22, 16, 174, 68);
        SymbolInfo symbolInfo27 = new SymbolInfo(false, 816, 336, 24, 24, 16, 136, 56);
        SymbolInfo symbolInfo28 = new SymbolInfo(false, 1050, 408, 18, 18, 36, 175, 68);
        SymbolInfo symbolInfo29 = new SymbolInfo(false, 1304, STMobileHumanActionNative.ST_MOBILE_HUMAN_ACTION_DEFAULT_CONFIG_VIDEO, 20, 20, 36, 163, 62);
        PROD_SYMBOLS = new SymbolInfo[]{symbolInfo, symbolInfo2, symbolInfo3, symbolInfo4, symbolInfo5, symbolInfo6, symbolInfo7, symbolInfo8, symbolInfo9, symbolInfo10, symbolInfo11, symbolInfo12, symbolInfo13, symbolInfo14, symbolInfo15, symbolInfo16, symbolInfo17, symbolInfo18, symbolInfo19, symbolInfo20, symbolInfo21, symbolInfo22, symbolInfo23, symbolInfo24, symbolInfo25, symbolInfo26, symbolInfo27, symbolInfo28, symbolInfo29, new DataMatrixSymbolInfo144()};
    }

    public SymbolInfo(boolean z, int i, int i2, int i3, int i4, int i5) {
        this(z, i, i2, i3, i4, i5, i, i2);
    }

    SymbolInfo(boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        this.rectangular = z;
        this.dataCapacity = i;
        this.errorCodewords = i2;
        this.matrixWidth = i3;
        this.matrixHeight = i4;
        this.dataRegions = i5;
        this.rsBlockData = i6;
        this.rsBlockError = i7;
    }

    public static SymbolInfo lookup(int i) {
        return lookup(i, SymbolShapeHint.FORCE_NONE, true);
    }

    public static SymbolInfo lookup(int i, SymbolShapeHint symbolShapeHint) {
        return lookup(i, symbolShapeHint, true);
    }

    public static SymbolInfo lookup(int i, SymbolShapeHint symbolShapeHint, Dimension dimension, Dimension dimension2, boolean z) {
        SymbolInfo[] symbolInfoArr = symbols;
        int length = symbolInfoArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            SymbolInfo symbolInfo = symbolInfoArr[i2];
            if ((symbolShapeHint != SymbolShapeHint.FORCE_SQUARE || !symbolInfo.rectangular) && ((symbolShapeHint != SymbolShapeHint.FORCE_RECTANGLE || symbolInfo.rectangular) && ((dimension == null || (symbolInfo.getSymbolWidth() >= dimension.getWidth() && symbolInfo.getSymbolHeight() >= dimension.getHeight())) && ((dimension2 == null || (symbolInfo.getSymbolWidth() <= dimension2.getWidth() && symbolInfo.getSymbolHeight() <= dimension2.getHeight())) && i <= symbolInfo.dataCapacity)))) {
                return symbolInfo;
            }
        }
        if (!z) {
            return null;
        }
        StringBuilder sb = new StringBuilder("Can't find a symbol arrangement that matches the message. Data codewords: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    private static SymbolInfo lookup(int i, SymbolShapeHint symbolShapeHint, boolean z) {
        return lookup(i, symbolShapeHint, null, null, z);
    }

    public static SymbolInfo lookup(int i, boolean z, boolean z2) {
        return lookup(i, z ? SymbolShapeHint.FORCE_NONE : SymbolShapeHint.FORCE_SQUARE, z2);
    }

    public static void overrideSymbolSet(SymbolInfo[] symbolInfoArr) {
        symbols = symbolInfoArr;
    }

    public int getCodewordCount() {
        return this.dataCapacity + this.errorCodewords;
    }

    public final int getDataCapacity() {
        return this.dataCapacity;
    }

    public int getDataLengthForInterleavedBlock(int i) {
        return this.rsBlockData;
    }

    public final int getErrorCodewords() {
        return this.errorCodewords;
    }

    public final int getErrorLengthForInterleavedBlock(int i) {
        return this.rsBlockError;
    }

    /* access modifiers changed from: 0000 */
    public final int getHorizontalDataRegions() {
        int i = this.dataRegions;
        if (i == 4) {
            return 2;
        }
        if (i == 16) {
            return 4;
        }
        if (i == 36) {
            return 6;
        }
        switch (i) {
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                throw new IllegalStateException("Cannot handle this number of data regions");
        }
    }

    public int getInterleavedBlockCount() {
        return this.dataCapacity / this.rsBlockData;
    }

    public final int getSymbolDataHeight() {
        return getVerticalDataRegions() * this.matrixHeight;
    }

    public final int getSymbolDataWidth() {
        return getHorizontalDataRegions() * this.matrixWidth;
    }

    public final int getSymbolHeight() {
        return getSymbolDataHeight() + (getVerticalDataRegions() * 2);
    }

    public final int getSymbolWidth() {
        return getSymbolDataWidth() + (getHorizontalDataRegions() * 2);
    }

    /* access modifiers changed from: 0000 */
    public final int getVerticalDataRegions() {
        int i = this.dataRegions;
        if (i == 4) {
            return 2;
        }
        if (i == 16) {
            return 4;
        }
        if (i == 36) {
            return 6;
        }
        switch (i) {
            case 1:
                return 1;
            case 2:
                return 1;
            default:
                throw new IllegalStateException("Cannot handle this number of data regions");
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.rectangular ? "Rectangular Symbol:" : "Square Symbol:");
        sb.append(" data region ");
        sb.append(this.matrixWidth);
        sb.append('x');
        sb.append(this.matrixHeight);
        sb.append(", symbol size ");
        sb.append(getSymbolWidth());
        sb.append('x');
        sb.append(getSymbolHeight());
        sb.append(", symbol data size ");
        sb.append(getSymbolDataWidth());
        sb.append('x');
        sb.append(getSymbolDataHeight());
        sb.append(", codewords ");
        sb.append(this.dataCapacity);
        sb.append('+');
        sb.append(this.errorCodewords);
        return sb.toString();
    }
}

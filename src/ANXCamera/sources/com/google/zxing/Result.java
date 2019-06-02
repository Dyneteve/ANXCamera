package com.google.zxing;

import java.util.EnumMap;
import java.util.Map;

public final class Result {
    private final BarcodeFormat format;
    private final byte[] rawBytes;
    private Map<ResultMetadataType, Object> resultMetadata;
    private ResultPoint[] resultPoints;
    private final String text;
    private final long timestamp;

    public Result(String str, byte[] bArr, ResultPoint[] resultPointArr, BarcodeFormat barcodeFormat) {
        this(str, bArr, resultPointArr, barcodeFormat, System.currentTimeMillis());
    }

    public Result(String str, byte[] bArr, ResultPoint[] resultPointArr, BarcodeFormat barcodeFormat, long j) {
        this.text = str;
        this.rawBytes = bArr;
        this.resultPoints = resultPointArr;
        this.format = barcodeFormat;
        this.resultMetadata = null;
        this.timestamp = j;
    }

    public void addResultPoints(ResultPoint[] resultPointArr) {
        ResultPoint[] resultPointArr2 = this.resultPoints;
        if (resultPointArr2 == null) {
            this.resultPoints = resultPointArr;
        } else if (resultPointArr != null && resultPointArr.length > 0) {
            ResultPoint[] resultPointArr3 = new ResultPoint[(resultPointArr2.length + resultPointArr.length)];
            System.arraycopy(resultPointArr2, 0, resultPointArr3, 0, resultPointArr2.length);
            System.arraycopy(resultPointArr, 0, resultPointArr3, resultPointArr2.length, resultPointArr.length);
            this.resultPoints = resultPointArr3;
        }
    }

    public BarcodeFormat getBarcodeFormat() {
        return this.format;
    }

    public byte[] getRawBytes() {
        return this.rawBytes;
    }

    public Map<ResultMetadataType, Object> getResultMetadata() {
        return this.resultMetadata;
    }

    public ResultPoint[] getResultPoints() {
        return this.resultPoints;
    }

    public String getText() {
        return this.text;
    }

    public long getTimestamp() {
        return this.timestamp;
    }

    public void putAllMetadata(Map<ResultMetadataType, Object> map) {
        if (map == null) {
            return;
        }
        if (this.resultMetadata == null) {
            this.resultMetadata = map;
        } else {
            this.resultMetadata.putAll(map);
        }
    }

    public void putMetadata(ResultMetadataType resultMetadataType, Object obj) {
        if (this.resultMetadata == null) {
            this.resultMetadata = new EnumMap(ResultMetadataType.class);
        }
        this.resultMetadata.put(resultMetadataType, obj);
    }

    public String toString() {
        return this.text;
    }
}

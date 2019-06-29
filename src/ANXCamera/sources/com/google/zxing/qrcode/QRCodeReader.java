package com.google.zxing.qrcode;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.qrcode.decoder.Decoder;
import com.google.zxing.qrcode.decoder.QRCodeDecoderMetaData;
import com.google.zxing.qrcode.detector.Detector;
import java.util.List;
import java.util.Map;

public class QRCodeReader implements Reader {
    private static final ResultPoint[] NO_POINTS = new ResultPoint[0];
    private final Decoder decoder = new Decoder();

    private static BitMatrix extractPureBits(BitMatrix bitMatrix) throws NotFoundException {
        BitMatrix bitMatrix2 = bitMatrix;
        int[] topLeftOnBit = bitMatrix.getTopLeftOnBit();
        int[] bottomRightOnBit = bitMatrix.getBottomRightOnBit();
        if (topLeftOnBit == null || bottomRightOnBit == null) {
            int[] iArr = topLeftOnBit;
            int[] iArr2 = bottomRightOnBit;
            throw NotFoundException.getNotFoundInstance();
        }
        float moduleSize = moduleSize(topLeftOnBit, bitMatrix2);
        int i = topLeftOnBit[1];
        int i2 = bottomRightOnBit[1];
        int i3 = topLeftOnBit[0];
        int i4 = bottomRightOnBit[0];
        if (i3 >= i4 || i >= i2) {
            int[] iArr3 = topLeftOnBit;
            int[] iArr4 = bottomRightOnBit;
            throw NotFoundException.getNotFoundInstance();
        }
        if (i2 - i != i4 - i3) {
            i4 = i3 + (i2 - i);
        }
        int round = Math.round(((float) ((i4 - i3) + 1)) / moduleSize);
        int round2 = Math.round(((float) ((i2 - i) + 1)) / moduleSize);
        if (round <= 0 || round2 <= 0) {
            int[] iArr5 = topLeftOnBit;
            int[] iArr6 = bottomRightOnBit;
            throw NotFoundException.getNotFoundInstance();
        } else if (round2 == round) {
            int i5 = (int) (moduleSize / 2.0f);
            int i6 = i + i5;
            int i7 = i3 + i5;
            int i8 = (((int) (((float) (round - 1)) * moduleSize)) + i7) - i4;
            if (i8 > 0) {
                if (i8 <= i5) {
                    i7 -= i8;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            int i9 = i7;
            int i10 = (((int) (((float) (round2 - 1)) * moduleSize)) + i6) - i2;
            if (i10 > 0) {
                if (i10 <= i5) {
                    i6 -= i10;
                } else {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            int i11 = i6;
            BitMatrix bitMatrix3 = new BitMatrix(round, round2);
            int i12 = 0;
            while (i12 < round2) {
                int i13 = ((int) (((float) i12) * moduleSize)) + i11;
                int[] iArr7 = topLeftOnBit;
                int i14 = 0;
                while (i14 < round) {
                    int[] iArr8 = bottomRightOnBit;
                    if (bitMatrix2.get(((int) (((float) i14) * moduleSize)) + i9, i13)) {
                        bitMatrix3.set(i14, i12);
                    }
                    i14++;
                    bottomRightOnBit = iArr8;
                }
                i12++;
                topLeftOnBit = iArr7;
            }
            return bitMatrix3;
        } else {
            int[] iArr9 = topLeftOnBit;
            int[] iArr10 = bottomRightOnBit;
            throw NotFoundException.getNotFoundInstance();
        }
    }

    private static float moduleSize(int[] iArr, BitMatrix bitMatrix) throws NotFoundException {
        int height = bitMatrix.getHeight();
        int width = bitMatrix.getWidth();
        int i = iArr[0];
        int i2 = iArr[1];
        boolean z = true;
        int i3 = 0;
        while (i < width && i2 < height) {
            if (z != bitMatrix.get(i, i2)) {
                i3++;
                if (i3 == 5) {
                    break;
                }
                z = !z;
            }
            i++;
            i2++;
        }
        if (i != width && i2 != height) {
            return ((float) (i - iArr[0])) / 7.0f;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, ChecksumException, FormatException {
        return decode(binaryBitmap, null);
    }

    public final Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        DecoderResult decoderResult;
        ResultPoint[] resultPointArr;
        if (map == null || !map.containsKey(DecodeHintType.PURE_BARCODE)) {
            DetectorResult detect = new Detector(binaryBitmap.getBlackMatrix()).detect(map);
            decoderResult = this.decoder.decode(detect.getBits(), map);
            resultPointArr = detect.getPoints();
        } else {
            decoderResult = this.decoder.decode(extractPureBits(binaryBitmap.getBlackMatrix()), map);
            resultPointArr = NO_POINTS;
        }
        if (decoderResult.getOther() instanceof QRCodeDecoderMetaData) {
            ((QRCodeDecoderMetaData) decoderResult.getOther()).applyMirroredCorrection(resultPointArr);
        }
        Result result = new Result(decoderResult.getText(), decoderResult.getRawBytes(), resultPointArr, BarcodeFormat.QR_CODE);
        List byteSegments = decoderResult.getByteSegments();
        if (byteSegments != null) {
            result.putMetadata(ResultMetadataType.BYTE_SEGMENTS, byteSegments);
        }
        String eCLevel = decoderResult.getECLevel();
        if (eCLevel != null) {
            result.putMetadata(ResultMetadataType.ERROR_CORRECTION_LEVEL, eCLevel);
        }
        if (decoderResult.hasStructuredAppend()) {
            result.putMetadata(ResultMetadataType.STRUCTURED_APPEND_SEQUENCE, Integer.valueOf(decoderResult.getStructuredAppendSequenceNumber()));
            result.putMetadata(ResultMetadataType.STRUCTURED_APPEND_PARITY, Integer.valueOf(decoderResult.getStructuredAppendParity()));
        }
        return result;
    }

    /* access modifiers changed from: protected */
    public final Decoder getDecoder() {
        return this.decoder;
    }

    public void reset() {
    }
}

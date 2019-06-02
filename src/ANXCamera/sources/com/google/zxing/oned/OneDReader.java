package com.google.zxing.oned;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;

public abstract class OneDReader implements Reader {
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x010a, code lost:
        return r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0146, code lost:
        r12 = r22;
        r20 = r1;
        r17 = r2;
        r18 = r4;
     */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x0099 A[SYNTHETIC, Splitter:B:44:0x0099] */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x0104 A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private Result doDecode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException {
        int i;
        int i2;
        int i3;
        Map<DecodeHintType, ?> map2;
        int i4;
        Map<DecodeHintType, ?> map3;
        int i5;
        int i6;
        Map<DecodeHintType, ?> map4 = map;
        int width = binaryBitmap.getWidth();
        int height = binaryBitmap.getHeight();
        BitArray bitArray = new BitArray(width);
        int i7 = height >> 1;
        int i8 = 1;
        boolean z = map4 != null && map4.containsKey(DecodeHintType.TRY_HARDER);
        int max = Math.max(1, height >> (z ? 8 : 5));
        int i9 = z ? height : 15;
        int i10 = 0;
        BitArray bitArray2 = bitArray;
        Map<DecodeHintType, ?> map5 = map4;
        loop0:
        while (true) {
            if (i10 >= i9) {
                break;
            }
            int i11 = 2;
            int i12 = (i10 + 1) / 2;
            int i13 = i7 + ((((i10 & 1) == 0 ? i8 : 0) != 0 ? i12 : -i12) * max);
            if (i13 >= 0) {
                if (i13 >= height) {
                    int i14 = width;
                    int i15 = height;
                    int i16 = i7;
                    break;
                }
                try {
                    bitArray2 = binaryBitmap.getBlackRow(i13, bitArray2);
                    Map<DecodeHintType, ?> map6 = map5;
                    int i17 = 0;
                    Map<DecodeHintType, ?> map7 = map6;
                    while (i17 < i11) {
                        if (i17 == i8) {
                            bitArray2.reverse();
                            if (map7 != null && map7.containsKey(DecodeHintType.NEED_RESULT_POINT_CALLBACK)) {
                                map2 = new EnumMap<>(DecodeHintType.class);
                                map2.putAll(map7);
                                map2.remove(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
                                Map<DecodeHintType, ?> map8 = map2;
                                Result decodeRow = decodeRow(i13, bitArray2, map2);
                                i6 = height;
                                if (i17 == 1) {
                                    int i18 = width;
                                    int i19 = i7;
                                    Map<DecodeHintType, ?> map9 = map2;
                                    break loop0;
                                }
                                try {
                                    i5 = i7;
                                    try {
                                        decodeRow.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(180));
                                        ResultPoint[] resultPoints = decodeRow.getResultPoints();
                                        if (resultPoints == null) {
                                            int i20 = width;
                                            Map<DecodeHintType, ?> map10 = map2;
                                            break loop0;
                                        }
                                        map3 = map2;
                                        try {
                                            resultPoints[0] = new ResultPoint((((float) width) - resultPoints[0].getX()) - 1.0f, resultPoints[0].getY());
                                            i4 = width;
                                            i8 = 1;
                                            try {
                                                resultPoints[1] = new ResultPoint((((float) width) - resultPoints[1].getX()) - 1.0f, resultPoints[1].getY());
                                                break loop0;
                                            } catch (ReaderException e) {
                                            }
                                        } catch (ReaderException e2) {
                                            i4 = width;
                                            i8 = 1;
                                            i17++;
                                            height = i6;
                                            i7 = i5;
                                            map7 = map3;
                                            width = i4;
                                            BinaryBitmap binaryBitmap2 = binaryBitmap;
                                            i11 = 2;
                                        }
                                    } catch (ReaderException e3) {
                                        i4 = width;
                                        map3 = map2;
                                        i8 = 1;
                                        i17++;
                                        height = i6;
                                        i7 = i5;
                                        map7 = map3;
                                        width = i4;
                                        BinaryBitmap binaryBitmap22 = binaryBitmap;
                                        i11 = 2;
                                    }
                                } catch (ReaderException e4) {
                                    i4 = width;
                                    i5 = i7;
                                    map3 = map2;
                                    i8 = 1;
                                    i17++;
                                    height = i6;
                                    i7 = i5;
                                    map7 = map3;
                                    width = i4;
                                    BinaryBitmap binaryBitmap222 = binaryBitmap;
                                    i11 = 2;
                                }
                            }
                        }
                        map2 = map7;
                        try {
                            Result decodeRow2 = decodeRow(i13, bitArray2, map2);
                            i6 = height;
                            if (i17 == 1) {
                            }
                        } catch (ReaderException e5) {
                            i4 = width;
                            i6 = height;
                            i5 = i7;
                            map3 = map2;
                            i8 = 1;
                            i17++;
                            height = i6;
                            i7 = i5;
                            map7 = map3;
                            width = i4;
                            BinaryBitmap binaryBitmap2222 = binaryBitmap;
                            i11 = 2;
                        }
                    }
                    map5 = map7;
                    i = width;
                    i3 = height;
                    i2 = i7;
                } catch (NotFoundException e6) {
                    i = width;
                    i3 = height;
                    i2 = i7;
                    NotFoundException notFoundException = e6;
                }
                i10++;
                height = i3;
                i7 = i2;
                width = i;
            } else {
                break;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static float patternMatchVariance(int[] iArr, int[] iArr2, float f) {
        int length = iArr.length;
        int i = 0;
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            i += iArr[i3];
            i2 += iArr2[i3];
        }
        if (i < i2) {
            return Float.POSITIVE_INFINITY;
        }
        float f2 = ((float) i) / ((float) i2);
        float f3 = f * f2;
        float f4 = 0.0f;
        for (int i4 = 0; i4 < length; i4++) {
            int i5 = iArr[i4];
            float f5 = ((float) iArr2[i4]) * f2;
            float f6 = ((float) i5) > f5 ? ((float) i5) - f5 : f5 - ((float) i5);
            if (f6 > f3) {
                return Float.POSITIVE_INFINITY;
            }
            f4 += f6;
        }
        return f4 / ((float) i);
    }

    protected static void recordPattern(BitArray bitArray, int i, int[] iArr) throws NotFoundException {
        int i2;
        int length = iArr.length;
        Arrays.fill(iArr, 0, length, 0);
        int size = bitArray.getSize();
        if (i < size) {
            boolean z = !bitArray.get(i);
            int i3 = 0;
            int i4 = i;
            while (i4 < size) {
                if (bitArray.get(i4) ^ z) {
                    iArr[i3] = iArr[i3] + 1;
                } else {
                    i3++;
                    if (i3 == length) {
                        break;
                    }
                    iArr[i3] = 1;
                    z = !z;
                }
                i4++;
            }
            if (i2 == length) {
                return;
            }
            if (i2 != length - 1 || i4 != size) {
                throw NotFoundException.getNotFoundInstance();
            }
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static void recordPatternInReverse(BitArray bitArray, int i, int[] iArr) throws NotFoundException {
        int length = iArr.length;
        boolean z = bitArray.get(i);
        while (i > 0 && length >= 0) {
            i--;
            if (bitArray.get(i) != z) {
                length--;
                z = !z;
            }
        }
        if (length < 0) {
            recordPattern(bitArray, i + 1, iArr);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, FormatException {
        return decode(binaryBitmap, null);
    }

    public Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, FormatException {
        try {
            return doDecode(binaryBitmap, map);
        } catch (NotFoundException e) {
            boolean z = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
            if (!z || !binaryBitmap.isRotateSupported()) {
                throw e;
            }
            BinaryBitmap rotateCounterClockwise = binaryBitmap.rotateCounterClockwise();
            Result doDecode = doDecode(rotateCounterClockwise, map);
            Map resultMetadata = doDecode.getResultMetadata();
            int i = 270;
            if (resultMetadata != null && resultMetadata.containsKey(ResultMetadataType.ORIENTATION)) {
                i = (((Integer) resultMetadata.get(ResultMetadataType.ORIENTATION)).intValue() + 270) % 360;
            }
            doDecode.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(i));
            ResultPoint[] resultPoints = doDecode.getResultPoints();
            if (resultPoints != null) {
                int height = rotateCounterClockwise.getHeight();
                for (int i2 = 0; i2 < resultPoints.length; i2++) {
                    resultPoints[i2] = new ResultPoint((((float) height) - resultPoints[i2].getY()) - 1.0f, resultPoints[i2].getX());
                }
            }
            return doDecode;
        }
    }

    public abstract Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    public void reset() {
    }
}

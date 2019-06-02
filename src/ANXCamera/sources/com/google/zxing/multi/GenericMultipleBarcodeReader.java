package com.google.zxing.multi;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class GenericMultipleBarcodeReader implements MultipleBarcodeReader {
    private static final int MAX_DEPTH = 4;
    private static final int MIN_DIMENSION_TO_RECUR = 100;
    private final Reader delegate;

    public GenericMultipleBarcodeReader(Reader reader) {
        this.delegate = reader;
    }

    private void doDecodeMultiple(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map, List<Result> list, int i, int i2, int i3) {
        List<Result> list2;
        int i4;
        int i5;
        float f;
        float f2;
        int i6;
        int i7;
        BinaryBitmap binaryBitmap2 = binaryBitmap;
        int i8 = i;
        int i9 = i2;
        int i10 = i3;
        if (i10 <= 4) {
            try {
                Map<DecodeHintType, ?> map2 = map;
                try {
                    Result decode = this.delegate.decode(binaryBitmap2, map2);
                    boolean z = false;
                    Iterator it = list.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        } else if (((Result) it.next()).getText().equals(decode.getText())) {
                            z = true;
                            break;
                        } else {
                            List<Result> list3 = list;
                        }
                    }
                    boolean z2 = z;
                    if (!z2) {
                        list2 = list;
                        list2.add(translateResultPoints(decode, i8, i9));
                    } else {
                        list2 = list;
                    }
                    ResultPoint[] resultPoints = decode.getResultPoints();
                    if (resultPoints == null) {
                        Result result = decode;
                        ResultPoint[] resultPointArr = resultPoints;
                        boolean z3 = z2;
                    } else if (resultPoints.length == 0) {
                        Result result2 = decode;
                        ResultPoint[] resultPointArr2 = resultPoints;
                        boolean z4 = z2;
                    } else {
                        int width = binaryBitmap.getWidth();
                        int height = binaryBitmap.getHeight();
                        float f3 = (float) width;
                        float f4 = (float) height;
                        Result result3 = decode;
                        int length = resultPoints.length;
                        boolean z5 = z2;
                        int i11 = 0;
                        float f5 = 0.0f;
                        float f6 = f3;
                        int i12 = 0;
                        float f7 = f4;
                        float f8 = 0.0f;
                        while (i12 < length) {
                            float f9 = f8;
                            float f10 = f7;
                            float f11 = f6;
                            int i13 = height;
                            ResultPoint[] resultPointArr3 = resultPoints;
                            int i14 = i11;
                            int i15 = width;
                            ResultPoint resultPoint = resultPointArr3[i12];
                            float x = resultPoint.getX();
                            float y = resultPoint.getY();
                            float f12 = x < f11 ? x : f11;
                            float f13 = y < f10 ? y : f10;
                            if (x > f9) {
                                f9 = x;
                            }
                            if (y > f5) {
                                f5 = y;
                            }
                            i12++;
                            f6 = f12;
                            f7 = f13;
                            width = i15;
                            height = i13;
                            resultPoints = resultPointArr3;
                            i11 = i14;
                            f8 = f9;
                        }
                        if (f6 > 100.0f) {
                            BinaryBitmap crop = binaryBitmap2.crop(i11, i11, (int) f6, height);
                            f = f8;
                            f2 = f7;
                            float f14 = f6;
                            i5 = height;
                            i4 = width;
                            ResultPoint[] resultPointArr4 = resultPoints;
                            doDecodeMultiple(crop, map2, list2, i8, i9, i10 + 1);
                        } else {
                            f = f8;
                            f2 = f7;
                            float f15 = f6;
                            i5 = height;
                            i4 = width;
                            ResultPoint[] resultPointArr5 = resultPoints;
                        }
                        if (f2 > 100.0f) {
                            int i16 = i4;
                            float f16 = f2;
                            i6 = i16;
                            doDecodeMultiple(binaryBitmap2.crop(0, 0, i16, (int) f2), map2, list2, i8, i9, i10 + 1);
                        } else {
                            float f17 = f2;
                            i6 = i4;
                        }
                        float f18 = f;
                        if (f18 < ((float) (i6 - 100))) {
                            int i17 = i5;
                            i7 = i17;
                            float f19 = f18;
                            doDecodeMultiple(binaryBitmap2.crop((int) f18, 0, i6 - ((int) f18), i17), map2, list2, ((int) f18) + i8, i9, i10 + 1);
                        } else {
                            i7 = i5;
                            float f20 = f18;
                        }
                        float f21 = f5;
                        if (f21 < ((float) (i7 - 100))) {
                            float f22 = f21;
                            doDecodeMultiple(binaryBitmap2.crop(0, (int) f21, i6, i7 - ((int) f21)), map2, list2, i8, i9 + ((int) f21), i10 + 1);
                        } else {
                            float f23 = f21;
                        }
                    }
                } catch (ReaderException e) {
                    List<Result> list4 = list;
                }
            } catch (ReaderException e2) {
                Map<DecodeHintType, ?> map3 = map;
                List<Result> list42 = list;
            }
        }
    }

    private static Result translateResultPoints(Result result, int i, int i2) {
        ResultPoint[] resultPoints = result.getResultPoints();
        if (resultPoints == null) {
            return result;
        }
        ResultPoint[] resultPointArr = new ResultPoint[resultPoints.length];
        for (int i3 = 0; i3 < resultPoints.length; i3++) {
            ResultPoint resultPoint = resultPoints[i3];
            resultPointArr[i3] = new ResultPoint(resultPoint.getX() + ((float) i), resultPoint.getY() + ((float) i2));
        }
        Result result2 = new Result(result.getText(), result.getRawBytes(), resultPointArr, result.getBarcodeFormat());
        result2.putAllMetadata(result.getResultMetadata());
        return result2;
    }

    public Result[] decodeMultiple(BinaryBitmap binaryBitmap) throws NotFoundException {
        return decodeMultiple(binaryBitmap, null);
    }

    public Result[] decodeMultiple(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException {
        ArrayList arrayList = new ArrayList();
        doDecodeMultiple(binaryBitmap, map, arrayList, 0, 0, 0);
        if (!arrayList.isEmpty()) {
            return (Result[]) arrayList.toArray(new Result[arrayList.size()]);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}

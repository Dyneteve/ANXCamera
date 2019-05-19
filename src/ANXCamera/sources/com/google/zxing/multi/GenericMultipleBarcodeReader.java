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

    public GenericMultipleBarcodeReader(Reader delegate2) {
        this.delegate = delegate2;
    }

    public Result[] decodeMultiple(BinaryBitmap image) throws NotFoundException {
        return decodeMultiple(image, null);
    }

    public Result[] decodeMultiple(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException {
        ArrayList arrayList = new ArrayList();
        doDecodeMultiple(image, hints, arrayList, 0, 0, 0);
        if (!arrayList.isEmpty()) {
            return (Result[]) arrayList.toArray(new Result[arrayList.size()]);
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private void doDecodeMultiple(BinaryBitmap image, Map<DecodeHintType, ?> hints, List<Result> results, int xOffset, int yOffset, int currentDepth) {
        List<Result> list;
        int width;
        int height;
        float maxX;
        float minY;
        int width2;
        int height2;
        float minX;
        float minY2;
        BinaryBitmap binaryBitmap = image;
        int i = xOffset;
        int i2 = yOffset;
        int i3 = currentDepth;
        if (i3 <= 4) {
            try {
                Map<DecodeHintType, ?> map = hints;
                try {
                    Result result = this.delegate.decode(binaryBitmap, map);
                    boolean alreadyFound = false;
                    Iterator it = results.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        } else if (((Result) it.next()).getText().equals(result.getText())) {
                            alreadyFound = true;
                            break;
                        } else {
                            List<Result> list2 = results;
                        }
                    }
                    boolean alreadyFound2 = alreadyFound;
                    if (!alreadyFound2) {
                        list = results;
                        list.add(translateResultPoints(result, i, i2));
                    } else {
                        list = results;
                    }
                    ResultPoint[] resultPoints = result.getResultPoints();
                    if (resultPoints == null) {
                        ResultPoint[] resultPointArr = resultPoints;
                        boolean z = alreadyFound2;
                    } else if (resultPoints.length == 0) {
                        Result result2 = result;
                        ResultPoint[] resultPointArr2 = resultPoints;
                        boolean z2 = alreadyFound2;
                    } else {
                        int width3 = image.getWidth();
                        int height3 = image.getHeight();
                        float minX2 = (float) width3;
                        float minY3 = (float) height3;
                        Result result3 = result;
                        int length = resultPoints.length;
                        boolean z3 = alreadyFound2;
                        int width4 = 0;
                        float maxY = 0.0f;
                        float maxY2 = minX2;
                        int i4 = 0;
                        float maxX2 = minY3;
                        float minY4 = 0.0f;
                        while (i4 < length) {
                            float maxX3 = minY4;
                            float minY5 = maxX2;
                            float minX3 = maxY2;
                            int height4 = height3;
                            ResultPoint[] resultPoints2 = resultPoints;
                            int i5 = width4;
                            int width5 = width3;
                            ResultPoint point = resultPoints2[i4];
                            float x = point.getX();
                            float y = point.getY();
                            if (x < minX3) {
                                minX = x;
                            } else {
                                minX = minX3;
                            }
                            if (y < minY5) {
                                minY2 = y;
                            } else {
                                minY2 = minY5;
                            }
                            if (x > maxX3) {
                                maxX3 = x;
                            }
                            if (y > maxY) {
                                maxY = y;
                            }
                            i4++;
                            maxY2 = minX;
                            maxX2 = minY2;
                            width3 = width5;
                            height3 = height4;
                            resultPoints = resultPoints2;
                            width4 = i5;
                            minY4 = maxX3;
                        }
                        if (maxY2 > 100.0f) {
                            BinaryBitmap crop = binaryBitmap.crop(width4, width4, (int) maxY2, height3);
                            maxX = minY4;
                            minY = maxX2;
                            float f = maxY2;
                            height = height3;
                            width = width3;
                            ResultPoint[] resultPointArr3 = resultPoints;
                            doDecodeMultiple(crop, map, list, i, i2, i3 + 1);
                        } else {
                            maxX = minY4;
                            minY = maxX2;
                            float f2 = maxY2;
                            height = height3;
                            width = width3;
                            ResultPoint[] resultPointArr4 = resultPoints;
                        }
                        if (minY > 100.0f) {
                            int width6 = width;
                            float f3 = minY;
                            width2 = width6;
                            doDecodeMultiple(binaryBitmap.crop(0, 0, width6, (int) minY), map, list, i, i2, i3 + 1);
                        } else {
                            width2 = width;
                        }
                        float maxX4 = maxX;
                        if (maxX4 < ((float) (width2 - 100))) {
                            int height5 = height;
                            height2 = height5;
                            float f4 = maxX4;
                            doDecodeMultiple(binaryBitmap.crop((int) maxX4, 0, width2 - ((int) maxX4), height5), map, list, ((int) maxX4) + i, i2, i3 + 1);
                        } else {
                            height2 = height;
                            float f5 = maxX4;
                        }
                        float maxY3 = maxY;
                        if (maxY3 < ((float) (height2 - 100))) {
                            float f6 = maxY3;
                            doDecodeMultiple(binaryBitmap.crop(0, (int) maxY3, width2, height2 - ((int) maxY3)), map, list, i, i2 + ((int) maxY3), i3 + 1);
                        }
                    }
                } catch (ReaderException e) {
                    List<Result> list3 = results;
                }
            } catch (ReaderException e2) {
                Map<DecodeHintType, ?> map2 = hints;
                List<Result> list32 = results;
            }
        }
    }

    private static Result translateResultPoints(Result result, int xOffset, int yOffset) {
        ResultPoint[] oldResultPoints = result.getResultPoints();
        if (oldResultPoints == null) {
            return result;
        }
        ResultPoint[] newResultPoints = new ResultPoint[oldResultPoints.length];
        for (int i = 0; i < oldResultPoints.length; i++) {
            ResultPoint oldPoint = oldResultPoints[i];
            newResultPoints[i] = new ResultPoint(oldPoint.getX() + ((float) xOffset), oldPoint.getY() + ((float) yOffset));
        }
        Result newResult = new Result(result.getText(), result.getRawBytes(), newResultPoints, result.getBarcodeFormat());
        newResult.putAllMetadata(result.getResultMetadata());
        return newResult;
    }
}

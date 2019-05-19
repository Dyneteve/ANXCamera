package com.google.zxing.oned;

import android.provider.MiuiSettings.ScreenEffect;
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
    public abstract Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    public Result decode(BinaryBitmap image) throws NotFoundException, FormatException {
        return decode(image, null);
    }

    public Result decode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException, FormatException {
        try {
            return doDecode(image, hints);
        } catch (NotFoundException nfe) {
            boolean tryHarder = hints != null && hints.containsKey(DecodeHintType.TRY_HARDER);
            if (!tryHarder || !image.isRotateSupported()) {
                throw nfe;
            }
            BinaryBitmap rotatedImage = image.rotateCounterClockwise();
            Result result = doDecode(rotatedImage, hints);
            Map<ResultMetadataType, ?> metadata = result.getResultMetadata();
            int orientation = 270;
            if (metadata != null && metadata.containsKey(ResultMetadataType.ORIENTATION)) {
                orientation = (((Integer) metadata.get(ResultMetadataType.ORIENTATION)).intValue() + 270) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
            }
            result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(orientation));
            ResultPoint[] points = result.getResultPoints();
            if (points != null) {
                int height = rotatedImage.getHeight();
                for (int i = 0; i < points.length; i++) {
                    points[i] = new ResultPoint((((float) height) - points[i].getY()) - 1.0f, points[i].getX());
                }
            }
            return result;
        }
    }

    public void reset() {
    }

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
    private Result doDecode(BinaryBitmap image, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int maxLines;
        int width;
        int middle;
        int height;
        Map<DecodeHintType, ?> hints2;
        int width2;
        Map<DecodeHintType, ?> hints3;
        int middle2;
        int height2;
        Map<DecodeHintType, ?> map = hints;
        int width3 = image.getWidth();
        int height3 = image.getHeight();
        BitArray row = new BitArray(width3);
        int middle3 = height3 >> 1;
        int i = 1;
        boolean tryHarder = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        int rowStep = Math.max(1, height3 >> (tryHarder ? 8 : 5));
        if (tryHarder) {
            maxLines = height3;
        } else {
            maxLines = 15;
        }
        int x = 0;
        BitArray row2 = row;
        Map<DecodeHintType, ?> hints4 = map;
        loop0:
        while (true) {
            if (x >= maxLines) {
                break;
            }
            int i2 = 2;
            int rowStepsAboveOrBelow = (x + 1) / 2;
            int rowNumber = middle3 + ((((x & 1) == 0 ? i : 0) != 0 ? rowStepsAboveOrBelow : -rowStepsAboveOrBelow) * rowStep);
            if (rowNumber >= 0) {
                if (rowNumber >= height3) {
                    int i3 = width3;
                    int i4 = height3;
                    int i5 = middle3;
                    break;
                }
                try {
                    row2 = image.getBlackRow(rowNumber, row2);
                    Map<DecodeHintType, ?> map2 = hints4;
                    int attempt = 0;
                    Map<DecodeHintType, ?> hints5 = map2;
                    while (attempt < i2) {
                        if (attempt == i) {
                            row2.reverse();
                            if (hints5 != null && hints5.containsKey(DecodeHintType.NEED_RESULT_POINT_CALLBACK)) {
                                hints2 = new EnumMap<>(DecodeHintType.class);
                                hints2.putAll(hints5);
                                hints2.remove(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
                                Result result = decodeRow(rowNumber, row2, hints2);
                                height2 = height3;
                                if (attempt == 1) {
                                    int i6 = middle3;
                                    Map<DecodeHintType, ?> map3 = hints2;
                                    break loop0;
                                }
                                try {
                                    middle2 = middle3;
                                    try {
                                        result.putMetadata(ResultMetadataType.ORIENTATION, Integer.valueOf(180));
                                        ResultPoint[] points = result.getResultPoints();
                                        if (points == null) {
                                            Map<DecodeHintType, ?> map4 = hints2;
                                            break loop0;
                                        }
                                        hints3 = hints2;
                                        try {
                                            points[0] = new ResultPoint((((float) width3) - points[0].getX()) - 1.0f, points[0].getY());
                                            width2 = width3;
                                            i = 1;
                                            try {
                                                points[1] = new ResultPoint((((float) width3) - points[1].getX()) - 1.0f, points[1].getY());
                                                break loop0;
                                            } catch (ReaderException e) {
                                            }
                                        } catch (ReaderException e2) {
                                            width2 = width3;
                                            i = 1;
                                            attempt++;
                                            height3 = height2;
                                            middle3 = middle2;
                                            hints5 = hints3;
                                            width3 = width2;
                                            BinaryBitmap binaryBitmap = image;
                                            i2 = 2;
                                        }
                                    } catch (ReaderException e3) {
                                        width2 = width3;
                                        hints3 = hints2;
                                        i = 1;
                                        attempt++;
                                        height3 = height2;
                                        middle3 = middle2;
                                        hints5 = hints3;
                                        width3 = width2;
                                        BinaryBitmap binaryBitmap2 = image;
                                        i2 = 2;
                                    }
                                } catch (ReaderException e4) {
                                    width2 = width3;
                                    middle2 = middle3;
                                    hints3 = hints2;
                                    i = 1;
                                    attempt++;
                                    height3 = height2;
                                    middle3 = middle2;
                                    hints5 = hints3;
                                    width3 = width2;
                                    BinaryBitmap binaryBitmap22 = image;
                                    i2 = 2;
                                }
                            }
                        }
                        hints2 = hints5;
                        try {
                            Result result2 = decodeRow(rowNumber, row2, hints2);
                            height2 = height3;
                            if (attempt == 1) {
                            }
                        } catch (ReaderException e5) {
                            width2 = width3;
                            height2 = height3;
                            middle2 = middle3;
                            hints3 = hints2;
                            i = 1;
                            attempt++;
                            height3 = height2;
                            middle3 = middle2;
                            hints5 = hints3;
                            width3 = width2;
                            BinaryBitmap binaryBitmap222 = image;
                            i2 = 2;
                        }
                    }
                    hints4 = hints5;
                    width = width3;
                    height = height3;
                    middle = middle3;
                } catch (NotFoundException e6) {
                    width = width3;
                    height = height3;
                    middle = middle3;
                    NotFoundException notFoundException = e6;
                }
                x++;
                height3 = height;
                middle3 = middle;
                width3 = width;
            } else {
                break;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static void recordPattern(BitArray row, int start, int[] counters) throws NotFoundException {
        int counterPosition;
        int numCounters = counters.length;
        Arrays.fill(counters, 0, numCounters, 0);
        int end = row.getSize();
        if (start < end) {
            boolean isWhite = !row.get(start);
            int counterPosition2 = 0;
            int i = start;
            while (i < end) {
                if (row.get(i) ^ isWhite) {
                    counters[counterPosition2] = counters[counterPosition2] + 1;
                } else {
                    counterPosition2++;
                    if (counterPosition2 == numCounters) {
                        break;
                    }
                    counters[counterPosition2] = 1;
                    isWhite = !isWhite;
                }
                i++;
            }
            if (counterPosition == numCounters) {
                return;
            }
            if (counterPosition != numCounters - 1 || i != end) {
                throw NotFoundException.getNotFoundInstance();
            }
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static void recordPatternInReverse(BitArray row, int start, int[] counters) throws NotFoundException {
        int numTransitionsLeft = counters.length;
        boolean last = row.get(start);
        while (start > 0 && numTransitionsLeft >= 0) {
            start--;
            if (row.get(start) != last) {
                numTransitionsLeft--;
                last = !last;
            }
        }
        if (numTransitionsLeft < 0) {
            recordPattern(row, start + 1, counters);
            return;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    protected static float patternMatchVariance(int[] counters, int[] pattern, float maxIndividualVariance) {
        int numCounters = counters.length;
        int total = 0;
        int patternLength = 0;
        for (int i = 0; i < numCounters; i++) {
            total += counters[i];
            patternLength += pattern[i];
        }
        if (total < patternLength) {
            return Float.POSITIVE_INFINITY;
        }
        float unitBarWidth = ((float) total) / ((float) patternLength);
        float maxIndividualVariance2 = maxIndividualVariance * unitBarWidth;
        float totalVariance = 0.0f;
        for (int x = 0; x < numCounters; x++) {
            int counter = counters[x];
            float scaledPattern = ((float) pattern[x]) * unitBarWidth;
            float variance = ((float) counter) > scaledPattern ? ((float) counter) - scaledPattern : scaledPattern - ((float) counter);
            if (variance > maxIndividualVariance2) {
                return Float.POSITIVE_INFINITY;
            }
            totalVariance += variance;
        }
        return totalVariance / ((float) total);
    }
}

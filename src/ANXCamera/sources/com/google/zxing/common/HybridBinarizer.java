package com.google.zxing.common;

import com.google.zxing.Binarizer;
import com.google.zxing.LuminanceSource;
import com.google.zxing.NotFoundException;
import java.lang.reflect.Array;

public final class HybridBinarizer extends GlobalHistogramBinarizer {
    private static final int BLOCK_SIZE = 8;
    private static final int BLOCK_SIZE_MASK = 7;
    private static final int BLOCK_SIZE_POWER = 3;
    private static final int MINIMUM_DIMENSION = 40;
    private static final int MIN_DYNAMIC_RANGE = 24;
    private BitMatrix matrix;

    public HybridBinarizer(LuminanceSource source) {
        super(source);
    }

    public BitMatrix getBlackMatrix() throws NotFoundException {
        if (this.matrix != null) {
            return this.matrix;
        }
        LuminanceSource source = getLuminanceSource();
        int width = source.getWidth();
        int height = source.getHeight();
        if (width < 40 || height < 40) {
            this.matrix = super.getBlackMatrix();
        } else {
            byte[] luminances = source.getMatrix();
            int subWidth = width >> 3;
            if ((width & 7) != 0) {
                subWidth++;
            }
            int subWidth2 = subWidth;
            int subHeight = height >> 3;
            if ((height & 7) != 0) {
                subHeight++;
            }
            int subHeight2 = subHeight;
            int[][] blackPoints = calculateBlackPoints(luminances, subWidth2, subHeight2, width, height);
            BitMatrix newMatrix = new BitMatrix(width, height);
            calculateThresholdForBlock(luminances, subWidth2, subHeight2, width, height, blackPoints, newMatrix);
            this.matrix = newMatrix;
        }
        return this.matrix;
    }

    public Binarizer createBinarizer(LuminanceSource source) {
        return new HybridBinarizer(source);
    }

    private static void calculateThresholdForBlock(byte[] luminances, int subWidth, int subHeight, int width, int height, int[][] blackPoints, BitMatrix matrix2) {
        int i = subWidth;
        int i2 = subHeight;
        for (int y = 0; y < i2; y++) {
            int yoffset = y << 3;
            int maxYOffset = height - 8;
            if (yoffset > maxYOffset) {
                yoffset = maxYOffset;
            }
            for (int x = 0; x < i; x++) {
                int xoffset = x << 3;
                int maxXOffset = width - 8;
                if (xoffset > maxXOffset) {
                    xoffset = maxXOffset;
                }
                int xoffset2 = xoffset;
                int left = cap(x, 2, i - 3);
                int top = cap(y, 2, i2 - 3);
                int sum = 0;
                for (int z = -2; z <= 2; z++) {
                    int[] blackRow = blackPoints[top + z];
                    sum += blackRow[left - 2] + blackRow[left - 1] + blackRow[left] + blackRow[left + 1] + blackRow[left + 2];
                }
                thresholdBlock(luminances, xoffset2, yoffset, sum / 25, width, matrix2);
            }
        }
    }

    private static int cap(int value, int min, int max) {
        if (value < min) {
            return min;
        }
        return value > max ? max : value;
    }

    private static void thresholdBlock(byte[] luminances, int xoffset, int yoffset, int threshold, int stride, BitMatrix matrix2) {
        int y = 0;
        int offset = (yoffset * stride) + xoffset;
        while (y < 8) {
            for (int x = 0; x < 8; x++) {
                if ((luminances[offset + x] & -1) <= threshold) {
                    matrix2.set(xoffset + x, yoffset + y);
                }
            }
            y++;
            offset += stride;
        }
    }

    private static int[][] calculateBlackPoints(byte[] luminances, int subWidth, int subHeight, int width, int height) {
        int average;
        int sum;
        int offset;
        int i = subWidth;
        int i2 = subHeight;
        int[][] blackPoints = (int[][]) Array.newInstance(int.class, new int[]{i2, i});
        for (int y = 0; y < i2; y++) {
            int yoffset = y << 3;
            int maxYOffset = height - 8;
            if (yoffset > maxYOffset) {
                yoffset = maxYOffset;
            }
            int x = 0;
            while (x < i) {
                int xoffset = x << 3;
                int maxXOffset = width - 8;
                if (xoffset > maxXOffset) {
                    xoffset = maxXOffset;
                }
                int offset2 = 0;
                int min = 255;
                int max = 0;
                int yy = 0;
                int offset3 = (yoffset * width) + xoffset;
                while (true) {
                    int i3 = 8;
                    if (yy >= 8) {
                        break;
                    }
                    int sum2 = offset2;
                    int xx = 0;
                    while (xx < i3) {
                        int i4 = i3;
                        int pixel = luminances[offset3 + xx] & 255;
                        sum2 += pixel;
                        if (pixel < min) {
                            min = pixel;
                        }
                        if (pixel > max) {
                            max = pixel;
                        }
                        xx++;
                        i3 = i4;
                        int i5 = subHeight;
                    }
                    if (max - min > 24) {
                        int yy2 = yy + 1;
                        offset = offset3 + width;
                        while (true) {
                            if (yy2 >= 8) {
                                break;
                            }
                            int xx2 = 0;
                            for (int yy3 = 8; xx2 < yy3; yy3 = 8) {
                                sum2 += luminances[offset + xx2] & -1;
                                xx2++;
                            }
                            yy2++;
                            offset += width;
                            int i6 = subHeight;
                        }
                        yy = yy2;
                    } else {
                        offset = offset3;
                    }
                    yy++;
                    offset3 = offset + width;
                    offset2 = sum;
                    int i7 = subWidth;
                    i2 = subHeight;
                }
                int average2 = offset2 >> 6;
                if (max - min <= 24) {
                    average = min / 2;
                    if (y > 0 && x > 0) {
                        int averageNeighborBlackPoint = ((blackPoints[y - 1][x] + (2 * blackPoints[y][x - 1])) + blackPoints[y - 1][x - 1]) / 4;
                        if (min < averageNeighborBlackPoint) {
                            average = averageNeighborBlackPoint;
                        }
                    }
                } else {
                    average = average2;
                }
                blackPoints[y][x] = average;
                x++;
                i = subWidth;
            }
        }
        return blackPoints;
    }
}

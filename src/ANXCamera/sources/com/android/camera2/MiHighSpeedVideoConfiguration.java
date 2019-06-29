package com.android.camera2;

import android.util.Range;
import android.util.Size;
import java.util.ArrayList;
import java.util.List;

public class MiHighSpeedVideoConfiguration {
    private static final int FIELD_COUNT = 5;
    private static final int HIGH_SPEED_MAX_MINIMAL_FPS = 120;
    private final int mBatchSizeMax;
    private final int mFpsMax;
    private final int mFpsMin;
    private final Range<Integer> mFpsRange;
    private final int mHeight;
    private final Size mSize;
    private final int mWidth;

    private MiHighSpeedVideoConfiguration(int i, int i2, int i3, int i4, int i5) {
        if (i4 >= 120) {
            this.mFpsMax = i4;
            this.mWidth = checkArgumentPositive(i, "width must be positive");
            this.mHeight = checkArgumentPositive(i2, "height must be positive");
            this.mFpsMin = checkArgumentPositive(i3, "fpsMin must be positive");
            this.mSize = new Size(this.mWidth, this.mHeight);
            this.mBatchSizeMax = checkArgumentPositive(i5, "batchSizeMax must be positive");
            this.mFpsRange = new Range<>(Integer.valueOf(this.mFpsMin), Integer.valueOf(this.mFpsMax));
            return;
        }
        throw new IllegalArgumentException("fpsMax must be at least 120");
    }

    private static int checkArgumentPositive(int i, String str) {
        if (i > 0) {
            return i;
        }
        throw new IllegalArgumentException(str);
    }

    public static List<MiHighSpeedVideoConfiguration> unmarshal(int[] iArr, int i) {
        if (iArr == null || iArr.length == 0) {
            throw new IllegalArgumentException("empty buffer");
        } else if (iArr.length >= 5 * i) {
            ArrayList arrayList = new ArrayList(i);
            int i2 = 0;
            int i3 = 0;
            while (i2 < i) {
                int i4 = i3 + 1;
                int i5 = iArr[i3];
                int i6 = i4 + 1;
                int i7 = iArr[i4];
                int i8 = i6 + 1;
                int i9 = iArr[i6];
                int i10 = i8 + 1;
                int i11 = iArr[i8];
                int i12 = i10 + 1;
                MiHighSpeedVideoConfiguration miHighSpeedVideoConfiguration = new MiHighSpeedVideoConfiguration(i5, i7, i9, i11, iArr[i10]);
                arrayList.add(miHighSpeedVideoConfiguration);
                i2++;
                i3 = i12;
            }
            return arrayList;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("invalid buffer length ");
            sb.append(iArr.length);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public int getBatchSizeMax() {
        return this.mBatchSizeMax;
    }

    public int getFpsMax() {
        return this.mFpsMax;
    }

    public int getFpsMin() {
        return this.mFpsMin;
    }

    public Range<Integer> getFpsRange() {
        return this.mFpsRange;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public Size getSize() {
        return this.mSize;
    }

    public int getWidth() {
        return this.mWidth;
    }
}

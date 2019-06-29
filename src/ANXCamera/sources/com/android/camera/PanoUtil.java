package com.android.camera;

import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import com.android.camera.panorama.NativeMemoryAllocator;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PanoUtil {
    public static double calculateDifferenceBetweenAngles(double d, double d2) {
        double d3 = (d2 - d) % 360.0d;
        if (d3 < 0.0d) {
            d3 += 360.0d;
        }
        double d4 = (d - d2) % 360.0d;
        if (d4 < 0.0d) {
            d4 += 360.0d;
        }
        return Math.min(d3, d4);
    }

    public static ByteBuffer createByteBuffer(byte[] bArr) {
        ByteBuffer allocateBuffer = NativeMemoryAllocator.allocateBuffer(bArr.length);
        allocateBuffer.order(ByteOrder.nativeOrder());
        allocateBuffer.position(0);
        allocateBuffer.put(bArr);
        allocateBuffer.position(0);
        return allocateBuffer;
    }

    public static String createName(String str, long j) {
        return new SimpleDateFormat(str).format(new Date(j));
    }

    public static void decodeYUV420SPQuarterRes(int[] iArr, byte[] bArr, int i, int i2) {
        int i3 = i;
        int i4 = i2;
        int i5 = i3 * i4;
        int i6 = 0;
        int i7 = 0;
        while (i6 < i4) {
            int i8 = ((i6 >> 1) * i3) + i5;
            int i9 = 0;
            int i10 = 0;
            int i11 = i7;
            int i12 = 0;
            while (i12 < i3) {
                int i13 = (bArr[(i6 * i3) + i12] & 255) - 16;
                if (i13 < 0) {
                    i13 = 0;
                }
                if ((i12 & 1) == 0) {
                    int i14 = i8 + 1;
                    int i15 = i14 + 1;
                    int i16 = (bArr[i14] & 255) - 128;
                    i9 = (bArr[i8] & 255) - 128;
                    i8 = i15 + 2;
                    i10 = i16;
                }
                int i17 = 1192 * i13;
                int i18 = (1634 * i9) + i17;
                int i19 = (i17 - (833 * i9)) - (MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME * i10);
                int i20 = i17 + (2066 * i10);
                if (i18 < 0) {
                    i18 = 0;
                } else if (i18 > 262143) {
                    i18 = 262143;
                }
                if (i19 < 0) {
                    i19 = 0;
                } else if (i19 > 262143) {
                    i19 = 262143;
                }
                if (i20 < 0) {
                    i20 = 0;
                } else if (i20 > 262143) {
                    i20 = 262143;
                }
                iArr[i11] = ((i18 << 6) & 16711680) | ViewCompat.MEASURED_STATE_MASK | ((i19 >> 2) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | (255 & (i20 >> 10));
                i12 += 4;
                i11++;
            }
            i6 += 4;
            i7 = i11;
        }
    }
}

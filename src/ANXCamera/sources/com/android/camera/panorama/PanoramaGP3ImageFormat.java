package com.android.camera.panorama;

import android.media.Image;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.nio.ByteBuffer;

public class PanoramaGP3ImageFormat {
    public static final String YUV420_PLANAR = "YUV420_PLANAR";
    public static final String YUV420_SEMIPLANAR = "YUV420_SEMIPLANAR";
    public static final String YVU420_SEMIPLANAR = "YVU420_SEMIPLANAR";

    private static long getByteBufferAddress(ByteBuffer byteBuffer) {
        try {
            Field declaredField = Buffer.class.getDeclaredField("effectiveDirectAddress");
            declaredField.setAccessible(true);
            return declaredField.getLong(byteBuffer);
        } catch (IllegalAccessException | NoSuchFieldException e) {
            return NativeMemoryAllocator.getAddress(byteBuffer);
        }
    }

    private static String getImageFormat(long j, long j2) {
        return j > j2 ? YVU420_SEMIPLANAR : YUV420_SEMIPLANAR;
    }

    public static String getImageFormat(Image image) {
        if (image.getPlanes()[1].getPixelStride() == 1) {
            return YUV420_PLANAR;
        }
        return getImageFormat(getByteBufferAddress(image.getPlanes()[1].getBuffer()), getByteBufferAddress(image.getPlanes()[2].getBuffer()));
    }
}

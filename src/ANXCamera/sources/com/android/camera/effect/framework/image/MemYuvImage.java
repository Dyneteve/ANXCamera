package com.android.camera.effect.framework.image;

import android.media.Image;
import android.media.Image.Plane;
import com.android.camera.effect.ShaderNativeUtil;
import java.nio.ByteBuffer;

public class MemYuvImage {
    public int mChannels;
    public int mHeight;
    public int mWidth;

    public void parseImage(Image image) {
        int width = image.getWidth();
        int height = image.getHeight();
        image.getFormat();
        Plane[] planes = image.getPlanes();
        int pixelStride = planes[0].getPixelStride();
        int rowStride = planes[0].getRowStride();
        ByteBuffer buffer = planes[0].getBuffer();
        int pixelStride2 = planes[1].getPixelStride();
        int rowStride2 = planes[1].getRowStride();
        ByteBuffer buffer2 = planes[1].getBuffer();
        planes[2].getPixelStride();
        planes[2].getRowStride();
        ShaderNativeUtil.parseYUVImage(width, height, buffer, buffer2, planes[2].getBuffer(), rowStride, rowStride2, pixelStride, pixelStride2);
    }
}

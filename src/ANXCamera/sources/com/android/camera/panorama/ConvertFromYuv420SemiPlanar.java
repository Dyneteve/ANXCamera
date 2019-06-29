package com.android.camera.panorama;

import android.media.Image;
import java.nio.ByteBuffer;

public class ConvertFromYuv420SemiPlanar implements IImage2BytesConverter {
    private static final int PIXEL_STRIDE = 2;

    public byte[] image2bytes(Image image) {
        int i;
        int width = image.getWidth();
        int height = image.getHeight();
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[1].getBuffer();
        ByteBuffer buffer3 = image.getPlanes()[2].getBuffer();
        int rowStride = image.getPlanes()[0].getRowStride();
        int rowStride2 = image.getPlanes()[1].getRowStride();
        int i2 = width * height;
        byte[] bArr = new byte[((i2 * 3) / 2)];
        if (width < rowStride) {
            for (int i3 = 0; i3 < height; i3++) {
                buffer.position(i3 * rowStride);
                buffer.get(bArr, i3 * width, width);
            }
        } else {
            buffer.get(bArr, 0, i2);
        }
        if (width < rowStride2) {
            for (int i4 = 0; i4 < (height / 2) - 1; i4++) {
                buffer2.position(i4 * rowStride2);
                buffer2.get(bArr, i2, width);
                i2 += width;
            }
            int i5 = width - 1;
            buffer2.get(bArr, i2, i5);
            i = i2 + i5;
        } else {
            int remaining = buffer2.remaining();
            buffer2.get(bArr, i2, remaining);
            i = i2 + remaining;
        }
        buffer3.position(buffer3.remaining() - 1);
        buffer3.get(bArr, i, 1);
        buffer.clear();
        buffer2.clear();
        buffer3.clear();
        return bArr;
    }
}

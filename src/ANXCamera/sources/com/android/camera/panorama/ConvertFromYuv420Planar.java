package com.android.camera.panorama;

import android.media.Image;
import java.nio.ByteBuffer;

public class ConvertFromYuv420Planar implements IImage2BytesConverter {
    public byte[] image2bytes(Image image) {
        int width = image.getWidth();
        int height = image.getHeight();
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[1].getBuffer();
        ByteBuffer buffer3 = image.getPlanes()[2].getBuffer();
        int rowStride = image.getPlanes()[0].getRowStride();
        int rowStride2 = image.getPlanes()[1].getRowStride();
        int rowStride3 = image.getPlanes()[2].getRowStride();
        int remaining = buffer.remaining();
        int i = width * height;
        byte[] bArr = new byte[((i * 3) / 2)];
        if (width < rowStride) {
            for (int i2 = 0; i2 < height; i2++) {
                buffer.position(i2 * rowStride);
                buffer.get(bArr, i2 * width, width);
            }
        } else {
            buffer.get(bArr, 0, remaining);
        }
        int i3 = width / 2;
        for (int i4 = 0; i4 < height / 2; i4++) {
            if (i3 < rowStride2) {
                buffer2.position(i4 * rowStride2);
            }
            if (i3 < rowStride3) {
                buffer3.position(i4 * rowStride3);
            }
            for (int i5 = 0; i5 < i3; i5++) {
                bArr[i] = buffer2.get();
                bArr[i + 1] = buffer3.get();
                i += 2;
            }
        }
        buffer.clear();
        buffer2.clear();
        buffer3.clear();
        return bArr;
    }
}

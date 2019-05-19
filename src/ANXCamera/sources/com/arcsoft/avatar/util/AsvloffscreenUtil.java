package com.arcsoft.avatar.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.Image;
import android.media.Image.Plane;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class AsvloffscreenUtil {
    static String a = AsvloffscreenUtil.class.getSimpleName();

    public static ASVLOFFSCREEN buildNV21(Image image) {
        if (image == null) {
            return null;
        }
        int width = image.getWidth();
        int height = image.getHeight();
        Plane[] planes = image.getPlanes();
        if (planes.length < 3) {
            return null;
        }
        Plane plane = planes[0];
        Plane plane2 = planes[1];
        Plane plane3 = planes[2];
        int rowStride = plane.getRowStride();
        int height2 = image.getHeight();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        int i = rowStride * height2;
        byte[] bArr = new byte[i];
        byte[] bArr2 = new byte[(i >> 1)];
        buffer.get(bArr, 0, buffer.remaining());
        buffer2.get(bArr2, 0, buffer2.remaining());
        int[] iArr = new int[planes.length];
        for (int i2 = 0; i2 < planes.length; i2++) {
            iArr[i2] = planes[i2].getRowStride();
        }
        ASVLOFFSCREEN asvloffscreen = new ASVLOFFSCREEN(bArr, bArr2, iArr, width, height);
        return asvloffscreen;
    }

    public static ASVLOFFSCREEN buildNV21(@NonNull byte[] bArr) {
        return null;
    }

    public static ASVLOFFSCREEN buildNV21SingleBuffer(Image image) {
        if (image == null) {
            return null;
        }
        int width = image.getWidth();
        int height = image.getHeight();
        Plane[] planes = image.getPlanes();
        if (planes.length < 3) {
            return null;
        }
        Plane plane = planes[0];
        Plane plane2 = planes[1];
        Plane plane3 = planes[2];
        int rowStride = plane.getRowStride();
        int height2 = image.getHeight();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        int i = rowStride * height2;
        byte[] bArr = new byte[((i * 3) >> 1)];
        buffer.get(bArr, 0, buffer.remaining());
        buffer2.get(bArr, i, buffer2.remaining());
        int[] iArr = new int[planes.length];
        for (int i2 = 0; i2 < planes.length; i2++) {
            iArr[i2] = planes[i2].getRowStride();
        }
        return new ASVLOFFSCREEN(bArr, iArr[0], width, height);
    }

    public static ASVLOFFSCREEN buildRGBA(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled() || !bitmap.hasAlpha()) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        ByteBuffer order = ByteBuffer.allocate(bitmap.getRowBytes() * bitmap.getHeight()).order(ByteOrder.nativeOrder());
        bitmap.copyPixelsToBuffer(order);
        return new ASVLOFFSCREEN(width, height, order.array());
    }

    public static int compressToJpg(ASVLOFFSCREEN asvloffscreen, File file) {
        if (asvloffscreen == null || asvloffscreen.getRGBA8888() == null || file == null) {
            return 2;
        }
        ByteBuffer wrap = ByteBuffer.wrap(asvloffscreen.getRGBA8888());
        Bitmap createBitmap = Bitmap.createBitmap(asvloffscreen.getWidth(), asvloffscreen.getHeight(), Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(wrap);
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                createBitmap.compress(CompressFormat.JPEG, 90, fileOutputStream2);
                try {
                    fileOutputStream2.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return 0;
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                    try {
                        fileOutputStream.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                    return 2;
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                try {
                    fileOutputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                throw th;
            }
        } catch (IOException e5) {
            e = e5;
            e.printStackTrace();
            fileOutputStream.close();
            return 2;
        }
    }
}

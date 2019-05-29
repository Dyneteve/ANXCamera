package com.android.camera.effect;

import com.android.camera.log.Log;
import java.nio.Buffer;

public class ShaderNativeUtil {
    private static final String TAG = "ShaderNativeUtil";

    static {
        try {
            System.loadLibrary("CameraEffectJNI");
        } catch (Throwable th) {
            Log.e(TAG, "ShaderNativeUtil load CameraEffectJNI.so failed.", th);
        }
    }

    private static native byte[] compressJpeg(int i, int i2, int i3);

    public static byte[] compressPicture(int i, int i2, int i3) {
        return compressJpeg(i, i2, i3);
    }

    private static native int[] decompressJpeg(byte[] bArr, int i);

    public static int[] decompressPicture(byte[] bArr, int i) {
        return decompressJpeg(bArr, i);
    }

    public static native void genWaterMarkRange(int i, int i2, int i3, int i4, int i5);

    public static native void getCenterSquareImage(int i, int i2);

    public static native int getGraphicBufferFboTexId();

    public static native byte[] getJpegFromMemImage(int i, int i2, int i3, int i4, int i5);

    private static native byte[] getJpegPicture(int i, int i2, int i3, int i4, int i5);

    public static byte[] getPicture(int i, int i2, int i3) {
        return getJpegPicture(0, 0, i, i2, i3);
    }

    public static byte[] getPicture(int i, int i2, int i3, int i4, int i5) {
        return getJpegPicture(i, i2, i3, i4, i5);
    }

    public static native byte[] getWaterMarkRange(int i, int i2);

    private static native int[] initJpegTexture(byte[] bArr, int i, int i2);

    public static int[] initTexture(byte[] bArr, int i) {
        return initJpegTexture(bArr, i, 1);
    }

    public static int[] initTexture(byte[] bArr, int i, int i2) {
        return initJpegTexture(bArr, i, i2);
    }

    public static native void mergeWaterMarkRange(int i, int i2, int i3, int i4, int i5, int i6, int i7);

    public static native void mergeYUV(int i, int i2, int i3, int i4);

    public static native void parseYUVImage(int i, int i2, Buffer buffer, Buffer buffer2, Buffer buffer3, int i3, int i4, int i5, int i6);

    public static native void readGraphicBuffer(int i, int i2, int i3);

    public static native void readPixelsAndMerge(int i, int i2, int i3);

    public static native void readPixelsPboPlainMerge(int i, int i2, int i3);

    public static native void releaseGraphicBuffer();

    public static native int resizeGraphicBuffer(int i, int i2);

    public static native int setupGraphicBuffer(int i, int i2);

    public static native int setupGraphicBufferWithChannels(int i, int i2, int i3);

    public static native void texChannelUV(int i, int i2, int i3);

    public static native void texChannelY(int i, int i2, int i3);

    public static native void updateTextureWidthStride(int i, int i2, int i3, int i4, int i5);
}

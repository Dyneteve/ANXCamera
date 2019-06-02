package com.miui.extravideo.common;

public class MediaColorConvertUtils {
    public static void convertDecodeColorToEncode(byte[] bArr, byte[] bArr2, MediaParamsHolder mediaParamsHolder) {
        ColorConverterJNI.convertYuv420spToYvu420sp(mediaParamsHolder.videoWidth, mediaParamsHolder.videoHeight, bArr, bArr2, mediaParamsHolder.intervalPaddingSize, mediaParamsHolder.topPaddingSize, mediaParamsHolder.leftPaddingSize, mediaParamsHolder.stride, false);
    }

    public static void toggleYUV(byte[] bArr, int i, int i2) {
        for (int i3 = i * i2; i3 < bArr.length; i3 += 2) {
            byte b = bArr[i3];
            int i4 = i3 + 1;
            bArr[i3] = bArr[i4];
            bArr[i4] = b;
        }
    }
}

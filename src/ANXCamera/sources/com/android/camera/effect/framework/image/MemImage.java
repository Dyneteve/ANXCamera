package com.android.camera.effect.framework.image;

import com.android.camera.effect.ShaderNativeUtil;
import com.android.camera.effect.framework.utils.CounterUtil;

public class MemImage {
    public int mChannels;
    public int mHeight;
    public int mWidth;

    public MemImage() {
    }

    public MemImage(int i, int i2, int i3) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mChannels = i3;
    }

    public byte[] encodeJpeg(int i, int i2, int i3) {
        CounterUtil counterUtil = new CounterUtil();
        counterUtil.reset("jpeg compress");
        byte[] compressPicture = ShaderNativeUtil.compressPicture(i2, i3, i);
        counterUtil.tick("jpeg compress done");
        return compressPicture;
    }

    public void getPixelsFromJpg(byte[] bArr) {
        CounterUtil counterUtil = new CounterUtil();
        counterUtil.reset("jpeg decompress");
        int[] decompressPicture = ShaderNativeUtil.decompressPicture(bArr, 1);
        this.mWidth = decompressPicture[0];
        this.mHeight = decompressPicture[1];
        counterUtil.tick("jpeg decompress done");
        this.mChannels = 3;
    }

    public void readPixelsAndMerge(int i, int i2, int i3) {
        ShaderNativeUtil.readPixelsAndMerge(i, i2, i3);
    }

    public void release() {
    }

    public void textureWithStride(int i, int i2, int i3, int i4, int i5) {
        CounterUtil counterUtil = new CounterUtil();
        counterUtil.reset("uploadTexture");
        ShaderNativeUtil.updateTextureWidthStride(i, i2, i3, i4, i5);
        counterUtil.tick("uploadTexture done");
    }
}

package com.ss.android.ttve.audio;

import com.ss.android.vesdk.VEResult;

public class TEAudioWriter implements TEAudioWriterInterface {
    long mHandle = nativeCreate();

    public int addPCMData(byte[] bArr, int i) {
        return this.mHandle == 0 ? VEResult.TER_INVALID_HANDLER : nativeAddPCMData(this.mHandle, bArr, i);
    }

    public int closeWavFile() {
        return this.mHandle == 0 ? VEResult.TER_INVALID_HANDLER : nativeCloseWavFile(this.mHandle);
    }

    public void destroy() {
        if (this.mHandle != 0) {
            nativeDestroy(this.mHandle);
        }
    }

    public int initWavFile(String str, int i, int i2, double d, int i3, int i4) {
        if (this.mHandle == 0) {
            return VEResult.TER_INVALID_HANDLER;
        }
        return nativeInitWavFile(this.mHandle, str, i, i2, d);
    }

    public native int nativeAddPCMData(long j, byte[] bArr, int i);

    public native int nativeCloseWavFile(long j);

    public native long nativeCreate();

    public native void nativeDestroy(long j);

    public native int nativeInitWavFile(long j, String str, int i, int i2, double d);
}

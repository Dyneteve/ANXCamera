package com.arcsoft.supernight;

import android.graphics.Rect;
import com.arcsoft.supernight.SuperNightProcess.FaceInfo;
import com.arcsoft.supernight.SuperNightProcess.InputInfo;
import com.arcsoft.supernight.SuperNightProcess.RawInfo;

public class SuperNightJni {
    private SuperNightJni a;
    private long b = 0;

    static {
        System.loadLibrary("arcsoft_supernight_jni");
        System.loadLibrary("arcsoft_sn_mtk_apu");
        System.loadLibrary("arcsoft_super_night_raw_mtk");
        System.loadLibrary("arcsoft_super_night_raw_mpbase");
    }

    private native int nativeAddOneInputInfo(long j, RawInfo rawInfo, InputInfo inputInfo);

    private native long nativeInit(int i, int i2, int i3, int i4);

    private native int nativePostProcess(long j);

    private native int nativePreProcess(long j);

    private native int nativeProcess(long j, FaceInfo faceInfo, InputInfo inputInfo, int i, Rect rect);

    private native int nativeProcessEx(long j, FaceInfo faceInfo, byte[] bArr, int i, int i2, int i3, int i4, int i5, Rect rect);

    private native int nativeUninit(long j);

    public synchronized int AddOneInputInfo(RawInfo rawInfo, InputInfo inputInfo) {
        return nativeAddOneInputInfo(this.b, rawInfo, inputInfo);
    }

    public void init(int i, int i2, int i3, int i4) {
        this.b = nativeInit(i, i2, i3, i4);
    }

    public int postProcess() {
        return nativePostProcess(this.b);
    }

    public int preProcess() {
        return nativePreProcess(this.b);
    }

    public int process(FaceInfo faceInfo, InputInfo inputInfo, int i, Rect rect) {
        return nativeProcess(this.b, faceInfo, inputInfo, i, rect);
    }

    public int processEx(FaceInfo faceInfo, byte[] bArr, int i, int i2, int i3, int i4, int i5, Rect rect) {
        return nativeProcessEx(this.b, faceInfo, bArr, i, i2, i3, i4, i5, rect);
    }

    public int unInit() {
        return nativeUninit(this.b);
    }
}

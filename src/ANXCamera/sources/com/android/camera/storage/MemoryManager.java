package com.android.camera.storage;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage.StorageListener;
import com.mi.config.b;

public class MemoryManager implements StorageListener {
    private static final int DELAY_SECTION = 100;
    private static final float MAX_MEMORY_LIMIT_RATIO = 0.95f;
    public static final float MTK_SPEED_DOWN_RATIO = 0.66f;
    private static final long ONE_MB = 1048576;
    private static final float PHONE_SAVE_TASK_MEMORY_LIMIT_RATIO = 0.6f;
    private static final float SAVE_QUEUE_MEMORY_RATIO = 1.3f;
    private static final int SDCARD_SAVE_TASK_MEMORY_LIMIT = 62914560;
    private static final float SDCARD_SAVE_TASK_MEMORY_LIMIT_RATIO = 0.5f;
    private static final String TAG = "CameraMemoryManager";
    private long mMaxMemory;
    private int mMaxTotalMemory;
    private Runtime mRuntime = Runtime.getRuntime();
    private int mSaveTaskMemoryLimit;
    private int mSavedQueueMemoryLimit;
    private int mSaverMemoryUse;

    private long getBaseMemory() {
        int i = Util.sWindowWidth;
        if (i == 720) {
            return 20971520;
        }
        if (i == 1080) {
            return 41943040;
        }
        if (i != 1440) {
            return this.mRuntime.totalMemory() - this.mRuntime.freeMemory();
        }
        return 62914560;
    }

    private int getTotalUsedMemory() {
        long j = this.mRuntime.totalMemory();
        long freeMemory = this.mRuntime.freeMemory();
        long j2 = j - freeMemory;
        StringBuilder sb = new StringBuilder();
        sb.append("getLeftMemory: maxMemory=");
        sb.append(this.mMaxMemory);
        sb.append(", total=");
        sb.append(j);
        sb.append(", free=");
        sb.append(freeMemory);
        sb.append(", totalUsed=");
        sb.append(j2);
        log(sb.toString());
        return (int) j2;
    }

    private void initLimit() {
        long baseMemory = this.mMaxMemory - getBaseMemory();
        if (Storage.isUsePhoneStorage()) {
            this.mSaveTaskMemoryLimit = (int) (((float) baseMemory) * 0.6f);
        } else {
            this.mSaveTaskMemoryLimit = (int) (((float) baseMemory) * 0.5f);
            if (SDCARD_SAVE_TASK_MEMORY_LIMIT < this.mSaveTaskMemoryLimit) {
                this.mSaveTaskMemoryLimit = SDCARD_SAVE_TASK_MEMORY_LIMIT;
            }
        }
        this.mSavedQueueMemoryLimit = (int) (((float) this.mSaveTaskMemoryLimit) * SAVE_QUEUE_MEMORY_RATIO);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initLimit: mSavedQueueMemoryLimit = ");
        sb.append(this.mSavedQueueMemoryLimit);
        Log.d(str, sb.toString());
    }

    private boolean isReachedMemoryLimit() {
        StringBuilder sb = new StringBuilder();
        sb.append("isReachedMemoryLimit: usedMemory=");
        sb.append(this.mSaverMemoryUse);
        log(sb.toString());
        return this.mSaverMemoryUse >= this.mSaveTaskMemoryLimit;
    }

    private void log(String str) {
        if (Util.sIsDumpLog) {
            Log.v(TAG, str);
        }
    }

    public void addUsedMemory(int i) {
        this.mSaverMemoryUse += i;
    }

    public int getBurstDelay() {
        int i = 3;
        if (!isNeedSlowDown()) {
            i = 0;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 7) / 8) {
            i = 8;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 5) / 6) {
            i = 5;
        } else if (this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 4) / 5) {
            i = 4;
        } else if (this.mSaverMemoryUse < (this.mSaveTaskMemoryLimit * 3) / 4) {
            i = 1;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("getBurstDelay: delayMultiple=");
        sb.append(i);
        log(sb.toString());
        return i * 100;
    }

    public void initMemory() {
        this.mMaxMemory = this.mRuntime.maxMemory();
        this.mMaxTotalMemory = (int) (((float) this.mMaxMemory) * MAX_MEMORY_LIMIT_RATIO);
        this.mSaverMemoryUse = 0;
        initLimit();
        Storage.setStorageListener(this);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initMemory: maxMemory=");
        sb.append(this.mMaxMemory);
        Log.d(str, sb.toString());
    }

    public boolean isNeedSlowDown() {
        boolean z = false;
        if (!b.isMTKPlatform() ? this.mSaverMemoryUse >= this.mSaveTaskMemoryLimit / 2 : this.mSaverMemoryUse >= (this.mSaveTaskMemoryLimit * 3) / 4) {
            z = true;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("isNeedSlowDown: return ");
        sb.append(z);
        sb.append(" mSaverMemoryUse=");
        sb.append(this.mSaverMemoryUse);
        sb.append(" mSaveTaskMemoryLimit=");
        sb.append(this.mSaveTaskMemoryLimit);
        log(sb.toString());
        return z;
    }

    public boolean isNeedStopCapture() {
        if (!isReachedMemoryLimit() && this.mMaxTotalMemory > getTotalUsedMemory() && Storage.getLeftSpace() > ((long) this.mSaverMemoryUse)) {
            return false;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isNeedStopCapture: needStop=");
        sb.append(true);
        Log.d(str, sb.toString());
        return true;
    }

    public synchronized boolean isSaveQueueFull() {
        boolean z;
        z = this.mSaverMemoryUse >= this.mSavedQueueMemoryLimit;
        StringBuilder sb = new StringBuilder();
        sb.append("isSaveQueueFull = ");
        sb.append(z);
        sb.append(", usedMemory=");
        sb.append(this.mSaverMemoryUse);
        sb.append(", limit = ");
        sb.append(this.mSavedQueueMemoryLimit);
        log(sb.toString());
        return z;
    }

    public void onStoragePathChanged() {
        initMemory();
    }

    public void reduceUsedMemory(int i) {
        this.mSaverMemoryUse -= i;
    }
}

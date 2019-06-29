package com.xiaomi.camera.core;

import android.media.Image;
import com.android.camera.log.Log;
import java.util.HashMap;
import java.util.Map;

public class ImageMemoryManager {
    private static final String TAG = ImageMemoryManager.class.getSimpleName();
    private static final int TOTAL_MAX_MEMORY_USAGE = 1073741824;
    private static int mUsedMemory = 0;
    private Map<Image, Integer> mImagesMap = new HashMap();
    private int mMaxHoldImageNumber;
    private final Object mObjLock = new Object();

    public ImageMemoryManager(int i) {
        this.mMaxHoldImageNumber = i;
    }

    private int getImageUsedMemory(Image image) {
        int remaining = image.getPlanes()[0].getBuffer().remaining();
        int format = image.getFormat();
        if (format == 35) {
            return (int) (((double) remaining) * 1.5d);
        }
        if (format != 256) {
            return 0;
        }
        return remaining;
    }

    public static boolean isMemoryFull() {
        return mUsedMemory > TOTAL_MAX_MEMORY_USAGE;
    }

    public void holdAnImage(Image image) {
        synchronized (this.mObjLock) {
            this.mImagesMap.put(image, Integer.valueOf(getImageUsedMemory(image)));
            mUsedMemory += getImageUsedMemory(image);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("holdAnImage: ");
            sb.append(image);
            sb.append(", needCloseImageNum=");
            sb.append(this.mImagesMap.size());
            Log.d(str, sb.toString());
        }
    }

    public boolean needWaitImageClose() {
        boolean z;
        synchronized (this.mObjLock) {
            z = true;
            if (this.mImagesMap.size() < this.mMaxHoldImageNumber - 1) {
                z = false;
            }
        }
        return z;
    }

    public void releaseAnImage(Image image) {
        synchronized (this.mObjLock) {
            if (this.mImagesMap.containsKey(image)) {
                mUsedMemory -= ((Integer) this.mImagesMap.get(image)).intValue();
                this.mImagesMap.remove(image);
                this.mObjLock.notifyAll();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("releaseAnImage: ");
                sb.append(image);
                sb.append(", needCloseImageNum=");
                sb.append(this.mImagesMap.size());
                Log.d(str, sb.toString());
            } else {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("releaseAnImage: not hold image ");
                sb2.append(image);
                Log.d(str2, sb2.toString());
            }
        }
    }

    public void waitImageCloseIfNeeded() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("waitImageCloseIfNeeded: needCloseImageNum=");
        sb.append(this.mImagesMap.size());
        Log.d(str, sb.toString());
        synchronized (this.mObjLock) {
            while (this.mImagesMap.size() >= this.mMaxHoldImageNumber - 1) {
                try {
                    Log.d(TAG, "waitImageCloseIfNeeded: wait");
                    this.mObjLock.wait();
                } catch (InterruptedException e) {
                    Log.w(TAG, "waitImageCloseIfNeeded: failed!", e);
                }
            }
        }
    }
}

package com.xiaomi.camera.imagecodec;

import android.content.Context;

public interface Reprocessor {

    public static abstract class Singleton<T> {
        private T mInstance;

        /* access modifiers changed from: protected */
        public abstract T create();

        public final T get() {
            T t;
            synchronized (this) {
                if (this.mInstance == null) {
                    this.mInstance = create();
                }
                t = this.mInstance;
            }
            return t;
        }
    }

    void deInit();

    void init(Context context);

    void setJpegOutputSize(int i, int i2);

    void setVirtualCameraIds(String str, String str2);

    void submit(ReprocessData reprocessData);
}

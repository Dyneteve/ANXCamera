package com.android.camera.panorama;

import com.android.camera.log.Log;
import java.nio.ByteBuffer;

public class NativeMemoryAllocator {
    public static final String TAG = "NativeMemoryAllocator";

    static {
        try {
            System.loadLibrary("morpho_memory_allocator");
        } catch (UnsatisfiedLinkError e) {
            Log.w(TAG, "can't loadLibrary morpho_memory_allocator", e);
        }
    }

    public static native ByteBuffer allocateBuffer(int i);

    public static native void freeBuffer(ByteBuffer byteBuffer);

    public static native long getAddress(ByteBuffer byteBuffer);
}

package android.support.v4.os;

import android.os.Handler;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

public final class HandlerCompat {
    private HandlerCompat() {
    }

    public static boolean postDelayed(@NonNull Handler handler, @NonNull Runnable runnable, @Nullable Object obj, long j) {
        if (BuildCompat.isAtLeastP()) {
            return handler.postDelayed(runnable, obj, j);
        }
        Message obtain = Message.obtain(handler, runnable);
        obtain.obj = obj;
        return handler.sendMessageDelayed(obtain, j);
    }
}

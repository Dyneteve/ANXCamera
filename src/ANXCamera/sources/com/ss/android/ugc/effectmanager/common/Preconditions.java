package com.ss.android.ugc.effectmanager.common;

import android.os.Looper;

public final class Preconditions {
    private Preconditions() {
    }

    public static void checkUiThread() {
        Thread currentThread = Thread.currentThread();
        if (Looper.getMainLooper().getThread() != currentThread) {
            StringBuilder sb = new StringBuilder();
            sb.append("Method cannot be called off the main application thread (on: ");
            sb.append(currentThread.getName());
            sb.append(")");
            throw new IllegalStateException(sb.toString());
        }
    }
}

package com.bumptech.glide.request;

/* compiled from: Request */
public interface c {
    void begin();

    boolean c(c cVar);

    void clear();

    boolean dj();

    boolean isCancelled();

    boolean isComplete();

    boolean isFailed();

    boolean isPaused();

    boolean isRunning();

    void pause();

    void recycle();
}

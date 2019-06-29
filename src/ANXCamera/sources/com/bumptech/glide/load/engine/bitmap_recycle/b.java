package com.bumptech.glide.load.engine.bitmap_recycle;

/* compiled from: ArrayPool */
public interface b {

    /* renamed from: if reason: not valid java name */
    public static final int f1if = 65536;

    void O();

    <T> T a(int i, Class<T> cls);

    @Deprecated
    <T> void a(T t, Class<T> cls);

    <T> T b(int i, Class<T> cls);

    <T> void put(T t);

    void trimMemory(int i);
}

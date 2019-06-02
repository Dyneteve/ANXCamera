package com.arcsoft.avatar.recoder;

import com.arcsoft.avatar.gl.GLFramebuffer;

public class FrameItem {
    long a;
    public int mFrameIndex;
    public GLFramebuffer mFramebuffer;
    public volatile boolean mIsEmpty;
    public volatile boolean mIsInited;
}

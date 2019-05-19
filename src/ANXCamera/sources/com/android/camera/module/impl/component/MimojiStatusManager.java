package com.android.camera.module.impl.component;

import com.android.camera.fragment.mimoji.MimojiInfo;

public class MimojiStatusManager {
    public static int MIMOJI_CREATE = 4;
    public static int MIMOJI_EDIT_MID = 8;
    public static int MIMOJI_EIDT = 16;
    public static int MIMOJI_NONE = 0;
    public static int MIMOJI_PREVIEW = 2;
    public MimojiInfo mCurrentMimojiInfo;
    private volatile boolean mIsAvatarInited = false;
    private int mMode = MIMOJI_NONE;

    public boolean IsAvatarInited() {
        return this.mIsAvatarInited;
    }

    public boolean IsInMimojiCreate() {
        return this.mIsAvatarInited && this.mMode == MIMOJI_CREATE;
    }

    public boolean IsInMimojiEdit() {
        return this.mIsAvatarInited && this.mMode == MIMOJI_EIDT;
    }

    public boolean IsInMimojiEditMid() {
        return this.mIsAvatarInited && this.mMode == MIMOJI_EDIT_MID;
    }

    public boolean IsInMimojiPreview() {
        return this.mIsAvatarInited && this.mMode == MIMOJI_PREVIEW;
    }

    public boolean IsInPreviewSurface() {
        return this.mMode < MIMOJI_EDIT_MID;
    }

    public synchronized int getMode() {
        return this.mMode;
    }

    public synchronized void reset() {
        this.mIsAvatarInited = false;
        this.mMode = MIMOJI_NONE;
    }

    public synchronized void setAvatarInited(boolean z) {
        this.mIsAvatarInited = z;
    }

    public synchronized void setMode(int i) {
        this.mMode = i;
    }
}

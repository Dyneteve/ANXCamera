package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.android.camera.log.Log;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.util.AvatarConfigUtils;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public final class MimojiThumbnailRenderThread extends Thread {
    private static float[] BACKGROUND_COLOR = {0.0f, 0.0f, 0.0f, 0.0f};
    private static final int MSG_AVATAR_INIT = 32;
    private static final int MSG_DRAW_REQUESTED = 16;
    private static final int MSG_QUIT_REQUESTED = 64;
    private static final int MSG_RESET_DATA = 96;
    private static final int MSG_SET_CONFIG = 80;
    private static final int MSG_UPDATE_THUMB = 48;
    private static final String TAG = MimojiThumbnailRenderThread.class.getSimpleName();
    private AvatarEngine mAvatar;
    private ConfigInfoThumUtils mConfigInfoThumUtils;
    private Context mContext;
    private String mCurrentConfigPath;
    private EGLWrapper mEGLWrapper;
    private volatile boolean mEglContextPrepared = false;
    private RenderHandler mHandler;
    private final int mHeight;
    private volatile boolean mIsRendering = false;
    private final Object mLock = new Object();
    private volatile boolean mReady = false;
    private volatile int mRequestDraw;
    private volatile boolean mRequestRelease = false;
    private volatile boolean mStopRenderThumbnail = false;
    private Handler mUpdateHandler;
    private final int mWidth;

    public static class RenderHandler extends Handler {
        private final WeakReference<MimojiThumbnailRenderThread> mRenderThread;

        private RenderHandler(MimojiThumbnailRenderThread mimojiThumbnailRenderThread) {
            this.mRenderThread = new WeakReference<>(mimojiThumbnailRenderThread);
        }

        public void handleMessage(Message message) {
            MimojiThumbnailRenderThread mimojiThumbnailRenderThread = (MimojiThumbnailRenderThread) this.mRenderThread.get();
            if (mimojiThumbnailRenderThread != null) {
                int i = message.what;
                if (i == 16) {
                    mimojiThumbnailRenderThread.doDraw();
                } else if (i == 32) {
                    mimojiThumbnailRenderThread.doInit((String) message.obj);
                } else if (i == 48) {
                    mimojiThumbnailRenderThread.doUpdate();
                } else if (i == 64) {
                    mimojiThumbnailRenderThread.doQuit();
                } else if (i == 80) {
                    mimojiThumbnailRenderThread.doSetConfig((ASAvatarConfigInfo) message.obj);
                } else if (i == 96) {
                    mimojiThumbnailRenderThread.doReset();
                }
            }
        }
    }

    public MimojiThumbnailRenderThread(String str, int i, int i2, Context context) {
        super(str);
        this.mWidth = i;
        this.mHeight = i2;
        this.mContext = context;
    }

    /* access modifiers changed from: private */
    public void doDraw() {
        boolean z;
        if (!this.mRequestRelease && this.mEglContextPrepared) {
            synchronized (this.mLock) {
                z = this.mRequestDraw > 0;
                if (z) {
                    this.mRequestDraw--;
                }
            }
            if (z) {
                drawThumbnail();
            }
        }
    }

    /* access modifiers changed from: private */
    public void doInit(String str) {
        Log.d(TAG, "init avatar");
        if (this.mAvatar == null) {
            this.mAvatar = new AvatarEngine();
            this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL, AvatarEngineManager.PersonTemplatePath);
        }
        this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
        this.mAvatar.loadConfig(str);
        this.mCurrentConfigPath = str;
        this.mConfigInfoThumUtils = new ConfigInfoThumUtils();
    }

    /* access modifiers changed from: private */
    public void doQuit() {
        if (!this.mRequestRelease) {
            this.mRequestRelease = true;
            release();
            Looper.myLooper().quit();
        }
    }

    /* access modifiers changed from: private */
    public void doReset() {
        this.mStopRenderThumbnail = false;
        if (this.mAvatar != null) {
            this.mAvatar.loadConfig(this.mCurrentConfigPath);
            doDraw();
        }
    }

    /* access modifiers changed from: private */
    public void doSetConfig(ASAvatarConfigInfo aSAvatarConfigInfo) {
        if (this.mAvatar != null) {
            this.mAvatar.setConfig(aSAvatarConfigInfo);
        }
    }

    /* access modifiers changed from: private */
    public void doUpdate() {
        draw();
    }

    private void drawThumbnail() {
        this.mIsRendering = true;
        int selectType = AvatarEngineManager.getInstance().getSelectType();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("选中的Type:");
        sb.append(selectType);
        Log.i(str, sb.toString());
        ArrayList subConfigList = AvatarEngineManager.getInstance().getSubConfigList(this.mContext, selectType);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("数据:");
        sb2.append(subConfigList.size());
        Log.i(str2, sb2.toString());
        int i = 0;
        for (int i2 = 0; i2 < subConfigList.size(); i2++) {
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("数据:");
            sb3.append(((MimojiLevelBean) subConfigList.get(i2)).configTypeName);
            Log.i(str3, sb3.toString());
            ArrayList<ASAvatarConfigInfo> arrayList = ((MimojiLevelBean) subConfigList.get(i2)).thumnails;
            if (arrayList != null) {
                int i3 = i;
                for (int i4 = 0; i4 < arrayList.size(); i4++) {
                    ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) arrayList.get(i4);
                    if (AvatarEngineManager.getInstance().getInterruptIndex(selectType) > i3) {
                        String str4 = TAG;
                        StringBuilder sb4 = new StringBuilder();
                        sb4.append("continue index = ");
                        sb4.append(i3);
                        sb4.append(", getInterruptIndex = ");
                        sb4.append(AvatarEngineManager.getInstance().getInterruptIndex(selectType));
                        Log.d(str4, sb4.toString());
                        i3++;
                        Message obtainMessage = this.mUpdateHandler.obtainMessage();
                        obtainMessage.what = 5;
                        Bundle bundle = new Bundle();
                        bundle.putInt("OUTER", i2);
                        bundle.putInt("INNER", i4);
                        bundle.putInt("TYPE", selectType);
                        obtainMessage.obj = bundle;
                        if (this.mUpdateHandler != null) {
                            this.mUpdateHandler.sendMessage(obtainMessage);
                        }
                    } else {
                        i3++;
                        this.mAvatar.setConfig(aSAvatarConfigInfo);
                        this.mConfigInfoThumUtils.renderThumb(this.mAvatar, aSAvatarConfigInfo, AvatarEngineManager.getInstance().getASAvatarConfigValue().gender, BACKGROUND_COLOR);
                        Message obtainMessage2 = this.mUpdateHandler.obtainMessage();
                        if (this.mStopRenderThumbnail) {
                            this.mStopRenderThumbnail = false;
                            this.mIsRendering = false;
                            resetConfig(arrayList);
                            AvatarEngineManager.getInstance().setTypeNeedUpdate(selectType, true);
                            AvatarEngineManager.getInstance().setInterruptIndex(selectType, i3);
                            obtainMessage2.what = 6;
                            this.mUpdateHandler.sendMessage(obtainMessage2);
                            return;
                        }
                        obtainMessage2.what = 5;
                        Bundle bundle2 = new Bundle();
                        bundle2.putInt("OUTER", i2);
                        bundle2.putInt("INNER", i4);
                        bundle2.putInt("TYPE", selectType);
                        obtainMessage2.obj = bundle2;
                        if (this.mUpdateHandler != null) {
                            this.mUpdateHandler.sendMessage(obtainMessage2);
                        }
                    }
                }
                resetConfig(arrayList);
                i = i3;
            }
        }
        AvatarEngineManager.getInstance().setInterruptIndex(selectType, i);
        AvatarEngineManager.getInstance().setTypeNeedUpdate(selectType, false);
        this.mIsRendering = false;
    }

    private void prepare() {
        this.mEGLWrapper = new EGLWrapper(this.mWidth, this.mHeight);
        this.mEGLWrapper.makeCurrent();
    }

    private void release() {
        if (this.mEGLWrapper != null) {
            this.mEGLWrapper.release();
            this.mEGLWrapper = null;
        }
    }

    private void resetConfig(ArrayList<ASAvatarConfigInfo> arrayList) {
        int i = 0;
        int currentConfigIdWithType = AvatarConfigUtils.getCurrentConfigIdWithType(((ASAvatarConfigInfo) arrayList.get(0)).configType, AvatarEngineManager.getInstance().getASAvatarConfigValue());
        if (currentConfigIdWithType != -1) {
            i = currentConfigIdWithType;
        }
        ASAvatarConfigInfo aSAvatarConfigInfo = null;
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ASAvatarConfigInfo aSAvatarConfigInfo2 = (ASAvatarConfigInfo) it.next();
            if (aSAvatarConfigInfo2.configID == i) {
                aSAvatarConfigInfo = aSAvatarConfigInfo2;
                break;
            }
        }
        if (aSAvatarConfigInfo != null) {
            this.mAvatar.setConfig(aSAvatarConfigInfo);
        }
    }

    public void draw() {
        synchronized (this.mLock) {
            if (!this.mRequestRelease) {
                if (this.mEglContextPrepared) {
                    this.mRequestDraw++;
                    this.mHandler.obtainMessage(16).sendToTarget();
                }
            }
        }
    }

    public RenderHandler getHandler() {
        synchronized (this.mLock) {
            if (!this.mReady) {
                throw new IllegalStateException("render thread is not ready yet");
            }
        }
        return this.mHandler;
    }

    public boolean getIsRendering() {
        return this.mIsRendering;
    }

    public void initAvatar(String str) {
        Message obtainMessage = this.mHandler.obtainMessage();
        obtainMessage.what = 32;
        obtainMessage.obj = str;
        if (this.mHandler != null) {
            this.mHandler.sendMessage(obtainMessage);
        }
    }

    public void quit() {
        this.mHandler.obtainMessage(64).sendToTarget();
    }

    public void reset() {
        setStopRender(true);
        Message obtainMessage = this.mHandler.obtainMessage();
        obtainMessage.what = 96;
        if (this.mHandler != null) {
            this.mHandler.sendMessage(obtainMessage);
        }
    }

    public void run() {
        Looper.prepare();
        this.mHandler = new RenderHandler();
        Log.d(TAG, "prepare render thread: E");
        try {
            this.mEglContextPrepared = false;
            prepare();
            this.mEglContextPrepared = true;
        } catch (Exception e) {
            Log.d(TAG, "FATAL: failed to prepare render thread", e);
            release();
        }
        synchronized (this.mLock) {
            this.mReady = true;
            this.mLock.notify();
        }
        Looper.loop();
        synchronized (this.mLock) {
            this.mReady = false;
            this.mHandler = null;
        }
        Log.d(TAG, "prepare render thread: X");
    }

    public void setConfig(ASAvatarConfigInfo aSAvatarConfigInfo) {
        Message obtainMessage = this.mHandler.obtainMessage();
        obtainMessage.what = 80;
        obtainMessage.obj = aSAvatarConfigInfo;
        if (this.mHandler != null) {
            this.mHandler.sendMessage(obtainMessage);
        }
    }

    public void setStopRender(boolean z) {
        if (this.mIsRendering) {
            this.mStopRenderThumbnail = z;
        }
    }

    public void setUpdateHandler(Handler handler) {
        this.mUpdateHandler = handler;
    }

    public void waitUntilReady() {
        synchronized (this.mLock) {
            if (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("waitUntilReady() interrupted: ");
                    sb.append(e);
                    Log.e(str, sb.toString());
                }
            }
        }
    }
}

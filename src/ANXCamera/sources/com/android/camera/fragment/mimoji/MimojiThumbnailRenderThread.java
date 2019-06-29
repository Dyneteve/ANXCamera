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
    private static float[] BACKGROUND_COLOR = {0.1098f, 0.1176f, 0.1254f, 1.0f};
    private static final int MSG_AVATAR_INIT = 32;
    public static final int MSG_DRAW_REQUESTED = 16;
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
    private volatile boolean mRestStopRenderThumbnail = false;
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
                    mimojiThumbnailRenderThread.doDraw(((Boolean) message.obj).booleanValue());
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
    public void doDraw(boolean z) {
        boolean z2;
        if (!this.mRequestRelease && this.mEglContextPrepared) {
            synchronized (this.mLock) {
                z2 = this.mRequestDraw > 0;
                if (z2) {
                    this.mRequestDraw--;
                }
            }
            if (z2) {
                drawThumbnail(z);
            }
        }
    }

    /* access modifiers changed from: private */
    public void doInit(String str) {
        Log.d(TAG, "init avatar");
        if (this.mAvatar == null) {
            this.mAvatar = new AvatarEngine();
            this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL);
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
            draw(true);
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
        draw(false);
    }

    private void prepare() {
        this.mEGLWrapper = new EGLWrapper(this.mWidth, this.mHeight);
        this.mEGLWrapper.makeCurrent();
    }

    private void release() {
        if (this.mAvatar != null) {
            this.mAvatar.releaseRender();
            this.mAvatar.unInit();
            this.mAvatar.destroy();
            this.mAvatar = null;
        }
        if (this.mEGLWrapper != null) {
            this.mEGLWrapper.release();
            this.mEGLWrapper = null;
        }
    }

    private void resetConfig(ArrayList<ASAvatarConfigInfo> arrayList) {
        this.mConfigInfoThumUtils.reset(this.mAvatar, AvatarEngineManager.getInstance().getASAvatarConfigValue());
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

    public void draw(boolean z) {
        if (this.mHandler != null) {
            synchronized (this.mLock) {
                if (!this.mRequestRelease) {
                    if (this.mEglContextPrepared) {
                        this.mRequestDraw++;
                        Message obtainMessage = this.mHandler.obtainMessage();
                        obtainMessage.what = 16;
                        obtainMessage.obj = Boolean.valueOf(z);
                        this.mHandler.sendMessage(obtainMessage);
                    }
                }
            }
        }
    }

    public void drawThumbnail(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("fmoji  drawThumbnail reset :");
        sb.append(z);
        Log.i(str, sb.toString());
        if (this.mAvatar != null) {
            if (z) {
                this.mAvatar.loadConfig(this.mCurrentConfigPath);
                AvatarEngineManager.getInstance().resetData();
            }
            this.mIsRendering = true;
            int selectType = AvatarEngineManager.getInstance().getSelectType();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("select  Type : ");
            sb2.append(selectType);
            Log.i(str2, sb2.toString());
            ArrayList subConfigList = AvatarEngineManager.getInstance().getSubConfigList(this.mContext, selectType);
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("mimojiLevelBeans.size   :");
            sb3.append(subConfigList.size());
            Log.i(str3, sb3.toString());
            for (int i = 0; i < subConfigList.size(); i++) {
                MimojiLevelBean mimojiLevelBean = (MimojiLevelBean) subConfigList.get(i);
                if (mimojiLevelBean != null) {
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("tempMimojiLevelBeans configTypeName : ");
                    sb4.append(mimojiLevelBean.configTypeName);
                    Log.i(str4, sb4.toString());
                    ArrayList<ASAvatarConfigInfo> arrayList = mimojiLevelBean.thumnails;
                    if (arrayList == null) {
                        continue;
                    } else {
                        for (int i2 = 0; i2 < arrayList.size(); i2++) {
                            ASAvatarConfigInfo aSAvatarConfigInfo = (ASAvatarConfigInfo) arrayList.get(i2);
                            if (aSAvatarConfigInfo == null) {
                                String str5 = TAG;
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("asainfo is null   curIndex : ");
                                sb5.append(i2);
                                Log.i(str5, sb5.toString());
                            } else {
                                this.mAvatar.setConfig(aSAvatarConfigInfo);
                                this.mConfigInfoThumUtils.renderThumb(this.mAvatar, aSAvatarConfigInfo, AvatarEngineManager.getInstance().getASAvatarConfigValue().gender, BACKGROUND_COLOR);
                                Message obtainMessage = this.mUpdateHandler.obtainMessage();
                                if (this.mRestStopRenderThumbnail) {
                                    this.mStopRenderThumbnail = false;
                                    this.mRestStopRenderThumbnail = false;
                                    this.mIsRendering = false;
                                    AvatarEngineManager.getInstance().resetData();
                                    AvatarEngineManager.getInstance().setTypeNeedUpdate(selectType, false);
                                    resetConfig(arrayList);
                                    draw(true);
                                    return;
                                } else if (this.mStopRenderThumbnail) {
                                    this.mStopRenderThumbnail = false;
                                    this.mIsRendering = false;
                                    resetConfig(arrayList);
                                    AvatarEngineManager.getInstance().setTypeNeedUpdate(selectType, true);
                                    obtainMessage.what = 6;
                                    this.mUpdateHandler.sendMessage(obtainMessage);
                                    return;
                                } else {
                                    obtainMessage.what = 5;
                                    Bundle bundle = new Bundle();
                                    bundle.putInt("OUTER", i);
                                    bundle.putInt("INNER", i2);
                                    bundle.putInt("TYPE", selectType);
                                    obtainMessage.obj = bundle;
                                    if (this.mUpdateHandler != null) {
                                        this.mUpdateHandler.sendMessage(obtainMessage);
                                    }
                                }
                            }
                        }
                        resetConfig(arrayList);
                    }
                }
            }
            AvatarEngineManager.getInstance().setTypeNeedUpdate(selectType, false);
            this.mIsRendering = false;
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
        if (this.mHandler != null) {
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 32;
            obtainMessage.obj = str;
            this.mHandler.sendMessage(obtainMessage);
        }
    }

    public void quit() {
        if (this.mHandler != null) {
            this.mHandler.obtainMessage(64).sendToTarget();
        }
    }

    public void reset() {
        if (this.mHandler != null) {
            setStopRender(true);
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 96;
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
        if (this.mHandler != null) {
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 80;
            obtainMessage.obj = aSAvatarConfigInfo;
            this.mHandler.sendMessage(obtainMessage);
        }
    }

    public void setResetStopRender(boolean z) {
        if (this.mIsRendering) {
            this.mRestStopRenderThumbnail = z;
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

package com.arcsoft.avatar;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.support.annotation.NonNull;
import android.util.Log;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProcessInfo;
import com.arcsoft.avatar.gl.GLFramebuffer;
import com.arcsoft.avatar.gl.GLRenderEngine;
import com.arcsoft.avatar.gl.TextureHelper;
import com.arcsoft.avatar.recoder.MediaManager;
import com.arcsoft.avatar.recoder.RecordingListener;
import com.arcsoft.avatar.util.ASVLOFFSCREEN;
import com.arcsoft.avatar.util.LOG;
import com.arcsoft.avatar.util.d;
import com.ss.android.ttve.common.TEDefine;
import java.io.FileDescriptor;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class RecordModule {
    private static final String a = "RecordModule";
    private static final int b = 1;
    private static final int c = 512000;
    private boolean A;
    private int B = 270;
    private long C = 0;
    private final int D = 1000000;
    private long E = 0;
    private long F = 0;
    private AvatarEngine G;
    private MediaManager H;
    private volatile boolean I;
    private volatile boolean J;
    private boolean K;
    private RecordingListener L = null;
    private ASAvatarProcessInfo M = null;
    private MediaResultCallback N = null;
    private boolean O = false;
    private boolean[] P = new boolean[3];
    private int Q = 0;
    private Boolean R;
    private Bitmap S;
    private ASVLOFFSCREEN T;
    private volatile boolean U = true;
    private volatile boolean V = false;
    private Context d;
    private Lock e = new ReentrantLock();
    private Lock f = new ReentrantLock();
    private volatile boolean g = false;
    private volatile boolean h = false;
    private volatile boolean i = false;
    private volatile boolean j = false;
    private boolean k;
    private EGLDisplay l;
    private EGLContext m;
    private EGLSurface n;
    private int o;
    private int p;
    private int q;
    private int r;
    private int s;
    private int t;
    private Queue<ASVLOFFSCREEN> u;
    private GLRenderEngine v;
    private GLRenderEngine w;
    private GLFramebuffer x;
    private TextureHelper y;
    private boolean z;

    public interface MediaResultCallback {
        void onCaptureResult(ByteBuffer byteBuffer);

        void onVideoResult();
    }

    public RecordModule(Context context, MediaResultCallback mediaResultCallback) {
        this.d = context;
        this.N = mediaResultCallback;
    }

    private long a(long j2) {
        if (j2 <= 0) {
            return 0;
        }
        long j3 = j2 - 512000;
        if (j3 <= 0) {
            j3 = 1;
        }
        return j3;
    }

    private void a() {
        this.m = EGL14.eglGetCurrentContext();
    }

    private void a(int i2) {
        if (i2 <= 0) {
            String str = a;
            StringBuilder sb = new StringBuilder();
            sb.append("recordingIfNeed textureId = ");
            sb.append(i2);
            LOG.d(str, sb.toString());
            return;
        }
        if (!this.I && this.H != null && this.K) {
            LOG.d("video_test_log", "-- recordingIfNeed 1--");
            this.H.drawSurfaceWithTextureId(i2);
            b();
            LOG.d("video_test_log", "-- recordingIfNeed 2--");
        }
    }

    private void a(ASVLOFFSCREEN asvloffscreen) {
        StringBuilder sb = new StringBuilder();
        sb.append("putPreviewInQueue  mPreviewQueue.size() = ");
        sb.append(this.u.size());
        LOG.d("CKK", sb.toString());
        if (this.u.size() >= 1) {
            LOG.d("CKK", "mPreviewQueue.poll()");
            this.u.poll();
        }
        String str = "CKK";
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("mPreviewQueue.offer w = ");
            sb2.append(asvloffscreen.getWidth());
            sb2.append(" h = ");
            sb2.append(asvloffscreen.getHeight());
            sb2.append(" st = ");
            sb2.append(asvloffscreen.getRowStride());
            LOG.d(str, sb2.toString());
            this.u.offer(asvloffscreen);
        } catch (ClassCastException e2) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("putPreviewInQueue  error1 = ");
            sb3.append(e2.toString());
            LOG.d("Test_Arc", sb3.toString());
            e2.printStackTrace();
        } catch (NullPointerException e3) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append("putPreviewInQueue  error2 = ");
            sb4.append(e3.toString());
            LOG.d("Test_Arc", sb4.toString());
            e3.printStackTrace();
        } catch (IllegalArgumentException e4) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("putPreviewInQueue  error3 = ");
            sb5.append(e4.toString());
            LOG.d("Test_Arc", sb5.toString());
            e4.printStackTrace();
        }
    }

    private void a(boolean z2) {
        int i2 = 0;
        int i3 = z2 ? this.s : 0;
        if (z2) {
            i2 = this.t;
        }
        GLES20.glViewport(i3, i2, this.q, this.r);
    }

    private void b() {
        long muxerTimeElapsed = this.H.getMuxerTimeElapsed();
        long muxerSizeRecorded = this.H.getMuxerSizeRecorded();
        long a2 = a(this.C);
        long j2 = muxerTimeElapsed / 1000000;
        if (j2 > this.E) {
            this.E = j2;
            if (this.L != null) {
                this.L.onRecordingListener(258, Long.valueOf(muxerTimeElapsed));
                this.L.onRecordingListener(260, Long.valueOf(muxerSizeRecorded));
            }
        }
        if (this.F > 0 && muxerTimeElapsed > this.F) {
            StringBuilder sb = new StringBuilder();
            sb.append("mMaxRecordingDuration = ");
            sb.append(this.F);
            sb.append(" ,timeElapsed = ");
            sb.append(muxerTimeElapsed);
            LOG.d("video_test_log", sb.toString());
            LOG.d("video_test_log", "-- controlRecordingProcess1 stopRecording--");
            stopRecording();
            if (this.L != null) {
                this.L.onRecordingListener(257, Long.valueOf(muxerTimeElapsed));
            }
        }
        if (a2 > 0 && muxerSizeRecorded > a2) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("adjuestedMaxSizle = ");
            sb2.append(a2);
            sb2.append(" ,sizeFile = ");
            sb2.append(muxerSizeRecorded);
            LOG.d("video_test_log", sb2.toString());
            LOG.d("video_test_log", "-- controlRecordingProcess2 stopRecording--");
            stopRecording();
            if (this.L != null) {
                this.L.onRecordingListener(259, Long.valueOf(muxerSizeRecorded));
            }
        }
    }

    private void b(int i2) {
        if (this.J && i2 > 0) {
            LOG.d("video_test_log", "-- captureIfNeed 1--");
            ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.q * this.r * 4);
            allocateDirect.order(ByteOrder.nativeOrder());
            LOG.d("video_test_log", "-- captureIfNeed 2--");
            GLES20.glReadPixels(this.s, this.t, this.q, this.r, 6408, 5121, allocateDirect);
            this.J = false;
            LOG.d("video_test_log", "-- captureIfNeed 3--");
            if (this.N != null) {
                this.N.onCaptureResult(allocateDirect);
            }
        }
    }

    private boolean c() {
        if (this.M == null) {
            LOG.d("CheckOutLine", TEDefine.FACE_BEAUTY_NULL);
            this.O = true;
        } else if (this.M.shelterIsNull()) {
            LOG.d("CheckOutLine", "shelterFlags == null");
            this.O = true;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("faceCount = ");
            sb.append(this.M.getFaceCount());
            LOG.d("CheckOutLine", sb.toString());
            if (this.M.getFaceCount() <= 0) {
                this.O = true;
            } else {
                boolean checkFaceBlocking = this.M.checkFaceBlocking();
                if (this.Q > 2) {
                    this.Q = 0;
                }
                this.P[this.Q] = checkFaceBlocking;
                this.Q++;
                if (this.P[0] && this.P[1] && this.P[2]) {
                    this.O = true;
                } else if (!this.P[0] && !this.P[1] && !this.P[2]) {
                    this.O = false;
                }
            }
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("--- > mBlockingFaces <---");
        sb2.append(this.O);
        LOG.d("CheckOutLine", sb2.toString());
        return this.O;
    }

    public void capture() {
        try {
            this.e.lock();
            if (this.g) {
                this.e.unlock();
                this.J = true;
            }
        } finally {
            this.e.unlock();
        }
    }

    public void changeHumanTemplate(String str, String str2) {
        LOG.d("test_log_c", "-- changeHumanTemplate in--");
        StringBuilder sb = new StringBuilder();
        sb.append("-- templatePath = ");
        sb.append(str);
        LOG.d("test_log_c", sb.toString());
        StringBuilder sb2 = new StringBuilder();
        sb2.append("-- configPath = ");
        sb2.append(str2);
        LOG.d("test_log_c", sb2.toString());
        this.V = true;
        this.G.setTemplatePath(str);
        this.G.loadConfig(str2);
        this.V = false;
        LOG.d("test_log_c", "-- changeHumanTemplate out--");
    }

    public void init(int i2, int i3, int i4, AvatarEngine avatarEngine, boolean z2) {
        this.g = false;
        this.h = false;
        this.i = false;
        this.j = false;
        this.z = false;
        this.K = false;
        this.I = false;
        this.o = i3;
        this.p = i4;
        this.G = avatarEngine;
        this.u = new LinkedList();
        this.u.clear();
        this.A = z2;
        this.B = i2;
        this.k = false;
        this.l = EGL14.EGL_NO_DISPLAY;
        this.m = EGL14.EGL_NO_CONTEXT;
        this.n = EGL14.EGL_NO_SURFACE;
        this.M = new ASAvatarProcessInfo();
        this.g = true;
    }

    public void pause() {
        this.T = null;
    }

    public void pauseRecording() {
        try {
            this.e.lock();
            if (this.g) {
                this.e.unlock();
                if (this.H != null && this.K) {
                    this.I = true;
                    this.H.pauseRecording();
                }
            }
        } finally {
            this.e.unlock();
        }
    }

    public void reset() {
        this.U = true;
        LOG.d("video_test_log", "Record module reset");
    }

    public void resumeRecording() {
        try {
            this.e.lock();
            if (this.g) {
                this.e.unlock();
                if (this.H != null && this.K && this.I) {
                    this.H.resumeRecording();
                    this.I = false;
                }
            }
        } finally {
            this.e.unlock();
        }
    }

    public void setDrawScope(int i2, int i3, int i4, int i5) {
        this.s = i2;
        this.t = i3;
        this.q = i4;
        this.r = i5;
    }

    public void setMirror(boolean z2) {
        this.A = z2;
    }

    public void setPreviewSize(int i2, int i3) {
        this.o = i2;
        this.p = i3;
        this.U = true;
        LOG.d("video_test_log", "set mFaceBlocking = true");
    }

    public void setmImageOrientation(int i2) {
        this.B = i2;
    }

    public boolean startProcess(@NonNull ASVLOFFSCREEN asvloffscreen, int i2, boolean z2) {
        try {
            this.e.lock();
            if (!this.g) {
                LOG.d(a, "startProcess_1() failed, engine is not inited. ");
                return true;
            }
            this.e.unlock();
            if (asvloffscreen == null) {
                return true;
            }
            try {
                this.i = true;
                LOG.d(a, "lock -> process lock");
                this.f.lock();
                d.a("buildNV21SingleBuffer");
                this.T = asvloffscreen;
                d.a("performance", "buildNV21SingleBuffer");
                this.f.unlock();
                LOG.d(a, "lock -> process unlock");
                this.h = true;
                if (!z2) {
                    this.i = false;
                    return true;
                }
                d.a("avatarProcessWithInfo");
                this.G.avatarProcessWithInfoEx(asvloffscreen, 90, this.A, i2, this.M, false);
                d.a("performance", "avatarProcessWithInfo");
                this.U = c();
                this.i = false;
                return this.U;
            } catch (Exception e2) {
                try {
                    e2.printStackTrace();
                } catch (Throwable th) {
                    this.i = false;
                    throw th;
                }
            } catch (Throwable th2) {
                this.f.unlock();
                LOG.d(a, "lock -> process unlock");
                throw th2;
            }
        } finally {
            this.e.unlock();
        }
    }

    public boolean startProcess(@NonNull byte[] bArr, int i2, int i3, int i4, boolean z2) {
        try {
            this.e.lock();
            if (!this.g) {
                LOG.d(a, "startProcess_1() failed, engine is not inited. ");
                return true;
            }
            this.e.unlock();
            if (bArr == null || bArr.length <= 0 || i3 <= 0 || i4 <= 0) {
                return true;
            }
            try {
                this.i = true;
                LOG.d(a, "lock -> process lock");
                this.f.lock();
                this.T = new ASVLOFFSCREEN(bArr, i3, i3, i4);
                this.f.unlock();
                LOG.d(a, "lock -> process unlock");
                this.h = true;
                if (!z2) {
                    this.i = false;
                    return true;
                }
                d.a("avatarProcessWithInfo");
                this.G.avatarProcessWithInfo(bArr, i3, i4, i3, 90, this.A, i2, this.M);
                d.a("performance", "avatarProcessWithInfo");
                this.U = c();
                this.i = false;
                return this.U;
            } catch (Exception e2) {
                try {
                    e2.printStackTrace();
                } catch (Throwable th) {
                    this.i = false;
                    throw th;
                }
            } catch (Throwable th2) {
                this.f.unlock();
                LOG.d(a, "lock -> process unlock");
                throw th2;
            }
        } finally {
            this.e.unlock();
        }
    }

    public void startRecording(@NonNull FileDescriptor fileDescriptor, RecordingListener recordingListener, int i2, @NonNull int i3, @NonNull int i4, int i5, String str) {
        int i6 = i2;
        LOG.d("video_test_log", "-- startRecording 1--");
        try {
            this.e.lock();
            if (!this.g) {
                LOG.d(a, "startRecording-> StickerApi is not init.");
                return;
            }
            this.e.unlock();
            if (i3 != 0 && i4 != 0 && fileDescriptor != null) {
                if (this.H != null) {
                    throw new RuntimeException("Recording has been started already.");
                } else if (i6 == 0 || 90 == i6 || 180 == i6 || 270 == i6) {
                    RecordingListener recordingListener2 = recordingListener;
                    this.L = recordingListener2;
                    if (EGL14.EGL_NO_CONTEXT == this.m) {
                        a();
                    }
                    MediaManager mediaManager = new MediaManager(fileDescriptor, i3, i4, this.B, this.A, i6, recordingListener2);
                    this.H = mediaManager;
                    this.H.setEncoderCount(2);
                    this.H.initVideoEncoderWithSharedContext(this.m, i5, true, str);
                    this.H.initAudioEncoder();
                    this.H.startRecording();
                    this.K = true;
                    this.I = false;
                    LOG.d("video_test_log", "-- startRecording 2--");
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("StickerApi-> startRecording(...) screenOrientation = ");
                    sb.append(i6);
                    sb.append(" is invalid");
                    throw new RuntimeException(sb.toString());
                }
            }
        } finally {
            this.e.unlock();
        }
    }

    public void startRecording(@NonNull String str, RecordingListener recordingListener, int i2, @NonNull int i3, @NonNull int i4, int i5, String str2) {
        int i6 = i2;
        String str3 = a;
        StringBuilder sb = new StringBuilder();
        sb.append("save video path = ");
        String str4 = str;
        sb.append(str4);
        Log.d(str3, sb.toString());
        LOG.d("video_test_log", "-- startRecording 1--");
        try {
            this.e.lock();
            if (!this.g) {
                LOG.d(a, "startRecording-> StickerApi is not init.");
                return;
            }
            this.e.unlock();
            if (i3 != 0 && i4 != 0 && str4.length() != 0) {
                if (this.H != null) {
                    throw new RuntimeException("Recording has been started already.");
                } else if (i6 == 0 || 90 == i6 || 180 == i6 || 270 == i6) {
                    RecordingListener recordingListener2 = recordingListener;
                    this.L = recordingListener2;
                    if (EGL14.EGL_NO_CONTEXT == this.m) {
                        a();
                    }
                    MediaManager mediaManager = new MediaManager(str4, i3, i4, this.B, this.A, i6, recordingListener2);
                    this.H = mediaManager;
                    this.H.setEncoderCount(2);
                    this.H.initVideoEncoderWithSharedContext(this.m, i5, true, str2);
                    this.H.initAudioEncoder();
                    this.H.startRecording();
                    this.K = true;
                    this.I = false;
                    LOG.d("video_test_log", "-- startRecording 2--");
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("StickerApi-> startRecording(...) screenOrientation = ");
                    sb2.append(i6);
                    sb2.append(" is invalid");
                    throw new RuntimeException(sb2.toString());
                }
            }
        } finally {
            this.e.unlock();
        }
    }

    public void startRender(int i2, boolean z2) {
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00b9 A[Catch:{ all -> 0x00da, Exception -> 0x00f1 }] */
    public void startRender(int i2, boolean z2, int i3, int i4, boolean z3, int[] iArr, byte[] bArr, boolean z4) {
        int[] iArr2 = iArr;
        try {
            this.e.lock();
            if (!this.g || !this.h) {
                LOG.d(a, "startRender() failed, engine is not inited or startRender process not ready! ");
                this.e.unlock();
                return;
            }
            this.e.unlock();
            if (this.T == null) {
                LOG.d(a, "mBackgroundBuffer == null");
                return;
            }
            try {
                this.j = true;
                LOG.d(a, "lock -> startRender lock");
                d.a("render lock");
                this.f.lock();
                ASVLOFFSCREEN asvloffscreen = (ASVLOFFSCREEN) this.T.clone();
                this.f.unlock();
                d.a("times", "render lock");
                LOG.d(a, "lock -> startRender unlock");
                if (asvloffscreen != null && asvloffscreen.getHeight() > 0) {
                    if (asvloffscreen.getWidth() > 0) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("startRender mChangeTemplate  = ");
                        sb.append(this.V);
                        LOG.d("test_log_c", sb.toString());
                        if (z4 && !this.U) {
                            if (!this.V) {
                                d.a("renderWithBackground");
                                this.G.renderWithBackground(asvloffscreen, i2, z2, i3, asvloffscreen.getHeight(), asvloffscreen.getWidth(), i4, z3, iArr2, bArr);
                                d.a("times", "renderWithBackground");
                                if (iArr2 != null) {
                                    d.a("renderBackgroundWithTexture");
                                    this.G.renderBackgroundWithTexture(iArr2[0], 0, false);
                                    d.a("times", "renderBackgroundWithTexture");
                                    b(iArr2[0]);
                                    a(iArr2[0]);
                                }
                                this.j = false;
                                return;
                            }
                        }
                        this.G.renderBackgroundWithImageData(asvloffscreen, i2, z2, iArr2);
                        if (iArr2 != null) {
                        }
                        this.j = false;
                        return;
                    }
                }
                this.j = false;
            } catch (Exception e2) {
                String str = a;
                try {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("startRender meet error = ");
                    sb2.append(e2.getMessage());
                    LOG.d(str, sb2.toString());
                } catch (Throwable th) {
                    this.j = false;
                    throw th;
                }
            } catch (Throwable th2) {
                this.f.unlock();
                d.a("times", "render lock");
                LOG.d(a, "lock -> startRender unlock");
                throw th2;
            }
        } catch (Throwable th3) {
            this.e.unlock();
            throw th3;
        }
    }

    public void stopRecording() {
        LOG.d("video_test_log", "-- stopRecording 1--");
        try {
            this.e.lock();
            if (!this.g) {
                this.e.unlock();
                return;
            }
        } catch (Exception e2) {
        } catch (Throwable th) {
            this.e.unlock();
            throw th;
        }
        this.e.unlock();
        if (this.K) {
            LOG.d("video_test_log", "-- stopRecording 2--");
            if (this.H != null) {
                LOG.d("video_test_log", "-- stopRecording 3--");
                resumeRecording();
                LOG.d("video_test_log", "-- stopRecording 4--x");
                this.K = false;
                this.H.stopRecording();
                LOG.d("video_test_log", "-- stopRecording 5--");
                this.H = null;
                this.I = false;
                this.F = 0;
                this.E = 0;
                this.C = 0;
                if (this.N != null) {
                    this.N.onVideoResult();
                }
            }
            LOG.d("video_test_log", "-- stopRecording 6--");
        }
    }

    public void unInit() {
        LOG.d("video_test_log", "-- unInit 1--");
        stopRecording();
        LOG.d("video_test_log", "-- unInit 2--");
        try {
            this.e.lock();
            if (!this.g) {
                LOG.d(a, "uninit () failed, engine is not inited. ");
                this.e.unlock();
                return;
            }
            this.g = false;
            int i2 = 100;
            while (true) {
                if (!this.i && !this.j) {
                    break;
                }
                i2--;
                if (i2 <= 0) {
                    break;
                }
                Thread.sleep(1);
            }
            this.k = false;
            this.J = false;
            this.u.clear();
            this.u = null;
            if (this.S != null && !this.S.isRecycled()) {
                this.S.isRecycled();
                this.S = null;
            }
            if (this.y != null) {
                this.y.deleteTexture();
                this.y = null;
            }
            if (this.x != null) {
                this.x.unInit();
                this.x = null;
            }
            if (this.v != null) {
                this.v.unInit();
                this.v = null;
            }
            if (this.w != null) {
                this.w.unInit();
                this.w = null;
            }
            this.T = null;
            this.m = EGL14.EGL_NO_CONTEXT;
            this.n = EGL14.EGL_NO_SURFACE;
            this.l = EGL14.EGL_NO_DISPLAY;
            this.q = 0;
            this.r = 0;
            this.i = false;
            this.j = false;
            this.h = false;
            this.e.unlock();
            LOG.d("video_test_log", "-- unInit 3--");
        } catch (InterruptedException e2) {
            e2.printStackTrace();
        } catch (Throwable th) {
            this.e.unlock();
            throw th;
        }
    }
}

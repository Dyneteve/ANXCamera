package com.arcsoft.avatar.recoder;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.support.annotation.NonNull;
import com.arcsoft.avatar.gl.GLRender;
import com.arcsoft.avatar.util.CodecLog;
import com.arcsoft.avatar.util.NotifyMessage;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class MediaManager implements RecordingListener {
    public static final int MUXER_AUDIO_ENCODER = 1;
    public static final int MUXER_VIDEO_AND_AUDIO_ENCODER = 2;
    public static final int MUXER_VIDEO_ENCODER = 1;
    private static final String a = "Arc_VideoEncoder";
    private static final int r = 2;
    /* access modifiers changed from: private */
    public int b;
    /* access modifiers changed from: private */
    public int c;
    private int d;
    private boolean e;
    private boolean f;
    private String g;
    private BaseEncoder h;
    private BaseEncoder i;
    private MuxerWrapper j;
    private boolean k;
    private GLRender l;
    private int m;
    private int n;
    private Object o;
    private RecordingListener p;
    private FrameQueue q;
    private int s;
    private int t;
    private int[] u;

    public class SaveThread extends Thread {
        private ByteBuffer b;

        public SaveThread(ByteBuffer byteBuffer) {
            this.b = byteBuffer;
        }

        public void run() {
            super.run();
            Bitmap createBitmap = Bitmap.createBitmap(MediaManager.this.b, MediaManager.this.c, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(this.b);
            StringBuilder sb = new StringBuilder();
            sb.append("/sdcard/Pictures/_");
            sb.append(System.currentTimeMillis());
            sb.append(".png");
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(sb.toString());
                createBitmap.compress(CompressFormat.PNG, 100, fileOutputStream);
                fileOutputStream.close();
                createBitmap.recycle();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public MediaManager(@NonNull FileDescriptor fileDescriptor, int i2, int i3, int i4, boolean z, int i5, RecordingListener recordingListener) {
        this.p = recordingListener;
        this.b = i2;
        this.c = i3;
        if (90 == i4 || 270 == i4) {
            this.b ^= this.c;
            this.c = this.b ^ this.c;
            this.b ^= this.c;
        }
        this.d = i4;
        this.e = z;
        this.m = 0;
        this.n = 0;
        this.j = new MuxerWrapper(fileDescriptor, i5, (RecordingListener) this);
        EGLDisplay eglGetCurrentDisplay = EGL14.eglGetCurrentDisplay();
        EGLSurface eglGetCurrentSurface = EGL14.eglGetCurrentSurface(12378);
        int[] iArr = new int[1];
        int[] iArr2 = new int[1];
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12375, iArr, 0);
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12374, iArr2, 0);
        this.s = iArr[0];
        this.t = iArr2[0];
        this.o = new Object();
        String str = a;
        StringBuilder sb = new StringBuilder();
        sb.append("MediaManager constructor mFrameWidth = ");
        sb.append(i2);
        sb.append(" ,mFrameHeight = ");
        sb.append(i3);
        CodecLog.d(str, sb.toString());
    }

    public MediaManager(@NonNull String str, int i2, int i3, int i4, boolean z, int i5, RecordingListener recordingListener) {
        this.p = recordingListener;
        this.b = i2;
        this.c = i3;
        if (90 == i4 || 270 == i4) {
            this.b ^= this.c;
            this.c = this.b ^ this.c;
            this.b ^= this.c;
        }
        this.d = i4;
        this.e = z;
        this.m = 0;
        this.n = 0;
        this.j = new MuxerWrapper(str, i5, (RecordingListener) this);
        EGLDisplay eglGetCurrentDisplay = EGL14.eglGetCurrentDisplay();
        EGLSurface eglGetCurrentSurface = EGL14.eglGetCurrentSurface(12378);
        int[] iArr = new int[1];
        int[] iArr2 = new int[1];
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12375, iArr, 0);
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12374, iArr2, 0);
        this.s = iArr[0];
        this.t = iArr2[0];
        this.o = new Object();
        String str2 = a;
        StringBuilder sb = new StringBuilder();
        sb.append("MediaManager constructor mFrameWidth = ");
        sb.append(i2);
        sb.append(" ,mFrameHeight = ");
        sb.append(i3);
        CodecLog.d(str2, sb.toString());
    }

    private void a() {
        if (this.m == this.n) {
            this.f = true;
        } else if (this.n >= 3) {
            StringBuilder sb = new StringBuilder();
            sb.append("Init encoder count great than need. need=");
            sb.append(this.m);
            sb.append(" ,but got=");
            sb.append(this.n);
            throw new RuntimeException(sb.toString());
        }
    }

    private void b() {
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.b * this.c * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.b, this.c, 6408, 5121, allocateDirect);
        String str = a;
        StringBuilder sb = new StringBuilder();
        sb.append("glReadPixels() glError = ");
        sb.append(GLES20.glGetError());
        CodecLog.d(str, sb.toString());
        new SaveThread(allocateDirect).start();
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x007d A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x007e  */
    public void drawSurfaceWithTextureId(int i2) {
        boolean z;
        if (!this.f) {
            CodecLog.e(a, "drawSurfaceWithTextureId()-> MediaManager has not been initialized.");
        } else if (i2 <= 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("textureId must >0 , your textureId=");
            sb.append(i2);
            throw new IllegalArgumentException(sb.toString());
        } else if (this.l != null) {
            CodecLog.d(a, "drawSurfaceWithTextureId()->A-");
            FrameItem frameItem = null;
            try {
                this.h.lock();
                if (this.q.isIsInited()) {
                    FrameItem frameForProducer = this.q.getFrameForProducer();
                    if (frameForProducer != null) {
                        try {
                            if (frameForProducer.mIsInited) {
                                frameItem = frameForProducer;
                                z = true;
                            }
                        } catch (Exception e2) {
                            FrameItem frameItem2 = frameForProducer;
                            e = e2;
                            frameItem = frameItem2;
                            String str = a;
                            try {
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("drawSurfaceWithTextureId meet error when get lock : ");
                                sb2.append(e.getMessage());
                                CodecLog.d(str, sb2.toString());
                                this.h.unLock();
                                z = false;
                                if (z) {
                                }
                            } catch (Throwable th) {
                                this.h.unLock();
                                throw th;
                            }
                        }
                    }
                    CodecLog.d(a, "drawSurfaceWithTextureId()-> get a null frame item.");
                    this.h.unLock();
                    return;
                }
                z = false;
                this.h.unLock();
            } catch (Exception e3) {
                e = e3;
                String str2 = a;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("drawSurfaceWithTextureId meet error when get lock : ");
                sb22.append(e.getMessage());
                CodecLog.d(str2, sb22.toString());
                this.h.unLock();
                z = false;
                if (z) {
                }
            }
            if (z) {
                if (this.u == null) {
                    this.u = new int[4];
                    GLES30.glGetIntegerv(2978, this.u, 0);
                }
                this.q.deleteSync(frameItem);
                frameItem.mFramebuffer.bind(false, false);
                GLES20.glViewport(0, 0, this.b, this.c);
                this.l.renderWithTextureId(i2);
                frameItem.a = GLES30.glFenceSync(37143, 0);
                frameItem.mFramebuffer.unBind(false, false);
                frameItem.mIsEmpty = false;
                GLES20.glViewport(this.u[0], this.u[1], this.u[2], this.u[3]);
                String str3 = a;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("drawSurfaceWithTextureId()-> A glError = ");
                sb3.append(GLES20.glGetError());
                sb3.append(", fbo = ");
                sb3.append(frameItem);
                sb3.append(" ,textureId = ");
                sb3.append(frameItem.mFramebuffer.getTextureId());
                CodecLog.d(str3, sb3.toString());
                try {
                    this.h.lock();
                    this.q.addFrameForProducer();
                } catch (Exception e4) {
                    String str4 = a;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("drawSurfaceWithTextureId meet error when get lock : ");
                    sb4.append(e4.getMessage());
                    CodecLog.d(str4, sb4.toString());
                } catch (Throwable th2) {
                    this.h.sinalCondition();
                    this.h.unLock();
                    throw th2;
                }
                this.h.sinalCondition();
                this.h.unLock();
                CodecLog.d(a, "drawSurfaceWithTextureId()->C");
            }
        } else {
            throw new RuntimeException("Could not call drawSurfaceWithTextureId() in with a null GLRender.");
        }
    }

    public long getMuxerSizeRecorded() {
        if (this.j == null) {
            return 0;
        }
        return this.j.getSizeRecordFile();
    }

    public long getMuxerTimeElapsed() {
        if (this.j == null) {
            return 0;
        }
        return this.j.getTimeElapse();
    }

    public void initAudioEncoder() {
        this.i = new AudioEncoder(this.j, this.o, this);
        this.i.prepare(false);
        this.n++;
        a();
    }

    public void initVideoEncoder(String str) {
        CodecLog.e(a, "MediaManager initVideoEncoder in");
        VideoEncoder videoEncoder = new VideoEncoder(this.j, this.b, this.c, this.o, this, EGL14.EGL_NO_CONTEXT, 10000000, str);
        this.h = videoEncoder;
        this.h.prepare(false);
        this.f = true;
        this.n++;
        a();
        String str2 = a;
        StringBuilder sb = new StringBuilder();
        sb.append("MediaManager initVideoEncoder out mInitedEncoderCount = ");
        sb.append(this.n);
        CodecLog.e(str2, sb.toString());
    }

    public void initVideoEncoderWithSharedContext(EGLContext eGLContext, int i2, boolean z, String str) {
        CodecLog.d(a, "MediaManager initVideoEncoderWithSharedContext in");
        VideoEncoder videoEncoder = new VideoEncoder(this.j, this.b, this.c, this.o, this, eGLContext, i2, str);
        this.h = videoEncoder;
        String str2 = a;
        StringBuilder sb = new StringBuilder();
        sb.append("MediaManager initVideoEncoderWithSharedContext encoder type = ");
        sb.append(this.h.getEncoderType());
        CodecLog.d(str2, sb.toString());
        this.k = true;
        if (this.k) {
            if (this.h.getInputSurface() != null) {
                this.l = new GLRender(this.b, this.c, this.d, this.e);
                this.l.initRender(z);
            } else {
                CodecLog.e(a, "initVideoEncoder()->getInputSurface null.");
                if (this.p != null) {
                    this.p.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CONFIGURE, Integer.valueOf(0));
                }
            }
        }
        this.q = new FrameQueue();
        this.q.init(2, this.b, this.c, false);
        this.h.setFrameQueue(this.q);
        this.n++;
        a();
        String str3 = a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("MediaManager initVideoEncoderWithSharedContext out mInitedEncoderCount = ");
        sb2.append(this.n);
        CodecLog.e(str3, sb2.toString());
    }

    public void onRecordingListener(int i2, Object obj) {
        String str = a;
        StringBuilder sb = new StringBuilder();
        sb.append("onRecordingListener()->in msg = ");
        sb.append(i2);
        sb.append(" ,value = ");
        sb.append((Integer) obj);
        CodecLog.d(str, sb.toString());
        int i3 = NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER;
        switch (i2) {
            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_CREATE /*545*/:
            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_CONFIGURE /*546*/:
            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_START /*547*/:
            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_STOP /*548*/:
            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_RELEASE /*549*/:
                i3 = 544;
                break;
            default:
                switch (i2) {
                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CREATE /*561*/:
                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CONFIGURE /*562*/:
                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_START /*563*/:
                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_STOP /*564*/:
                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_RELEASE /*565*/:
                        i3 = 560;
                        break;
                    default:
                        switch (i2) {
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_CREATE /*609*/:
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_ADD_TRACK /*610*/:
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_START /*611*/:
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_WRITE_SAMPLE_DATA /*612*/:
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_STOP /*613*/:
                            case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_MUXER_RELEASE /*614*/:
                                break;
                            default:
                                switch (i2) {
                                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_CREATE /*625*/:
                                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_START_RECORDING /*626*/:
                                    case NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_STOP /*627*/:
                                        i3 = 624;
                                        break;
                                    default:
                                        i3 = i2;
                                        break;
                                }
                        }
                }
        }
        if (this.p != null) {
            this.p.onRecordingListener(i3, obj);
        }
        CodecLog.d(a, "onRecordingListener()->out");
    }

    public int pauseRecording() {
        if (this.i != null) {
            this.i.pauseRecording();
        }
        if (this.h != null) {
            this.h.pauseRecording();
        }
        return 0;
    }

    public int resumeRecording() {
        synchronized (this.o) {
            if (this.i != null) {
                this.i.resumeRecording();
            }
            if (this.h != null) {
                this.h.resumeRecording();
            }
            this.o.notifyAll();
        }
        return 0;
    }

    public void setEncoderCount(int i2) {
        if (this.j != null) {
            this.j.setEncoderCount(i2);
        }
        this.m = i2;
    }

    public void startRecording() {
        if (!this.f || this.j == null) {
            throw new RuntimeException("Unit Encoder or Muxer is null.");
        }
        if (this.h != null) {
            this.h.startRecording();
        } else {
            String str = a;
            StringBuilder sb = new StringBuilder();
            sb.append("startRecording()-> VideoEncoder is null. maxEncoderCount=");
            sb.append(this.m);
            CodecLog.i(str, sb.toString());
        }
        if (this.i != null) {
            this.i.startRecording();
            return;
        }
        String str2 = a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("startRecording()-> AudioEncoder is null. maxEncoderCount=");
        sb2.append(this.m);
        CodecLog.i(str2, sb2.toString());
    }

    public void stopRecording() {
        synchronized (this.o) {
            this.o.notifyAll();
        }
        if (this.h != null) {
            this.h.stopRecording();
            this.h.release(true);
            this.h = null;
        }
        if (this.i != null) {
            this.i.stopRecording();
            this.i.release(false);
            this.i = null;
        }
        if (this.l != null) {
            this.l.unInitRender();
            this.l = null;
        }
        if (this.q != null) {
            this.q.unInit();
            this.q = null;
        }
        this.j = null;
        this.o = null;
        this.u = null;
    }
}

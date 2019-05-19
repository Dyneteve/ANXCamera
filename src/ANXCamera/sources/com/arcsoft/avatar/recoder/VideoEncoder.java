package com.arcsoft.avatar.recoder;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.view.Surface;
import com.android.camera.storage.Storage;
import com.arcsoft.avatar.gl.EGLWrapper;
import com.arcsoft.avatar.gl.GLFramebuffer;
import com.arcsoft.avatar.gl.GLRender;
import com.arcsoft.avatar.util.CodecLog;
import com.arcsoft.avatar.util.NotifyMessage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.concurrent.locks.ReentrantLock;

public class VideoEncoder extends BaseEncoder {
    public static final String ENCODER_THREAD_NAME = "Arc_Video_Encoder";
    public static final String NAME = "ARC_V";
    private static final String u = "Arc_VideoEncoder";
    private static final long v = 1000000000;
    private static final int w = 10000000;
    private static final int x = 30;
    private static final int y = 10;
    private static String z = "video/avc";
    private MediaFormat A;
    /* access modifiers changed from: private */
    public int B;
    /* access modifiers changed from: private */
    public int C;
    private boolean D;
    private int E;
    private Surface F;
    private Thread G;
    /* access modifiers changed from: private */
    public EGLWrapper H;
    private EGLContext I = EGL14.EGL_NO_CONTEXT;
    /* access modifiers changed from: private */
    public GLRender J;
    private int K;
    protected long t;

    public class SaveThread extends Thread {
        private ByteBuffer b;

        public SaveThread(ByteBuffer byteBuffer) {
            this.b = byteBuffer;
        }

        public void run() {
            super.run();
            Bitmap createBitmap = Bitmap.createBitmap(VideoEncoder.this.B, VideoEncoder.this.C, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(this.b);
            StringBuilder sb = new StringBuilder();
            sb.append("/sdcard/Pictures/_");
            sb.append(System.currentTimeMillis());
            sb.append(Storage.JPEG_SUFFIX);
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(sb.toString());
                createBitmap.compress(CompressFormat.JPEG, 100, fileOutputStream);
                fileOutputStream.close();
                createBitmap.recycle();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public VideoEncoder(MuxerWrapper muxerWrapper, int i, int i2, Object obj, RecordingListener recordingListener, EGLContext eGLContext, int i3) {
        super(muxerWrapper, obj, recordingListener);
        this.B = i;
        this.C = i2;
        this.G = null;
        this.K = i3;
        this.I = eGLContext;
        prepare(true);
        b();
        this.q = new ReentrantLock();
        this.r = this.q.newCondition();
        String str = u;
        StringBuilder sb = new StringBuilder();
        sb.append("VideoEncoder constructor mCustomerBitRate = ");
        sb.append(this.K);
        CodecLog.d(str, sb.toString());
        String str2 = u;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("VideoEncoder constructor mWidth = ");
        sb2.append(i);
        sb2.append(" ,mHeight = ");
        sb2.append(i2);
        CodecLog.d(str2, sb2.toString());
    }

    private void a(boolean z2) {
        CodecLog.d(u, "initVideoEncoder()->in");
        this.A = MediaFormat.createVideoFormat(z, this.B, this.C);
        this.A.setInteger("color-format", 2130708361);
        this.A.setInteger("bitrate", this.K);
        this.A.setInteger("frame-rate", 30);
        this.A.setInteger("i-frame-interval", 10);
        try {
            this.i = MediaCodec.createEncoderByType(z);
            String str = u;
            StringBuilder sb = new StringBuilder();
            sb.append("initVideoEncoder(): selected_codec_name = ");
            sb.append(this.i.getName());
            CodecLog.i(str, sb.toString());
        } catch (IOException e) {
            CodecLog.e(u, "initVideoEncoder()->createEncoderByType failed.");
            e.printStackTrace();
            if (this.o != null) {
                this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CREATE, Integer.valueOf(0));
            }
        }
        try {
            this.i.configure(this.A, null, null, 1);
        } catch (Exception e2) {
            CodecLog.e(u, "initVideoEncoder()->configure failed.");
            e2.printStackTrace();
            if (this.o != null) {
                this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CONFIGURE, Integer.valueOf(0));
            }
        }
        if (z2) {
            try {
                this.F = this.i.createInputSurface();
            } catch (Exception e3) {
                CodecLog.e(u, "initVideoEncoder()->createInputSurface failed.");
                e3.printStackTrace();
                if (this.o != null) {
                    this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_CONFIGURE, Integer.valueOf(0));
                }
            }
        } else {
            this.F = null;
        }
        CodecLog.d(u, "initVideoEncoder()->out");
    }

    private void b() {
        this.H = new EGLWrapper(getInputSurface(), this.I);
    }

    /* access modifiers changed from: private */
    public void c() {
        this.J = new GLRender(this.B, this.C, this.E, true);
        this.J.initRender(false);
        String str = u;
        StringBuilder sb = new StringBuilder();
        sb.append("VideoEncoder initGL glError = ");
        sb.append(GLES20.glGetError());
        CodecLog.d(str, sb.toString());
    }

    /* access modifiers changed from: private */
    public void d() {
        this.J.unInitRender();
        this.J = null;
    }

    private void e() {
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(this.B * this.C * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.B, this.C, 6408, 5121, allocateDirect);
        new SaveThread(allocateDirect).start();
    }

    public Surface getInputSurface() {
        return this.i != null ? this.F : super.getInputSurface();
    }

    public void notifyNewFrameAvailable() {
    }

    public void pauseRecording() {
        if (!this.e) {
            this.e = true;
            this.t = System.nanoTime();
        }
    }

    public void prepare(boolean z2) {
        a(z2);
        if (this.i == null) {
            throw new RuntimeException("Init video encoder is failed.");
        }
    }

    public void release(boolean z2) {
        String str = ENCODER_THREAD_NAME;
        try {
            this.q.lock();
        } catch (Exception e) {
            String str2 = u;
            StringBuilder sb = new StringBuilder();
            sb.append("release()-> meet error when get lock : ");
            sb.append(e.getMessage());
            CodecLog.e(str2, sb.toString());
        } catch (Throwable th) {
            sinalCondition();
            this.q.unlock();
            throw th;
        }
        sinalCondition();
        this.q.unlock();
        if (this.G != null) {
            try {
                this.G.join();
            } catch (InterruptedException e2) {
                CodecLog.d(u, "Encoder Thread has been Interrupted, errors may be occurred.");
                e2.printStackTrace();
            } catch (Throwable th2) {
                this.G = null;
                throw th2;
            }
            this.G = null;
        }
        if (this.H != null) {
            this.H.release();
            this.H = null;
        }
        this.I = EGL14.EGL_NO_CONTEXT;
        String str3 = u;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("VideoEncoder release() encoder thread exit. threadName =");
        sb2.append(str);
        CodecLog.d(str3, sb2.toString());
        this.F = null;
        this.q = null;
        this.r = null;
        this.s = null;
        super.release(z2);
    }

    public void resumeRecording() {
        if (this.e) {
            this.e = false;
            this.g += System.nanoTime() - this.t;
            this.n.add(Long.valueOf(this.g));
        }
    }

    public void startRecording() {
        if (this.G == null) {
            super.startRecording();
            this.G = new Thread(ENCODER_THREAD_NAME) {
                public void run() {
                    super.run();
                    setName(VideoEncoder.NAME);
                    try {
                        VideoEncoder.this.i.start();
                        VideoEncoder.this.H.makeCurrent();
                        VideoEncoder.this.c();
                        while (!VideoEncoder.this.d) {
                            FrameItem frameItem = null;
                            try {
                                VideoEncoder.this.lock();
                                while (VideoEncoder.this.s.queueSize() == 0 && !VideoEncoder.this.d) {
                                    try {
                                        CodecLog.d(VideoEncoder.u, "VideoEncoder frame_item_wait");
                                        VideoEncoder.this.r.await();
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                    }
                                }
                                FrameItem frameForConsumer = VideoEncoder.this.s.getFrameForConsumer();
                                VideoEncoder.this.unLock();
                                frameItem = frameForConsumer;
                            } catch (Exception e2) {
                                e2.printStackTrace();
                                String str = VideoEncoder.u;
                                StringBuilder sb = new StringBuilder();
                                sb.append("VideoEncoder meet exception when get item : ");
                                sb.append(e2.getMessage());
                                CodecLog.e(str, sb.toString());
                            } finally {
                                VideoEncoder.this.unLock();
                            }
                            if (frameItem != null) {
                                GLFramebuffer gLFramebuffer = frameItem.mFramebuffer;
                                VideoEncoder.this.drain();
                                String str2 = VideoEncoder.u;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("VideoEncoder frame_item_index = ");
                                sb2.append(frameItem.mFrameIndex);
                                CodecLog.d(str2, sb2.toString());
                                if (0 != frameItem.a) {
                                    String str3 = VideoEncoder.u;
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("VideoEncoder wait gpu by sync = ");
                                    sb3.append(frameItem.a);
                                    CodecLog.d(str3, sb3.toString());
                                    GLES30.glWaitSync(frameItem.a, 0, -1);
                                }
                                VideoEncoder.this.J.renderWithTextureId(gLFramebuffer.getTextureId());
                                try {
                                    VideoEncoder.this.lock();
                                    VideoEncoder.this.s.addEmptyFrameForConsumer();
                                } catch (Exception e3) {
                                    e3.printStackTrace();
                                    String str4 = VideoEncoder.u;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("VideoEncoder meet exception when add item : ");
                                    sb4.append(e3.getMessage());
                                    CodecLog.e(str4, sb4.toString());
                                } catch (Throwable th) {
                                    VideoEncoder.this.unLock();
                                    throw th;
                                }
                                VideoEncoder.this.H.swapBuffers();
                            }
                        }
                        VideoEncoder.this.a = true;
                        VideoEncoder.this.i.signalEndOfInputStream();
                        VideoEncoder.this.drain();
                        VideoEncoder.this.d();
                        VideoEncoder.this.H.makeUnCurrent();
                    } catch (Exception e4) {
                        e4.printStackTrace();
                        if (VideoEncoder.this.o != null) {
                            VideoEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_START, Integer.valueOf(0));
                        }
                    }
                }
            };
            this.G.start();
            CodecLog.d(u, "VideoEncoder is started.");
            return;
        }
        CodecLog.e(u, "startRecording()-> Video encoder thread has been started already, can not start twice.");
        throw new RuntimeException("Video encoder thread has been started already, can not start twice.");
    }

    public void stopRecording() {
        super.stopRecording();
        try {
            this.q.lock();
        } catch (Exception e) {
            String str = u;
            StringBuilder sb = new StringBuilder();
            sb.append("stopRecording()-> meet error when get lock : ");
            sb.append(e.getMessage());
            CodecLog.e(str, sb.toString());
        } catch (Throwable th) {
            sinalCondition();
            this.q.unlock();
            throw th;
        }
        sinalCondition();
        this.q.unlock();
    }
}

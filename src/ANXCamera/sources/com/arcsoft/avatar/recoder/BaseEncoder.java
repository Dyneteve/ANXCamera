package com.arcsoft.avatar.recoder;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.os.Bundle;
import android.view.Surface;
import com.arcsoft.avatar.util.CodecLog;
import com.arcsoft.avatar.util.NotifyMessage;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

public abstract class BaseEncoder {
    private static final String t = "Arc_BaseEncoder";
    private static final int u = 1000000;
    private static final int v = 1000000;
    private static final int w = 50564;
    private static final long x = 20000;
    private long A = 0;
    private long B = 0;
    private long C = 0;
    private long D = 0;
    protected boolean a;
    protected boolean b;
    protected boolean c;
    protected boolean d;
    protected volatile boolean e;
    protected Object f;
    protected volatile long g;
    protected MuxerWrapper h;
    protected MediaCodec i;
    protected int j;
    protected int k;
    protected boolean l;
    protected long m;
    protected Queue<Long> n;
    protected RecordingListener o;
    protected long p = 500;
    protected Lock q;
    protected Condition r;
    protected FrameQueue s;
    private long y = 0;
    private long z = 0;

    public BaseEncoder(MuxerWrapper muxerWrapper, Object obj, RecordingListener recordingListener) {
        this.o = recordingListener;
        this.h = muxerWrapper;
        this.c = false;
        this.b = false;
        this.a = true;
        this.e = false;
        this.d = false;
        this.k = -1;
        this.j = -1;
        this.f = obj;
        this.g = 0;
        this.l = false;
        this.m = 0;
        this.n = new LinkedList();
        CodecLog.d(t, "BaseEncoder constructor out");
    }

    /* access modifiers changed from: protected */
    public long a() {
        long nanoTime = System.nanoTime();
        long j2 = this.g;
        if (this.n.size() != 0) {
            j2 = ((Long) this.n.poll()).longValue();
        }
        long j3 = (nanoTime - j2) / 1000;
        String str = t;
        StringBuilder sb = new StringBuilder();
        sb.append("getPTSUs TotalPauseTime=");
        sb.append(this.g / 1000);
        CodecLog.d(str, sb.toString());
        String str2 = t;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("getPTSUs preTime=");
        sb2.append(this.z);
        sb2.append(" ,currentTime=");
        sb2.append(nanoTime / 1000);
        sb2.append(" , result=");
        sb2.append(j3);
        CodecLog.d(str2, sb2.toString());
        if (j3 < this.z) {
            long j4 = this.z - j3;
            return j4 < x ? (this.z + x) - j4 : this.z + x;
        } else if (0 == this.z) {
            return j3;
        } else {
            long j5 = j3 - this.z;
            return j5 < x ? (j3 + x) - j5 : j3;
        }
    }

    public void drain() {
        if (this.i == null) {
            CodecLog.e(t, "drain()->Encoder is not ready.");
            return;
        }
        String name = Thread.currentThread().getName();
        String str = t;
        StringBuilder sb = new StringBuilder();
        sb.append("drain()->Encoder one frame. threadName in=");
        sb.append(Thread.currentThread().getName());
        CodecLog.d(str, sb.toString());
        if (this.h == null) {
            CodecLog.e(t, "drain()->Muxer is not ready.");
            return;
        }
        BufferInfo bufferInfo = new BufferInfo();
        int i2 = 0;
        while (true) {
            if (!this.b) {
                break;
            }
            int dequeueOutputBuffer = this.i.dequeueOutputBuffer(bufferInfo, this.p);
            if (-1 == dequeueOutputBuffer) {
                if (i2 >= 2) {
                    CodecLog.d(t, "drain()->Encoded frame is preparing, wait time out.");
                    break;
                }
                i2++;
                String str2 = t;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("drain()->Encoded frame is preparing, wait ... waitCount = ");
                sb2.append(i2);
                CodecLog.d(str2, sb2.toString());
            } else if (-2 == dequeueOutputBuffer) {
                if (!this.c) {
                    this.j = this.h.addTrack(this.i.getOutputFormat());
                    this.c = true;
                    if (!this.h.isStarted()) {
                        this.h.startMuxer();
                        String str3 = t;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Muxer started: threadName =");
                        sb3.append(Thread.currentThread().getName());
                        CodecLog.d(str3, sb3.toString());
                        synchronized (this.h) {
                            while (!this.h.isStarted() && !this.d) {
                                try {
                                    this.h.wait(100);
                                } catch (InterruptedException e2) {
                                    String str4 = t;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("drain()->Wait for muxer started, but be interrupted : ");
                                    sb4.append(e2.getMessage());
                                    CodecLog.e(str4, sb4.toString());
                                    this.c = false;
                                }
                            }
                            long a2 = a();
                            this.D = a2;
                            this.h.setStartTime(a2);
                            String str5 = t;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Muxer start time =");
                            sb5.append(a2);
                            CodecLog.i(str5, sb5.toString());
                        }
                    } else {
                        continue;
                    }
                } else {
                    CodecLog.e(t, "drain()->Encoder format change twice.");
                    throw new RuntimeException("Format only allow change once, but Encoder meet twice!");
                }
            } else if (dequeueOutputBuffer < 0) {
                String str6 = t;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("drain()->Encoder meet bufferStatus =");
                sb6.append(dequeueOutputBuffer);
                CodecLog.i(str6, sb6.toString());
            } else {
                ByteBuffer outputBuffer = this.i.getOutputBuffer(dequeueOutputBuffer);
                if ((2 & bufferInfo.flags) != 0) {
                    bufferInfo.size = 0;
                    CodecLog.i(t, "drain()->Encoder meet bufferStatus : BUFFER_FLAG_CODEC_CONFIG ");
                }
                if (!this.c) {
                    CodecLog.e(t, "drain()->Encoder muxer has not started ");
                }
                if (bufferInfo.size != 0) {
                    outputBuffer.position(bufferInfo.offset);
                    outputBuffer.limit(bufferInfo.offset + bufferInfo.size);
                    String str7 = t;
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("drain()->Encoder one frame. threadName=");
                    sb7.append(Thread.currentThread().getName());
                    sb7.append(" timestamp original buffer info =");
                    sb7.append(bufferInfo.presentationTimeUs);
                    CodecLog.d(str7, sb7.toString());
                    bufferInfo.presentationTimeUs = a();
                    String str8 = t;
                    StringBuilder sb8 = new StringBuilder();
                    sb8.append("time_diff _");
                    sb8.append(name);
                    sb8.append("= ");
                    sb8.append(bufferInfo.presentationTimeUs - this.y);
                    CodecLog.d(str8, sb8.toString());
                    this.y = bufferInfo.presentationTimeUs;
                    if (bufferInfo.presentationTimeUs - this.A >= 1000000) {
                        this.A = bufferInfo.presentationTimeUs;
                        Bundle bundle = new Bundle();
                        bundle.putInt("request-sync", 1);
                        this.i.setParameters(bundle);
                    }
                    this.h.writeSampleData(this.j, outputBuffer, bufferInfo);
                    this.z = bufferInfo.presentationTimeUs;
                    this.h.setCurrentTime(bufferInfo.presentationTimeUs);
                    String str9 = t;
                    StringBuilder sb9 = new StringBuilder();
                    sb9.append("drain()->Encoder one frame. threadName=");
                    sb9.append(Thread.currentThread().getName());
                    sb9.append(" timestamp=");
                    sb9.append(bufferInfo.presentationTimeUs);
                    CodecLog.d(str9, sb9.toString());
                }
                this.i.releaseOutputBuffer(dequeueOutputBuffer, false);
                if ((4 & bufferInfo.flags) != 0) {
                    if (!this.a) {
                        CodecLog.e(t, "drain()->Encoder meet unexpected end of stream.");
                    } else {
                        CodecLog.d(t, "drain()->Encoder meet end of stream.");
                    }
                    this.b = false;
                }
            }
        }
        String str10 = t;
        StringBuilder sb10 = new StringBuilder();
        sb10.append("drain()->Encoder one frame. threadName out=");
        sb10.append(Thread.currentThread().getName());
        CodecLog.d(str10, sb10.toString());
    }

    public void encode(ByteBuffer byteBuffer, long j2) {
        if (this.i == null) {
            CodecLog.e(t, "encode()->Encoder is not ready.");
            return;
        }
        String str = t;
        StringBuilder sb = new StringBuilder();
        sb.append("encode()->Encoder one frame. threadName in=");
        sb.append(Thread.currentThread().getName());
        CodecLog.d(str, sb.toString());
        int i2 = 0;
        if (this.b) {
            while (true) {
                if (!this.b || this.a) {
                    break;
                }
                int dequeueInputBuffer = this.i.dequeueInputBuffer(500);
                if (-1 == dequeueInputBuffer) {
                    if (i2 >= 3) {
                        CodecLog.d(t, "encode()->Encoder is busy, wait time out.");
                        break;
                    }
                    i2++;
                    String str2 = t;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("encode()->Encoder is busy, wait ... waitCount = ");
                    sb2.append(i2);
                    CodecLog.d(str2, sb2.toString());
                } else if (dequeueInputBuffer >= 0) {
                    ByteBuffer inputBuffer = this.i.getInputBuffer(dequeueInputBuffer);
                    if (byteBuffer == null) {
                        this.a = true;
                        this.i.queueInputBuffer(dequeueInputBuffer, 0, 0, j2, 4);
                        CodecLog.d(t, "encode()->Encoder meets end of stream.");
                    } else {
                        inputBuffer.clear();
                        inputBuffer.put(byteBuffer);
                        inputBuffer.flip();
                        this.i.queueInputBuffer(dequeueInputBuffer, 0, inputBuffer.remaining(), j2, 0);
                        CodecLog.d(t, "encode()->Encoder is fed a new frame.");
                    }
                }
            }
        }
    }

    public String getEncoderType() {
        return this.i != null ? this.i.getName().toLowerCase().contains("google") ? "Software Encoder" : "Hardware Encoder" : "No Encoder";
    }

    public FrameQueue getFrameQueue() {
        return null;
    }

    public Surface getInputSurface() {
        return null;
    }

    public void lock() {
        if (this.q != null) {
            this.q.lock();
        }
    }

    public abstract void notifyNewFrameAvailable();

    public void pauseRecording() {
        this.e = true;
        String str = t;
        StringBuilder sb = new StringBuilder();
        sb.append("Log_mIsRequestPause_Vaule_pauseRecording ->mIsRequestPause=");
        sb.append(this.e);
        CodecLog.d(str, sb.toString());
    }

    public abstract void prepare(boolean z2);

    public void release(boolean z2) {
        if (this.i != null) {
            try {
                this.i.stop();
            } catch (Exception e2) {
                e2.printStackTrace();
                if (z2) {
                    if (this.o != null) {
                        this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_STOP, Integer.valueOf(0));
                    }
                } else if (this.o != null) {
                    this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_STOP, Integer.valueOf(0));
                }
            }
            try {
                this.i.release();
            } catch (Exception e3) {
                e3.printStackTrace();
                if (z2) {
                    if (this.o != null) {
                        this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_VIDEO_RELEASE, Integer.valueOf(0));
                    }
                } else if (this.o != null) {
                    this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_RELEASE, Integer.valueOf(0));
                }
            }
            this.i = null;
        }
        if (this.h != null) {
            this.h.stopMuxer();
            this.h = null;
        }
        this.b = false;
        this.e = false;
        this.d = false;
        this.a = true;
        this.f = null;
        this.q = null;
        this.r = null;
    }

    public void resumeRecording() {
        this.e = false;
        String str = t;
        StringBuilder sb = new StringBuilder();
        sb.append("Log_mIsRequestPause_Vaule_resumeRecording ->mIsRequestPause=");
        sb.append(this.e);
        CodecLog.d(str, sb.toString());
    }

    public void setFrameQueue(FrameQueue frameQueue) {
        this.s = frameQueue;
    }

    public void sinalCondition() {
        if (this.r != null) {
            this.r.signalAll();
        }
    }

    public void startRecording() {
        if (this.b) {
            CodecLog.i(t, "startRecording()-> encoder is started, you can not start it again");
            return;
        }
        this.b = true;
        this.d = false;
        this.a = false;
        CodecLog.d(t, "startRecording()-> encoder is started.");
    }

    public void stopRecording() {
        if (this.d) {
            CodecLog.i(t, "stopRecording()-> stop encoder request command is received,you can not send stop command again.");
        } else {
            this.d = true;
        }
    }

    public void unLock() {
        if (this.q != null) {
            this.q.unlock();
        }
    }
}

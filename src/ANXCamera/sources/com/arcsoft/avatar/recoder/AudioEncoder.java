package com.arcsoft.avatar.recoder;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaFormat;
import com.arcsoft.avatar.util.NotifyMessage;
import java.io.IOException;
import java.nio.ByteBuffer;

public class AudioEncoder extends BaseEncoder {
    private static final String t = "Arc_BaseEncoder";
    private static final String u = "Arc_Audio_Encoder";
    private final int A;
    private final String B;
    private final int C;
    private int D;
    private int E;
    private int F;
    private int G;
    private int H;
    private int I;
    /* access modifiers changed from: private */
    public int J;
    private Object K;
    private long L;
    private boolean M;
    public final String NAME;
    /* access modifiers changed from: private */
    public AudioRecord v;
    private Thread w;
    private final int x;
    private final int y;
    private final int z;

    public AudioEncoder(MuxerWrapper muxerWrapper, Object obj, RecordingListener recordingListener) {
        super(muxerWrapper, obj, recordingListener);
        this.NAME = "ARC_S";
        this.x = 44100;
        this.y = 16;
        this.z = 2;
        this.A = 6;
        this.B = "audio/mp4a-latm";
        this.C = 2000000;
        this.D = 44100;
        this.E = 16;
        this.F = 2;
        this.G = 6;
        this.H = 2000000;
        this.K = new Object();
        this.c = false;
        this.L = 0;
    }

    private boolean b() {
        this.I = AudioRecord.getMinBufferSize(this.D, this.E, this.F);
        try {
            AudioRecord audioRecord = new AudioRecord(this.G, this.D, this.E, this.F, this.I);
            this.v = audioRecord;
        } catch (Exception e) {
            if (this.o != null) {
                this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_CREATE, Integer.valueOf(0));
            }
            e.printStackTrace();
        }
        if (this.v == null || 1 != this.v.getState()) {
            this.v = null;
            return false;
        }
        this.J = this.I;
        return true;
    }

    private boolean c() {
        MediaFormat createAudioFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", this.D, this.E);
        createAudioFormat.setInteger("aac-profile", 2);
        createAudioFormat.setInteger("channel-count", d());
        createAudioFormat.setInteger("bitrate", this.H);
        try {
            this.i = MediaCodec.createEncoderByType("audio/mp4a-latm");
        } catch (IOException e) {
            this.i = null;
            if (this.o != null) {
                this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_CREATE, Integer.valueOf(0));
            }
            e.printStackTrace();
        }
        if (this.i == null) {
            return false;
        }
        try {
            this.i.configure(createAudioFormat, null, null, 1);
        } catch (Exception e2) {
            e2.printStackTrace();
            if (this.o != null) {
                this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_CONFIGURE, Integer.valueOf(0));
            }
        }
        return true;
    }

    private int d() {
        return 12 == this.F ? 2 : 1;
    }

    public void notifyNewFrameAvailable() {
    }

    public void prepare(boolean z2) {
        if (b() && c()) {
            this.M = true;
        }
    }

    public void release(boolean z2) {
        if (this.w != null) {
            try {
                this.w.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (Throwable th) {
                this.w = null;
                throw th;
            }
            this.w = null;
        }
        this.v.release();
        this.M = false;
        super.release(z2);
    }

    public void startRecording() {
        if (this.M) {
            if (this.w == null) {
                super.startRecording();
                this.w = new Thread(u) {
                    public void run() {
                        super.run();
                        setName("ARC_S");
                        try {
                            AudioEncoder.this.v.startRecording();
                        } catch (Exception e) {
                            e.printStackTrace();
                            if (AudioEncoder.this.o != null) {
                                AudioEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_START_RECORDING, Integer.valueOf(0));
                            }
                        }
                        try {
                            AudioEncoder.this.i.start();
                        } catch (Exception e2) {
                            if (AudioEncoder.this.o != null) {
                                AudioEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER_AUDIO_START, Integer.valueOf(0));
                            }
                        }
                        long nanoTime = System.nanoTime();
                        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(AudioEncoder.this.J);
                        while (!AudioEncoder.this.d) {
                            if (AudioEncoder.this.e) {
                                long nanoTime2 = System.nanoTime();
                                synchronized (AudioEncoder.this.f) {
                                    if (AudioEncoder.this.e) {
                                        try {
                                            AudioEncoder.this.v.stop();
                                        } catch (Exception e3) {
                                            e3.printStackTrace();
                                            if (AudioEncoder.this.o != null) {
                                                AudioEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_STOP, Integer.valueOf(0));
                                            }
                                        }
                                        try {
                                            AudioEncoder.this.f.wait();
                                            try {
                                                AudioEncoder.this.v.startRecording();
                                            } catch (Exception e4) {
                                                e4.printStackTrace();
                                                if (AudioEncoder.this.o != null) {
                                                    AudioEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_START_RECORDING, Integer.valueOf(0));
                                                }
                                            }
                                            AudioEncoder.this.g += System.nanoTime() - nanoTime2;
                                            AudioEncoder.this.n.add(Long.valueOf(AudioEncoder.this.g));
                                        } catch (InterruptedException e5) {
                                            e5.printStackTrace();
                                        }
                                    }
                                }
                            }
                            allocateDirect.clear();
                            if (AudioEncoder.this.v.read(allocateDirect, AudioEncoder.this.J) > 0) {
                                AudioEncoder.this.encode(allocateDirect, ((System.nanoTime() - nanoTime) - AudioEncoder.this.g) / 1000);
                                AudioEncoder.this.drain();
                            }
                        }
                        try {
                            AudioEncoder.this.v.stop();
                        } catch (Exception e6) {
                            e6.printStackTrace();
                            if (AudioEncoder.this.o != null) {
                                AudioEncoder.this.o.onRecordingListener(NotifyMessage.MSG_MEDIA_RECORDER_ERROR_AUDIO_RECORD_STOP, Integer.valueOf(0));
                            }
                        }
                        AudioEncoder.this.encode(null, 0);
                        AudioEncoder.this.drain();
                    }
                };
                this.w.start();
                return;
            }
            throw new RuntimeException("Audio encoder thread has been started already, can not start twice.");
        }
    }
}

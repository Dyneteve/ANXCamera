package org.a.a;

import android.media.AudioRecord;
import android.os.Build;
import android.util.Log;
import com.android.camera.module.BaseModule;

/* compiled from: BufferedAudioRecorder */
public class d {
    private static final String TAG = "BufferedAudioRecorder";
    protected static int channelConfigOffset = -1;
    protected static int[] channelConfigSuggested = {12, 16, 1};
    protected static int sampleRateOffset = -1;
    protected static int[] sampleRateSuggested = {48000, 44100, BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, 11025, 16000, 22050};
    AudioRecord audio;
    int audioFormat = 2;
    int bufferSizeInBytes = 0;
    int channelConfig = -1;
    boolean isRecording = false;
    int sampleRateInHz = -1;
    c vV;

    public d(c cVar) {
        this.vV = cVar;
        if ("SM919".equals(Build.MODEL)) {
            channelConfigSuggested = new int[]{16, 12, 1};
        }
    }

    public int aa(int i) {
        return 16 == i ? 1 : 2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0027, code lost:
        if (r4.vV.initWavFile(r4.sampleRateInHz, aa(channelConfigSuggested[channelConfigOffset]), r5) == 0) goto L_0x0031;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0029, code lost:
        android.util.Log.d(TAG, "init wav file failed");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0030, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0031, code lost:
        new java.lang.Thread(new org.a.a.d.AnonymousClass1(r4)).start();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x003e, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void d(double d) {
        Log.d(TAG, "audio startRecording");
        synchronized (this) {
            if (!this.isRecording) {
                if (this.audio != null) {
                    this.isRecording = true;
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.audio != null) {
            try {
                if (this.audio.getState() != 0) {
                    this.audio.stop();
                }
                this.audio.release();
            } catch (Exception e) {
            }
            this.audio = null;
        }
        super.finalize();
    }

    public void init(int i) {
        if (this.audio != null) {
            Log.d(TAG, "second time audio init(), skip");
            return;
        }
        int i2 = -1;
        try {
            if (!(channelConfigOffset == -1 || sampleRateOffset == -1)) {
                this.channelConfig = channelConfigSuggested[channelConfigOffset];
                this.sampleRateInHz = sampleRateSuggested[sampleRateOffset];
                this.bufferSizeInBytes = AudioRecord.getMinBufferSize(this.sampleRateInHz, this.channelConfig, this.audioFormat);
                AudioRecord audioRecord = new AudioRecord(i, this.sampleRateInHz, this.channelConfig, this.audioFormat, this.bufferSizeInBytes);
                this.audio = audioRecord;
            }
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("使用预设配置");
            sb.append(channelConfigOffset);
            sb.append(",");
            sb.append(sampleRateOffset);
            sb.append("实例化audio recorder失败，重新测试配置。");
            sb.append(e);
            Log.d(str, sb.toString());
        }
        if (this.audio == null) {
            channelConfigOffset = -1;
            int[] iArr = channelConfigSuggested;
            int length = iArr.length;
            int i3 = 0;
            boolean z = false;
            while (i3 < length) {
                this.channelConfig = iArr[i3];
                channelConfigOffset++;
                sampleRateOffset = i2;
                int[] iArr2 = sampleRateSuggested;
                int length2 = iArr2.length;
                int i4 = 0;
                while (true) {
                    if (i4 >= length2) {
                        break;
                    }
                    int i5 = iArr2[i4];
                    sampleRateOffset++;
                    try {
                        this.bufferSizeInBytes = AudioRecord.getMinBufferSize(i5, this.channelConfig, this.audioFormat);
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("试用hz ");
                        sb2.append(i5);
                        sb2.append(" ");
                        sb2.append(this.channelConfig);
                        sb2.append(" ");
                        sb2.append(this.audioFormat);
                        Log.d(str2, sb2.toString());
                        if (this.bufferSizeInBytes > 0) {
                            this.sampleRateInHz = i5;
                            int i6 = this.sampleRateInHz;
                            int i7 = this.channelConfig;
                            int i8 = i7;
                            int i9 = i;
                            AudioRecord audioRecord2 = new AudioRecord(i9, i6, i8, this.audioFormat, this.bufferSizeInBytes);
                            this.audio = audioRecord2;
                            z = true;
                            break;
                        }
                        sampleRateOffset++;
                        i4++;
                    } catch (Exception e2) {
                        this.sampleRateInHz = 0;
                        this.audio = null;
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("apply audio record sample rate ");
                        sb3.append(i5);
                        sb3.append(" failed: ");
                        sb3.append(e2.getMessage());
                        Log.d(str3, sb3.toString());
                        sampleRateOffset++;
                    }
                }
                if (z) {
                    break;
                }
                i3++;
                i2 = -1;
            }
        }
        if (this.sampleRateInHz <= 0) {
            String str4 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("!Init audio recorder failed, hz ");
            sb4.append(this.sampleRateInHz);
            Log.d(str4, sb4.toString());
            return;
        }
        String str5 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("Init audio recorder succeed, apply audio record sample rate ");
        sb5.append(this.sampleRateInHz);
        sb5.append(" buffer ");
        sb5.append(this.bufferSizeInBytes);
        sb5.append(" state ");
        sb5.append(this.audio.getState());
        Log.d(str5, sb5.toString());
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0014, code lost:
        if (r3.audio.getState() == 0) goto L_0x001b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0016, code lost:
        r3.audio.stop();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        r3.vV.closeWavFile();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0021, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0033, code lost:
        return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean stopRecording() {
        synchronized (this) {
            if (this.isRecording) {
                if (this.audio != null) {
                    this.isRecording = false;
                }
            }
            Log.d(TAG, "未启动音频模块但调用stopRecording");
            if (this.audio != null) {
                this.audio.release();
            }
        }
    }

    public void unInit() {
        if (this.audio != null) {
            try {
                if (this.audio.getState() != 0) {
                    this.audio.stop();
                }
                this.audio.release();
            } catch (Exception e) {
            }
            this.audio = null;
        }
        this.vV = null;
    }
}

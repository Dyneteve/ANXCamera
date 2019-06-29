package com.xiaomi.camera.liveshot.writer;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaMuxer;
import com.android.camera.log.Log;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Sample;
import com.xiaomi.camera.liveshot.encoder.CircularMediaEncoder.Snapshot;
import com.xiaomi.camera.liveshot.writer.SampleWriter.StatusNotifier;
import java.nio.ByteBuffer;

public class AudioSampleWriter extends SampleWriter {
    private static final boolean DEBUG = true;
    private static final String TAG = AudioSampleWriter.class.getSimpleName();
    private final Snapshot mAudioSnapshot;
    private final int mAudioTrackId;
    private final MediaMuxer mMediaMuxer;
    private final StatusNotifier<Long> mVideoFirstKeyFrameArrivedNotifier;

    public AudioSampleWriter(MediaMuxer mediaMuxer, Snapshot snapshot, int i, StatusNotifier<Long> statusNotifier) {
        this.mMediaMuxer = mediaMuxer;
        this.mAudioSnapshot = snapshot;
        this.mAudioTrackId = i;
        this.mVideoFirstKeyFrameArrivedNotifier = statusNotifier;
    }

    /* access modifiers changed from: protected */
    public void writeSample() {
        long j;
        Log.d(TAG, "writeAudioSamples: E");
        long longValue = this.mVideoFirstKeyFrameArrivedNotifier != null ? ((Long) this.mVideoFirstKeyFrameArrivedNotifier.getStatus()).longValue() : 0;
        long j2 = this.mAudioSnapshot.head;
        if (longValue < 0) {
            longValue = 0;
        }
        long j3 = j2 + longValue;
        long j4 = this.mAudioSnapshot.tail;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("writeAudioSamples: head timestamp: ");
        sb.append(this.mAudioSnapshot.head);
        sb.append(":");
        sb.append(j3);
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("writeAudioSamples: tail timestamp: ");
        sb2.append(this.mAudioSnapshot.tail);
        sb2.append(":");
        sb2.append(j4);
        Log.d(str2, sb2.toString());
        long j5 = -1;
        long j6 = 0;
        boolean z = false;
        boolean z2 = false;
        while (!z) {
            Log.d(TAG, "writeAudioSamples: take: E");
            try {
                Sample sample = (Sample) this.mAudioSnapshot.samples.take();
                Log.d(TAG, "writeAudioSamples: take: X");
                ByteBuffer byteBuffer = sample.data;
                BufferInfo bufferInfo = sample.info;
                if (bufferInfo.presentationTimeUs < j3 || j5 >= bufferInfo.presentationTimeUs - j6) {
                    j = j4;
                } else {
                    if (!z2) {
                        j6 = bufferInfo.presentationTimeUs;
                        this.mAudioSnapshot.offset = j6 - this.mAudioSnapshot.head;
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("writeAudioSamples: first audio sample timestamp: ");
                        sb3.append(j6);
                        Log.d(str3, sb3.toString());
                        z2 = true;
                    }
                    if (bufferInfo.presentationTimeUs >= j4) {
                        Log.d(TAG, "writeAudioSamples: stop writing as reaching the ending timestamp");
                        bufferInfo.flags = 4;
                    }
                    bufferInfo.presentationTimeUs -= j6;
                    this.mMediaMuxer.writeSampleData(this.mAudioTrackId, byteBuffer, bufferInfo);
                    j5 = bufferInfo.presentationTimeUs;
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("writeAudioSamples: audio sample timestamp: ");
                    boolean z3 = z2;
                    j = j4;
                    sb4.append(bufferInfo.presentationTimeUs + j6);
                    Log.d(str4, sb4.toString());
                    z2 = z3;
                }
                if (byteBuffer.limit() == 0 || (bufferInfo.flags & 4) != 0) {
                    z = true;
                    j4 = j;
                } else {
                    z = false;
                    j4 = j;
                }
            } catch (InterruptedException e) {
                j = j4;
                Log.d(TAG, "writeAudioSamples: take: meet interrupted exception");
            }
        }
        String str5 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("writeAudioSamples: X: duration: ");
        sb5.append(j5);
        Log.d(str5, sb5.toString());
        String str6 = TAG;
        StringBuilder sb6 = new StringBuilder();
        sb6.append("writeAudioSamples: X: offset: ");
        sb6.append(this.mAudioSnapshot.offset);
        Log.d(str6, sb6.toString());
    }
}

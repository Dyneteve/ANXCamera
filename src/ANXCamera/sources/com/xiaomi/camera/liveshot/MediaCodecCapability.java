package com.xiaomi.camera.liveshot;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import com.android.camera.log.Log;

public class MediaCodecCapability {
    public static final String HW_AUDIO_CODEC_AAC = "OMX.qcom.audio.encoder.aac";
    public static final String HW_VIDEO_CODEC_HEVC = "OMX.qcom.video.encoder.hevc";
    private static final String TAG = MediaCodecCapability.class.getSimpleName();
    private static MediaCodecList sRegularCodecList;

    private static MediaCodecList getRegularCodecList() {
        if (sRegularCodecList == null) {
            sRegularCodecList = new MediaCodecList(0);
        }
        return sRegularCodecList;
    }

    public static boolean isFormatSupported(MediaFormat mediaFormat, String str) {
        MediaCodecInfo[] codecInfos = getRegularCodecList().getCodecInfos();
        int i = 0;
        boolean z = false;
        while (i < codecInfos.length && !z) {
            String[] supportedTypes = codecInfos[i].getSupportedTypes();
            boolean z2 = z;
            for (int i2 = 0; i2 < supportedTypes.length && !z2; i2++) {
                if (supportedTypes[i2].equals(str)) {
                    z2 = codecInfos[i].getCapabilitiesForType(str).isFormatSupported(mediaFormat);
                }
            }
            i++;
            z = z2;
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isFormatSupported(): format = ");
        sb.append(mediaFormat);
        sb.append(", mimeType = ");
        sb.append(str);
        sb.append(", supported = ");
        sb.append(z);
        Log.d(str2, sb.toString());
        return z;
    }

    public static boolean isH265EncodingSupported() {
        MediaCodecInfo[] codecInfos = getRegularCodecList().getCodecInfos();
        boolean z = false;
        for (int i = 0; i < codecInfos.length && !z; i++) {
            MediaCodecInfo mediaCodecInfo = codecInfos[i];
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("codec.name = ");
            sb.append(mediaCodecInfo.getName());
            Log.d(str, sb.toString());
            if (mediaCodecInfo.getName().equals(HW_VIDEO_CODEC_HEVC)) {
                z = true;
            }
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("isH265EncodingSupported(): ");
        sb2.append(z);
        Log.d(str2, sb2.toString());
        return z;
    }
}

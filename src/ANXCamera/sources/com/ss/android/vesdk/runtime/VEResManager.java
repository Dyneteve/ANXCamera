package com.ss.android.vesdk.runtime;

import com.ss.android.vesdk.VEException;
import java.io.File;

public class VEResManager {
    static final String AAC_SURFIX = ".aac";
    static final String AUDIO_FOLDER = "audio";
    static final String COMPOSE_FOLDER = "compose";
    static final String CONCAT_FOLDER = "concat";
    static final String RECORD_AUDIO_SURFIX = ".wav";
    static final String RECORD_VIDEO_SURFIX = ".mp4";
    static final String SEGMENT_FOLDER = "segments";
    static final String UNDERLINE_CONCAT = "_";
    private String mWorkspace = VERuntime.getInstance().getEnv().getWorkspace();

    VEResManager() {
    }

    private String getFolder(String str) throws VEException {
        File file = new File(this.mWorkspace, str);
        if (file.exists() || file.mkdirs()) {
            return file.getAbsolutePath();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("mkdirs failed, workspace path: ");
        sb.append(this.mWorkspace);
        throw new VEException(-100, sb.toString());
    }

    public static String getFolder(String str, String str2) throws VEException {
        File file = new File(str, str2);
        if (file.exists() || file.mkdirs()) {
            return file.getAbsolutePath();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("mkdirs failed, workspace path: ");
        sb.append(str);
        throw new VEException(-100, sb.toString());
    }

    public static String getFolderByName(String str) {
        File file = new File(str);
        if (file.exists() || file.mkdirs()) {
            return file.getAbsolutePath();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("mkdirs failed, folder path:");
        sb.append(str);
        throw new VEException(-100, sb.toString());
    }

    public String genRecordAacPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(getFolder(AUDIO_FOLDER));
        sb.append(File.separator);
        sb.append(System.currentTimeMillis());
        sb.append(UNDERLINE_CONCAT);
        sb.append("record");
        sb.append(AAC_SURFIX);
        return sb.toString();
    }

    public String genRecordWavPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(getFolder(AUDIO_FOLDER));
        sb.append(File.separator);
        sb.append(System.currentTimeMillis());
        sb.append(UNDERLINE_CONCAT);
        sb.append("record");
        sb.append(RECORD_AUDIO_SURFIX);
        return sb.toString();
    }
}

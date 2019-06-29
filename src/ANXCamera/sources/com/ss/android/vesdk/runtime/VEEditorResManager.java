package com.ss.android.vesdk.runtime;

import java.io.File;

public class VEEditorResManager {
    public String[] mAudioPaths;
    private String mComposedVideoPath;
    private String mCropedAudioPath;
    private String mCropedVideoPath;
    public String[] mReverseVideoPath;
    public String[] mTransitions;
    public String[] mVideoPaths;
    private String mWorkSpace;

    public VEEditorResManager(String str) {
        this.mWorkSpace = str;
    }

    public String genComposedVideoPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkSpace, "compose"));
        sb.append(File.separator);
        sb.append(System.currentTimeMillis());
        sb.append("_");
        sb.append("composed");
        sb.append(".mp4");
        return sb.toString();
    }

    public String genReverseVideoPath(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkSpace, "concat"));
        sb.append(File.separator);
        sb.append(i);
        sb.append("_");
        sb.append("reverse");
        sb.append(".mp4");
        return sb.toString();
    }

    public String getWorkspace() {
        return this.mWorkSpace;
    }
}

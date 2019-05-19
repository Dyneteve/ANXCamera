package com.ss.android.vesdk.runtime;

import com.ss.android.vesdk.VEException;
import com.ss.android.vesdk.VEResult;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class VERecorderResManager {
    private String mConcatSegmentAudioPath;
    private String mConcatSegmentVideoPath;
    private String mConcatSementAudioVideoMixedVideoPath;
    private List<String> mSegmentAudioPathList = new ArrayList();
    private String mSegmentDirPath;
    private List<String> mSegmentVideoPathList = new ArrayList();
    private String mWorkspace;

    public VERecorderResManager(String str) {
        this.mWorkspace = str;
        StringBuilder sb = new StringBuilder();
        sb.append(this.mWorkspace);
        sb.append(File.separator);
        sb.append("segments");
        this.mSegmentDirPath = sb.toString();
    }

    public void addSegmentAudioPath(String str) {
        this.mSegmentAudioPathList.add(str);
    }

    public void addSegmentVideoPath(String str) {
        this.mSegmentVideoPathList.add(str);
    }

    public String delSegmentAudioPath() {
        return this.mSegmentAudioPathList.size() > 0 ? (String) this.mSegmentAudioPathList.remove(this.mSegmentAudioPathList.size() - 1) : "";
    }

    public String delSegmentVideoPath() throws VEException {
        if (this.mSegmentVideoPathList.size() > 0) {
            return (String) this.mSegmentVideoPathList.remove(this.mSegmentVideoPathList.size() - 1);
        }
        throw new VEException(VEResult.TER_INVALID_STAT, "segment video list size is 0");
    }

    public void genConcatSegmentAudioPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkspace, "concat"));
        sb.append(File.separator);
        sb.append("concat");
        sb.append(".wav");
        this.mConcatSegmentAudioPath = sb.toString();
    }

    public void genConcatSegmentVideoPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkspace, "concat"));
        sb.append(File.separator);
        sb.append("concat");
        sb.append(".mp4");
        this.mConcatSegmentVideoPath = sb.toString();
    }

    public String genSegmentAudioPath(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkspace, "segments"));
        sb.append(File.separator);
        sb.append(i);
        sb.append(".wav");
        return sb.toString();
    }

    public String genSegmentVideoPath(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(VEResManager.getFolder(this.mWorkspace, "segments"));
        sb.append(File.separator);
        sb.append(i);
        sb.append(".mp4");
        return sb.toString();
    }

    public String getConcatSegmentAudioPath() {
        return this.mConcatSegmentAudioPath;
    }

    public String getConcatSegmentVideoPath() {
        return this.mConcatSegmentVideoPath;
    }

    public List<String> getSegmentAudioPathList() {
        return this.mSegmentAudioPathList;
    }

    public String getSegmentDirPath() {
        return this.mSegmentDirPath;
    }

    public List<String> getSegmentVideoPathList() {
        return this.mSegmentVideoPathList;
    }

    public void release() {
        if (this.mSegmentVideoPathList != null) {
            this.mSegmentVideoPathList.clear();
            this.mSegmentVideoPathList = null;
        }
        if (this.mSegmentAudioPathList != null) {
            this.mSegmentAudioPathList.clear();
            this.mSegmentAudioPathList = null;
        }
    }
}

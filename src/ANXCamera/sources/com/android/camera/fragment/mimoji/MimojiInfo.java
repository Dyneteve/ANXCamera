package com.android.camera.fragment.mimoji;

public class MimojiInfo implements Comparable<MimojiInfo> {
    public String mAvatarTemplatePath;
    public String mConfigPath;
    public byte[] mData;
    public long mDirectoryName;
    public String mPackPath;
    public String mThumbnailUrl;

    public int compareTo(MimojiInfo mimojiInfo) {
        if (this.mDirectoryName > mimojiInfo.mDirectoryName) {
            return -1;
        }
        return this.mDirectoryName < mimojiInfo.mDirectoryName ? 1 : 0;
    }
}

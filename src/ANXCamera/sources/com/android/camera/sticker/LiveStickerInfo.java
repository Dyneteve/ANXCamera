package com.android.camera.sticker;

import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.network.download.Verifier;
import com.android.camera.network.resource.LiveResource;
import java.io.File;

public class LiveStickerInfo extends LiveResource {
    public int downloadState;
    public String hash;
    public String hint;
    public String hintIcon;
    public String icon;
    public int iconId;
    public String name;
    public String url;

    public LiveStickerInfo() {
        this.downloadState = 0;
    }

    public LiveStickerInfo(String str, String str2, int i) {
        this.downloadState = 0;
        this.isLocal = true;
        this.name = str;
        this.iconId = i;
        this.hash = str2;
    }

    public LiveStickerInfo(String str, String str2, String str3) {
        this.downloadState = 0;
        this.isLocal = true;
        this.name = str;
        StringBuilder sb = new StringBuilder();
        sb.append("file:///android_asset/live/");
        sb.append(str3);
        this.icon = sb.toString();
        this.hash = str2;
    }

    public LiveStickerInfo(String str, String str2, String str3, String str4) {
        this(str, str2, str3);
        this.hint = str4;
    }

    private boolean isLocalExists() {
        StringBuilder sb = new StringBuilder();
        sb.append(FileUtils.STICKER_RESOURCE_DIR);
        sb.append(this.hash);
        return new File(sb.toString()).exists();
    }

    public int getDownloadState() {
        if (!this.isLocal || this.downloadState != 0) {
            if ((this.downloadState == 0 || this.downloadState == 2 || this.downloadState == 4) && isDownloaded()) {
                this.downloadState = 1;
            }
        } else if (isLocalExists()) {
            this.downloadState = 1;
        }
        return this.downloadState;
    }

    public boolean isDownloaded() {
        StringBuilder sb = new StringBuilder();
        sb.append(FileUtils.STICKER_RESOURCE_DIR);
        sb.append(this.hash);
        sb.append(FileUtils.SUFFIX);
        File file = new File(sb.toString());
        if (!file.exists()) {
            return false;
        }
        byte[] hash2 = Verifier.hash(file, "MD5", 32768);
        if (this.hash.length() != hash2.length * 2) {
            return false;
        }
        for (int i = 0; i < hash2.length; i++) {
            int i2 = i * 2;
            if (hash2[i] != ((byte) ((Character.digit(this.hash.charAt(i2), 16) << 4) | Character.digit(this.hash.charAt(i2 + 1), 16)))) {
                return false;
            }
        }
        return true;
    }
}

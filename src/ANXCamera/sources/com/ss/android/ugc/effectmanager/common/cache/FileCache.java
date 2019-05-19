package com.ss.android.ugc.effectmanager.common.cache;

import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.utils.FileUtils;
import java.io.File;
import java.io.InputStream;

public class FileCache implements ICache {
    private EffectConfiguration mConfiguration;

    public FileCache(EffectConfiguration effectConfiguration) {
        this.mConfiguration = effectConfiguration;
    }

    public void clear() {
        FileUtils.removeDir(this.mConfiguration.getEffectDir());
    }

    public boolean has(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mConfiguration.getEffectDir());
        sb.append(File.separator);
        sb.append(str);
        return FileUtils.checkFileExists(sb.toString());
    }

    public InputStream queryToStream(String str) {
        InputStream fileStream;
        StringBuilder sb = new StringBuilder();
        sb.append(this.mConfiguration.getEffectDir().getPath());
        sb.append(File.separator);
        sb.append(str);
        String sb2 = sb.toString();
        synchronized (FileCache.class) {
            fileStream = FileUtils.getFileStream(sb2);
        }
        return fileStream;
    }

    public String queryToString(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mConfiguration.getEffectDir().getPath());
        sb.append(File.separator);
        sb.append(str);
        String sb2 = sb.toString();
        synchronized (FileCache.class) {
            String fileContent = FileUtils.getFileContent(sb2);
            if (!TextUtils.isEmpty(fileContent)) {
                return fileContent;
            }
            String str2 = "";
            return str2;
        }
    }

    public boolean remove(String str) {
        boolean removeFile;
        synchronized (FileCache.class) {
            StringBuilder sb = new StringBuilder();
            sb.append(this.mConfiguration.getEffectDir());
            sb.append(File.separator);
            sb.append(str);
            removeFile = FileUtils.removeFile(sb.toString());
        }
        return removeFile;
    }

    public void save(String str, String str2) {
        synchronized (FileCache.class) {
            StringBuilder sb = new StringBuilder();
            sb.append(this.mConfiguration.getEffectDir());
            sb.append(File.separator);
            sb.append(str);
            FileUtils.writeToExternal(str2, sb.toString());
        }
    }
}

package com.android.camera.fragment.music;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MusicUtils {
    public static List<LiveMusicInfo> getMusicListFromLocalFolder(String str, Context context) {
        File[] listFiles;
        ArrayList arrayList = new ArrayList();
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        File file = new File(str);
        if (file.listFiles() != null) {
            for (File file2 : file.listFiles()) {
                if (file2.isFile()) {
                    String name = file2.getName();
                    if (name.contains(".mp3")) {
                        LiveMusicInfo liveMusicInfo = new LiveMusicInfo();
                        mediaMetadataRetriever.setDataSource(file2.getAbsolutePath());
                        String extractMetadata = mediaMetadataRetriever.extractMetadata(7);
                        if (extractMetadata == null) {
                            extractMetadata = name.substring(0, name.length() - 4);
                        }
                        liveMusicInfo.mTitle = extractMetadata;
                        String extractMetadata2 = mediaMetadataRetriever.extractMetadata(1);
                        if (extractMetadata2 == null) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(FileUtils.MUSIC_LOCAL);
                            sb.append(extractMetadata);
                            sb.append(".png");
                            extractMetadata2 = sb.toString();
                        }
                        liveMusicInfo.mThumbnailUrl = extractMetadata2;
                        String extractMetadata3 = mediaMetadataRetriever.extractMetadata(2);
                        if (extractMetadata3 == null) {
                            extractMetadata3 = "小米短视频";
                        }
                        liveMusicInfo.mAuthor = extractMetadata3;
                        String extractMetadata4 = mediaMetadataRetriever.extractMetadata(9);
                        liveMusicInfo.mDuration = extractMetadata4.substring(0, extractMetadata4.length() - 3);
                        liveMusicInfo.mPlayUrl = file2.getAbsolutePath();
                        arrayList.add(liveMusicInfo);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(liveMusicInfo.mAuthor);
                        sb2.append(", ");
                        sb2.append(liveMusicInfo.mTitle);
                        sb2.append(", ");
                        sb2.append(liveMusicInfo.mPlayUrl);
                        sb2.append(",");
                        sb2.append(liveMusicInfo.mThumbnailUrl);
                        sb2.append(",");
                        sb2.append(liveMusicInfo.mDuration);
                        Log.d("LiveMusicInfo", sb2.toString());
                    }
                }
            }
        }
        mediaMetadataRetriever.release();
        return arrayList;
    }
}

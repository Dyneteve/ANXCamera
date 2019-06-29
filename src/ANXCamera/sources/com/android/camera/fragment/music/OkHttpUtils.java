package com.android.camera.fragment.music;

import com.android.camera.fragment.music.FragmentLiveMusic.Mp3DownloadCallback;
import com.android.camera.log.Log;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request.Builder;
import okhttp3.Response;

public class OkHttpUtils {
    /* access modifiers changed from: private */
    public static final String TAG = OkHttpUtils.class.getSimpleName();
    private static final OkHttpClient client = new OkHttpClient();

    private static String buildUrlParams(Map<String, String> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (Entry entry : map.entrySet()) {
            if (sb.length() > 0) {
                sb.append("&");
            }
            sb.append((String) entry.getKey());
            sb.append("=");
            sb.append((String) entry.getValue());
        }
        return sb.toString();
    }

    private static Call createGetCall(String str, Map<String, String> map) {
        String buildUrlParams = buildUrlParams(map);
        Builder builder = new Builder().get();
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append('?');
        sb.append(buildUrlParams);
        return client.newCall(builder.url(sb.toString()).build());
    }

    public static void downloadMp3Async(String str, final String str2, final Mp3DownloadCallback mp3DownloadCallback) {
        new OkHttpClient.Builder().connectTimeout(5, TimeUnit.SECONDS).writeTimeout(5, TimeUnit.SECONDS).readTimeout(5, TimeUnit.SECONDS).build().newCall(new Builder().url(str).build()).enqueue(new Callback() {
            public void onFailure(Call call, IOException iOException) {
                String access$000 = OkHttpUtils.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("download mp3 async failed with exception ");
                sb.append(iOException.getMessage());
                Log.e(access$000, sb.toString());
                Mp3DownloadCallback.this.onFailed();
            }

            public void onResponse(Call call, Response response) {
                Log.d(OkHttpUtils.TAG, "onResponse");
                try {
                    byte[] bytes = response.body().bytes();
                    PrintStream printStream = new PrintStream(str2);
                    printStream.write(bytes, 0, bytes.length);
                    printStream.close();
                    Mp3DownloadCallback.this.onCompleted();
                } catch (IOException e) {
                    String access$000 = OkHttpUtils.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("download mp3 async failed with exception ");
                    sb.append(e.getMessage());
                    Log.e(access$000, sb.toString());
                    File file = new File(str2);
                    if (file.exists()) {
                        file.delete();
                    }
                    Mp3DownloadCallback.this.onFailed();
                }
            }
        });
    }

    public static void get(String str, Map<String, String> map, Callback callback) {
        createGetCall(str, map).enqueue(callback);
    }
}

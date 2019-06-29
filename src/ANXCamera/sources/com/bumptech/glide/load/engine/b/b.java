package com.bumptech.glide.load.engine.b;

import android.os.Build.VERSION;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy;
import java.io.File;
import java.io.FilenameFilter;
import java.util.regex.Pattern;

/* compiled from: RuntimeCompat */
final class b {
    private static final String TAG = "GlideRuntimeCompat";
    private static final String ka = "cpu[0-9]+";
    private static final String kb = "/sys/devices/system/cpu/";

    private b() {
    }

    static int availableProcessors() {
        int availableProcessors = Runtime.getRuntime().availableProcessors();
        return VERSION.SDK_INT < 17 ? Math.max(cv(), availableProcessors) : availableProcessors;
    }

    /* JADX INFO: finally extract failed */
    private static int cv() {
        File[] fileArr;
        ThreadPolicy allowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            File file = new File(kb);
            final Pattern compile = Pattern.compile(ka);
            fileArr = file.listFiles(new FilenameFilter() {
                public boolean accept(File file, String str) {
                    return compile.matcher(str).matches();
                }
            });
            StrictMode.setThreadPolicy(allowThreadDiskReads);
        } catch (Throwable th) {
            StrictMode.setThreadPolicy(allowThreadDiskReads);
            throw th;
        }
        return Math.max(1, fileArr != null ? fileArr.length : 0);
    }
}

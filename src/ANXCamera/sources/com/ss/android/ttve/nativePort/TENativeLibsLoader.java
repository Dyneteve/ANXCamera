package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import android.util.Log;
import com.ss.android.medialib.NativePort.NativeLibsLoader;

@Keep
public class TENativeLibsLoader {
    private static final String TAG = TENativeLibsLoader.class.getSimpleName();
    private static ILibraryLoader mLibraryLoader = new DefaultLibraryLoader();
    private static boolean sLibraryLoaded = false;

    public static class DefaultLibraryLoader implements ILibraryLoader {
        public boolean load(String str) {
            System.loadLibrary(str);
            return true;
        }
    }

    public interface ILibraryLoader {
        boolean load(String str);
    }

    public static void loadLibrary() {
        NativeLibsLoader.loadLibrary();
        if (!sLibraryLoaded) {
            safeLoadSo("ttffmpeg");
            safeLoadSo("tt_effect");
            safeLoadSo("ttyuv");
            safeLoadSo("ttaudioeffect");
            safeLoadSo("ttvideoeditor");
            sLibraryLoaded = true;
        }
    }

    private static void safeLoadSo(String str) {
        try {
            if (mLibraryLoader != null) {
                mLibraryLoader.load(str);
            } else {
                System.loadLibrary(str);
            }
        } catch (Throwable th) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Load native library [");
            sb.append(str);
            sb.append("] failed : ");
            sb.append(th.getMessage());
            Log.e(str2, sb.toString());
        }
    }

    public static void setLibraryLoad(ILibraryLoader iLibraryLoader) {
        mLibraryLoader = iLibraryLoader;
    }
}

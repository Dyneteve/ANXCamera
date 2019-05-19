package com.xiaomi.camera.base;

import com.android.camera.log.Log;

public final class PerformanceTracker {
    public static final int END = 1;
    private static final String END_TAG = "[  END]";
    private static final String EVENT_ALGORITHM_PROCESS = "[AlgorithmProcess]";
    private static final String EVENT_CLEAR_SHOT = "[       ClearShot]";
    private static final String EVENT_IMAGE_SAVER = "[      ImageSaver]";
    private static final String EVENT_JPEG_REPROCESS = "[   JpegReprocess]";
    private static final String EVENT_PICTURE_CAPTURE = "[    PictureTaken]";
    public static final int START = 0;
    private static final String START_TAG = "[START]";
    private static final String TAG = "[PERFORMANCE]";
    private static final boolean isEnable = true;

    public static synchronized void trackAlgorithmProcess(String str, int i) {
        synchronized (PerformanceTracker.class) {
            if (i == 0) {
                String str2 = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("[AlgorithmProcess][START]");
                    sb.append(str);
                    sb.append("[");
                    sb.append(System.currentTimeMillis());
                    sb.append("]");
                    Log.i(str2, sb.toString());
                } catch (Throwable th) {
                    throw th;
                }
            } else if (i == 1) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[AlgorithmProcess][  END]");
                sb2.append(str);
                sb2.append("[");
                sb2.append(System.currentTimeMillis());
                sb2.append("]");
                Log.i(str3, sb2.toString());
            }
        }
    }

    public static synchronized void trackClearShotProcess(String str, int i) {
        synchronized (PerformanceTracker.class) {
            if (i == 0) {
                String str2 = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("[       ClearShot][START]");
                    sb.append(str);
                    sb.append("[");
                    sb.append(System.currentTimeMillis());
                    sb.append("]");
                    Log.i(str2, sb.toString());
                } catch (Throwable th) {
                    throw th;
                }
            } else if (i == 1) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[       ClearShot][  END]");
                sb2.append(str);
                sb2.append("[");
                sb2.append(System.currentTimeMillis());
                sb2.append("]");
                Log.i(str3, sb2.toString());
            }
        }
    }

    public static synchronized void trackImageSaver(Object obj, int i) {
        synchronized (PerformanceTracker.class) {
            if (i == 0) {
                String str = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("[      ImageSaver][START][");
                    sb.append(obj);
                    sb.append("][");
                    sb.append(System.currentTimeMillis());
                    sb.append("]");
                    Log.i(str, sb.toString());
                } catch (Throwable th) {
                    throw th;
                }
            } else if (i == 1) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[      ImageSaver][  END][");
                sb2.append(obj);
                sb2.append("][");
                sb2.append(System.currentTimeMillis());
                sb2.append("]");
                Log.i(str2, sb2.toString());
            }
        }
    }

    public static synchronized void trackJpegReprocess(int i, int i2) {
        synchronized (PerformanceTracker.class) {
            String str = null;
            switch (i) {
                case 0:
                    str = "[EFFECT]";
                    break;
                case 1:
                    str = "[   RAW]";
                    break;
                case 2:
                    str = "[ DEPTH]";
                    break;
            }
            if (i2 == 0) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[   JpegReprocess][START]");
                sb.append(str);
                sb.append("[");
                sb.append(System.currentTimeMillis());
                sb.append("]");
                Log.i(str2, sb.toString());
            } else if (i2 == 1) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[   JpegReprocess][  END]");
                sb2.append(str);
                sb2.append("[");
                sb2.append(System.currentTimeMillis());
                sb2.append("]");
                Log.i(str3, sb2.toString());
            }
        }
    }

    public static synchronized void trackPictureCapture(int i) {
        synchronized (PerformanceTracker.class) {
            if (i == 0) {
                String str = TAG;
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("[    PictureTaken][START][");
                    sb.append(System.currentTimeMillis());
                    sb.append("]");
                    Log.i(str, sb.toString());
                } catch (Throwable th) {
                    throw th;
                }
            } else if (i == 1) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[    PictureTaken][  END][");
                sb2.append(System.currentTimeMillis());
                sb2.append("]");
                Log.i(str2, sb2.toString());
            }
        }
    }
}

package com.android.volley;

import android.os.SystemClock;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* renamed from: com.android.volley.VolleyLog reason: case insensitive filesystem */
public class C0032VolleyLog {
    public static boolean DEBUG = Log.isLoggable(TAG, 2);
    public static String TAG = "Volley";

    /* renamed from: com.android.volley.VolleyLog$MarkerLog */
    static class MarkerLog {
        public static final boolean ENABLED = C0032VolleyLog.DEBUG;
        private static final long MIN_DURATION_FOR_LOGGING_MS = 0;
        private boolean mFinished = false;
        private final List<Marker> mMarkers = new ArrayList();

        /* renamed from: com.android.volley.VolleyLog$MarkerLog$Marker */
        private static class Marker {
            public final String name;
            public final long thread;
            public final long time;

            public Marker(String name2, long thread2, long time2) {
                this.name = name2;
                this.thread = thread2;
                this.time = time2;
            }
        }

        MarkerLog() {
        }

        public synchronized void add(String name, long threadId) {
            if (!this.mFinished) {
                List<Marker> list = this.mMarkers;
                Marker marker = new Marker(name, threadId, SystemClock.elapsedRealtime());
                list.add(marker);
            } else {
                throw new IllegalStateException("Marker added to finished log");
            }
        }

        public synchronized void finish(String header) {
            synchronized (this) {
                try {
                    this.mFinished = true;
                    long duration = getTotalDuration();
                    if (duration > 0) {
                        long prevTime = ((Marker) this.mMarkers.get(0)).time;
                        C0032VolleyLog.d("(%-4d ms) %s", Long.valueOf(duration), header);
                        for (Marker marker : this.mMarkers) {
                            long thisTime = marker.time;
                            String str = "(+%-4d) [%2d] %s";
                            Object[] objArr = new Object[3];
                            try {
                                objArr[0] = Long.valueOf(thisTime - prevTime);
                                objArr[1] = Long.valueOf(marker.thread);
                                objArr[2] = marker.name;
                                C0032VolleyLog.d(str, objArr);
                                prevTime = thisTime;
                            } catch (Throwable th) {
                                th = th;
                                throw th;
                            }
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }

        /* access modifiers changed from: protected */
        public void finalize() throws Throwable {
            if (!this.mFinished) {
                finish("Request on the loose");
                C0032VolleyLog.e("Marker log finalized without finish() - uncaught exit point for request", new Object[0]);
            }
        }

        private long getTotalDuration() {
            if (this.mMarkers.size() == 0) {
                return 0;
            }
            return ((Marker) this.mMarkers.get(this.mMarkers.size() - 1)).time - ((Marker) this.mMarkers.get(0)).time;
        }
    }

    public static void setTag(String tag) {
        d("Changing log tag to %s", tag);
        TAG = tag;
        DEBUG = Log.isLoggable(TAG, 2);
    }

    public static void v(String format, Object... args) {
        if (DEBUG) {
            Log.v(TAG, buildMessage(format, args));
        }
    }

    public static void d(String format, Object... args) {
        Log.d(TAG, buildMessage(format, args));
    }

    public static void e(String format, Object... args) {
        Log.e(TAG, buildMessage(format, args));
    }

    public static void e(Throwable tr, String format, Object... args) {
        Log.e(TAG, buildMessage(format, args), tr);
    }

    public static void wtf(String format, Object... args) {
        Log.wtf(TAG, buildMessage(format, args));
    }

    public static void wtf(Throwable tr, String format, Object... args) {
        Log.wtf(TAG, buildMessage(format, args), tr);
    }

    private static String buildMessage(String format, Object... args) {
        String msg = args == null ? format : String.format(Locale.US, format, args);
        StackTraceElement[] trace = new Throwable().fillInStackTrace().getStackTrace();
        String caller = "<unknown>";
        int i = 2;
        while (true) {
            if (i >= trace.length) {
                break;
            } else if (!trace[i].getClass().equals(C0032VolleyLog.class)) {
                String callingClass = trace[i].getClassName();
                String callingClass2 = callingClass.substring(callingClass.lastIndexOf(46) + 1);
                String callingClass3 = callingClass2.substring(callingClass2.lastIndexOf(36) + 1);
                StringBuilder sb = new StringBuilder();
                sb.append(callingClass3);
                sb.append(".");
                sb.append(trace[i].getMethodName());
                caller = sb.toString();
                break;
            } else {
                i++;
            }
        }
        return String.format(Locale.US, "[%d] %s: %s", new Object[]{Long.valueOf(Thread.currentThread().getId()), caller, msg});
    }
}

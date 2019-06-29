package com.ss.android.vesdk.runtime.cloudconfig;

import android.content.Context;
import android.graphics.Point;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.StatFs;
import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v4.util.ArraySet;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.util.Set;
import java.util.regex.Pattern;

public class DeviceInfoUtils {
    private static final String CPU_FILE = "/proc/cpuinfo";
    private static final String HARDWARE_PATTERN = "Hardware";
    private static final String TAG = "DeviceInfoUtils";
    private static String sCpuHardware = null;

    private static void closeQuietly(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static long getExternalStorage(Context context) {
        String str;
        try {
            str = Environment.getExternalStorageDirectory().getAbsolutePath();
        } catch (Exception e) {
            str = "/sdcard";
        }
        try {
            StatFs statFs = new StatFs(str);
            return VERSION.SDK_INT >= 18 ? (statFs.getBlockCountLong() * statFs.getBlockSizeLong()) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED : (((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED;
        } catch (Exception e2) {
            return -1;
        }
    }

    public static long getInternalStorage() {
        StatFs statFs = new StatFs(Environment.getDataDirectory().getAbsolutePath());
        return VERSION.SDK_INT >= 18 ? (statFs.getBlockCountLong() * statFs.getBlockSizeLong()) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED : (((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize())) / PlaybackStateCompat.ACTION_SET_CAPTIONING_ENABLED;
    }

    public static String getMaxCpuFreq() {
        String str = "";
        try {
            InputStream inputStream = new ProcessBuilder(new String[]{"/system/bin/cat", "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"}).start().getInputStream();
            byte[] bArr = new byte[24];
            while (inputStream.read(bArr) != -1) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(new String(bArr));
                str = sb.toString();
            }
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
            str = "N/A";
        }
        return str.trim();
    }

    public static int getNumOfCores() {
        try {
            return new File("/sys/devices/system/cpu/").listFiles(new FileFilter() {
                public boolean accept(File file) {
                    return Pattern.matches("cpu[0-9]", file.getName());
                }
            }).length;
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
    }

    public static int getRealScreenHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        if (VERSION.SDK_INT >= 17) {
            Point point = new Point();
            defaultDisplay.getRealSize(point);
            i = point.y;
        } else {
            try {
                i = ((Integer) Display.class.getMethod("getRawHeight", new Class[0]).invoke(defaultDisplay, new Object[0])).intValue();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
            } catch (InvocationTargetException e3) {
                e3.printStackTrace();
            } catch (NoSuchMethodException e4) {
                e4.printStackTrace();
            }
        }
        return i;
    }

    public static int getScreenHeight(Context context) {
        if (context == null) {
            return 0;
        }
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.heightPixels;
    }

    public static int getScreenWidth(Context context) {
        if (context == null) {
            return 0;
        }
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        return displayMetrics.widthPixels;
    }

    public static Set<Sensor> getSensorUsability(Context context) {
        ArraySet arraySet = new ArraySet();
        SensorManager sensorManager = (SensorManager) context.getSystemService("sensor");
        if (sensorManager == null) {
            return arraySet;
        }
        for (int defaultSensor : new int[]{1, 13, 9, 4, 5, 10, 2, 3, 6, 8, 12, 11, 7, 15}) {
            Sensor defaultSensor2 = sensorManager.getDefaultSensor(defaultSensor);
            if (defaultSensor2 != null) {
                arraySet.add(defaultSensor2);
            }
        }
        return arraySet;
    }

    public static String getSimOperator(Context context) {
        try {
            return ((TelephonyManager) context.getSystemService("phone")).getSimOperator();
        } catch (Exception e) {
            Log.w(TAG, "No permission");
            return "";
        }
    }

    public static long getTotalMemory() {
        long j = 0;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            String readLine = bufferedReader.readLine();
            String[] split = readLine.split("\\s+");
            for (String str : split) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("/t");
                Log.i(readLine, sb.toString());
            }
            j = (long) Integer.valueOf(split[1]).intValue();
            bufferedReader.close();
        } catch (IOException e) {
        }
        return j / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID;
    }

    public static String readCpuHardware() {
        BufferedReader bufferedReader;
        Reader reader;
        Throwable th;
        if (!TextUtils.isEmpty(sCpuHardware)) {
            return sCpuHardware;
        }
        try {
            reader = new FileReader(CPU_FILE);
            try {
                bufferedReader = new BufferedReader(reader);
                try {
                    String readLine = bufferedReader.readLine();
                    while (true) {
                        if (readLine == null) {
                            break;
                        }
                        if (readLine.startsWith(HARDWARE_PATTERN) && readLine.contains(":")) {
                            String substring = readLine.substring(readLine.indexOf(":") + 1);
                            if (!TextUtils.isEmpty(substring)) {
                                sCpuHardware = substring.trim();
                                break;
                            }
                        }
                        readLine = bufferedReader.readLine();
                    }
                    String str = sCpuHardware;
                    closeQuietly(bufferedReader);
                    closeQuietly(reader);
                    return str;
                } catch (IOException e) {
                    closeQuietly(bufferedReader);
                    closeQuietly(reader);
                    return null;
                } catch (Throwable th2) {
                    th = th2;
                    closeQuietly(bufferedReader);
                    closeQuietly(reader);
                    throw th;
                }
            } catch (IOException e2) {
                bufferedReader = null;
                closeQuietly(bufferedReader);
                closeQuietly(reader);
                return null;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                bufferedReader = null;
                th = th4;
                closeQuietly(bufferedReader);
                closeQuietly(reader);
                throw th;
            }
        } catch (IOException e3) {
            reader = null;
            bufferedReader = null;
            closeQuietly(bufferedReader);
            closeQuietly(reader);
            return null;
        } catch (Throwable th5) {
            bufferedReader = null;
            th = th5;
            reader = null;
            closeQuietly(bufferedReader);
            closeQuietly(reader);
            throw th;
        }
    }
}

package com.android.camera;

import android.location.Location;
import android.media.ExifInterface;
import android.os.Build;
import android.text.TextUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface.GpsLongitudeRef;
import com.mi.config.b;
import java.io.File;
import java.io.FileDescriptor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class ExifHelper {
    private static final String DATETIME_FORMAT_STR = "yyyy:MM:dd HH:mm:ss";
    private static final String GPS_DATE_FORMAT_STR = "yyyy:MM:dd";
    private static final String GPS_TIME_FORMAT_STR = "HH:mm:ss";
    private static final String TAG = "ExifHelper";
    private static DateFormat mDateTimeStampFormat = new SimpleDateFormat(DATETIME_FORMAT_STR);
    private static DateFormat mGPSDateStampFormat = new SimpleDateFormat(GPS_DATE_FORMAT_STR);
    private static DateFormat mGPSTimeStampFormat = new SimpleDateFormat(GPS_TIME_FORMAT_STR);

    static {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        mGPSDateStampFormat.setTimeZone(timeZone);
        mGPSTimeStampFormat.setTimeZone(timeZone);
    }

    public static String convertDoubleToLaLon(double d) {
        int floor = (int) Math.floor(Math.abs(d));
        double d2 = (double) floor;
        double floor2 = Math.floor((Math.abs(d) - d2) * 60.0d);
        double floor3 = Math.floor(((Math.abs(d) - d2) - (floor2 / 60.0d)) * 3600000.0d);
        if (d < 0.0d) {
            StringBuilder sb = new StringBuilder();
            sb.append("-");
            sb.append(floor);
            sb.append("/1,");
            sb.append((int) floor2);
            sb.append("/1,");
            sb.append((int) floor3);
            sb.append("/1000");
            return sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(floor);
        sb2.append("/1,");
        sb2.append((int) floor2);
        sb2.append("/1,");
        sb2.append((int) floor3);
        sb2.append("/1000");
        return sb2.toString();
    }

    private static String getExifOrientation(int i) {
        if (i == 0) {
            return String.valueOf(1);
        }
        if (i == 90) {
            return String.valueOf(6);
        }
        if (i == 180) {
            return String.valueOf(3);
        }
        if (i == 270) {
            return String.valueOf(8);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("invalid: ");
        sb.append(i);
        throw new AssertionError(sb.toString());
    }

    private static void writeExif(String str, FileDescriptor fileDescriptor, int i, Location location, long j) {
        try {
            if (TextUtils.isEmpty(str) || (Util.isPathExist(str) && new File(str).length() != 0)) {
                ExifInterface exifInterface = fileDescriptor == null ? new ExifInterface(str) : new ExifInterface(fileDescriptor);
                exifInterface.setAttribute("GPSDateStamp", mGPSDateStampFormat.format(Long.valueOf(j)));
                exifInterface.setAttribute("GPSTimeStamp", mGPSTimeStampFormat.format(Long.valueOf(j)));
                exifInterface.setAttribute("DateTime", mDateTimeStampFormat.format(Long.valueOf(j)));
                exifInterface.setAttribute("Orientation", getExifOrientation(i));
                exifInterface.setAttribute("Make", Build.MANUFACTURER);
                if (location != null) {
                    double latitude = location.getLatitude();
                    double longitude = location.getLongitude();
                    exifInterface.setAttribute("GPSLatitude", convertDoubleToLaLon(latitude));
                    exifInterface.setAttribute("GPSLongitude", convertDoubleToLaLon(longitude));
                    if (latitude > 0.0d) {
                        exifInterface.setAttribute("GPSLatitudeRef", "N");
                    } else {
                        exifInterface.setAttribute("GPSLatitudeRef", "S");
                    }
                    if (longitude > 0.0d) {
                        exifInterface.setAttribute("GPSLongitudeRef", GpsLongitudeRef.EAST);
                    } else {
                        exifInterface.setAttribute("GPSLongitudeRef", GpsLongitudeRef.WEST);
                    }
                }
                if (!b.qw) {
                    if (!b.IS_MI2A) {
                        exifInterface.setAttribute("Model", b.qv);
                        exifInterface.saveAttributes();
                        return;
                    }
                }
                exifInterface.setAttribute("Model", "MiTwo");
                exifInterface.setAttribute("FocalLength", String.valueOf("354/100"));
                exifInterface.saveAttributes();
                return;
            }
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("writeExif. the file:[");
            sb.append(str);
            sb.append("] is not exist or empty");
            Log.e(str2, sb.toString());
        } catch (Exception e) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("write exif error, filePath = ");
            sb2.append(str);
            Log.w(str3, sb2.toString(), e);
        }
    }

    public static void writeExifByFd(FileDescriptor fileDescriptor, int i, Location location, long j) {
        writeExif(null, fileDescriptor, i, location, j);
    }

    public static void writeExifByFilePath(String str, int i, Location location, long j) {
        writeExif(str, null, i, location, j);
    }
}

package com.android.camera;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.YuvImage;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.MeteringRectangle;
import android.location.Country;
import android.location.CountryDetector;
import android.location.Location;
import android.media.Image;
import android.media.Image.Plane;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Environment;
import android.os.IPowerManager;
import android.os.ParcelFileDescriptor;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings;
import android.provider.Settings.Global;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.support.annotation.NonNull;
import android.support.v4.app.FrameMetricsAggregator;
import android.support.v4.os.EnvironmentCompat;
import android.support.v4.view.ViewCompat;
import android.telephony.TelephonyManager;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.util.Xml;
import android.view.IWindowManager;
import android.view.IWindowManager.Stub;
import android.view.KeyEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.AlphaAnimation;
import android.widget.Button;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigRatio;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.MiYuvImage;
import com.android.camera.effect.renders.CustomTextWaterMark;
import com.android.camera.effect.renders.NewStyleTextWaterMark;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.lib.compatibility.util.CompatibilityUtils.PackageInstallerListener;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.network.download.Verifier;
import com.android.camera.permission.PermissionManager;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.ArcsoftDepthMap;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CaptureResultParser;
import com.android.camera2.vendortag.struct.AECFrameControl;
import com.android.camera2.vendortag.struct.AFFrameControl;
import com.android.gallery3d.exif.ExifInterface;
import com.android.gallery3d.exif.ExifInterface.GpsSpeedRef;
import com.android.gallery3d.ui.StringTexture;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import com.mi.config.b;
import com.mi.config.d;
import com.ss.android.ttve.BuildConfig;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.liveshot.LivePhotoResult;
import com.xiaomi.protocol.ICustomCaptureResult;
import dalvik.system.VMRuntime;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.TimeZone;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import miui.hardware.display.DisplayFeatureManager;
import miui.os.Build;
import miui.reflect.Field;
import miui.reflect.Method;
import miui.reflect.NoSuchClassException;
import miui.reflect.NoSuchFieldException;
import miui.reflect.NoSuchMethodException;
import miui.util.IOUtils;
import miui.view.animation.SineEaseInOutInterpolator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

public final class Util {
    public static final String ACTION_BIND_GALLERY_SERVICE = "com.miui.gallery.action.BIND_SERVICE";
    public static final String ACTION_DISMISS_KEY_GUARD = "xiaomi.intent.action.SHOW_SECURE_KEYGUARD";
    public static final String ACTION_KILL_CAMERA_SERVICE = "com.android.camera.action.KILL_CAMERA_SERVICE";
    public static final String ALGORITHM_NAME_MIMOJI_CAPTURE = "mimoji";
    public static final String ALGORITHM_NAME_PORTRAIT = "portrait";
    public static final String ALGORITHM_NAME_SOFT_PORTRAIT = "soft-portrait";
    public static final String ALGORITHM_NAME_SOFT_PORTRAIT_ENCRYPTED = "soft-portrait-enc";
    public static final String ANDROID_ONE_EXTRA_IS_SECURE_MODE = "com.google.android.apps.photos.api.secure_mode";
    public static final String ANDROID_ONE_EXTRA_SECURE_MODE_MEDIA_STORE_IDS = "com.google.android.apps.photos.api.secure_mode_ids";
    public static final String ANDROID_ONE_REVIEW_ACTIVITY_PACKAGE = "com.google.android.apps.photos";
    private static HashSet<String> ANTIBANDING_60_COUNTRY = new HashSet<>(Arrays.asList(new String[]{"TW", "KR", "SA", "US", "CA", "BR", "CO", "MX", "PH"}));
    public static final double ASPECT_TOLERANCE = 0.02d;
    public static final int BLUR_DURATION = 100;
    private static final List<Integer> COLOR_TEMPERATURE_LIST = new ArrayList();
    private static final List<Integer> COLOR_TEMPERATURE_MAP = new ArrayList();
    public static final boolean DEBUG = (!Build.IS_STABLE_VERSION);
    public static final String EXTRAS_SKIP_LOCK = "skip_interception";
    private static final String EXTRAS_START_WITH_EFFECT_RENDER = "android.intent.extras.START_WITH_EFFECT_RENDER";
    public static final int FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS = Integer.MIN_VALUE;
    private static final String FORCE_CAMERA_0_FILE = "force_camera_0";
    private static final String FORCE_NAME_SUFFIX_FILE = "force_name_suffix";
    public static final int GOING_TO_CROP = 5;
    public static final int GOING_TO_DETAIL = 3;
    public static final int GOING_TO_GALLERY = 1;
    public static final int GOING_TO_PLAYBACK = 4;
    public static final int GOING_TO_SETTING = 2;
    public static final float GYROSCOPE_MAX_X = 0.7f;
    public static final float GYROSCOPE_MAX_Y = 5.0f;
    public static final float GYROSCOPE_MAX_Z = 0.7f;
    private static final File INTERNAL_STORAGE_DIRECTORY = new File("/data/sdcard");
    public static final int KEYCODE_SLIDE_OFF = 701;
    public static final int KEYCODE_SLIDE_ON = 700;
    public static final String KEY_CAMERA_BRIGHTNESS = "camera-brightness";
    public static final String KEY_CAMERA_BRIGHTNESS_AUTO = "camera-brightness-auto";
    public static final String KEY_CAMERA_BRIGHTNESS_MANUAL = "camera-brightness-manual";
    public static final String KEY_KILLED_MODULE_INDEX = "killed-moduleIndex";
    public static final String KEY_REVIEW_FROM_MIUICAMERA = "from_MiuiCamera";
    public static final String KEY_SECURE_ITEMS = "SecureUri";
    private static final String LAB_OPTIONS_VISIBLE_FILE = "lab_options_visible";
    public static final String LAST_FRAME_GAUSSIAN_FILE_NAME = "blur.jpg";
    public static final int LIMIT_SURFACE_WIDTH = 720;
    public static final int MAX_SECURE_SIZE = 100;
    private static final String NONUI_MODE_PROPERTY = "sys.power.nonui";
    public static final int ORIENTATION_HYSTERESIS = 5;
    public static final String QRCODE_RECEIVER_ACTION = "com.xiaomi.scanner.receiver.senderbarcodescanner";
    public static final float RATIO_16_9 = 1.77f;
    public static final float RATIO_18_9 = 2.0f;
    public static final float RATIO_19P5_9 = 2.16f;
    public static final float RATIO_19_9 = 2.11f;
    public static final float RATIO_1_1 = 1.0f;
    public static final float RATIO_4_3 = 1.33f;
    public static final String REVIEW_ACTION = "com.android.camera.action.REVIEW";
    public static final String REVIEW_ACTIVITY_PACKAGE = "com.miui.gallery";
    public static final String REVIEW_SCAN_RESULT_PACKAGE = "com.xiaomi.scanner";
    public static final int SCREEN_EFFECT_CAMERA_STATE = 14;
    public static final Uri SCREEN_SLIDE_STATUS_SETTING_URI = System.getUriFor("sc_status");
    private static final String SCREEN_VENDOR = SystemProperties.get("sys.panel.display");
    private static final String TAG = "CameraUtil";
    private static final String TEMP_SUFFIX = ".tmp";
    public static final String WATERMARK_FILE_NAME;
    public static final File WATERMARK_STORAGE_DIRECTORY = new File("/mnt/vendor/persist/camera");
    public static final String WATERMARK_ULTRA_PIXEL_FILE_NAME;
    private static final String ZOOM_ANIMATION_PROPERTY = "camera_zoom_animation";
    public static boolean isLongRatioScreen;
    public static boolean isNotchDevice;
    private static String mCountryIso = null;
    private static int mLockedOrientation = -1;
    public static String sAAID;
    private static boolean sClearMemoryLimit;
    public static int sFullScreenExtraMargin;
    private static boolean sHasNavigationBar;
    private static ImageFileNamer sImageFileNamer;
    private static boolean sIsAccessibilityEnable;
    private static Boolean sIsDumpImageEnabled;
    public static boolean sIsDumpLog;
    public static boolean sIsDumpOrigJpg;
    private static Boolean sIsForceNameSuffix;
    public static boolean sIsFullScreenNavBarHidden;
    public static boolean sIsKillCameraService;
    private static Boolean sIsLabOptionsVisible;
    public static boolean sIsnotchScreenHidden;
    public static int sNavigationBarHeight;
    public static float sPixelDensity = 1.0f;
    public static String sRegion;
    public static int sStatusBarHeight;
    private static HashMap<String, Typeface> sTypefaces = new HashMap<>();
    public static int sWindowHeight = 1080;
    private static IWindowManager sWindowManager;
    public static int sWindowWidth = LIMIT_SURFACE_WIDTH;

    private static class ImageFileNamer {
        private SimpleDateFormat mFormat;
        private long mLastDate;
        private int mSameSecondCount;

        public ImageFileNamer(String str) {
            this.mFormat = new SimpleDateFormat(str);
        }

        public String generateName(long j) {
            String format = this.mFormat.format(new Date(j));
            if (j / 1000 == this.mLastDate / 1000) {
                this.mSameSecondCount++;
                StringBuilder sb = new StringBuilder();
                sb.append(format);
                sb.append("_");
                sb.append(this.mSameSecondCount);
                return sb.toString();
            }
            this.mLastDate = j;
            this.mSameSecondCount = 0;
            return format;
        }
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(android.os.Build.DEVICE);
        sb.append("_custom_watermark.png");
        WATERMARK_FILE_NAME = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(android.os.Build.DEVICE);
        sb2.append("_ultra_pixel_custom_watermark.png");
        WATERMARK_ULTRA_PIXEL_FILE_NAME = sb2.toString();
    }

    private Util() {
    }

    public static void Assert(boolean z) {
        if (!z) {
            throw new AssertionError();
        }
    }

    public static byte[] RGBA2RGB(byte[] bArr, int i, int i2) {
        if (bArr == null) {
            return null;
        }
        int i3 = i * i2;
        byte[] bArr2 = new byte[(i3 * 3)];
        int i4 = 0;
        int i5 = 0;
        while (i4 < i3) {
            int i6 = i5 + 1;
            int i7 = i4 * 4;
            bArr2[i5] = bArr[i7];
            int i8 = i6 + 1;
            bArr2[i6] = bArr[i7 + 1];
            int i9 = i8 + 1;
            bArr2[i8] = bArr[i7 + 2];
            i4++;
            i5 = i9;
        }
        return bArr2;
    }

    private static String addDebugInfo(String str) {
        String str2 = "";
        if (str == null) {
            return str2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("\t ");
        sb.append(str);
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append("\n");
        return sb3.toString();
    }

    private static String addProperties(String str) {
        String str2 = "";
        if (SystemProperties.get(str) == null) {
            return str2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("\t ");
        sb.append(SystemProperties.get(str));
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append("\n");
        return sb3.toString();
    }

    public static byte[] appendExif(byte[] bArr, ParallelTaskData parallelTaskData) {
        byte[] bArr2;
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th;
        Throwable th2;
        if (!b.isMTKPlatform() || parallelTaskData == null) {
            return bArr;
        }
        Bundle cameraCharacteristics = parallelTaskData.getCameraCharacteristics();
        ICustomCaptureResult captureResult = parallelTaskData.getCaptureResult();
        CameraMetadataNative cameraMetadataNative = captureResult == null ? null : (CameraMetadataNative) captureResult.getResults();
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                ExifInterface exif = ExifInterface.getExif(bArr);
                setTagValue(exif, ExifInterface.TAG_ORIENTATION, Short.valueOf(ExifInterface.getExifOrientationValue(parallelTaskData.getDataParameter().getJpegRotation())));
                setTagValue(exif, ExifInterface.TAG_MODEL, android.os.Build.MODEL);
                setTagValue(exif, ExifInterface.TAG_MAKE, android.os.Build.MANUFACTURER);
                float[] floatArray = cameraCharacteristics.getFloatArray(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS.toString());
                if (floatArray != null && floatArray.length > 0) {
                    setTagValue(exif, ExifInterface.TAG_FOCAL_LENGTH, Float.valueOf(floatArray[0]));
                }
                float[] floatArray2 = cameraCharacteristics.getFloatArray(CameraCharacteristics.LENS_INFO_AVAILABLE_APERTURES.toString());
                if (floatArray2 != null && floatArray2.length > 0) {
                    setTagValue(exif, ExifInterface.TAG_APERTURE_VALUE, Float.valueOf(floatArray2[0]));
                }
                if (cameraMetadataNative != null) {
                    Integer num = (Integer) cameraMetadataNative.get(CaptureResult.SENSOR_SENSITIVITY);
                    if (num != null) {
                        Integer num2 = (Integer) cameraMetadataNative.get(CaptureResult.CONTROL_POST_RAW_SENSITIVITY_BOOST);
                        if (num2 != null) {
                            num = Integer.valueOf(num.intValue() * num2.intValue());
                        }
                        setTagValue(exif, ExifInterface.TAG_ISO_SPEED_RATINGS, num);
                    }
                }
                if (cameraMetadataNative != null) {
                    Long l = (Long) cameraMetadataNative.get(CaptureResult.SENSOR_EXPOSURE_TIME);
                    if (l != null) {
                        setTagValue(exif, ExifInterface.TAG_EXPOSURE_TIME, Double.valueOf(((double) l.longValue()) / 1.0E9d));
                    }
                }
                long timestamp = parallelTaskData.getTimestamp();
                if (timestamp > 0) {
                    exif.addDateTimeStampTag(ExifInterface.TAG_DATE_TIME, timestamp, TimeZone.getDefault());
                }
                if (cameraMetadataNative != null) {
                    Location location = (Location) cameraMetadataNative.get(CaptureResult.JPEG_GPS_LOCATION);
                    if (location != null) {
                        exif.addGpsTags(location.getLatitude(), location.getLongitude());
                    }
                }
                exif.writeExif(bArr, (OutputStream) byteArrayOutputStream);
                bArr2 = byteArrayOutputStream.toByteArray();
                try {
                    $closeResource(null, byteArrayOutputStream);
                } catch (IOException | RuntimeException e) {
                }
            } catch (Throwable th3) {
                Throwable th4 = th3;
                th2 = r12;
                th = th4;
            }
        } catch (IOException | RuntimeException e2) {
            bArr2 = null;
            Log.d(TAG, "appendExif(): Failed to append exif metadata");
            if (bArr2 != null) {
            }
        }
        return (bArr2 != null || bArr2.length < bArr.length) ? bArr : bArr2;
        $closeResource(th2, byteArrayOutputStream);
        throw th;
    }

    public static SpannableStringBuilder appendInApi26(SpannableStringBuilder spannableStringBuilder, CharSequence charSequence, Object obj, int i) {
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append(charSequence);
        spannableStringBuilder.setSpan(obj, length, spannableStringBuilder.length(), i);
        return spannableStringBuilder;
    }

    public static <T> int binarySearchRightMost(List<? extends Comparable<? super T>> list, T t) {
        int size = list.size() - 1;
        int i = 0;
        while (i <= size) {
            int i2 = (i + size) / 2;
            if (((Comparable) list.get(i2)).compareTo(t) >= 0) {
                size = i2 - 1;
            } else {
                i = i2 + 1;
            }
        }
        return i;
    }

    public static void broadcastKillService(Context context) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        CameraSettings.setBroadcastKillServiceTime(elapsedRealtime);
        Intent intent = new Intent(ACTION_KILL_CAMERA_SERVICE);
        intent.putExtra("time", elapsedRealtime + FragmentTopAlert.HINT_DELAY_TIME);
        intent.putExtra("process_name", new String[]{"android.hardware.camera.provider@2.4-service", "android.hardware.camera.provider@2.4-service_64"});
        context.sendBroadcast(intent);
        CameraStatUtil.trackBroadcastKillService();
    }

    public static void broadcastNewPicture(Context context, Uri uri) {
        if (VERSION.SDK_INT < 24) {
            context.sendBroadcast(new Intent("android.hardware.action.NEW_PICTURE", uri));
            context.sendBroadcast(new Intent("com.android.camera.NEW_PICTURE", uri));
        }
    }

    public static int[] calcDualCameraWatermarkLocation(int i, int i2, int i3, int i4, float f, float f2, float f3) {
        float min = ((float) Math.min(i, i2)) / 1080.0f;
        boolean gv = DataRepository.dataItemFeature().gv();
        float f4 = 1.0f;
        int round = Math.round(f * min * (gv ? CameraSettings.getResourceFloat(R.dimen.custom_watermark_height_scale, 1.0f) : 1.0f)) & -2;
        int i5 = ((i3 * round) / i4) & -2;
        int round2 = Math.round(f2 * min) & -2;
        if (gv) {
            f4 = CameraSettings.getResourceFloat(R.dimen.custom_watermark_pandingY_scale, 1.0f);
        }
        return new int[]{i5, round, round2, Math.round(f3 * min * f4) & -2};
    }

    public static int calcNavigationBarHeight(Context context) {
        int i = sWindowHeight - ((sWindowWidth * 16) / 9);
        int dimensionPixelSize = i > 0 ? i - context.getResources().getDimensionPixelSize(R.dimen.top_control_panel_height) : 0;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("calculate navBarHeight=");
        sb.append(dimensionPixelSize);
        Log.d(str, sb.toString());
        return dimensionPixelSize;
    }

    public static final int calculateDefaultPreviewEdgeSlop(Context context) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        float f = ((float) displayMetrics.widthPixels) / displayMetrics.xdpi;
        float f2 = ((float) displayMetrics.heightPixels) / displayMetrics.ydpi;
        return context.getResources().getDimensionPixelSize(((float) Math.sqrt((double) ((f * f) + (f2 * f2)))) < 5.0f ? R.dimen.preview_edge_touch_slop_small_screen : R.dimen.preview_edge_touch_slop);
    }

    public static boolean checkDeviceHasNavigationBar(Context context) {
        if (sWindowManager == null) {
            sWindowManager = Stub.asInterface(ServiceManager.getService("window"));
            try {
                sHasNavigationBar = CompatibilityUtils.hasNavigationBar(context, sWindowManager);
            } catch (Exception e) {
                Log.e(TAG, "checkDeviceHasNavigationBar exception");
            }
        }
        return sHasNavigationBar;
    }

    public static void checkLockedOrientation(Activity activity) {
        try {
            if (System.getInt(activity.getContentResolver(), "accelerometer_rotation") == 0) {
                mLockedOrientation = System.getInt(activity.getContentResolver(), "user_rotation");
            } else {
                mLockedOrientation = -1;
            }
        } catch (SettingNotFoundException e) {
            Log.e(TAG, "user rotation cannot found");
        }
    }

    public static <T> T checkNotNull(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException();
    }

    public static float clamp(float f, float f2, float f3) {
        return f > f3 ? f3 : f < f2 ? f2 : f;
    }

    public static int clamp(int i, int i2, int i3) {
        return i > i3 ? i3 : i < i2 ? i2 : i;
    }

    public static long clamp(long j, long j2, long j3) {
        return j > j3 ? j3 : j < j2 ? j2 : j;
    }

    public static void clearMemoryLimit() {
        if (!sClearMemoryLimit) {
            long currentTimeMillis = System.currentTimeMillis();
            VMRuntime.getRuntime().clearGrowthLimit();
            sClearMemoryLimit = true;
            long currentTimeMillis2 = System.currentTimeMillis();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("clearMemoryLimit() consume:");
            sb.append(currentTimeMillis2 - currentTimeMillis);
            Log.v(str, sb.toString());
        }
    }

    public static void closeSafely(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
            }
        }
    }

    public static byte[] composeDepthMapPicture(byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4, int[] iArr, boolean z, boolean z2, int i, String str, int i2, int i3, boolean z3, boolean z4, PictureInfo pictureInfo) {
        byte[] bArr5;
        byte[] bArr6 = bArr3;
        String str2 = str;
        int i4 = i2;
        int i5 = i3;
        Log.d(TAG, "composeDepthMapPicture: process in portrait depth map picture");
        long currentTimeMillis = System.currentTimeMillis();
        ArcsoftDepthMap arcsoftDepthMap = new ArcsoftDepthMap(bArr2);
        int[] iArr2 = new int[4];
        byte[] bArr7 = z ? getDualCameraWatermarkData(i4, i5, iArr2) : z2 ? getFrontCameraWatermarkData(i4, i5, iArr2) : null;
        int[] iArr3 = new int[4];
        if (str2 != null) {
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("generate a TimeWaterMarkData with :");
            sb.append(i4);
            sb.append("x");
            sb.append(i5);
            Log.d(str3, sb.toString());
            bArr5 = getTimeWaterMarkData(i4, i5, str2, iArr3);
        } else {
            bArr5 = null;
        }
        byte[] depthMapData = arcsoftDepthMap.getDepthMapData();
        byte[] writePortraitExif = arcsoftDepthMap.writePortraitExif(DataRepository.dataItemFeature().gD(), bArr, bArr7, iArr2, bArr5, iArr3, bArr4, iArr, i, z3, z4, pictureInfo, bArr6.length, depthMapData.length);
        byte[] bArr8 = new byte[(writePortraitExif.length + bArr6.length + depthMapData.length)];
        System.arraycopy(writePortraitExif, 0, bArr8, 0, writePortraitExif.length);
        System.arraycopy(bArr6, 0, bArr8, writePortraitExif.length, bArr6.length);
        System.arraycopy(depthMapData, 0, bArr8, writePortraitExif.length + bArr6.length, depthMapData.length);
        String str4 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("composeDepthMapPicture: compose portrait picture cost: ");
        sb2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str4, sb2.toString());
        return bArr8;
    }

    /* JADX WARNING: Removed duplicated region for block: B:52:0x00ae A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x00b0 A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x00b4 A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00b6 A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x010f A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0111 A[Catch:{ IOException -> 0x01b8 }] */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x01c3  */
    /* JADX WARNING: Removed duplicated region for block: B:77:0x01cc A[SYNTHETIC, Splitter:B:77:0x01cc] */
    public static byte[] composeLiveShotPicture(byte[] bArr, int i, int i2, byte[] bArr2, long j, boolean z, boolean z2, String str, byte[] bArr3, int[] iArr) {
        byte[] bArr4;
        byte[] bArr5;
        byte[] timeWaterMarkData;
        Object obj;
        byte[] bArr6;
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th;
        byte[] frontCameraWatermarkData;
        ByteArrayOutputStream byteArrayOutputStream2;
        Throwable th2;
        byte[] bArr7 = bArr;
        int i3 = i;
        int i4 = i2;
        byte[] bArr8 = bArr2;
        String str2 = str;
        byte[] bArr9 = bArr3;
        int[] iArr2 = iArr;
        Log.d(TAG, "composeLiveShotPicture(): E");
        if (bArr7 == null || bArr7.length == 0) {
            Log.d(TAG, "composeLiveShotPicture(): The primary photo of LiveShot is empty");
            return new byte[0];
        } else if (bArr8 == null || bArr8.length == 0) {
            Log.d(TAG, "composeLiveShotPicture(): The corresponding movie of LiveShot is empty");
            return bArr7;
        } else {
            int[] iArr3 = new int[4];
            int[] iArr4 = new int[4];
            Throwable th3 = null;
            try {
                byteArrayOutputStream2 = new ByteArrayOutputStream();
                try {
                    ExifInterface exifInterface = new ExifInterface();
                    exifInterface.readExif(bArr7);
                    exifInterface.addFileTypeLiveShot(true);
                    exifInterface.writeExif(bArr7, (OutputStream) byteArrayOutputStream2);
                    bArr4 = byteArrayOutputStream2.toByteArray();
                    try {
                        $closeResource(null, byteArrayOutputStream2);
                    } catch (IOException e) {
                    }
                    if (bArr4 != null || bArr4.length <= bArr7.length) {
                        Log.d(TAG, "composeLiveShotPicture(): #1: return original jpeg");
                        return bArr7;
                    }
                    if (z) {
                        frontCameraWatermarkData = getDualCameraWatermarkData(i3, i4, iArr3);
                    } else if (z2) {
                        frontCameraWatermarkData = getFrontCameraWatermarkData(i3, i4, iArr3);
                    } else {
                        bArr5 = null;
                        timeWaterMarkData = (str2 != null || str.isEmpty()) ? null : getTimeWaterMarkData(i3, i4, str2, iArr4);
                        XmlSerializer newSerializer = Xml.newSerializer();
                        StringWriter stringWriter = new StringWriter();
                        newSerializer.setOutput(stringWriter);
                        newSerializer.startDocument("UTF-8", Boolean.valueOf(true));
                        if (bArr9 != null && bArr9.length > 0 && iArr2 != null && iArr2.length >= 4) {
                            newSerializer.startTag(null, "subimage");
                            newSerializer.attribute(null, "offset", String.valueOf(bArr9.length + (bArr5 == null ? bArr5.length : 0) + (timeWaterMarkData == null ? timeWaterMarkData.length : 0) + bArr8.length));
                            newSerializer.attribute(null, "length", String.valueOf(bArr9.length));
                            newSerializer.attribute(null, "paddingx", String.valueOf(iArr2[0]));
                            newSerializer.attribute(null, "paddingy", String.valueOf(iArr2[1]));
                            newSerializer.attribute(null, "width", String.valueOf(iArr2[2]));
                            newSerializer.attribute(null, "height", String.valueOf(iArr2[3]));
                            newSerializer.endTag(null, "subimage");
                        }
                        if (bArr5 != null && bArr5.length > 0) {
                            newSerializer.startTag(null, "lenswatermark");
                            newSerializer.attribute(null, "offset", String.valueOf(bArr5.length + (timeWaterMarkData == null ? timeWaterMarkData.length : 0) + bArr8.length));
                            newSerializer.attribute(null, "length", String.valueOf(bArr5.length));
                            newSerializer.attribute(null, "width", String.valueOf(iArr3[0]));
                            newSerializer.attribute(null, "height", String.valueOf(iArr3[1]));
                            newSerializer.attribute(null, "paddingx", String.valueOf(iArr3[2]));
                            newSerializer.attribute(null, "paddingy", String.valueOf(iArr3[3]));
                            newSerializer.endTag(null, "lenswatermark");
                        }
                        if (timeWaterMarkData != null && timeWaterMarkData.length > 0) {
                            newSerializer.startTag(null, "timewatermark");
                            newSerializer.attribute(null, "offset", String.valueOf(timeWaterMarkData.length + bArr8.length));
                            newSerializer.attribute(null, "length", String.valueOf(timeWaterMarkData.length));
                            newSerializer.attribute(null, "width", String.valueOf(iArr4[0]));
                            newSerializer.attribute(null, "height", String.valueOf(iArr4[1]));
                            newSerializer.attribute(null, "paddingx", String.valueOf(iArr4[2]));
                            newSerializer.attribute(null, "paddingy", String.valueOf(iArr4[3]));
                            newSerializer.endTag(null, "timewatermark");
                        }
                        newSerializer.endDocument();
                        obj = stringWriter.toString();
                        if (obj != null) {
                            Log.d(TAG, "composeLiveShotPicture(): #2: return original jpeg");
                            return bArr7;
                        }
                        try {
                            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr4);
                            try {
                                byteArrayOutputStream = new ByteArrayOutputStream();
                                try {
                                    XMPMeta createXMPMeta = XmpHelper.createXMPMeta();
                                    createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_VERSION, 1);
                                    createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_TYPE, 1);
                                    createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_OFFSET, bArr8.length);
                                    createXMPMeta.setPropertyLong(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_PRESENTATION_TIMESTAMP, j);
                                    if (obj != null) {
                                        createXMPMeta.setProperty(XmpHelper.XIAOMI_XMP_METADATA_NAMESPACE, XmpHelper.XIAOMI_XMP_METADATA_PROPERTY_NAME, obj);
                                    }
                                    XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream, createXMPMeta);
                                    if (bArr9 != null && bArr9.length > 0 && iArr2 != null && iArr2.length >= 4) {
                                        byteArrayOutputStream.write(bArr9);
                                    }
                                    if (bArr5 != null && bArr5.length > 0) {
                                        byteArrayOutputStream.write(bArr5);
                                    }
                                    if (timeWaterMarkData != null && timeWaterMarkData.length > 0) {
                                        byteArrayOutputStream.write(timeWaterMarkData);
                                    }
                                    byteArrayOutputStream.flush();
                                    bArr6 = byteArrayOutputStream.toByteArray();
                                    try {
                                        $closeResource(null, byteArrayOutputStream);
                                        try {
                                            $closeResource(null, byteArrayInputStream);
                                        } catch (Exception e2) {
                                        }
                                        if (bArr6 != null || bArr6.length <= bArr4.length) {
                                            Log.d(TAG, "composeLiveShotPicture(): #3: return original jpeg");
                                            return bArr7;
                                        }
                                        int length = bArr6.length + bArr8.length;
                                        String str3 = TAG;
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("composeLiveShotPicture(): file size = ");
                                        sb.append(length);
                                        Log.d(str3, sb.toString());
                                        byte[] bArr10 = new byte[length];
                                        System.arraycopy(bArr6, 0, bArr10, 0, bArr6.length);
                                        System.arraycopy(bArr8, 0, bArr10, bArr6.length, bArr8.length);
                                        Log.d(TAG, "composeLiveShotPicture(): X");
                                        return bArr10;
                                    } catch (Throwable th4) {
                                        th = th4;
                                        th3 = th;
                                        try {
                                            throw th3;
                                        } catch (Throwable th5) {
                                            th = th5;
                                        }
                                    }
                                } catch (Throwable th6) {
                                    th = th6;
                                }
                            } catch (Throwable th7) {
                                th = th7;
                                bArr6 = null;
                                $closeResource(th3, byteArrayInputStream);
                                throw th;
                            }
                        } catch (Exception e3) {
                            bArr6 = null;
                            Log.d(TAG, "composeLiveShotPicture(): failed to insert xmp metadata");
                            if (bArr6 != null) {
                            }
                            Log.d(TAG, "composeLiveShotPicture(): #3: return original jpeg");
                            return bArr7;
                        }
                    }
                    bArr5 = frontCameraWatermarkData;
                    if (str2 != null) {
                    }
                    try {
                        XmlSerializer newSerializer2 = Xml.newSerializer();
                        StringWriter stringWriter2 = new StringWriter();
                        newSerializer2.setOutput(stringWriter2);
                        newSerializer2.startDocument("UTF-8", Boolean.valueOf(true));
                        newSerializer2.startTag(null, "subimage");
                        newSerializer2.attribute(null, "offset", String.valueOf(bArr9.length + (bArr5 == null ? bArr5.length : 0) + (timeWaterMarkData == null ? timeWaterMarkData.length : 0) + bArr8.length));
                        newSerializer2.attribute(null, "length", String.valueOf(bArr9.length));
                        newSerializer2.attribute(null, "paddingx", String.valueOf(iArr2[0]));
                        newSerializer2.attribute(null, "paddingy", String.valueOf(iArr2[1]));
                        newSerializer2.attribute(null, "width", String.valueOf(iArr2[2]));
                        newSerializer2.attribute(null, "height", String.valueOf(iArr2[3]));
                        newSerializer2.endTag(null, "subimage");
                        newSerializer2.startTag(null, "lenswatermark");
                        newSerializer2.attribute(null, "offset", String.valueOf(bArr5.length + (timeWaterMarkData == null ? timeWaterMarkData.length : 0) + bArr8.length));
                        newSerializer2.attribute(null, "length", String.valueOf(bArr5.length));
                        newSerializer2.attribute(null, "width", String.valueOf(iArr3[0]));
                        newSerializer2.attribute(null, "height", String.valueOf(iArr3[1]));
                        newSerializer2.attribute(null, "paddingx", String.valueOf(iArr3[2]));
                        newSerializer2.attribute(null, "paddingy", String.valueOf(iArr3[3]));
                        newSerializer2.endTag(null, "lenswatermark");
                        newSerializer2.startTag(null, "timewatermark");
                        newSerializer2.attribute(null, "offset", String.valueOf(timeWaterMarkData.length + bArr8.length));
                        newSerializer2.attribute(null, "length", String.valueOf(timeWaterMarkData.length));
                        newSerializer2.attribute(null, "width", String.valueOf(iArr4[0]));
                        newSerializer2.attribute(null, "height", String.valueOf(iArr4[1]));
                        newSerializer2.attribute(null, "paddingx", String.valueOf(iArr4[2]));
                        newSerializer2.attribute(null, "paddingy", String.valueOf(iArr4[3]));
                        newSerializer2.endTag(null, "timewatermark");
                        newSerializer2.endDocument();
                        obj = stringWriter2.toString();
                    } catch (IOException e4) {
                        Log.d(TAG, "composeLiveShotPicture(): Failed to generate xiaomi xmp metadata");
                        obj = null;
                    }
                    if (obj != null) {
                    }
                } catch (Throwable th8) {
                    th = th8;
                }
            } catch (IOException e5) {
                bArr4 = null;
                Log.d(TAG, "composeLiveShotPicture(): Failed to insert xiaomi specific metadata");
                if (bArr4 != null) {
                }
                Log.d(TAG, "composeLiveShotPicture(): #1: return original jpeg");
                return bArr7;
            }
        }
        $closeResource(th2, byteArrayOutputStream2);
        throw th;
        $closeResource(th, byteArrayOutputStream);
        throw th;
    }

    public static byte[] composeMainSubPicture(byte[] bArr, byte[] bArr2, int[] iArr) {
        Object obj;
        byte[] bArr3;
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th;
        Throwable th2;
        if (bArr2 == null || iArr == null || iArr.length < 3) {
            return bArr;
        }
        Throwable th3 = null;
        try {
            XmlSerializer newSerializer = Xml.newSerializer();
            StringWriter stringWriter = new StringWriter();
            newSerializer.setOutput(stringWriter);
            newSerializer.startDocument("UTF-8", Boolean.valueOf(true));
            newSerializer.startTag(null, "subimage");
            newSerializer.attribute(null, "offset", String.valueOf(bArr2.length));
            newSerializer.attribute(null, "length", String.valueOf(bArr2.length));
            newSerializer.attribute(null, "paddingx", String.valueOf(iArr[0]));
            newSerializer.attribute(null, "paddingy", String.valueOf(iArr[1]));
            newSerializer.attribute(null, "width", String.valueOf(iArr[2]));
            newSerializer.attribute(null, "height", String.valueOf(iArr[3]));
            newSerializer.endTag(null, "subimage");
            newSerializer.endDocument();
            obj = stringWriter.toString();
        } catch (IOException e) {
            Log.e(TAG, "composeMainSubPicture(): Failed to generate xiaomi specific xmp metadata");
            obj = null;
        }
        if (obj == null) {
            return bArr;
        }
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    XMPMeta createXMPMeta = XmpHelper.createXMPMeta();
                    createXMPMeta.setProperty(XmpHelper.XIAOMI_XMP_METADATA_NAMESPACE, XmpHelper.XIAOMI_XMP_METADATA_PROPERTY_NAME, obj);
                    XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream, createXMPMeta);
                    byteArrayOutputStream.write(bArr2);
                    byteArrayOutputStream.flush();
                    bArr3 = byteArrayOutputStream.toByteArray();
                } catch (Throwable th4) {
                    Throwable th5 = th4;
                    th = r9;
                    th2 = th5;
                }
                try {
                    $closeResource(null, byteArrayOutputStream);
                    try {
                        $closeResource(null, byteArrayInputStream);
                    } catch (XMPException | IOException e2) {
                    }
                } catch (Throwable th6) {
                    th3 = th6;
                    try {
                        throw th3;
                    } catch (Throwable th7) {
                        th = th7;
                    }
                }
            } catch (Throwable th8) {
                th = th8;
                bArr3 = null;
                $closeResource(th3, byteArrayInputStream);
                throw th;
            }
        } catch (XMPException | IOException e3) {
            bArr3 = null;
            Log.d(TAG, "composeMainSubPicture(): Failed to insert xiaomi specific xmp metadata");
            if (bArr3 == null) {
            }
            Log.e(TAG, "composeMainSubPicture(): Failed to append sub image, return original jpeg");
            return bArr;
        }
        if (bArr3 == null && bArr3.length >= bArr.length) {
            return bArr3;
        }
        Log.e(TAG, "composeMainSubPicture(): Failed to append sub image, return original jpeg");
        return bArr;
        $closeResource(th, byteArrayOutputStream);
        throw th2;
    }

    private static int computeInitialSampleSize(Options options, int i, int i2) {
        int i3;
        double d = (double) options.outWidth;
        double d2 = (double) options.outHeight;
        int ceil = i2 < 0 ? 1 : (int) Math.ceil(Math.sqrt((d * d2) / ((double) i2)));
        if (i < 0) {
            i3 = 128;
        } else {
            double d3 = (double) i;
            i3 = (int) Math.min(Math.floor(d / d3), Math.floor(d2 / d3));
        }
        if (i3 < ceil) {
            return ceil;
        }
        if (i2 >= 0 || i >= 0) {
            return i < 0 ? ceil : i3;
        }
        return 1;
    }

    public static int computeSampleSize(Options options, int i, int i2) {
        int computeInitialSampleSize = computeInitialSampleSize(options, i, i2);
        if (computeInitialSampleSize > 8) {
            return 8 * ((computeInitialSampleSize + 7) / 8);
        }
        int i3 = 1;
        while (i3 < computeInitialSampleSize) {
            i3 <<= 1;
        }
        return i3;
    }

    private static float computeScale(int i, int i2, float f) {
        double atan = Math.atan(((double) i) / ((double) i2));
        return (float) ((Math.sin(Math.toRadians(((double) normalizeDegree(f)) + Math.toDegrees(atan))) / Math.sin(atan)) + ((double) (10.0f / ((float) i))));
    }

    public static String controlAEStateToString(Integer num) {
        if (num == null) {
            return TEDefine.FACE_BEAUTY_NULL;
        }
        switch (num.intValue()) {
            case 0:
                return "inactive";
            case 1:
                return "searching";
            case 2:
                return "converged";
            case 3:
                return "locked";
            case 4:
                return "flash_required";
            case 5:
                return "precapture";
            default:
                return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static String controlAFStateToString(Integer num) {
        if (num == null) {
            return TEDefine.FACE_BEAUTY_NULL;
        }
        switch (num.intValue()) {
            case 0:
                return "inactive";
            case 1:
                return "passive_scan";
            case 2:
                return "passive_focused";
            case 3:
                return "active_scan";
            case 4:
                return "focused_locked";
            case 5:
                return "not_focus_locked";
            case 6:
                return "passive_unfocused";
            default:
                return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static String controlAWBStateToString(Integer num) {
        if (num == null) {
            return TEDefine.FACE_BEAUTY_NULL;
        }
        switch (num.intValue()) {
            case 0:
                return "inactive";
            case 1:
                return "searching";
            case 2:
                return "converged";
            case 3:
                return "locked";
            default:
                return EnvironmentCompat.MEDIA_UNKNOWN;
        }
    }

    public static String convertOutputFormatToFileExt(int i) {
        return i == 2 ? ".mp4" : ".3gp";
    }

    public static final String convertOutputFormatToMimeType(int i) {
        return i == 2 ? "video/mp4" : "video/3gpp";
    }

    public static int convertSizeToQuality(CameraSize cameraSize) {
        int i = cameraSize.width;
        int i2 = cameraSize.height;
        if (i < i2) {
            i = cameraSize.height;
            i2 = cameraSize.width;
        }
        if (i == 1920 && i2 == 1080) {
            return 6;
        }
        if (i == 3840 && i2 == 2160) {
            return 8;
        }
        if (i == 1280 && i2 == 720) {
            return 5;
        }
        return (i < 640 || i2 != 480) ? -1 : 4;
    }

    public static void coverSubYuvImage(byte[] bArr, int i, int i2, int i3, int i4, byte[] bArr2, int[] iArr) {
        int i5 = (iArr[1] * i3) + iArr[0];
        int i6 = 0;
        for (int i7 = 0; i7 < iArr[3]; i7++) {
            System.arraycopy(bArr2, i6, bArr, i5, iArr[2]);
            i6 += iArr[2];
            i5 += i3;
        }
        int i8 = (i3 * (i2 - 1)) + i + ((iArr[1] / 2) * i4) + iArr[0];
        for (int i9 = 0; i9 < iArr[3] / 2; i9++) {
            System.arraycopy(bArr2, i6, bArr, i8, iArr[2]);
            i8 += i4;
            i6 += iArr[2];
        }
    }

    public static boolean createFile(File file) {
        if (file.exists()) {
            return false;
        }
        String parent = file.getParent();
        if (parent != null) {
            mkdirs(new File(parent), FrameMetricsAggregator.EVERY_DURATION, -1, -1);
        }
        try {
            file.createNewFile();
        } catch (IOException e) {
        }
        return true;
    }

    public static String createJpegName(long j) {
        String generateName;
        synchronized (sImageFileNamer) {
            generateName = sImageFileNamer.generateName(j);
        }
        return generateName;
    }

    public static MeteringRectangle createMeteringRectangleFrom(int i, int i2, int i3, int i4, int i5) {
        try {
            MeteringRectangle meteringRectangle = new MeteringRectangle(0, 0, 0, 0, 0);
            modify(meteringRectangle, "mX", i);
            modify(meteringRectangle, "mY", i2);
            modify(meteringRectangle, "mWidth", i3);
            modify(meteringRectangle, "mHeight", i4);
            modify(meteringRectangle, "mWeight", i5);
            return meteringRectangle;
        } catch (Exception e) {
            MeteringRectangle meteringRectangle2 = new MeteringRectangle(i, i2, i3, i4, i5);
            return meteringRectangle2;
        }
    }

    public static MeteringRectangle createMeteringRectangleFrom(Rect rect, int i) {
        try {
            return createMeteringRectangleFrom(rect.left, rect.top, rect.width(), rect.height(), i);
        } catch (Exception e) {
            return new MeteringRectangle(rect, i);
        }
    }

    public static float distance(float f, float f2, float f3, float f4) {
        float f5 = f - f3;
        float f6 = f2 - f4;
        return (float) Math.sqrt((double) ((f5 * f5) + (f6 * f6)));
    }

    public static int dpToPixel(float f) {
        return Math.round(sPixelDensity * f);
    }

    public static void dumpBackTrace(String str) {
        StackTraceElement[] stackTrace;
        RuntimeException runtimeException = new RuntimeException();
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append(str);
        sb.append("]\n");
        Log.d(str2, sb.toString());
        Log.d(TAG, "**********print backtrace start *************");
        for (StackTraceElement stackTraceElement : runtimeException.getStackTrace()) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("[");
            sb2.append(str);
            sb2.append("]:backtrace: ");
            sb2.append(stackTraceElement.getClassName());
            sb2.append(" ");
            sb2.append(stackTraceElement.getMethodName());
            sb2.append(" ");
            sb2.append(stackTraceElement.getLineNumber());
            Log.d(str3, sb2.toString());
        }
        Log.d(TAG, "**********print backtrace end *************");
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("[");
        sb3.append(str);
        sb3.append("]\n");
        Log.d(str4, sb3.toString());
    }

    public static void dumpImageInfo(String str, Image image) {
        StringBuilder sb = new StringBuilder();
        Plane[] planes = image.getPlanes();
        for (int i = 0; i < planes.length; i++) {
            Plane plane = planes[i];
            sb.append("plane_");
            sb.append(i);
            sb.append(": ");
            sb.append(plane.getPixelStride());
            sb.append("|");
            sb.append(plane.getRowStride());
            sb.append("|");
            sb.append(plane.getBuffer().remaining());
            sb.append("\n");
        }
        Log.d(str, sb.toString());
    }

    public static String dumpMatrix(float[] fArr) {
        int length = fArr.length;
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < length; i++) {
            sb.append(String.format("%f", new Object[]{Float.valueOf(fArr[i])}));
            if (i != length - 1) {
                sb.append(" ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    public static void dumpRect(RectF rectF, String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("=(");
        sb.append(rectF.left);
        sb.append(",");
        sb.append(rectF.top);
        sb.append(",");
        sb.append(rectF.right);
        sb.append(",");
        sb.append(rectF.bottom);
        sb.append(")");
        Log.v(str2, sb.toString());
    }

    public static ByteBuffer dumpToBitmap(int i, int i2, int i3, int i4, String str) {
        ByteBuffer allocate = ByteBuffer.allocate(i3 * i4 * 4);
        GLES20.glReadPixels(i, i2, i3, i4, 6408, 5121, allocate);
        if (allocate != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("tex_");
            sb.append(createJpegName(System.currentTimeMillis()));
            sb.append(str);
            String generateFilepath = Storage.generateFilepath(sb.toString(), Storage.JPEG_SUFFIX);
            saveBitmap(allocate, i3, i4, Config.ARGB_8888, generateFilepath);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("dump to ");
            sb2.append(generateFilepath);
            Log.d(str2, sb2.toString());
        }
        allocate.rewind();
        return allocate;
    }

    public static void enterLightsOutMode(Window window) {
        LayoutParams attributes = window.getAttributes();
        attributes.systemUiVisibility |= 1;
        window.setAttributes(attributes);
    }

    public static boolean equals(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static String execCommand(String str, boolean z) {
        String[] strArr = {"sh", "-c", str};
        long currentTimeMillis = System.currentTimeMillis();
        String str2 = "";
        try {
            Process exec = Runtime.getRuntime().exec(strArr);
            if (exec.waitFor() != 0) {
                String str3 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("exit value = ");
                sb.append(exec.exitValue());
                Log.e(str3, sb.toString());
                return str2;
            }
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
            StringBuffer stringBuffer = new StringBuffer();
            if (!z) {
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    stringBuffer.append(readLine);
                }
            } else {
                while (true) {
                    String readLine2 = bufferedReader.readLine();
                    if (readLine2 == null) {
                        break;
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(readLine2);
                    sb2.append("\r\n");
                    stringBuffer.append(sb2.toString());
                }
            }
            bufferedReader.close();
            String stringBuffer2 = stringBuffer.toString();
            String str4 = TAG;
            try {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("execCommand value=");
                sb3.append(stringBuffer2);
                sb3.append(" cost=");
                sb3.append(System.currentTimeMillis() - currentTimeMillis);
                Log.v(str4, sb3.toString());
                str2 = stringBuffer2;
            } catch (InterruptedException e) {
                String str5 = stringBuffer2;
                e = e;
                str2 = str5;
                Log.e(TAG, "execCommand InterruptedException");
                e.printStackTrace();
                return str2;
            } catch (IOException e2) {
                String str6 = stringBuffer2;
                e = e2;
                str2 = str6;
                Log.e(TAG, "execCommand IOException");
                e.printStackTrace();
                return str2;
            }
            return str2;
        } catch (InterruptedException e3) {
            e = e3;
            Log.e(TAG, "execCommand InterruptedException");
            e.printStackTrace();
            return str2;
        } catch (IOException e4) {
            e = e4;
            Log.e(TAG, "execCommand IOException");
            e.printStackTrace();
            return str2;
        }
    }

    public static void expandViewTouchDelegate(View view) {
        if (view.isShown()) {
            Rect rect = new Rect();
            view.getHitRect(rect);
            int dpToPixel = dpToPixel(10.0f);
            rect.top -= dpToPixel;
            rect.bottom += dpToPixel;
            rect.left -= dpToPixel;
            rect.right += dpToPixel;
            TouchDelegate touchDelegate = new TouchDelegate(rect, view);
            if (View.class.isInstance(view.getParent())) {
                ((View) view.getParent()).setTouchDelegate(touchDelegate);
            }
        } else if (View.class.isInstance(view.getParent())) {
            ((View) view.getParent()).setTouchDelegate(null);
        }
    }

    public static void fadeIn(View view) {
        fadeIn(view, MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
    }

    public static void fadeIn(View view, int i) {
        if (view != null && view.getVisibility() != 0) {
            view.setVisibility(0);
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration((long) i);
            view.clearAnimation();
            view.startAnimation(alphaAnimation);
        }
    }

    public static void fadeOut(View view) {
        fadeOut(view, MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
    }

    public static void fadeOut(View view, int i) {
        if (view != null && view.getVisibility() == 0) {
            AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
            alphaAnimation.setDuration((long) i);
            view.clearAnimation();
            view.startAnimation(alphaAnimation);
            view.setVisibility(8);
        }
    }

    public static Bitmap flipBitmap(@NonNull Bitmap bitmap, int i) {
        Bitmap bitmap2;
        if (bitmap == null) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("flipBitmap: ");
        sb.append(width);
        sb.append(" x ");
        sb.append(height);
        Log.d(str, sb.toString());
        Matrix matrix = new Matrix();
        if (i == 1) {
            matrix.postScale(1.0f, -1.0f, (float) (width / 2), (float) (height / 2));
        } else {
            matrix.postScale(-1.0f, 1.0f, (float) (width / 2), (float) (height / 2));
        }
        try {
            bitmap2 = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        } catch (NullPointerException | OutOfMemoryError e) {
            e.printStackTrace();
            bitmap2 = null;
        }
        if (bitmap2 == null) {
            return bitmap;
        }
        Canvas canvas = new Canvas(bitmap2);
        canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setFilterBitmap(true);
        canvas.drawBitmap(bitmap, matrix, paint);
        bitmap.recycle();
        return bitmap2;
    }

    public static Bitmap generateUltraPixelWatermark2File() {
        Bitmap bitmap;
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = true;
        if (DataRepository.dataItemFeature().gv()) {
            Bitmap loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, android.os.Build.DEVICE);
            if (loadAppCameraWatermark == null) {
                loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, BuildConfig.FLAVOR);
            }
            int integer = CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.custom_watermark_startx);
            bitmap = CustomTextWaterMark.newInstance(loadAppCameraWatermark, (float) integer, (float) CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.custom_watermark_starty), CameraSettings.getString(R.string.device_ultra_pixel_watermark_default_text)).drawToBitmap();
        } else {
            Context androidContext = CameraAppImpl.getAndroidContext();
            StringBuilder sb = new StringBuilder();
            sb.append(android.os.Build.DEVICE);
            sb.append(CameraSettings.getString(R.string.device_ultra_pixel_app_watermark_family_name_suffix));
            bitmap = loadAppCameraWatermark(androidContext, options, sb.toString());
        }
        saveCustomWatermark2File(bitmap, true);
        return bitmap;
    }

    public static Bitmap generateWatermark2File() {
        long currentTimeMillis = System.currentTimeMillis();
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = true;
        if (!DataRepository.dataItemFeature().fP() && !DataRepository.dataItemFeature().fQ()) {
            return null;
        }
        Bitmap loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, android.os.Build.DEVICE);
        if (loadAppCameraWatermark == null) {
            loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, BuildConfig.FLAVOR);
        }
        if (DataRepository.dataItemFeature().gv()) {
            loadAppCameraWatermark = CustomTextWaterMark.newInstance(loadAppCameraWatermark, (float) CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.custom_watermark_startx), (float) CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.custom_watermark_starty), CameraSettings.getCustomWatermark()).drawToBitmap();
        }
        saveCustomWatermark2File(loadAppCameraWatermark, false);
        DataRepository.dataItemGlobal().updateCustomWatermarkVersion();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("generateWatermark2File cost time = ");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        sb.append("ms");
        Log.d(str, sb.toString());
        return loadAppCameraWatermark;
    }

    public static CameraSize getAlgorithmPreviewSize(List<CameraSize> list, double d, CameraSize cameraSize) {
        if (cameraSize == null) {
            throw new IllegalArgumentException("limitSize can not be null!");
        } else if (list == null || list.isEmpty()) {
            Log.w(TAG, "null preview size list");
            return cameraSize;
        } else {
            int max = Math.max(SystemProperties.getInt("algorithm_limit_height", cameraSize.height), 500);
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                CameraSize cameraSize2 = (CameraSize) it.next();
                if (Math.abs((((double) cameraSize2.width) / ((double) cameraSize2.height)) - d) <= 0.02d && cameraSize2.height < max) {
                    cameraSize = cameraSize2;
                    break;
                }
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getAlgorithmPreviewSize: algorithmSize = ");
            sb.append(cameraSize);
            Log.d(str, sb.toString());
            return cameraSize;
        }
    }

    public static int getArrayIndex(int[] iArr, int i) {
        if (iArr == null) {
            return -1;
        }
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (iArr[i2] == i) {
                return i2;
            }
        }
        return -1;
    }

    public static <T> int getArrayIndex(T[] tArr, T t) {
        if (tArr == null) {
            return -1;
        }
        int i = 0;
        for (T equals : tArr) {
            if (Objects.equals(equals, t)) {
                return i;
            }
            i++;
        }
        return -1;
    }

    private static int getAttributeIntValue(XmlPullParser xmlPullParser, String str, int i) {
        String attributeValue = xmlPullParser.getAttributeValue(null, str);
        if (TextUtils.isEmpty(attributeValue)) {
            return i;
        }
        try {
            return Integer.parseInt(attributeValue);
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("get attribute ");
            sb.append(str);
            sb.append(" failed");
            Log.w(str2, sb.toString(), e);
            return i;
        }
    }

    public static byte[] getBitmapData(Bitmap bitmap, int i) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(CompressFormat.JPEG, i, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public static int getBottomHeight(Resources resources) {
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.bottom_control_height);
        return (!isNotchDevice || !sIsFullScreenNavBarHidden || isLongRatioScreen) ? dimensionPixelSize : dimensionPixelSize - sFullScreenExtraMargin;
    }

    private static String getCaller(StackTraceElement[] stackTraceElementArr, int i) {
        int i2 = 4 + i;
        if (i2 >= stackTraceElementArr.length) {
            return "<bottom of call stack>";
        }
        StackTraceElement stackTraceElement = stackTraceElementArr[i2];
        StringBuilder sb = new StringBuilder();
        sb.append(stackTraceElement.getClassName());
        sb.append(".");
        sb.append(stackTraceElement.getMethodName());
        sb.append(":");
        sb.append(stackTraceElement.getLineNumber());
        return sb.toString();
    }

    public static String getCallers(int i) {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i2 = 0; i2 < i; i2++) {
            stringBuffer.append(getCaller(stackTrace, i2));
            stringBuffer.append(" ");
        }
        return stringBuffer.toString();
    }

    public static int getCenterFocusDepthIndex(byte[] bArr, int i, int i2) {
        if (bArr == null || bArr.length < 25) {
            return 1;
        }
        int length = bArr.length - 25;
        int i3 = length + 1;
        if (bArr[length] != 0) {
            return 1;
        }
        int i4 = i3 + 1;
        int i5 = i4 + 1;
        byte b = ((bArr[i4] & 255) << 16) | ((bArr[i3] & 255) << 24);
        int i6 = i5 + 1;
        byte b2 = b | ((bArr[i5] & 255) << 8);
        int i7 = i6 + 1;
        byte b3 = b2 | (bArr[i6] & 255);
        int i8 = i7 + 1;
        int i9 = i8 + 1;
        byte b4 = ((bArr[i8] & 255) << 16) | ((bArr[i7] & 255) << 24) | ((bArr[i9] & 255) << 8) | (bArr[i9 + 1] & 255);
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.focus_area_width);
        int i10 = (dimensionPixelSize * b3) / sWindowWidth;
        int dimensionPixelSize2 = (int) (((float) (resources.getDimensionPixelSize(R.dimen.focus_area_height) * b4)) / ((((float) sWindowWidth) * ((float) i2)) / ((float) i)));
        int[] iArr = new int[5];
        int i11 = 0;
        int i12 = (b4 - dimensionPixelSize2) / 2;
        int i13 = 0;
        while (i13 < dimensionPixelSize2) {
            int i14 = i12 + 1;
            int i15 = (i12 * b3) + ((b3 - i10) / 2);
            int i16 = 0;
            while (i16 < i10) {
                int i17 = i15 + 1;
                byte b5 = bArr[i15];
                iArr[b5] = iArr[b5] + 1;
                i16++;
                i15 = i17;
            }
            i13++;
            i12 = i14;
        }
        for (int i18 = 1; i18 < 5; i18++) {
            if (iArr[i11] < iArr[i18]) {
                i11 = i18;
            }
        }
        return i11;
    }

    public static int getChildMeasureWidth(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int i = marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
        int measuredWidth = view.getMeasuredWidth();
        if (measuredWidth > 0) {
            return measuredWidth + i;
        }
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(makeMeasureSpec, makeMeasureSpec);
        return view.getMeasuredWidth() + i;
    }

    private static File getColorMapXmlMapFile() {
        if (VERSION.SDK_INT >= 26) {
            File file = new File("/vendor/etc/screen_light.xml");
            if (file.exists()) {
                return file;
            }
            Log.e(TAG, "screen_light.xml do not found under /vendor/etc, roll back to /system/etc");
        }
        File file2 = new File("/system/etc/screen_light.xml");
        if (file2.exists()) {
            return file2;
        }
        Log.e(TAG, "screen_light.xml do not found under /system/etc");
        return null;
    }

    public static String getDebugInfo() {
        StringBuilder sb = new StringBuilder();
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.enable"))) {
            sb.append(addProperties("persist.camera.debug.param0"));
            sb.append(addProperties("persist.camera.debug.param1"));
            sb.append(addProperties("persist.camera.debug.param2"));
            sb.append(addProperties("persist.camera.debug.param3"));
            sb.append(addProperties("persist.camera.debug.param4"));
            sb.append(addProperties("persist.camera.debug.param5"));
            sb.append(addProperties("persist.camera.debug.param6"));
            sb.append(addProperties("persist.camera.debug.param7"));
            sb.append(addProperties("persist.camera.debug.param8"));
            sb.append(addProperties("persist.camera.debug.param9"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_awb"))) {
            sb.append(addProperties("persist.camera.debug.param10"));
            sb.append(addProperties("persist.camera.debug.param11"));
            sb.append(addProperties("persist.camera.debug.param12"));
            sb.append(addProperties("persist.camera.debug.param13"));
            sb.append(addProperties("persist.camera.debug.param14"));
            sb.append(addProperties("persist.camera.debug.param15"));
            sb.append(addProperties("persist.camera.debug.param16"));
            sb.append(addProperties("persist.camera.debug.param17"));
            sb.append(addProperties("persist.camera.debug.param18"));
            sb.append(addProperties("persist.camera.debug.param19"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_aec"))) {
            sb.append(addProperties("persist.camera.debug.param20"));
            sb.append(addProperties("persist.camera.debug.param21"));
            sb.append(addProperties("persist.camera.debug.param22"));
            sb.append(addProperties("persist.camera.debug.param23"));
            sb.append(addProperties("persist.camera.debug.param24"));
            sb.append(addProperties("persist.camera.debug.param25"));
            sb.append(addProperties("persist.camera.debug.param26"));
            sb.append(addProperties("persist.camera.debug.param27"));
            sb.append(addProperties("persist.camera.debug.param28"));
            sb.append(addProperties("persist.camera.debug.param29"));
        }
        sb.append(addProperties("persist.camera.debug.checkerf"));
        sb.append(addProperties("persist.camera.debug.fc"));
        if ("1".equals(SystemProperties.get("persist.camera.debug.hht"))) {
            sb.append(addProperties("camera.debug.hht.luma"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.autoscene"))) {
            sb.append(addProperties("camera.debug.hht.iso"));
        }
        return sb.toString();
    }

    public static String getDebugInformation(CaptureResult captureResult) {
        StringBuilder sb = new StringBuilder();
        AECFrameControl aECFrameControl = CaptureResultParser.getAECFrameControl(captureResult);
        AFFrameControl aFFrameControl = CaptureResultParser.getAFFrameControl(captureResult);
        if (!(!"1".equals(SystemProperties.get("camera.preview.debug.show_shortGain")) || aECFrameControl == null || aECFrameControl.getAecExposureDatas() == null)) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("short gain : ");
            sb2.append(aECFrameControl.getAecExposureDatas()[0].getLinearGain());
            sb.append(addDebugInfo(sb2.toString()));
        }
        if (!(!"1".equals(SystemProperties.get("camera.preview.debug.show_adrcGain")) || aECFrameControl == null || aECFrameControl.getAecExposureDatas() == null)) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("adrc gain : ");
            sb3.append(aECFrameControl.getAecExposureDatas()[2].getSensitivity() / aECFrameControl.getAecExposureDatas()[0].getSensitivity());
            sb.append(addDebugInfo(sb3.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afRegion"))) {
            MeteringRectangle[] meteringRectangleArr = (MeteringRectangle[]) captureResult.get(CaptureResult.CONTROL_AF_REGIONS);
            if (meteringRectangleArr != null) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("af region : ");
                sb4.append(meteringRectangleArr[0].getRect().toString());
                sb.append(addDebugInfo(sb4.toString()));
            }
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afMode"))) {
            StringBuilder sb5 = new StringBuilder();
            sb5.append("af mode : ");
            sb5.append(captureResult.get(CaptureResult.CONTROL_AF_MODE));
            sb.append(addDebugInfo(sb5.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afStatus"))) {
            StringBuilder sb6 = new StringBuilder();
            sb6.append("af state : ");
            sb6.append(captureResult.get(CaptureResult.CONTROL_AF_STATE));
            sb.append(addDebugInfo(sb6.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afLensPosition")) && aFFrameControl != null) {
            String str = "";
            if (aFFrameControl.getUseDACValue() == 0) {
                StringBuilder sb7 = new StringBuilder();
                sb7.append(aFFrameControl.getTargetLensPosition());
                sb7.append("");
                str = sb7.toString();
            }
            StringBuilder sb8 = new StringBuilder();
            sb8.append("af lens position : ");
            sb8.append(str);
            sb.append(addDebugInfo(sb8.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_distance")) && captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE) != null) {
            float floatValue = ((Float) captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE)).floatValue();
            StringBuilder sb9 = new StringBuilder();
            sb9.append("distance : ");
            sb9.append(floatValue);
            sb.append(addDebugInfo(sb9.toString()));
            StringBuilder sb10 = new StringBuilder();
            sb10.append("distance(m) : ");
            sb10.append(1.0f / floatValue);
            sb.append(addDebugInfo(sb10.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_gyro")) && aFFrameControl != null) {
            for (int i = 0; i < aFFrameControl.getAFGyroData().getSampleCount(); i++) {
                StringBuilder sb11 = new StringBuilder();
                sb11.append("gyro : x: ");
                sb11.append(aFFrameControl.getAFGyroData().getpAngularVelocityX()[i]);
                sb11.append(", y: ");
                sb11.append(aFFrameControl.getAFGyroData().getpAngularVelocityY()[i]);
                sb11.append(", z: ");
                sb11.append(aFFrameControl.getAFGyroData().getpAngularVelocityZ()[i]);
                sb.append(addDebugInfo(sb11.toString()));
            }
        }
        return sb.toString();
    }

    public static int getDialogTopMargin(int i) {
        return isNotchDevice ? i - sStatusBarHeight : i;
    }

    public static int getDisplayOrientation(int i, int i2) {
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i2);
        if (capabilities == null) {
            return 90;
        }
        int sensorOrientation = capabilities.getSensorOrientation();
        return capabilities.getFacing() == 0 ? (360 - ((sensorOrientation + i) % 360)) % 360 : ((sensorOrientation - i) + 360) % 360;
    }

    public static Rect getDisplayRect(Context context) {
        return getDisplayRect(context, DataRepository.dataItemRunning().getUiStyle());
    }

    public static Rect getDisplayRect(Context context, int i) {
        int i2;
        int i3;
        if (i == 0) {
            i2 = (int) (((float) (sWindowWidth * 4)) / 3.0f);
            i3 = (sWindowHeight - i2) - getBottomHeight(context.getResources());
        } else if (i != 3) {
            i2 = (int) (((float) (sWindowWidth * 16)) / 9.0f);
            if (isLongRatioScreen) {
                i3 = (sWindowHeight - ((int) (((float) (sWindowWidth * 4)) / 3.0f))) - getBottomHeight(context.getResources());
            } else {
                i3 = (sWindowHeight - i2) - sNavigationBarHeight;
            }
        } else {
            i2 = sWindowHeight - sStatusBarHeight;
            i3 = sStatusBarHeight;
        }
        if (i3 <= 2) {
            i3 = 0;
        }
        return new Rect(0, i3, sWindowWidth, i2 + i3);
    }

    public static int getDisplayRotation(Activity activity) {
        int i = (!b.ja() || !CameraSettings.isFrontCamera() || activity.getRequestedOrientation() != 7) ? (mLockedOrientation == 0 || mLockedOrientation == 2) ? mLockedOrientation : 0 : activity.getWindowManager().getDefaultDisplay().getRotation();
        switch (i) {
            case 0:
                return 0;
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:33:0x006a  */
    private static byte[] getDualCameraWatermarkData(int i, int i2, int[] iArr) {
        String str;
        byte[] bArr;
        Bitmap decodeByteArray;
        FileInputStream fileInputStream;
        Throwable th;
        Throwable th2;
        if (DataRepository.dataItemFeature().fP()) {
            str = new File(CameraAppImpl.getAndroidContext().getFilesDir(), WATERMARK_FILE_NAME).getPath();
            if (!new File(str).exists()) {
                generateWatermark2File();
            }
        } else {
            str = CameraSettings.getDualCameraWaterMarkFilePathVendor();
        }
        byte[] bArr2 = null;
        try {
            fileInputStream = new FileInputStream(str);
            try {
                bArr = IOUtils.toByteArray(fileInputStream);
                try {
                    $closeResource(null, fileInputStream);
                } catch (IOException e) {
                    Throwable th3 = e;
                    bArr2 = bArr;
                    e = th3;
                }
            } catch (Throwable th4) {
                Throwable th5 = th4;
                th = r0;
                th2 = th5;
            }
        } catch (IOException e2) {
            e = e2;
            Log.d(TAG, "Failed to load dual camera water mark", e);
            bArr = bArr2;
            decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray != null) {
            }
            return bArr;
        }
        if (!(bArr == null || iArr == null || iArr.length < 4)) {
            decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray != null) {
                int i3 = i;
                int i4 = i2;
                int[] calcDualCameraWatermarkLocation = calcDualCameraWatermarkLocation(i3, i4, decodeByteArray.getWidth(), decodeByteArray.getHeight(), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 1.0f), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 1.0f), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 1.0f));
                System.arraycopy(calcDualCameraWatermarkLocation, 0, iArr, 0, calcDualCameraWatermarkLocation.length);
            }
        }
        return bArr;
        $closeResource(th, fileInputStream);
        throw th2;
    }

    /* JADX INFO: finally extract failed */
    public static long getDuration(FileDescriptor fileDescriptor) {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            mediaMetadataRetriever.setDataSource(fileDescriptor);
            long parseLong = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
            mediaMetadataRetriever.release();
            return parseLong;
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage(), e);
            mediaMetadataRetriever.release();
            return 0;
        } catch (Throwable th) {
            mediaMetadataRetriever.release();
            throw th;
        }
    }

    /* JADX INFO: finally extract failed */
    public static long getDuration(String str) {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            mediaMetadataRetriever.setDataSource(str);
            long parseLong = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
            mediaMetadataRetriever.release();
            return parseLong;
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
            mediaMetadataRetriever.release();
            return 0;
        } catch (Throwable th) {
            mediaMetadataRetriever.release();
            throw th;
        }
    }

    public static ExifInterface getExif(String str) {
        ExifInterface exifInterface = new ExifInterface();
        try {
            exifInterface.readExif(str);
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
        }
        return exifInterface;
    }

    public static ExifInterface getExif(byte[] bArr) {
        ExifInterface exifInterface = new ExifInterface();
        try {
            exifInterface.readExif(bArr);
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
        }
        return exifInterface;
    }

    public static String getFileTitleFromPath(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf("/");
        if (lastIndexOf < 0 || lastIndexOf >= str.length() - 1) {
            return null;
        }
        String substring = str.substring(lastIndexOf + 1);
        if (TextUtils.isEmpty(substring)) {
            return null;
        }
        int indexOf = substring.indexOf(".");
        if (indexOf >= 0) {
            substring = substring.substring(0, indexOf);
        }
        return substring;
    }

    public static byte[] getFirstPlane(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] bArr = new byte[buffer.remaining()];
        buffer.get(bArr);
        return bArr;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0074  */
    private static byte[] getFrontCameraWatermarkData(int i, int i2, int[] iArr) {
        byte[] bArr;
        Bitmap decodeByteArray;
        InputStream open;
        Throwable th;
        Throwable th2;
        StringBuilder sb = new StringBuilder();
        sb.append(android.os.Build.DEVICE);
        sb.append("_front");
        sb.append(b.getGivenName());
        sb.append(".png");
        String sb2 = sb.toString();
        try {
            AssetManager assets = CameraAppImpl.getAndroidContext().getAssets();
            StringBuilder sb3 = new StringBuilder();
            sb3.append("watermarks/");
            sb3.append(sb2);
            open = assets.open(sb3.toString());
            try {
                bArr = IOUtils.toByteArray(open);
                if (open != null) {
                    try {
                        $closeResource(null, open);
                    } catch (IOException e) {
                        e = e;
                    }
                }
            } catch (Throwable th3) {
                Throwable th4 = th3;
                th = r2;
                th2 = th4;
            }
        } catch (IOException e2) {
            e = e2;
            bArr = null;
            Log.d(TAG, "Failed to load front camera water mark", e);
            decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray != null) {
            }
            return bArr;
        }
        if (!(bArr == null || iArr == null || iArr.length < 4)) {
            decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray != null) {
                int i3 = i;
                int i4 = i2;
                int[] calcDualCameraWatermarkLocation = calcDualCameraWatermarkLocation(i3, i4, decodeByteArray.getWidth(), decodeByteArray.getHeight(), CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_size_ratio, 1.0f), CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_x_ratio, 1.0f), CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_y_ratio, 1.0f));
                System.arraycopy(calcDualCameraWatermarkLocation, 0, iArr, 0, calcDualCameraWatermarkLocation.length);
            }
        }
        return bArr;
        if (open != null) {
            $closeResource(th, open);
        }
        throw th2;
    }

    public static int getIntField(String str, Object obj, String str2, String str3) {
        try {
            return Field.of(str, str2, str3).getInt(obj);
        } catch (NoSuchClassException e) {
            String str4 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("no class ");
            sb.append(str);
            Log.e(str4, sb.toString(), e);
            return Integer.MIN_VALUE;
        } catch (NoSuchFieldException e2) {
            Log.e(TAG, "no field ", e2);
            return Integer.MIN_VALUE;
        }
    }

    public static int getJpegRotation(int i, int i2) {
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i);
        int sensorOrientation = capabilities.getSensorOrientation();
        if (i2 != -1) {
            return capabilities.getFacing() == 0 ? ((sensorOrientation - i2) + 360) % 360 : (sensorOrientation + i2) % 360;
        }
        Log.w(TAG, "getJpegRotation: orientation UNKNOWN!!! return sensorOrientation...");
        return sensorOrientation;
    }

    public static Typeface getLanTineGBTypeface(Context context) {
        return getTypeface(context, "MI+LanTing_GB+Outside+YS_V2.3_20160322.ttf");
    }

    public static Typeface getMFYueYuanTypeface(Context context) {
        return getTypeface(context, "MFYueYuan-Regular.ttf");
    }

    public static Method getMethod(Class<?>[] clsArr, String str, String str2) {
        Method method = null;
        if (clsArr != null) {
            try {
                if (clsArr.length == 1) {
                    method = Method.of(clsArr[0], str, str2);
                }
            } catch (NoSuchMethodException e) {
                if (clsArr[0].getSuperclass() != null) {
                    clsArr[0] = clsArr[0].getSuperclass();
                    method = getMethod(clsArr, str, str2);
                }
            }
        }
        if (method == null) {
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getMethod fail, ");
            sb.append(str);
            sb.append("[");
            sb.append(str2);
            sb.append("]");
            Log.e(str3, sb.toString());
        }
        return method;
    }

    public static Typeface getMiuiTimeTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Time.ttf");
    }

    public static Typeface getMiuiTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Normal.ttf");
    }

    public static int getNavigationBarHeight(Context context) {
        Resources resources = context.getResources();
        int dimensionPixelSize = resources.getDimensionPixelSize(resources.getIdentifier("navigation_bar_height", "dimen", "android"));
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("navBarHeight=");
        sb.append(dimensionPixelSize);
        Log.v(str, sb.toString());
        return dimensionPixelSize;
    }

    public static CameraSize getOptimalJpegThumbnailSize(List<CameraSize> list, double d) {
        CameraSize cameraSize = null;
        if (list == null) {
            Log.w(TAG, "null thumbnail size list");
            return null;
        }
        double d2 = 0.0d;
        for (CameraSize cameraSize2 : list) {
            if (!(cameraSize2.getWidth() == 0 || cameraSize2.getHeight() == 0)) {
                double width = ((double) cameraSize2.getWidth()) / ((double) cameraSize2.getHeight());
                double abs = Math.abs(width - d);
                double d3 = d2 - d;
                if ((abs <= Math.abs(d3) || abs <= 0.001d) && (cameraSize == null || abs < Math.abs(d3) || cameraSize2.getWidth() > cameraSize.getWidth())) {
                    cameraSize = cameraSize2;
                    d2 = width;
                }
            }
        }
        if (cameraSize == null) {
            Log.w(TAG, "No thumbnail size match the aspect ratio");
            for (CameraSize cameraSize3 : list) {
                if (cameraSize == null || cameraSize3.getWidth() > cameraSize.getWidth()) {
                    cameraSize = cameraSize3;
                }
            }
        }
        return cameraSize;
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:35:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0082  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00a1  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x0136  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x0139  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0189  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x0132 A[SYNTHETIC] */
    public static CameraSize getOptimalPreviewSize(int i, int i2, List<CameraSize> list, double d) {
        boolean z;
        Point point;
        Iterator it;
        CameraSize cameraSize;
        CameraSize cameraSize2;
        int i3 = i;
        CameraSize cameraSize3 = null;
        if (list == null) {
            Log.w(TAG, "null preview size list");
            return null;
        }
        int integer = d.getInteger(d.wa, 0);
        int i4 = 1080;
        if (integer != 0) {
            boolean z2 = i2 == Camera2DataContainer.getInstance().getFrontCameraId();
            if (sWindowWidth < 1080) {
                integer &= -15;
            }
            if (((((z2 ? 2 : 1) << ((i3 == 162 || i3 == 169 || i3 == 168 || i3 == 170 || i3 == 174) ? 2 : 0)) | 0) & integer) != 0) {
                z = true;
                point = new Point(sWindowWidth, !z ? Math.min(sWindowHeight, 1920) : sWindowHeight);
                if (!b.iC() && b.iw()) {
                    i4 = LIMIT_SURFACE_WIDTH;
                }
                if (point.x > i4) {
                    point.y = (point.y * i4) / point.x;
                    point.x = i4;
                }
                it = list.iterator();
                cameraSize = null;
                double d2 = Double.MAX_VALUE;
                double d3 = Double.MAX_VALUE;
                while (true) {
                    if (it.hasNext()) {
                        cameraSize2 = cameraSize3;
                        break;
                    }
                    cameraSize2 = (CameraSize) it.next();
                    Iterator it2 = it;
                    if (Math.abs((((double) cameraSize2.width) / ((double) cameraSize2.height)) - d) <= 0.02d) {
                        if (!z || (point.x > cameraSize2.height && point.y > cameraSize2.width)) {
                            int abs = Math.abs(point.x - cameraSize2.height) + Math.abs(point.y - cameraSize2.width);
                            if (abs == 0) {
                                cameraSize = cameraSize2;
                                break;
                            }
                            if (cameraSize2.height <= point.x && cameraSize2.width <= point.y) {
                                double d4 = (double) abs;
                                if (d4 < d2) {
                                    d2 = d4;
                                    cameraSize = cameraSize2;
                                }
                            }
                            double d5 = (double) abs;
                            if (d5 < d3) {
                                d3 = d5;
                                cameraSize3 = cameraSize2;
                            }
                        } else {
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("getOptimalPreviewSize: ");
                            sb.append(cameraSize2.toString());
                            sb.append(" | ");
                            sb.append(point.toString());
                            Log.e(str, sb.toString());
                        }
                    }
                    it = it2;
                }
                if (cameraSize == null) {
                    cameraSize = cameraSize2;
                }
                if (cameraSize == null) {
                    Log.w(TAG, String.format(Locale.ENGLISH, "no preview size match the aspect ratio: %.2f", new Object[]{Double.valueOf(d)}));
                    double d6 = Double.MAX_VALUE;
                    for (CameraSize cameraSize4 : list) {
                        double abs2 = (double) (Math.abs(point.x - cameraSize4.getHeight()) + Math.abs(point.y - cameraSize4.getWidth()));
                        if (abs2 < d6) {
                            cameraSize = cameraSize4;
                            d6 = abs2;
                        }
                    }
                }
                if (cameraSize != null) {
                    Log.i(TAG, String.format(Locale.ENGLISH, "best preview size: %dx%d", new Object[]{Integer.valueOf(cameraSize.getWidth()), Integer.valueOf(cameraSize.getHeight())}));
                }
                return cameraSize;
            }
        }
        z = false;
        point = new Point(sWindowWidth, !z ? Math.min(sWindowHeight, 1920) : sWindowHeight);
        i4 = LIMIT_SURFACE_WIDTH;
        if (point.x > i4) {
        }
        it = list.iterator();
        cameraSize = null;
        double d22 = Double.MAX_VALUE;
        double d32 = Double.MAX_VALUE;
        while (true) {
            if (it.hasNext()) {
            }
            it = it2;
        }
        if (cameraSize == null) {
        }
        if (cameraSize == null) {
        }
        if (cameraSize != null) {
        }
        return cameraSize;
    }

    public static CameraSize getOptimalVideoSnapshotPictureSize(List<CameraSize> list, double d, int i, int i2) {
        CameraSize cameraSize = null;
        if (list == null) {
            Log.e(TAG, "null size list");
            return null;
        }
        for (CameraSize cameraSize2 : list) {
            if (Math.abs((((double) cameraSize2.getWidth()) / ((double) cameraSize2.getHeight())) - d) <= 0.02d && ((cameraSize == null || cameraSize2.getWidth() > cameraSize.getWidth()) && cameraSize2.getWidth() <= i && cameraSize2.getHeight() <= i2)) {
                cameraSize = cameraSize2;
            }
        }
        if (cameraSize == null) {
            Log.w(TAG, "No picture size match the aspect ratio");
            for (CameraSize cameraSize3 : list) {
                if (cameraSize == null || cameraSize3.getWidth() > cameraSize.getWidth()) {
                    cameraSize = cameraSize3;
                }
            }
        }
        return cameraSize;
    }

    public static byte[] getPixels(byte[] bArr, int i, int i2, int[] iArr) {
        if (bArr == null) {
            return null;
        }
        byte[] bArr2 = new byte[(iArr[2] * iArr[3] * i2)];
        int i3 = ((iArr[1] * i) + iArr[0]) * i2;
        int i4 = 0;
        for (int i5 = 0; i5 < iArr[3]; i5++) {
            System.arraycopy(bArr, i3, bArr2, i4, iArr[2] * i2);
            i3 += i * i2;
            i4 += iArr[2] * i2;
        }
        return bArr2;
    }

    public static Rect getPreviewRect(Context context) {
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        Rect displayRect = getDisplayRect(context, uiStyle);
        if (uiStyle == 3 && isNotchDevice && DataRepository.dataItemFeature().fR()) {
            displayRect.top = 0;
        }
        return displayRect;
    }

    public static float getRatio(String str) {
        char c;
        switch (str.hashCode()) {
            case 50858:
                if (str.equals(ComponentConfigRatio.RATIO_1X1)) {
                    c = 2;
                    break;
                }
            case 53743:
                if (str.equals(ComponentConfigRatio.RATIO_4X3)) {
                    c = 0;
                    break;
                }
            case 1515430:
                if (str.equals(ComponentConfigRatio.RATIO_16X9)) {
                    c = 1;
                    break;
                }
            case 1517352:
                if (str.equals(ComponentConfigRatio.RATIO_FULL_18X9)) {
                    c = 3;
                    break;
                }
            case 1518313:
                if (str.equals(ComponentConfigRatio.RATIO_FULL_19X9)) {
                    c = 4;
                    break;
                }
            case 1456894192:
                if (str.equals(ComponentConfigRatio.RATIO_FULL_195X9)) {
                    c = 5;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                return 1.33f;
            case 1:
                return 1.77f;
            case 2:
                return 1.0f;
            case 3:
                return 2.0f;
            case 4:
                return 2.11f;
            case 5:
                return 2.16f;
            default:
                return 1.33f;
        }
    }

    public static int[] getRelativeLocation(View view, View view2) {
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        int i = iArr[0];
        int i2 = iArr[1];
        view2.getLocationInWindow(iArr);
        iArr[0] = iArr[0] - i;
        iArr[1] = iArr[1] - i2;
        return iArr;
    }

    public static double getScreenInches(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        double sqrt = Math.sqrt(Math.pow((double) (((float) sWindowWidth) / displayMetrics.xdpi), 2.0d) + Math.pow((double) (((float) sWindowHeight) / displayMetrics.ydpi), 2.0d));
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getScreenInches=");
        sb.append(sqrt);
        Log.d(str, sb.toString());
        return sqrt;
    }

    public static int getScreenLightColor(int i) {
        initScreenLightColorMap();
        if (COLOR_TEMPERATURE_LIST.size() == 0 || COLOR_TEMPERATURE_MAP.size() == 0) {
            Log.e(TAG, "color temperature list empty!");
            return -1;
        }
        int binarySearchRightMost = binarySearchRightMost(COLOR_TEMPERATURE_LIST, Integer.valueOf(i));
        if (binarySearchRightMost >= COLOR_TEMPERATURE_LIST.size()) {
            binarySearchRightMost = COLOR_TEMPERATURE_LIST.size() - 1;
        } else if (binarySearchRightMost > 0) {
            int i2 = binarySearchRightMost - 1;
            if (((Integer) COLOR_TEMPERATURE_LIST.get(binarySearchRightMost)).intValue() - i > i - ((Integer) COLOR_TEMPERATURE_LIST.get(i2)).intValue()) {
                binarySearchRightMost = i2;
            }
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getScreenLightColor ");
        sb.append(i);
        sb.append("K -> ");
        sb.append(COLOR_TEMPERATURE_LIST.get(binarySearchRightMost));
        sb.append(GpsSpeedRef.KILOMETERS);
        Log.d(str, sb.toString());
        return ((Integer) COLOR_TEMPERATURE_MAP.get(binarySearchRightMost)).intValue();
    }

    public static int getSensorOrientation(int i) {
        return Camera2DataContainer.getInstance().getCapabilities(i).getSensorOrientation();
    }

    public static int getShootOrientation(Activity activity, int i) {
        return ((i - getDisplayRotation(activity)) + 360) % 360;
    }

    public static float getShootRotation(Activity activity, float f) {
        float displayRotation = f - ((float) getDisplayRotation(activity));
        while (displayRotation < 0.0f) {
            displayRotation += 360.0f;
        }
        while (displayRotation > 360.0f) {
            displayRotation -= 360.0f;
        }
        return displayRotation;
    }

    private static Object getStaticObjectField(Class<?> cls, String str) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
        java.lang.reflect.Field declaredField = cls.getDeclaredField(str);
        declaredField.setAccessible(true);
        return declaredField.get(str);
    }

    public static int getStatusBarHeight(Context context) {
        int i;
        if (DataRepository.dataItemFeature().hg()) {
            i = context.getResources().getDimensionPixelSize(R.dimen.camera_status_bar_height);
        } else {
            int identifier = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
            i = identifier > 0 ? context.getResources().getDimensionPixelSize(identifier) : 0;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("StatusBarHeight=");
        sb.append(i);
        Log.v(str, sb.toString());
        return i;
    }

    public static File getStorageDirectory() {
        return isExternalStorageMounted() ? Environment.getExternalStorageDirectory() : INTERNAL_STORAGE_DIRECTORY;
    }

    public static MiYuvImage getSubYuvImage(byte[] bArr, int i, int i2, int i3, int i4, int[] iArr) {
        byte[] bArr2 = new byte[(((iArr[2] * iArr[3]) * 3) / 2)];
        int i5 = (iArr[1] * i3) + iArr[0];
        int i6 = 0;
        for (int i7 = 0; i7 < iArr[3]; i7++) {
            System.arraycopy(bArr, i5, bArr2, i6, iArr[2]);
            i5 += i3;
            i6 += iArr[2];
        }
        int i8 = (i3 * (i2 - 1)) + i + ((iArr[1] / 2) * i4) + iArr[0];
        for (int i9 = 0; i9 < iArr[3] / 2; i9++) {
            System.arraycopy(bArr, i8, bArr2, i6, iArr[2]);
            i8 += i4;
            i6 += iArr[2];
        }
        return new MiYuvImage(bArr2, iArr[2], iArr[3], 35);
    }

    public static byte[] getTimeWaterMarkData(int i, int i2, String str, int[] iArr) {
        NewStyleTextWaterMark newStyleTextWaterMark = new NewStyleTextWaterMark(str, i, i2, 0);
        if (iArr != null && iArr.length >= 4) {
            iArr[0] = newStyleTextWaterMark.getWidth();
            iArr[1] = newStyleTextWaterMark.getHeight();
            iArr[2] = newStyleTextWaterMark.getPaddingX();
            iArr[3] = newStyleTextWaterMark.getPaddingY();
        }
        return ((StringTexture) newStyleTextWaterMark.getTexture()).getBitmapData(CompressFormat.PNG);
    }

    public static String getTimeWatermark() {
        return getTimeWatermark(b.hM());
    }

    public static String getTimeWatermark(boolean z) {
        StringBuilder sb = new StringBuilder();
        if (z) {
            sb.append(new SimpleDateFormat("yyyy/M/d", Locale.ENGLISH).format(new Date()).toCharArray());
        } else {
            sb.append(new SimpleDateFormat("yyyy-M-d", Locale.ENGLISH).format(new Date()).toCharArray());
        }
        sb.append(" ");
        Time time = new Time();
        time.set(System.currentTimeMillis());
        sb.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(time.hour)}));
        sb.append(":");
        sb.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(time.minute)}));
        return sb.toString();
    }

    private static synchronized Typeface getTypeface(Context context, String str) {
        Typeface typeface;
        synchronized (Util.class) {
            if (!sTypefaces.containsKey(str)) {
                sTypefaces.put(str, Typeface.createFromAsset(context.getAssets(), str));
            }
            typeface = (Typeface) sTypefaces.get(str);
        }
        return typeface;
    }

    public static int[] getWatermarkRange(int i, int i2, int i3, boolean z, boolean z2, float f) {
        int[] iArr = new int[4];
        if (i3 != 0) {
            if (i3 != 90) {
                if (i3 != 180) {
                    if (i3 == 270) {
                        if (z && z2) {
                            iArr[0] = 0;
                            int i4 = (int) (((float) i2) * f);
                            iArr[1] = i2 - i4;
                            iArr[2] = i;
                            iArr[3] = i4;
                        } else if (z) {
                            iArr[0] = 0;
                            int i5 = (int) (((float) i2) * f);
                            iArr[1] = i2 - i5;
                            iArr[2] = i / 2;
                            iArr[3] = i5;
                        } else {
                            int i6 = i / 2;
                            iArr[0] = i6;
                            int i7 = (int) (((float) i2) * f);
                            iArr[1] = i2 - i7;
                            iArr[2] = i6;
                            iArr[3] = i7;
                        }
                    }
                } else if (z && z2) {
                    iArr[0] = 0;
                    iArr[1] = 0;
                    iArr[2] = (int) (((float) i) * f);
                    iArr[3] = i2;
                } else if (z) {
                    iArr[0] = 0;
                    iArr[1] = 0;
                    iArr[2] = (int) (((float) i) * f);
                    iArr[3] = (int) (((float) i2) * 0.6f);
                } else {
                    iArr[0] = 0;
                    int i8 = i2 / 2;
                    iArr[1] = i8;
                    iArr[2] = (int) (((float) i) * f);
                    iArr[3] = i8;
                }
            } else if (z && z2) {
                iArr[0] = 0;
                iArr[1] = 0;
                iArr[2] = i;
                iArr[3] = (int) (((float) i2) * f);
            } else if (z) {
                int i9 = i / 2;
                iArr[0] = i9;
                iArr[1] = 0;
                iArr[2] = i9;
                iArr[3] = (int) (((float) i2) * f);
            } else {
                iArr[0] = 0;
                iArr[1] = 0;
                iArr[2] = i / 2;
                iArr[3] = (int) (((float) i2) * f);
            }
        } else if (z && z2) {
            int i10 = (int) (((float) i) * f);
            iArr[0] = i - i10;
            iArr[1] = 0;
            iArr[2] = i10;
            iArr[3] = i2;
        } else if (z) {
            int i11 = (int) (((float) i) * f);
            iArr[0] = i - i11;
            float f2 = (float) i2;
            iArr[1] = (int) (0.4f * f2);
            iArr[2] = i11;
            iArr[3] = (int) (f2 * 0.6f);
        } else {
            int i12 = (int) (((float) i) * f);
            iArr[0] = i - i12;
            iArr[1] = 0;
            iArr[2] = i12;
            iArr[3] = i2 / 2;
        }
        iArr[0] = (iArr[0] / 2) * 2;
        iArr[1] = (iArr[1] / 2) * 2;
        iArr[2] = (iArr[2] / 4) * 4;
        iArr[3] = (iArr[3] / 4) * 4;
        return iArr;
    }

    public static String getZoomRatioText(float f) {
        StringBuilder sb = new StringBuilder();
        float decimal = HybridZoomingSystem.toDecimal(f);
        int i = (int) decimal;
        if (((int) ((10.0f * decimal) - ((float) (i * 10)))) == 0) {
            sb.append(String.valueOf(i));
        } else {
            sb.append(String.valueOf(decimal));
        }
        sb.append("X");
        return sb.toString();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:47:0x010b, code lost:
        if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0132;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x0122, code lost:
        if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0132;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x012b, code lost:
        if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0132;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x012d, code lost:
        ((android.content.res.XmlResourceParser) r0).close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x0132, code lost:
        return;
     */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x007d A[Catch:{ XmlPullParserException -> 0x0125, IOException -> 0x011c, all -> 0x010e }] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x0106 A[EDGE_INSN: B:63:0x0106->B:46:0x0106 ?: BREAK  
EDGE_INSN: B:63:0x0106->B:46:0x0106 ?: BREAK  
EDGE_INSN: B:63:0x0106->B:46:0x0106 ?: BREAK  , SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x0106 A[EDGE_INSN: B:63:0x0106->B:46:0x0106 ?: BREAK  
EDGE_INSN: B:63:0x0106->B:46:0x0106 ?: BREAK  , SYNTHETIC] */
    private static void initScreenLightColorMap() {
        FileReader fileReader;
        XmlPullParser xmlPullParser;
        if (COLOR_TEMPERATURE_LIST.size() <= 0 && COLOR_TEMPERATURE_MAP.size() <= 0) {
            File colorMapXmlMapFile = getColorMapXmlMapFile();
            if (colorMapXmlMapFile != null) {
                try {
                    fileReader = new FileReader(colorMapXmlMapFile);
                    try {
                        XmlPullParserFactory newInstance = XmlPullParserFactory.newInstance();
                        newInstance.setNamespaceAware(false);
                        xmlPullParser = newInstance.newPullParser();
                        try {
                            xmlPullParser.setInput(fileReader);
                        } catch (FileNotFoundException | XmlPullParserException e) {
                            e = e;
                        }
                    } catch (FileNotFoundException | XmlPullParserException e2) {
                        e = e2;
                        xmlPullParser = null;
                        e.printStackTrace();
                        if (xmlPullParser == null) {
                        }
                        while (true) {
                            try {
                                if (xmlPullParser.next() == 3) {
                                }
                            } catch (XmlPullParserException e3) {
                                closeSafely(fileReader);
                            } catch (IOException e4) {
                                closeSafely(fileReader);
                            } catch (Throwable th) {
                                closeSafely(fileReader);
                                if (xmlPullParser instanceof XmlResourceParser) {
                                    ((XmlResourceParser) xmlPullParser).close();
                                }
                                throw th;
                            }
                        }
                        closeSafely(fileReader);
                    }
                } catch (FileNotFoundException | XmlPullParserException e5) {
                    e = e5;
                    xmlPullParser = null;
                    fileReader = null;
                    e.printStackTrace();
                    if (xmlPullParser == null) {
                    }
                    while (true) {
                        if (xmlPullParser.next() == 3) {
                        }
                    }
                    closeSafely(fileReader);
                }
            } else {
                xmlPullParser = null;
                fileReader = null;
            }
            if (xmlPullParser == null) {
                Log.d(TAG, "Cannot find screen color map in system, try local resource.");
                int identifier = CameraAppImpl.getAndroidContext().getResources().getIdentifier("screen_light", "xml", CameraAppImpl.getAndroidContext().getPackageName());
                if (identifier <= 0) {
                    Log.e(TAG, "res/xml/screen_light.xml not found!");
                    return;
                }
                xmlPullParser = CameraAppImpl.getAndroidContext().getResources().getXml(identifier);
            }
            while (true) {
                if (xmlPullParser.next() == 3) {
                    break;
                } else if (xmlPullParser.getEventType() == 2) {
                    if (!"screen".equals(xmlPullParser.getName())) {
                        continue;
                    } else if (!SCREEN_VENDOR.equals(xmlPullParser.getAttributeValue(null, d.vm))) {
                        skip(xmlPullParser);
                    } else {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("load screen light parameters for ");
                        sb.append(SCREEN_VENDOR);
                        Log.d(str, sb.toString());
                        while (true) {
                            if (xmlPullParser.next() == 1) {
                                break;
                            } else if (xmlPullParser.getEventType() == 2) {
                                if (!"light".equals(xmlPullParser.getName())) {
                                    break;
                                }
                                int attributeIntValue = getAttributeIntValue(xmlPullParser, "CCT", 0);
                                int attributeIntValue2 = getAttributeIntValue(xmlPullParser, "R", 0);
                                int attributeIntValue3 = getAttributeIntValue(xmlPullParser, "G", 0);
                                int attributeIntValue4 = getAttributeIntValue(xmlPullParser, "B", 0);
                                COLOR_TEMPERATURE_LIST.add(Integer.valueOf(attributeIntValue));
                                COLOR_TEMPERATURE_MAP.add(Integer.valueOf(Color.rgb(attributeIntValue2, attributeIntValue3, attributeIntValue4)));
                            }
                        }
                    }
                }
            }
            closeSafely(fileReader);
        }
    }

    public static void initialize(Context context) {
        updateDeviceConfig(context);
        sIsnotchScreenHidden = isNotchScreenHidden(context);
        isNotchDevice = SystemProperties.getInt("ro.miui.notch", 0) == 1 && !sIsnotchScreenHidden;
        if (android.os.Build.DEVICE.equalsIgnoreCase("laurel_sprout")) {
            isNotchDevice = !sIsnotchScreenHidden;
        }
        sIsFullScreenNavBarHidden = isFullScreenNavBarHidden(context);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        sPixelDensity = displayMetrics.noncompatDensity;
        sImageFileNamer = new ImageFileNamer(context.getString(R.string.image_file_name_format));
        Point point = new Point();
        windowManager.getDefaultDisplay().getRealSize(point);
        if (point.x < point.y) {
            sWindowWidth = point.x;
            sWindowHeight = point.y;
        } else {
            sWindowWidth = point.y;
            sWindowHeight = point.x;
        }
        if ("hercules".equals(android.os.Build.DEVICE)) {
            sWindowHeight = 2244;
        }
        isLongRatioScreen = isLongRatioScreen(sWindowWidth, sWindowHeight);
        sFullScreenExtraMargin = context.getResources().getDimensionPixelSize(R.dimen.fullscreen_extra_margin);
        sNavigationBarHeight = checkDeviceHasNavigationBar(context) ? getNavigationBarHeight(context) : calcNavigationBarHeight(context);
        if (isNotchDevice) {
            if (isLongRatioScreen) {
                sStatusBarHeight = getStatusBarHeight(context);
            } else {
                sStatusBarHeight = sWindowHeight - (sWindowWidth * 2);
            }
            if (sIsFullScreenNavBarHidden && !isLongRatioScreen) {
                sNavigationBarHeight -= sFullScreenExtraMargin;
                sStatusBarHeight += sFullScreenExtraMargin / 2;
            }
        } else {
            sStatusBarHeight = 0;
        }
        CameraSettings.BOTTOM_CONTROL_HEIGHT = getBottomHeight(context.getResources());
        sAAID = Global.getString(context.getContentResolver(), "ad_aaid");
        Log.i(TAG, String.format(Locale.ENGLISH, "windowSize=%dx%d density=%.4f", new Object[]{Integer.valueOf(sWindowWidth), Integer.valueOf(sWindowHeight), Float.valueOf(sPixelDensity)}));
    }

    public static void installPackage(Context context, String str, PackageInstallerListener packageInstallerListener, boolean z, boolean z2) {
        if (context == null || TextUtils.isEmpty(str)) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("invalid params. pkgName=");
            sb.append(str);
            Log.w(str2, sb.toString());
            return;
        }
        try {
            Object packageInstallObserver = CompatibilityUtils.getPackageInstallObserver(packageInstallerListener);
            Class cls = Class.forName("miui.content.pm.PreloadedAppPolicy");
            Method of = Method.of(cls, "installPreloadedDataApp", CompatibilityUtils.getInstallMethodDescription());
            int i = z ? 1 : z2 ? 2 : 0;
            boolean invokeBoolean = of.invokeBoolean(cls, null, new Object[]{context, str, packageInstallObserver, Integer.valueOf(i)});
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("installPackage: result=");
            sb2.append(invokeBoolean);
            Log.d(str3, sb2.toString());
        } catch (Exception e) {
            Log.e(TAG, e.getMessage(), e);
            if (packageInstallerListener != null) {
                packageInstallerListener.onPackageInstalled(str, false);
            }
        }
    }

    public static boolean isAEStable(int i) {
        switch (i) {
            case 2:
            case 3:
            case 4:
                return true;
            default:
                return false;
        }
    }

    public static boolean isAWBStable(int i) {
        switch (i) {
            case 2:
            case 3:
                return true;
            default:
                return false;
        }
    }

    private static boolean isAccessibilityEnable() {
        return sIsAccessibilityEnable;
    }

    public static boolean isAccessible() {
        return VERSION.SDK_INT >= 14 && isAccessibilityEnable();
    }

    public static boolean isActivityInvert(Activity activity) {
        return getDisplayRotation(activity) == 180;
    }

    public static boolean isAntibanding60() {
        return ANTIBANDING_60_COUNTRY.contains(mCountryIso);
    }

    public static final boolean isAppLocked(Context context, String str) {
        return GeneralUtils.isAppLocked(context, str);
    }

    public static boolean isContains(RectF rectF, RectF rectF2) {
        boolean z = false;
        if (rectF == null || rectF2 == null) {
            return false;
        }
        if (rectF.left < rectF.right && rectF.top < rectF.bottom && rectF.left <= rectF2.left && rectF.top <= rectF2.top && rectF.right >= rectF2.right && rectF.bottom >= rectF2.bottom) {
            z = true;
        }
        return z;
    }

    public static boolean isDebugOsBuild() {
        return "userdebug".equals(android.os.Build.TYPE) || "eng".equals(android.os.Build.TYPE) || sIsDumpLog;
    }

    private static boolean isDevices(String str) {
        try {
            Class cls = Class.forName("miui.os.Build");
            if (cls != null) {
                Object staticObjectField = getStaticObjectField(cls, str);
                if (staticObjectField == null) {
                    return false;
                }
                return Boolean.parseBoolean(staticObjectField.toString());
            }
        } catch (Exception e) {
            Log.e(TAG, "getClass error", e);
        }
        return false;
    }

    public static boolean isDumpImageEnabled() {
        if (sIsDumpImageEnabled == null) {
            sIsDumpImageEnabled = Boolean.valueOf(new File(Storage.generatePrimaryFilepath("algoup_dump_images")).exists());
        }
        return sIsDumpImageEnabled.booleanValue();
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0067 A[SYNTHETIC, Splitter:B:30:0x0067] */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x0079 A[SYNTHETIC, Splitter:B:36:0x0079] */
    private static boolean isEqual(byte[] bArr, File file) {
        if (bArr == null || bArr.length == 0 || !file.exists()) {
            return false;
        }
        FileInputStream fileInputStream = null;
        byte[] bArr2 = new byte[512];
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            FileInputStream fileInputStream2 = new FileInputStream(file);
            while (true) {
                try {
                    int read = fileInputStream2.read(bArr2, 0, 512);
                    if (read == -1) {
                        break;
                    }
                    instance.update(bArr2, 0, read);
                } catch (IOException | NoSuchAlgorithmException e) {
                    e = e;
                    fileInputStream = fileInputStream2;
                    try {
                        Log.e(TAG, e.getMessage(), e);
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (IOException e2) {
                                Log.e(TAG, e2.getMessage(), e2);
                            }
                        }
                        return false;
                    } catch (Throwable th) {
                        th = th;
                        fileInputStream2 = fileInputStream;
                        if (fileInputStream2 != null) {
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (fileInputStream2 != null) {
                        try {
                            fileInputStream2.close();
                        } catch (IOException e3) {
                            Log.e(TAG, e3.getMessage(), e3);
                        }
                    }
                    throw th;
                }
            }
            String str = new String(instance.digest());
            instance.reset();
            boolean equals = str.equals(new String(instance.digest(bArr)));
            try {
                fileInputStream2.close();
            } catch (IOException e4) {
                Log.e(TAG, e4.getMessage(), e4);
            }
            return equals;
        } catch (IOException | NoSuchAlgorithmException e5) {
            e = e5;
            Log.e(TAG, e.getMessage(), e);
            if (fileInputStream != null) {
            }
            return false;
        }
    }

    public static boolean isEqualsZero(double d) {
        return Math.abs(d) < 1.0E-8d;
    }

    public static boolean isExternalStorageMounted() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    public static boolean isFingerPrintKeyEvent(KeyEvent keyEvent) {
        return keyEvent != null && 27 == keyEvent.getKeyCode() && keyEvent.getDevice() != null && b.iT().contains(keyEvent.getDevice().getName());
    }

    public static boolean isForceNameSuffix() {
        if (sIsForceNameSuffix == null) {
            sIsForceNameSuffix = Boolean.valueOf(new File(Storage.generatePrimaryFilepath(FORCE_NAME_SUFFIX_FILE)).exists());
        }
        return sIsForceNameSuffix.booleanValue();
    }

    public static boolean isFullScreenNavBarHidden(Context context) {
        return MiuiSettings.Global.getBoolean(context.getContentResolver(), "force_fsg_nav_bar");
    }

    public static boolean isGlobalVersion() {
        return SystemProperties.get("ro.product.mod_device", "").contains("_global") || DataRepository.dataItemFeature().hg();
    }

    private static boolean isGyroscopeStable(float[] fArr) {
        boolean z = false;
        if (fArr == null || fArr.length != 3) {
            return false;
        }
        if (Math.abs(fArr[0]) < 0.7f && Math.abs(fArr[1]) < 5.0f && Math.abs(fArr[2]) < 0.7f) {
            z = true;
        }
        return z;
    }

    public static boolean isGyroscopeStable(float[] fArr, float[] fArr2) {
        if (fArr == null) {
            return true;
        }
        boolean isGyroscopeStable = isGyroscopeStable(fArr);
        if (!isGyroscopeStable) {
            return false;
        }
        if (fArr2 == null) {
            return true;
        }
        if (isGyroscopeStable(fArr2)) {
            return isGyroscopeStable;
        }
        return false;
    }

    public static boolean isInVideoCall(Activity activity) {
        if (!b.isMTKPlatform() || !PermissionManager.checkPhoneStatePermission(activity)) {
            return false;
        }
        return CompatibilityUtils.isInVideoCall(activity);
    }

    public static boolean isInternationalBuild() {
        return SystemProperties.get("ro.product.mod_device", "").endsWith("_global");
    }

    public static boolean isLabOptionsVisible() {
        if (sIsLabOptionsVisible == null) {
            sIsLabOptionsVisible = Boolean.valueOf(new File(Storage.generatePrimaryFilepath(LAB_OPTIONS_VISIBLE_FILE)).exists());
        }
        return sIsLabOptionsVisible.booleanValue();
    }

    public static boolean isLayoutRTL(Context context) {
        boolean z = false;
        if (context == null) {
            return false;
        }
        if (context.getResources().getConfiguration().getLayoutDirection() == 1) {
            z = true;
        }
        return z;
    }

    public static boolean isLivePhotoStable(LivePhotoResult livePhotoResult, int i) {
        return livePhotoResult != null && isAEStable(livePhotoResult.getAEState()) && isAWBStable(livePhotoResult.getAWBState()) && livePhotoResult.isGyroScopeStable() && livePhotoResult.getFilterId() == i;
    }

    private static boolean isLongRatioScreen(int i, int i2) {
        float f = ((float) i2) / ((float) i);
        return ((double) Math.abs(f - 2.16f)) < 0.02d || ((double) Math.abs(f - 2.11f)) < 0.02d || "hercules".equals(android.os.Build.DEVICE);
    }

    public static boolean isMemoryRich(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        MemoryInfo memoryInfo = new MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);
        return memoryInfo.availMem > 419430400;
    }

    public static boolean isNonUI() {
        return SystemProperties.getBoolean(NONUI_MODE_PROPERTY, false);
    }

    public static boolean isNonUIEnabled() {
        return !SystemProperties.get(NONUI_MODE_PROPERTY).equals("");
    }

    public static boolean isNotchScreenHidden(Context context) {
        if (VERSION.SDK_INT < 28) {
            return false;
        }
        boolean z = true;
        if (Global.getInt(context.getContentResolver(), "force_black_v2", 0) != 1) {
            z = false;
        }
        return z;
    }

    public static boolean isPackageAvailable(Context context, String str) {
        if (context == null || str == null || str.isEmpty()) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("invalid params. packageName=");
            sb.append(str);
            Log.w(str2, sb.toString());
            return false;
        }
        try {
            int applicationEnabledSetting = context.getPackageManager().getApplicationEnabledSetting(str);
            boolean z = true;
            if (!(applicationEnabledSetting == 0 || applicationEnabledSetting == 1)) {
                z = false;
            }
            return z;
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
            return false;
        } catch (NullPointerException e2) {
            Log.e(TAG, e2.getMessage());
            return false;
        }
    }

    public static boolean isPathExist(String str) {
        return !TextUtils.isEmpty(str) && new File(str).exists();
    }

    public static boolean isProduceFocusInfoSuccess(byte[] bArr) {
        return bArr != null && 25 < bArr.length && bArr[bArr.length - 25] == 0;
    }

    public static boolean isQuotaExceeded(Exception exc) {
        if (exc != null && (exc instanceof FileNotFoundException)) {
            String message = exc.getMessage();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("isQuotaExceeded: msg=");
            sb.append(message);
            Log.e(str, sb.toString());
            if (message != null) {
                return message.toLowerCase().contains("quota exceeded");
            }
        }
        return false;
    }

    public static boolean isScreenSlideOff(Context context) {
        return System.getInt(context.getContentResolver(), "sc_status", -1) == 1;
    }

    public static boolean isSetContentDesc() {
        return "1".equals(SystemProperties.get("camera.content.description.debug"));
    }

    public static boolean isShowAfRegionView() {
        return "1".equals(SystemProperties.get("camera.preview.debug.afRegion_view"));
    }

    public static boolean isShowDebugInfo() {
        return "1".equals(SystemProperties.get("persist.camera.enable.log")) || "1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.show_awb")) || "1".equals(SystemProperties.get("persist.camera.debug.show_aec")) || "1".equals(SystemProperties.get("persist.camera.debug.autoscene")) || "1".equals(SystemProperties.get("persist.camera.debug.hht"));
    }

    public static boolean isShowDebugInfoView() {
        return "1".equals(SystemProperties.get("camera.preview.debug.debugInfo_view"));
    }

    public static boolean isShowPreviewDebugInfo() {
        return "1".equals(SystemProperties.get("camera.preview.enable.log"));
    }

    public static boolean isStringValueContained(Object obj, int i) {
        return isStringValueContained(obj, (CharSequence[]) CameraAppImpl.getAndroidContext().getResources().getStringArray(i));
    }

    public static boolean isStringValueContained(Object obj, List<? extends CharSequence> list) {
        if (list == null || obj == null) {
            return false;
        }
        for (CharSequence equals : list) {
            if (equals.equals(obj)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isStringValueContained(Object obj, CharSequence[] charSequenceArr) {
        if (charSequenceArr == null || obj == null) {
            return false;
        }
        for (CharSequence equals : charSequenceArr) {
            if (equals.equals(obj)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isSupported(int i, int[] iArr) {
        return getArrayIndex(iArr, i) != -1;
    }

    public static <T> boolean isSupported(T t, T[] tArr) {
        return getArrayIndex(tArr, t) != -1;
    }

    public static boolean isSupported(String str, List<String> list) {
        return list != null && list.indexOf(str) >= 0;
    }

    public static boolean isTimeout(long j, long j2, long j3) {
        return j < j2 || j - j2 > j3;
    }

    public static boolean isUriValid(Uri uri, ContentResolver contentResolver) {
        if (uri == null) {
            return false;
        }
        try {
            ParcelFileDescriptor openFileDescriptor = contentResolver.openFileDescriptor(uri, "r");
            if (openFileDescriptor == null) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Fail to open URI. URI=");
                sb.append(uri);
                Log.e(str, sb.toString());
                return false;
            }
            openFileDescriptor.close();
            return true;
        } catch (IOException e) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("IOException occurs when opening URI: ");
            sb2.append(e.getMessage());
            Log.e(str2, sb2.toString(), e);
            return false;
        }
    }

    public static boolean isValidValue(String str) {
        return !TextUtils.isEmpty(str) && str.matches("^[0-9]+$");
    }

    public static boolean isViewIntersectWindow(View view) {
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        return iArr[0] < sWindowWidth && iArr[0] + view.getWidth() >= 0 && iArr[1] < sWindowHeight && iArr[1] + view.getHeight() >= 0;
    }

    public static boolean isZoomAnimationEnabled() {
        return SystemProperties.getBoolean(ZOOM_ANIMATION_PROPERTY, !DataRepository.dataItemFeature().ge());
    }

    public static String join(String str, List<String> list) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            if (i == list.size() - 1) {
                stringBuffer.append((String) list.get(i));
            } else {
                stringBuffer.append((String) list.get(i));
                stringBuffer.append(str);
            }
        }
        return stringBuffer.toString();
    }

    protected static Bitmap loadAppCameraWatermark(Context context, Options options, String str) {
        String str2;
        InputStream open;
        Throwable th;
        Throwable th2;
        if (str == null) {
            return null;
        }
        if (str.equalsIgnoreCase(BuildConfig.FLAVOR)) {
            str2 = "common.png";
        } else {
            String givenName = b.getGivenName();
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(givenName);
            sb.append(".png");
            str2 = sb.toString();
        }
        AssetManager assets = context.getAssets();
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("watermarks/");
            sb2.append(str2);
            open = assets.open(sb2.toString());
            try {
                Bitmap decodeStream = BitmapFactory.decodeStream(open, null, options);
                if (open != null) {
                    $closeResource(null, open);
                }
                return decodeStream;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                th = r5;
                th2 = th4;
            }
        } catch (Exception e) {
            Log.d(TAG, "Failed to load app camera watermark ", e);
            return null;
        }
        if (open != null) {
            $closeResource(th, open);
        }
        throw th2;
    }

    public static Bitmap loadFrontCameraWatermark(Context context) {
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = true;
        StringBuilder sb = new StringBuilder();
        sb.append(android.os.Build.DEVICE);
        sb.append("_front");
        return loadAppCameraWatermark(context, options, sb.toString());
    }

    public static Bitmap makeBitmap(byte[] bArr, int i) {
        try {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            if (!options.mCancel && options.outWidth != -1) {
                if (options.outHeight != -1) {
                    options.inSampleSize = computeSampleSize(options, -1, i);
                    options.inJustDecodeBounds = false;
                    options.inDither = false;
                    options.inPreferredConfig = Config.ARGB_8888;
                    return BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
                }
            }
            return null;
        } catch (OutOfMemoryError e) {
            Log.e(TAG, "Got oom exception ", e);
            return null;
        }
    }

    public static String md5(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str.getBytes("UTF8"));
            byte[] digest = instance.digest();
            String str2 = "";
            for (byte b : digest) {
                StringBuilder sb = new StringBuilder();
                sb.append(str2);
                sb.append(Integer.toHexString((255 & b) | -256).substring(6));
                str2 = sb.toString();
            }
            return str2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static final String millisecondToTimeString(long j, boolean z) {
        long j2 = j / 1000;
        long j3 = j2 / 60;
        long j4 = j3 / 60;
        long j5 = j3 - (j4 * 60);
        long j6 = j2 - (j3 * 60);
        StringBuilder sb = new StringBuilder();
        if (j4 > 0) {
            if (j4 < 10) {
                sb.append('0');
            }
            sb.append(j4);
            sb.append(':');
        }
        if (j5 < 10) {
            sb.append('0');
        }
        sb.append(j5);
        sb.append(':');
        if (j6 < 10) {
            sb.append('0');
        }
        sb.append(j6);
        if (z) {
            sb.append('.');
            long j7 = (j - (j2 * 1000)) / 10;
            if (j7 < 10) {
                sb.append('0');
            }
            sb.append(j7);
        }
        return sb.toString();
    }

    public static boolean mkdirs(File file, int i, int i2, int i3) {
        if (file.exists()) {
            return false;
        }
        String parent = file.getParent();
        if (parent != null) {
            mkdirs(new File(parent), i, i2, i3);
        }
        return file.mkdir();
    }

    private static void modify(Object obj, String str, int i) throws NoSuchFieldException, IllegalAccessException {
        java.lang.reflect.Field declaredField = obj.getClass().getDeclaredField(str);
        declaredField.setAccessible(true);
        declaredField.setInt(obj, i);
    }

    public static int nextPowerOf2(int i) {
        int i2 = i - 1;
        int i3 = i2 | (i2 >>> 16);
        int i4 = i3 | (i3 >>> 8);
        int i5 = i4 | (i4 >>> 4);
        int i6 = i5 | (i5 >>> 2);
        return (i6 | (i6 >>> 1)) + 1;
    }

    private static float normalizeDegree(float f) {
        if (f < 0.0f) {
            f += 360.0f;
        } else if (f > 360.0f) {
            f %= 360.0f;
        }
        return f <= 45.0f ? f : f <= 90.0f ? 90.0f - f : f <= 135.0f ? f - 90.0f : f <= 180.0f ? 180.0f - f : f <= 225.0f ? f - 180.0f : f <= 270.0f ? 270.0f - f : f <= 315.0f ? f - 270.0f : 360.0f - f;
    }

    public static int parseInt(String str, int i) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            Log.e(TAG, e.getMessage(), e);
            if (!isDebugOsBuild()) {
                return i;
            }
            throw e;
        }
    }

    public static boolean pointInView(float f, float f2, View view) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        if (f >= ((float) iArr[0]) && f < ((float) (iArr[0] + view.getWidth())) && f2 >= ((float) iArr[1]) && f2 < ((float) (iArr[1] + view.getHeight()))) {
            z = true;
        }
        return z;
    }

    public static void prepareMatrix(Matrix matrix, boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        matrix.setScale(z ? -1.0f : 1.0f, 1.0f);
        matrix.postRotate((float) i);
        if (i == 90 || i == 270) {
            matrix.postScale(((float) i2) / ((float) i7), ((float) i3) / ((float) i6));
        } else {
            matrix.postScale(((float) i2) / ((float) i6), ((float) i3) / ((float) i7));
        }
        matrix.postTranslate((float) i4, (float) i5);
    }

    public static void printLog(String str, Object... objArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < objArr.length; i += 2) {
            sb.append(objArr[i].toString());
            sb.append(" = ");
            sb.append(objArr[i + 1].toString());
            sb.append(" ");
        }
        Log.d(str, sb.toString());
    }

    public static void rectFToRect(RectF rectF, Rect rect) {
        rect.left = Math.round(rectF.left);
        rect.top = Math.round(rectF.top);
        rect.right = Math.round(rectF.right);
        rect.bottom = Math.round(rectF.bottom);
    }

    public static void removeCustomWatermark() {
        File filesDir = DataRepository.dataItemFeature().fQ() ? WATERMARK_STORAGE_DIRECTORY : CameraAppImpl.getAndroidContext().getFilesDir();
        File file = new File(filesDir, WATERMARK_FILE_NAME);
        File file2 = new File(filesDir, WATERMARK_ULTRA_PIXEL_FILE_NAME);
        if (file.exists()) {
            file.delete();
        }
        if (file2.exists()) {
            file2.delete();
        }
    }

    public static int replaceStartEffectRender(Activity activity) {
        if (b.hD()) {
            String stringExtra = activity.getIntent().getStringExtra(EXTRAS_START_WITH_EFFECT_RENDER);
            if (stringExtra != null) {
                int identifier = activity.getResources().getIdentifier(stringExtra, "integer", activity.getPackageName());
                if (identifier != 0) {
                    int integer = activity.getResources().getInteger(identifier);
                    CameraSettings.setShaderEffect(integer);
                    return integer;
                }
            }
        }
        return FilterInfo.FILTER_ID_NONE;
    }

    public static void reverseAnimatorSet(AnimatorSet animatorSet) {
        Iterator it = animatorSet.getChildAnimations().iterator();
        while (it.hasNext()) {
            Animator animator = (Animator) it.next();
            if (animator instanceof ValueAnimator) {
                ((ValueAnimator) animator).reverse();
            } else if (animator instanceof AnimatorSet) {
                reverseAnimatorSet((AnimatorSet) animator);
            }
        }
    }

    public static Bitmap rotate(Bitmap bitmap, int i) {
        return rotateAndMirror(bitmap, i, false);
    }

    public static Bitmap rotateAndMirror(Bitmap bitmap, int i, boolean z) {
        if ((i == 0 && !z) || bitmap == null) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        if (z) {
            matrix.postScale(-1.0f, 1.0f);
            i = (i + 360) % 360;
            if (i == 0 || i == 180) {
                matrix.postTranslate((float) bitmap.getWidth(), 0.0f);
            } else if (i == 90 || i == 270) {
                matrix.postTranslate((float) bitmap.getHeight(), 0.0f);
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid degrees=");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
            }
        }
        if (i != 0) {
            matrix.postRotate((float) i, ((float) bitmap.getWidth()) / 2.0f, ((float) bitmap.getHeight()) / 2.0f);
        }
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            if (bitmap == createBitmap) {
                return bitmap;
            }
            bitmap.recycle();
            return createBitmap;
        } catch (OutOfMemoryError e) {
            return bitmap;
        }
    }

    public static Bitmap rotateAndUpscaleBitmap(Bitmap bitmap, float f, boolean z, boolean z2) {
        int i;
        int i2;
        int i3;
        Bitmap bitmap2;
        Matrix matrix = new Matrix();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        if ((((((int) f) + 45) / 90) * 90) % 180 != 0) {
            i = width;
            i2 = height;
        } else {
            i2 = width;
            i = height;
        }
        matrix.postTranslate(((float) (-width)) / 2.0f, ((float) (-height)) / 2.0f);
        matrix.postRotate(f);
        float f2 = ((float) i2) / 2.0f;
        float f3 = ((float) i) / 2.0f;
        matrix.postTranslate(f2, f3);
        float computeScale = computeScale(width, height, f);
        matrix.postScale(z ? -1.0f * computeScale : computeScale, computeScale, f2, f3);
        if (z2) {
            i3 = Math.min(i2, i);
            matrix.postTranslate(((float) (i3 - i2)) / 2.0f, ((float) (i3 - i)) / 2.0f);
            i = i3;
        } else {
            i3 = i2;
        }
        try {
            bitmap2 = Bitmap.createBitmap(i3, i, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(bitmap2);
                canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
                Paint paint = new Paint();
                paint.setAntiAlias(true);
                paint.setFilterBitmap(true);
                canvas.drawBitmap(bitmap, matrix, paint);
                bitmap.recycle();
            } catch (Exception | OutOfMemoryError e) {
                e = e;
            }
        } catch (Exception | OutOfMemoryError e2) {
            e = e2;
            bitmap2 = null;
            Log.w(TAG, "Failed to adjust bitmap", e);
            return bitmap2;
        }
        return bitmap2;
    }

    public static int roundOrientation(int i, int i2) {
        boolean z = true;
        if (i2 != -1) {
            int abs = Math.abs(i - i2);
            if (Math.min(abs, 360 - abs) < 50) {
                z = false;
            }
        }
        if (!z) {
            return i2;
        }
        int i3 = (((i + 45) / 90) * 90) % 360;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onOrientationChanged: orientation = ");
        sb.append(i3);
        Log.d(str, sb.toString());
        return i3;
    }

    public static int safeDelete(Uri uri, String str, String[] strArr) {
        int i;
        try {
            i = CameraAppImpl.getAndroidContext().getContentResolver().delete(uri, str, strArr);
            String str2 = TAG;
            try {
                StringBuilder sb = new StringBuilder();
                sb.append("safeDelete url=");
                sb.append(uri);
                sb.append(" where=");
                sb.append(str);
                sb.append(" selectionArgs=");
                sb.append(strArr);
                sb.append(" result=");
                sb.append(i);
                Log.v(str2, sb.toString());
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e = e2;
            i = -1;
            e.printStackTrace();
            return i;
        }
        return i;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0043 A[SYNTHETIC, Splitter:B:23:0x0043] */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0054 A[SYNTHETIC, Splitter:B:29:0x0054] */
    public static boolean saveBitmap(Buffer buffer, int i, int i2, Config config, String str) {
        if (buffer != null) {
            Bitmap createBitmap = Bitmap.createBitmap(i, i2, config);
            createBitmap.copyPixelsFromBuffer(buffer);
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(new File(str));
                try {
                    createBitmap.compress(CompressFormat.JPEG, 100, fileOutputStream2);
                    try {
                        fileOutputStream2.flush();
                        fileOutputStream2.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    createBitmap.recycle();
                    return true;
                } catch (FileNotFoundException e2) {
                    FileOutputStream fileOutputStream3 = fileOutputStream2;
                    e = e2;
                    fileOutputStream = fileOutputStream3;
                    try {
                        Log.e(TAG, "saveBitmap failed!", e);
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.flush();
                                fileOutputStream.close();
                            } catch (Exception e3) {
                                e3.printStackTrace();
                            }
                        }
                        createBitmap.recycle();
                        return false;
                    } catch (Throwable th) {
                        th = th;
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.flush();
                                fileOutputStream.close();
                            } catch (Exception e4) {
                                e4.printStackTrace();
                            }
                        }
                        createBitmap.recycle();
                        throw th;
                    }
                } catch (Throwable th2) {
                    FileOutputStream fileOutputStream4 = fileOutputStream2;
                    th = th2;
                    fileOutputStream = fileOutputStream4;
                    if (fileOutputStream != null) {
                    }
                    createBitmap.recycle();
                    throw th;
                }
            } catch (FileNotFoundException e5) {
                e = e5;
                Log.e(TAG, "saveBitmap failed!", e);
                if (fileOutputStream != null) {
                }
                createBitmap.recycle();
                return false;
            }
        }
        return false;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0042 A[SYNTHETIC, Splitter:B:28:0x0042] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0061 A[SYNTHETIC, Splitter:B:40:0x0061] */
    public static boolean saveCameraCalibrationToFile(byte[] bArr, String str) {
        FileOutputStream openFileOutput;
        Context androidContext = CameraAppImpl.getAndroidContext();
        boolean z = true;
        if (!(bArr == null || androidContext == null)) {
            if (isEqual(bArr, androidContext.getFileStreamPath(str))) {
                return true;
            }
            FileOutputStream fileOutputStream = null;
            try {
                openFileOutput = androidContext.openFileOutput(str, 0);
            } catch (FileNotFoundException e) {
                e = e;
                Log.e(TAG, "saveCameraCalibrationToFile: FileNotFoundException", e);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
                z = false;
                return z;
            } catch (IOException e2) {
                e = e2;
                try {
                    Log.e(TAG, "saveCameraCalibrationToFile: IOException", e);
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.flush();
                            fileOutputStream.close();
                        } catch (Exception e3) {
                            e3.printStackTrace();
                        }
                    }
                    z = false;
                    return z;
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.flush();
                            fileOutputStream.close();
                        } catch (Exception e4) {
                            e4.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
            try {
                openFileOutput.write(bArr);
                if (openFileOutput != null) {
                    try {
                        openFileOutput.flush();
                        openFileOutput.close();
                    } catch (Exception e5) {
                        e5.printStackTrace();
                    }
                }
            } catch (FileNotFoundException e6) {
                e = e6;
                fileOutputStream = openFileOutput;
            } catch (IOException e7) {
                e = e7;
                fileOutputStream = openFileOutput;
                Log.e(TAG, "saveCameraCalibrationToFile: IOException", e);
                if (fileOutputStream != null) {
                }
                z = false;
                return z;
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = openFileOutput;
                if (fileOutputStream != null) {
                }
                throw th;
            }
            return z;
        }
        z = false;
        return z;
    }

    protected static void saveCustomWatermark2File(Bitmap bitmap, boolean z) {
        boolean z2;
        File filesDir;
        File file;
        FileOutputStream fileOutputStream;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("saveLastFrameGaussian2File: start... watermarkBitmap = ");
        sb.append(bitmap);
        Log.d(str, sb.toString());
        long currentTimeMillis = System.currentTimeMillis();
        String str2 = z ? WATERMARK_ULTRA_PIXEL_FILE_NAME : WATERMARK_FILE_NAME;
        if (bitmap != null && !bitmap.isRecycled()) {
            if (DataRepository.dataItemFeature().fQ()) {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                bitmap.compress(CompressFormat.PNG, 90, byteArrayOutputStream);
                WatermarkMiSysUtils.writeFileToPersist(byteArrayOutputStream.toByteArray(), str2);
            } else {
                FileOutputStream fileOutputStream2 = null;
                try {
                    filesDir = CameraAppImpl.getAndroidContext().getFilesDir();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str2);
                    sb2.append(TEMP_SUFFIX);
                    file = new File(filesDir, sb2.toString());
                    fileOutputStream = new FileOutputStream(file);
                } catch (IOException e) {
                    e = e;
                    try {
                        Log.e(TAG, "saveCustomWatermark2File Failed to write image", e);
                        closeSilently(fileOutputStream2);
                        z2 = false;
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("saveCustomWatermark2File: watermarkBitmap = ");
                        sb3.append(bitmap);
                        sb3.append(", save result = ");
                        sb3.append(z2);
                        sb3.append(", cost time = ");
                        sb3.append(System.currentTimeMillis() - currentTimeMillis);
                        sb3.append("ms");
                        Log.d(str3, sb3.toString());
                    } catch (Throwable th) {
                        th = th;
                        closeSilently(fileOutputStream2);
                        throw th;
                    }
                }
                try {
                    bitmap.compress(CompressFormat.PNG, 90, fileOutputStream);
                    fileOutputStream.flush();
                    z2 = file.renameTo(new File(filesDir, str2));
                    closeSilently(fileOutputStream);
                } catch (IOException e2) {
                    e = e2;
                    fileOutputStream2 = fileOutputStream;
                    Log.e(TAG, "saveCustomWatermark2File Failed to write image", e);
                    closeSilently(fileOutputStream2);
                    z2 = false;
                    String str32 = TAG;
                    StringBuilder sb32 = new StringBuilder();
                    sb32.append("saveCustomWatermark2File: watermarkBitmap = ");
                    sb32.append(bitmap);
                    sb32.append(", save result = ");
                    sb32.append(z2);
                    sb32.append(", cost time = ");
                    sb32.append(System.currentTimeMillis() - currentTimeMillis);
                    sb32.append("ms");
                    Log.d(str32, sb32.toString());
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream2 = fileOutputStream;
                    closeSilently(fileOutputStream2);
                    throw th;
                }
                String str322 = TAG;
                StringBuilder sb322 = new StringBuilder();
                sb322.append("saveCustomWatermark2File: watermarkBitmap = ");
                sb322.append(bitmap);
                sb322.append(", save result = ");
                sb322.append(z2);
                sb322.append(", cost time = ");
                sb322.append(System.currentTimeMillis() - currentTimeMillis);
                sb322.append("ms");
                Log.d(str322, sb322.toString());
            }
        }
        z2 = false;
        String str3222 = TAG;
        StringBuilder sb3222 = new StringBuilder();
        sb3222.append("saveCustomWatermark2File: watermarkBitmap = ");
        sb3222.append(bitmap);
        sb3222.append(", save result = ");
        sb3222.append(z2);
        sb3222.append(", cost time = ");
        sb3222.append(System.currentTimeMillis() - currentTimeMillis);
        sb3222.append("ms");
        Log.d(str3222, sb3222.toString());
    }

    public static void saveImageToJpeg(Image image) {
        Plane[] planes = image.getPlanes();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        int[] iArr = {planes[0].getRowStride(), planes[2].getRowStride()};
        int limit = buffer.limit();
        int limit2 = buffer2.limit();
        byte[] bArr = new byte[(limit + limit2)];
        buffer.rewind();
        buffer2.rewind();
        buffer.get(bArr, 0, limit);
        buffer2.get(bArr, limit, limit2);
        saveYuvToJpg(bArr, image.getWidth(), image.getHeight(), iArr, System.currentTimeMillis());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("saveImageToJpeg: ");
        sb.append(buffer.remaining());
        sb.append("|");
        sb.append(buffer2.remaining());
        Log.d(str, sb.toString());
    }

    public static void saveLastFrameGaussian2File(Bitmap bitmap) {
        boolean z;
        FileOutputStream fileOutputStream;
        IOException e;
        File filesDir;
        File file;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("saveLastFrameGaussian2File: start... blurBitmap = ");
        sb.append(bitmap);
        Log.d(str, sb.toString());
        long currentTimeMillis = System.currentTimeMillis();
        if (bitmap != null && !bitmap.isRecycled()) {
            try {
                filesDir = CameraAppImpl.getAndroidContext().getFilesDir();
                file = new File(filesDir, "blur.jpg.tmp");
                fileOutputStream = new FileOutputStream(file);
            } catch (IOException e2) {
                fileOutputStream = null;
                e = e2;
                try {
                    Log.e(TAG, "saveLastFrameGaussian2File Failed to write image", e);
                    closeSilently(fileOutputStream);
                    z = false;
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("saveLastFrameGaussian2File: blurBitmap = ");
                    sb2.append(bitmap);
                    sb2.append(", save result = ");
                    sb2.append(z);
                    sb2.append(", cost time = ");
                    sb2.append(System.currentTimeMillis() - currentTimeMillis);
                    sb2.append("ms");
                    Log.d(str2, sb2.toString());
                } catch (Throwable th) {
                    th = th;
                    closeSilently(fileOutputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = null;
                closeSilently(fileOutputStream);
                throw th;
            }
            try {
                bitmap.compress(CompressFormat.JPEG, 90, fileOutputStream);
                fileOutputStream.flush();
                z = file.renameTo(new File(filesDir, LAST_FRAME_GAUSSIAN_FILE_NAME));
                closeSilently(fileOutputStream);
            } catch (IOException e3) {
                e = e3;
                Log.e(TAG, "saveLastFrameGaussian2File Failed to write image", e);
                closeSilently(fileOutputStream);
                z = false;
                String str22 = TAG;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("saveLastFrameGaussian2File: blurBitmap = ");
                sb22.append(bitmap);
                sb22.append(", save result = ");
                sb22.append(z);
                sb22.append(", cost time = ");
                sb22.append(System.currentTimeMillis() - currentTimeMillis);
                sb22.append("ms");
                Log.d(str22, sb22.toString());
            }
            String str222 = TAG;
            StringBuilder sb222 = new StringBuilder();
            sb222.append("saveLastFrameGaussian2File: blurBitmap = ");
            sb222.append(bitmap);
            sb222.append(", save result = ");
            sb222.append(z);
            sb222.append(", cost time = ");
            sb222.append(System.currentTimeMillis() - currentTimeMillis);
            sb222.append("ms");
            Log.d(str222, sb222.toString());
        }
        z = false;
        String str2222 = TAG;
        StringBuilder sb2222 = new StringBuilder();
        sb2222.append("saveLastFrameGaussian2File: blurBitmap = ");
        sb2222.append(bitmap);
        sb2222.append(", save result = ");
        sb2222.append(z);
        sb2222.append(", cost time = ");
        sb2222.append(System.currentTimeMillis() - currentTimeMillis);
        sb2222.append("ms");
        Log.d(str2222, sb2222.toString());
    }

    public static boolean saveLiveShotMicroVideoInSdcard() {
        return android.util.Log.isLoggable("liveshotsmv", 3);
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0065 A[SYNTHETIC, Splitter:B:22:0x0065] */
    public static void saveYuv(byte[] bArr, long j) {
        FileOutputStream fileOutputStream = null;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("sdcard/DCIM/Camera/dump_");
            sb.append(j);
            sb.append(".yuv");
            String sb2 = sb.toString();
            FileOutputStream fileOutputStream2 = new FileOutputStream(sb2);
            try {
                fileOutputStream2.write(bArr);
                String str = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("saveYuv: ");
                sb3.append(sb2);
                Log.v(str, sb3.toString());
                try {
                    fileOutputStream2.flush();
                    fileOutputStream2.close();
                } catch (Exception e) {
                    Log.e(TAG, "Failed to flush/close stream", e);
                }
            } catch (Exception e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th) {
                th = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
        } catch (Exception e3) {
            e = e3;
            try {
                Log.e(TAG, "Failed to write image", e);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.flush();
                        fileOutputStream.close();
                    } catch (Exception e4) {
                        Log.e(TAG, "Failed to flush/close stream", e4);
                    }
                }
                throw th;
            }
        }
    }

    public static void saveYuvToJpg(byte[] bArr, int i, int i2, int[] iArr, long j) {
        if (bArr == null) {
            Log.w(TAG, "saveYuvToJpg: null data");
            return;
        }
        YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, iArr);
        StringBuilder sb = new StringBuilder();
        sb.append("sdcard/DCIM/Camera/dump_");
        sb.append(j);
        sb.append(Storage.JPEG_SUFFIX);
        String sb2 = sb.toString();
        String str = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("saveYuvToJpg: ");
        sb3.append(sb2);
        Log.v(str, sb3.toString());
        try {
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 100, new FileOutputStream(sb2));
        } catch (FileNotFoundException e) {
            Log.e(TAG, e.getMessage(), e);
        }
    }

    public static void scaleCamera2Matrix(Matrix matrix, Rect rect, float f) {
        matrix.postScale(f, f);
        matrix.preTranslate(((float) (-rect.width())) / 2.0f, ((float) (-rect.height())) / 2.0f);
    }

    public static void setAccessibilityFocusable(View view, boolean z) {
        if (VERSION.SDK_INT < 16) {
            return;
        }
        if (z) {
            ViewCompat.setImportantForAccessibility(view, 1);
        } else {
            ViewCompat.setImportantForAccessibility(view, 2);
        }
    }

    public static void setBrightnessRampRate(int i) {
        CompatibilityUtils.setBrightnessRampRate(IPowerManager.Stub.asInterface(ServiceManager.getService("power")), i);
    }

    public static void setPixels(byte[] bArr, int i, int i2, byte[] bArr2, int[] iArr) {
        if (bArr != null && bArr2 != null) {
            int i3 = ((iArr[1] * i) + iArr[0]) * i2;
            int i4 = 0;
            for (int i5 = 0; i5 < iArr[3]; i5++) {
                System.arraycopy(bArr2, i4, bArr, i3, iArr[2] * i2);
                i4 += iArr[2] * i2;
                i3 += i * i2;
            }
        }
    }

    public static void setScreenEffect(boolean z) {
        if (b.ji()) {
            try {
                DisplayFeatureManager.getInstance().setScreenEffect(14, z ? 1 : 0);
            } catch (Exception e) {
                Log.d(TAG, "Meet Exception when calling DisplayFeatureManager#setScreenEffect()", e);
            }
        }
    }

    private static void setTagValue(ExifInterface exifInterface, int i, Object obj) {
        if (!exifInterface.setTagValue(i, obj)) {
            exifInterface.setTag(exifInterface.buildTag(i, obj));
        }
    }

    public static void showErrorAndFinish(final Activity activity, int i) {
        if (!activity.isFinishing()) {
            AlertDialog show = new Builder(activity).setCancelable(false).setIconAttribute(16843605).setTitle(R.string.camera_error_title).setMessage(i).setNeutralButton(R.string.dialog_ok, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    Camera2DataContainer.getInstance().reset();
                    activity.finish();
                }
            }).show();
            boolean z = i == R.string.cannot_connect_camera_twice || i == R.string.cannot_connect_camera_once;
            if (z) {
                CameraStatUtil.trackCameraErrorDialogShow();
            }
            if (sIsKillCameraService && VERSION.SDK_INT >= 26 && b.hR() && z) {
                if (SystemClock.elapsedRealtime() - CameraSettings.getBroadcastKillServiceTime() > 60000) {
                    broadcastKillService(activity);
                }
                final Button button = show.getButton(-3);
                button.setTextAppearance(GeneralUtils.miuiWidgetButtonDialog());
                button.setEnabled(false);
                final Activity activity2 = activity;
                AnonymousClass2 r3 = new CountDownTimer(5000, 1000) {
                    public void onFinish() {
                        if (!((ActivityBase) activity2).isActivityPaused()) {
                            button.setEnabled(true);
                            button.setText(activity2.getResources().getString(R.string.dialog_ok));
                        }
                    }

                    public void onTick(long j) {
                        if (!((ActivityBase) activity2).isActivityPaused()) {
                            button.setText(activity2.getResources().getString(R.string.dialog_ok_time, new Object[]{Long.valueOf(j / 1000)}));
                        }
                    }
                };
                final CountDownTimer start = r3.start();
                show.setOnDismissListener(new OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (start != null) {
                            start.cancel();
                        }
                    }
                });
            }
            ((ActivityBase) activity).setErrorDialog(show);
        }
    }

    private static void skip(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (xmlPullParser.getEventType() == 2) {
            int i = 1;
            while (i != 0) {
                switch (xmlPullParser.next()) {
                    case 2:
                        i++;
                        break;
                    case 3:
                        i--;
                        break;
                }
            }
            return;
        }
        throw new IllegalStateException();
    }

    public static void startScreenSlideAlphaInAnimation(View view) {
        ViewCompat.setAlpha(view, 0.0f);
        ViewCompat.animate(view).alpha(1.0f).setDuration(350).setStartDelay(400).setInterpolator(new SineEaseInOutInterpolator()).start();
    }

    public static int stringSparseArraysIndexOf(SparseArray<String> sparseArray, String str) {
        if (str != null) {
            for (int i = 0; i < sparseArray.size(); i++) {
                if (str.equals(sparseArray.valueAt(i))) {
                    return i;
                }
            }
        }
        return -1;
    }

    public static void updateAccessibility(Context context) {
        sIsAccessibilityEnable = ((AccessibilityManager) context.getSystemService("accessibility")).isEnabled();
    }

    public static void updateDeviceConfig(Context context) {
        String str = ((TelephonyManager) context.getSystemService("phone")).getSimState() != 5 ? sRegion : null;
        if (TextUtils.isEmpty(str)) {
            Country detectCountry = ((CountryDetector) context.getSystemService("country_detector")).detectCountry();
            if (detectCountry != null) {
                str = detectCountry.getCountryIso();
            }
        }
        mCountryIso = str;
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("antiBanding mCountryIso=");
        sb.append(mCountryIso);
        Log.d(str2, sb.toString());
        sRegion = SystemProperties.get("ro.miui.region");
        sIsDumpLog = SystemProperties.getBoolean("camera_dump_parameters", DEBUG);
        sIsDumpOrigJpg = SystemProperties.getBoolean("camera_dump_orig_jpg", false);
        sIsKillCameraService = SystemProperties.getBoolean("kill_camera_service_enable", true);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0018, code lost:
        $closeResource(r1, r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001b, code lost:
        throw r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x0012, code lost:
        r2 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0016, code lost:
        if (r0 != null) goto L_0x0018;
     */
    public static void verifyAssetZip(Context context, String str, String str2, int i) throws IOException {
        InputStream open = context.getAssets().open(str);
        verifyZip(open, str2, i);
        if (open != null) {
            $closeResource(null, open);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x0090 A[Catch:{ all -> 0x00d2, IOException -> 0x00da }] */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0014 A[SYNTHETIC] */
    public static void verifyZip(InputStream inputStream, String str, int i) throws IOException {
        ZipInputStream zipInputStream;
        FileOutputStream fileOutputStream;
        Throwable th;
        Throwable th2;
        try {
            zipInputStream = new ZipInputStream(inputStream);
            File file = new File(str);
            if (!file.exists()) {
                file.mkdirs();
            }
            while (true) {
                ZipEntry nextEntry = zipInputStream.getNextEntry();
                if (nextEntry != null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(str);
                    sb.append("/");
                    sb.append(nextEntry.getName());
                    File file2 = new File(sb.toString());
                    boolean z = true;
                    if (!file2.exists()) {
                        if (nextEntry.isDirectory()) {
                            file2.mkdirs();
                        } else {
                            File file3 = new File(file2.getParent());
                            if (!file3.exists()) {
                                file3.mkdirs();
                            }
                            file2.createNewFile();
                            if (z) {
                                String str2 = TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("corrupted ");
                                sb2.append(nextEntry.getName());
                                Log.w(str2, sb2.toString());
                                fileOutputStream = new FileOutputStream(file2);
                                try {
                                    byte[] bArr = new byte[i];
                                    while (true) {
                                        int read = zipInputStream.read(bArr);
                                        if (read <= 0) {
                                            break;
                                        }
                                        fileOutputStream.write(bArr, 0, read);
                                    }
                                    $closeResource(null, fileOutputStream);
                                } catch (Throwable th3) {
                                    Throwable th4 = th3;
                                    th = r12;
                                    th2 = th4;
                                }
                            }
                        }
                    } else if (!nextEntry.isDirectory()) {
                        if (!file2.isFile()) {
                            file2.delete();
                            file2.createNewFile();
                        }
                        if (Verifier.crc32(file2, i) != nextEntry.getCrc()) {
                            if (z) {
                            }
                        }
                    } else if (!file2.isDirectory()) {
                        file2.delete();
                        file2.mkdirs();
                    }
                    z = false;
                    if (z) {
                    }
                } else {
                    $closeResource(null, zipInputStream);
                    return;
                }
            }
            $closeResource(th, fileOutputStream);
            throw th2;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Throwable th5) {
            $closeResource(r11, zipInputStream);
            throw th5;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:66:0x00f5, code lost:
        r13 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x00f9, code lost:
        $closeResource(r12, r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x00fc, code lost:
        throw r13;
     */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x009a A[Catch:{ all -> 0x00f5 }] */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x0018 A[SYNTHETIC] */
    public static void verifyZip(String str, String str2, int i) throws IOException {
        InputStream inputStream;
        Throwable th;
        Throwable th2;
        FileOutputStream fileOutputStream;
        Throwable th3;
        Throwable th4;
        ZipFile zipFile = new ZipFile(str);
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        Enumeration entries = zipFile.entries();
        while (entries.hasMoreElements()) {
            ZipEntry zipEntry = (ZipEntry) entries.nextElement();
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append("/");
            sb.append(zipEntry.getName());
            File file2 = new File(sb.toString());
            boolean z = true;
            if (!file2.exists()) {
                if (zipEntry.isDirectory()) {
                    file2.mkdirs();
                } else {
                    File file3 = new File(file2.getParent());
                    if (!file3.exists()) {
                        file3.mkdirs();
                    }
                    file2.createNewFile();
                    if (z) {
                        String str3 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("corrupted ");
                        sb2.append(zipEntry.getName());
                        Log.w(str3, sb2.toString());
                        inputStream = zipFile.getInputStream(zipEntry);
                        try {
                            fileOutputStream = new FileOutputStream(file2);
                            try {
                                byte[] bArr = new byte[i];
                                while (true) {
                                    int read = inputStream.read(bArr);
                                    if (read <= 0) {
                                        break;
                                    }
                                    fileOutputStream.write(bArr, 0, read);
                                }
                                $closeResource(null, fileOutputStream);
                                if (inputStream != null) {
                                    $closeResource(null, inputStream);
                                } else {
                                    continue;
                                }
                            } catch (Throwable th5) {
                                Throwable th6 = th5;
                                th3 = r13;
                                th4 = th6;
                            }
                        } catch (Throwable th7) {
                            Throwable th8 = th7;
                            th = r13;
                            th2 = th8;
                        }
                    }
                }
            } else if (!zipEntry.isDirectory()) {
                if (!file2.isFile()) {
                    file2.delete();
                    file2.createNewFile();
                }
                if (Verifier.crc32(file2, i) != zipEntry.getCrc()) {
                    if (z) {
                    }
                }
            } else if (!file2.isDirectory()) {
                file2.delete();
                file2.mkdirs();
            }
            z = false;
            if (z) {
            }
        }
        $closeResource(null, zipFile);
        return;
        if (inputStream != null) {
            $closeResource(th, inputStream);
        }
        throw th2;
        $closeResource(th3, fileOutputStream);
        throw th4;
    }

    public static void viewUri(Uri uri, Context context) {
        if (!isUriValid(uri, context.getContentResolver())) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Uri invalid. uri=");
            sb.append(uri);
            Log.e(str, sb.toString());
            return;
        }
        try {
            context.startActivity(new Intent(REVIEW_ACTION, uri));
        } catch (ActivityNotFoundException e) {
            try {
                context.startActivity(new Intent("android.intent.action.VIEW", uri));
            } catch (ActivityNotFoundException e2) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("review image fail. uri=");
                sb2.append(uri);
                Log.e(str2, sb2.toString(), e2);
            }
        }
    }

    public static String viewVisibilityToString(int i) {
        return i != 0 ? i != 4 ? i != 8 ? "UNKNOWN" : "GONE" : "INVISIBLE" : "VISIBLE";
    }
}

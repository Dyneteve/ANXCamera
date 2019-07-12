package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.ImageFormat;
import android.graphics.Rect;
import android.media.Image;
import android.media.Image.Plane;
import android.os.Environment;
import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.R;
import com.android.camera.log.Log;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class MimojiHelper {
    public static final int COLOR_FormatI420 = 1;
    public static final int COLOR_FormatNV21 = 2;
    public static final String CUSTOM_DIR;
    public static final String DATA_DIR;
    public static final String MIMOJI_DIR;
    public static final String MODEL_PATH;
    private static final int ORIENTATION_HYSTERESIS = 5;
    public static final String ROOT_DIR;
    private static Context mContext;
    private static int mCurrentOrientation = -1;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(Environment.getExternalStorageDirectory().getPath());
        sb.append("/MIUI/Camera/");
        ROOT_DIR = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(ROOT_DIR);
        sb2.append("mimoji/");
        MIMOJI_DIR = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(MIMOJI_DIR);
        sb3.append("");
        DATA_DIR = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(MIMOJI_DIR);
        sb4.append("model/");
        MODEL_PATH = sb4.toString();
        StringBuilder sb5 = new StringBuilder();
        sb5.append(ROOT_DIR);
        sb5.append("custom/");
        CUSTOM_DIR = sb5.toString();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x005a, code lost:
        r12 = r8;
     */
    public static byte[] getDataFromImage(Image image, int i) {
        Rect rect;
        int i2;
        int i3 = i;
        int i4 = 2;
        int i5 = 1;
        if (i3 == 1 || i3 == 2) {
            Rect cropRect = image.getCropRect();
            int format = image.getFormat();
            int width = cropRect.width();
            int height = cropRect.height();
            Plane[] planes = image.getPlanes();
            int i6 = width * height;
            byte[] bArr = new byte[((ImageFormat.getBitsPerPixel(format) * i6) / 8)];
            int i7 = 0;
            byte[] bArr2 = new byte[planes[0].getRowStride()];
            int i8 = 1;
            int i9 = 0;
            int i10 = 0;
            while (i9 < planes.length) {
                switch (i9) {
                    case 0:
                        i8 = i5;
                        i10 = i7;
                        break;
                    case 1:
                        if (i3 != i5) {
                            if (i3 == i4) {
                                i10 = i6 + 1;
                                i8 = i4;
                                break;
                            }
                        } else {
                            i8 = i5;
                        }
                        break;
                    case 2:
                        if (i3 == i5) {
                            i10 = (int) (((double) i6) * 1.25d);
                            i8 = i5;
                            break;
                        } else if (i3 == i4) {
                            i8 = i4;
                        }
                        break;
                }
                ByteBuffer buffer = planes[i9].getBuffer();
                int rowStride = planes[i9].getRowStride();
                int pixelStride = planes[i9].getPixelStride();
                int i11 = i9 == 0 ? i7 : i5;
                int i12 = width >> i11;
                int i13 = height >> i11;
                int i14 = width;
                buffer.position(((cropRect.top >> i11) * rowStride) + ((cropRect.left >> i11) * pixelStride));
                int i15 = 0;
                while (i15 < i13) {
                    if (pixelStride == 1 && i8 == 1) {
                        buffer.get(bArr, i10, i12);
                        i10 += i12;
                        rect = cropRect;
                        i2 = i12;
                    } else {
                        i2 = ((i12 - 1) * pixelStride) + 1;
                        rect = cropRect;
                        buffer.get(bArr2, 0, i2);
                        int i16 = i10;
                        for (int i17 = 0; i17 < i12; i17++) {
                            bArr[i16] = bArr2[i17 * pixelStride];
                            i16 += i8;
                        }
                        i10 = i16;
                    }
                    if (i15 < i13 - 1) {
                        buffer.position((buffer.position() + rowStride) - i2);
                    }
                    i15++;
                    cropRect = rect;
                }
                Rect rect2 = cropRect;
                i9++;
                i5 = 1;
                width = i14;
                i3 = i;
                i4 = 2;
                i7 = 0;
            }
            return bArr;
        }
        throw new IllegalArgumentException("only support COLOR_FormatI420 and COLOR_FormatNV21");
    }

    public static List<MimojiInfo> getMimojiInfoList() {
        File[] listFiles;
        File file = new File(MODEL_PATH);
        if (!file.exists()) {
            return null;
        }
        File[] listFiles2 = file.listFiles();
        String str = ".dat";
        ArrayList arrayList = new ArrayList();
        for (File absolutePath : listFiles2) {
            String absolutePath2 = absolutePath.getAbsolutePath();
            StringBuilder sb = new StringBuilder();
            sb.append(absolutePath2);
            sb.append("/save");
            File file2 = new File(sb.toString());
            if (file2.exists()) {
                for (File file3 : file2.listFiles()) {
                    if (file3.getPath().substring(file3.getPath().length() - str.length()).equals(str)) {
                        MimojiInfo mimojiInfo = new MimojiInfo();
                        mimojiInfo.mAvatarTemplatePath = absolutePath2;
                        mimojiInfo.mConfigPath = file3.getAbsolutePath();
                    }
                }
            }
        }
        return arrayList;
    }

    public static int getOutlineOrientation(int i, int i2, boolean z) {
        mCurrentOrientation = roundOrientation(i2, mCurrentOrientation);
        int i3 = z ? ((i - mCurrentOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : (mCurrentOrientation + i) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        StringBuilder sb = new StringBuilder();
        sb.append("cameraRotation = ");
        sb.append(i);
        sb.append(" sensorOrientation = ");
        sb.append(mCurrentOrientation);
        sb.append("outlineOrientation = ");
        sb.append(i3);
        Log.d("OrientationUtil", sb.toString());
        return i3;
    }

    public static Bitmap getThumbnailBitmapFromData(byte[] bArr, int i, int i2) {
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        return createBitmap;
    }

    public static int getTipsResId(int i) {
        switch (i) {
            case 1:
                return R.string.mimoji_check_no_face;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                return R.string.mimoji_check_face_occlusion;
            case 9:
                return R.string.mimoji_check_beyond_20_degrees;
            case 10:
                return R.string.mimoji_check_multi_face;
            default:
                return -1;
        }
    }

    public static int getTipsResIdFace(int i) {
        if (i == 7) {
            return R.string.mimoji_check_low_light;
        }
        switch (i) {
            case 3:
                return R.string.mimoji_check_face_too_close;
            case 4:
                return R.string.mimoji_check_face_too_far;
            default:
                return -1;
        }
    }

    public static void init(Context context) {
        mContext = context;
    }

    private static int roundOrientation(int i, int i2) {
        boolean z = true;
        if (i2 != -1) {
            int abs = Math.abs(i - i2);
            if (Math.min(abs, 360 - abs) < 50) {
                z = false;
            }
        }
        return z ? (((i + 45) / 90) * 90) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : i2;
    }
}

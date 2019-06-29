package com.arcsoft.camera.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.ImageFormat;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.hardware.camera2.CameraCharacteristics;
import android.media.Image;
import android.media.Image.Plane;
import android.net.Uri;
import android.text.TextUtils;
import android.util.SizeF;
import android.webkit.MimeTypeMap;
import com.android.camera.storage.Storage;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Properties;

/* compiled from: ToolUtil */
public class d {
    public static final int COLOR_FormatI420 = 1;
    public static final int COLOR_FormatNV21 = 2;

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0030 A[SYNTHETIC, Splitter:B:24:0x0030] */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0037 A[SYNTHETIC, Splitter:B:28:0x0037] */
    public static int a(String str, byte[] bArr) {
        int i = -1;
        if (TextUtils.isEmpty(str) || bArr == null || bArr.length <= 0) {
            return -1;
        }
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(str);
            try {
                fileOutputStream2.write(bArr);
                i = 0;
            } catch (Exception e) {
                e = e;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                    }
                    return i;
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        } catch (Exception e4) {
            e = e4;
            e.printStackTrace();
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
            return i;
        }
        return i;
    }

    public static Bitmap a(Bitmap bitmap, float f) {
        if (bitmap == null) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.preScale(f, f);
        matrix.setRotate(180.0f);
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, false);
        if (createBitmap.equals(bitmap)) {
            return createBitmap;
        }
        bitmap.recycle();
        return createBitmap;
    }

    public static Bitmap a(byte[] bArr, int i, int i2) {
        Bitmap bitmap;
        try {
            YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 90, byteArrayOutputStream);
            bitmap = BitmapFactory.decodeByteArray(byteArrayOutputStream.toByteArray(), 0, byteArrayOutputStream.size());
            try {
                byteArrayOutputStream.close();
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e = e2;
            bitmap = null;
            e.printStackTrace();
            return bitmap;
        }
        return bitmap;
    }

    public static String a(Context context, Uri uri) {
        if (uri.getScheme() == null) {
            return null;
        }
        if (uri.getScheme().equals(ComposerHelper.COMPOSER_CONTENT)) {
            return context.getContentResolver().getType(uri);
        }
        if (!uri.getScheme().equals(ComposerHelper.COMPOSER_PATH)) {
            return null;
        }
        String lowerCase = MimeTypeMap.getFileExtensionFromUrl(uri.getPath()).toLowerCase();
        if (lowerCase != null) {
            return MimeTypeMap.getSingleton().getMimeTypeFromExtension(lowerCase);
        }
        return null;
    }

    public static void a(String str, Bitmap bitmap) {
        File file = new File(str);
        if (file.exists()) {
            file.delete();
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            bitmap.compress(CompressFormat.PNG, 90, fileOutputStream);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public static boolean a(Image image) {
        int format = image.getFormat();
        return format == 17 || format == 35 || format == 842094169;
    }

    public static boolean a(String str, String str2, byte[] bArr) {
        boolean z = false;
        if (str2 == null || bArr == null) {
            return false;
        }
        File file = new File(str);
        if (!file.exists()) {
            file.mkdir();
        }
        File file2 = new File(str2);
        int i = 0;
        while (file2.exists()) {
            i++;
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(i);
            file2 = new File(sb.toString());
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str2);
            fileOutputStream.write(bArr);
            fileOutputStream.close();
            z = true;
        } catch (FileNotFoundException | IOException e) {
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0038 A[SYNTHETIC, Splitter:B:28:0x0038] */
    public static int b(String str, byte[] bArr) {
        if (TextUtils.isEmpty(str) || bArr == null) {
            return -1;
        }
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream fileOutputStream2 = new FileOutputStream(str);
            try {
                fileOutputStream2.write(bArr);
                try {
                    fileOutputStream2.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return 0;
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
                e.printStackTrace();
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e4) {
                        e4.printStackTrace();
                    }
                }
                return 0;
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                throw th;
            }
        }
    }

    public static byte[] b(byte[] bArr, int i, int i2) {
        try {
            YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 100, byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            return byteArray;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String g(String str, String str2) {
        String str3 = "";
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return str3;
        }
        File file = new File(str);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
            file.mkdirs();
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(File.separator);
        sb.append(str2);
        sb.append(Storage.JPEG_SUFFIX);
        String sb2 = sb.toString();
        int i = 0;
        File file2 = new File(sb2);
        while (file2.exists()) {
            i++;
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str2);
            sb3.append("_");
            sb3.append(i);
            str2 = sb3.toString();
            StringBuilder sb4 = new StringBuilder();
            sb4.append(str);
            sb4.append(File.separator);
            sb4.append(str2);
            sb4.append(Storage.JPEG_SUFFIX);
            sb2 = sb4.toString();
            file2 = new File(sb2);
        }
        return sb2;
    }

    public static SizeF getAngleValue(CameraCharacteristics cameraCharacteristics) {
        SizeF sizeF = (SizeF) cameraCharacteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE);
        float[] fArr = (float[]) cameraCharacteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS);
        if (fArr == null || fArr.length <= 0) {
            return null;
        }
        return new SizeF((float) Math.toDegrees(StrictMath.atan((double) (sizeF.getWidth() / (fArr[0] * 2.0f))) * 2.0d), (float) Math.toDegrees(2.0d * StrictMath.atan((double) (sizeF.getHeight() / (2.0f * fArr[0])))));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0060, code lost:
        r12 = r8;
     */
    public static byte[] getDataFromImage(Image image, int i) {
        Rect rect;
        int i2;
        int i3 = i;
        int i4 = 2;
        int i5 = 1;
        if (i3 != 1 && i3 != 2) {
            throw new IllegalArgumentException("only support COLOR_FormatI420 and COLOR_FormatNV21");
        } else if (a(image)) {
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
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("can't convert Image to byte array, format ");
            sb.append(image.getFormat());
            throw new UnsupportedOperationException(sb.toString());
        }
    }

    public static String h(String str, String str2) {
        String str3;
        Properties properties = new Properties();
        try {
            properties.load(new BufferedInputStream(new FileInputStream(str)));
            str3 = properties.getProperty(str2);
            try {
                if (TextUtils.isEmpty(str3)) {
                    return null;
                }
                return str3;
            } catch (Exception e) {
                e = e;
                e.printStackTrace();
                return str3;
            }
        } catch (Exception e2) {
            e = e2;
            str3 = null;
            e.printStackTrace();
            return str3;
        }
    }

    public static Bitmap rotateBitmap(Bitmap bitmap, int i, boolean z) {
        if (i == 0 || bitmap == null) {
            return bitmap;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.setRotate((float) i, ((float) width) / 2.0f, ((float) height) / 2.0f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, true);
            if (bitmap != createBitmap) {
                if (z) {
                    bitmap.recycle();
                }
                bitmap = createBitmap;
            }
        } catch (OutOfMemoryError e) {
        }
        return bitmap;
    }

    public static Bitmap scaleBitmap(Bitmap bitmap, int i, int i2) {
        if (bitmap == null) {
            return null;
        }
        int height = bitmap.getHeight();
        int width = bitmap.getWidth();
        float f = ((float) i) / ((float) width);
        float f2 = ((float) i2) / ((float) height);
        Matrix matrix = new Matrix();
        matrix.postScale(f, f2);
        Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, width, height, matrix, false);
        if (!bitmap.isRecycled()) {
            bitmap.recycle();
        }
        return createBitmap;
    }
}

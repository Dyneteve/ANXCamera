package com.xiaomi.camera.base;

import android.media.Image;
import android.media.Image.Plane;
import android.util.Size;
import com.android.camera.log.Log;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.Locale;
import libcore.io.Memory;

public final class ImageUtil {
    private static final String TAG = ImageUtil.class.getSimpleName();

    private ImageUtil() {
    }

    private static void directByteBufferCopy(ByteBuffer byteBuffer, int i, ByteBuffer byteBuffer2, int i2, int i3) {
        Memory.memmove(byteBuffer2, i2, byteBuffer, i, (long) i3);
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x00e7 A[SYNTHETIC, Splitter:B:23:0x00e7] */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00f2 A[SYNTHETIC, Splitter:B:27:0x00f2] */
    public static boolean dumpYuvImage(Image image, String str) {
        Log.d(TAG, "dumpYuvImage start");
        StringBuilder sb = new StringBuilder();
        sb.append("sdcard/DCIM/Camera/");
        sb.append(str);
        sb.append("_");
        sb.append(image.getWidth());
        sb.append("x");
        sb.append(image.getHeight());
        String sb2 = sb.toString();
        int format = image.getFormat();
        boolean z = false;
        if (format == 17 || format == 35) {
            FileOutputStream fileOutputStream = null;
            try {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(sb2);
                sb3.append(".yuv");
                FileOutputStream fileOutputStream2 = new FileOutputStream(sb3.toString());
                try {
                    ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                    ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
                    int limit = buffer.limit();
                    int limit2 = buffer2.limit();
                    String str2 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("dumpingYuvImage: size=");
                    sb4.append(image.getWidth());
                    sb4.append("x");
                    sb4.append(image.getHeight());
                    sb4.append(" stride=");
                    sb4.append(image.getPlanes()[2].getRowStride());
                    Log.d(str2, sb4.toString());
                    byte[] bArr = new byte[(limit + limit2)];
                    buffer.get(bArr, 0, limit);
                    buffer2.get(bArr, limit, limit2);
                    fileOutputStream2.write(bArr);
                    buffer.rewind();
                    buffer2.rewind();
                    z = true;
                    try {
                        fileOutputStream2.flush();
                        fileOutputStream2.close();
                    } catch (Exception e) {
                        Log.e(TAG, "Failed to flush/close stream", e);
                    }
                } catch (Exception e2) {
                    e = e2;
                    fileOutputStream = fileOutputStream2;
                    try {
                        Log.e(TAG, "Failed to write image", e);
                        if (fileOutputStream != null) {
                        }
                        return z;
                    } catch (Throwable th) {
                        th = th;
                        fileOutputStream2 = fileOutputStream;
                        if (fileOutputStream2 != null) {
                            try {
                                fileOutputStream2.flush();
                                fileOutputStream2.close();
                            } catch (Exception e3) {
                                Log.e(TAG, "Failed to flush/close stream", e3);
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (fileOutputStream2 != null) {
                    }
                    throw th;
                }
            } catch (Exception e4) {
                e = e4;
                Log.e(TAG, "Failed to write image", e);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
                return z;
            }
        }
        return z;
    }

    private static Size getEffectivePlaneSizeForImage(Image image, int i) {
        switch (image.getFormat()) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 20:
            case 32:
            case 37:
            case 38:
            case 256:
                return new Size(image.getWidth(), image.getHeight());
            case 16:
                return i == 0 ? new Size(image.getWidth(), image.getHeight()) : new Size(image.getWidth(), image.getHeight() / 2);
            case 17:
            case 35:
            case 842094169:
                return i == 0 ? new Size(image.getWidth(), image.getHeight()) : new Size(image.getWidth() / 2, image.getHeight() / 2);
            case 34:
                return new Size(0, 0);
            default:
                throw new UnsupportedOperationException(String.format("Invalid image format %d", new Object[]{Integer.valueOf(image.getFormat())}));
        }
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

    public static byte[] getYuvData(Image image) {
        if (image == null || 35 != image.getFormat()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getYuvData: ");
            sb.append(image);
            Log.e(str, sb.toString());
            return null;
        }
        ByteBuffer buffer = image.getPlanes()[0].getBuffer();
        ByteBuffer buffer2 = image.getPlanes()[2].getBuffer();
        int limit = buffer.limit();
        int limit2 = buffer2.limit();
        byte[] bArr = new byte[(limit + limit2 + 1)];
        buffer.get(bArr, 0, limit);
        buffer2.get(bArr, limit, limit2);
        bArr[bArr.length - 1] = bArr[bArr.length - 3];
        return bArr;
    }

    public static void imageCopy(Image image, Image image2) {
        if (image == null || image2 == null) {
            throw new IllegalArgumentException("Images should be non-null");
        } else if (image.getFormat() != image2.getFormat()) {
            throw new IllegalArgumentException("Src and dst images should have the same format");
        } else if (image.getFormat() == 34 || image2.getFormat() == 34) {
            throw new IllegalArgumentException("PRIVATE format images are not copyable");
        } else if (image.getFormat() != 36) {
            Size size = new Size(image.getWidth(), image.getHeight());
            Size size2 = new Size(image2.getWidth(), image2.getHeight());
            if (size.equals(size2)) {
                Plane[] planes = image.getPlanes();
                Plane[] planes2 = image2.getPlanes();
                int i = 0;
                while (i < planes.length) {
                    int rowStride = planes[i].getRowStride();
                    int rowStride2 = planes2[i].getRowStride();
                    ByteBuffer buffer = planes[i].getBuffer();
                    ByteBuffer buffer2 = planes2[i].getBuffer();
                    if (!buffer.isDirect() || !buffer2.isDirect()) {
                        throw new IllegalArgumentException("Source and destination ByteBuffers must be direct byteBuffer!");
                    } else if (planes[i].getPixelStride() == planes2[i].getPixelStride()) {
                        int position = buffer.position();
                        buffer.rewind();
                        buffer2.rewind();
                        if (rowStride == rowStride2) {
                            buffer2.put(buffer);
                        } else {
                            int position2 = buffer.position();
                            int position3 = buffer2.position();
                            Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(image, i);
                            int width = effectivePlaneSizeForImage.getWidth() * planes[i].getPixelStride();
                            int i2 = position3;
                            int i3 = position2;
                            for (int i4 = 0; i4 < effectivePlaneSizeForImage.getHeight(); i4++) {
                                if (i4 == effectivePlaneSizeForImage.getHeight() - 1) {
                                    int remaining = buffer.remaining() - i3;
                                    if (width > remaining) {
                                        width = remaining;
                                    }
                                }
                                directByteBufferCopy(buffer, i3, buffer2, i2, width);
                                i3 += rowStride;
                                i2 += rowStride2;
                            }
                        }
                        buffer.position(position);
                        buffer2.rewind();
                        i++;
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Source plane image pixel stride ");
                        sb.append(planes[i].getPixelStride());
                        sb.append(" must be same as destination image pixel stride ");
                        sb.append(planes2[i].getPixelStride());
                        throw new IllegalArgumentException(sb.toString());
                    }
                }
                return;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("source image size ");
            sb2.append(size);
            sb2.append(" is different with destination image size ");
            sb2.append(size2);
            throw new IllegalArgumentException(sb2.toString());
        } else {
            throw new IllegalArgumentException("Copy of RAW_OPAQUE format has not been implemented");
        }
    }

    public static ByteBuffer removePadding(Plane plane, int i, int i2) {
        long currentTimeMillis = System.currentTimeMillis();
        ByteBuffer buffer = plane.getBuffer();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        Log.d(TAG, String.format(Locale.ENGLISH, "removePadding: rowStride=%d pixelStride=%d size=%dx%d", new Object[]{Integer.valueOf(rowStride), Integer.valueOf(pixelStride), Integer.valueOf(i), Integer.valueOf(i2)}));
        int i3 = i * pixelStride;
        if (rowStride == i3) {
            return buffer;
        }
        int i4 = i3 * i2;
        ByteBuffer allocateDirect = ByteBuffer.allocateDirect(i4);
        int position = buffer.position();
        int position2 = allocateDirect.position();
        for (int i5 = 0; i5 < i2; i5++) {
            if (i5 == i2 - 1) {
                int remaining = buffer.remaining() - position;
                if (i3 > remaining) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("removePadding: ");
                    sb.append(remaining);
                    sb.append("/");
                    sb.append(i3);
                    Log.d(str, sb.toString());
                    i3 = remaining;
                }
            }
            directByteBufferCopy(buffer, position, allocateDirect, position2, i3);
            position += rowStride;
            position2 += i3;
        }
        if (position2 < i4) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("removePadding: add data: ");
            sb2.append(position2);
            sb2.append("|");
            sb2.append(i4);
            Log.d(str2, sb2.toString());
            while (position2 < i4) {
                allocateDirect.put(position2, allocateDirect.get(position2 - 2));
                position2++;
            }
        }
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("removePadding: cost=");
        sb3.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str3, sb3.toString());
        return allocateDirect;
    }

    private static void updateImagePlane(Plane plane, int i, int i2, byte[] bArr, boolean z, int i3) {
        int i4 = i2;
        byte[] bArr2 = bArr;
        int i5 = i3;
        ByteBuffer buffer = plane.getBuffer();
        buffer.rewind();
        int rowStride = plane.getRowStride();
        int pixelStride = plane.getPixelStride();
        int i6 = i * pixelStride;
        Log.d(TAG, String.format(Locale.ENGLISH, "updateImagePlane: size=%dx%d offset=%d length=%d rowStride=%d pixelStride=%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(bArr2.length), Integer.valueOf(rowStride), Integer.valueOf(pixelStride)}));
        int i7 = i6 * i4;
        int length = bArr2.length - i5;
        if (length >= i7) {
            if (rowStride == i6) {
                int min = Math.min(buffer.remaining(), i7);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("updateImagePlane: ");
                sb.append(min);
                Log.d(str, sb.toString());
                buffer.put(bArr2, i5, min);
            } else if (z) {
                buffer.put(bArr2, i5, Math.min(buffer.remaining(), (rowStride * (i4 - 1)) + i));
            } else {
                int position = buffer.position();
                int i8 = i6;
                for (int i9 = 0; i9 < i4; i9++) {
                    buffer.position(position);
                    if (i9 == i4 - 1) {
                        i8 = Math.min(buffer.remaining(), i6);
                        if (i8 < i6) {
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("updateImagePlane: ");
                            sb2.append(i8);
                            sb2.append("/");
                            sb2.append(i6);
                            Log.d(str2, sb2.toString());
                            i8 = buffer.remaining();
                        }
                    }
                    buffer.put(bArr2, i5, i8);
                    i5 += i6;
                    position += rowStride;
                }
            }
            buffer.rewind();
            return;
        }
        throw new RuntimeException(String.format(Locale.ENGLISH, "buffer size should be at least %d but actual size is %d", new Object[]{Integer.valueOf(i7), Integer.valueOf(length)}));
    }

    public static void updateYuvImage(Image image, byte[] bArr, boolean z) {
        if (image == null || 35 != image.getFormat()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("updateYuvImage: ");
            sb.append(image);
            Log.e(str, sb.toString());
            return;
        }
        Plane[] planes = image.getPlanes();
        updateImagePlane(planes[0], image.getWidth(), image.getHeight(), bArr, z, 0);
        int width = image.getWidth() * image.getHeight();
        if (z) {
            width = (planes[2].getRowStride() * (image.getHeight() - 1)) + image.getWidth();
        }
        updateImagePlane(planes[2], image.getWidth() / 2, image.getHeight() / 2, bArr, z, width);
    }
}

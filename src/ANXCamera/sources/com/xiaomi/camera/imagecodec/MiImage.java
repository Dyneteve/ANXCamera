package com.xiaomi.camera.imagecodec;

import android.graphics.Rect;
import android.media.Image;
import android.util.Log;
import android.util.Size;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Locale;

public class MiImage {
    private static final String TAG = MiImage.class.getSimpleName();
    private Rect mCropRect;
    private int mFormat = -1;
    private int mHeight = -1;
    private Plane[] mPlanes;
    private long mTimeStamp;
    private int mWidth = -1;

    public class Plane {
        private ByteBuffer mBuffer;
        private final int mPixelStride;
        private final int mRowStride;

        public Plane(int i, int i2, ByteBuffer byteBuffer) {
            this.mRowStride = i;
            this.mPixelStride = i2;
            this.mBuffer = byteBuffer;
            this.mBuffer.order(ByteOrder.nativeOrder());
        }

        /* access modifiers changed from: private */
        public void clearBuffer() {
            if (this.mBuffer != null) {
                this.mBuffer = null;
            }
        }

        public ByteBuffer getBuffer() {
            return this.mBuffer;
        }

        public int getPixelStride() {
            return this.mPixelStride;
        }

        public int getRowStride() {
            return this.mRowStride;
        }
    }

    public MiImage(Image image) {
        this.mFormat = image.getFormat();
        this.mWidth = image.getWidth();
        this.mHeight = image.getHeight();
        this.mCropRect = image.getCropRect();
        this.mTimeStamp = image.getTimestamp();
        android.media.Image.Plane[] planes = image.getPlanes();
        int length = planes.length;
        this.mPlanes = new Plane[length];
        for (int i = 0; i < length; i++) {
            this.mPlanes[i] = new Plane(getEffectivePlaneSizeForImage(i).getWidth() * planes[i].getPixelStride(), planes[i].getPixelStride(), ByteBuffer.allocate(planes[i].getBuffer().limit()));
        }
        fromImage(image);
    }

    private void fromImage(Image image) {
        long j;
        int i;
        android.media.Image.Plane[] planeArr;
        Plane[] planeArr2;
        Size size;
        int i2;
        long currentTimeMillis = System.currentTimeMillis();
        android.media.Image.Plane[] planes = image.getPlanes();
        Plane[] planes2 = getPlanes();
        int i3 = 0;
        while (i3 < planes2.length) {
            int rowStride = planes[i3].getRowStride();
            int rowStride2 = planes2[i3].getRowStride();
            ByteBuffer buffer = planes[i3].getBuffer();
            ByteBuffer buffer2 = planes2[i3].getBuffer();
            if (planes[i3].getPixelStride() == planes2[i3].getPixelStride()) {
                int position = buffer.position();
                buffer.rewind();
                buffer2.rewind();
                if (rowStride != rowStride2) {
                    int position2 = buffer.position();
                    int position3 = buffer2.position();
                    Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(i3);
                    int width = effectivePlaneSizeForImage.getWidth() * planes[i3].getPixelStride();
                    byte[] bArr = new byte[width];
                    int i4 = width;
                    int i5 = position3;
                    int i6 = position2;
                    int i7 = 0;
                    while (true) {
                        j = currentTimeMillis;
                        if (i7 >= effectivePlaneSizeForImage.getHeight()) {
                            break;
                        }
                        buffer.position(i6);
                        buffer2.position(i5);
                        if (i7 == effectivePlaneSizeForImage.getHeight() - 1) {
                            int remaining = buffer.remaining();
                            if (i4 > remaining) {
                                size = effectivePlaneSizeForImage;
                                planeArr2 = planes2;
                                planeArr = planes;
                                Log.d(TAG, String.format(Locale.ENGLISH, "srcPlane[%d].remain=%d", new Object[]{Integer.valueOf(i3), Integer.valueOf(remaining)}));
                                i4 = remaining;
                            } else {
                                planeArr = planes;
                                planeArr2 = planes2;
                                size = effectivePlaneSizeForImage;
                            }
                            int remaining2 = buffer2.remaining();
                            if (i4 > remaining2) {
                                String str = TAG;
                                Integer valueOf = Integer.valueOf(i3);
                                i = i3;
                                i2 = 0;
                                Log.d(str, String.format(Locale.ENGLISH, "dstPlane[%d].remain=%d", new Object[]{valueOf, Integer.valueOf(remaining2)}));
                                i4 = remaining2;
                                buffer.get(bArr, i2, i4);
                                buffer2.put(bArr, i2, i4);
                                i6 += rowStride;
                                i5 += rowStride2;
                                i7++;
                                currentTimeMillis = j;
                                effectivePlaneSizeForImage = size;
                                planes2 = planeArr2;
                                planes = planeArr;
                                i3 = i;
                            } else {
                                i = i3;
                            }
                        } else {
                            planeArr = planes;
                            planeArr2 = planes2;
                            i = i3;
                            size = effectivePlaneSizeForImage;
                        }
                        i2 = 0;
                        buffer.get(bArr, i2, i4);
                        buffer2.put(bArr, i2, i4);
                        i6 += rowStride;
                        i5 += rowStride2;
                        i7++;
                        currentTimeMillis = j;
                        effectivePlaneSizeForImage = size;
                        planes2 = planeArr2;
                        planes = planeArr;
                        i3 = i;
                    }
                } else {
                    buffer2.put(buffer);
                    j = currentTimeMillis;
                }
                android.media.Image.Plane[] planeArr3 = planes;
                Plane[] planeArr4 = planes2;
                int i8 = i3;
                buffer.position(position);
                buffer2.rewind();
                i3 = i8 + 1;
                currentTimeMillis = j;
                planes2 = planeArr4;
                planes = planeArr3;
            } else {
                android.media.Image.Plane[] planeArr5 = planes;
                Plane[] planeArr6 = planes2;
                int i9 = i3;
                StringBuilder sb = new StringBuilder();
                sb.append("source plane image pixel stride ");
                sb.append(planeArr5[i9].getPixelStride());
                sb.append(" must be same as destination image pixel stride ");
                sb.append(planeArr6[i9].getPixelStride());
                throw new IllegalArgumentException(sb.toString());
            }
        }
        long j2 = currentTimeMillis;
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("fromImage: cost=");
        sb2.append(System.currentTimeMillis() - j2);
        Log.d(str2, sb2.toString());
    }

    private Size getEffectivePlaneSizeForImage(int i) {
        switch (getFormat()) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 20:
            case 32:
            case 37:
            case 38:
            case 256:
                return new Size(getWidth(), getHeight());
            case 16:
                return i == 0 ? new Size(getWidth(), getHeight()) : new Size(getWidth(), getHeight() / 2);
            case 17:
            case 35:
            case 842094169:
                return i == 0 ? new Size(getWidth(), getHeight()) : new Size(getWidth() / 2, getHeight() / 2);
            case 34:
                return new Size(0, 0);
            default:
                throw new UnsupportedOperationException(String.format("Invalid image format %d", new Object[]{Integer.valueOf(getFormat())}));
        }
    }

    public void close() {
        if (this.mPlanes != null) {
            for (int i = 0; i < this.mPlanes.length; i++) {
                if (this.mPlanes[i] != null) {
                    this.mPlanes[i].clearBuffer();
                    this.mPlanes[i] = null;
                }
            }
        }
    }

    public int getFormat() {
        return this.mFormat;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public Plane[] getPlanes() {
        return this.mPlanes;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void toImage(Image image) {
        int i;
        Plane[] planeArr;
        android.media.Image.Plane[] planeArr2;
        long j;
        boolean z;
        int i2;
        Plane[] planeArr3;
        android.media.Image.Plane[] planeArr4;
        Size size;
        int i3;
        if (getFormat() == image.getFormat()) {
            Size size2 = new Size(getWidth(), getHeight());
            Size size3 = new Size(image.getWidth(), image.getHeight());
            if (size2.equals(size3)) {
                long currentTimeMillis = System.currentTimeMillis();
                Plane[] planes = getPlanes();
                android.media.Image.Plane[] planes2 = image.getPlanes();
                boolean z2 = true;
                int length = planes.length - 1;
                while (length >= 0) {
                    int rowStride = planes[length].getRowStride();
                    int rowStride2 = planes2[length].getRowStride();
                    ByteBuffer buffer = planes[length].getBuffer();
                    ByteBuffer buffer2 = planes2[length].getBuffer();
                    if (planes[length].getPixelStride() == planes2[length].getPixelStride()) {
                        int position = buffer.position();
                        buffer.rewind();
                        buffer2.rewind();
                        if (rowStride == rowStride2) {
                            buffer2.put(buffer);
                            j = currentTimeMillis;
                            planeArr = planes;
                            planeArr2 = planes2;
                            i = length;
                            z = z2;
                        } else {
                            int position2 = buffer.position();
                            int position3 = buffer2.position();
                            Size effectivePlaneSizeForImage = getEffectivePlaneSizeForImage(length);
                            int width = effectivePlaneSizeForImage.getWidth() * planes[length].getPixelStride();
                            byte[] bArr = new byte[width];
                            int i4 = position2;
                            int i5 = position3;
                            int i6 = width;
                            int i7 = i4;
                            int i8 = 0;
                            while (true) {
                                j = currentTimeMillis;
                                if (i8 >= effectivePlaneSizeForImage.getHeight()) {
                                    break;
                                }
                                buffer.position(i7);
                                buffer2.position(i5);
                                if (i8 == effectivePlaneSizeForImage.getHeight() - 1) {
                                    int remaining = buffer.remaining();
                                    if (i6 > remaining) {
                                        size = effectivePlaneSizeForImage;
                                        planeArr4 = planes2;
                                        planeArr3 = planes;
                                        Log.d(TAG, String.format(Locale.ENGLISH, "srcPlane[%d].remain=%d", new Object[]{Integer.valueOf(length), Integer.valueOf(remaining)}));
                                        i6 = remaining;
                                    } else {
                                        planeArr3 = planes;
                                        planeArr4 = planes2;
                                        size = effectivePlaneSizeForImage;
                                    }
                                    int remaining2 = buffer2.remaining();
                                    if (i6 > remaining2) {
                                        String str = TAG;
                                        Integer valueOf = Integer.valueOf(length);
                                        i2 = length;
                                        i3 = 0;
                                        Log.d(str, String.format(Locale.ENGLISH, "dstPlane[%d].remain=%d", new Object[]{valueOf, Integer.valueOf(remaining2)}));
                                        i6 = remaining2;
                                        buffer.get(bArr, i3, i6);
                                        buffer2.put(bArr, i3, i6);
                                        i7 += rowStride;
                                        i5 += rowStride2;
                                        i8++;
                                        currentTimeMillis = j;
                                        effectivePlaneSizeForImage = size;
                                        planes2 = planeArr4;
                                        planes = planeArr3;
                                        length = i2;
                                    } else {
                                        i2 = length;
                                    }
                                } else {
                                    planeArr3 = planes;
                                    planeArr4 = planes2;
                                    i2 = length;
                                    size = effectivePlaneSizeForImage;
                                }
                                i3 = 0;
                                buffer.get(bArr, i3, i6);
                                buffer2.put(bArr, i3, i6);
                                i7 += rowStride;
                                i5 += rowStride2;
                                i8++;
                                currentTimeMillis = j;
                                effectivePlaneSizeForImage = size;
                                planes2 = planeArr4;
                                planes = planeArr3;
                                length = i2;
                            }
                            planeArr = planes;
                            planeArr2 = planes2;
                            i = length;
                            z = true;
                        }
                        buffer.position(position);
                        buffer2.rewind();
                        length = i - 1;
                        z2 = z;
                        currentTimeMillis = j;
                        planes2 = planeArr2;
                        planes = planeArr;
                    } else {
                        Plane[] planeArr5 = planes;
                        android.media.Image.Plane[] planeArr6 = planes2;
                        int i9 = length;
                        StringBuilder sb = new StringBuilder();
                        sb.append("source plane image pixel stride ");
                        sb.append(planeArr5[i9].getPixelStride());
                        sb.append(" must be same as destination image pixel stride ");
                        sb.append(planeArr6[i9].getPixelStride());
                        throw new IllegalArgumentException(sb.toString());
                    }
                }
                long j2 = currentTimeMillis;
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("toImage: cost=");
                sb2.append(System.currentTimeMillis() - j2);
                Log.d(str2, sb2.toString());
                return;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append("source image size ");
            sb3.append(size2);
            sb3.append(" is different with destination image size ");
            sb3.append(size3);
            throw new IllegalArgumentException(sb3.toString());
        }
        throw new IllegalArgumentException("src and dst images should have the same format");
    }
}

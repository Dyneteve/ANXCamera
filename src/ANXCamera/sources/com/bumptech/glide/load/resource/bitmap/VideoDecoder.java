package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.os.Build.VERSION;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.e;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

public class VideoDecoder<T> implements g<T, Bitmap> {
    @VisibleForTesting
    static final int DEFAULT_FRAME_OPTION = 2;
    private static final String TAG = "VideoDecoder";
    public static final long lS = -1;
    public static final e<Long> lT = e.a("com.bumptech.glide.load.resource.bitmap.VideoBitmapDecode.TargetFrame", Long.valueOf(-1), new com.bumptech.glide.load.e.a<Long>() {
        private final ByteBuffer buffer = ByteBuffer.allocate(8);

        public void a(@NonNull byte[] bArr, @NonNull Long l, @NonNull MessageDigest messageDigest) {
            messageDigest.update(bArr);
            synchronized (this.buffer) {
                this.buffer.position(0);
                messageDigest.update(this.buffer.putLong(l.longValue()).array());
            }
        }
    });
    public static final e<Integer> lU = e.a("com.bumptech.glide.load.resource.bitmap.VideoBitmapDecode.FrameOption", Integer.valueOf(2), new com.bumptech.glide.load.e.a<Integer>() {
        private final ByteBuffer buffer = ByteBuffer.allocate(4);

        public void a(@NonNull byte[] bArr, @NonNull Integer num, @NonNull MessageDigest messageDigest) {
            if (num != null) {
                messageDigest.update(bArr);
                synchronized (this.buffer) {
                    this.buffer.position(0);
                    messageDigest.update(this.buffer.putInt(num.intValue()).array());
                }
            }
        }
    });
    private static final MediaMetadataRetrieverFactory lV = new MediaMetadataRetrieverFactory();
    private final d al;
    private final MediaMetadataRetrieverInitializer<T> lW;
    private final MediaMetadataRetrieverFactory lX;

    @VisibleForTesting
    static class MediaMetadataRetrieverFactory {
        MediaMetadataRetrieverFactory() {
        }

        public MediaMetadataRetriever cB() {
            return new MediaMetadataRetriever();
        }
    }

    @VisibleForTesting
    interface MediaMetadataRetrieverInitializer<T> {
        void a(MediaMetadataRetriever mediaMetadataRetriever, T t);
    }

    private static final class a implements MediaMetadataRetrieverInitializer<AssetFileDescriptor> {
        private a() {
        }

        public void a(MediaMetadataRetriever mediaMetadataRetriever, AssetFileDescriptor assetFileDescriptor) {
            mediaMetadataRetriever.setDataSource(assetFileDescriptor.getFileDescriptor(), assetFileDescriptor.getStartOffset(), assetFileDescriptor.getLength());
        }
    }

    static final class b implements MediaMetadataRetrieverInitializer<ParcelFileDescriptor> {
        b() {
        }

        public void a(MediaMetadataRetriever mediaMetadataRetriever, ParcelFileDescriptor parcelFileDescriptor) {
            mediaMetadataRetriever.setDataSource(parcelFileDescriptor.getFileDescriptor());
        }
    }

    VideoDecoder(d dVar, MediaMetadataRetrieverInitializer<T> mediaMetadataRetrieverInitializer) {
        this(dVar, mediaMetadataRetrieverInitializer, lV);
    }

    @VisibleForTesting
    VideoDecoder(d dVar, MediaMetadataRetrieverInitializer<T> mediaMetadataRetrieverInitializer, MediaMetadataRetrieverFactory mediaMetadataRetrieverFactory) {
        this.al = dVar;
        this.lW = mediaMetadataRetrieverInitializer;
        this.lX = mediaMetadataRetrieverFactory;
    }

    private static Bitmap a(MediaMetadataRetriever mediaMetadataRetriever, long j, int i) {
        return mediaMetadataRetriever.getFrameAtTime(j, i);
    }

    @Nullable
    private static Bitmap a(MediaMetadataRetriever mediaMetadataRetriever, long j, int i, int i2, int i3, DownsampleStrategy downsampleStrategy) {
        Bitmap b2 = (VERSION.SDK_INT < 27 || i2 == Integer.MIN_VALUE || i3 == Integer.MIN_VALUE || downsampleStrategy == DownsampleStrategy.lh) ? null : b(mediaMetadataRetriever, j, i, i2, i3, downsampleStrategy);
        return b2 == null ? a(mediaMetadataRetriever, j, i) : b2;
    }

    @TargetApi(27)
    private static Bitmap b(MediaMetadataRetriever mediaMetadataRetriever, long j, int i, int i2, int i3, DownsampleStrategy downsampleStrategy) {
        try {
            int parseInt = Integer.parseInt(mediaMetadataRetriever.extractMetadata(18));
            int parseInt2 = Integer.parseInt(mediaMetadataRetriever.extractMetadata(19));
            int parseInt3 = Integer.parseInt(mediaMetadataRetriever.extractMetadata(24));
            if (parseInt3 == 90 || parseInt3 == 270) {
                int i4 = parseInt2;
                parseInt2 = parseInt;
                parseInt = i4;
            }
            float a2 = downsampleStrategy.a(parseInt, parseInt2, i2, i3);
            return mediaMetadataRetriever.getScaledFrameAtTime(j, i, Math.round(((float) parseInt) * a2), Math.round(a2 * ((float) parseInt2)));
        } catch (Throwable th) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Exception trying to decode frame on oreo+", th);
            }
            return null;
        }
    }

    public static g<AssetFileDescriptor, Bitmap> b(d dVar) {
        return new VideoDecoder(dVar, new a());
    }

    public static g<ParcelFileDescriptor, Bitmap> c(d dVar) {
        return new VideoDecoder(dVar, new b());
    }

    public p<Bitmap> a(@NonNull T t, int i, int i2, @NonNull f fVar) throws IOException {
        long longValue = ((Long) fVar.a(lT)).longValue();
        if (longValue >= 0 || longValue == -1) {
            Integer num = (Integer) fVar.a(lU);
            if (num == null) {
                num = Integer.valueOf(2);
            }
            DownsampleStrategy downsampleStrategy = (DownsampleStrategy) fVar.a(DownsampleStrategy.lj);
            if (downsampleStrategy == null) {
                downsampleStrategy = DownsampleStrategy.li;
            }
            DownsampleStrategy downsampleStrategy2 = downsampleStrategy;
            MediaMetadataRetriever cB = this.lX.cB();
            try {
                this.lW.a(cB, t);
                Bitmap a2 = a(cB, longValue, num.intValue(), i, i2, downsampleStrategy2);
                cB.release();
                return f.a(a2, this.al);
            } catch (RuntimeException e) {
                throw new IOException(e);
            } catch (Throwable th) {
                cB.release();
                throw th;
            }
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Requested frame must be non-negative, or DEFAULT_FRAME, given: ");
            sb.append(longValue);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public boolean a(@NonNull T t, @NonNull f fVar) {
        return true;
    }
}

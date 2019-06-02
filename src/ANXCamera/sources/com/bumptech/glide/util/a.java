package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: ByteBufferUtil */
public final class a {
    private static final int BUFFER_SIZE = 16384;
    private static final AtomicReference<byte[]> pO = new AtomicReference<>();

    /* compiled from: ByteBufferUtil */
    /* renamed from: com.bumptech.glide.util.a$a reason: collision with other inner class name */
    private static class C0012a extends InputStream {
        private static final int UNSET = -1;
        @NonNull
        private final ByteBuffer byteBuffer;
        private int pP = -1;

        C0012a(@NonNull ByteBuffer byteBuffer2) {
            this.byteBuffer = byteBuffer2;
        }

        public int available() {
            return this.byteBuffer.remaining();
        }

        public synchronized void mark(int i) {
            this.pP = this.byteBuffer.position();
        }

        public boolean markSupported() {
            return true;
        }

        public int read() {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            return this.byteBuffer.get();
        }

        public int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            int min = Math.min(i2, available());
            this.byteBuffer.get(bArr, i, min);
            return min;
        }

        public synchronized void reset() throws IOException {
            if (this.pP != -1) {
                this.byteBuffer.position(this.pP);
            } else {
                throw new IOException("Cannot reset to unset mark position");
            }
        }

        public long skip(long j) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            long min = Math.min(j, (long) available());
            this.byteBuffer.position((int) (((long) this.byteBuffer.position()) + min));
            return min;
        }
    }

    /* compiled from: ByteBufferUtil */
    static final class b {
        final byte[] data;
        final int limit;
        final int offset;

        b(@NonNull byte[] bArr, int i, int i2) {
            this.data = bArr;
            this.offset = i;
            this.limit = i2;
        }
    }

    private a() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037 A[SYNTHETIC, Splitter:B:20:0x0037] */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e A[SYNTHETIC, Splitter:B:24:0x003e] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void a(@NonNull ByteBuffer byteBuffer, @NonNull File file) throws IOException {
        FileChannel fileChannel;
        RandomAccessFile randomAccessFile;
        byteBuffer.position(0);
        try {
            randomAccessFile = new RandomAccessFile(file, "rw");
            try {
                fileChannel = randomAccessFile.getChannel();
            } catch (Throwable th) {
                th = th;
                fileChannel = null;
                if (fileChannel != null) {
                }
                if (randomAccessFile != null) {
                }
                throw th;
            }
            try {
                fileChannel.write(byteBuffer);
                fileChannel.force(false);
                fileChannel.close();
                randomAccessFile.close();
                if (fileChannel != null) {
                    try {
                        fileChannel.close();
                    } catch (IOException e) {
                    }
                }
                try {
                    randomAccessFile.close();
                } catch (IOException e2) {
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileChannel != null) {
                }
                if (randomAccessFile != null) {
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            fileChannel = null;
            randomAccessFile = null;
            if (fileChannel != null) {
                try {
                    fileChannel.close();
                } catch (IOException e3) {
                }
            }
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }

    public static void a(@NonNull ByteBuffer byteBuffer, @NonNull OutputStream outputStream) throws IOException {
        b h = h(byteBuffer);
        if (h != null) {
            outputStream.write(h.data, h.offset, h.offset + h.limit);
            return;
        }
        byte[] bArr = (byte[]) pO.getAndSet(null);
        if (bArr == null) {
            bArr = new byte[16384];
        }
        while (byteBuffer.remaining() > 0) {
            int min = Math.min(byteBuffer.remaining(), bArr.length);
            byteBuffer.get(bArr, 0, min);
            outputStream.write(bArr, 0, min);
        }
        pO.set(bArr);
    }

    @NonNull
    public static byte[] f(@NonNull ByteBuffer byteBuffer) {
        b h = h(byteBuffer);
        if (h != null && h.offset == 0 && h.limit == h.data.length) {
            return byteBuffer.array();
        }
        ByteBuffer asReadOnlyBuffer = byteBuffer.asReadOnlyBuffer();
        byte[] bArr = new byte[asReadOnlyBuffer.limit()];
        asReadOnlyBuffer.position(0);
        asReadOnlyBuffer.get(bArr);
        return bArr;
    }

    @NonNull
    public static InputStream g(@NonNull ByteBuffer byteBuffer) {
        return new C0012a(byteBuffer);
    }

    @NonNull
    public static ByteBuffer g(@NonNull InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(16384);
        byte[] bArr = (byte[]) pO.getAndSet(null);
        if (bArr == null) {
            bArr = new byte[16384];
        }
        while (true) {
            int read = inputStream.read(bArr);
            if (read >= 0) {
                byteArrayOutputStream.write(bArr, 0, read);
            } else {
                pO.set(bArr);
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                return (ByteBuffer) ByteBuffer.allocateDirect(byteArray.length).put(byteArray).position(0);
            }
        }
    }

    @Nullable
    private static b h(@NonNull ByteBuffer byteBuffer) {
        if (byteBuffer.isReadOnly() || !byteBuffer.hasArray()) {
            return null;
        }
        return new b(byteBuffer.array(), byteBuffer.arrayOffset(), byteBuffer.limit());
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0055 A[SYNTHETIC, Splitter:B:30:0x0055] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x005c A[SYNTHETIC, Splitter:B:34:0x005c] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @NonNull
    public static ByteBuffer l(@NonNull File file) throws IOException {
        RandomAccessFile randomAccessFile;
        FileChannel fileChannel = null;
        try {
            long length = file.length();
            if (length > 2147483647L) {
                throw new IOException("File too large to map into memory");
            } else if (length != 0) {
                randomAccessFile = new RandomAccessFile(file, "r");
                try {
                    FileChannel channel = randomAccessFile.getChannel();
                    try {
                        MappedByteBuffer load = channel.map(MapMode.READ_ONLY, 0, length).load();
                        if (channel != null) {
                            try {
                                channel.close();
                            } catch (IOException e) {
                            }
                        }
                        try {
                            randomAccessFile.close();
                        } catch (IOException e2) {
                        }
                        return load;
                    } catch (Throwable th) {
                        Throwable th2 = th;
                        fileChannel = channel;
                        th = th2;
                        if (fileChannel != null) {
                        }
                        if (randomAccessFile != null) {
                        }
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (fileChannel != null) {
                    }
                    if (randomAccessFile != null) {
                    }
                    throw th;
                }
            } else {
                throw new IOException("File unsuitable for memory mapping");
            }
        } catch (Throwable th4) {
            th = th4;
            randomAccessFile = null;
            if (fileChannel != null) {
                try {
                    fileChannel.close();
                } catch (IOException e3) {
                }
            }
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }
}

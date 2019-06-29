package okio;

import android.support.v4.media.session.PlaybackStateCompat;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.ss.android.ttve.utils.UIUtils;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.Nullable;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public final class Buffer implements Cloneable, BufferedSink, BufferedSource {
    private static final byte[] DIGITS = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};
    static final int REPLACEMENT_CHARACTER = 65533;
    @Nullable
    Segment head;
    long size;

    private ByteString digest(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance(str);
            if (this.head != null) {
                instance.update(this.head.data, this.head.pos, this.head.limit - this.head.pos);
                Segment segment = this.head;
                while (true) {
                    segment = segment.next;
                    if (segment == this.head) {
                        break;
                    }
                    instance.update(segment.data, segment.pos, segment.limit - segment.pos);
                }
            }
            return ByteString.of(instance.digest());
        } catch (NoSuchAlgorithmException e) {
            throw new AssertionError();
        }
    }

    private ByteString hmac(String str, ByteString byteString) {
        try {
            Mac instance = Mac.getInstance(str);
            instance.init(new SecretKeySpec(byteString.toByteArray(), str));
            if (this.head != null) {
                instance.update(this.head.data, this.head.pos, this.head.limit - this.head.pos);
                Segment segment = this.head;
                while (true) {
                    segment = segment.next;
                    if (segment == this.head) {
                        break;
                    }
                    instance.update(segment.data, segment.pos, segment.limit - segment.pos);
                }
            }
            return ByteString.of(instance.doFinal());
        } catch (NoSuchAlgorithmException e) {
            throw new AssertionError();
        } catch (InvalidKeyException e2) {
            throw new IllegalArgumentException(e2);
        }
    }

    private boolean rangeEquals(Segment segment, int i, ByteString byteString, int i2, int i3) {
        int i4 = segment.limit;
        byte[] bArr = segment.data;
        while (i2 < i3) {
            if (i == i4) {
                segment = segment.next;
                byte[] bArr2 = segment.data;
                int i5 = segment.pos;
                bArr = bArr2;
                i = i5;
                i4 = segment.limit;
            }
            if (bArr[i] != byteString.getByte(i2)) {
                return false;
            }
            i++;
            i2++;
        }
        return true;
    }

    private void readFrom(InputStream inputStream, long j, boolean z) throws IOException {
        if (inputStream != null) {
            while (true) {
                if (j > 0 || z) {
                    Segment writableSegment = writableSegment(1);
                    int read = inputStream.read(writableSegment.data, writableSegment.limit, (int) Math.min(j, (long) (8192 - writableSegment.limit)));
                    if (read != -1) {
                        writableSegment.limit += read;
                        long j2 = (long) read;
                        this.size += j2;
                        j -= j2;
                    } else if (!z) {
                        throw new EOFException();
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            }
        } else {
            throw new IllegalArgumentException("in == null");
        }
    }

    public Buffer buffer() {
        return this;
    }

    public void clear() {
        try {
            skip(this.size);
        } catch (EOFException e) {
            throw new AssertionError(e);
        }
    }

    public Buffer clone() {
        Buffer buffer = new Buffer();
        if (this.size == 0) {
            return buffer;
        }
        buffer.head = new Segment(this.head);
        Segment segment = buffer.head;
        Segment segment2 = buffer.head;
        Segment segment3 = buffer.head;
        segment2.prev = segment3;
        segment.next = segment3;
        Segment segment4 = this.head;
        while (true) {
            segment4 = segment4.next;
            if (segment4 != this.head) {
                buffer.head.prev.push(new Segment(segment4));
            } else {
                buffer.size = this.size;
                return buffer;
            }
        }
    }

    public void close() {
    }

    public long completeSegmentByteCount() {
        long j = this.size;
        if (j == 0) {
            return 0;
        }
        Segment segment = this.head.prev;
        if (segment.limit < 8192 && segment.owner) {
            j -= (long) (segment.limit - segment.pos);
        }
        return j;
    }

    public Buffer copyTo(OutputStream outputStream) throws IOException {
        return copyTo(outputStream, 0, this.size);
    }

    public Buffer copyTo(OutputStream outputStream, long j, long j2) throws IOException {
        if (outputStream != null) {
            Util.checkOffsetAndCount(this.size, j, j2);
            if (j2 == 0) {
                return this;
            }
            Segment segment = this.head;
            while (j >= ((long) (segment.limit - segment.pos))) {
                j -= (long) (segment.limit - segment.pos);
                segment = segment.next;
            }
            while (j2 > 0) {
                int i = (int) (((long) segment.pos) + j);
                int min = (int) Math.min((long) (segment.limit - i), j2);
                outputStream.write(segment.data, i, min);
                j2 -= (long) min;
                segment = segment.next;
                j = 0;
            }
            return this;
        }
        throw new IllegalArgumentException("out == null");
    }

    public Buffer copyTo(Buffer buffer, long j, long j2) {
        if (buffer != null) {
            Util.checkOffsetAndCount(this.size, j, j2);
            if (j2 == 0) {
                return this;
            }
            buffer.size += j2;
            Segment segment = this.head;
            while (j >= ((long) (segment.limit - segment.pos))) {
                j -= (long) (segment.limit - segment.pos);
                segment = segment.next;
            }
            while (j2 > 0) {
                Segment segment2 = new Segment(segment);
                segment2.pos = (int) (((long) segment2.pos) + j);
                segment2.limit = Math.min(segment2.pos + ((int) j2), segment2.limit);
                if (buffer.head == null) {
                    segment2.prev = segment2;
                    segment2.next = segment2;
                    buffer.head = segment2;
                } else {
                    buffer.head.prev.push(segment2);
                }
                j2 -= (long) (segment2.limit - segment2.pos);
                segment = segment.next;
                j = 0;
            }
            return this;
        }
        throw new IllegalArgumentException("out == null");
    }

    public BufferedSink emit() {
        return this;
    }

    public Buffer emitCompleteSegments() {
        return this;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Buffer)) {
            return false;
        }
        Buffer buffer = (Buffer) obj;
        if (this.size != buffer.size) {
            return false;
        }
        long j = 0;
        if (this.size == 0) {
            return true;
        }
        Segment segment = this.head;
        Segment segment2 = buffer.head;
        int i = segment.pos;
        int i2 = segment2.pos;
        while (j < this.size) {
            long min = (long) Math.min(segment.limit - i, segment2.limit - i2);
            int i3 = i2;
            int i4 = i;
            int i5 = 0;
            while (((long) i5) < min) {
                int i6 = i4 + 1;
                int i7 = i3 + 1;
                if (segment.data[i4] != segment2.data[i3]) {
                    return false;
                }
                i5++;
                i4 = i6;
                i3 = i7;
            }
            if (i4 == segment.limit) {
                segment = segment.next;
                i = segment.pos;
            } else {
                i = i4;
            }
            if (i3 == segment2.limit) {
                segment2 = segment2.next;
                i2 = segment2.pos;
            } else {
                i2 = i3;
            }
            j += min;
        }
        return true;
    }

    public boolean exhausted() {
        return this.size == 0;
    }

    public void flush() {
    }

    public byte getByte(long j) {
        Util.checkOffsetAndCount(this.size, j, 1);
        Segment segment = this.head;
        while (true) {
            long j2 = (long) (segment.limit - segment.pos);
            if (j < j2) {
                return segment.data[segment.pos + ((int) j)];
            }
            j -= j2;
            segment = segment.next;
        }
    }

    public int hashCode() {
        Segment segment = this.head;
        if (segment == null) {
            return 0;
        }
        int i = 1;
        do {
            for (int i2 = segment.pos; i2 < segment.limit; i2++) {
                i = segment.data[i2] + (31 * i);
            }
            segment = segment.next;
        } while (segment != this.head);
        return i;
    }

    public ByteString hmacSha1(ByteString byteString) {
        return hmac("HmacSHA1", byteString);
    }

    public ByteString hmacSha256(ByteString byteString) {
        return hmac("HmacSHA256", byteString);
    }

    public ByteString hmacSha512(ByteString byteString) {
        return hmac("HmacSHA512", byteString);
    }

    public long indexOf(byte b) {
        return indexOf(b, 0, Long.MAX_VALUE);
    }

    public long indexOf(byte b, long j) {
        return indexOf(b, j, Long.MAX_VALUE);
    }

    public long indexOf(byte b, long j, long j2) {
        long j3;
        long j4 = 0;
        if (j < 0 || j2 < j) {
            throw new IllegalArgumentException(String.format("size=%s fromIndex=%s toIndex=%s", new Object[]{Long.valueOf(this.size), Long.valueOf(j), Long.valueOf(j2)}));
        }
        if (j2 > this.size) {
            j2 = this.size;
        }
        if (j == j2) {
            return -1;
        }
        Segment segment = this.head;
        if (segment == null) {
            return -1;
        }
        if (this.size - j >= j) {
            while (true) {
                long j5 = ((long) (segment.limit - segment.pos)) + j3;
                if (j5 >= j) {
                    break;
                }
                segment = segment.next;
                j4 = j5;
            }
        } else {
            j3 = this.size;
            while (j3 > j) {
                segment = segment.prev;
                j3 -= (long) (segment.limit - segment.pos);
            }
        }
        while (j3 < j2) {
            byte[] bArr = segment.data;
            int min = (int) Math.min((long) segment.limit, (((long) segment.pos) + j2) - j3);
            for (int i = (int) ((((long) segment.pos) + j) - j3); i < min; i++) {
                if (bArr[i] == b) {
                    return ((long) (i - segment.pos)) + j3;
                }
            }
            j = ((long) (segment.limit - segment.pos)) + j3;
            segment = segment.next;
            j3 = j;
        }
        return -1;
    }

    public long indexOf(ByteString byteString) throws IOException {
        return indexOf(byteString, 0);
    }

    public long indexOf(ByteString byteString, long j) throws IOException {
        long j2;
        byte[] bArr;
        Segment segment;
        Buffer buffer = this;
        if (byteString.size() != 0) {
            long j3 = 0;
            if (j >= 0) {
                Segment segment2 = buffer.head;
                if (segment2 == null) {
                    return -1;
                }
                if (buffer.size - j >= j) {
                    while (true) {
                        long j4 = ((long) (segment2.limit - segment2.pos)) + j2;
                        if (j4 >= j) {
                            break;
                        }
                        segment2 = segment2.next;
                        j3 = j4;
                    }
                } else {
                    j2 = buffer.size;
                    while (j2 > j) {
                        segment2 = segment2.prev;
                        j2 -= (long) (segment2.limit - segment2.pos);
                    }
                }
                ByteString byteString2 = byteString;
                byte b = byteString2.getByte(0);
                int size2 = byteString.size();
                long j5 = (buffer.size - ((long) size2)) + 1;
                long j6 = j;
                long j7 = j2;
                Segment segment3 = segment2;
                while (j7 < j5) {
                    byte[] bArr2 = segment3.data;
                    int min = (int) Math.min((long) segment3.limit, (((long) segment3.pos) + j5) - j7);
                    int i = (int) ((((long) segment3.pos) + j6) - j7);
                    while (i < min) {
                        if (bArr2[i] == b) {
                            Buffer buffer2 = buffer;
                            bArr = bArr2;
                            segment = segment3;
                            if (buffer2.rangeEquals(segment3, i + 1, byteString2, 1, size2)) {
                                return ((long) (i - segment.pos)) + j7;
                            }
                        } else {
                            bArr = bArr2;
                            segment = segment3;
                        }
                        i++;
                        segment3 = segment;
                        bArr2 = bArr;
                        buffer = this;
                    }
                    Segment segment4 = segment3;
                    j6 = ((long) (segment4.limit - segment4.pos)) + j7;
                    segment3 = segment4.next;
                    j7 = j6;
                    buffer = this;
                }
                return -1;
            }
            throw new IllegalArgumentException("fromIndex < 0");
        }
        throw new IllegalArgumentException("bytes is empty");
    }

    public long indexOfElement(ByteString byteString) {
        return indexOfElement(byteString, 0);
    }

    public long indexOfElement(ByteString byteString, long j) {
        long j2;
        long j3 = 0;
        if (j >= 0) {
            Segment segment = this.head;
            if (segment == null) {
                return -1;
            }
            if (this.size - j >= j) {
                while (true) {
                    long j4 = ((long) (segment.limit - segment.pos)) + j2;
                    if (j4 >= j) {
                        break;
                    }
                    segment = segment.next;
                    j3 = j4;
                }
            } else {
                j2 = this.size;
                while (j2 > j) {
                    segment = segment.prev;
                    j2 -= (long) (segment.limit - segment.pos);
                }
            }
            if (byteString.size() == 2) {
                byte b = byteString.getByte(0);
                byte b2 = byteString.getByte(1);
                while (j2 < this.size) {
                    byte[] bArr = segment.data;
                    int i = segment.limit;
                    for (int i2 = (int) ((((long) segment.pos) + j) - j2); i2 < i; i2++) {
                        byte b3 = bArr[i2];
                        if (b3 == b || b3 == b2) {
                            return ((long) (i2 - segment.pos)) + j2;
                        }
                    }
                    j = ((long) (segment.limit - segment.pos)) + j2;
                    segment = segment.next;
                    j2 = j;
                }
            } else {
                byte[] internalArray = byteString.internalArray();
                while (j2 < this.size) {
                    byte[] bArr2 = segment.data;
                    int i3 = segment.limit;
                    for (int i4 = (int) ((((long) segment.pos) + j) - j2); i4 < i3; i4++) {
                        byte b4 = bArr2[i4];
                        for (byte b5 : internalArray) {
                            if (b4 == b5) {
                                return ((long) (i4 - segment.pos)) + j2;
                            }
                        }
                    }
                    j = ((long) (segment.limit - segment.pos)) + j2;
                    segment = segment.next;
                    j2 = j;
                }
            }
            return -1;
        }
        throw new IllegalArgumentException("fromIndex < 0");
    }

    public InputStream inputStream() {
        return new InputStream() {
            public int available() {
                return (int) Math.min(Buffer.this.size, 2147483647L);
            }

            public void close() {
            }

            public int read() {
                if (Buffer.this.size > 0) {
                    return Buffer.this.readByte() & 255;
                }
                return -1;
            }

            public int read(byte[] bArr, int i, int i2) {
                return Buffer.this.read(bArr, i, i2);
            }

            public String toString() {
                StringBuilder sb = new StringBuilder();
                sb.append(Buffer.this);
                sb.append(".inputStream()");
                return sb.toString();
            }
        };
    }

    public ByteString md5() {
        return digest("MD5");
    }

    public OutputStream outputStream() {
        return new OutputStream() {
            public void close() {
            }

            public void flush() {
            }

            public String toString() {
                StringBuilder sb = new StringBuilder();
                sb.append(Buffer.this);
                sb.append(".outputStream()");
                return sb.toString();
            }

            public void write(int i) {
                Buffer.this.writeByte((int) (byte) i);
            }

            public void write(byte[] bArr, int i, int i2) {
                Buffer.this.write(bArr, i, i2);
            }
        };
    }

    public boolean rangeEquals(long j, ByteString byteString) {
        return rangeEquals(j, byteString, 0, byteString.size());
    }

    public boolean rangeEquals(long j, ByteString byteString, int i, int i2) {
        if (j < 0 || i < 0 || i2 < 0 || this.size - j < ((long) i2) || byteString.size() - i < i2) {
            return false;
        }
        for (int i3 = 0; i3 < i2; i3++) {
            if (getByte(((long) i3) + j) != byteString.getByte(i + i3)) {
                return false;
            }
        }
        return true;
    }

    public int read(byte[] bArr) {
        return read(bArr, 0, bArr.length);
    }

    public int read(byte[] bArr, int i, int i2) {
        Util.checkOffsetAndCount((long) bArr.length, (long) i, (long) i2);
        Segment segment = this.head;
        if (segment == null) {
            return -1;
        }
        int min = Math.min(i2, segment.limit - segment.pos);
        System.arraycopy(segment.data, segment.pos, bArr, i, min);
        segment.pos += min;
        this.size -= (long) min;
        if (segment.pos == segment.limit) {
            this.head = segment.pop();
            SegmentPool.recycle(segment);
        }
        return min;
    }

    public long read(Buffer buffer, long j) {
        if (buffer == null) {
            throw new IllegalArgumentException("sink == null");
        } else if (j < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("byteCount < 0: ");
            sb.append(j);
            throw new IllegalArgumentException(sb.toString());
        } else if (this.size == 0) {
            return -1;
        } else {
            if (j > this.size) {
                j = this.size;
            }
            buffer.write(this, j);
            return j;
        }
    }

    public long readAll(Sink sink) throws IOException {
        long j = this.size;
        if (j > 0) {
            sink.write(this, j);
        }
        return j;
    }

    public byte readByte() {
        if (this.size != 0) {
            Segment segment = this.head;
            int i = segment.pos;
            int i2 = segment.limit;
            int i3 = i + 1;
            byte b = segment.data[i];
            this.size--;
            if (i3 == i2) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            } else {
                segment.pos = i3;
            }
            return b;
        }
        throw new IllegalStateException("size == 0");
    }

    public byte[] readByteArray() {
        try {
            return readByteArray(this.size);
        } catch (EOFException e) {
            throw new AssertionError(e);
        }
    }

    public byte[] readByteArray(long j) throws EOFException {
        Util.checkOffsetAndCount(this.size, 0, j);
        if (j <= 2147483647L) {
            byte[] bArr = new byte[((int) j)];
            readFully(bArr);
            return bArr;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("byteCount > Integer.MAX_VALUE: ");
        sb.append(j);
        throw new IllegalArgumentException(sb.toString());
    }

    public ByteString readByteString() {
        return new ByteString(readByteArray());
    }

    public ByteString readByteString(long j) throws EOFException {
        return new ByteString(readByteArray(j));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x004e, code lost:
        if (r5 != false) goto L_0x0053;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0050, code lost:
        r0.readByte();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0053, code lost:
        r2 = new java.lang.StringBuilder();
        r2.append("Number too large: ");
        r2.append(r0.readUtf8());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x006d, code lost:
        throw new java.lang.NumberFormatException(r2.toString());
     */
    public long readDecimalLong() {
        long j = 0;
        if (this.size != 0) {
            int i = 0;
            long j2 = -7;
            boolean z = false;
            boolean z2 = false;
            loop0:
            do {
                Segment segment = this.head;
                byte[] bArr = segment.data;
                int i2 = segment.pos;
                int i3 = segment.limit;
                while (true) {
                    if (i2 >= i3) {
                        break;
                    }
                    byte b = bArr[i2];
                    if (b >= 48 && b <= 57) {
                        int i4 = 48 - b;
                        int i5 = (j > -922337203685477580L ? 1 : (j == -922337203685477580L ? 0 : -1));
                        if (i5 < 0 || (i5 == 0 && ((long) i4) < j2)) {
                            Buffer writeByte = new Buffer().writeDecimalLong(j).writeByte((int) b);
                        } else {
                            j = (j * 10) + ((long) i4);
                        }
                    } else if (b == 45 && i == 0) {
                        j2--;
                        z = true;
                    } else if (i != 0) {
                        z2 = true;
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Expected leading [0-9] or '-' character but was 0x");
                        sb.append(Integer.toHexString(b));
                        throw new NumberFormatException(sb.toString());
                    }
                    i2++;
                    i++;
                }
                if (i2 == i3) {
                    this.head = segment.pop();
                    SegmentPool.recycle(segment);
                } else {
                    segment.pos = i2;
                }
                if (z2) {
                    break;
                }
            } while (this.head != null);
            this.size -= (long) i;
            return z ? j : -j;
        }
        throw new IllegalStateException("size == 0");
    }

    public Buffer readFrom(InputStream inputStream) throws IOException {
        readFrom(inputStream, Long.MAX_VALUE, true);
        return this;
    }

    public Buffer readFrom(InputStream inputStream, long j) throws IOException {
        if (j >= 0) {
            readFrom(inputStream, j, false);
            return this;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("byteCount < 0: ");
        sb.append(j);
        throw new IllegalArgumentException(sb.toString());
    }

    public void readFully(Buffer buffer, long j) throws EOFException {
        if (this.size >= j) {
            buffer.write(this, j);
        } else {
            buffer.write(this, this.size);
            throw new EOFException();
        }
    }

    public void readFully(byte[] bArr) throws EOFException {
        int i = 0;
        while (i < bArr.length) {
            int read = read(bArr, i, bArr.length - i);
            if (read != -1) {
                i += read;
            } else {
                throw new EOFException();
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0097, code lost:
        if (r8 != r9) goto L_0x00a3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0099, code lost:
        r14.head = r6.pop();
        okio.SegmentPool.recycle(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00a3, code lost:
        r6.pos = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00a5, code lost:
        if (r1 != false) goto L_0x00ab;
     */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x007c A[SYNTHETIC] */
    public long readHexadecimalUnsignedLong() {
        int i;
        if (this.size != 0) {
            int i2 = 0;
            boolean z = false;
            long j = 0;
            do {
                Segment segment = this.head;
                byte[] bArr = segment.data;
                int i3 = segment.pos;
                int i4 = segment.limit;
                while (true) {
                    if (i3 >= i4) {
                        break;
                    }
                    byte b = bArr[i3];
                    if (b >= 48 && b <= 57) {
                        i = b - 48;
                    } else if (b >= 97 && b <= 102) {
                        i = (b - 97) + 10;
                    } else if (b >= 65 && b <= 70) {
                        i = (b - 65) + 10;
                    } else if (i2 == 0) {
                        z = true;
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Expected leading [0-9a-fA-F] character but was 0x");
                        sb.append(Integer.toHexString(b));
                        throw new NumberFormatException(sb.toString());
                    }
                    if ((-1152921504606846976L & j) == 0) {
                        j = (j << 4) | ((long) i);
                        i3++;
                        i2++;
                    } else {
                        Buffer writeByte = new Buffer().writeHexadecimalUnsignedLong(j).writeByte((int) b);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Number too large: ");
                        sb2.append(writeByte.readUtf8());
                        throw new NumberFormatException(sb2.toString());
                    }
                }
                if (i2 == 0) {
                }
            } while (this.head != null);
            this.size -= (long) i2;
            return j;
        }
        throw new IllegalStateException("size == 0");
    }

    public int readInt() {
        if (this.size >= 4) {
            Segment segment = this.head;
            int i = segment.pos;
            int i2 = segment.limit;
            if (i2 - i < 4) {
                return ((readByte() & 255) << 24) | ((readByte() & 255) << 16) | ((readByte() & 255) << 8) | (readByte() & 255);
            }
            byte[] bArr = segment.data;
            int i3 = i + 1;
            int i4 = i3 + 1;
            byte b = ((bArr[i] & 255) << 24) | ((bArr[i3] & 255) << 16);
            int i5 = i4 + 1;
            byte b2 = b | ((bArr[i4] & 255) << 8);
            int i6 = i5 + 1;
            byte b3 = b2 | (bArr[i5] & 255);
            this.size -= 4;
            if (i6 == i2) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            } else {
                segment.pos = i6;
            }
            return b3;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("size < 4: ");
        sb.append(this.size);
        throw new IllegalStateException(sb.toString());
    }

    public int readIntLe() {
        return Util.reverseBytesInt(readInt());
    }

    public long readLong() {
        if (this.size >= 8) {
            Segment segment = this.head;
            int i = segment.pos;
            int i2 = segment.limit;
            if (i2 - i < 8) {
                return ((((long) readInt()) & 4294967295L) << 32) | (4294967295L & ((long) readInt()));
            }
            byte[] bArr = segment.data;
            int i3 = i + 1;
            int i4 = i3 + 1;
            int i5 = i4 + 1;
            int i6 = i5 + 1;
            int i7 = i6 + 1;
            int i8 = i7 + 1;
            int i9 = i8 + 1;
            long j = ((((long) bArr[i]) & 255) << 56) | ((((long) bArr[i3]) & 255) << 48) | ((((long) bArr[i4]) & 255) << 40) | ((((long) bArr[i5]) & 255) << 32) | ((((long) bArr[i6]) & 255) << 24) | ((((long) bArr[i7]) & 255) << 16) | ((((long) bArr[i8]) & 255) << 8);
            int i10 = i9 + 1;
            long j2 = (((long) bArr[i9]) & 255) | j;
            this.size -= 8;
            if (i10 == i2) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            } else {
                segment.pos = i10;
            }
            return j2;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("size < 8: ");
        sb.append(this.size);
        throw new IllegalStateException(sb.toString());
    }

    public long readLongLe() {
        return Util.reverseBytesLong(readLong());
    }

    public short readShort() {
        if (this.size >= 2) {
            Segment segment = this.head;
            int i = segment.pos;
            int i2 = segment.limit;
            if (i2 - i < 2) {
                return (short) (((readByte() & 255) << 8) | (readByte() & 255));
            }
            byte[] bArr = segment.data;
            int i3 = i + 1;
            int i4 = i3 + 1;
            byte b = ((bArr[i] & 255) << 8) | (bArr[i3] & 255);
            this.size -= 2;
            if (i4 == i2) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            } else {
                segment.pos = i4;
            }
            return (short) b;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("size < 2: ");
        sb.append(this.size);
        throw new IllegalStateException(sb.toString());
    }

    public short readShortLe() {
        return Util.reverseBytesShort(readShort());
    }

    public String readString(long j, Charset charset) throws EOFException {
        Util.checkOffsetAndCount(this.size, 0, j);
        if (charset == null) {
            throw new IllegalArgumentException("charset == null");
        } else if (j > 2147483647L) {
            StringBuilder sb = new StringBuilder();
            sb.append("byteCount > Integer.MAX_VALUE: ");
            sb.append(j);
            throw new IllegalArgumentException(sb.toString());
        } else if (j == 0) {
            return "";
        } else {
            Segment segment = this.head;
            if (((long) segment.pos) + j > ((long) segment.limit)) {
                return new String(readByteArray(j), charset);
            }
            String str = new String(segment.data, segment.pos, (int) j, charset);
            segment.pos = (int) (((long) segment.pos) + j);
            this.size -= j;
            if (segment.pos == segment.limit) {
                this.head = segment.pop();
                SegmentPool.recycle(segment);
            }
            return str;
        }
    }

    public String readString(Charset charset) {
        try {
            return readString(this.size, charset);
        } catch (EOFException e) {
            throw new AssertionError(e);
        }
    }

    public String readUtf8() {
        try {
            return readString(this.size, Util.UTF_8);
        } catch (EOFException e) {
            throw new AssertionError(e);
        }
    }

    public String readUtf8(long j) throws EOFException {
        return readString(j, Util.UTF_8);
    }

    public int readUtf8CodePoint() throws EOFException {
        byte b;
        int i;
        byte b2;
        if (this.size != 0) {
            byte b3 = getByte(0);
            int i2 = 1;
            if ((b3 & 128) == 0) {
                b2 = b3 & Byte.MAX_VALUE;
                b = 0;
                i = 1;
            } else if ((b3 & 224) == 192) {
                b2 = b3 & 31;
                i = 2;
                b = 128;
            } else if ((b3 & 240) == 224) {
                b2 = b3 & 15;
                i = 3;
                b = 2048;
            } else if ((b3 & 248) == 240) {
                b2 = b3 & 7;
                i = 4;
                b = 65536;
            } else {
                skip(1);
                return REPLACEMENT_CHARACTER;
            }
            long j = (long) i;
            if (this.size >= j) {
                while (i2 < i) {
                    long j2 = (long) i2;
                    byte b4 = getByte(j2);
                    if ((b4 & 192) == 128) {
                        b2 = (b2 << 6) | (b4 & 63);
                        i2++;
                    } else {
                        skip(j2);
                        return REPLACEMENT_CHARACTER;
                    }
                }
                skip(j);
                return b2 > 1114111 ? REPLACEMENT_CHARACTER : ((b2 < 55296 || b2 > 57343) && b2 >= b) ? b2 : REPLACEMENT_CHARACTER;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("size < ");
            sb.append(i);
            sb.append(": ");
            sb.append(this.size);
            sb.append(" (to read code point prefixed 0x");
            sb.append(Integer.toHexString(b3));
            sb.append(")");
            throw new EOFException(sb.toString());
        }
        throw new EOFException();
    }

    @Nullable
    public String readUtf8Line() throws EOFException {
        long indexOf = indexOf(10);
        if (indexOf != -1) {
            return readUtf8Line(indexOf);
        }
        return this.size != 0 ? readUtf8(this.size) : null;
    }

    /* access modifiers changed from: 0000 */
    public String readUtf8Line(long j) throws EOFException {
        if (j > 0) {
            long j2 = j - 1;
            if (getByte(j2) == 13) {
                String readUtf8 = readUtf8(j2);
                skip(2);
                return readUtf8;
            }
        }
        String readUtf82 = readUtf8(j);
        skip(1);
        return readUtf82;
    }

    public String readUtf8LineStrict() throws EOFException {
        return readUtf8LineStrict(Long.MAX_VALUE);
    }

    public String readUtf8LineStrict(long j) throws EOFException {
        if (j >= 0) {
            long j2 = Long.MAX_VALUE;
            if (j != Long.MAX_VALUE) {
                j2 = j + 1;
            }
            long indexOf = indexOf(10, 0, j2);
            if (indexOf != -1) {
                return readUtf8Line(indexOf);
            }
            if (j2 < size() && getByte(j2 - 1) == 13 && getByte(j2) == 10) {
                return readUtf8Line(j2);
            }
            Buffer buffer = new Buffer();
            copyTo(buffer, 0, Math.min(32, size()));
            StringBuilder sb = new StringBuilder();
            sb.append("\\n not found: limit=");
            sb.append(Math.min(size(), j));
            sb.append(" content=");
            sb.append(buffer.readByteString().hex());
            sb.append(UIUtils.ELLIPSIS_CHAR);
            throw new EOFException(sb.toString());
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("limit < 0: ");
        sb2.append(j);
        throw new IllegalArgumentException(sb2.toString());
    }

    public boolean request(long j) {
        return this.size >= j;
    }

    public void require(long j) throws EOFException {
        if (this.size < j) {
            throw new EOFException();
        }
    }

    /* access modifiers changed from: 0000 */
    public List<Integer> segmentSizes() {
        if (this.head == null) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(Integer.valueOf(this.head.limit - this.head.pos));
        Segment segment = this.head;
        while (true) {
            segment = segment.next;
            if (segment == this.head) {
                return arrayList;
            }
            arrayList.add(Integer.valueOf(segment.limit - segment.pos));
        }
    }

    public int select(Options options) {
        Segment segment = this.head;
        if (segment == null) {
            return options.indexOf(ByteString.EMPTY);
        }
        ByteString[] byteStringArr = options.byteStrings;
        int length = byteStringArr.length;
        for (int i = 0; i < length; i++) {
            ByteString byteString = byteStringArr[i];
            if (this.size >= ((long) byteString.size())) {
                if (rangeEquals(segment, segment.pos, byteString, 0, byteString.size())) {
                    try {
                        skip((long) byteString.size());
                        return i;
                    } catch (EOFException e) {
                        throw new AssertionError(e);
                    }
                }
            }
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public int selectPrefix(Options options) {
        Segment segment = this.head;
        ByteString[] byteStringArr = options.byteStrings;
        int length = byteStringArr.length;
        int i = 0;
        while (i < length) {
            ByteString byteString = byteStringArr[i];
            int min = (int) Math.min(this.size, (long) byteString.size());
            if (min != 0) {
                if (!rangeEquals(segment, segment.pos, byteString, 0, min)) {
                    i++;
                }
            }
            return i;
        }
        return -1;
    }

    public ByteString sha1() {
        return digest("SHA-1");
    }

    public ByteString sha256() {
        return digest("SHA-256");
    }

    public ByteString sha512() {
        return digest("SHA-512");
    }

    public long size() {
        return this.size;
    }

    public void skip(long j) throws EOFException {
        while (j > 0) {
            if (this.head != null) {
                int min = (int) Math.min(j, (long) (this.head.limit - this.head.pos));
                long j2 = (long) min;
                this.size -= j2;
                j -= j2;
                this.head.pos += min;
                if (this.head.pos == this.head.limit) {
                    Segment segment = this.head;
                    this.head = segment.pop();
                    SegmentPool.recycle(segment);
                }
            } else {
                throw new EOFException();
            }
        }
    }

    public ByteString snapshot() {
        if (this.size <= 2147483647L) {
            return snapshot((int) this.size);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("size > Integer.MAX_VALUE: ");
        sb.append(this.size);
        throw new IllegalArgumentException(sb.toString());
    }

    public ByteString snapshot(int i) {
        return i == 0 ? ByteString.EMPTY : new SegmentedByteString(this, i);
    }

    public Timeout timeout() {
        return Timeout.NONE;
    }

    public String toString() {
        return snapshot().toString();
    }

    /* access modifiers changed from: 0000 */
    public Segment writableSegment(int i) {
        if (i < 1 || i > 8192) {
            throw new IllegalArgumentException();
        } else if (this.head == null) {
            this.head = SegmentPool.take();
            Segment segment = this.head;
            Segment segment2 = this.head;
            Segment segment3 = this.head;
            segment2.prev = segment3;
            segment.next = segment3;
            return segment3;
        } else {
            Segment segment4 = this.head.prev;
            if (segment4.limit + i > 8192 || !segment4.owner) {
                segment4 = segment4.push(SegmentPool.take());
            }
            return segment4;
        }
    }

    public Buffer write(ByteString byteString) {
        if (byteString != null) {
            byteString.write(this);
            return this;
        }
        throw new IllegalArgumentException("byteString == null");
    }

    public Buffer write(byte[] bArr) {
        if (bArr != null) {
            return write(bArr, 0, bArr.length);
        }
        throw new IllegalArgumentException("source == null");
    }

    public Buffer write(byte[] bArr, int i, int i2) {
        if (bArr != null) {
            long j = (long) i2;
            Util.checkOffsetAndCount((long) bArr.length, (long) i, j);
            int i3 = i2 + i;
            while (i < i3) {
                Segment writableSegment = writableSegment(1);
                int min = Math.min(i3 - i, 8192 - writableSegment.limit);
                System.arraycopy(bArr, i, writableSegment.data, writableSegment.limit, min);
                i += min;
                writableSegment.limit += min;
            }
            this.size += j;
            return this;
        }
        throw new IllegalArgumentException("source == null");
    }

    public BufferedSink write(Source source, long j) throws IOException {
        while (j > 0) {
            long read = source.read(this, j);
            if (read != -1) {
                j -= read;
            } else {
                throw new EOFException();
            }
        }
        return this;
    }

    public void write(Buffer buffer, long j) {
        if (buffer == null) {
            throw new IllegalArgumentException("source == null");
        } else if (buffer != this) {
            Util.checkOffsetAndCount(buffer.size, 0, j);
            while (j > 0) {
                if (j < ((long) (buffer.head.limit - buffer.head.pos))) {
                    Segment segment = this.head != null ? this.head.prev : null;
                    if (segment != null && segment.owner) {
                        if ((((long) segment.limit) + j) - ((long) (segment.shared ? 0 : segment.pos)) <= PlaybackStateCompat.ACTION_PLAY_FROM_URI) {
                            buffer.head.writeTo(segment, (int) j);
                            buffer.size -= j;
                            this.size += j;
                            return;
                        }
                    }
                    buffer.head = buffer.head.split((int) j);
                }
                Segment segment2 = buffer.head;
                long j2 = (long) (segment2.limit - segment2.pos);
                buffer.head = segment2.pop();
                if (this.head == null) {
                    this.head = segment2;
                    Segment segment3 = this.head;
                    Segment segment4 = this.head;
                    Segment segment5 = this.head;
                    segment4.prev = segment5;
                    segment3.next = segment5;
                } else {
                    this.head.prev.push(segment2).compact();
                }
                buffer.size -= j2;
                this.size += j2;
                j -= j2;
            }
        } else {
            throw new IllegalArgumentException("source == this");
        }
    }

    public long writeAll(Source source) throws IOException {
        if (source != null) {
            long j = 0;
            while (true) {
                long read = source.read(this, PlaybackStateCompat.ACTION_PLAY_FROM_URI);
                if (read == -1) {
                    return j;
                }
                j += read;
            }
        } else {
            throw new IllegalArgumentException("source == null");
        }
    }

    public Buffer writeByte(int i) {
        Segment writableSegment = writableSegment(1);
        byte[] bArr = writableSegment.data;
        int i2 = writableSegment.limit;
        writableSegment.limit = i2 + 1;
        bArr[i2] = (byte) i;
        this.size++;
        return this;
    }

    public Buffer writeDecimalLong(long j) {
        int i = (j > 0 ? 1 : (j == 0 ? 0 : -1));
        if (i == 0) {
            return writeByte(48);
        }
        boolean z = false;
        int i2 = 1;
        if (i < 0) {
            j = -j;
            if (j < 0) {
                return writeUtf8("-9223372036854775808");
            }
            z = true;
        }
        if (j >= 100000000) {
            i2 = j < 1000000000000L ? j < 10000000000L ? j < 1000000000 ? 9 : 10 : j < 100000000000L ? 11 : 12 : j < 1000000000000000L ? j < 10000000000000L ? 13 : j < 100000000000000L ? 14 : 15 : j < 100000000000000000L ? j < 10000000000000000L ? 16 : 17 : j < 1000000000000000000L ? 18 : 19;
        } else if (j >= FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME) {
            i2 = j < 1000000 ? j < 100000 ? 5 : 6 : j < 10000000 ? 7 : 8;
        } else if (j >= 100) {
            i2 = j < 1000 ? 3 : 4;
        } else if (j >= 10) {
            i2 = 2;
        }
        if (z) {
            i2++;
        }
        Segment writableSegment = writableSegment(i2);
        byte[] bArr = writableSegment.data;
        int i3 = writableSegment.limit + i2;
        while (j != 0) {
            i3--;
            bArr[i3] = DIGITS[(int) (j % 10)];
            j /= 10;
        }
        if (z) {
            bArr[i3 - 1] = 45;
        }
        writableSegment.limit += i2;
        this.size += (long) i2;
        return this;
    }

    public Buffer writeHexadecimalUnsignedLong(long j) {
        if (j == 0) {
            return writeByte(48);
        }
        int numberOfTrailingZeros = (Long.numberOfTrailingZeros(Long.highestOneBit(j)) / 4) + 1;
        Segment writableSegment = writableSegment(numberOfTrailingZeros);
        byte[] bArr = writableSegment.data;
        int i = writableSegment.limit;
        for (int i2 = (writableSegment.limit + numberOfTrailingZeros) - 1; i2 >= i; i2--) {
            bArr[i2] = DIGITS[(int) (15 & j)];
            j >>>= 4;
        }
        writableSegment.limit += numberOfTrailingZeros;
        this.size += (long) numberOfTrailingZeros;
        return this;
    }

    public Buffer writeInt(int i) {
        Segment writableSegment = writableSegment(4);
        byte[] bArr = writableSegment.data;
        int i2 = writableSegment.limit;
        int i3 = i2 + 1;
        bArr[i2] = (byte) ((i >>> 24) & 255);
        int i4 = i3 + 1;
        bArr[i3] = (byte) ((i >>> 16) & 255);
        int i5 = i4 + 1;
        bArr[i4] = (byte) ((i >>> 8) & 255);
        int i6 = i5 + 1;
        bArr[i5] = (byte) (i & 255);
        writableSegment.limit = i6;
        this.size += 4;
        return this;
    }

    public Buffer writeIntLe(int i) {
        return writeInt(Util.reverseBytesInt(i));
    }

    public Buffer writeLong(long j) {
        Segment writableSegment = writableSegment(8);
        byte[] bArr = writableSegment.data;
        int i = writableSegment.limit;
        int i2 = i + 1;
        bArr[i] = (byte) ((int) ((j >>> 56) & 255));
        int i3 = i2 + 1;
        bArr[i2] = (byte) ((int) ((j >>> 48) & 255));
        int i4 = i3 + 1;
        bArr[i3] = (byte) ((int) ((j >>> 40) & 255));
        int i5 = i4 + 1;
        bArr[i4] = (byte) ((int) ((j >>> 32) & 255));
        int i6 = i5 + 1;
        bArr[i5] = (byte) ((int) ((j >>> 24) & 255));
        int i7 = i6 + 1;
        bArr[i6] = (byte) ((int) ((j >>> 16) & 255));
        int i8 = i7 + 1;
        bArr[i7] = (byte) ((int) ((j >>> 8) & 255));
        int i9 = i8 + 1;
        bArr[i8] = (byte) ((int) (j & 255));
        writableSegment.limit = i9;
        this.size += 8;
        return this;
    }

    public Buffer writeLongLe(long j) {
        return writeLong(Util.reverseBytesLong(j));
    }

    public Buffer writeShort(int i) {
        Segment writableSegment = writableSegment(2);
        byte[] bArr = writableSegment.data;
        int i2 = writableSegment.limit;
        int i3 = i2 + 1;
        bArr[i2] = (byte) ((i >>> 8) & 255);
        int i4 = i3 + 1;
        bArr[i3] = (byte) (i & 255);
        writableSegment.limit = i4;
        this.size += 2;
        return this;
    }

    public Buffer writeShortLe(int i) {
        return writeShort((int) Util.reverseBytesShort((short) i));
    }

    public Buffer writeString(String str, int i, int i2, Charset charset) {
        if (str == null) {
            throw new IllegalArgumentException("string == null");
        } else if (i < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("beginIndex < 0: ");
            sb.append(i);
            throw new IllegalAccessError(sb.toString());
        } else if (i2 < i) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("endIndex < beginIndex: ");
            sb2.append(i2);
            sb2.append(" < ");
            sb2.append(i);
            throw new IllegalArgumentException(sb2.toString());
        } else if (i2 > str.length()) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("endIndex > string.length: ");
            sb3.append(i2);
            sb3.append(" > ");
            sb3.append(str.length());
            throw new IllegalArgumentException(sb3.toString());
        } else if (charset == null) {
            throw new IllegalArgumentException("charset == null");
        } else if (charset.equals(Util.UTF_8)) {
            return writeUtf8(str, i, i2);
        } else {
            byte[] bytes = str.substring(i, i2).getBytes(charset);
            return write(bytes, 0, bytes.length);
        }
    }

    public Buffer writeString(String str, Charset charset) {
        return writeString(str, 0, str.length(), charset);
    }

    public Buffer writeTo(OutputStream outputStream) throws IOException {
        return writeTo(outputStream, this.size);
    }

    public Buffer writeTo(OutputStream outputStream, long j) throws IOException {
        if (outputStream != null) {
            Util.checkOffsetAndCount(this.size, 0, j);
            Segment segment = this.head;
            while (j > 0) {
                int min = (int) Math.min(j, (long) (segment.limit - segment.pos));
                outputStream.write(segment.data, segment.pos, min);
                segment.pos += min;
                long j2 = (long) min;
                this.size -= j2;
                j -= j2;
                if (segment.pos == segment.limit) {
                    Segment pop = segment.pop();
                    this.head = pop;
                    SegmentPool.recycle(segment);
                    segment = pop;
                }
            }
            return this;
        }
        throw new IllegalArgumentException("out == null");
    }

    public Buffer writeUtf8(String str) {
        return writeUtf8(str, 0, str.length());
    }

    public Buffer writeUtf8(String str, int i, int i2) {
        if (str == null) {
            throw new IllegalArgumentException("string == null");
        } else if (i < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("beginIndex < 0: ");
            sb.append(i);
            throw new IllegalArgumentException(sb.toString());
        } else if (i2 < i) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("endIndex < beginIndex: ");
            sb2.append(i2);
            sb2.append(" < ");
            sb2.append(i);
            throw new IllegalArgumentException(sb2.toString());
        } else if (i2 <= str.length()) {
            while (i < i2) {
                char charAt = str.charAt(i);
                if (charAt < 128) {
                    Segment writableSegment = writableSegment(1);
                    byte[] bArr = writableSegment.data;
                    int i3 = writableSegment.limit - i;
                    int min = Math.min(i2, 8192 - i3);
                    int i4 = i + 1;
                    bArr[i + i3] = (byte) charAt;
                    while (i4 < min) {
                        char charAt2 = str.charAt(i4);
                        if (charAt2 >= 128) {
                            break;
                        }
                        int i5 = i4 + 1;
                        bArr[i4 + i3] = (byte) charAt2;
                        i4 = i5;
                    }
                    int i6 = (i3 + i4) - writableSegment.limit;
                    writableSegment.limit += i6;
                    this.size += (long) i6;
                    i = i4;
                } else if (charAt < 2048) {
                    writeByte((charAt >> 6) | 192);
                    writeByte((int) (charAt & '?') | 128);
                    i++;
                } else if (charAt < 55296 || charAt > 57343) {
                    writeByte((charAt >> 12) | 224);
                    writeByte(((charAt >> 6) & 63) | 128);
                    writeByte((int) (charAt & '?') | 128);
                    i++;
                } else {
                    int i7 = i + 1;
                    char charAt3 = i7 < i2 ? str.charAt(i7) : 0;
                    if (charAt > 56319 || charAt3 < 56320 || charAt3 > 57343) {
                        writeByte(63);
                        i = i7;
                    } else {
                        int i8 = 0 + (((charAt & 10239) << 10) | (9215 & charAt3));
                        writeByte((i8 >> 18) | 240);
                        writeByte(((i8 >> 12) & 63) | 128);
                        writeByte(((i8 >> 6) & 63) | 128);
                        writeByte((i8 & 63) | 128);
                        i += 2;
                    }
                }
            }
            return this;
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append("endIndex > string.length: ");
            sb3.append(i2);
            sb3.append(" > ");
            sb3.append(str.length());
            throw new IllegalArgumentException(sb3.toString());
        }
    }

    public Buffer writeUtf8CodePoint(int i) {
        if (i < 128) {
            writeByte(i);
        } else if (i < 2048) {
            writeByte((i >> 6) | 192);
            writeByte((i & 63) | 128);
        } else if (i < 65536) {
            if (i < 55296 || i > 57343) {
                writeByte((i >> 12) | 224);
                writeByte(((i >> 6) & 63) | 128);
                writeByte((i & 63) | 128);
            } else {
                writeByte(63);
            }
        } else if (i <= 1114111) {
            writeByte((i >> 18) | 240);
            writeByte(((i >> 12) & 63) | 128);
            writeByte(((i >> 6) & 63) | 128);
            writeByte((i & 63) | 128);
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Unexpected code point: ");
            sb.append(Integer.toHexString(i));
            throw new IllegalArgumentException(sb.toString());
        }
        return this;
    }
}

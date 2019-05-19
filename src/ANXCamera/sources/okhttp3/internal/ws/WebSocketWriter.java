package okhttp3.internal.ws;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.IOException;
import java.util.Random;
import okio.Buffer;
import okio.BufferedSink;
import okio.ByteString;
import okio.Sink;
import okio.Timeout;

final class WebSocketWriter {
    boolean activeWriter;
    final Buffer buffer = new Buffer();
    final FrameSink frameSink = new FrameSink();
    final boolean isClient;
    final byte[] maskBuffer;
    final byte[] maskKey;
    final Random random;
    final BufferedSink sink;
    boolean writerClosed;

    final class FrameSink implements Sink {
        boolean closed;
        long contentLength;
        int formatOpcode;
        boolean isFirstFrame;

        FrameSink() {
        }

        public void close() throws IOException {
            if (!this.closed) {
                WebSocketWriter.this.writeMessageFrame(this.formatOpcode, WebSocketWriter.this.buffer.size(), this.isFirstFrame, true);
                this.closed = true;
                WebSocketWriter.this.activeWriter = false;
                return;
            }
            throw new IOException("closed");
        }

        public void flush() throws IOException {
            if (!this.closed) {
                WebSocketWriter.this.writeMessageFrame(this.formatOpcode, WebSocketWriter.this.buffer.size(), this.isFirstFrame, false);
                this.isFirstFrame = false;
                return;
            }
            throw new IOException("closed");
        }

        public Timeout timeout() {
            return WebSocketWriter.this.sink.timeout();
        }

        public void write(Buffer buffer, long j) throws IOException {
            if (!this.closed) {
                WebSocketWriter.this.buffer.write(buffer, j);
                boolean z = this.isFirstFrame && this.contentLength != -1 && WebSocketWriter.this.buffer.size() > this.contentLength - PlaybackStateCompat.ACTION_PLAY_FROM_URI;
                long completeSegmentByteCount = WebSocketWriter.this.buffer.completeSegmentByteCount();
                if (completeSegmentByteCount > 0 && !z) {
                    WebSocketWriter.this.writeMessageFrame(this.formatOpcode, completeSegmentByteCount, this.isFirstFrame, false);
                    this.isFirstFrame = false;
                    return;
                }
                return;
            }
            throw new IOException("closed");
        }
    }

    WebSocketWriter(boolean z, BufferedSink bufferedSink, Random random2) {
        if (bufferedSink == null) {
            throw new NullPointerException("sink == null");
        } else if (random2 != null) {
            this.isClient = z;
            this.sink = bufferedSink;
            this.random = random2;
            byte[] bArr = null;
            this.maskKey = z ? new byte[4] : null;
            if (z) {
                bArr = new byte[8192];
            }
            this.maskBuffer = bArr;
        } else {
            throw new NullPointerException("random == null");
        }
    }

    private void writeControlFrame(int i, ByteString byteString) throws IOException {
        if (!this.writerClosed) {
            int size = byteString.size();
            if (((long) size) <= 125) {
                this.sink.writeByte(i | 128);
                if (this.isClient) {
                    this.sink.writeByte(size | 128);
                    this.random.nextBytes(this.maskKey);
                    this.sink.write(this.maskKey);
                    byte[] byteArray = byteString.toByteArray();
                    WebSocketProtocol.toggleMask(byteArray, (long) byteArray.length, this.maskKey, 0);
                    this.sink.write(byteArray);
                } else {
                    this.sink.writeByte(size);
                    this.sink.write(byteString);
                }
                this.sink.flush();
                return;
            }
            throw new IllegalArgumentException("Payload size must be less than or equal to 125");
        }
        throw new IOException("closed");
    }

    /* access modifiers changed from: 0000 */
    public Sink newMessageSink(int i, long j) {
        if (!this.activeWriter) {
            this.activeWriter = true;
            this.frameSink.formatOpcode = i;
            this.frameSink.contentLength = j;
            this.frameSink.isFirstFrame = true;
            this.frameSink.closed = false;
            return this.frameSink;
        }
        throw new IllegalStateException("Another message writer is active. Did you call close()?");
    }

    /* access modifiers changed from: 0000 */
    public void writeClose(int i, ByteString byteString) throws IOException {
        ByteString byteString2 = ByteString.EMPTY;
        if (!(i == 0 && byteString == null)) {
            if (i != 0) {
                WebSocketProtocol.validateCloseCode(i);
            }
            Buffer buffer2 = new Buffer();
            buffer2.writeShort(i);
            if (byteString != null) {
                buffer2.write(byteString);
            }
            byteString2 = buffer2.readByteString();
        }
        try {
            writeControlFrame(8, byteString2);
        } finally {
            this.writerClosed = true;
        }
    }

    /* access modifiers changed from: 0000 */
    public void writeMessageFrame(int i, long j, boolean z, boolean z2) throws IOException {
        if (!this.writerClosed) {
            if (!z) {
                i = 0;
            }
            if (z2) {
                i |= 128;
            }
            this.sink.writeByte(i);
            int i2 = this.isClient ? 128 : 0;
            if (j <= 125) {
                this.sink.writeByte(i2 | ((int) j));
            } else if (j <= 65535) {
                this.sink.writeByte(i2 | 126);
                this.sink.writeShort((int) j);
            } else {
                this.sink.writeByte(i2 | 127);
                this.sink.writeLong(j);
            }
            if (this.isClient) {
                this.random.nextBytes(this.maskKey);
                this.sink.write(this.maskKey);
                long j2 = 0;
                while (j2 < j) {
                    int read = this.buffer.read(this.maskBuffer, 0, (int) Math.min(j, (long) this.maskBuffer.length));
                    if (read != -1) {
                        long j3 = (long) read;
                        WebSocketProtocol.toggleMask(this.maskBuffer, j3, this.maskKey, j2);
                        this.sink.write(this.maskBuffer, 0, read);
                        j2 += j3;
                    } else {
                        throw new AssertionError();
                    }
                }
            } else {
                this.sink.write(this.buffer, j);
            }
            this.sink.emit();
            return;
        }
        throw new IOException("closed");
    }

    /* access modifiers changed from: 0000 */
    public void writePing(ByteString byteString) throws IOException {
        writeControlFrame(9, byteString);
    }

    /* access modifiers changed from: 0000 */
    public void writePong(ByteString byteString) throws IOException {
        writeControlFrame(10, byteString);
    }
}

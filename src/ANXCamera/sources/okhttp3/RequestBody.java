package okhttp3;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import javax.annotation.Nullable;
import okhttp3.internal.Util;
import okio.BufferedSink;
import okio.ByteString;
import okio.Okio;
import okio.Source;

public abstract class RequestBody {
    public static RequestBody create(@Nullable final MediaType mediaType, final File file) {
        if (file != null) {
            return new RequestBody() {
                public long contentLength() {
                    return file.length();
                }

                @Nullable
                public MediaType contentType() {
                    return MediaType.this;
                }

                public void writeTo(BufferedSink bufferedSink) throws IOException {
                    Source source = null;
                    try {
                        Source source2 = Okio.source(file);
                        try {
                            bufferedSink.writeAll(source2);
                            Util.closeQuietly((Closeable) source2);
                        } catch (Throwable th) {
                            th = th;
                            source = source2;
                            Util.closeQuietly((Closeable) source);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        Util.closeQuietly((Closeable) source);
                        throw th;
                    }
                }
            };
        }
        throw new NullPointerException("content == null");
    }

    public static RequestBody create(@Nullable MediaType mediaType, String str) {
        Charset charset = Util.UTF_8;
        if (mediaType != null) {
            charset = mediaType.charset();
            if (charset == null) {
                charset = Util.UTF_8;
                StringBuilder sb = new StringBuilder();
                sb.append(mediaType);
                sb.append("; charset=utf-8");
                mediaType = MediaType.parse(sb.toString());
            }
        }
        return create(mediaType, str.getBytes(charset));
    }

    public static RequestBody create(@Nullable final MediaType mediaType, final ByteString byteString) {
        return new RequestBody() {
            public long contentLength() throws IOException {
                return (long) byteString.size();
            }

            @Nullable
            public MediaType contentType() {
                return MediaType.this;
            }

            public void writeTo(BufferedSink bufferedSink) throws IOException {
                bufferedSink.write(byteString);
            }
        };
    }

    public static RequestBody create(@Nullable MediaType mediaType, byte[] bArr) {
        return create(mediaType, bArr, 0, bArr.length);
    }

    public static RequestBody create(@Nullable final MediaType mediaType, final byte[] bArr, final int i, final int i2) {
        if (bArr != null) {
            Util.checkOffsetAndCount((long) bArr.length, (long) i, (long) i2);
            return new RequestBody() {
                public long contentLength() {
                    return (long) i2;
                }

                @Nullable
                public MediaType contentType() {
                    return MediaType.this;
                }

                public void writeTo(BufferedSink bufferedSink) throws IOException {
                    bufferedSink.write(bArr, i, i2);
                }
            };
        }
        throw new NullPointerException("content == null");
    }

    public long contentLength() throws IOException {
        return -1;
    }

    @Nullable
    public abstract MediaType contentType();

    public abstract void writeTo(BufferedSink bufferedSink) throws IOException;
}

package com.adobe.xmp.impl;

import com.sensetime.stmobile.STMobileHumanActionNative;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.jcodec.platform.Platform;

public class ByteBuffer {
    private byte[] buffer;
    private String encoding;
    private int length;

    public ByteBuffer(int i) {
        this.encoding = null;
        this.buffer = new byte[i];
        this.length = 0;
    }

    public ByteBuffer(InputStream inputStream) throws IOException {
        this.encoding = null;
        this.length = 0;
        this.buffer = new byte[STMobileHumanActionNative.ST_MOBILE_HAND_LOVE];
        while (true) {
            int read = inputStream.read(this.buffer, this.length, STMobileHumanActionNative.ST_MOBILE_HAND_LOVE);
            if (read > 0) {
                this.length += read;
                if (read == 16384) {
                    ensureCapacity(this.length + STMobileHumanActionNative.ST_MOBILE_HAND_LOVE);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public ByteBuffer(byte[] bArr) {
        this.encoding = null;
        this.buffer = bArr;
        this.length = bArr.length;
    }

    public ByteBuffer(byte[] bArr, int i) {
        this.encoding = null;
        if (i <= bArr.length) {
            this.buffer = bArr;
            this.length = i;
            return;
        }
        throw new ArrayIndexOutOfBoundsException("Valid length exceeds the buffer length.");
    }

    public ByteBuffer(byte[] bArr, int i, int i2) {
        this.encoding = null;
        if (i2 <= bArr.length - i) {
            this.buffer = new byte[i2];
            System.arraycopy(bArr, i, this.buffer, 0, i2);
            this.length = i2;
            return;
        }
        throw new ArrayIndexOutOfBoundsException("Valid length exceeds the buffer length.");
    }

    private void ensureCapacity(int i) {
        if (i > this.buffer.length) {
            byte[] bArr = this.buffer;
            this.buffer = new byte[(bArr.length * 2)];
            System.arraycopy(bArr, 0, this.buffer, 0, bArr.length);
        }
    }

    public void append(byte b) {
        ensureCapacity(this.length + 1);
        byte[] bArr = this.buffer;
        int i = this.length;
        this.length = i + 1;
        bArr[i] = b;
    }

    public void append(ByteBuffer byteBuffer) {
        append(byteBuffer.buffer, 0, byteBuffer.length);
    }

    public void append(byte[] bArr) {
        append(bArr, 0, bArr.length);
    }

    public void append(byte[] bArr, int i, int i2) {
        ensureCapacity(this.length + i2);
        System.arraycopy(bArr, i, this.buffer, this.length, i2);
        this.length += i2;
    }

    public byte byteAt(int i) {
        if (i < this.length) {
            return this.buffer[i];
        }
        throw new IndexOutOfBoundsException("The index exceeds the valid buffer area");
    }

    public int charAt(int i) {
        if (i < this.length) {
            return this.buffer[i] & -1;
        }
        throw new IndexOutOfBoundsException("The index exceeds the valid buffer area");
    }

    public InputStream getByteStream() {
        return new ByteArrayInputStream(this.buffer, 0, this.length);
    }

    public String getEncoding() {
        if (this.encoding == null) {
            if (this.length < 2) {
                this.encoding = "UTF-8";
            } else if (this.buffer[0] == 0) {
                if (this.length < 4 || this.buffer[1] != 0) {
                    this.encoding = Platform.UTF_16BE;
                } else if ((this.buffer[2] & -1) == -2 && (this.buffer[3] & -1) == -1) {
                    this.encoding = "UTF-32BE";
                } else {
                    this.encoding = "UTF-32";
                }
            } else if ((this.buffer[0] & -1) < Byte.MIN_VALUE) {
                if (this.buffer[1] != 0) {
                    this.encoding = "UTF-8";
                } else if (this.length < 4 || this.buffer[2] != 0) {
                    this.encoding = "UTF-16LE";
                } else {
                    this.encoding = "UTF-32LE";
                }
            } else if ((this.buffer[0] & -1) == -17) {
                this.encoding = "UTF-8";
            } else if ((this.buffer[0] & -1) == -2) {
                this.encoding = "UTF-16";
            } else if (this.length < 4 || this.buffer[2] != 0) {
                this.encoding = "UTF-16";
            } else {
                this.encoding = "UTF-32";
            }
        }
        return this.encoding;
    }

    public int length() {
        return this.length;
    }
}

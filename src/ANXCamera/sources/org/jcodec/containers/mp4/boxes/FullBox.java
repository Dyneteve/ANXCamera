package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public abstract class FullBox extends Box {
    protected int flags;
    protected byte version;

    public FullBox(Header header) {
        super(header);
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt((this.version << 24) | (this.flags & 16777215));
    }

    public int getFlags() {
        return this.flags;
    }

    public byte getVersion() {
        return this.version;
    }

    public void parse(ByteBuffer byteBuffer) {
        int i = byteBuffer.getInt();
        this.version = (byte) ((i >> 24) & 255);
        this.flags = i & 16777215;
    }

    public void setFlags(int i) {
        this.flags = i;
    }

    public void setVersion(byte b) {
        this.version = b;
    }
}

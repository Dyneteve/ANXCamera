package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class ClipRegionBox extends Box {
    private short height;
    private short rgnSize;
    private short width;
    private short x;
    private short y;

    public ClipRegionBox(Header header) {
        super(header);
    }

    public static ClipRegionBox createClipRegionBox(short s, short s2, short s3, short s4) {
        ClipRegionBox clipRegionBox = new ClipRegionBox(new Header(fourcc()));
        clipRegionBox.rgnSize = 10;
        clipRegionBox.x = s;
        clipRegionBox.y = s2;
        clipRegionBox.width = s3;
        clipRegionBox.height = s4;
        return clipRegionBox;
    }

    public static String fourcc() {
        return "crgn";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putShort(this.rgnSize);
        byteBuffer.putShort(this.y);
        byteBuffer.putShort(this.x);
        byteBuffer.putShort(this.height);
        byteBuffer.putShort(this.width);
    }

    public int estimateSize() {
        return 18;
    }

    public short getHeight() {
        return this.height;
    }

    public short getRgnSize() {
        return this.rgnSize;
    }

    public short getWidth() {
        return this.width;
    }

    public short getX() {
        return this.x;
    }

    public short getY() {
        return this.y;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.rgnSize = byteBuffer.getShort();
        this.y = byteBuffer.getShort();
        this.x = byteBuffer.getShort();
        this.height = byteBuffer.getShort();
        this.width = byteBuffer.getShort();
    }
}

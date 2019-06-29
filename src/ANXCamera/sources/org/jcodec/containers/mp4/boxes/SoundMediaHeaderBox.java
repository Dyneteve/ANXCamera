package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class SoundMediaHeaderBox extends FullBox {
    private short balance;

    public SoundMediaHeaderBox(Header header) {
        super(header);
    }

    public static SoundMediaHeaderBox createSoundMediaHeaderBox() {
        return new SoundMediaHeaderBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "smhd";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putShort(this.balance);
        byteBuffer.putShort(0);
    }

    public int estimateSize() {
        return 16;
    }

    public short getBalance() {
        return this.balance;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.balance = byteBuffer.getShort();
        byteBuffer.getShort();
    }
}

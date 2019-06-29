package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class UdtaMetaBox extends MetaBox {
    public UdtaMetaBox(Header header) {
        super(header);
    }

    public static UdtaMetaBox createUdtaMetaBox() {
        return new UdtaMetaBox(Header.createHeader(fourcc(), 0));
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(0);
        super.doWrite(byteBuffer);
    }

    public void parse(ByteBuffer byteBuffer) {
        byteBuffer.getInt();
        super.parse(byteBuffer);
    }
}

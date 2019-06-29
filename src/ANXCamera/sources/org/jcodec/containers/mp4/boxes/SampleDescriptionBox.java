package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class SampleDescriptionBox extends NodeBox {
    public SampleDescriptionBox(Header header) {
        super(header);
    }

    public static SampleDescriptionBox createSampleDescriptionBox(SampleEntry[] sampleEntryArr) {
        SampleDescriptionBox sampleDescriptionBox = new SampleDescriptionBox(new Header(fourcc()));
        for (SampleEntry add : sampleEntryArr) {
            sampleDescriptionBox.boxes.add(add);
        }
        return sampleDescriptionBox;
    }

    public static String fourcc() {
        return "stsd";
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(0);
        byteBuffer.putInt(Math.max(1, this.boxes.size()));
        super.doWrite(byteBuffer);
    }

    public int estimateSize() {
        return 8 + super.estimateSize();
    }

    public void parse(ByteBuffer byteBuffer) {
        byteBuffer.getInt();
        byteBuffer.getInt();
        super.parse(byteBuffer);
    }
}

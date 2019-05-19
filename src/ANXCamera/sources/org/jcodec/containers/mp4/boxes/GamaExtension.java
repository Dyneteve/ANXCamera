package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class GamaExtension extends Box {
    private float gamma;

    public GamaExtension(Header header) {
        super(header);
    }

    public static GamaExtension createGamaExtension(float f) {
        GamaExtension gamaExtension = new GamaExtension(new Header(fourcc()));
        gamaExtension.gamma = f;
        return gamaExtension;
    }

    public static String fourcc() {
        return "gama";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt((int) (this.gamma * 65536.0f));
    }

    public int estimateSize() {
        return 12;
    }

    public float getGamma() {
        return this.gamma;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.gamma = ((float) byteBuffer.getInt()) / 65536.0f;
    }
}

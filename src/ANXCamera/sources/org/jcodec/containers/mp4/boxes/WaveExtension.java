package org.jcodec.containers.mp4.boxes;

public class WaveExtension extends NodeBox {
    public WaveExtension(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "wave";
    }
}

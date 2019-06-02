package org.jcodec.containers.mp4.boxes;

public class MediaInfoBox extends NodeBox {
    public MediaInfoBox(Header header) {
        super(header);
    }

    public static MediaInfoBox createMediaInfoBox() {
        return new MediaInfoBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "minf";
    }

    public DataInfoBox getDinf() {
        return (DataInfoBox) findFirst(this, DataInfoBox.class, "dinf");
    }

    public NodeBox getStbl() {
        return (NodeBox) findFirst(this, NodeBox.class, "stbl");
    }
}

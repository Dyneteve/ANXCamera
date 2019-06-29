package org.jcodec.containers.mp4.boxes;

public class DataInfoBox extends NodeBox {
    public DataInfoBox(Header header) {
        super(header);
    }

    public static DataInfoBox createDataInfoBox() {
        return new DataInfoBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "dinf";
    }

    public DataRefBox getDref() {
        return (DataRefBox) findFirst(this, DataRefBox.class, "dref");
    }
}

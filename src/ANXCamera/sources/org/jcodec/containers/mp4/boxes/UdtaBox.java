package org.jcodec.containers.mp4.boxes;

import org.jcodec.containers.mp4.IBoxFactory;

public class UdtaBox extends NodeBox {
    private static final String FOURCC = "udta";

    public UdtaBox(Header header) {
        super(header);
    }

    public static UdtaBox createUdtaBox() {
        return new UdtaBox(Header.createHeader(fourcc(), 0));
    }

    public static String fourcc() {
        return FOURCC;
    }

    public MetaBox meta() {
        return (MetaBox) findFirst(this, MetaBox.class, MetaBox.fourcc());
    }

    public void setFactory(final IBoxFactory iBoxFactory) {
        this.factory = new IBoxFactory() {
            public Box newBox(Header header) {
                if (!header.getFourcc().equals(UdtaMetaBox.fourcc())) {
                    return iBoxFactory.newBox(header);
                }
                UdtaMetaBox udtaMetaBox = new UdtaMetaBox(header);
                udtaMetaBox.setFactory(iBoxFactory);
                return udtaMetaBox;
            }
        };
    }
}

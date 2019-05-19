package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.platform.Platform;

public class MdtaBox extends Box {
    private static final String FOURCC = "mdta";
    private String key;

    public MdtaBox(Header header) {
        super(header);
    }

    public static MdtaBox createMdtaBox(String str) {
        MdtaBox mdtaBox = new MdtaBox(Header.createHeader(FOURCC, 0));
        mdtaBox.key = str;
        return mdtaBox;
    }

    public static String fourcc() {
        return FOURCC;
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put(this.key.getBytes());
    }

    public int estimateSize() {
        return this.key.getBytes().length;
    }

    public String getKey() {
        return this.key;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.key = Platform.stringFromBytes(NIOUtils.toArray(NIOUtils.readBuf(byteBuffer)));
    }
}

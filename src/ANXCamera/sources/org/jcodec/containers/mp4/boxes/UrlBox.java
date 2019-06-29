package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.platform.Platform;

public class UrlBox extends FullBox {
    private String url;

    public UrlBox(Header header) {
        super(header);
    }

    public static UrlBox createUrlBox(String str) {
        UrlBox urlBox = new UrlBox(new Header(fourcc()));
        urlBox.url = str;
        return urlBox;
    }

    public static String fourcc() {
        return "url ";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        if (this.url != null) {
            NIOUtils.write(byteBuffer, ByteBuffer.wrap(Platform.getBytesForCharset(this.url, "UTF-8")));
            byteBuffer.put(0);
        }
    }

    public int estimateSize() {
        if (this.url != null) {
            return 13 + Platform.getBytesForCharset(this.url, "UTF-8").length;
        }
        return 13;
    }

    public String getUrl() {
        return this.url;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        if ((this.flags & 1) == 0) {
            this.url = NIOUtils.readNullTermStringCharset(byteBuffer, "UTF-8");
        }
    }
}

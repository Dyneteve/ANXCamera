package org.jcodec.containers.mp4;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Box.LeafBox;
import org.jcodec.containers.mp4.boxes.Header;
import org.jcodec.containers.mp4.boxes.NodeBox;
import org.jcodec.platform.Platform;

public class BoxUtil {
    public static <T extends Box> T as(Class<T> cls, LeafBox leafBox) {
        try {
            T t = (Box) Platform.newInstance(cls, new Object[]{leafBox.getHeader()});
            t.parse(leafBox.getData().duplicate());
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean containsBox(NodeBox nodeBox, String str) {
        return NodeBox.findFirstPath(nodeBox, Box.class, new String[]{str}) != null;
    }

    public static boolean containsBox2(NodeBox nodeBox, String str, String str2) {
        return NodeBox.findFirstPath(nodeBox, Box.class, new String[]{str, str2}) != null;
    }

    public static Box parseBox(ByteBuffer byteBuffer, Header header, IBoxFactory iBoxFactory) {
        Box newBox = iBoxFactory.newBox(header);
        if (header.getBodySize() >= 134217728) {
            return new LeafBox(Header.createHeader("free", 8));
        }
        newBox.parse(byteBuffer);
        return newBox;
    }

    public static Box parseChildBox(ByteBuffer byteBuffer, IBoxFactory iBoxFactory) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        while (byteBuffer.remaining() >= 4 && duplicate.getInt() == 0) {
            byteBuffer.getInt();
        }
        if (byteBuffer.remaining() < 4) {
            return null;
        }
        Header read = Header.read(byteBuffer);
        if (read == null || ((long) byteBuffer.remaining()) < read.getBodySize()) {
            return null;
        }
        return parseBox(NIOUtils.read(byteBuffer, (int) read.getBodySize()), read, iBoxFactory);
    }
}

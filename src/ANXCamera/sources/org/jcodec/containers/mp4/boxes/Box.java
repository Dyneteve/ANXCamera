package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.Preconditions;
import org.jcodec.common.StringUtils;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.IBoxFactory;
import org.jcodec.platform.Platform;

public abstract class Box {
    public static final int MAX_BOX_SIZE = 134217728;
    public Header header;

    public static class LeafBox extends Box {
        ByteBuffer data;

        public LeafBox(Header header) {
            super(header);
        }

        /* access modifiers changed from: protected */
        public void doWrite(ByteBuffer byteBuffer) {
            NIOUtils.write(byteBuffer, this.data);
        }

        public int estimateSize() {
            return this.data.remaining() + Header.estimateHeaderSize(this.data.remaining());
        }

        public ByteBuffer getData() {
            return this.data.duplicate();
        }

        public void parse(ByteBuffer byteBuffer) {
            this.data = NIOUtils.read(byteBuffer, (int) this.header.getBodySize());
        }
    }

    public Box(Header header2) {
        this.header = header2;
    }

    public static <T extends Box> T asBox(Class<T> cls, Box box) {
        try {
            T t = (Box) Platform.newInstance(cls, new Object[]{box.getHeader()});
            ByteBuffer allocate = ByteBuffer.allocate((int) box.getHeader().getBodySize());
            box.doWrite(allocate);
            allocate.flip();
            t.parse(allocate);
            return t;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static LeafBox createLeafBox(Header header2, ByteBuffer byteBuffer) {
        LeafBox leafBox = new LeafBox(header2);
        leafBox.data = byteBuffer;
        return leafBox;
    }

    public static Box parseBox(ByteBuffer byteBuffer, Header header2, IBoxFactory iBoxFactory) {
        Box newBox = iBoxFactory.newBox(header2);
        if (header2.getBodySize() >= 134217728) {
            return new LeafBox(Header.createHeader("free", 8));
        }
        newBox.parse(byteBuffer);
        return newBox;
    }

    public static String[] path(String str) {
        return StringUtils.splitC(str, '.');
    }

    public static Box terminatorAtom() {
        return createLeafBox(new Header(Platform.stringFromBytes(new byte[4])), ByteBuffer.allocate(0));
    }

    public abstract void doWrite(ByteBuffer byteBuffer);

    /* access modifiers changed from: protected */
    public void dump(StringBuilder sb) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append("{\"tag\":\"");
        sb2.append(this.header.getFourcc());
        sb2.append("\"}");
        sb.append(sb2.toString());
    }

    public abstract int estimateSize();

    public String getFourcc() {
        return this.header.getFourcc();
    }

    public Header getHeader() {
        return this.header;
    }

    public abstract void parse(ByteBuffer byteBuffer);

    public String toString() {
        StringBuilder sb = new StringBuilder();
        dump(sb);
        return sb.toString();
    }

    public void write(ByteBuffer byteBuffer) {
        ByteBuffer duplicate = byteBuffer.duplicate();
        NIOUtils.skip(byteBuffer, 8);
        doWrite(byteBuffer);
        this.header.setBodySize((byteBuffer.position() - duplicate.position()) - 8);
        Preconditions.checkState(this.header.headerSize() == 8);
        this.header.write(duplicate);
    }
}

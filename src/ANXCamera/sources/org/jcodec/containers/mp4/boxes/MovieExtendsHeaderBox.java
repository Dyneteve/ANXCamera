package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class MovieExtendsHeaderBox extends FullBox {
    private int fragmentDuration;

    public MovieExtendsHeaderBox(Header header) {
        super(header);
    }

    public static MovieExtendsHeaderBox createMovieExtendsHeaderBox() {
        return new MovieExtendsHeaderBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "mehd";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.fragmentDuration);
    }

    public int estimateSize() {
        return 16;
    }

    public int getFragmentDuration() {
        return this.fragmentDuration;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.fragmentDuration = byteBuffer.getInt();
    }

    public void setFragmentDuration(int i) {
        this.fragmentDuration = i;
    }
}

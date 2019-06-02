package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class TrackFragmentBaseMediaDecodeTimeBox extends FullBox {
    /* access modifiers changed from: private */
    public long baseMediaDecodeTime;

    public static class Factory {
        private TrackFragmentBaseMediaDecodeTimeBox box;

        protected Factory(TrackFragmentBaseMediaDecodeTimeBox trackFragmentBaseMediaDecodeTimeBox) {
            this.box = TrackFragmentBaseMediaDecodeTimeBox.createTrackFragmentBaseMediaDecodeTimeBox(trackFragmentBaseMediaDecodeTimeBox.baseMediaDecodeTime);
            this.box.version = trackFragmentBaseMediaDecodeTimeBox.version;
            this.box.flags = trackFragmentBaseMediaDecodeTimeBox.flags;
        }

        public Factory baseMediaDecodeTime(long j) {
            this.box.baseMediaDecodeTime = j;
            return this;
        }

        public TrackFragmentBaseMediaDecodeTimeBox create() {
            try {
                return this.box;
            } finally {
                this.box = null;
            }
        }
    }

    public TrackFragmentBaseMediaDecodeTimeBox(Header header) {
        super(header);
    }

    public static Factory copy(TrackFragmentBaseMediaDecodeTimeBox trackFragmentBaseMediaDecodeTimeBox) {
        return new Factory(trackFragmentBaseMediaDecodeTimeBox);
    }

    public static TrackFragmentBaseMediaDecodeTimeBox createTrackFragmentBaseMediaDecodeTimeBox(long j) {
        TrackFragmentBaseMediaDecodeTimeBox trackFragmentBaseMediaDecodeTimeBox = new TrackFragmentBaseMediaDecodeTimeBox(new Header(fourcc()));
        trackFragmentBaseMediaDecodeTimeBox.baseMediaDecodeTime = j;
        if (trackFragmentBaseMediaDecodeTimeBox.baseMediaDecodeTime > 2147483647L) {
            trackFragmentBaseMediaDecodeTimeBox.version = 1;
        }
        return trackFragmentBaseMediaDecodeTimeBox;
    }

    public static String fourcc() {
        return "tfdt";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        if (this.version == 0) {
            byteBuffer.putInt((int) this.baseMediaDecodeTime);
        } else if (this.version == 1) {
            byteBuffer.putLong(this.baseMediaDecodeTime);
        } else {
            throw new RuntimeException("Unsupported tfdt version");
        }
    }

    public int estimateSize() {
        return 20;
    }

    public long getBaseMediaDecodeTime() {
        return this.baseMediaDecodeTime;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        if (this.version == 0) {
            this.baseMediaDecodeTime = (long) byteBuffer.getInt();
        } else if (this.version == 1) {
            this.baseMediaDecodeTime = byteBuffer.getLong();
        } else {
            throw new RuntimeException("Unsupported tfdt version");
        }
    }

    public void setBaseMediaDecodeTime(long j) {
        this.baseMediaDecodeTime = j;
    }
}

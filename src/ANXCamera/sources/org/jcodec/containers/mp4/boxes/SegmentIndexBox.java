package org.jcodec.containers.mp4.boxes;

import com.android.gallery3d.exif.ExifInterface.ColorSpace;
import java.nio.ByteBuffer;
import org.jcodec.platform.Platform;

public class SegmentIndexBox extends FullBox {
    public long earliest_presentation_time;
    public long first_offset;
    public long reference_ID;
    public int reference_count;
    public Reference[] references;
    public int reserved;
    public long timescale;

    public static class Reference {
        public long SAP_delta_time;
        public int SAP_type;
        public boolean reference_type;
        public long referenced_size;
        public boolean starts_with_SAP;
        public long subsegment_duration;

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Reference [reference_type=");
            sb.append(this.reference_type);
            sb.append(", referenced_size=");
            sb.append(this.referenced_size);
            sb.append(", subsegment_duration=");
            sb.append(this.subsegment_duration);
            sb.append(", starts_with_SAP=");
            sb.append(this.starts_with_SAP);
            sb.append(", SAP_type=");
            sb.append(this.SAP_type);
            sb.append(", SAP_delta_time=");
            sb.append(this.SAP_delta_time);
            sb.append("]");
            return sb.toString();
        }
    }

    public SegmentIndexBox(Header header) {
        super(header);
    }

    public static SegmentIndexBox createSegmentIndexBox() {
        return new SegmentIndexBox(new Header(fourcc()));
    }

    public static String fourcc() {
        return "sidx";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt((int) this.reference_ID);
        byteBuffer.putInt((int) this.timescale);
        if (this.version == 0) {
            byteBuffer.putInt((int) this.earliest_presentation_time);
            byteBuffer.putInt((int) this.first_offset);
        } else {
            byteBuffer.putLong(this.earliest_presentation_time);
            byteBuffer.putLong(this.first_offset);
        }
        byteBuffer.putShort((short) this.reserved);
        byteBuffer.putShort((short) this.reference_count);
        for (int i = 0; i < this.reference_count; i++) {
            Reference reference = this.references[i];
            int i2 = (int) (((long) ((reference.reference_type ? 1 : 0) << true)) | reference.referenced_size);
            int i3 = (int) reference.subsegment_duration;
            int i4 = (int) (((long) ((reference.starts_with_SAP ? Integer.MIN_VALUE : 0) | ((reference.SAP_type & 7) << 28))) | (reference.SAP_delta_time & 268435455));
            byteBuffer.putInt(i2);
            byteBuffer.putInt(i3);
            byteBuffer.putInt(i4);
        }
    }

    public int estimateSize() {
        return 40 + (this.reference_count * 12);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.reference_ID = Platform.unsignedInt(byteBuffer.getInt());
        this.timescale = Platform.unsignedInt(byteBuffer.getInt());
        if (this.version == 0) {
            this.earliest_presentation_time = Platform.unsignedInt(byteBuffer.getInt());
            this.first_offset = Platform.unsignedInt(byteBuffer.getInt());
        } else {
            this.earliest_presentation_time = byteBuffer.getLong();
            this.first_offset = byteBuffer.getLong();
        }
        this.reserved = byteBuffer.getShort();
        this.reference_count = byteBuffer.getShort() & ColorSpace.UNCALIBRATED;
        this.references = new Reference[this.reference_count];
        for (int i = 0; i < this.reference_count; i++) {
            long unsignedInt = Platform.unsignedInt(byteBuffer.getInt());
            long unsignedInt2 = Platform.unsignedInt(byteBuffer.getInt());
            long unsignedInt3 = Platform.unsignedInt(byteBuffer.getInt());
            Reference reference = new Reference();
            boolean z = true;
            reference.reference_type = ((unsignedInt >>> 31) & 1) == 1;
            reference.referenced_size = unsignedInt & 2147483647L;
            reference.subsegment_duration = unsignedInt2;
            if (((unsignedInt3 >>> 31) & 1) != 1) {
                z = false;
            }
            reference.starts_with_SAP = z;
            reference.SAP_type = (int) ((unsignedInt3 >>> 28) & 7);
            reference.SAP_delta_time = 268435455 & unsignedInt3;
            this.references[i] = reference;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SegmentIndexBox [reference_ID=");
        sb.append(this.reference_ID);
        sb.append(", timescale=");
        sb.append(this.timescale);
        sb.append(", earliest_presentation_time=");
        sb.append(this.earliest_presentation_time);
        sb.append(", first_offset=");
        sb.append(this.first_offset);
        sb.append(", reserved=");
        sb.append(this.reserved);
        sb.append(", reference_count=");
        sb.append(this.reference_count);
        sb.append(", references=");
        sb.append(Platform.arrayToString(this.references));
        sb.append(", version=");
        sb.append(this.version);
        sb.append(", flags=");
        sb.append(this.flags);
        sb.append(", header=");
        sb.append(this.header);
        sb.append("]");
        return sb.toString();
    }
}

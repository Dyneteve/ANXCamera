package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class EditListBox extends FullBox {
    private List<Edit> edits;

    public EditListBox(Header header) {
        super(header);
    }

    public static EditListBox createEditListBox(List<Edit> list) {
        EditListBox editListBox = new EditListBox(new Header(fourcc()));
        editListBox.edits = list;
        return editListBox;
    }

    public static String fourcc() {
        return "elst";
    }

    /* access modifiers changed from: protected */
    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.edits.size());
        for (Edit edit : this.edits) {
            byteBuffer.putInt((int) edit.getDuration());
            byteBuffer.putInt((int) edit.getMediaTime());
            byteBuffer.putInt((int) (edit.getRate() * 65536.0f));
        }
    }

    public int estimateSize() {
        return 16 + (this.edits.size() * 12);
    }

    public List<Edit> getEdits() {
        return this.edits;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.edits = new ArrayList();
        long j = (long) byteBuffer.getInt();
        for (int i = 0; ((long) i) < j; i++) {
            int i2 = byteBuffer.getInt();
            int i3 = byteBuffer.getInt();
            float f = ((float) byteBuffer.getInt()) / 65536.0f;
            List<Edit> list = this.edits;
            Edit edit = new Edit((long) i2, (long) i3, f);
            list.add(edit);
        }
    }
}

package com.android.gallery3d.exif;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;

class ExifModifier {
    public static final boolean DEBUG = false;
    public static final String TAG = "ExifModifier";
    private final ByteBuffer mByteBuffer;
    private final ExifInterface mInterface;
    private int mOffsetBase;
    private final List<TagOffset> mTagOffsets = new ArrayList();
    private final ExifData mTagToModified;

    private static class TagOffset {
        final int mOffset;
        final ExifTag mTag;

        TagOffset(ExifTag exifTag, int i) {
            this.mTag = exifTag;
            this.mOffset = i;
        }
    }

    protected ExifModifier(ByteBuffer byteBuffer, ExifInterface exifInterface) throws IOException, ExifInvalidFormatException {
        ByteBufferInputStream byteBufferInputStream;
        this.mByteBuffer = byteBuffer;
        this.mOffsetBase = byteBuffer.position();
        this.mInterface = exifInterface;
        try {
            byteBufferInputStream = new ByteBufferInputStream(byteBuffer);
            try {
                ExifParser parse = ExifParser.parse(byteBufferInputStream, this.mInterface);
                this.mTagToModified = new ExifData(parse.getByteOrder());
                this.mOffsetBase += parse.getTiffStartPosition();
                this.mByteBuffer.position(0);
                ExifInterface.closeSilently(byteBufferInputStream);
            } catch (Throwable th) {
                th = th;
                ExifInterface.closeSilently(byteBufferInputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            byteBufferInputStream = null;
            ExifInterface.closeSilently(byteBufferInputStream);
            throw th;
        }
    }

    private void modify() {
        this.mByteBuffer.order(getByteOrder());
        for (TagOffset tagOffset : this.mTagOffsets) {
            writeTagValue(tagOffset.mTag, tagOffset.mOffset);
        }
    }

    private void writeTagValue(ExifTag exifTag, int i) {
        int i2;
        this.mByteBuffer.position(i + this.mOffsetBase);
        int i3 = 0;
        switch (exifTag.getDataType()) {
            case 1:
            case 7:
                byte[] bArr = new byte[exifTag.getComponentCount()];
                exifTag.getBytes(bArr);
                this.mByteBuffer.put(bArr);
                return;
            case 2:
                byte[] stringByte = exifTag.getStringByte();
                if (stringByte.length == exifTag.getComponentCount()) {
                    stringByte[stringByte.length - 1] = 0;
                    this.mByteBuffer.put(stringByte);
                    return;
                }
                this.mByteBuffer.put(stringByte);
                this.mByteBuffer.put(0);
                return;
            case 3:
                int componentCount = exifTag.getComponentCount();
                while (i2 < componentCount) {
                    this.mByteBuffer.putShort((short) ((int) exifTag.getValueAt(i2)));
                    i2++;
                }
                return;
            case 4:
            case 9:
                int componentCount2 = exifTag.getComponentCount();
                while (i3 < componentCount2) {
                    this.mByteBuffer.putInt((int) exifTag.getValueAt(i3));
                    i3++;
                }
                return;
            case 5:
            case 10:
                int componentCount3 = exifTag.getComponentCount();
                while (i3 < componentCount3) {
                    Rational rational = exifTag.getRational(i3);
                    this.mByteBuffer.putInt((int) rational.getNumerator());
                    this.mByteBuffer.putInt((int) rational.getDenominator());
                    i3++;
                }
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public boolean commit() throws IOException, ExifInvalidFormatException {
        ByteBufferInputStream byteBufferInputStream;
        Throwable th;
        IfdData ifdData = null;
        try {
            byteBufferInputStream = new ByteBufferInputStream(this.mByteBuffer);
            try {
                IfdData[] ifdDataArr = {this.mTagToModified.getIfdData(0), this.mTagToModified.getIfdData(1), this.mTagToModified.getIfdData(2), this.mTagToModified.getIfdData(3), this.mTagToModified.getIfdData(4)};
                int i = ifdDataArr[0] != null ? 1 : 0;
                if (ifdDataArr[1] != null) {
                    i |= 2;
                }
                if (ifdDataArr[2] != null) {
                    i |= 4;
                }
                if (ifdDataArr[4] != null) {
                    i |= 8;
                }
                if (ifdDataArr[3] != null) {
                    i |= 16;
                }
                ExifParser parse = ExifParser.parse(byteBufferInputStream, i, this.mInterface);
                for (int next = parse.next(); next != 5; next = parse.next()) {
                    switch (next) {
                        case 0:
                            ifdData = ifdDataArr[parse.getCurrentIfd()];
                            if (ifdData != null) {
                                break;
                            } else {
                                parse.skipRemainingTagsInCurrentIfd();
                                break;
                            }
                        case 1:
                            ExifTag tag = parse.getTag();
                            ExifTag tag2 = ifdData.getTag(tag.getTagId());
                            if (tag2 == null) {
                                continue;
                            } else {
                                if (tag2.getComponentCount() == tag.getComponentCount()) {
                                    if (tag2.getDataType() == tag.getDataType()) {
                                        this.mTagOffsets.add(new TagOffset(tag2, tag.getOffset()));
                                        ifdData.removeTag(tag.getTagId());
                                        if (ifdData.getTagCount() != 0) {
                                            break;
                                        } else {
                                            parse.skipRemainingTagsInCurrentIfd();
                                            break;
                                        }
                                    }
                                }
                                ExifInterface.closeSilently(byteBufferInputStream);
                                return false;
                            }
                    }
                }
                int length = ifdDataArr.length;
                int i2 = 0;
                while (i2 < length) {
                    IfdData ifdData2 = ifdDataArr[i2];
                    if (ifdData2 == null || ifdData2.getTagCount() <= 0) {
                        i2++;
                    } else {
                        ExifInterface.closeSilently(byteBufferInputStream);
                        return false;
                    }
                }
                modify();
                ExifInterface.closeSilently(byteBufferInputStream);
                return true;
            } catch (Throwable th2) {
                th = th2;
                ExifInterface.closeSilently(byteBufferInputStream);
                throw th;
            }
        } catch (Throwable th3) {
            Throwable th4 = th3;
            byteBufferInputStream = null;
            th = th4;
            ExifInterface.closeSilently(byteBufferInputStream);
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public ByteOrder getByteOrder() {
        return this.mTagToModified.getByteOrder();
    }

    public void modifyTag(ExifTag exifTag) {
        this.mTagToModified.addTag(exifTag);
    }
}

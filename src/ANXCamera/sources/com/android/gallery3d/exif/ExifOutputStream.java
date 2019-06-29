package com.android.gallery3d.exif;

import com.android.gallery3d.exif.ExifInterface.ColorSpace;
import java.io.BufferedOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Iterator;

class ExifOutputStream extends FilterOutputStream {
    private static final boolean DEBUG = false;
    private static final int EXIF_HEADER = 1165519206;
    private static final int MAX_EXIF_SIZE = 65535;
    private static final int STATE_FRAME_HEADER = 1;
    private static final int STATE_JPEG_DATA = 2;
    private static final int STATE_SOI = 0;
    private static final int STREAMBUFFER_SIZE = 65536;
    private static final String TAG = "ExifOutputStream";
    private static final short TAG_SIZE = 12;
    private static final short TIFF_BIG_ENDIAN = 19789;
    private static final short TIFF_HEADER = 42;
    private static final short TIFF_HEADER_SIZE = 8;
    private static final short TIFF_LITTLE_ENDIAN = 18761;
    private ByteBuffer mBuffer = ByteBuffer.allocate(4);
    private int mByteToCopy;
    private int mByteToSkip;
    private ExifData mExifData;
    private final ExifInterface mInterface;
    private byte[] mSingleByteArray = new byte[1];
    private int mState = 0;

    protected ExifOutputStream(OutputStream outputStream, ExifInterface exifInterface) {
        super(new BufferedOutputStream(outputStream, 65536));
        this.mInterface = exifInterface;
    }

    private int calculateAllOffset() {
        IfdData ifdData = this.mExifData.getIfdData(0);
        int calculateOffsetOfIfd = calculateOffsetOfIfd(ifdData, 8);
        ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_EXIF_IFD)).setValue(calculateOffsetOfIfd);
        IfdData ifdData2 = this.mExifData.getIfdData(2);
        int calculateOffsetOfIfd2 = calculateOffsetOfIfd(ifdData2, calculateOffsetOfIfd);
        IfdData ifdData3 = this.mExifData.getIfdData(3);
        if (ifdData3 != null) {
            ifdData2.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_INTEROPERABILITY_IFD)).setValue(calculateOffsetOfIfd2);
            calculateOffsetOfIfd2 = calculateOffsetOfIfd(ifdData3, calculateOffsetOfIfd2);
        }
        IfdData ifdData4 = this.mExifData.getIfdData(4);
        if (ifdData4 != null) {
            ifdData.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_GPS_IFD)).setValue(calculateOffsetOfIfd2);
            calculateOffsetOfIfd2 = calculateOffsetOfIfd(ifdData4, calculateOffsetOfIfd2);
        }
        IfdData ifdData5 = this.mExifData.getIfdData(1);
        if (ifdData5 != null) {
            ifdData.setOffsetToNextIfd(calculateOffsetOfIfd2);
            calculateOffsetOfIfd2 = calculateOffsetOfIfd(ifdData5, calculateOffsetOfIfd2);
        }
        if (this.mExifData.hasCompressedThumbnail()) {
            ifdData5.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT)).setValue(calculateOffsetOfIfd2);
            return calculateOffsetOfIfd2 + this.mExifData.getCompressedThumbnail().length;
        } else if (!this.mExifData.hasUncompressedStrip()) {
            return calculateOffsetOfIfd2;
        } else {
            long[] jArr = new long[this.mExifData.getStripCount()];
            for (int i = 0; i < this.mExifData.getStripCount(); i++) {
                jArr[i] = (long) calculateOffsetOfIfd2;
                calculateOffsetOfIfd2 += this.mExifData.getStrip(i).length;
            }
            ifdData5.getTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS)).setValue(jArr);
            return calculateOffsetOfIfd2;
        }
    }

    private int calculateOffsetOfIfd(IfdData ifdData, int i) {
        ExifTag[] allTags;
        int tagCount = i + 2 + (ifdData.getTagCount() * 12) + 4;
        for (ExifTag exifTag : ifdData.getAllTags()) {
            if (exifTag.getDataSize() > 4) {
                exifTag.setOffset(tagCount);
                tagCount += exifTag.getDataSize();
            }
        }
        return tagCount;
    }

    private void createRequiredIfdAndTag() throws IOException {
        IfdData ifdData = this.mExifData.getIfdData(0);
        if (ifdData == null) {
            ifdData = new IfdData(0);
            this.mExifData.addIfdData(ifdData);
        }
        ExifTag buildUninitializedTag = this.mInterface.buildUninitializedTag(ExifInterface.TAG_EXIF_IFD);
        if (buildUninitializedTag != null) {
            ifdData.setTag(buildUninitializedTag);
            IfdData ifdData2 = this.mExifData.getIfdData(2);
            if (ifdData2 == null) {
                ifdData2 = new IfdData(2);
                this.mExifData.addIfdData(ifdData2);
            }
            if (this.mExifData.getIfdData(4) != null) {
                ExifTag buildUninitializedTag2 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_GPS_IFD);
                if (buildUninitializedTag2 != null) {
                    ifdData.setTag(buildUninitializedTag2);
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("No definition for crucial exif tag: ");
                    sb.append(ExifInterface.TAG_GPS_IFD);
                    throw new IOException(sb.toString());
                }
            }
            if (this.mExifData.getIfdData(3) != null) {
                ExifTag buildUninitializedTag3 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_INTEROPERABILITY_IFD);
                if (buildUninitializedTag3 != null) {
                    ifdData2.setTag(buildUninitializedTag3);
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("No definition for crucial exif tag: ");
                    sb2.append(ExifInterface.TAG_INTEROPERABILITY_IFD);
                    throw new IOException(sb2.toString());
                }
            }
            IfdData ifdData3 = this.mExifData.getIfdData(1);
            if (this.mExifData.hasCompressedThumbnail()) {
                if (ifdData3 == null) {
                    ifdData3 = new IfdData(1);
                    this.mExifData.addIfdData(ifdData3);
                }
                ExifTag buildUninitializedTag4 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
                if (buildUninitializedTag4 != null) {
                    ifdData3.setTag(buildUninitializedTag4);
                    ExifTag buildUninitializedTag5 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
                    if (buildUninitializedTag5 != null) {
                        buildUninitializedTag5.setValue(this.mExifData.getCompressedThumbnail().length);
                        ifdData3.setTag(buildUninitializedTag5);
                        ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
                        ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
                        return;
                    }
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("No definition for crucial exif tag: ");
                    sb3.append(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH);
                    throw new IOException(sb3.toString());
                }
                StringBuilder sb4 = new StringBuilder();
                sb4.append("No definition for crucial exif tag: ");
                sb4.append(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT);
                throw new IOException(sb4.toString());
            } else if (this.mExifData.hasUncompressedStrip()) {
                if (ifdData3 == null) {
                    ifdData3 = new IfdData(1);
                    this.mExifData.addIfdData(ifdData3);
                }
                int stripCount = this.mExifData.getStripCount();
                ExifTag buildUninitializedTag6 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_OFFSETS);
                if (buildUninitializedTag6 != null) {
                    ExifTag buildUninitializedTag7 = this.mInterface.buildUninitializedTag(ExifInterface.TAG_STRIP_BYTE_COUNTS);
                    if (buildUninitializedTag7 != null) {
                        long[] jArr = new long[stripCount];
                        for (int i = 0; i < this.mExifData.getStripCount(); i++) {
                            jArr[i] = (long) this.mExifData.getStrip(i).length;
                        }
                        buildUninitializedTag7.setValue(jArr);
                        ifdData3.setTag(buildUninitializedTag6);
                        ifdData3.setTag(buildUninitializedTag7);
                        ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
                        ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
                        return;
                    }
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("No definition for crucial exif tag: ");
                    sb5.append(ExifInterface.TAG_STRIP_BYTE_COUNTS);
                    throw new IOException(sb5.toString());
                }
                StringBuilder sb6 = new StringBuilder();
                sb6.append("No definition for crucial exif tag: ");
                sb6.append(ExifInterface.TAG_STRIP_OFFSETS);
                throw new IOException(sb6.toString());
            } else if (ifdData3 != null) {
                ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_OFFSETS));
                ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_STRIP_BYTE_COUNTS));
                ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT));
                ifdData3.removeTag(ExifInterface.getTrueTagKey(ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH));
            }
        } else {
            StringBuilder sb7 = new StringBuilder();
            sb7.append("No definition for crucial exif tag: ");
            sb7.append(ExifInterface.TAG_EXIF_IFD);
            throw new IOException(sb7.toString());
        }
    }

    private int requestByteToBuffer(int i, byte[] bArr, int i2, int i3) {
        int position = i - this.mBuffer.position();
        if (i3 <= position) {
            position = i3;
        }
        this.mBuffer.put(bArr, i2, position);
        return position;
    }

    private ArrayList<ExifTag> stripNullValueTags(ExifData exifData) {
        ArrayList<ExifTag> arrayList = new ArrayList<>();
        if (exifData.getAllTags() != null) {
            for (ExifTag exifTag : exifData.getAllTags()) {
                if (exifTag.getValue() == null && !ExifInterface.isOffsetTag(exifTag.getTagId())) {
                    exifData.removeTag(exifTag.getTagId(), exifTag.getIfd());
                    arrayList.add(exifTag);
                }
            }
        }
        return arrayList;
    }

    private void writeAllTags(OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        writeIfd(this.mExifData.getIfdData(0), orderedDataOutputStream);
        writeIfd(this.mExifData.getIfdData(2), orderedDataOutputStream);
        IfdData ifdData = this.mExifData.getIfdData(3);
        if (ifdData != null) {
            writeIfd(ifdData, orderedDataOutputStream);
        }
        IfdData ifdData2 = this.mExifData.getIfdData(4);
        if (ifdData2 != null) {
            writeIfd(ifdData2, orderedDataOutputStream);
        }
        if (this.mExifData.getIfdData(1) != null) {
            writeIfd(this.mExifData.getIfdData(1), orderedDataOutputStream);
        }
    }

    private void writeExifData() throws IOException {
        if (this.mExifData != null) {
            ArrayList stripNullValueTags = stripNullValueTags(this.mExifData);
            createRequiredIfdAndTag();
            int calculateAllOffset = calculateAllOffset() + 8;
            if (calculateAllOffset <= 65535) {
                OrderedDataOutputStream orderedDataOutputStream = new OrderedDataOutputStream(this.out);
                orderedDataOutputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
                orderedDataOutputStream.writeShort(-31);
                orderedDataOutputStream.writeShort((short) calculateAllOffset);
                orderedDataOutputStream.writeInt(EXIF_HEADER);
                orderedDataOutputStream.writeShort(0);
                if (this.mExifData.getByteOrder() == ByteOrder.BIG_ENDIAN) {
                    orderedDataOutputStream.writeShort(TIFF_BIG_ENDIAN);
                } else {
                    orderedDataOutputStream.writeShort(TIFF_LITTLE_ENDIAN);
                }
                orderedDataOutputStream.setByteOrder(this.mExifData.getByteOrder());
                orderedDataOutputStream.writeShort(TIFF_HEADER);
                orderedDataOutputStream.writeInt(8);
                writeAllTags(orderedDataOutputStream);
                writeThumbnail(orderedDataOutputStream);
                Iterator it = stripNullValueTags.iterator();
                while (it.hasNext()) {
                    this.mExifData.addTag((ExifTag) it.next());
                }
                return;
            }
            throw new IOException("Exif header is too large (>64Kb)");
        }
    }

    private void writeIfd(IfdData ifdData, OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        ExifTag[] allTags = ifdData.getAllTags();
        orderedDataOutputStream.writeShort((short) allTags.length);
        for (ExifTag exifTag : allTags) {
            orderedDataOutputStream.writeShort(exifTag.getTagId());
            orderedDataOutputStream.writeShort(exifTag.getDataType());
            orderedDataOutputStream.writeInt(exifTag.getComponentCount());
            if (exifTag.getDataSize() > 4) {
                orderedDataOutputStream.writeInt(exifTag.getOffset());
            } else {
                writeTagValue(exifTag, orderedDataOutputStream);
                int dataSize = 4 - exifTag.getDataSize();
                for (int i = 0; i < dataSize; i++) {
                    orderedDataOutputStream.write(0);
                }
            }
        }
        orderedDataOutputStream.writeInt(ifdData.getOffsetToNextIfd());
        for (ExifTag exifTag2 : allTags) {
            if (exifTag2.getDataSize() > 4) {
                writeTagValue(exifTag2, orderedDataOutputStream);
            }
        }
    }

    static void writeTagValue(ExifTag exifTag, OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        int i = 0;
        switch (exifTag.getDataType()) {
            case 1:
            case 7:
                byte[] bArr = new byte[exifTag.getComponentCount()];
                exifTag.getBytes(bArr);
                orderedDataOutputStream.write(bArr);
                return;
            case 2:
                byte[] stringByte = exifTag.getStringByte();
                if (stringByte.length == exifTag.getComponentCount()) {
                    stringByte[stringByte.length - 1] = 0;
                    orderedDataOutputStream.write(stringByte);
                    return;
                }
                orderedDataOutputStream.write(stringByte);
                orderedDataOutputStream.write(0);
                return;
            case 3:
                int componentCount = exifTag.getComponentCount();
                while (i < componentCount) {
                    orderedDataOutputStream.writeShort((short) ((int) exifTag.getValueAt(i)));
                    i++;
                }
                return;
            case 4:
            case 9:
                int componentCount2 = exifTag.getComponentCount();
                while (i < componentCount2) {
                    orderedDataOutputStream.writeInt((int) exifTag.getValueAt(i));
                    i++;
                }
                return;
            case 5:
            case 10:
                int componentCount3 = exifTag.getComponentCount();
                while (i < componentCount3) {
                    orderedDataOutputStream.writeRational(exifTag.getRational(i));
                    i++;
                }
                return;
            default:
                return;
        }
    }

    private void writeThumbnail(OrderedDataOutputStream orderedDataOutputStream) throws IOException {
        if (this.mExifData.hasCompressedThumbnail()) {
            orderedDataOutputStream.write(this.mExifData.getCompressedThumbnail());
        } else if (this.mExifData.hasUncompressedStrip()) {
            for (int i = 0; i < this.mExifData.getStripCount(); i++) {
                orderedDataOutputStream.write(this.mExifData.getStrip(i));
            }
        }
    }

    /* access modifiers changed from: protected */
    public ExifData getExifData() {
        return this.mExifData;
    }

    /* access modifiers changed from: protected */
    public void setExifData(ExifData exifData) {
        this.mExifData = exifData;
    }

    public void write(int i) throws IOException {
        this.mSingleByteArray[0] = (byte) (i & 255);
        write(this.mSingleByteArray);
    }

    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    public void write(byte[] bArr, int i, int i2) throws IOException {
        while (true) {
            if ((this.mByteToSkip > 0 || this.mByteToCopy > 0 || this.mState != 2) && i2 > 0) {
                if (this.mByteToSkip > 0) {
                    int i3 = i2 > this.mByteToSkip ? this.mByteToSkip : i2;
                    i2 -= i3;
                    this.mByteToSkip -= i3;
                    i += i3;
                }
                if (this.mByteToCopy > 0) {
                    int i4 = i2 > this.mByteToCopy ? this.mByteToCopy : i2;
                    this.out.write(bArr, i, i4);
                    i2 -= i4;
                    this.mByteToCopy -= i4;
                    i += i4;
                }
                if (i2 != 0) {
                    switch (this.mState) {
                        case 0:
                            int requestByteToBuffer = requestByteToBuffer(2, bArr, i, i2);
                            i += requestByteToBuffer;
                            i2 -= requestByteToBuffer;
                            if (this.mBuffer.position() >= 2) {
                                this.mBuffer.rewind();
                                if (this.mBuffer.getShort() == -40) {
                                    this.out.write(this.mBuffer.array(), 0, 2);
                                    this.mState = 1;
                                    this.mBuffer.rewind();
                                    writeExifData();
                                    break;
                                } else {
                                    throw new IOException("Not a valid jpeg image, cannot write exif");
                                }
                            } else {
                                return;
                            }
                        case 1:
                            int requestByteToBuffer2 = requestByteToBuffer(4, bArr, i, i2);
                            i += requestByteToBuffer2;
                            i2 -= requestByteToBuffer2;
                            if (this.mBuffer.position() == 2 && this.mBuffer.getShort() == -39) {
                                this.out.write(this.mBuffer.array(), 0, 2);
                                this.mBuffer.rewind();
                            }
                            if (this.mBuffer.position() >= 4) {
                                this.mBuffer.rewind();
                                short s = this.mBuffer.getShort();
                                if (s == -31) {
                                    this.mByteToSkip = (this.mBuffer.getShort() & ColorSpace.UNCALIBRATED) - 2;
                                    this.mState = 2;
                                } else if (!JpegHeader.isSofMarker(s)) {
                                    this.out.write(this.mBuffer.array(), 0, 4);
                                    this.mByteToCopy = (this.mBuffer.getShort() & ColorSpace.UNCALIBRATED) - 2;
                                } else {
                                    this.out.write(this.mBuffer.array(), 0, 4);
                                    this.mState = 2;
                                }
                                this.mBuffer.rewind();
                                break;
                            } else {
                                return;
                            }
                    }
                } else {
                    return;
                }
            }
        }
        if (i2 > 0) {
            this.out.write(bArr, i, i2);
        }
    }
}

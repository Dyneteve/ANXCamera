package com.google.protobuf.nano;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.MapEntryLite;
import com.google.protobuf.MapFieldLite;
import com.google.protobuf.Parser;
import java.io.IOException;

public final class CodedInputByteBufferNano {
    private static final int DEFAULT_RECURSION_LIMIT = 64;
    private static final int DEFAULT_SIZE_LIMIT = 67108864;
    private final byte[] buffer;
    private int bufferPos;
    private final int bufferSize;
    private int bufferSizeAfterLimit;
    private final int bufferStart;
    private CodedInputStream codedInputStream;
    private int currentLimit = Integer.MAX_VALUE;
    private int lastTag;
    private int maybeLimitedBufferSize;
    private int recursionDepth;
    private int recursionLimit = 64;
    private int sizeLimit = DEFAULT_SIZE_LIMIT;

    private CodedInputByteBufferNano(byte[] bArr, int i, int i2) {
        this.buffer = bArr;
        this.bufferStart = i;
        int i3 = i2 + i;
        this.maybeLimitedBufferSize = i3;
        this.bufferSize = i3;
        this.bufferPos = i;
    }

    public static int decodeZigZag32(int i) {
        return (-(i & 1)) ^ (i >>> 1);
    }

    public static long decodeZigZag64(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }

    private CodedInputStream getCodedInputStream() throws IOException {
        if (this.codedInputStream == null) {
            this.codedInputStream = CodedInputStream.newInstance(this.buffer, this.bufferStart, this.bufferSize);
        }
        int totalBytesRead = this.codedInputStream.getTotalBytesRead();
        int i = this.bufferPos - this.bufferStart;
        if (totalBytesRead <= i) {
            this.codedInputStream.skipRawBytes(i - totalBytesRead);
            this.codedInputStream.setRecursionLimit(this.recursionLimit - this.recursionDepth);
            return this.codedInputStream;
        }
        throw new IOException(String.format("CodedInputStream read ahead of CodedInputByteBufferNano: %s > %s", new Object[]{Integer.valueOf(totalBytesRead), Integer.valueOf(i)}));
    }

    public static CodedInputByteBufferNano newInstance(byte[] bArr) {
        return newInstance(bArr, 0, bArr.length);
    }

    public static CodedInputByteBufferNano newInstance(byte[] bArr, int i, int i2) {
        return new CodedInputByteBufferNano(bArr, i, i2);
    }

    private void recomputeBufferSizeAfterLimit() {
        this.maybeLimitedBufferSize += this.bufferSizeAfterLimit;
        int i = this.maybeLimitedBufferSize;
        if (i > this.currentLimit) {
            this.bufferSizeAfterLimit = i - this.currentLimit;
            this.maybeLimitedBufferSize -= this.bufferSizeAfterLimit;
            return;
        }
        this.bufferSizeAfterLimit = 0;
    }

    public void checkLastTagWas(int i) throws InvalidProtocolBufferNanoException {
        if (this.lastTag != i) {
            throw InvalidProtocolBufferNanoException.invalidEndTag();
        }
    }

    public int getBytesUntilLimit() {
        if (this.currentLimit == Integer.MAX_VALUE) {
            return -1;
        }
        return this.currentLimit - this.bufferPos;
    }

    public byte[] getData(int i, int i2) {
        if (i2 == 0) {
            return WireFormatNano.EMPTY_BYTES;
        }
        byte[] bArr = new byte[i2];
        System.arraycopy(this.buffer, this.bufferStart + i, bArr, 0, i2);
        return bArr;
    }

    public int getPosition() {
        return this.bufferPos - this.bufferStart;
    }

    public boolean isAtEnd() {
        return this.bufferPos == this.maybeLimitedBufferSize;
    }

    public void popLimit(int i) {
        this.currentLimit = i;
        recomputeBufferSizeAfterLimit();
    }

    public int pushLimit(int i) throws InvalidProtocolBufferNanoException {
        if (i >= 0) {
            int i2 = i + this.bufferPos;
            int i3 = this.currentLimit;
            if (i2 <= i3) {
                this.currentLimit = i2;
                recomputeBufferSizeAfterLimit();
                return i3;
            }
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        throw InvalidProtocolBufferNanoException.negativeSize();
    }

    public boolean readBool() throws IOException {
        return readRawVarint32() != 0;
    }

    public byte[] readBytes() throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (readRawVarint32 < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (readRawVarint32 == 0) {
            return WireFormatNano.EMPTY_BYTES;
        } else {
            if (readRawVarint32 <= this.maybeLimitedBufferSize - this.bufferPos) {
                byte[] bArr = new byte[readRawVarint32];
                System.arraycopy(this.buffer, this.bufferPos, bArr, 0, readRawVarint32);
                this.bufferPos += readRawVarint32;
                return bArr;
            }
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readRawLittleEndian64());
    }

    public int readEnum() throws IOException {
        return readRawVarint32();
    }

    public int readFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readRawLittleEndian32());
    }

    public void readGroup(MessageNano messageNano, int i) throws IOException {
        if (this.recursionDepth < this.recursionLimit) {
            this.recursionDepth++;
            messageNano.mergeFrom(this);
            checkLastTagWas(WireFormatNano.makeTag(i, 4));
            this.recursionDepth--;
            return;
        }
        throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
    }

    public <T extends GeneratedMessageLite<T, ?>> T readGroupLite(Parser<T> parser, int i) throws IOException {
        T t = (GeneratedMessageLite) getCodedInputStream().readGroup(i, parser, ExtensionRegistryLite.getGeneratedRegistry());
        skipField(this.lastTag);
        checkLastTagWas(WireFormatNano.makeTag(i, 4));
        return t;
    }

    public int readInt32() throws IOException {
        return readRawVarint32();
    }

    public long readInt64() throws IOException {
        return readRawVarint64();
    }

    public <K, V> void readMapEntryInto(MapFieldLite<K, V> mapFieldLite, MapEntryLite<K, V> mapEntryLite) throws IOException {
        mapEntryLite.parseInto(mapFieldLite, getCodedInputStream(), ExtensionRegistryLite.getGeneratedRegistry());
        skipField(this.lastTag);
    }

    public void readMessage(MessageNano messageNano) throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (this.recursionDepth < this.recursionLimit) {
            int pushLimit = pushLimit(readRawVarint32);
            this.recursionDepth++;
            messageNano.mergeFrom(this);
            checkLastTagWas(0);
            this.recursionDepth--;
            popLimit(pushLimit);
            return;
        }
        throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
    }

    public <T extends GeneratedMessageLite<T, ?>> T readMessageLite(Parser<T> parser) throws IOException {
        T t = (GeneratedMessageLite) getCodedInputStream().readMessage(parser, ExtensionRegistryLite.getGeneratedRegistry());
        skipField(this.lastTag);
        return t;
    }

    public byte readRawByte() throws IOException {
        if (this.bufferPos != this.maybeLimitedBufferSize) {
            byte[] bArr = this.buffer;
            int i = this.bufferPos;
            this.bufferPos = i + 1;
            return bArr[i];
        }
        throw InvalidProtocolBufferNanoException.truncatedMessage();
    }

    public byte[] readRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (this.bufferPos + i > this.currentLimit) {
            skipRawBytes(this.currentLimit - this.bufferPos);
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        } else if (i <= this.maybeLimitedBufferSize - this.bufferPos) {
            byte[] bArr = new byte[i];
            System.arraycopy(this.buffer, this.bufferPos, bArr, 0, i);
            this.bufferPos += i;
            return bArr;
        } else {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
    }

    public int readRawLittleEndian32() throws IOException {
        return (readRawByte() & -1) | ((readRawByte() & -1) << 8) | ((readRawByte() & -1) << 16) | ((readRawByte() & -1) << 24);
    }

    public long readRawLittleEndian64() throws IOException {
        byte readRawByte = readRawByte();
        byte readRawByte2 = readRawByte();
        return ((((long) readRawByte2) & 255) << 8) | (((long) readRawByte) & 255) | ((((long) readRawByte()) & 255) << 16) | ((((long) readRawByte()) & 255) << 24) | ((((long) readRawByte()) & 255) << 32) | ((((long) readRawByte()) & 255) << 40) | ((((long) readRawByte()) & 255) << 48) | ((((long) readRawByte()) & 255) << 56);
    }

    public int readRawVarint32() throws IOException {
        byte b;
        byte readRawByte = readRawByte();
        if (readRawByte >= 0) {
            return readRawByte;
        }
        byte b2 = readRawByte & Byte.MAX_VALUE;
        byte readRawByte2 = readRawByte();
        if (readRawByte2 >= 0) {
            b = b2 | (readRawByte2 << 7);
        } else {
            byte b3 = b2 | ((readRawByte2 & Byte.MAX_VALUE) << 7);
            byte readRawByte3 = readRawByte();
            if (readRawByte3 >= 0) {
                b = b3 | (readRawByte3 << 14);
            } else {
                byte b4 = b3 | ((readRawByte3 & Byte.MAX_VALUE) << 14);
                byte readRawByte4 = readRawByte();
                if (readRawByte4 >= 0) {
                    b = b4 | (readRawByte4 << 21);
                } else {
                    byte b5 = b4 | ((readRawByte4 & Byte.MAX_VALUE) << 21);
                    byte readRawByte5 = readRawByte();
                    b = b5 | (readRawByte5 << 28);
                    if (readRawByte5 < 0) {
                        for (int i = 0; i < 5; i++) {
                            if (readRawByte() >= 0) {
                                return b;
                            }
                        }
                        throw InvalidProtocolBufferNanoException.malformedVarint();
                    }
                }
            }
        }
        return b;
    }

    public long readRawVarint64() throws IOException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            byte readRawByte = readRawByte();
            j |= ((long) (readRawByte & Byte.MAX_VALUE)) << i;
            if ((readRawByte & Byte.MIN_VALUE) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferNanoException.malformedVarint();
    }

    public int readSFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readSFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public int readSInt32() throws IOException {
        return decodeZigZag32(readRawVarint32());
    }

    public long readSInt64() throws IOException {
        return decodeZigZag64(readRawVarint64());
    }

    public String readString() throws IOException {
        int readRawVarint32 = readRawVarint32();
        if (readRawVarint32 < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (readRawVarint32 <= this.maybeLimitedBufferSize - this.bufferPos) {
            String str = new String(this.buffer, this.bufferPos, readRawVarint32, InternalNano.UTF_8);
            this.bufferPos += readRawVarint32;
            return str;
        } else {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
    }

    public int readTag() throws IOException {
        if (isAtEnd()) {
            this.lastTag = 0;
            return 0;
        }
        this.lastTag = readRawVarint32();
        if (this.lastTag != 0) {
            return this.lastTag;
        }
        throw InvalidProtocolBufferNanoException.invalidTag();
    }

    public int readUInt32() throws IOException {
        return readRawVarint32();
    }

    public long readUInt64() throws IOException {
        return readRawVarint64();
    }

    public void resetSizeCounter() {
    }

    public void rewindToPosition(int i) {
        rewindToPositionAndTag(i, this.lastTag);
    }

    /* access modifiers changed from: 0000 */
    public void rewindToPositionAndTag(int i, int i2) {
        if (i > this.bufferPos - this.bufferStart) {
            int i3 = this.bufferPos - this.bufferStart;
            StringBuilder sb = new StringBuilder(50);
            sb.append("Position ");
            sb.append(i);
            sb.append(" is beyond current ");
            sb.append(i3);
            throw new IllegalArgumentException(sb.toString());
        } else if (i >= 0) {
            this.bufferPos = this.bufferStart + i;
            this.lastTag = i2;
        } else {
            StringBuilder sb2 = new StringBuilder(24);
            sb2.append("Bad position ");
            sb2.append(i);
            throw new IllegalArgumentException(sb2.toString());
        }
    }

    public int setRecursionLimit(int i) {
        if (i >= 0) {
            int i2 = this.recursionLimit;
            this.recursionLimit = i;
            return i2;
        }
        StringBuilder sb = new StringBuilder(47);
        sb.append("Recursion limit cannot be negative: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public int setSizeLimit(int i) {
        if (i >= 0) {
            int i2 = this.sizeLimit;
            this.sizeLimit = i;
            return i2;
        }
        StringBuilder sb = new StringBuilder(42);
        sb.append("Size limit cannot be negative: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean skipField(int i) throws IOException {
        switch (WireFormatNano.getTagWireType(i)) {
            case 0:
                readInt32();
                return true;
            case 1:
                readRawLittleEndian64();
                return true;
            case 2:
                skipRawBytes(readRawVarint32());
                return true;
            case 3:
                skipMessage();
                checkLastTagWas(WireFormatNano.makeTag(WireFormatNano.getTagFieldNumber(i), 4));
                return true;
            case 4:
                return false;
            case 5:
                readRawLittleEndian32();
                return true;
            default:
                throw InvalidProtocolBufferNanoException.invalidWireType();
        }
    }

    public void skipMessage() throws IOException {
        while (true) {
            int readTag = readTag();
            if (readTag == 0 || !skipField(readTag)) {
                return;
            }
        }
    }

    public void skipRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        } else if (this.bufferPos + i > this.currentLimit) {
            skipRawBytes(this.currentLimit - this.bufferPos);
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        } else if (i <= this.maybeLimitedBufferSize - this.bufferPos) {
            this.bufferPos += i;
        } else {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
    }
}

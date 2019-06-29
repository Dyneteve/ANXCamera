package com.google.protobuf.nano;

import java.io.IOException;
import java.util.Arrays;

final class UnknownFieldData {
    final byte[] bytes;
    final int tag;

    UnknownFieldData(int i, byte[] bArr) {
        this.tag = i;
        this.bytes = bArr;
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSize() {
        return 0 + CodedOutputByteBufferNano.computeRawVarint32Size(this.tag) + this.bytes.length;
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSizeAsMessageSet() {
        return CodedOutputByteBufferNano.computeRawMessageSetExtensionSize(this.tag, this.bytes);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof UnknownFieldData)) {
            return false;
        }
        UnknownFieldData unknownFieldData = (UnknownFieldData) obj;
        if (this.tag != unknownFieldData.tag || !Arrays.equals(this.bytes, unknownFieldData.bytes)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return (31 * (527 + this.tag)) + Arrays.hashCode(this.bytes);
    }

    /* access modifiers changed from: 0000 */
    public void writeAsMessageSetTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeRawMessageSetExtension(this.tag, this.bytes);
    }

    /* access modifiers changed from: 0000 */
    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeRawVarint32(this.tag);
        codedOutputByteBufferNano.writeRawBytes(this.bytes);
    }
}

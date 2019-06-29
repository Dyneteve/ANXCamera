package com.google.protobuf.nano;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

class FieldData implements Cloneable {
    private Extension<?, ?> cachedExtension;
    private List<UnknownFieldData> unknownFieldData;
    private Object value;

    FieldData() {
        this.unknownFieldData = new ArrayList();
    }

    <T> FieldData(Extension<?, T> extension, T t) {
        this.cachedExtension = extension;
        this.value = t;
    }

    private byte[] toByteArray() throws IOException {
        byte[] bArr = new byte[computeSerializedSize()];
        writeTo(CodedOutputByteBufferNano.newInstance(bArr));
        return bArr;
    }

    /* access modifiers changed from: 0000 */
    public void addUnknownField(UnknownFieldData unknownFieldData2) throws IOException {
        Object obj;
        if (this.unknownFieldData != null) {
            this.unknownFieldData.add(unknownFieldData2);
            return;
        }
        if (this.value instanceof MessageNano) {
            byte[] bArr = unknownFieldData2.bytes;
            CodedInputByteBufferNano newInstance = CodedInputByteBufferNano.newInstance(bArr, 0, bArr.length);
            int readInt32 = newInstance.readInt32();
            if (readInt32 == bArr.length - CodedOutputByteBufferNano.computeInt32SizeNoTag(readInt32)) {
                obj = ((MessageNano) this.value).mergeFrom(newInstance);
            } else {
                throw InvalidProtocolBufferNanoException.truncatedMessage();
            }
        } else if (this.value instanceof MessageNano[]) {
            MessageNano[] messageNanoArr = (MessageNano[]) this.cachedExtension.getValueFrom(Collections.singletonList(unknownFieldData2));
            MessageNano[] messageNanoArr2 = (MessageNano[]) this.value;
            Object obj2 = (MessageNano[]) Arrays.copyOf(messageNanoArr2, messageNanoArr2.length + messageNanoArr.length);
            System.arraycopy(messageNanoArr, 0, obj2, messageNanoArr2.length, messageNanoArr.length);
            obj = obj2;
        } else {
            obj = this.cachedExtension.getValueFrom(Collections.singletonList(unknownFieldData2));
        }
        setValue(this.cachedExtension, obj);
    }

    public final FieldData clone() {
        FieldData fieldData = new FieldData();
        try {
            fieldData.cachedExtension = this.cachedExtension;
            if (this.unknownFieldData == null) {
                fieldData.unknownFieldData = null;
            } else {
                fieldData.unknownFieldData.addAll(this.unknownFieldData);
            }
            if (this.value != null) {
                if (this.value instanceof MessageNano) {
                    fieldData.value = ((MessageNano) this.value).clone();
                } else if (this.value instanceof byte[]) {
                    fieldData.value = ((byte[]) this.value).clone();
                } else {
                    int i = 0;
                    if (this.value instanceof byte[][]) {
                        byte[][] bArr = (byte[][]) this.value;
                        byte[][] bArr2 = new byte[bArr.length][];
                        fieldData.value = bArr2;
                        while (i < bArr.length) {
                            bArr2[i] = (byte[]) bArr[i].clone();
                            i++;
                        }
                    } else if (this.value instanceof boolean[]) {
                        fieldData.value = ((boolean[]) this.value).clone();
                    } else if (this.value instanceof int[]) {
                        fieldData.value = ((int[]) this.value).clone();
                    } else if (this.value instanceof long[]) {
                        fieldData.value = ((long[]) this.value).clone();
                    } else if (this.value instanceof float[]) {
                        fieldData.value = ((float[]) this.value).clone();
                    } else if (this.value instanceof double[]) {
                        fieldData.value = ((double[]) this.value).clone();
                    } else if (this.value instanceof MessageNano[]) {
                        MessageNano[] messageNanoArr = (MessageNano[]) this.value;
                        MessageNano[] messageNanoArr2 = new MessageNano[messageNanoArr.length];
                        fieldData.value = messageNanoArr2;
                        while (i < messageNanoArr.length) {
                            messageNanoArr2[i] = messageNanoArr[i].clone();
                            i++;
                        }
                    }
                }
            }
            return fieldData;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSize() {
        if (this.value != null) {
            return this.cachedExtension.computeSerializedSize(this.value);
        }
        int i = 0;
        for (UnknownFieldData computeSerializedSize : this.unknownFieldData) {
            i += computeSerializedSize.computeSerializedSize();
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSizeAsMessageSet() {
        if (this.value != null) {
            return this.cachedExtension.computeSerializedSizeAsMessageSet(this.value);
        }
        int i = 0;
        for (UnknownFieldData computeSerializedSizeAsMessageSet : this.unknownFieldData) {
            i += computeSerializedSizeAsMessageSet.computeSerializedSizeAsMessageSet();
        }
        return i;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FieldData)) {
            return false;
        }
        FieldData fieldData = (FieldData) obj;
        if (this.value == null || fieldData.value == null) {
            if (this.unknownFieldData != null && fieldData.unknownFieldData != null) {
                return this.unknownFieldData.equals(fieldData.unknownFieldData);
            }
            try {
                return Arrays.equals(toByteArray(), fieldData.toByteArray());
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        } else if (this.cachedExtension != fieldData.cachedExtension) {
            return false;
        } else {
            return !this.cachedExtension.clazz.isArray() ? this.value.equals(fieldData.value) : this.value instanceof byte[] ? Arrays.equals((byte[]) this.value, (byte[]) fieldData.value) : this.value instanceof int[] ? Arrays.equals((int[]) this.value, (int[]) fieldData.value) : this.value instanceof long[] ? Arrays.equals((long[]) this.value, (long[]) fieldData.value) : this.value instanceof float[] ? Arrays.equals((float[]) this.value, (float[]) fieldData.value) : this.value instanceof double[] ? Arrays.equals((double[]) this.value, (double[]) fieldData.value) : this.value instanceof boolean[] ? Arrays.equals((boolean[]) this.value, (boolean[]) fieldData.value) : Arrays.deepEquals((Object[]) this.value, (Object[]) fieldData.value);
        }
    }

    /* access modifiers changed from: 0000 */
    public UnknownFieldData getUnknownField(int i) {
        if (this.unknownFieldData != null && i < this.unknownFieldData.size()) {
            return (UnknownFieldData) this.unknownFieldData.get(i);
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public int getUnknownFieldSize() {
        if (this.unknownFieldData == null) {
            return 0;
        }
        return this.unknownFieldData.size();
    }

    /* access modifiers changed from: 0000 */
    public <T> T getValue(Extension<?, T> extension) {
        if (this.value == null) {
            this.cachedExtension = extension;
            this.value = extension.getValueFrom(this.unknownFieldData);
            this.unknownFieldData = null;
        } else if (!this.cachedExtension.equals(extension)) {
            throw new IllegalStateException("Tried to getExtension with a different Extension.");
        }
        return this.value;
    }

    public int hashCode() {
        try {
            return 527 + Arrays.hashCode(toByteArray());
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    /* access modifiers changed from: 0000 */
    public <T> void setValue(Extension<?, T> extension, T t) {
        this.cachedExtension = extension;
        this.value = t;
        this.unknownFieldData = null;
    }

    /* access modifiers changed from: 0000 */
    public void writeAsMessageSetTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.value != null) {
            this.cachedExtension.writeAsMessageSetTo(this.value, codedOutputByteBufferNano);
            return;
        }
        for (UnknownFieldData writeAsMessageSetTo : this.unknownFieldData) {
            writeAsMessageSetTo.writeAsMessageSetTo(codedOutputByteBufferNano);
        }
    }

    /* access modifiers changed from: 0000 */
    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.value != null) {
            this.cachedExtension.writeTo(this.value, codedOutputByteBufferNano);
            return;
        }
        for (UnknownFieldData writeTo : this.unknownFieldData) {
            writeTo.writeTo(codedOutputByteBufferNano);
        }
    }
}

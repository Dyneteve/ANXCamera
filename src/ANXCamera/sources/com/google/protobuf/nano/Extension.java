package com.google.protobuf.nano;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.MessageLite;
import com.google.protobuf.nano.ExtendableMessageNano;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class Extension<M extends ExtendableMessageNano<M>, T> {
    public static final int TYPE_BOOL = 8;
    public static final int TYPE_BYTES = 12;
    public static final int TYPE_DOUBLE = 1;
    public static final int TYPE_ENUM = 14;
    public static final int TYPE_FIXED32 = 7;
    public static final int TYPE_FIXED64 = 6;
    public static final int TYPE_FLOAT = 2;
    public static final int TYPE_GROUP = 10;
    public static final int TYPE_INT32 = 5;
    public static final int TYPE_INT64 = 3;
    public static final int TYPE_MESSAGE = 11;
    public static final int TYPE_SFIXED32 = 15;
    public static final int TYPE_SFIXED64 = 16;
    public static final int TYPE_SINT32 = 17;
    public static final int TYPE_SINT64 = 18;
    public static final int TYPE_STRING = 9;
    public static final int TYPE_UINT32 = 13;
    public static final int TYPE_UINT64 = 4;
    protected final Class<T> clazz;
    protected final GeneratedMessageLite<?, ?> defaultInstance;
    protected final boolean repeated;
    public final int tag;
    protected final int type;

    private static class PrimitiveExtension<M extends ExtendableMessageNano<M>, T> extends Extension<M, T> {
        private final int nonPackedTag;
        private final int packedTag;

        public PrimitiveExtension(int i, Class<T> cls, int i2, boolean z, int i3, int i4) {
            super(i, (Class) cls, i2, z);
            this.nonPackedTag = i3;
            this.packedTag = i4;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:26:0x009d, code lost:
            r0 = r0 * 4;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x00a0, code lost:
            r0 = r0 * 8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:36:?, code lost:
            return r0;
         */
        private int computePackedDataSize(Object obj) {
            int length = Array.getLength(obj);
            int i = this.type;
            int i2 = 0;
            switch (i) {
                case 1:
                case 6:
                    break;
                case 2:
                case 7:
                    break;
                case 3:
                    int i3 = 0;
                    while (i2 < length) {
                        i3 += CodedOutputByteBufferNano.computeInt64SizeNoTag(Array.getLong(obj, i2));
                        i2++;
                    }
                    return i3;
                case 4:
                    int i4 = 0;
                    while (i2 < length) {
                        i4 += CodedOutputByteBufferNano.computeUInt64SizeNoTag(Array.getLong(obj, i2));
                        i2++;
                    }
                    return i4;
                case 5:
                    int i5 = 0;
                    while (i2 < length) {
                        i5 += CodedOutputByteBufferNano.computeInt32SizeNoTag(Array.getInt(obj, i2));
                        i2++;
                    }
                    return i5;
                case 8:
                    break;
                default:
                    switch (i) {
                        case 13:
                            int i6 = 0;
                            while (i2 < length) {
                                i6 += CodedOutputByteBufferNano.computeUInt32SizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i6;
                        case 14:
                            int i7 = 0;
                            while (i2 < length) {
                                i7 += CodedOutputByteBufferNano.computeEnumSizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i7;
                        case 15:
                            break;
                        case 16:
                            break;
                        case 17:
                            int i8 = 0;
                            while (i2 < length) {
                                i8 += CodedOutputByteBufferNano.computeSInt32SizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i8;
                        case 18:
                            int i9 = 0;
                            while (i2 < length) {
                                i9 += CodedOutputByteBufferNano.computeSInt64SizeNoTag(Array.getLong(obj, i2));
                                i2++;
                            }
                            return i9;
                        default:
                            int i10 = this.type;
                            StringBuilder sb = new StringBuilder(40);
                            sb.append("Unexpected non-packable type ");
                            sb.append(i10);
                            throw new IllegalArgumentException(sb.toString());
                    }
            }
        }

        /* access modifiers changed from: protected */
        public int computeRepeatedSerializedSize(Object obj) {
            if (this.tag == this.nonPackedTag) {
                return Extension.super.computeRepeatedSerializedSize(obj);
            }
            if (this.tag == this.packedTag) {
                int computePackedDataSize = computePackedDataSize(obj);
                return computePackedDataSize + CodedOutputByteBufferNano.computeRawVarint32Size(computePackedDataSize) + CodedOutputByteBufferNano.computeRawVarint32Size(this.tag);
            }
            int i = this.tag;
            int i2 = this.nonPackedTag;
            int i3 = this.packedTag;
            StringBuilder sb = new StringBuilder(124);
            sb.append("Unexpected repeated extension tag ");
            sb.append(i);
            sb.append(", unequal to both non-packed variant ");
            sb.append(i2);
            sb.append(" and packed variant ");
            sb.append(i3);
            throw new IllegalArgumentException(sb.toString());
        }

        /* access modifiers changed from: protected */
        public final int computeSingularSerializedSize(Object obj) {
            int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
            switch (this.type) {
                case 1:
                    return CodedOutputByteBufferNano.computeDoubleSize(tagFieldNumber, ((Double) obj).doubleValue());
                case 2:
                    return CodedOutputByteBufferNano.computeFloatSize(tagFieldNumber, ((Float) obj).floatValue());
                case 3:
                    return CodedOutputByteBufferNano.computeInt64Size(tagFieldNumber, ((Long) obj).longValue());
                case 4:
                    return CodedOutputByteBufferNano.computeUInt64Size(tagFieldNumber, ((Long) obj).longValue());
                case 5:
                    return CodedOutputByteBufferNano.computeInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 6:
                    return CodedOutputByteBufferNano.computeFixed64Size(tagFieldNumber, ((Long) obj).longValue());
                case 7:
                    return CodedOutputByteBufferNano.computeFixed32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 8:
                    return CodedOutputByteBufferNano.computeBoolSize(tagFieldNumber, ((Boolean) obj).booleanValue());
                case 9:
                    return CodedOutputByteBufferNano.computeStringSize(tagFieldNumber, (String) obj);
                case 12:
                    return CodedOutputByteBufferNano.computeBytesSize(tagFieldNumber, (byte[]) obj);
                case 13:
                    return CodedOutputByteBufferNano.computeUInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 14:
                    return CodedOutputByteBufferNano.computeEnumSize(tagFieldNumber, ((Integer) obj).intValue());
                case 15:
                    return CodedOutputByteBufferNano.computeSFixed32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 16:
                    return CodedOutputByteBufferNano.computeSFixed64Size(tagFieldNumber, ((Long) obj).longValue());
                case 17:
                    return CodedOutputByteBufferNano.computeSInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 18:
                    return CodedOutputByteBufferNano.computeSInt64Size(tagFieldNumber, ((Long) obj).longValue());
                default:
                    int i = this.type;
                    StringBuilder sb = new StringBuilder(24);
                    sb.append("Unknown type ");
                    sb.append(i);
                    throw new IllegalArgumentException(sb.toString());
            }
        }

        /* access modifiers changed from: protected */
        public Object readData(CodedInputByteBufferNano codedInputByteBufferNano) {
            try {
                switch (this.type) {
                    case 1:
                        return Double.valueOf(codedInputByteBufferNano.readDouble());
                    case 2:
                        return Float.valueOf(codedInputByteBufferNano.readFloat());
                    case 3:
                        return Long.valueOf(codedInputByteBufferNano.readInt64());
                    case 4:
                        return Long.valueOf(codedInputByteBufferNano.readUInt64());
                    case 5:
                        return Integer.valueOf(codedInputByteBufferNano.readInt32());
                    case 6:
                        return Long.valueOf(codedInputByteBufferNano.readFixed64());
                    case 7:
                        return Integer.valueOf(codedInputByteBufferNano.readFixed32());
                    case 8:
                        return Boolean.valueOf(codedInputByteBufferNano.readBool());
                    case 9:
                        return codedInputByteBufferNano.readString();
                    case 12:
                        return codedInputByteBufferNano.readBytes();
                    case 13:
                        return Integer.valueOf(codedInputByteBufferNano.readUInt32());
                    case 14:
                        return Integer.valueOf(codedInputByteBufferNano.readEnum());
                    case 15:
                        return Integer.valueOf(codedInputByteBufferNano.readSFixed32());
                    case 16:
                        return Long.valueOf(codedInputByteBufferNano.readSFixed64());
                    case 17:
                        return Integer.valueOf(codedInputByteBufferNano.readSInt32());
                    case 18:
                        return Long.valueOf(codedInputByteBufferNano.readSInt64());
                    default:
                        int i = this.type;
                        StringBuilder sb = new StringBuilder(24);
                        sb.append("Unknown type ");
                        sb.append(i);
                        throw new IllegalArgumentException(sb.toString());
                }
            } catch (IOException e) {
                throw new IllegalArgumentException("Error reading extension field", e);
            }
        }

        /* access modifiers changed from: protected */
        public void readDataInto(UnknownFieldData unknownFieldData, List<Object> list) {
            if (unknownFieldData.tag == this.nonPackedTag) {
                list.add(readData(CodedInputByteBufferNano.newInstance(unknownFieldData.bytes)));
                return;
            }
            CodedInputByteBufferNano newInstance = CodedInputByteBufferNano.newInstance(unknownFieldData.bytes);
            try {
                newInstance.pushLimit(newInstance.readRawVarint32());
                while (!newInstance.isAtEnd()) {
                    list.add(readData(newInstance));
                }
            } catch (IOException e) {
                throw new IllegalArgumentException("Error reading extension field", e);
            }
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0045, code lost:
            if (r2 >= r0) goto L_0x0051;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0047, code lost:
            r7.writeSInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x0053, code lost:
            if (r2 >= r0) goto L_0x005f;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:16:0x0055, code lost:
            r7.writeSInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:18:0x0061, code lost:
            if (r2 >= r0) goto L_0x006d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0063, code lost:
            r7.writeSFixed64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:0x006f, code lost:
            if (r2 >= r0) goto L_0x007b;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x0071, code lost:
            r7.writeSFixed32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:24:0x007d, code lost:
            if (r2 >= r0) goto L_0x0089;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:25:0x007f, code lost:
            r7.writeEnumNoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x008b, code lost:
            if (r2 >= r0) goto L_0x0097;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:28:0x008d, code lost:
            r7.writeUInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:30:0x0099, code lost:
            if (r2 >= r0) goto L_0x00a5;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x009b, code lost:
            r7.writeBoolNoTag(java.lang.reflect.Array.getBoolean(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:33:0x00a6, code lost:
            if (r2 >= r0) goto L_0x00b2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:34:0x00a8, code lost:
            r7.writeFixed32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:36:0x00b3, code lost:
            if (r2 >= r0) goto L_0x00bf;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:37:0x00b5, code lost:
            r7.writeFixed64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:39:0x00c0, code lost:
            if (r2 >= r0) goto L_0x00cc;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:40:0x00c2, code lost:
            r7.writeInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:42:0x00cd, code lost:
            if (r2 >= r0) goto L_0x00d9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:43:0x00cf, code lost:
            r7.writeUInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:45:0x00da, code lost:
            if (r2 >= r0) goto L_0x00e6;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:46:0x00dc, code lost:
            r7.writeInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:48:0x00e7, code lost:
            if (r2 >= r0) goto L_0x00f3;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:49:0x00e9, code lost:
            r7.writeFloatNoTag(java.lang.reflect.Array.getFloat(r6, r2));
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:51:0x00f4, code lost:
            if (r2 >= r0) goto L_0x0103;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:52:0x00f6, code lost:
            r7.writeDoubleNoTag(java.lang.reflect.Array.getDouble(r6, r2));
         */
        /* JADX WARNING: Code restructure failed: missing block: B:53:0x00fd, code lost:
            r2 = r2 + 1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:74:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:75:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:76:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:77:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:78:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:79:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:80:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:81:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:82:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:83:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:84:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:85:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:86:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:87:?, code lost:
            return;
         */
        public void writeRepeatedData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
            if (this.tag == this.nonPackedTag) {
                Extension.super.writeRepeatedData(obj, codedOutputByteBufferNano);
            } else if (this.tag == this.packedTag) {
                int length = Array.getLength(obj);
                int computePackedDataSize = computePackedDataSize(obj);
                try {
                    codedOutputByteBufferNano.writeRawVarint32(this.tag);
                    codedOutputByteBufferNano.writeRawVarint32(computePackedDataSize);
                    int i = this.type;
                    int i2 = 0;
                    switch (i) {
                        case 1:
                            break;
                        case 2:
                            break;
                        case 3:
                            break;
                        case 4:
                            break;
                        case 5:
                            break;
                        case 6:
                            break;
                        case 7:
                            break;
                        case 8:
                            break;
                        default:
                            switch (i) {
                                case 13:
                                    break;
                                case 14:
                                    break;
                                case 15:
                                    break;
                                case 16:
                                    break;
                                case 17:
                                    break;
                                case 18:
                                    break;
                                default:
                                    int i3 = this.type;
                                    StringBuilder sb = new StringBuilder(27);
                                    sb.append("Unpackable type ");
                                    sb.append(i3);
                                    throw new IllegalArgumentException(sb.toString());
                            }
                    }
                } catch (IOException e) {
                    throw new IllegalStateException(e);
                }
            } else {
                int i4 = this.tag;
                int i5 = this.nonPackedTag;
                int i6 = this.packedTag;
                StringBuilder sb2 = new StringBuilder(124);
                sb2.append("Unexpected repeated extension tag ");
                sb2.append(i4);
                sb2.append(", unequal to both non-packed variant ");
                sb2.append(i5);
                sb2.append(" and packed variant ");
                sb2.append(i6);
                throw new IllegalArgumentException(sb2.toString());
            }
        }

        /* access modifiers changed from: protected */
        public final void writeSingularData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
            try {
                codedOutputByteBufferNano.writeRawVarint32(this.tag);
                switch (this.type) {
                    case 1:
                        codedOutputByteBufferNano.writeDoubleNoTag(((Double) obj).doubleValue());
                        return;
                    case 2:
                        codedOutputByteBufferNano.writeFloatNoTag(((Float) obj).floatValue());
                        return;
                    case 3:
                        codedOutputByteBufferNano.writeInt64NoTag(((Long) obj).longValue());
                        return;
                    case 4:
                        codedOutputByteBufferNano.writeUInt64NoTag(((Long) obj).longValue());
                        return;
                    case 5:
                        codedOutputByteBufferNano.writeInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 6:
                        codedOutputByteBufferNano.writeFixed64NoTag(((Long) obj).longValue());
                        return;
                    case 7:
                        codedOutputByteBufferNano.writeFixed32NoTag(((Integer) obj).intValue());
                        return;
                    case 8:
                        codedOutputByteBufferNano.writeBoolNoTag(((Boolean) obj).booleanValue());
                        return;
                    case 9:
                        codedOutputByteBufferNano.writeStringNoTag((String) obj);
                        return;
                    case 12:
                        codedOutputByteBufferNano.writeBytesNoTag((byte[]) obj);
                        return;
                    case 13:
                        codedOutputByteBufferNano.writeUInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 14:
                        codedOutputByteBufferNano.writeEnumNoTag(((Integer) obj).intValue());
                        return;
                    case 15:
                        codedOutputByteBufferNano.writeSFixed32NoTag(((Integer) obj).intValue());
                        return;
                    case 16:
                        codedOutputByteBufferNano.writeSFixed64NoTag(((Long) obj).longValue());
                        return;
                    case 17:
                        codedOutputByteBufferNano.writeSInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 18:
                        codedOutputByteBufferNano.writeSInt64NoTag(((Long) obj).longValue());
                        return;
                    default:
                        int i = this.type;
                        StringBuilder sb = new StringBuilder(24);
                        sb.append("Unknown type ");
                        sb.append(i);
                        throw new IllegalArgumentException(sb.toString());
                }
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    private Extension(int i, Class<T> cls, int i2, boolean z) {
        this(i, cls, null, i2, z);
    }

    private Extension(int i, Class<T> cls, GeneratedMessageLite<?, ?> generatedMessageLite, int i2, boolean z) {
        this.type = i;
        this.clazz = cls;
        this.tag = i2;
        this.repeated = z;
        this.defaultInstance = generatedMessageLite;
    }

    public static <M extends ExtendableMessageNano<M>, T extends GeneratedMessageLite<?, ?>> Extension<M, T> createMessageLiteTyped(int i, Class<T> cls, T t, long j) {
        Extension extension = new Extension(i, cls, (GeneratedMessageLite<?, ?>) t, (int) j, false);
        return extension;
    }

    @Deprecated
    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T> createMessageTyped(int i, Class<T> cls, int i2) {
        return new Extension<>(i, cls, i2, false);
    }

    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T> createMessageTyped(int i, Class<T> cls, long j) {
        return new Extension<>(i, cls, (int) j, false);
    }

    public static <M extends ExtendableMessageNano<M>, T> Extension<M, T> createPrimitiveTyped(int i, Class<T> cls, long j) {
        PrimitiveExtension primitiveExtension = new PrimitiveExtension(i, cls, (int) j, false, 0, 0);
        return primitiveExtension;
    }

    public static <M extends ExtendableMessageNano<M>, T extends GeneratedMessageLite<?, ?>> Extension<M, T[]> createRepeatedMessageLiteTyped(int i, Class<T[]> cls, T t, long j) {
        Extension extension = new Extension(i, cls, (GeneratedMessageLite<?, ?>) t, (int) j, true);
        return extension;
    }

    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T[]> createRepeatedMessageTyped(int i, Class<T[]> cls, long j) {
        return new Extension<>(i, cls, (int) j, true);
    }

    public static <M extends ExtendableMessageNano<M>, T> Extension<M, T> createRepeatedPrimitiveTyped(int i, Class<T> cls, long j, long j2, long j3) {
        PrimitiveExtension primitiveExtension = new PrimitiveExtension(i, cls, (int) j, true, (int) j2, (int) j3);
        return primitiveExtension;
    }

    private T getRepeatedValueFrom(List<UnknownFieldData> list) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            UnknownFieldData unknownFieldData = (UnknownFieldData) list.get(i);
            if (unknownFieldData.bytes.length != 0) {
                readDataInto(unknownFieldData, arrayList);
            }
        }
        int size = arrayList.size();
        if (size == 0) {
            return null;
        }
        T cast = this.clazz.cast(Array.newInstance(this.clazz.getComponentType(), size));
        for (int i2 = 0; i2 < size; i2++) {
            Array.set(cast, i2, arrayList.get(i2));
        }
        return cast;
    }

    private T getSingularValueFrom(List<UnknownFieldData> list) {
        if (list.isEmpty()) {
            return null;
        }
        return this.clazz.cast(readData(CodedInputByteBufferNano.newInstance(((UnknownFieldData) list.get(list.size() - 1)).bytes)));
    }

    /* access modifiers changed from: protected */
    public int computeRepeatedSerializedSize(Object obj) {
        int length = Array.getLength(obj);
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            if (Array.get(obj, i2) != null) {
                i += computeSingularSerializedSize(Array.get(obj, i2));
            }
        }
        return i;
    }

    /* access modifiers changed from: protected */
    public int computeRepeatedSerializedSizeAsMessageSet(Object obj) {
        int length = Array.getLength(obj);
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            if (Array.get(obj, i2) != null) {
                i += computeSingularSerializedSizeAsMessageSet(Array.get(obj, i2));
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSize(Object obj) {
        return this.repeated ? computeRepeatedSerializedSize(obj) : computeSingularSerializedSize(obj);
    }

    /* access modifiers changed from: 0000 */
    public int computeSerializedSizeAsMessageSet(Object obj) {
        return this.repeated ? computeRepeatedSerializedSizeAsMessageSet(obj) : computeSingularSerializedSizeAsMessageSet(obj);
    }

    /* access modifiers changed from: protected */
    public int computeSingularSerializedSize(Object obj) {
        int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
        switch (this.type) {
            case 10:
                return this.defaultInstance == null ? CodedOutputByteBufferNano.computeGroupSize(tagFieldNumber, (MessageNano) obj) : CodedOutputStream.computeGroupSize(tagFieldNumber, (MessageLite) obj);
            case 11:
                return this.defaultInstance == null ? CodedOutputByteBufferNano.computeMessageSize(tagFieldNumber, (MessageNano) obj) : CodedOutputStream.computeMessageSize(tagFieldNumber, (MessageLite) obj);
            default:
                int i = this.type;
                StringBuilder sb = new StringBuilder(24);
                sb.append("Unknown type ");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    /* access modifiers changed from: protected */
    public int computeSingularSerializedSizeAsMessageSet(Object obj) {
        return CodedOutputByteBufferNano.computeMessageSetExtensionSize(WireFormatNano.getTagFieldNumber(this.tag), (MessageNano) obj);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Extension)) {
            return false;
        }
        Extension extension = (Extension) obj;
        if (!(this.type == extension.type && this.clazz == extension.clazz && this.tag == extension.tag && this.repeated == extension.repeated)) {
            z = false;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public final T getValueFrom(List<UnknownFieldData> list) {
        if (list == null) {
            return null;
        }
        return this.repeated ? getRepeatedValueFrom(list) : getSingularValueFrom(list);
    }

    public int hashCode() {
        return (31 * (((((1147 + this.type) * 31) + this.clazz.hashCode()) * 31) + this.tag)) + (this.repeated ? 1 : 0);
    }

    /* access modifiers changed from: protected */
    public Object readData(CodedInputByteBufferNano codedInputByteBufferNano) {
        Class<T> componentType = this.repeated ? this.clazz.getComponentType() : this.clazz;
        try {
            switch (this.type) {
                case 10:
                    MessageNano messageNano = (MessageNano) componentType.newInstance();
                    codedInputByteBufferNano.readGroup(messageNano, WireFormatNano.getTagFieldNumber(this.tag));
                    return messageNano;
                case 11:
                    if (this.defaultInstance != null) {
                        return codedInputByteBufferNano.readMessageLite(this.defaultInstance.getParserForType());
                    }
                    MessageNano messageNano2 = (MessageNano) componentType.newInstance();
                    codedInputByteBufferNano.readMessage(messageNano2);
                    return messageNano2;
                default:
                    int i = this.type;
                    StringBuilder sb = new StringBuilder(24);
                    sb.append("Unknown type ");
                    sb.append(i);
                    throw new IllegalArgumentException(sb.toString());
            }
        } catch (InstantiationException e) {
            String valueOf = String.valueOf(componentType);
            StringBuilder sb2 = new StringBuilder(33 + String.valueOf(valueOf).length());
            sb2.append("Error creating instance of class ");
            sb2.append(valueOf);
            throw new IllegalArgumentException(sb2.toString(), e);
        } catch (IllegalAccessException e2) {
            String valueOf2 = String.valueOf(componentType);
            StringBuilder sb3 = new StringBuilder(33 + String.valueOf(valueOf2).length());
            sb3.append("Error creating instance of class ");
            sb3.append(valueOf2);
            throw new IllegalArgumentException(sb3.toString(), e2);
        } catch (IOException e3) {
            throw new IllegalArgumentException("Error reading extension field", e3);
        }
    }

    /* access modifiers changed from: protected */
    public void readDataInto(UnknownFieldData unknownFieldData, List<Object> list) {
        list.add(readData(CodedInputByteBufferNano.newInstance(unknownFieldData.bytes)));
    }

    /* access modifiers changed from: 0000 */
    public void writeAsMessageSetTo(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.repeated) {
            writeRepeatedDataAsMessageSet(obj, codedOutputByteBufferNano);
        } else {
            writeSingularDataAsMessageSet(obj, codedOutputByteBufferNano);
        }
    }

    /* access modifiers changed from: protected */
    public void writeRepeatedData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            Object obj2 = Array.get(obj, i);
            if (obj2 != null) {
                writeSingularData(obj2, codedOutputByteBufferNano);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void writeRepeatedDataAsMessageSet(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            Object obj2 = Array.get(obj, i);
            if (obj2 != null) {
                writeSingularDataAsMessageSet(obj2, codedOutputByteBufferNano);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void writeSingularData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
        try {
            codedOutputByteBufferNano.writeRawVarint32(this.tag);
            switch (this.type) {
                case 10:
                    int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
                    if (this.defaultInstance == null) {
                        codedOutputByteBufferNano.writeGroupNoTag((MessageNano) obj);
                    } else {
                        codedOutputByteBufferNano.writeGroupNoTag((MessageLite) obj);
                    }
                    codedOutputByteBufferNano.writeTag(tagFieldNumber, 4);
                    return;
                case 11:
                    if (this.defaultInstance == null) {
                        codedOutputByteBufferNano.writeMessageNoTag((MessageNano) obj);
                        return;
                    } else {
                        codedOutputByteBufferNano.writeMessageNoTag((MessageLite) obj);
                        return;
                    }
                default:
                    int i = this.type;
                    StringBuilder sb = new StringBuilder(24);
                    sb.append("Unknown type ");
                    sb.append(i);
                    throw new IllegalArgumentException(sb.toString());
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    /* access modifiers changed from: protected */
    public void writeSingularDataAsMessageSet(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeMessageSetExtension(WireFormatNano.getTagFieldNumber(this.tag), (MessageNano) obj);
    }

    /* access modifiers changed from: 0000 */
    public void writeTo(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.repeated) {
            writeRepeatedData(obj, codedOutputByteBufferNano);
        } else {
            writeSingularData(obj, codedOutputByteBufferNano);
        }
    }
}

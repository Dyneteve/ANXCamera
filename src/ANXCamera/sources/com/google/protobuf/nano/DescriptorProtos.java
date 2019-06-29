package com.google.protobuf.nano;

import java.io.IOException;
import java.util.Arrays;

public abstract class DescriptorProtos {

    public static final class DescriptorProto extends ExtendableMessageNano<DescriptorProto> {
        private static volatile DescriptorProto[] _emptyArray;
        public EnumDescriptorProto[] enumType;
        public FieldDescriptorProto[] extension;
        public ExtensionRange[] extensionRange;
        public FieldDescriptorProto[] field;
        public String name;
        public DescriptorProto[] nestedType;
        public OneofDescriptorProto[] oneofDecl;
        public MessageOptions options;
        public String[] reservedName;
        public ReservedRange[] reservedRange;

        public static final class ExtensionRange extends ExtendableMessageNano<ExtensionRange> {
            private static volatile ExtensionRange[] _emptyArray;
            public int end;
            public ExtensionRangeOptions options;
            public int start;

            public ExtensionRange() {
                clear();
            }

            public static ExtensionRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new ExtensionRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static ExtensionRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new ExtensionRange().mergeFrom(codedInputByteBufferNano);
            }

            public static ExtensionRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (ExtensionRange) MessageNano.mergeFrom(new ExtensionRange(), bArr);
            }

            public ExtensionRange clear() {
                this.start = 0;
                this.end = 0;
                this.options = null;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                if (this.end != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.end);
                }
                return this.options != null ? computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(3, this.options) : computeSerializedSize;
            }

            public ExtensionRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 26) {
                        if (this.options == null) {
                            this.options = new ExtensionRangeOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                if (this.options != null) {
                    codedOutputByteBufferNano.writeMessage(3, this.options);
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public static final class ReservedRange extends ExtendableMessageNano<ReservedRange> {
            private static volatile ReservedRange[] _emptyArray;
            public int end;
            public int start;

            public ReservedRange() {
                clear();
            }

            public static ReservedRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new ReservedRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static ReservedRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new ReservedRange().mergeFrom(codedInputByteBufferNano);
            }

            public static ReservedRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (ReservedRange) MessageNano.mergeFrom(new ReservedRange(), bArr);
            }

            public ReservedRange clear() {
                this.start = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                return this.end != 0 ? computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(2, this.end) : computeSerializedSize;
            }

            public ReservedRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public DescriptorProto() {
            clear();
        }

        public static DescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new DescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static DescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new DescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static DescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (DescriptorProto) MessageNano.mergeFrom(new DescriptorProto(), bArr);
        }

        public DescriptorProto clear() {
            this.name = "";
            this.field = FieldDescriptorProto.emptyArray();
            this.extension = FieldDescriptorProto.emptyArray();
            this.nestedType = emptyArray();
            this.enumType = EnumDescriptorProto.emptyArray();
            this.extensionRange = ExtensionRange.emptyArray();
            this.oneofDecl = OneofDescriptorProto.emptyArray();
            this.options = null;
            this.reservedRange = ReservedRange.emptyArray();
            this.reservedName = WireFormatNano.EMPTY_STRING_ARRAY;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.field != null && this.field.length > 0) {
                int i = computeSerializedSize;
                for (FieldDescriptorProto fieldDescriptorProto : this.field) {
                    if (fieldDescriptorProto != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(2, fieldDescriptorProto);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.nestedType != null && this.nestedType.length > 0) {
                int i2 = computeSerializedSize;
                for (DescriptorProto descriptorProto : this.nestedType) {
                    if (descriptorProto != null) {
                        i2 += CodedOutputByteBufferNano.computeMessageSize(3, descriptorProto);
                    }
                }
                computeSerializedSize = i2;
            }
            if (this.enumType != null && this.enumType.length > 0) {
                int i3 = computeSerializedSize;
                for (EnumDescriptorProto enumDescriptorProto : this.enumType) {
                    if (enumDescriptorProto != null) {
                        i3 += CodedOutputByteBufferNano.computeMessageSize(4, enumDescriptorProto);
                    }
                }
                computeSerializedSize = i3;
            }
            if (this.extensionRange != null && this.extensionRange.length > 0) {
                int i4 = computeSerializedSize;
                for (ExtensionRange extensionRange2 : this.extensionRange) {
                    if (extensionRange2 != null) {
                        i4 += CodedOutputByteBufferNano.computeMessageSize(5, extensionRange2);
                    }
                }
                computeSerializedSize = i4;
            }
            if (this.extension != null && this.extension.length > 0) {
                int i5 = computeSerializedSize;
                for (FieldDescriptorProto fieldDescriptorProto2 : this.extension) {
                    if (fieldDescriptorProto2 != null) {
                        i5 += CodedOutputByteBufferNano.computeMessageSize(6, fieldDescriptorProto2);
                    }
                }
                computeSerializedSize = i5;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(7, this.options);
            }
            if (this.oneofDecl != null && this.oneofDecl.length > 0) {
                int i6 = computeSerializedSize;
                for (OneofDescriptorProto oneofDescriptorProto : this.oneofDecl) {
                    if (oneofDescriptorProto != null) {
                        i6 += CodedOutputByteBufferNano.computeMessageSize(8, oneofDescriptorProto);
                    }
                }
                computeSerializedSize = i6;
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                int i7 = computeSerializedSize;
                for (ReservedRange reservedRange2 : this.reservedRange) {
                    if (reservedRange2 != null) {
                        i7 += CodedOutputByteBufferNano.computeMessageSize(9, reservedRange2);
                    }
                }
                computeSerializedSize = i7;
            }
            if (this.reservedName == null || this.reservedName.length <= 0) {
                return computeSerializedSize;
            }
            int i8 = 0;
            int i9 = 0;
            for (String str : this.reservedName) {
                if (str != null) {
                    i9++;
                    i8 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                }
            }
            return computeSerializedSize + i8 + (1 * i9);
        }

        public DescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                        int length = this.field == null ? 0 : this.field.length;
                        FieldDescriptorProto[] fieldDescriptorProtoArr = new FieldDescriptorProto[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.field, 0, fieldDescriptorProtoArr, 0, length);
                        }
                        while (length < fieldDescriptorProtoArr.length - 1) {
                            fieldDescriptorProtoArr[length] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr[length]);
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        fieldDescriptorProtoArr[length] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr[length]);
                        this.field = fieldDescriptorProtoArr;
                        break;
                    case 26:
                        int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 26);
                        int length2 = this.nestedType == null ? 0 : this.nestedType.length;
                        DescriptorProto[] descriptorProtoArr = new DescriptorProto[(repeatedFieldArrayLength2 + length2)];
                        if (length2 != 0) {
                            System.arraycopy(this.nestedType, 0, descriptorProtoArr, 0, length2);
                        }
                        while (length2 < descriptorProtoArr.length - 1) {
                            descriptorProtoArr[length2] = new DescriptorProto();
                            codedInputByteBufferNano.readMessage(descriptorProtoArr[length2]);
                            codedInputByteBufferNano.readTag();
                            length2++;
                        }
                        descriptorProtoArr[length2] = new DescriptorProto();
                        codedInputByteBufferNano.readMessage(descriptorProtoArr[length2]);
                        this.nestedType = descriptorProtoArr;
                        break;
                    case 34:
                        int repeatedFieldArrayLength3 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                        int length3 = this.enumType == null ? 0 : this.enumType.length;
                        EnumDescriptorProto[] enumDescriptorProtoArr = new EnumDescriptorProto[(repeatedFieldArrayLength3 + length3)];
                        if (length3 != 0) {
                            System.arraycopy(this.enumType, 0, enumDescriptorProtoArr, 0, length3);
                        }
                        while (length3 < enumDescriptorProtoArr.length - 1) {
                            enumDescriptorProtoArr[length3] = new EnumDescriptorProto();
                            codedInputByteBufferNano.readMessage(enumDescriptorProtoArr[length3]);
                            codedInputByteBufferNano.readTag();
                            length3++;
                        }
                        enumDescriptorProtoArr[length3] = new EnumDescriptorProto();
                        codedInputByteBufferNano.readMessage(enumDescriptorProtoArr[length3]);
                        this.enumType = enumDescriptorProtoArr;
                        break;
                    case 42:
                        int repeatedFieldArrayLength4 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                        int length4 = this.extensionRange == null ? 0 : this.extensionRange.length;
                        ExtensionRange[] extensionRangeArr = new ExtensionRange[(repeatedFieldArrayLength4 + length4)];
                        if (length4 != 0) {
                            System.arraycopy(this.extensionRange, 0, extensionRangeArr, 0, length4);
                        }
                        while (length4 < extensionRangeArr.length - 1) {
                            extensionRangeArr[length4] = new ExtensionRange();
                            codedInputByteBufferNano.readMessage(extensionRangeArr[length4]);
                            codedInputByteBufferNano.readTag();
                            length4++;
                        }
                        extensionRangeArr[length4] = new ExtensionRange();
                        codedInputByteBufferNano.readMessage(extensionRangeArr[length4]);
                        this.extensionRange = extensionRangeArr;
                        break;
                    case 50:
                        int repeatedFieldArrayLength5 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        int length5 = this.extension == null ? 0 : this.extension.length;
                        FieldDescriptorProto[] fieldDescriptorProtoArr2 = new FieldDescriptorProto[(repeatedFieldArrayLength5 + length5)];
                        if (length5 != 0) {
                            System.arraycopy(this.extension, 0, fieldDescriptorProtoArr2, 0, length5);
                        }
                        while (length5 < fieldDescriptorProtoArr2.length - 1) {
                            fieldDescriptorProtoArr2[length5] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr2[length5]);
                            codedInputByteBufferNano.readTag();
                            length5++;
                        }
                        fieldDescriptorProtoArr2[length5] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr2[length5]);
                        this.extension = fieldDescriptorProtoArr2;
                        break;
                    case 58:
                        if (this.options == null) {
                            this.options = new MessageOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 66:
                        int repeatedFieldArrayLength6 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 66);
                        int length6 = this.oneofDecl == null ? 0 : this.oneofDecl.length;
                        OneofDescriptorProto[] oneofDescriptorProtoArr = new OneofDescriptorProto[(repeatedFieldArrayLength6 + length6)];
                        if (length6 != 0) {
                            System.arraycopy(this.oneofDecl, 0, oneofDescriptorProtoArr, 0, length6);
                        }
                        while (length6 < oneofDescriptorProtoArr.length - 1) {
                            oneofDescriptorProtoArr[length6] = new OneofDescriptorProto();
                            codedInputByteBufferNano.readMessage(oneofDescriptorProtoArr[length6]);
                            codedInputByteBufferNano.readTag();
                            length6++;
                        }
                        oneofDescriptorProtoArr[length6] = new OneofDescriptorProto();
                        codedInputByteBufferNano.readMessage(oneofDescriptorProtoArr[length6]);
                        this.oneofDecl = oneofDescriptorProtoArr;
                        break;
                    case 74:
                        int repeatedFieldArrayLength7 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 74);
                        int length7 = this.reservedRange == null ? 0 : this.reservedRange.length;
                        ReservedRange[] reservedRangeArr = new ReservedRange[(repeatedFieldArrayLength7 + length7)];
                        if (length7 != 0) {
                            System.arraycopy(this.reservedRange, 0, reservedRangeArr, 0, length7);
                        }
                        while (length7 < reservedRangeArr.length - 1) {
                            reservedRangeArr[length7] = new ReservedRange();
                            codedInputByteBufferNano.readMessage(reservedRangeArr[length7]);
                            codedInputByteBufferNano.readTag();
                            length7++;
                        }
                        reservedRangeArr[length7] = new ReservedRange();
                        codedInputByteBufferNano.readMessage(reservedRangeArr[length7]);
                        this.reservedRange = reservedRangeArr;
                        break;
                    case 82:
                        int repeatedFieldArrayLength8 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 82);
                        int length8 = this.reservedName == null ? 0 : this.reservedName.length;
                        String[] strArr = new String[(repeatedFieldArrayLength8 + length8)];
                        if (length8 != 0) {
                            System.arraycopy(this.reservedName, 0, strArr, 0, length8);
                        }
                        while (length8 < strArr.length - 1) {
                            strArr[length8] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            length8++;
                        }
                        strArr[length8] = codedInputByteBufferNano.readString();
                        this.reservedName = strArr;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.field != null && this.field.length > 0) {
                for (FieldDescriptorProto fieldDescriptorProto : this.field) {
                    if (fieldDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(2, fieldDescriptorProto);
                    }
                }
            }
            if (this.nestedType != null && this.nestedType.length > 0) {
                for (DescriptorProto descriptorProto : this.nestedType) {
                    if (descriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(3, descriptorProto);
                    }
                }
            }
            if (this.enumType != null && this.enumType.length > 0) {
                for (EnumDescriptorProto enumDescriptorProto : this.enumType) {
                    if (enumDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(4, enumDescriptorProto);
                    }
                }
            }
            if (this.extensionRange != null && this.extensionRange.length > 0) {
                for (ExtensionRange extensionRange2 : this.extensionRange) {
                    if (extensionRange2 != null) {
                        codedOutputByteBufferNano.writeMessage(5, extensionRange2);
                    }
                }
            }
            if (this.extension != null && this.extension.length > 0) {
                for (FieldDescriptorProto fieldDescriptorProto2 : this.extension) {
                    if (fieldDescriptorProto2 != null) {
                        codedOutputByteBufferNano.writeMessage(6, fieldDescriptorProto2);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(7, this.options);
            }
            if (this.oneofDecl != null && this.oneofDecl.length > 0) {
                for (OneofDescriptorProto oneofDescriptorProto : this.oneofDecl) {
                    if (oneofDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(8, oneofDescriptorProto);
                    }
                }
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                for (ReservedRange reservedRange2 : this.reservedRange) {
                    if (reservedRange2 != null) {
                        codedOutputByteBufferNano.writeMessage(9, reservedRange2);
                    }
                }
            }
            if (this.reservedName != null && this.reservedName.length > 0) {
                for (String str : this.reservedName) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(10, str);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class EnumDescriptorProto extends ExtendableMessageNano<EnumDescriptorProto> {
        private static volatile EnumDescriptorProto[] _emptyArray;
        public String name;
        public EnumOptions options;
        public String[] reservedName;
        public EnumReservedRange[] reservedRange;
        public EnumValueDescriptorProto[] value;

        public static final class EnumReservedRange extends ExtendableMessageNano<EnumReservedRange> {
            private static volatile EnumReservedRange[] _emptyArray;
            public int end;
            public int start;

            public EnumReservedRange() {
                clear();
            }

            public static EnumReservedRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new EnumReservedRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static EnumReservedRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new EnumReservedRange().mergeFrom(codedInputByteBufferNano);
            }

            public static EnumReservedRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (EnumReservedRange) MessageNano.mergeFrom(new EnumReservedRange(), bArr);
            }

            public EnumReservedRange clear() {
                this.start = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                return this.end != 0 ? computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(2, this.end) : computeSerializedSize;
            }

            public EnumReservedRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public EnumDescriptorProto() {
            clear();
        }

        public static EnumDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static EnumDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static EnumDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumDescriptorProto) MessageNano.mergeFrom(new EnumDescriptorProto(), bArr);
        }

        public EnumDescriptorProto clear() {
            this.name = "";
            this.value = EnumValueDescriptorProto.emptyArray();
            this.options = null;
            this.reservedRange = EnumReservedRange.emptyArray();
            this.reservedName = WireFormatNano.EMPTY_STRING_ARRAY;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.value != null && this.value.length > 0) {
                int i = computeSerializedSize;
                for (EnumValueDescriptorProto enumValueDescriptorProto : this.value) {
                    if (enumValueDescriptorProto != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(2, enumValueDescriptorProto);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(3, this.options);
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                int i2 = computeSerializedSize;
                for (EnumReservedRange enumReservedRange : this.reservedRange) {
                    if (enumReservedRange != null) {
                        i2 += CodedOutputByteBufferNano.computeMessageSize(4, enumReservedRange);
                    }
                }
                computeSerializedSize = i2;
            }
            if (this.reservedName == null || this.reservedName.length <= 0) {
                return computeSerializedSize;
            }
            int i3 = 0;
            int i4 = 0;
            for (String str : this.reservedName) {
                if (str != null) {
                    i4++;
                    i3 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                }
            }
            return computeSerializedSize + i3 + (1 * i4);
        }

        public EnumDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    int length = this.value == null ? 0 : this.value.length;
                    EnumValueDescriptorProto[] enumValueDescriptorProtoArr = new EnumValueDescriptorProto[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.value, 0, enumValueDescriptorProtoArr, 0, length);
                    }
                    while (length < enumValueDescriptorProtoArr.length - 1) {
                        enumValueDescriptorProtoArr[length] = new EnumValueDescriptorProto();
                        codedInputByteBufferNano.readMessage(enumValueDescriptorProtoArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    enumValueDescriptorProtoArr[length] = new EnumValueDescriptorProto();
                    codedInputByteBufferNano.readMessage(enumValueDescriptorProtoArr[length]);
                    this.value = enumValueDescriptorProtoArr;
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new EnumOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 34) {
                    int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    int length2 = this.reservedRange == null ? 0 : this.reservedRange.length;
                    EnumReservedRange[] enumReservedRangeArr = new EnumReservedRange[(repeatedFieldArrayLength2 + length2)];
                    if (length2 != 0) {
                        System.arraycopy(this.reservedRange, 0, enumReservedRangeArr, 0, length2);
                    }
                    while (length2 < enumReservedRangeArr.length - 1) {
                        enumReservedRangeArr[length2] = new EnumReservedRange();
                        codedInputByteBufferNano.readMessage(enumReservedRangeArr[length2]);
                        codedInputByteBufferNano.readTag();
                        length2++;
                    }
                    enumReservedRangeArr[length2] = new EnumReservedRange();
                    codedInputByteBufferNano.readMessage(enumReservedRangeArr[length2]);
                    this.reservedRange = enumReservedRangeArr;
                } else if (readTag == 42) {
                    int repeatedFieldArrayLength3 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                    int length3 = this.reservedName == null ? 0 : this.reservedName.length;
                    String[] strArr = new String[(repeatedFieldArrayLength3 + length3)];
                    if (length3 != 0) {
                        System.arraycopy(this.reservedName, 0, strArr, 0, length3);
                    }
                    while (length3 < strArr.length - 1) {
                        strArr[length3] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        length3++;
                    }
                    strArr[length3] = codedInputByteBufferNano.readString();
                    this.reservedName = strArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.value != null && this.value.length > 0) {
                for (EnumValueDescriptorProto enumValueDescriptorProto : this.value) {
                    if (enumValueDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(2, enumValueDescriptorProto);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                for (EnumReservedRange enumReservedRange : this.reservedRange) {
                    if (enumReservedRange != null) {
                        codedOutputByteBufferNano.writeMessage(4, enumReservedRange);
                    }
                }
            }
            if (this.reservedName != null && this.reservedName.length > 0) {
                for (String str : this.reservedName) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(5, str);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class EnumOptions extends ExtendableMessageNano<EnumOptions> {
        private static volatile EnumOptions[] _emptyArray;
        public boolean allowAlias;
        public boolean deprecated;
        public String proto1Name;
        public UninterpretedOption[] uninterpretedOption;

        public EnumOptions() {
            clear();
        }

        public static EnumOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static EnumOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static EnumOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumOptions) MessageNano.mergeFrom(new EnumOptions(), bArr);
        }

        public EnumOptions clear() {
            this.proto1Name = "";
            this.allowAlias = false;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.proto1Name != null && !this.proto1Name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.proto1Name);
            }
            if (this.allowAlias) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.allowAlias);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public EnumOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.proto1Name = codedInputByteBufferNano.readString();
                } else if (readTag == 16) {
                    this.allowAlias = codedInputByteBufferNano.readBool();
                } else if (readTag == 24) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                    }
                    while (length < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    uninterpretedOptionArr[length] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.proto1Name != null && !this.proto1Name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.proto1Name);
            }
            if (this.allowAlias) {
                codedOutputByteBufferNano.writeBool(2, this.allowAlias);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class EnumValueDescriptorProto extends ExtendableMessageNano<EnumValueDescriptorProto> {
        private static volatile EnumValueDescriptorProto[] _emptyArray;
        public String name;
        public int number;
        public EnumValueOptions options;

        public EnumValueDescriptorProto() {
            clear();
        }

        public static EnumValueDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumValueDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static EnumValueDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumValueDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static EnumValueDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumValueDescriptorProto) MessageNano.mergeFrom(new EnumValueDescriptorProto(), bArr);
        }

        public EnumValueDescriptorProto clear() {
            this.name = "";
            this.number = 0;
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.number != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.number);
            }
            return this.options != null ? computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(3, this.options) : computeSerializedSize;
        }

        public EnumValueDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 16) {
                    this.number = codedInputByteBufferNano.readInt32();
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new EnumValueOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.number != 0) {
                codedOutputByteBufferNano.writeInt32(2, this.number);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class EnumValueOptions extends ExtendableMessageNano<EnumValueOptions> {
        private static volatile EnumValueOptions[] _emptyArray;
        public boolean deprecated;
        public UninterpretedOption[] uninterpretedOption;

        public EnumValueOptions() {
            clear();
        }

        public static EnumValueOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumValueOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static EnumValueOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumValueOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static EnumValueOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumValueOptions) MessageNano.mergeFrom(new EnumValueOptions(), bArr);
        }

        public EnumValueOptions clear() {
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(1, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public EnumValueOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                    }
                    while (length < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    uninterpretedOptionArr[length] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(1, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class ExtensionRangeOptions extends ExtendableMessageNano<ExtensionRangeOptions> {
        private static volatile ExtensionRangeOptions[] _emptyArray;
        public UninterpretedOption[] uninterpretedOption;

        public ExtensionRangeOptions() {
            clear();
        }

        public static ExtensionRangeOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ExtensionRangeOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static ExtensionRangeOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ExtensionRangeOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static ExtensionRangeOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ExtensionRangeOptions) MessageNano.mergeFrom(new ExtensionRangeOptions(), bArr);
        }

        public ExtensionRangeOptions clear() {
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public ExtensionRangeOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 7994) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                    }
                    while (length < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    uninterpretedOptionArr[length] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class FieldDescriptorProto extends ExtendableMessageNano<FieldDescriptorProto> {
        private static volatile FieldDescriptorProto[] _emptyArray;
        public String defaultValue;
        public String extendee;
        public String jsonName;
        @NanoEnumValue(legacy = false, value = Label.class)
        public int label;
        public String name;
        public int number;
        public int oneofIndex;
        public FieldOptions options;
        @NanoEnumValue(legacy = false, value = Type.class)
        public int type;
        public String typeName;

        public interface Label {
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_OPTIONAL = 1;
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_REPEATED = 3;
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_REQUIRED = 2;
        }

        public interface Type {
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_BOOL = 8;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_BYTES = 12;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_DOUBLE = 1;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_ENUM = 14;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FIXED32 = 7;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FIXED64 = 6;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FLOAT = 2;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_GROUP = 10;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_INT32 = 5;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_INT64 = 3;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_MESSAGE = 11;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SFIXED32 = 15;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SFIXED64 = 16;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SINT32 = 17;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SINT64 = 18;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_STRING = 9;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_UINT32 = 13;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_UINT64 = 4;
        }

        public FieldDescriptorProto() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = Label.class)
        public static int checkLabelOrThrow(int i) {
            if (i >= 1 && i <= 3) {
                return i;
            }
            StringBuilder sb = new StringBuilder(37);
            sb.append(i);
            sb.append(" is not a valid enum Label");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = Label.class)
        public static int[] checkLabelOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkLabelOrThrow : iArr2) {
                checkLabelOrThrow(checkLabelOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = Type.class)
        public static int checkTypeOrThrow(int i) {
            if (i >= 1 && i <= 18) {
                return i;
            }
            StringBuilder sb = new StringBuilder(36);
            sb.append(i);
            sb.append(" is not a valid enum Type");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = Type.class)
        public static int[] checkTypeOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkTypeOrThrow : iArr2) {
                checkTypeOrThrow(checkTypeOrThrow);
            }
            return iArr2;
        }

        public static FieldDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FieldDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static FieldDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FieldDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static FieldDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FieldDescriptorProto) MessageNano.mergeFrom(new FieldDescriptorProto(), bArr);
        }

        public FieldDescriptorProto clear() {
            this.name = "";
            this.number = 0;
            this.label = 1;
            this.type = 1;
            this.typeName = "";
            this.extendee = "";
            this.defaultValue = "";
            this.oneofIndex = 0;
            this.jsonName = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.extendee != null && !this.extendee.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.extendee);
            }
            if (this.number != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.number);
            }
            if (this.label != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.label);
            }
            if (this.type != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(5, this.type);
            }
            if (this.typeName != null && !this.typeName.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(6, this.typeName);
            }
            if (this.defaultValue != null && !this.defaultValue.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(7, this.defaultValue);
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(8, this.options);
            }
            if (this.oneofIndex != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(9, this.oneofIndex);
            }
            return (this.jsonName == null || this.jsonName.equals("")) ? computeSerializedSize : computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(10, this.jsonName);
        }

        public FieldDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        this.extendee = codedInputByteBufferNano.readString();
                        break;
                    case 24:
                        this.number = codedInputByteBufferNano.readInt32();
                        break;
                    case 32:
                        int position = codedInputByteBufferNano.getPosition();
                        try {
                            this.label = checkLabelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 40:
                        int position2 = codedInputByteBufferNano.getPosition();
                        try {
                            this.type = checkTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position2);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 50:
                        this.typeName = codedInputByteBufferNano.readString();
                        break;
                    case 58:
                        this.defaultValue = codedInputByteBufferNano.readString();
                        break;
                    case 66:
                        if (this.options == null) {
                            this.options = new FieldOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 72:
                        this.oneofIndex = codedInputByteBufferNano.readInt32();
                        break;
                    case 82:
                        this.jsonName = codedInputByteBufferNano.readString();
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.extendee != null && !this.extendee.equals("")) {
                codedOutputByteBufferNano.writeString(2, this.extendee);
            }
            if (this.number != 0) {
                codedOutputByteBufferNano.writeInt32(3, this.number);
            }
            if (this.label != 1) {
                codedOutputByteBufferNano.writeInt32(4, this.label);
            }
            if (this.type != 1) {
                codedOutputByteBufferNano.writeInt32(5, this.type);
            }
            if (this.typeName != null && !this.typeName.equals("")) {
                codedOutputByteBufferNano.writeString(6, this.typeName);
            }
            if (this.defaultValue != null && !this.defaultValue.equals("")) {
                codedOutputByteBufferNano.writeString(7, this.defaultValue);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(8, this.options);
            }
            if (this.oneofIndex != 0) {
                codedOutputByteBufferNano.writeInt32(9, this.oneofIndex);
            }
            if (this.jsonName != null && !this.jsonName.equals("")) {
                codedOutputByteBufferNano.writeString(10, this.jsonName);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class FieldOptions extends ExtendableMessageNano<FieldOptions> {
        private static volatile FieldOptions[] _emptyArray;
        @NanoEnumValue(legacy = false, value = CType.class)
        public int ctype;
        public boolean deprecated;
        public boolean deprecatedRawMessage;
        public boolean enforceUtf8;
        @NanoEnumValue(legacy = false, value = JSType.class)
        public int jstype;
        public boolean lazy;
        public boolean packed;
        public UninterpretedOption[] uninterpretedOption;
        public UpgradedOption[] upgradedOption;
        public boolean weak;

        public interface CType {
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int CORD = 1;
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int STRING = 0;
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int STRING_PIECE = 2;
        }

        public interface JSType {
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_NORMAL = 0;
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_NUMBER = 2;
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_STRING = 1;
        }

        public static final class UpgradedOption extends ExtendableMessageNano<UpgradedOption> {
            private static volatile UpgradedOption[] _emptyArray;
            public String name;
            public String value;

            public UpgradedOption() {
                clear();
            }

            public static UpgradedOption[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new UpgradedOption[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static UpgradedOption parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new UpgradedOption().mergeFrom(codedInputByteBufferNano);
            }

            public static UpgradedOption parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (UpgradedOption) MessageNano.mergeFrom(new UpgradedOption(), bArr);
            }

            public UpgradedOption clear() {
                this.name = "";
                this.value = "";
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.name != null && !this.name.equals("")) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
                }
                return (this.value == null || this.value.equals("")) ? computeSerializedSize : computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(2, this.value);
            }

            public UpgradedOption mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 10) {
                        this.name = codedInputByteBufferNano.readString();
                    } else if (readTag == 18) {
                        this.value = codedInputByteBufferNano.readString();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.name != null && !this.name.equals("")) {
                    codedOutputByteBufferNano.writeString(1, this.name);
                }
                if (this.value != null && !this.value.equals("")) {
                    codedOutputByteBufferNano.writeString(2, this.value);
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public FieldOptions() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = CType.class)
        public static int checkCTypeOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder sb = new StringBuilder(37);
            sb.append(i);
            sb.append(" is not a valid enum CType");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = CType.class)
        public static int[] checkCTypeOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkCTypeOrThrow : iArr2) {
                checkCTypeOrThrow(checkCTypeOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = JSType.class)
        public static int checkJSTypeOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder sb = new StringBuilder(38);
            sb.append(i);
            sb.append(" is not a valid enum JSType");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = JSType.class)
        public static int[] checkJSTypeOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkJSTypeOrThrow : iArr2) {
                checkJSTypeOrThrow(checkJSTypeOrThrow);
            }
            return iArr2;
        }

        public static FieldOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FieldOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static FieldOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FieldOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static FieldOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FieldOptions) MessageNano.mergeFrom(new FieldOptions(), bArr);
        }

        public FieldOptions clear() {
            this.ctype = 0;
            this.packed = false;
            this.jstype = 0;
            this.lazy = false;
            this.deprecated = false;
            this.weak = false;
            this.upgradedOption = UpgradedOption.emptyArray();
            this.deprecatedRawMessage = false;
            this.enforceUtf8 = true;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.ctype != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.ctype);
            }
            if (this.packed) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.packed);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            if (this.lazy) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(5, this.lazy);
            }
            if (this.jstype != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(6, this.jstype);
            }
            if (this.weak) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.weak);
            }
            if (this.upgradedOption != null && this.upgradedOption.length > 0) {
                int i = computeSerializedSize;
                for (UpgradedOption upgradedOption2 : this.upgradedOption) {
                    if (upgradedOption2 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(11, upgradedOption2);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.deprecatedRawMessage) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(12, this.deprecatedRawMessage);
            }
            if (!this.enforceUtf8) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(13, this.enforceUtf8);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public FieldOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        int position = codedInputByteBufferNano.getPosition();
                        try {
                            this.ctype = checkCTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 16:
                        this.packed = codedInputByteBufferNano.readBool();
                        break;
                    case 24:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 40:
                        this.lazy = codedInputByteBufferNano.readBool();
                        break;
                    case 48:
                        int position2 = codedInputByteBufferNano.getPosition();
                        try {
                            this.jstype = checkJSTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position2);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 80:
                        this.weak = codedInputByteBufferNano.readBool();
                        break;
                    case 90:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 90);
                        int length = this.upgradedOption == null ? 0 : this.upgradedOption.length;
                        UpgradedOption[] upgradedOptionArr = new UpgradedOption[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.upgradedOption, 0, upgradedOptionArr, 0, length);
                        }
                        while (length < upgradedOptionArr.length - 1) {
                            upgradedOptionArr[length] = new UpgradedOption();
                            codedInputByteBufferNano.readMessage(upgradedOptionArr[length]);
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        upgradedOptionArr[length] = new UpgradedOption();
                        codedInputByteBufferNano.readMessage(upgradedOptionArr[length]);
                        this.upgradedOption = upgradedOptionArr;
                        break;
                    case 96:
                        this.deprecatedRawMessage = codedInputByteBufferNano.readBool();
                        break;
                    case 104:
                        this.enforceUtf8 = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        int length2 = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                        UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength2 + length2)];
                        if (length2 != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length2);
                        }
                        while (length2 < uninterpretedOptionArr.length - 1) {
                            uninterpretedOptionArr[length2] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length2]);
                            codedInputByteBufferNano.readTag();
                            length2++;
                        }
                        uninterpretedOptionArr[length2] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length2]);
                        this.uninterpretedOption = uninterpretedOptionArr;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.ctype != 0) {
                codedOutputByteBufferNano.writeInt32(1, this.ctype);
            }
            if (this.packed) {
                codedOutputByteBufferNano.writeBool(2, this.packed);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            if (this.lazy) {
                codedOutputByteBufferNano.writeBool(5, this.lazy);
            }
            if (this.jstype != 0) {
                codedOutputByteBufferNano.writeInt32(6, this.jstype);
            }
            if (this.weak) {
                codedOutputByteBufferNano.writeBool(10, this.weak);
            }
            if (this.upgradedOption != null && this.upgradedOption.length > 0) {
                for (UpgradedOption upgradedOption2 : this.upgradedOption) {
                    if (upgradedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(11, upgradedOption2);
                    }
                }
            }
            if (this.deprecatedRawMessage) {
                codedOutputByteBufferNano.writeBool(12, this.deprecatedRawMessage);
            }
            if (!this.enforceUtf8) {
                codedOutputByteBufferNano.writeBool(13, this.enforceUtf8);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class FileDescriptorProto extends ExtendableMessageNano<FileDescriptorProto> {
        private static volatile FileDescriptorProto[] _emptyArray;
        public String[] dependency;
        public EnumDescriptorProto[] enumType;
        public FieldDescriptorProto[] extension;
        public DescriptorProto[] messageType;
        public String name;
        public FileOptions options;
        public String package_;
        public int[] publicDependency;
        public ServiceDescriptorProto[] service;
        public SourceCodeInfo sourceCodeInfo;
        public String syntax;
        public int[] weakDependency;

        public FileDescriptorProto() {
            clear();
        }

        public static FileDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static FileDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static FileDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileDescriptorProto) MessageNano.mergeFrom(new FileDescriptorProto(), bArr);
        }

        public FileDescriptorProto clear() {
            this.name = "";
            this.package_ = "";
            this.dependency = WireFormatNano.EMPTY_STRING_ARRAY;
            this.publicDependency = WireFormatNano.EMPTY_INT_ARRAY;
            this.weakDependency = WireFormatNano.EMPTY_INT_ARRAY;
            this.messageType = DescriptorProto.emptyArray();
            this.enumType = EnumDescriptorProto.emptyArray();
            this.service = ServiceDescriptorProto.emptyArray();
            this.extension = FieldDescriptorProto.emptyArray();
            this.options = null;
            this.sourceCodeInfo = null;
            this.syntax = "";
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.package_ != null && !this.package_.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.package_);
            }
            if (this.dependency != null && this.dependency.length > 0) {
                int i = 0;
                int i2 = 0;
                for (String str : this.dependency) {
                    if (str != null) {
                        i2++;
                        i += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                }
                computeSerializedSize = computeSerializedSize + i + (i2 * 1);
            }
            if (this.messageType != null && this.messageType.length > 0) {
                int i3 = computeSerializedSize;
                for (DescriptorProto descriptorProto : this.messageType) {
                    if (descriptorProto != null) {
                        i3 += CodedOutputByteBufferNano.computeMessageSize(4, descriptorProto);
                    }
                }
                computeSerializedSize = i3;
            }
            if (this.enumType != null && this.enumType.length > 0) {
                int i4 = computeSerializedSize;
                for (EnumDescriptorProto enumDescriptorProto : this.enumType) {
                    if (enumDescriptorProto != null) {
                        i4 += CodedOutputByteBufferNano.computeMessageSize(5, enumDescriptorProto);
                    }
                }
                computeSerializedSize = i4;
            }
            if (this.service != null && this.service.length > 0) {
                int i5 = computeSerializedSize;
                for (ServiceDescriptorProto serviceDescriptorProto : this.service) {
                    if (serviceDescriptorProto != null) {
                        i5 += CodedOutputByteBufferNano.computeMessageSize(6, serviceDescriptorProto);
                    }
                }
                computeSerializedSize = i5;
            }
            if (this.extension != null && this.extension.length > 0) {
                int i6 = computeSerializedSize;
                for (FieldDescriptorProto fieldDescriptorProto : this.extension) {
                    if (fieldDescriptorProto != null) {
                        i6 += CodedOutputByteBufferNano.computeMessageSize(7, fieldDescriptorProto);
                    }
                }
                computeSerializedSize = i6;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(8, this.options);
            }
            if (this.sourceCodeInfo != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(9, this.sourceCodeInfo);
            }
            if (this.publicDependency != null && this.publicDependency.length > 0) {
                int i7 = 0;
                for (int computeInt32SizeNoTag : this.publicDependency) {
                    i7 += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag);
                }
                computeSerializedSize = computeSerializedSize + i7 + (this.publicDependency.length * 1);
            }
            if (this.weakDependency != null && this.weakDependency.length > 0) {
                int i8 = 0;
                for (int computeInt32SizeNoTag2 : this.weakDependency) {
                    i8 += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag2);
                }
                computeSerializedSize = computeSerializedSize + i8 + (1 * this.weakDependency.length);
            }
            return (this.syntax == null || this.syntax.equals("")) ? computeSerializedSize : computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(12, this.syntax);
        }

        public FileDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        this.package_ = codedInputByteBufferNano.readString();
                        break;
                    case 26:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 26);
                        int length = this.dependency == null ? 0 : this.dependency.length;
                        String[] strArr = new String[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.dependency, 0, strArr, 0, length);
                        }
                        while (length < strArr.length - 1) {
                            strArr[length] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        strArr[length] = codedInputByteBufferNano.readString();
                        this.dependency = strArr;
                        break;
                    case 34:
                        int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                        int length2 = this.messageType == null ? 0 : this.messageType.length;
                        DescriptorProto[] descriptorProtoArr = new DescriptorProto[(repeatedFieldArrayLength2 + length2)];
                        if (length2 != 0) {
                            System.arraycopy(this.messageType, 0, descriptorProtoArr, 0, length2);
                        }
                        while (length2 < descriptorProtoArr.length - 1) {
                            descriptorProtoArr[length2] = new DescriptorProto();
                            codedInputByteBufferNano.readMessage(descriptorProtoArr[length2]);
                            codedInputByteBufferNano.readTag();
                            length2++;
                        }
                        descriptorProtoArr[length2] = new DescriptorProto();
                        codedInputByteBufferNano.readMessage(descriptorProtoArr[length2]);
                        this.messageType = descriptorProtoArr;
                        break;
                    case 42:
                        int repeatedFieldArrayLength3 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                        int length3 = this.enumType == null ? 0 : this.enumType.length;
                        EnumDescriptorProto[] enumDescriptorProtoArr = new EnumDescriptorProto[(repeatedFieldArrayLength3 + length3)];
                        if (length3 != 0) {
                            System.arraycopy(this.enumType, 0, enumDescriptorProtoArr, 0, length3);
                        }
                        while (length3 < enumDescriptorProtoArr.length - 1) {
                            enumDescriptorProtoArr[length3] = new EnumDescriptorProto();
                            codedInputByteBufferNano.readMessage(enumDescriptorProtoArr[length3]);
                            codedInputByteBufferNano.readTag();
                            length3++;
                        }
                        enumDescriptorProtoArr[length3] = new EnumDescriptorProto();
                        codedInputByteBufferNano.readMessage(enumDescriptorProtoArr[length3]);
                        this.enumType = enumDescriptorProtoArr;
                        break;
                    case 50:
                        int repeatedFieldArrayLength4 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        int length4 = this.service == null ? 0 : this.service.length;
                        ServiceDescriptorProto[] serviceDescriptorProtoArr = new ServiceDescriptorProto[(repeatedFieldArrayLength4 + length4)];
                        if (length4 != 0) {
                            System.arraycopy(this.service, 0, serviceDescriptorProtoArr, 0, length4);
                        }
                        while (length4 < serviceDescriptorProtoArr.length - 1) {
                            serviceDescriptorProtoArr[length4] = new ServiceDescriptorProto();
                            codedInputByteBufferNano.readMessage(serviceDescriptorProtoArr[length4]);
                            codedInputByteBufferNano.readTag();
                            length4++;
                        }
                        serviceDescriptorProtoArr[length4] = new ServiceDescriptorProto();
                        codedInputByteBufferNano.readMessage(serviceDescriptorProtoArr[length4]);
                        this.service = serviceDescriptorProtoArr;
                        break;
                    case 58:
                        int repeatedFieldArrayLength5 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 58);
                        int length5 = this.extension == null ? 0 : this.extension.length;
                        FieldDescriptorProto[] fieldDescriptorProtoArr = new FieldDescriptorProto[(repeatedFieldArrayLength5 + length5)];
                        if (length5 != 0) {
                            System.arraycopy(this.extension, 0, fieldDescriptorProtoArr, 0, length5);
                        }
                        while (length5 < fieldDescriptorProtoArr.length - 1) {
                            fieldDescriptorProtoArr[length5] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr[length5]);
                            codedInputByteBufferNano.readTag();
                            length5++;
                        }
                        fieldDescriptorProtoArr[length5] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(fieldDescriptorProtoArr[length5]);
                        this.extension = fieldDescriptorProtoArr;
                        break;
                    case 66:
                        if (this.options == null) {
                            this.options = new FileOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 74:
                        if (this.sourceCodeInfo == null) {
                            this.sourceCodeInfo = new SourceCodeInfo();
                        }
                        codedInputByteBufferNano.readMessage(this.sourceCodeInfo);
                        break;
                    case 80:
                        int repeatedFieldArrayLength6 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 80);
                        int length6 = this.publicDependency == null ? 0 : this.publicDependency.length;
                        int[] iArr = new int[(repeatedFieldArrayLength6 + length6)];
                        if (length6 != 0) {
                            System.arraycopy(this.publicDependency, 0, iArr, 0, length6);
                        }
                        while (length6 < iArr.length - 1) {
                            iArr[length6] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            length6++;
                        }
                        iArr[length6] = codedInputByteBufferNano.readInt32();
                        this.publicDependency = iArr;
                        break;
                    case 82:
                        int pushLimit = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        int position = codedInputByteBufferNano.getPosition();
                        int i = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        codedInputByteBufferNano.rewindToPosition(position);
                        int length7 = this.publicDependency == null ? 0 : this.publicDependency.length;
                        int[] iArr2 = new int[(i + length7)];
                        if (length7 != 0) {
                            System.arraycopy(this.publicDependency, 0, iArr2, 0, length7);
                        }
                        while (length7 < iArr2.length) {
                            iArr2[length7] = codedInputByteBufferNano.readInt32();
                            length7++;
                        }
                        this.publicDependency = iArr2;
                        codedInputByteBufferNano.popLimit(pushLimit);
                        break;
                    case 88:
                        int repeatedFieldArrayLength7 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 88);
                        int length8 = this.weakDependency == null ? 0 : this.weakDependency.length;
                        int[] iArr3 = new int[(repeatedFieldArrayLength7 + length8)];
                        if (length8 != 0) {
                            System.arraycopy(this.weakDependency, 0, iArr3, 0, length8);
                        }
                        while (length8 < iArr3.length - 1) {
                            iArr3[length8] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            length8++;
                        }
                        iArr3[length8] = codedInputByteBufferNano.readInt32();
                        this.weakDependency = iArr3;
                        break;
                    case 90:
                        int pushLimit2 = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        int position2 = codedInputByteBufferNano.getPosition();
                        int i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(position2);
                        int length9 = this.weakDependency == null ? 0 : this.weakDependency.length;
                        int[] iArr4 = new int[(i2 + length9)];
                        if (length9 != 0) {
                            System.arraycopy(this.weakDependency, 0, iArr4, 0, length9);
                        }
                        while (length9 < iArr4.length) {
                            iArr4[length9] = codedInputByteBufferNano.readInt32();
                            length9++;
                        }
                        this.weakDependency = iArr4;
                        codedInputByteBufferNano.popLimit(pushLimit2);
                        break;
                    case 98:
                        this.syntax = codedInputByteBufferNano.readString();
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.package_ != null && !this.package_.equals("")) {
                codedOutputByteBufferNano.writeString(2, this.package_);
            }
            if (this.dependency != null && this.dependency.length > 0) {
                for (String str : this.dependency) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(3, str);
                    }
                }
            }
            if (this.messageType != null && this.messageType.length > 0) {
                for (DescriptorProto descriptorProto : this.messageType) {
                    if (descriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(4, descriptorProto);
                    }
                }
            }
            if (this.enumType != null && this.enumType.length > 0) {
                for (EnumDescriptorProto enumDescriptorProto : this.enumType) {
                    if (enumDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(5, enumDescriptorProto);
                    }
                }
            }
            if (this.service != null && this.service.length > 0) {
                for (ServiceDescriptorProto serviceDescriptorProto : this.service) {
                    if (serviceDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(6, serviceDescriptorProto);
                    }
                }
            }
            if (this.extension != null && this.extension.length > 0) {
                for (FieldDescriptorProto fieldDescriptorProto : this.extension) {
                    if (fieldDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(7, fieldDescriptorProto);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(8, this.options);
            }
            if (this.sourceCodeInfo != null) {
                codedOutputByteBufferNano.writeMessage(9, this.sourceCodeInfo);
            }
            if (this.publicDependency != null && this.publicDependency.length > 0) {
                for (int writeInt32 : this.publicDependency) {
                    codedOutputByteBufferNano.writeInt32(10, writeInt32);
                }
            }
            if (this.weakDependency != null && this.weakDependency.length > 0) {
                for (int writeInt322 : this.weakDependency) {
                    codedOutputByteBufferNano.writeInt32(11, writeInt322);
                }
            }
            if (this.syntax != null && !this.syntax.equals("")) {
                codedOutputByteBufferNano.writeString(12, this.syntax);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class FileDescriptorSet extends ExtendableMessageNano<FileDescriptorSet> {
        private static volatile FileDescriptorSet[] _emptyArray;
        public FileDescriptorProto[] file;

        public FileDescriptorSet() {
            clear();
        }

        public static FileDescriptorSet[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileDescriptorSet[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static FileDescriptorSet parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileDescriptorSet().mergeFrom(codedInputByteBufferNano);
        }

        public static FileDescriptorSet parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileDescriptorSet) MessageNano.mergeFrom(new FileDescriptorSet(), bArr);
        }

        public FileDescriptorSet clear() {
            this.file = FileDescriptorProto.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.file != null && this.file.length > 0) {
                for (FileDescriptorProto fileDescriptorProto : this.file) {
                    if (fileDescriptorProto != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, fileDescriptorProto);
                    }
                }
            }
            return computeSerializedSize;
        }

        public FileDescriptorSet mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    int length = this.file == null ? 0 : this.file.length;
                    FileDescriptorProto[] fileDescriptorProtoArr = new FileDescriptorProto[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.file, 0, fileDescriptorProtoArr, 0, length);
                    }
                    while (length < fileDescriptorProtoArr.length - 1) {
                        fileDescriptorProtoArr[length] = new FileDescriptorProto();
                        codedInputByteBufferNano.readMessage(fileDescriptorProtoArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    fileDescriptorProtoArr[length] = new FileDescriptorProto();
                    codedInputByteBufferNano.readMessage(fileDescriptorProtoArr[length]);
                    this.file = fileDescriptorProtoArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.file != null && this.file.length > 0) {
                for (FileDescriptorProto fileDescriptorProto : this.file) {
                    if (fileDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(1, fileDescriptorProto);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class FileOptions extends ExtendableMessageNano<FileOptions> {
        private static volatile FileOptions[] _emptyArray;
        public int ccApiVersion;
        public boolean ccEnableArenas;
        public boolean ccGenericServices;
        public boolean ccUtf8Verification;
        public String csharpNamespace;
        public boolean deprecated;
        public String goPackage;
        public String javaAltApiPackage;
        public int javaApiVersion;
        public boolean javaEnableDualGenerateMutableApi;
        public boolean javaGenericServices;
        public boolean javaJava5Enums;
        public boolean javaMultipleFiles;
        public String javaMultipleFilesMutablePackage;
        public boolean javaMutableApi;
        public String javaOuterClassname;
        public String javaPackage;
        public boolean javaStringCheckUtf8;
        public boolean javaUseJavaproto2;
        public boolean javaUseJavastrings;
        public String javascriptPackage;
        public String objcClassPrefix;
        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public int optimizeFor;
        public String phpClassPrefix;
        public boolean phpGenericServices;
        public String phpNamespace;
        public int pyApiVersion;
        public boolean pyGenericServices;
        public String swiftPrefix;
        public int szlApiVersion;
        public UninterpretedOption[] uninterpretedOption;

        public interface CompatibilityLevel {
            @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
            public static final int NO_COMPATIBILITY = 0;
            @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
            public static final int PROTO1_COMPATIBLE = 100;
        }

        public interface OptimizeMode {
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int CODE_SIZE = 2;
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int LITE_RUNTIME = 3;
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int SPEED = 1;
        }

        public FileOptions() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
        public static int checkCompatibilityLevelOrThrow(int i) {
            if (i >= 0 && i <= 0) {
                return i;
            }
            if (i >= 100 && i <= 100) {
                return i;
            }
            StringBuilder sb = new StringBuilder(50);
            sb.append(i);
            sb.append(" is not a valid enum CompatibilityLevel");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
        public static int[] checkCompatibilityLevelOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkCompatibilityLevelOrThrow : iArr2) {
                checkCompatibilityLevelOrThrow(checkCompatibilityLevelOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public static int checkOptimizeModeOrThrow(int i) {
            if (i >= 1 && i <= 3) {
                return i;
            }
            StringBuilder sb = new StringBuilder(44);
            sb.append(i);
            sb.append(" is not a valid enum OptimizeMode");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public static int[] checkOptimizeModeOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkOptimizeModeOrThrow : iArr2) {
                checkOptimizeModeOrThrow(checkOptimizeModeOrThrow);
            }
            return iArr2;
        }

        public static FileOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static FileOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static FileOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileOptions) MessageNano.mergeFrom(new FileOptions(), bArr);
        }

        public FileOptions clear() {
            this.ccApiVersion = 2;
            this.ccUtf8Verification = true;
            this.javaPackage = "";
            this.pyApiVersion = 2;
            this.javaApiVersion = 2;
            this.javaUseJavaproto2 = true;
            this.javaJava5Enums = true;
            this.javaUseJavastrings = false;
            this.javaAltApiPackage = "";
            this.javaEnableDualGenerateMutableApi = false;
            this.javaOuterClassname = "";
            this.javaMultipleFiles = false;
            this.javaStringCheckUtf8 = false;
            this.javaMutableApi = false;
            this.javaMultipleFilesMutablePackage = "";
            this.optimizeFor = 1;
            this.goPackage = "";
            this.javascriptPackage = "";
            this.szlApiVersion = 1;
            this.ccGenericServices = false;
            this.javaGenericServices = false;
            this.pyGenericServices = false;
            this.phpGenericServices = false;
            this.deprecated = false;
            this.ccEnableArenas = false;
            this.objcClassPrefix = "";
            this.csharpNamespace = "";
            this.swiftPrefix = "";
            this.phpClassPrefix = "";
            this.phpNamespace = "";
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.javaPackage != null && !this.javaPackage.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.javaPackage);
            }
            if (this.ccApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.ccApiVersion);
            }
            if (this.pyApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.pyApiVersion);
            }
            if (this.javaApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(5, this.javaApiVersion);
            }
            if (!this.javaUseJavaproto2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(6, this.javaUseJavaproto2);
            }
            if (!this.javaJava5Enums) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(7, this.javaJava5Enums);
            }
            if (this.javaOuterClassname != null && !this.javaOuterClassname.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(8, this.javaOuterClassname);
            }
            if (this.optimizeFor != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(9, this.optimizeFor);
            }
            if (this.javaMultipleFiles) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.javaMultipleFiles);
            }
            if (this.goPackage != null && !this.goPackage.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(11, this.goPackage);
            }
            if (this.javascriptPackage != null && !this.javascriptPackage.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(12, this.javascriptPackage);
            }
            if (this.szlApiVersion != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(14, this.szlApiVersion);
            }
            if (this.ccGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(16, this.ccGenericServices);
            }
            if (this.javaGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(17, this.javaGenericServices);
            }
            if (this.pyGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(18, this.pyGenericServices);
            }
            if (this.javaAltApiPackage != null && !this.javaAltApiPackage.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(19, this.javaAltApiPackage);
            }
            if (this.javaUseJavastrings) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(21, this.javaUseJavastrings);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(23, this.deprecated);
            }
            if (!this.ccUtf8Verification) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(24, this.ccUtf8Verification);
            }
            if (this.javaEnableDualGenerateMutableApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(26, this.javaEnableDualGenerateMutableApi);
            }
            if (this.javaStringCheckUtf8) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(27, this.javaStringCheckUtf8);
            }
            if (this.javaMutableApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(28, this.javaMutableApi);
            }
            if (this.javaMultipleFilesMutablePackage != null && !this.javaMultipleFilesMutablePackage.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(29, this.javaMultipleFilesMutablePackage);
            }
            if (this.ccEnableArenas) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(31, this.ccEnableArenas);
            }
            if (this.objcClassPrefix != null && !this.objcClassPrefix.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(36, this.objcClassPrefix);
            }
            if (this.csharpNamespace != null && !this.csharpNamespace.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(37, this.csharpNamespace);
            }
            if (this.swiftPrefix != null && !this.swiftPrefix.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(39, this.swiftPrefix);
            }
            if (this.phpClassPrefix != null && !this.phpClassPrefix.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(40, this.phpClassPrefix);
            }
            if (this.phpNamespace != null && !this.phpNamespace.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(41, this.phpNamespace);
            }
            if (this.phpGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(42, this.phpGenericServices);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public FileOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.javaPackage = codedInputByteBufferNano.readString();
                        break;
                    case 16:
                        this.ccApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 32:
                        this.pyApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 40:
                        this.javaApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 48:
                        this.javaUseJavaproto2 = codedInputByteBufferNano.readBool();
                        break;
                    case 56:
                        this.javaJava5Enums = codedInputByteBufferNano.readBool();
                        break;
                    case 66:
                        this.javaOuterClassname = codedInputByteBufferNano.readString();
                        break;
                    case 72:
                        int position = codedInputByteBufferNano.getPosition();
                        try {
                            this.optimizeFor = checkOptimizeModeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 80:
                        this.javaMultipleFiles = codedInputByteBufferNano.readBool();
                        break;
                    case 90:
                        this.goPackage = codedInputByteBufferNano.readString();
                        break;
                    case 98:
                        this.javascriptPackage = codedInputByteBufferNano.readString();
                        break;
                    case 112:
                        this.szlApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 128:
                        this.ccGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 136:
                        this.javaGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 144:
                        this.pyGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 154:
                        this.javaAltApiPackage = codedInputByteBufferNano.readString();
                        break;
                    case 168:
                        this.javaUseJavastrings = codedInputByteBufferNano.readBool();
                        break;
                    case 184:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 192:
                        this.ccUtf8Verification = codedInputByteBufferNano.readBool();
                        break;
                    case 208:
                        this.javaEnableDualGenerateMutableApi = codedInputByteBufferNano.readBool();
                        break;
                    case 216:
                        this.javaStringCheckUtf8 = codedInputByteBufferNano.readBool();
                        break;
                    case 224:
                        this.javaMutableApi = codedInputByteBufferNano.readBool();
                        break;
                    case 234:
                        this.javaMultipleFilesMutablePackage = codedInputByteBufferNano.readString();
                        break;
                    case 248:
                        this.ccEnableArenas = codedInputByteBufferNano.readBool();
                        break;
                    case 290:
                        this.objcClassPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 298:
                        this.csharpNamespace = codedInputByteBufferNano.readString();
                        break;
                    case 314:
                        this.swiftPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 322:
                        this.phpClassPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 330:
                        this.phpNamespace = codedInputByteBufferNano.readString();
                        break;
                    case 336:
                        this.phpGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                        UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                        }
                        while (length < uninterpretedOptionArr.length - 1) {
                            uninterpretedOptionArr[length] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        this.uninterpretedOption = uninterpretedOptionArr;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.javaPackage != null && !this.javaPackage.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.javaPackage);
            }
            if (this.ccApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(2, this.ccApiVersion);
            }
            if (this.pyApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(4, this.pyApiVersion);
            }
            if (this.javaApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(5, this.javaApiVersion);
            }
            if (!this.javaUseJavaproto2) {
                codedOutputByteBufferNano.writeBool(6, this.javaUseJavaproto2);
            }
            if (!this.javaJava5Enums) {
                codedOutputByteBufferNano.writeBool(7, this.javaJava5Enums);
            }
            if (this.javaOuterClassname != null && !this.javaOuterClassname.equals("")) {
                codedOutputByteBufferNano.writeString(8, this.javaOuterClassname);
            }
            if (this.optimizeFor != 1) {
                codedOutputByteBufferNano.writeInt32(9, this.optimizeFor);
            }
            if (this.javaMultipleFiles) {
                codedOutputByteBufferNano.writeBool(10, this.javaMultipleFiles);
            }
            if (this.goPackage != null && !this.goPackage.equals("")) {
                codedOutputByteBufferNano.writeString(11, this.goPackage);
            }
            if (this.javascriptPackage != null && !this.javascriptPackage.equals("")) {
                codedOutputByteBufferNano.writeString(12, this.javascriptPackage);
            }
            if (this.szlApiVersion != 1) {
                codedOutputByteBufferNano.writeInt32(14, this.szlApiVersion);
            }
            if (this.ccGenericServices) {
                codedOutputByteBufferNano.writeBool(16, this.ccGenericServices);
            }
            if (this.javaGenericServices) {
                codedOutputByteBufferNano.writeBool(17, this.javaGenericServices);
            }
            if (this.pyGenericServices) {
                codedOutputByteBufferNano.writeBool(18, this.pyGenericServices);
            }
            if (this.javaAltApiPackage != null && !this.javaAltApiPackage.equals("")) {
                codedOutputByteBufferNano.writeString(19, this.javaAltApiPackage);
            }
            if (this.javaUseJavastrings) {
                codedOutputByteBufferNano.writeBool(21, this.javaUseJavastrings);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(23, this.deprecated);
            }
            if (!this.ccUtf8Verification) {
                codedOutputByteBufferNano.writeBool(24, this.ccUtf8Verification);
            }
            if (this.javaEnableDualGenerateMutableApi) {
                codedOutputByteBufferNano.writeBool(26, this.javaEnableDualGenerateMutableApi);
            }
            if (this.javaStringCheckUtf8) {
                codedOutputByteBufferNano.writeBool(27, this.javaStringCheckUtf8);
            }
            if (this.javaMutableApi) {
                codedOutputByteBufferNano.writeBool(28, this.javaMutableApi);
            }
            if (this.javaMultipleFilesMutablePackage != null && !this.javaMultipleFilesMutablePackage.equals("")) {
                codedOutputByteBufferNano.writeString(29, this.javaMultipleFilesMutablePackage);
            }
            if (this.ccEnableArenas) {
                codedOutputByteBufferNano.writeBool(31, this.ccEnableArenas);
            }
            if (this.objcClassPrefix != null && !this.objcClassPrefix.equals("")) {
                codedOutputByteBufferNano.writeString(36, this.objcClassPrefix);
            }
            if (this.csharpNamespace != null && !this.csharpNamespace.equals("")) {
                codedOutputByteBufferNano.writeString(37, this.csharpNamespace);
            }
            if (this.swiftPrefix != null && !this.swiftPrefix.equals("")) {
                codedOutputByteBufferNano.writeString(39, this.swiftPrefix);
            }
            if (this.phpClassPrefix != null && !this.phpClassPrefix.equals("")) {
                codedOutputByteBufferNano.writeString(40, this.phpClassPrefix);
            }
            if (this.phpNamespace != null && !this.phpNamespace.equals("")) {
                codedOutputByteBufferNano.writeString(41, this.phpNamespace);
            }
            if (this.phpGenericServices) {
                codedOutputByteBufferNano.writeBool(42, this.phpGenericServices);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class GeneratedCodeInfo extends ExtendableMessageNano<GeneratedCodeInfo> {
        private static volatile GeneratedCodeInfo[] _emptyArray;
        public Annotation[] annotation;

        public static final class Annotation extends ExtendableMessageNano<Annotation> {
            private static volatile Annotation[] _emptyArray;
            public int begin;
            public int end;
            public int[] path;
            public String sourceFile;

            public Annotation() {
                clear();
            }

            public static Annotation[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new Annotation[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static Annotation parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new Annotation().mergeFrom(codedInputByteBufferNano);
            }

            public static Annotation parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (Annotation) MessageNano.mergeFrom(new Annotation(), bArr);
            }

            public Annotation clear() {
                this.path = WireFormatNano.EMPTY_INT_ARRAY;
                this.sourceFile = "";
                this.begin = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    for (int computeInt32SizeNoTag : this.path) {
                        i += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag);
                    }
                    computeSerializedSize = computeSerializedSize + i + 1 + CodedOutputByteBufferNano.computeRawVarint32Size(i);
                }
                if (this.sourceFile != null && !this.sourceFile.equals("")) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.sourceFile);
                }
                if (this.begin != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.begin);
                }
                return this.end != 0 ? computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(4, this.end) : computeSerializedSize;
            }

            public Annotation mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 8);
                        int length = this.path == null ? 0 : this.path.length;
                        int[] iArr = new int[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.path, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        iArr[length] = codedInputByteBufferNano.readInt32();
                        this.path = iArr;
                    } else if (readTag == 10) {
                        int pushLimit = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        int position = codedInputByteBufferNano.getPosition();
                        int i = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        codedInputByteBufferNano.rewindToPosition(position);
                        int length2 = this.path == null ? 0 : this.path.length;
                        int[] iArr2 = new int[(i + length2)];
                        if (length2 != 0) {
                            System.arraycopy(this.path, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = codedInputByteBufferNano.readInt32();
                            length2++;
                        }
                        this.path = iArr2;
                        codedInputByteBufferNano.popLimit(pushLimit);
                    } else if (readTag == 18) {
                        this.sourceFile = codedInputByteBufferNano.readString();
                    } else if (readTag == 24) {
                        this.begin = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 32) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    for (int computeInt32SizeNoTag : this.path) {
                        i += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag);
                    }
                    codedOutputByteBufferNano.writeRawVarint32(10);
                    codedOutputByteBufferNano.writeRawVarint32(i);
                    for (int writeInt32NoTag : this.path) {
                        codedOutputByteBufferNano.writeInt32NoTag(writeInt32NoTag);
                    }
                }
                if (this.sourceFile != null && !this.sourceFile.equals("")) {
                    codedOutputByteBufferNano.writeString(2, this.sourceFile);
                }
                if (this.begin != 0) {
                    codedOutputByteBufferNano.writeInt32(3, this.begin);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(4, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public GeneratedCodeInfo() {
            clear();
        }

        public static GeneratedCodeInfo[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new GeneratedCodeInfo[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static GeneratedCodeInfo parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new GeneratedCodeInfo().mergeFrom(codedInputByteBufferNano);
        }

        public static GeneratedCodeInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (GeneratedCodeInfo) MessageNano.mergeFrom(new GeneratedCodeInfo(), bArr);
        }

        public GeneratedCodeInfo clear() {
            this.annotation = Annotation.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.annotation != null && this.annotation.length > 0) {
                for (Annotation annotation2 : this.annotation) {
                    if (annotation2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, annotation2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public GeneratedCodeInfo mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    int length = this.annotation == null ? 0 : this.annotation.length;
                    Annotation[] annotationArr = new Annotation[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.annotation, 0, annotationArr, 0, length);
                    }
                    while (length < annotationArr.length - 1) {
                        annotationArr[length] = new Annotation();
                        codedInputByteBufferNano.readMessage(annotationArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    annotationArr[length] = new Annotation();
                    codedInputByteBufferNano.readMessage(annotationArr[length]);
                    this.annotation = annotationArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.annotation != null && this.annotation.length > 0) {
                for (Annotation annotation2 : this.annotation) {
                    if (annotation2 != null) {
                        codedOutputByteBufferNano.writeMessage(1, annotation2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class MessageOptions extends ExtendableMessageNano<MessageOptions> {
        private static volatile MessageOptions[] _emptyArray;
        public boolean deprecated;
        public String[] experimentalJavaBuilderInterface;
        public String[] experimentalJavaInterfaceExtends;
        public String[] experimentalJavaMessageInterface;
        public boolean mapEntry;
        public boolean messageSetWireFormat;
        public boolean noStandardDescriptorAccessor;
        public UninterpretedOption[] uninterpretedOption;

        public MessageOptions() {
            clear();
        }

        public static MessageOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MessageOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static MessageOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MessageOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static MessageOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MessageOptions) MessageNano.mergeFrom(new MessageOptions(), bArr);
        }

        public MessageOptions clear() {
            this.experimentalJavaMessageInterface = WireFormatNano.EMPTY_STRING_ARRAY;
            this.experimentalJavaBuilderInterface = WireFormatNano.EMPTY_STRING_ARRAY;
            this.experimentalJavaInterfaceExtends = WireFormatNano.EMPTY_STRING_ARRAY;
            this.messageSetWireFormat = false;
            this.noStandardDescriptorAccessor = false;
            this.deprecated = false;
            this.mapEntry = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.messageSetWireFormat) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(1, this.messageSetWireFormat);
            }
            if (this.noStandardDescriptorAccessor) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.noStandardDescriptorAccessor);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            if (this.experimentalJavaMessageInterface != null && this.experimentalJavaMessageInterface.length > 0) {
                int i = 0;
                int i2 = 0;
                for (String str : this.experimentalJavaMessageInterface) {
                    if (str != null) {
                        i2++;
                        i += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                }
                computeSerializedSize = computeSerializedSize + i + (i2 * 1);
            }
            if (this.experimentalJavaBuilderInterface != null && this.experimentalJavaBuilderInterface.length > 0) {
                int i3 = 0;
                int i4 = 0;
                for (String str2 : this.experimentalJavaBuilderInterface) {
                    if (str2 != null) {
                        i4++;
                        i3 += CodedOutputByteBufferNano.computeStringSizeNoTag(str2);
                    }
                }
                computeSerializedSize = computeSerializedSize + i3 + (i4 * 1);
            }
            if (this.experimentalJavaInterfaceExtends != null && this.experimentalJavaInterfaceExtends.length > 0) {
                int i5 = 0;
                int i6 = 0;
                for (String str3 : this.experimentalJavaInterfaceExtends) {
                    if (str3 != null) {
                        i6++;
                        i5 += CodedOutputByteBufferNano.computeStringSizeNoTag(str3);
                    }
                }
                computeSerializedSize = computeSerializedSize + i5 + (1 * i6);
            }
            if (this.mapEntry) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(7, this.mapEntry);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public MessageOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    this.messageSetWireFormat = codedInputByteBufferNano.readBool();
                } else if (readTag == 16) {
                    this.noStandardDescriptorAccessor = codedInputByteBufferNano.readBool();
                } else if (readTag == 24) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 34) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    int length = this.experimentalJavaMessageInterface == null ? 0 : this.experimentalJavaMessageInterface.length;
                    String[] strArr = new String[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.experimentalJavaMessageInterface, 0, strArr, 0, length);
                    }
                    while (length < strArr.length - 1) {
                        strArr[length] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    strArr[length] = codedInputByteBufferNano.readString();
                    this.experimentalJavaMessageInterface = strArr;
                } else if (readTag == 42) {
                    int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                    int length2 = this.experimentalJavaBuilderInterface == null ? 0 : this.experimentalJavaBuilderInterface.length;
                    String[] strArr2 = new String[(repeatedFieldArrayLength2 + length2)];
                    if (length2 != 0) {
                        System.arraycopy(this.experimentalJavaBuilderInterface, 0, strArr2, 0, length2);
                    }
                    while (length2 < strArr2.length - 1) {
                        strArr2[length2] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        length2++;
                    }
                    strArr2[length2] = codedInputByteBufferNano.readString();
                    this.experimentalJavaBuilderInterface = strArr2;
                } else if (readTag == 50) {
                    int repeatedFieldArrayLength3 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                    int length3 = this.experimentalJavaInterfaceExtends == null ? 0 : this.experimentalJavaInterfaceExtends.length;
                    String[] strArr3 = new String[(repeatedFieldArrayLength3 + length3)];
                    if (length3 != 0) {
                        System.arraycopy(this.experimentalJavaInterfaceExtends, 0, strArr3, 0, length3);
                    }
                    while (length3 < strArr3.length - 1) {
                        strArr3[length3] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        length3++;
                    }
                    strArr3[length3] = codedInputByteBufferNano.readString();
                    this.experimentalJavaInterfaceExtends = strArr3;
                } else if (readTag == 56) {
                    this.mapEntry = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int repeatedFieldArrayLength4 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length4 = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength4 + length4)];
                    if (length4 != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length4);
                    }
                    while (length4 < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length4] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length4]);
                        codedInputByteBufferNano.readTag();
                        length4++;
                    }
                    uninterpretedOptionArr[length4] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length4]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.messageSetWireFormat) {
                codedOutputByteBufferNano.writeBool(1, this.messageSetWireFormat);
            }
            if (this.noStandardDescriptorAccessor) {
                codedOutputByteBufferNano.writeBool(2, this.noStandardDescriptorAccessor);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            if (this.experimentalJavaMessageInterface != null && this.experimentalJavaMessageInterface.length > 0) {
                for (String str : this.experimentalJavaMessageInterface) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(4, str);
                    }
                }
            }
            if (this.experimentalJavaBuilderInterface != null && this.experimentalJavaBuilderInterface.length > 0) {
                for (String str2 : this.experimentalJavaBuilderInterface) {
                    if (str2 != null) {
                        codedOutputByteBufferNano.writeString(5, str2);
                    }
                }
            }
            if (this.experimentalJavaInterfaceExtends != null && this.experimentalJavaInterfaceExtends.length > 0) {
                for (String str3 : this.experimentalJavaInterfaceExtends) {
                    if (str3 != null) {
                        codedOutputByteBufferNano.writeString(6, str3);
                    }
                }
            }
            if (this.mapEntry) {
                codedOutputByteBufferNano.writeBool(7, this.mapEntry);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class MethodDescriptorProto extends ExtendableMessageNano<MethodDescriptorProto> {
        private static volatile MethodDescriptorProto[] _emptyArray;
        public boolean clientStreaming;
        public String inputType;
        public String name;
        public MethodOptions options;
        public String outputType;
        public boolean serverStreaming;

        public MethodDescriptorProto() {
            clear();
        }

        public static MethodDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MethodDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static MethodDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MethodDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static MethodDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MethodDescriptorProto) MessageNano.mergeFrom(new MethodDescriptorProto(), bArr);
        }

        public MethodDescriptorProto clear() {
            this.name = "";
            this.inputType = "";
            this.outputType = "";
            this.options = null;
            this.clientStreaming = false;
            this.serverStreaming = false;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.inputType != null && !this.inputType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.inputType);
            }
            if (this.outputType != null && !this.outputType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.outputType);
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(4, this.options);
            }
            if (this.clientStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(5, this.clientStreaming);
            }
            return this.serverStreaming ? computeSerializedSize + CodedOutputByteBufferNano.computeBoolSize(6, this.serverStreaming) : computeSerializedSize;
        }

        public MethodDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    this.inputType = codedInputByteBufferNano.readString();
                } else if (readTag == 26) {
                    this.outputType = codedInputByteBufferNano.readString();
                } else if (readTag == 34) {
                    if (this.options == null) {
                        this.options = new MethodOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 40) {
                    this.clientStreaming = codedInputByteBufferNano.readBool();
                } else if (readTag == 48) {
                    this.serverStreaming = codedInputByteBufferNano.readBool();
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.inputType != null && !this.inputType.equals("")) {
                codedOutputByteBufferNano.writeString(2, this.inputType);
            }
            if (this.outputType != null && !this.outputType.equals("")) {
                codedOutputByteBufferNano.writeString(3, this.outputType);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(4, this.options);
            }
            if (this.clientStreaming) {
                codedOutputByteBufferNano.writeBool(5, this.clientStreaming);
            }
            if (this.serverStreaming) {
                codedOutputByteBufferNano.writeBool(6, this.serverStreaming);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class MethodOptions extends ExtendableMessageNano<MethodOptions> {
        private static volatile MethodOptions[] _emptyArray;
        public int clientLogging;
        public boolean clientStreaming;
        public double deadline;
        public boolean deprecated;
        public boolean duplicateSuppression;
        public boolean endUserCredsRequested;
        public boolean failFast;
        public boolean goLegacyChannelApi;
        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public int idempotencyLevel;
        public long legacyClientInitialTokens;
        public String legacyResultType;
        public long legacyServerInitialTokens;
        public String legacyStreamType;
        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public int legacyTokenUnit;
        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public int logLevel;
        @NanoEnumValue(legacy = false, value = Protocol.class)
        public int protocol;
        @NanoEnumValue(legacy = false, value = Format.class)
        public int requestFormat;
        @NanoEnumValue(legacy = false, value = Format.class)
        public int responseFormat;
        public String securityLabel;
        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public int securityLevel;
        public int serverLogging;
        public boolean serverStreaming;
        public String streamType;
        public UninterpretedOption[] uninterpretedOption;

        public interface Format {
            @NanoEnumValue(legacy = false, value = Format.class)
            public static final int UNCOMPRESSED = 0;
            @NanoEnumValue(legacy = false, value = Format.class)
            public static final int ZIPPY_COMPRESSED = 1;
        }

        public interface IdempotencyLevel {
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int IDEMPOTENCY_UNKNOWN = 0;
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int IDEMPOTENT = 2;
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int NO_SIDE_EFFECTS = 1;
        }

        public interface LogLevel {
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_FILTERED_PAYLOAD = 3;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_NON_PRIVATE_PAYLOAD_INTERNAL = 2;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_PAYLOAD = 4;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_ONLY = 1;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_NONE = 0;
        }

        public interface Protocol {
            @NanoEnumValue(legacy = false, value = Protocol.class)
            public static final int TCP = 0;
            @NanoEnumValue(legacy = false, value = Protocol.class)
            public static final int UDP = 1;
        }

        public interface SecurityLevel {
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int INTEGRITY = 1;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int NONE = 0;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int PRIVACY_AND_INTEGRITY = 2;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int STRONG_PRIVACY_AND_INTEGRITY = 3;
        }

        public interface TokenUnit {
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int BYTE = 1;
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int MESSAGE = 0;
        }

        public MethodOptions() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = Format.class)
        public static int checkFormatOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder sb = new StringBuilder(38);
            sb.append(i);
            sb.append(" is not a valid enum Format");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = Format.class)
        public static int[] checkFormatOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkFormatOrThrow : iArr2) {
                checkFormatOrThrow(checkFormatOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public static int checkIdempotencyLevelOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder sb = new StringBuilder(48);
            sb.append(i);
            sb.append(" is not a valid enum IdempotencyLevel");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public static int[] checkIdempotencyLevelOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkIdempotencyLevelOrThrow : iArr2) {
                checkIdempotencyLevelOrThrow(checkIdempotencyLevelOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public static int checkLogLevelOrThrow(int i) {
            if (i >= 0 && i <= 4) {
                return i;
            }
            StringBuilder sb = new StringBuilder(40);
            sb.append(i);
            sb.append(" is not a valid enum LogLevel");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public static int[] checkLogLevelOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkLogLevelOrThrow : iArr2) {
                checkLogLevelOrThrow(checkLogLevelOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = Protocol.class)
        public static int checkProtocolOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder sb = new StringBuilder(40);
            sb.append(i);
            sb.append(" is not a valid enum Protocol");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = Protocol.class)
        public static int[] checkProtocolOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkProtocolOrThrow : iArr2) {
                checkProtocolOrThrow(checkProtocolOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public static int checkSecurityLevelOrThrow(int i) {
            if (i >= 0 && i <= 3) {
                return i;
            }
            StringBuilder sb = new StringBuilder(45);
            sb.append(i);
            sb.append(" is not a valid enum SecurityLevel");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public static int[] checkSecurityLevelOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkSecurityLevelOrThrow : iArr2) {
                checkSecurityLevelOrThrow(checkSecurityLevelOrThrow);
            }
            return iArr2;
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int checkTokenUnitOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder sb = new StringBuilder(41);
            sb.append(i);
            sb.append(" is not a valid enum TokenUnit");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int[] checkTokenUnitOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkTokenUnitOrThrow : iArr2) {
                checkTokenUnitOrThrow(checkTokenUnitOrThrow);
            }
            return iArr2;
        }

        public static MethodOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MethodOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static MethodOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MethodOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static MethodOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MethodOptions) MessageNano.mergeFrom(new MethodOptions(), bArr);
        }

        public MethodOptions clear() {
            this.protocol = 0;
            this.deadline = -1.0d;
            this.duplicateSuppression = false;
            this.failFast = false;
            this.endUserCredsRequested = false;
            this.clientLogging = 256;
            this.serverLogging = 256;
            this.securityLevel = 0;
            this.responseFormat = 0;
            this.requestFormat = 0;
            this.streamType = "";
            this.securityLabel = "";
            this.clientStreaming = false;
            this.serverStreaming = false;
            this.legacyStreamType = "";
            this.legacyResultType = "";
            this.goLegacyChannelApi = false;
            this.legacyClientInitialTokens = -1;
            this.legacyServerInitialTokens = -1;
            this.legacyTokenUnit = 1;
            this.logLevel = 2;
            this.deprecated = false;
            this.idempotencyLevel = 0;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.protocol != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(7, this.protocol);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(8, this.deadline);
            }
            if (this.duplicateSuppression) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(9, this.duplicateSuppression);
            }
            if (this.failFast) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.failFast);
            }
            if (this.clientLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeSInt32Size(11, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeSInt32Size(12, this.serverLogging);
            }
            if (this.securityLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(13, this.securityLevel);
            }
            if (this.responseFormat != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(15, this.responseFormat);
            }
            if (this.requestFormat != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(17, this.requestFormat);
            }
            if (this.streamType != null && !this.streamType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(18, this.streamType);
            }
            if (this.securityLabel != null && !this.securityLabel.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(19, this.securityLabel);
            }
            if (this.clientStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(20, this.clientStreaming);
            }
            if (this.serverStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(21, this.serverStreaming);
            }
            if (this.legacyStreamType != null && !this.legacyStreamType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(22, this.legacyStreamType);
            }
            if (this.legacyResultType != null && !this.legacyResultType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(23, this.legacyResultType);
            }
            if (this.legacyClientInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(24, this.legacyClientInitialTokens);
            }
            if (this.legacyServerInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(25, this.legacyServerInitialTokens);
            }
            if (this.endUserCredsRequested) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(26, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(27, this.logLevel);
            }
            if (this.legacyTokenUnit != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(28, this.legacyTokenUnit);
            }
            if (this.goLegacyChannelApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(29, this.goLegacyChannelApi);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.idempotencyLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(34, this.idempotencyLevel);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public MethodOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 56:
                        int position = codedInputByteBufferNano.getPosition();
                        try {
                            this.protocol = checkProtocolOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 65:
                        this.deadline = codedInputByteBufferNano.readDouble();
                        break;
                    case 72:
                        this.duplicateSuppression = codedInputByteBufferNano.readBool();
                        break;
                    case 80:
                        this.failFast = codedInputByteBufferNano.readBool();
                        break;
                    case 88:
                        this.clientLogging = codedInputByteBufferNano.readSInt32();
                        break;
                    case 96:
                        this.serverLogging = codedInputByteBufferNano.readSInt32();
                        break;
                    case 104:
                        int position2 = codedInputByteBufferNano.getPosition();
                        try {
                            this.securityLevel = checkSecurityLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position2);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 120:
                        int position3 = codedInputByteBufferNano.getPosition();
                        try {
                            this.responseFormat = checkFormatOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e3) {
                            codedInputByteBufferNano.rewindToPosition(position3);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 136:
                        int position4 = codedInputByteBufferNano.getPosition();
                        try {
                            this.requestFormat = checkFormatOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e4) {
                            codedInputByteBufferNano.rewindToPosition(position4);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 146:
                        this.streamType = codedInputByteBufferNano.readString();
                        break;
                    case 154:
                        this.securityLabel = codedInputByteBufferNano.readString();
                        break;
                    case 160:
                        this.clientStreaming = codedInputByteBufferNano.readBool();
                        break;
                    case 168:
                        this.serverStreaming = codedInputByteBufferNano.readBool();
                        break;
                    case 178:
                        this.legacyStreamType = codedInputByteBufferNano.readString();
                        break;
                    case 186:
                        this.legacyResultType = codedInputByteBufferNano.readString();
                        break;
                    case 192:
                        this.legacyClientInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 200:
                        this.legacyServerInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 208:
                        this.endUserCredsRequested = codedInputByteBufferNano.readBool();
                        break;
                    case 216:
                        int position5 = codedInputByteBufferNano.getPosition();
                        try {
                            this.logLevel = checkLogLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e5) {
                            codedInputByteBufferNano.rewindToPosition(position5);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 224:
                        int position6 = codedInputByteBufferNano.getPosition();
                        try {
                            this.legacyTokenUnit = checkTokenUnitOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e6) {
                            codedInputByteBufferNano.rewindToPosition(position6);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 232:
                        this.goLegacyChannelApi = codedInputByteBufferNano.readBool();
                        break;
                    case 264:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 272:
                        int position7 = codedInputByteBufferNano.getPosition();
                        try {
                            this.idempotencyLevel = checkIdempotencyLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e7) {
                            codedInputByteBufferNano.rewindToPosition(position7);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 7994:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                        UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                        }
                        while (length < uninterpretedOptionArr.length - 1) {
                            uninterpretedOptionArr[length] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        this.uninterpretedOption = uninterpretedOptionArr;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.protocol != 0) {
                codedOutputByteBufferNano.writeInt32(7, this.protocol);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(8, this.deadline);
            }
            if (this.duplicateSuppression) {
                codedOutputByteBufferNano.writeBool(9, this.duplicateSuppression);
            }
            if (this.failFast) {
                codedOutputByteBufferNano.writeBool(10, this.failFast);
            }
            if (this.clientLogging != 256) {
                codedOutputByteBufferNano.writeSInt32(11, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                codedOutputByteBufferNano.writeSInt32(12, this.serverLogging);
            }
            if (this.securityLevel != 0) {
                codedOutputByteBufferNano.writeInt32(13, this.securityLevel);
            }
            if (this.responseFormat != 0) {
                codedOutputByteBufferNano.writeInt32(15, this.responseFormat);
            }
            if (this.requestFormat != 0) {
                codedOutputByteBufferNano.writeInt32(17, this.requestFormat);
            }
            if (this.streamType != null && !this.streamType.equals("")) {
                codedOutputByteBufferNano.writeString(18, this.streamType);
            }
            if (this.securityLabel != null && !this.securityLabel.equals("")) {
                codedOutputByteBufferNano.writeString(19, this.securityLabel);
            }
            if (this.clientStreaming) {
                codedOutputByteBufferNano.writeBool(20, this.clientStreaming);
            }
            if (this.serverStreaming) {
                codedOutputByteBufferNano.writeBool(21, this.serverStreaming);
            }
            if (this.legacyStreamType != null && !this.legacyStreamType.equals("")) {
                codedOutputByteBufferNano.writeString(22, this.legacyStreamType);
            }
            if (this.legacyResultType != null && !this.legacyResultType.equals("")) {
                codedOutputByteBufferNano.writeString(23, this.legacyResultType);
            }
            if (this.legacyClientInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(24, this.legacyClientInitialTokens);
            }
            if (this.legacyServerInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(25, this.legacyServerInitialTokens);
            }
            if (this.endUserCredsRequested) {
                codedOutputByteBufferNano.writeBool(26, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                codedOutputByteBufferNano.writeInt32(27, this.logLevel);
            }
            if (this.legacyTokenUnit != 1) {
                codedOutputByteBufferNano.writeInt32(28, this.legacyTokenUnit);
            }
            if (this.goLegacyChannelApi) {
                codedOutputByteBufferNano.writeBool(29, this.goLegacyChannelApi);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.idempotencyLevel != 0) {
                codedOutputByteBufferNano.writeInt32(34, this.idempotencyLevel);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class OneofDescriptorProto extends ExtendableMessageNano<OneofDescriptorProto> {
        private static volatile OneofDescriptorProto[] _emptyArray;
        public String name;
        public OneofOptions options;

        public OneofDescriptorProto() {
            clear();
        }

        public static OneofDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new OneofDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static OneofDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new OneofDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static OneofDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (OneofDescriptorProto) MessageNano.mergeFrom(new OneofDescriptorProto(), bArr);
        }

        public OneofDescriptorProto clear() {
            this.name = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            return this.options != null ? computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(2, this.options) : computeSerializedSize;
        }

        public OneofDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    if (this.options == null) {
                        this.options = new OneofOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(2, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class OneofOptions extends ExtendableMessageNano<OneofOptions> {
        private static volatile OneofOptions[] _emptyArray;
        public UninterpretedOption[] uninterpretedOption;

        public OneofOptions() {
            clear();
        }

        public static OneofOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new OneofOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static OneofOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new OneofOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static OneofOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (OneofOptions) MessageNano.mergeFrom(new OneofOptions(), bArr);
        }

        public OneofOptions clear() {
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public OneofOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 7994) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                    }
                    while (length < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    uninterpretedOptionArr[length] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class ServiceDescriptorProto extends ExtendableMessageNano<ServiceDescriptorProto> {
        private static volatile ServiceDescriptorProto[] _emptyArray;
        public MethodDescriptorProto[] method;
        public String name;
        public ServiceOptions options;
        public StreamDescriptorProto[] stream;

        public ServiceDescriptorProto() {
            clear();
        }

        public static ServiceDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ServiceDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static ServiceDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ServiceDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static ServiceDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ServiceDescriptorProto) MessageNano.mergeFrom(new ServiceDescriptorProto(), bArr);
        }

        public ServiceDescriptorProto clear() {
            this.name = "";
            this.method = MethodDescriptorProto.emptyArray();
            this.stream = StreamDescriptorProto.emptyArray();
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.method != null && this.method.length > 0) {
                int i = computeSerializedSize;
                for (MethodDescriptorProto methodDescriptorProto : this.method) {
                    if (methodDescriptorProto != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(2, methodDescriptorProto);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(3, this.options);
            }
            if (this.stream != null && this.stream.length > 0) {
                for (StreamDescriptorProto streamDescriptorProto : this.stream) {
                    if (streamDescriptorProto != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(4, streamDescriptorProto);
                    }
                }
            }
            return computeSerializedSize;
        }

        public ServiceDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    int length = this.method == null ? 0 : this.method.length;
                    MethodDescriptorProto[] methodDescriptorProtoArr = new MethodDescriptorProto[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.method, 0, methodDescriptorProtoArr, 0, length);
                    }
                    while (length < methodDescriptorProtoArr.length - 1) {
                        methodDescriptorProtoArr[length] = new MethodDescriptorProto();
                        codedInputByteBufferNano.readMessage(methodDescriptorProtoArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    methodDescriptorProtoArr[length] = new MethodDescriptorProto();
                    codedInputByteBufferNano.readMessage(methodDescriptorProtoArr[length]);
                    this.method = methodDescriptorProtoArr;
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new ServiceOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 34) {
                    int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    int length2 = this.stream == null ? 0 : this.stream.length;
                    StreamDescriptorProto[] streamDescriptorProtoArr = new StreamDescriptorProto[(repeatedFieldArrayLength2 + length2)];
                    if (length2 != 0) {
                        System.arraycopy(this.stream, 0, streamDescriptorProtoArr, 0, length2);
                    }
                    while (length2 < streamDescriptorProtoArr.length - 1) {
                        streamDescriptorProtoArr[length2] = new StreamDescriptorProto();
                        codedInputByteBufferNano.readMessage(streamDescriptorProtoArr[length2]);
                        codedInputByteBufferNano.readTag();
                        length2++;
                    }
                    streamDescriptorProtoArr[length2] = new StreamDescriptorProto();
                    codedInputByteBufferNano.readMessage(streamDescriptorProtoArr[length2]);
                    this.stream = streamDescriptorProtoArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.method != null && this.method.length > 0) {
                for (MethodDescriptorProto methodDescriptorProto : this.method) {
                    if (methodDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(2, methodDescriptorProto);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            if (this.stream != null && this.stream.length > 0) {
                for (StreamDescriptorProto streamDescriptorProto : this.stream) {
                    if (streamDescriptorProto != null) {
                        codedOutputByteBufferNano.writeMessage(4, streamDescriptorProto);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class ServiceOptions extends ExtendableMessageNano<ServiceOptions> {
        private static volatile ServiceOptions[] _emptyArray;
        public boolean deprecated;
        public double failureDetectionDelay;
        public boolean multicastStub;
        public UninterpretedOption[] uninterpretedOption;

        public ServiceOptions() {
            clear();
        }

        public static ServiceOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ServiceOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static ServiceOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ServiceOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static ServiceOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ServiceOptions) MessageNano.mergeFrom(new ServiceOptions(), bArr);
        }

        public ServiceOptions clear() {
            this.multicastStub = false;
            this.failureDetectionDelay = -1.0d;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (Double.doubleToLongBits(this.failureDetectionDelay) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(16, this.failureDetectionDelay);
            }
            if (this.multicastStub) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(20, this.multicastStub);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public ServiceOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 129) {
                    this.failureDetectionDelay = codedInputByteBufferNano.readDouble();
                } else if (readTag == 160) {
                    this.multicastStub = codedInputByteBufferNano.readBool();
                } else if (readTag == 264) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                    UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                    }
                    while (length < uninterpretedOptionArr.length - 1) {
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    uninterpretedOptionArr[length] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                    this.uninterpretedOption = uninterpretedOptionArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (Double.doubleToLongBits(this.failureDetectionDelay) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(16, this.failureDetectionDelay);
            }
            if (this.multicastStub) {
                codedOutputByteBufferNano.writeBool(20, this.multicastStub);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class SourceCodeInfo extends ExtendableMessageNano<SourceCodeInfo> {
        private static volatile SourceCodeInfo[] _emptyArray;
        public Location[] location;

        public static final class Location extends ExtendableMessageNano<Location> {
            private static volatile Location[] _emptyArray;
            public String leadingComments;
            public String[] leadingDetachedComments;
            public int[] path;
            public int[] span;
            public String trailingComments;

            public Location() {
                clear();
            }

            public static Location[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new Location[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static Location parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new Location().mergeFrom(codedInputByteBufferNano);
            }

            public static Location parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (Location) MessageNano.mergeFrom(new Location(), bArr);
            }

            public Location clear() {
                this.path = WireFormatNano.EMPTY_INT_ARRAY;
                this.span = WireFormatNano.EMPTY_INT_ARRAY;
                this.leadingComments = "";
                this.trailingComments = "";
                this.leadingDetachedComments = WireFormatNano.EMPTY_STRING_ARRAY;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    for (int computeInt32SizeNoTag : this.path) {
                        i += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag);
                    }
                    computeSerializedSize = computeSerializedSize + i + 1 + CodedOutputByteBufferNano.computeRawVarint32Size(i);
                }
                if (this.span != null && this.span.length > 0) {
                    int i2 = 0;
                    for (int computeInt32SizeNoTag2 : this.span) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag2);
                    }
                    computeSerializedSize = computeSerializedSize + i2 + 1 + CodedOutputByteBufferNano.computeRawVarint32Size(i2);
                }
                if (this.leadingComments != null && !this.leadingComments.equals("")) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.leadingComments);
                }
                if (this.trailingComments != null && !this.trailingComments.equals("")) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(4, this.trailingComments);
                }
                if (this.leadingDetachedComments == null || this.leadingDetachedComments.length <= 0) {
                    return computeSerializedSize;
                }
                int i3 = 0;
                int i4 = 0;
                for (String str : this.leadingDetachedComments) {
                    if (str != null) {
                        i4++;
                        i3 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                }
                return computeSerializedSize + i3 + (1 * i4);
            }

            public Location mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 8);
                        int length = this.path == null ? 0 : this.path.length;
                        int[] iArr = new int[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.path, 0, iArr, 0, length);
                        }
                        while (length < iArr.length - 1) {
                            iArr[length] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        iArr[length] = codedInputByteBufferNano.readInt32();
                        this.path = iArr;
                    } else if (readTag == 10) {
                        int pushLimit = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        int position = codedInputByteBufferNano.getPosition();
                        int i = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        codedInputByteBufferNano.rewindToPosition(position);
                        int length2 = this.path == null ? 0 : this.path.length;
                        int[] iArr2 = new int[(i + length2)];
                        if (length2 != 0) {
                            System.arraycopy(this.path, 0, iArr2, 0, length2);
                        }
                        while (length2 < iArr2.length) {
                            iArr2[length2] = codedInputByteBufferNano.readInt32();
                            length2++;
                        }
                        this.path = iArr2;
                        codedInputByteBufferNano.popLimit(pushLimit);
                    } else if (readTag == 16) {
                        int repeatedFieldArrayLength2 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 16);
                        int length3 = this.span == null ? 0 : this.span.length;
                        int[] iArr3 = new int[(repeatedFieldArrayLength2 + length3)];
                        if (length3 != 0) {
                            System.arraycopy(this.span, 0, iArr3, 0, length3);
                        }
                        while (length3 < iArr3.length - 1) {
                            iArr3[length3] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            length3++;
                        }
                        iArr3[length3] = codedInputByteBufferNano.readInt32();
                        this.span = iArr3;
                    } else if (readTag == 18) {
                        int pushLimit2 = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        int position2 = codedInputByteBufferNano.getPosition();
                        int i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(position2);
                        int length4 = this.span == null ? 0 : this.span.length;
                        int[] iArr4 = new int[(i2 + length4)];
                        if (length4 != 0) {
                            System.arraycopy(this.span, 0, iArr4, 0, length4);
                        }
                        while (length4 < iArr4.length) {
                            iArr4[length4] = codedInputByteBufferNano.readInt32();
                            length4++;
                        }
                        this.span = iArr4;
                        codedInputByteBufferNano.popLimit(pushLimit2);
                    } else if (readTag == 26) {
                        this.leadingComments = codedInputByteBufferNano.readString();
                    } else if (readTag == 34) {
                        this.trailingComments = codedInputByteBufferNano.readString();
                    } else if (readTag == 50) {
                        int repeatedFieldArrayLength3 = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        int length5 = this.leadingDetachedComments == null ? 0 : this.leadingDetachedComments.length;
                        String[] strArr = new String[(repeatedFieldArrayLength3 + length5)];
                        if (length5 != 0) {
                            System.arraycopy(this.leadingDetachedComments, 0, strArr, 0, length5);
                        }
                        while (length5 < strArr.length - 1) {
                            strArr[length5] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            length5++;
                        }
                        strArr[length5] = codedInputByteBufferNano.readString();
                        this.leadingDetachedComments = strArr;
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    for (int computeInt32SizeNoTag : this.path) {
                        i += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag);
                    }
                    codedOutputByteBufferNano.writeRawVarint32(10);
                    codedOutputByteBufferNano.writeRawVarint32(i);
                    for (int writeInt32NoTag : this.path) {
                        codedOutputByteBufferNano.writeInt32NoTag(writeInt32NoTag);
                    }
                }
                if (this.span != null && this.span.length > 0) {
                    int i2 = 0;
                    for (int computeInt32SizeNoTag2 : this.span) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(computeInt32SizeNoTag2);
                    }
                    codedOutputByteBufferNano.writeRawVarint32(18);
                    codedOutputByteBufferNano.writeRawVarint32(i2);
                    for (int writeInt32NoTag2 : this.span) {
                        codedOutputByteBufferNano.writeInt32NoTag(writeInt32NoTag2);
                    }
                }
                if (this.leadingComments != null && !this.leadingComments.equals("")) {
                    codedOutputByteBufferNano.writeString(3, this.leadingComments);
                }
                if (this.trailingComments != null && !this.trailingComments.equals("")) {
                    codedOutputByteBufferNano.writeString(4, this.trailingComments);
                }
                if (this.leadingDetachedComments != null && this.leadingDetachedComments.length > 0) {
                    for (String str : this.leadingDetachedComments) {
                        if (str != null) {
                            codedOutputByteBufferNano.writeString(6, str);
                        }
                    }
                }
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public SourceCodeInfo() {
            clear();
        }

        public static SourceCodeInfo[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new SourceCodeInfo[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static SourceCodeInfo parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new SourceCodeInfo().mergeFrom(codedInputByteBufferNano);
        }

        public static SourceCodeInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (SourceCodeInfo) MessageNano.mergeFrom(new SourceCodeInfo(), bArr);
        }

        public SourceCodeInfo clear() {
            this.location = Location.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.location != null && this.location.length > 0) {
                for (Location location2 : this.location) {
                    if (location2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, location2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public SourceCodeInfo mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    int length = this.location == null ? 0 : this.location.length;
                    Location[] locationArr = new Location[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.location, 0, locationArr, 0, length);
                    }
                    while (length < locationArr.length - 1) {
                        locationArr[length] = new Location();
                        codedInputByteBufferNano.readMessage(locationArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    locationArr[length] = new Location();
                    codedInputByteBufferNano.readMessage(locationArr[length]);
                    this.location = locationArr;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.location != null && this.location.length > 0) {
                for (Location location2 : this.location) {
                    if (location2 != null) {
                        codedOutputByteBufferNano.writeMessage(1, location2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class StreamDescriptorProto extends ExtendableMessageNano<StreamDescriptorProto> {
        private static volatile StreamDescriptorProto[] _emptyArray;
        public String clientMessageType;
        public String name;
        public StreamOptions options;
        public String serverMessageType;

        public StreamDescriptorProto() {
            clear();
        }

        public static StreamDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new StreamDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static StreamDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new StreamDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }

        public static StreamDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (StreamDescriptorProto) MessageNano.mergeFrom(new StreamDescriptorProto(), bArr);
        }

        public StreamDescriptorProto clear() {
            this.name = "";
            this.clientMessageType = "";
            this.serverMessageType = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && !this.name.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.clientMessageType != null && !this.clientMessageType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.clientMessageType);
            }
            if (this.serverMessageType != null && !this.serverMessageType.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.serverMessageType);
            }
            return this.options != null ? computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(4, this.options) : computeSerializedSize;
        }

        public StreamDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    this.clientMessageType = codedInputByteBufferNano.readString();
                } else if (readTag == 26) {
                    this.serverMessageType = codedInputByteBufferNano.readString();
                } else if (readTag == 34) {
                    if (this.options == null) {
                        this.options = new StreamOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && !this.name.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.clientMessageType != null && !this.clientMessageType.equals("")) {
                codedOutputByteBufferNano.writeString(2, this.clientMessageType);
            }
            if (this.serverMessageType != null && !this.serverMessageType.equals("")) {
                codedOutputByteBufferNano.writeString(3, this.serverMessageType);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(4, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class StreamOptions extends ExtendableMessageNano<StreamOptions> {
        private static volatile StreamOptions[] _emptyArray;
        public long clientInitialTokens;
        public int clientLogging;
        public double deadline;
        public boolean deprecated;
        public boolean endUserCredsRequested;
        public boolean failFast;
        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public int logLevel;
        public String securityLabel;
        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public int securityLevel;
        public long serverInitialTokens;
        public int serverLogging;
        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public int tokenUnit;
        public UninterpretedOption[] uninterpretedOption;

        public interface TokenUnit {
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int BYTE = 1;
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int MESSAGE = 0;
        }

        public StreamOptions() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int checkTokenUnitOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder sb = new StringBuilder(41);
            sb.append(i);
            sb.append(" is not a valid enum TokenUnit");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int[] checkTokenUnitOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkTokenUnitOrThrow : iArr2) {
                checkTokenUnitOrThrow(checkTokenUnitOrThrow);
            }
            return iArr2;
        }

        public static StreamOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new StreamOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static StreamOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new StreamOptions().mergeFrom(codedInputByteBufferNano);
        }

        public static StreamOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (StreamOptions) MessageNano.mergeFrom(new StreamOptions(), bArr);
        }

        public StreamOptions clear() {
            this.clientInitialTokens = -1;
            this.serverInitialTokens = -1;
            this.tokenUnit = 0;
            this.securityLevel = 0;
            this.securityLabel = "";
            this.clientLogging = 256;
            this.serverLogging = 256;
            this.deadline = -1.0d;
            this.failFast = false;
            this.endUserCredsRequested = false;
            this.logLevel = 2;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.clientInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(1, this.clientInitialTokens);
            }
            if (this.serverInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(2, this.serverInitialTokens);
            }
            if (this.tokenUnit != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.tokenUnit);
            }
            if (this.securityLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.securityLevel);
            }
            if (this.securityLabel != null && !this.securityLabel.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(5, this.securityLabel);
            }
            if (this.clientLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(6, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(7, this.serverLogging);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(8, this.deadline);
            }
            if (this.failFast) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(9, this.failFast);
            }
            if (this.endUserCredsRequested) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(11, this.logLevel);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, uninterpretedOption2);
                    }
                }
            }
            return computeSerializedSize;
        }

        public StreamOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        this.clientInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 16:
                        this.serverInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 24:
                        int position = codedInputByteBufferNano.getPosition();
                        try {
                            this.tokenUnit = checkTokenUnitOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 32:
                        int position2 = codedInputByteBufferNano.getPosition();
                        try {
                            this.securityLevel = MethodOptions.checkSecurityLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position2);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 42:
                        this.securityLabel = codedInputByteBufferNano.readString();
                        break;
                    case 48:
                        this.clientLogging = codedInputByteBufferNano.readInt32();
                        break;
                    case 56:
                        this.serverLogging = codedInputByteBufferNano.readInt32();
                        break;
                    case 65:
                        this.deadline = codedInputByteBufferNano.readDouble();
                        break;
                    case 72:
                        this.failFast = codedInputByteBufferNano.readBool();
                        break;
                    case 80:
                        this.endUserCredsRequested = codedInputByteBufferNano.readBool();
                        break;
                    case 88:
                        int position3 = codedInputByteBufferNano.getPosition();
                        try {
                            this.logLevel = MethodOptions.checkLogLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e3) {
                            codedInputByteBufferNano.rewindToPosition(position3);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 264:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        int length = this.uninterpretedOption == null ? 0 : this.uninterpretedOption.length;
                        UninterpretedOption[] uninterpretedOptionArr = new UninterpretedOption[(repeatedFieldArrayLength + length)];
                        if (length != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, uninterpretedOptionArr, 0, length);
                        }
                        while (length < uninterpretedOptionArr.length - 1) {
                            uninterpretedOptionArr[length] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                            codedInputByteBufferNano.readTag();
                            length++;
                        }
                        uninterpretedOptionArr[length] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(uninterpretedOptionArr[length]);
                        this.uninterpretedOption = uninterpretedOptionArr;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.clientInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(1, this.clientInitialTokens);
            }
            if (this.serverInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(2, this.serverInitialTokens);
            }
            if (this.tokenUnit != 0) {
                codedOutputByteBufferNano.writeInt32(3, this.tokenUnit);
            }
            if (this.securityLevel != 0) {
                codedOutputByteBufferNano.writeInt32(4, this.securityLevel);
            }
            if (this.securityLabel != null && !this.securityLabel.equals("")) {
                codedOutputByteBufferNano.writeString(5, this.securityLabel);
            }
            if (this.clientLogging != 256) {
                codedOutputByteBufferNano.writeInt32(6, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                codedOutputByteBufferNano.writeInt32(7, this.serverLogging);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(8, this.deadline);
            }
            if (this.failFast) {
                codedOutputByteBufferNano.writeBool(9, this.failFast);
            }
            if (this.endUserCredsRequested) {
                codedOutputByteBufferNano.writeBool(10, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                codedOutputByteBufferNano.writeInt32(11, this.logLevel);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (UninterpretedOption uninterpretedOption2 : this.uninterpretedOption) {
                    if (uninterpretedOption2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, uninterpretedOption2);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    public static final class UninterpretedOption extends ExtendableMessageNano<UninterpretedOption> {
        private static volatile UninterpretedOption[] _emptyArray;
        public String aggregateValue;
        public double doubleValue;
        public String identifierValue;
        public NamePart[] name;
        public long negativeIntValue;
        public long positiveIntValue;
        public byte[] stringValue;

        public static final class NamePart extends ExtendableMessageNano<NamePart> {
            private static volatile NamePart[] _emptyArray;
            public boolean isExtension;
            public String namePart;

            public NamePart() {
                clear();
            }

            public static NamePart[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new NamePart[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public static NamePart parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new NamePart().mergeFrom(codedInputByteBufferNano);
            }

            public static NamePart parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (NamePart) MessageNano.mergeFrom(new NamePart(), bArr);
            }

            public NamePart clear() {
                this.namePart = "";
                this.isExtension = false;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            /* access modifiers changed from: protected */
            public int computeSerializedSize() {
                return super.computeSerializedSize() + CodedOutputByteBufferNano.computeStringSize(1, this.namePart) + CodedOutputByteBufferNano.computeBoolSize(2, this.isExtension);
            }

            public NamePart mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 10) {
                        this.namePart = codedInputByteBufferNano.readString();
                    } else if (readTag == 16) {
                        this.isExtension = codedInputByteBufferNano.readBool();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                codedOutputByteBufferNano.writeString(1, this.namePart);
                codedOutputByteBufferNano.writeBool(2, this.isExtension);
                super.writeTo(codedOutputByteBufferNano);
            }
        }

        public UninterpretedOption() {
            clear();
        }

        public static UninterpretedOption[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new UninterpretedOption[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static UninterpretedOption parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new UninterpretedOption().mergeFrom(codedInputByteBufferNano);
        }

        public static UninterpretedOption parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (UninterpretedOption) MessageNano.mergeFrom(new UninterpretedOption(), bArr);
        }

        public UninterpretedOption clear() {
            this.name = NamePart.emptyArray();
            this.identifierValue = "";
            this.positiveIntValue = 0;
            this.negativeIntValue = 0;
            this.doubleValue = 0.0d;
            this.stringValue = WireFormatNano.EMPTY_BYTES;
            this.aggregateValue = "";
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && this.name.length > 0) {
                for (NamePart namePart : this.name) {
                    if (namePart != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(2, namePart);
                    }
                }
            }
            if (this.identifierValue != null && !this.identifierValue.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.identifierValue);
            }
            if (this.positiveIntValue != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeUInt64Size(4, this.positiveIntValue);
            }
            if (this.negativeIntValue != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(5, this.negativeIntValue);
            }
            if (Double.doubleToLongBits(this.doubleValue) != Double.doubleToLongBits(0.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(6, this.doubleValue);
            }
            if (!Arrays.equals(this.stringValue, WireFormatNano.EMPTY_BYTES)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBytesSize(7, this.stringValue);
            }
            return (this.aggregateValue == null || this.aggregateValue.equals("")) ? computeSerializedSize : computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(8, this.aggregateValue);
        }

        public UninterpretedOption mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 18) {
                    int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    int length = this.name == null ? 0 : this.name.length;
                    NamePart[] namePartArr = new NamePart[(repeatedFieldArrayLength + length)];
                    if (length != 0) {
                        System.arraycopy(this.name, 0, namePartArr, 0, length);
                    }
                    while (length < namePartArr.length - 1) {
                        namePartArr[length] = new NamePart();
                        codedInputByteBufferNano.readMessage(namePartArr[length]);
                        codedInputByteBufferNano.readTag();
                        length++;
                    }
                    namePartArr[length] = new NamePart();
                    codedInputByteBufferNano.readMessage(namePartArr[length]);
                    this.name = namePartArr;
                } else if (readTag == 26) {
                    this.identifierValue = codedInputByteBufferNano.readString();
                } else if (readTag == 32) {
                    this.positiveIntValue = codedInputByteBufferNano.readUInt64();
                } else if (readTag == 40) {
                    this.negativeIntValue = codedInputByteBufferNano.readInt64();
                } else if (readTag == 49) {
                    this.doubleValue = codedInputByteBufferNano.readDouble();
                } else if (readTag == 58) {
                    this.stringValue = codedInputByteBufferNano.readBytes();
                } else if (readTag == 66) {
                    this.aggregateValue = codedInputByteBufferNano.readString();
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && this.name.length > 0) {
                for (NamePart namePart : this.name) {
                    if (namePart != null) {
                        codedOutputByteBufferNano.writeMessage(2, namePart);
                    }
                }
            }
            if (this.identifierValue != null && !this.identifierValue.equals("")) {
                codedOutputByteBufferNano.writeString(3, this.identifierValue);
            }
            if (this.positiveIntValue != 0) {
                codedOutputByteBufferNano.writeUInt64(4, this.positiveIntValue);
            }
            if (this.negativeIntValue != 0) {
                codedOutputByteBufferNano.writeInt64(5, this.negativeIntValue);
            }
            if (Double.doubleToLongBits(this.doubleValue) != Double.doubleToLongBits(0.0d)) {
                codedOutputByteBufferNano.writeDouble(6, this.doubleValue);
            }
            if (!Arrays.equals(this.stringValue, WireFormatNano.EMPTY_BYTES)) {
                codedOutputByteBufferNano.writeBytes(7, this.stringValue);
            }
            if (this.aggregateValue != null && !this.aggregateValue.equals("")) {
                codedOutputByteBufferNano.writeString(8, this.aggregateValue);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    private DescriptorProtos() {
    }
}

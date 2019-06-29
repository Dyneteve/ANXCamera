package com.google.android.apps.lens.library.base.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.InternalNano;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import com.google.protobuf.nano.NanoEnumValue;
import java.io.IOException;

public abstract class LensSdkParamsProto {

    public static final class LensSdkParams extends ExtendableMessageNano<LensSdkParams> implements Cloneable {
        private static volatile LensSdkParams[] _emptyArray;
        public String agsaVersionName;
        @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
        public int arStickersAvailabilityStatus;
        @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
        public int lensAvailabilityStatus;
        public String lensSdkVersion;

        public interface LensAvailabilityStatus {
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_AVAILABILITY_UNKNOWN = -1;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_READY = 0;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE = 1;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE_DEVICE_INCOMPATIBLE = 3;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE_DEVICE_LOCKED = 5;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE_INVALID_CURSOR = 4;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE_LOCALE_NOT_SUPPORTED = 2;
            @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
            public static final int LENS_UNAVAILABLE_UNKNOWN_ERROR_CODE = 6;
        }

        public LensSdkParams() {
            clear();
        }

        @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
        public static int checkLensAvailabilityStatusOrThrow(int i) {
            if (i >= -1 && i <= 6) {
                return i;
            }
            StringBuilder sb = new StringBuilder(54);
            sb.append(i);
            sb.append(" is not a valid enum LensAvailabilityStatus");
            throw new IllegalArgumentException(sb.toString());
        }

        @NanoEnumValue(legacy = false, value = LensAvailabilityStatus.class)
        public static int[] checkLensAvailabilityStatusOrThrow(int[] iArr) {
            int[] iArr2 = (int[]) iArr.clone();
            for (int checkLensAvailabilityStatusOrThrow : iArr2) {
                checkLensAvailabilityStatusOrThrow(checkLensAvailabilityStatusOrThrow);
            }
            return iArr2;
        }

        public static LensSdkParams[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new LensSdkParams[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static LensSdkParams parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new LensSdkParams().mergeFrom(codedInputByteBufferNano);
        }

        public static LensSdkParams parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (LensSdkParams) MessageNano.mergeFrom(new LensSdkParams(), bArr);
        }

        public LensSdkParams clear() {
            this.lensSdkVersion = "";
            this.agsaVersionName = "";
            this.lensAvailabilityStatus = -1;
            this.arStickersAvailabilityStatus = -1;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public LensSdkParams clone() {
            try {
                return (LensSdkParams) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        /* access modifiers changed from: protected */
        public int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.lensSdkVersion != null && !this.lensSdkVersion.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.lensSdkVersion);
            }
            if (this.agsaVersionName != null && !this.agsaVersionName.equals("")) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.agsaVersionName);
            }
            if (this.lensAvailabilityStatus != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.lensAvailabilityStatus);
            }
            return this.arStickersAvailabilityStatus != -1 ? computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(4, this.arStickersAvailabilityStatus) : computeSerializedSize;
        }

        public LensSdkParams mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.lensSdkVersion = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    this.agsaVersionName = codedInputByteBufferNano.readString();
                } else if (readTag == 24) {
                    int position = codedInputByteBufferNano.getPosition();
                    try {
                        this.lensAvailabilityStatus = checkLensAvailabilityStatusOrThrow(codedInputByteBufferNano.readInt32());
                    } catch (IllegalArgumentException e) {
                        codedInputByteBufferNano.rewindToPosition(position);
                        storeUnknownField(codedInputByteBufferNano, readTag);
                    }
                } else if (readTag == 32) {
                    int position2 = codedInputByteBufferNano.getPosition();
                    try {
                        this.arStickersAvailabilityStatus = checkLensAvailabilityStatusOrThrow(codedInputByteBufferNano.readInt32());
                    } catch (IllegalArgumentException e2) {
                        codedInputByteBufferNano.rewindToPosition(position2);
                        storeUnknownField(codedInputByteBufferNano, readTag);
                    }
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.lensSdkVersion != null && !this.lensSdkVersion.equals("")) {
                codedOutputByteBufferNano.writeString(1, this.lensSdkVersion);
            }
            if (this.agsaVersionName != null && !this.agsaVersionName.equals("")) {
                codedOutputByteBufferNano.writeString(2, this.agsaVersionName);
            }
            if (this.lensAvailabilityStatus != -1) {
                codedOutputByteBufferNano.writeInt32(3, this.lensAvailabilityStatus);
            }
            if (this.arStickersAvailabilityStatus != -1) {
                codedOutputByteBufferNano.writeInt32(4, this.arStickersAvailabilityStatus);
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }

    private LensSdkParamsProto() {
    }
}

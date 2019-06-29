package com.google.android.apps.gsa.search.shared.service.proto;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.FieldType;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.GeneratedMessageLite.DefaultInstanceBasedParser;
import com.google.protobuf.GeneratedMessageLite.ExtendableBuilder;
import com.google.protobuf.GeneratedMessageLite.ExtendableMessage;
import com.google.protobuf.GeneratedMessageLite.MethodToInvoke;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.Parser;
import com.google.protobuf.ProtoField;
import com.google.protobuf.ProtoMessage;
import com.google.protobuf.ProtoPresenceBits;
import com.google.protobuf.ProtoPresenceCheckedField;
import com.google.protobuf.ProtoSyntax;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

@ProtoMessage(checkInitialized = {}, messageSetWireFormat = false, protoSyntax = ProtoSyntax.PROTO2)
public final class ClientEventProto extends ExtendableMessage<ClientEventProto, Builder> implements ClientEventProtoOrBuilder {
    /* access modifiers changed from: private */
    public static final ClientEventProto DEFAULT_INSTANCE = new ClientEventProto();
    public static final int EVENT_ID_FIELD_NUMBER = 1;
    private static volatile Parser<ClientEventProto> PARSER;
    @ProtoPresenceBits(id = 0)
    private int bitField0_;
    @ProtoField(fieldNumber = 1, isRequired = false, type = FieldType.INT32)
    @ProtoPresenceCheckedField(mask = 1, presenceBitsId = 0)
    private int eventId_;
    private byte memoizedIsInitialized = 2;

    /* renamed from: com.google.android.apps.gsa.search.shared.service.proto.ClientEventProto$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke = new int[MethodToInvoke.values().length];

        static {
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.NEW_MUTABLE_INSTANCE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.NEW_BUILDER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.BUILD_MESSAGE_INFO.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.GET_DEFAULT_INSTANCE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.GET_PARSER.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.GET_MEMOIZED_IS_INITIALIZED.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[MethodToInvoke.SET_MEMOIZED_IS_INITIALIZED.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    public static final class Builder extends ExtendableBuilder<ClientEventProto, Builder> implements ClientEventProtoOrBuilder {
        private Builder() {
            super(ClientEventProto.DEFAULT_INSTANCE);
        }

        /* synthetic */ Builder(AnonymousClass1 r1) {
            this();
        }

        public Builder clearEventId() {
            copyOnWrite();
            this.instance.clearEventId();
            return this;
        }

        public int getEventId() {
            return this.instance.getEventId();
        }

        public boolean hasEventId() {
            return this.instance.hasEventId();
        }

        public Builder setEventId(int i) {
            copyOnWrite();
            this.instance.setEventId(i);
            return this;
        }
    }

    static {
        GeneratedMessageLite.registerDefaultInstance(ClientEventProto.class, DEFAULT_INSTANCE);
    }

    private ClientEventProto() {
    }

    /* access modifiers changed from: private */
    public void clearEventId() {
        this.bitField0_ &= -2;
        this.eventId_ = 0;
    }

    public static ClientEventProto getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.createBuilder();
    }

    public static Builder newBuilder(ClientEventProto clientEventProto) {
        return DEFAULT_INSTANCE.createBuilder(clientEventProto);
    }

    public static ClientEventProto parseDelimitedFrom(InputStream inputStream) throws IOException {
        return parseDelimitedFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static ClientEventProto parseDelimitedFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return parseDelimitedFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static ClientEventProto parseFrom(ByteString byteString) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString);
    }

    public static ClientEventProto parseFrom(ByteString byteString, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteString, extensionRegistryLite);
    }

    public static ClientEventProto parseFrom(CodedInputStream codedInputStream) throws IOException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream);
    }

    public static ClientEventProto parseFrom(CodedInputStream codedInputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, codedInputStream, extensionRegistryLite);
    }

    public static ClientEventProto parseFrom(InputStream inputStream) throws IOException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream);
    }

    public static ClientEventProto parseFrom(InputStream inputStream, ExtensionRegistryLite extensionRegistryLite) throws IOException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, inputStream, extensionRegistryLite);
    }

    public static ClientEventProto parseFrom(ByteBuffer byteBuffer) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer);
    }

    public static ClientEventProto parseFrom(ByteBuffer byteBuffer, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, byteBuffer, extensionRegistryLite);
    }

    public static ClientEventProto parseFrom(byte[] bArr) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr);
    }

    public static ClientEventProto parseFrom(byte[] bArr, ExtensionRegistryLite extensionRegistryLite) throws InvalidProtocolBufferException {
        return GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, bArr, extensionRegistryLite);
    }

    public static Parser<ClientEventProto> parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }

    /* access modifiers changed from: private */
    public void setEventId(int i) {
        this.bitField0_ |= 1;
        this.eventId_ = i;
    }

    /* access modifiers changed from: protected */
    public final Object dynamicMethod(MethodToInvoke methodToInvoke, Object obj, Object obj2) {
        int i = 1;
        switch (AnonymousClass1.$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke[methodToInvoke.ordinal()]) {
            case 1:
                return new ClientEventProto();
            case 2:
                return new Builder(null);
            case 3:
                Object[] objArr = {"bitField0_", "eventId_"};
                return newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0002\u0000\u0000\u0000\u0001\u0004\u0000", objArr);
            case 4:
                return DEFAULT_INSTANCE;
            case 5:
                DefaultInstanceBasedParser defaultInstanceBasedParser = PARSER;
                if (defaultInstanceBasedParser == null) {
                    synchronized (ClientEventProto.class) {
                        defaultInstanceBasedParser = PARSER;
                        if (defaultInstanceBasedParser == null) {
                            defaultInstanceBasedParser = new DefaultInstanceBasedParser(DEFAULT_INSTANCE);
                            PARSER = defaultInstanceBasedParser;
                        }
                    }
                }
                return defaultInstanceBasedParser;
            case 6:
                return Byte.valueOf(this.memoizedIsInitialized);
            case 7:
                if (obj == null) {
                    i = 0;
                }
                this.memoizedIsInitialized = (byte) i;
                return null;
            default:
                throw new UnsupportedOperationException();
        }
    }

    public int getEventId() {
        return this.eventId_;
    }

    public boolean hasEventId() {
        return (this.bitField0_ & 1) == 1;
    }
}

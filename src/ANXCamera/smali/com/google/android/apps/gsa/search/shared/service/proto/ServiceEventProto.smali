.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
.super Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;
.source "ServiceEventProto.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProtoOrBuilder;


# annotations
.annotation build Lcom/google/protobuf/ProtoMessage;
    checkInitialized = {}
    messageSetWireFormat = false
    protoSyntax = .enum Lcom/google/protobuf/ProtoSyntax;->PROTO2:Lcom/google/protobuf/ProtoSyntax;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProtoOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

.field public static final EVENT_ID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I
    .annotation build Lcom/google/protobuf/ProtoPresenceBits;
        id = 0x0
    .end annotation
.end field

.field private eventId_:I
    .annotation build Lcom/google/protobuf/ProtoField;
        fieldNumber = 0x1
        isRequired = false
        type = .enum Lcom/google/protobuf/FieldType;->INT32:Lcom/google/protobuf/FieldType;
    .end annotation

    .annotation build Lcom/google/protobuf/ProtoPresenceCheckedField;
        mask = 0x1
        presenceBitsId = 0x0
    .end annotation
.end field

.field private memoizedIsInitialized:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-direct {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;-><init>()V

    sput-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    const-class v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    sget-object v1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, v1}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;-><init>()V

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->memoizedIsInitialized:B

    return-void
.end method

.method static synthetic access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->setEventId(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->clearEventId()V

    return-void
.end method

.method private clearEventId()V
    .locals 1

    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->bitField0_:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->bitField0_:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->eventId_:I

    return-void
.end method

.method public static getDefaultInstance()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object v0
.end method

.method public static newBuilder()Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
    .locals 1

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "prototype"
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-virtual {v0, p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->createBuilder(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/CodedInputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom(Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/nio/ByteBuffer;Lcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "data",
            "extensionRegistry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/ExtensionRegistryLite;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method

.method private setEventId(I)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->bitField0_:I

    iput p1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->eventId_:I

    return-void
.end method


# virtual methods
.method protected final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "method",
            "arg0",
            "arg1"
        }
    .end annotation

    sget-object p3, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;->ordinal()I

    move-result p1

    aget p1, p3, p1

    const/4 p3, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1

    :pswitch_0
    if-nez p2, :cond_0

    move v0, v1

    nop

    :cond_0
    int-to-byte p1, v0

    iput-byte p1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->memoizedIsInitialized:B

    return-object p3

    :pswitch_1
    iget-byte p1, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->memoizedIsInitialized:B

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_2

    const-class p2, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    monitor-enter p2

    :try_start_0
    sget-object p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p1, :cond_1

    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p3, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-direct {p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    sput-object p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->PARSER:Lcom/google/protobuf/Parser;

    :cond_1
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_2
    :goto_0
    return-object p1

    :pswitch_3
    sget-object p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    return-object p1

    :pswitch_4
    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "bitField0_"

    aput-object p2, p1, v1

    const-string p2, "eventId_"

    aput-object p2, p1, v0

    const-string p2, "\u0001\u0001\u0000\u0001\u0001\u0001\u0001\u0002\u0000\u0000\u0000\u0001\u0004\u0000"

    sget-object p3, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->DEFAULT_INSTANCE:Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-static {p3, p2, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->newMessageInfo(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :pswitch_5
    new-instance p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;

    invoke-direct {p1, p3}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$Builder;-><init>(Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto$1;)V

    return-object p1

    :pswitch_6
    new-instance p1, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;

    invoke-direct {p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;-><init>()V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getEventId()I
    .locals 1

    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->eventId_:I

    return v0
.end method

.method public hasEventId()Z
    .locals 2

    iget v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ServiceEventProto;->bitField0_:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

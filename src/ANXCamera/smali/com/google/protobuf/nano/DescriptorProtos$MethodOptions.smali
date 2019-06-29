.class public final Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MethodOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$IdempotencyLevel;,
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$TokenUnit;,
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$LogLevel;,
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Format;,
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$SecurityLevel;,
        Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Protocol;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;


# instance fields
.field public clientLogging:I

.field public clientStreaming:Z

.field public deadline:D

.field public deprecated:Z

.field public duplicateSuppression:Z

.field public endUserCredsRequested:Z

.field public failFast:Z

.field public goLegacyChannelApi:Z

.field public idempotencyLevel:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$IdempotencyLevel;
    .end annotation
.end field

.field public legacyClientInitialTokens:J

.field public legacyResultType:Ljava/lang/String;

.field public legacyServerInitialTokens:J

.field public legacyStreamType:Ljava/lang/String;

.field public legacyTokenUnit:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$TokenUnit;
    .end annotation
.end field

.field public logLevel:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$LogLevel;
    .end annotation
.end field

.field public protocol:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Protocol;
    .end annotation
.end field

.field public requestFormat:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Format;
    .end annotation
.end field

.field public responseFormat:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Format;
    .end annotation
.end field

.field public securityLabel:Ljava/lang/String;

.field public securityLevel:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$SecurityLevel;
    .end annotation
.end field

.field public serverLogging:I

.field public serverStreaming:Z

.field public streamType:Ljava/lang/String;

.field public uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clear()Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    return-void
.end method

.method public static checkFormatOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Format;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x26

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum Format"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkFormatOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Format;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkFormatOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkIdempotencyLevelOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$IdempotencyLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x2

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x30

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum IdempotencyLevel"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkIdempotencyLevelOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$IdempotencyLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkIdempotencyLevelOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkLogLevelOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$LogLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x4

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x28

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum LogLevel"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkLogLevelOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$LogLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkLogLevelOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkProtocolOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Protocol;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x28

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum Protocol"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkProtocolOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$Protocol;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkProtocolOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkSecurityLevelOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$SecurityLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x3

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x2d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum SecurityLevel"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkSecurityLevelOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$SecurityLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkSecurityLevelOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkTokenUnitOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$TokenUnit;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x29

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum TokenUnit"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkTokenUnitOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions$TokenUnit;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkTokenUnitOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
    .locals 2

    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
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

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
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
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
    .locals 3

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    iput-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    const/16 v1, 0x100

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I

    const-string v1, ""

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    const-string v1, ""

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    iput-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    const/4 v1, 0x1

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I

    const/4 v1, 0x2

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I

    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->cachedSize:I

    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 7

    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I

    if-eqz v1, :cond_0

    const/4 v1, 0x7

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    const/16 v1, 0x8

    iget-wide v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeDoubleSize(ID)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    if-eqz v1, :cond_2

    const/16 v1, 0x9

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    if-eqz v1, :cond_3

    const/16 v1, 0xa

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    const/16 v2, 0x100

    if-eq v1, v2, :cond_4

    const/16 v1, 0xb

    iget v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeSInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    if-eq v1, v2, :cond_5

    const/16 v1, 0xc

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeSInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I

    if-eqz v1, :cond_6

    const/16 v1, 0xd

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I

    if-eqz v1, :cond_7

    const/16 v1, 0xf

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I

    if-eqz v1, :cond_8

    const/16 v1, 0x11

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    const/16 v1, 0x12

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const/16 v1, 0x13

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_a
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    if-eqz v1, :cond_b

    const/16 v1, 0x14

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_b
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    if-eqz v1, :cond_c

    const/16 v1, 0x15

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_c
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    const/16 v1, 0x16

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_d
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    const/16 v1, 0x17

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_e
    iget-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_f

    const/16 v1, 0x18

    iget-wide v5, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    invoke-static {v1, v5, v6}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_f
    iget-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_10

    const/16 v1, 0x19

    iget-wide v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt64Size(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_10
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    if-eqz v1, :cond_11

    const/16 v1, 0x1a

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_11
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_12

    const/16 v1, 0x1b

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_12
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_13

    const/16 v1, 0x1c

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_13
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    if-eqz v1, :cond_14

    const/16 v1, 0x1d

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_14
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    if-eqz v1, :cond_15

    const/16 v1, 0x21

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_15
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I

    if-eqz v1, :cond_16

    const/16 v1, 0x22

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_16
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    if-lez v1, :cond_18

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v2, v2

    if-ge v1, v2, :cond_18

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    aget-object v2, v2, v1

    if-eqz v2, :cond_17

    const/16 v3, 0x3e7

    invoke-static {v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_18
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;
    .locals 4
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

    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_3

    return-object p0

    :sswitch_0
    const/16 v0, 0x1f3a

    invoke-static {p1, v0}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_2

    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;-><init>()V

    aput-object v2, v0, v1

    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;-><init>()V

    aput-object v2, v0, v1

    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    goto/16 :goto_3

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkIdempotencyLevelOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_3

    :catch_0
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto/16 :goto_3

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    goto/16 :goto_3

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    goto/16 :goto_3

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkTokenUnitOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_3

    :catch_1
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto/16 :goto_3

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_2
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkLogLevelOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_3

    :catch_2
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto/16 :goto_3

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    goto/16 :goto_3

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt64()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    goto/16 :goto_3

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt64()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    goto/16 :goto_3

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    goto/16 :goto_3

    :sswitch_c
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    goto/16 :goto_3

    :sswitch_d
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_e
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_f
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_3
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkFormatOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_3

    :catch_3
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto/16 :goto_3

    :sswitch_10
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_4
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkFormatOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_3

    :catch_4
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto :goto_3

    :sswitch_11
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_5
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkSecurityLevelOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_3

    :catch_5
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto :goto_3

    :sswitch_12
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readSInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    goto :goto_3

    :sswitch_13
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readSInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    goto :goto_3

    :sswitch_14
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    goto :goto_3

    :sswitch_15
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    goto :goto_3

    :sswitch_16
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    goto :goto_3

    :sswitch_17
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_6
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->checkProtocolOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_3

    :catch_6
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto :goto_3

    :sswitch_18
    return-object p0

    :cond_3
    :goto_3
    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_18
        0x38 -> :sswitch_17
        0x41 -> :sswitch_16
        0x48 -> :sswitch_15
        0x50 -> :sswitch_14
        0x58 -> :sswitch_13
        0x60 -> :sswitch_12
        0x68 -> :sswitch_11
        0x78 -> :sswitch_10
        0x88 -> :sswitch_f
        0x92 -> :sswitch_e
        0x9a -> :sswitch_d
        0xa0 -> :sswitch_c
        0xa8 -> :sswitch_b
        0xb2 -> :sswitch_a
        0xba -> :sswitch_9
        0xc0 -> :sswitch_8
        0xc8 -> :sswitch_7
        0xd0 -> :sswitch_6
        0xd8 -> :sswitch_5
        0xe0 -> :sswitch_4
        0xe8 -> :sswitch_3
        0x108 -> :sswitch_2
        0x110 -> :sswitch_1
        0x1f3a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
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

    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->protocol:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_0
    iget-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    iget-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deadline:D

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeDouble(ID)V

    :cond_1
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x9

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->duplicateSuppression:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_2
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    if-eqz v0, :cond_3

    const/16 v0, 0xa

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->failFast:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_3
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    const/16 v1, 0x100

    if-eq v0, v1, :cond_4

    const/16 v0, 0xb

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientLogging:I

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeSInt32(II)V

    :cond_4
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    if-eq v0, v1, :cond_5

    const/16 v0, 0xc

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverLogging:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeSInt32(II)V

    :cond_5
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I

    if-eqz v0, :cond_6

    const/16 v0, 0xd

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLevel:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_6
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I

    if-eqz v0, :cond_7

    const/16 v0, 0xf

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->responseFormat:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_7
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I

    if-eqz v0, :cond_8

    const/16 v0, 0x11

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->requestFormat:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const/16 v0, 0x12

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->streamType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/16 v0, 0x13

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->securityLabel:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_a
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    if-eqz v0, :cond_b

    const/16 v0, 0x14

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->clientStreaming:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_b
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    if-eqz v0, :cond_c

    const/16 v0, 0x15

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->serverStreaming:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_c
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const/16 v0, 0x16

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyStreamType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_d
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x17

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyResultType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_e
    iget-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_f

    const/16 v0, 0x18

    iget-wide v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyClientInitialTokens:J

    invoke-virtual {p1, v0, v4, v5}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt64(IJ)V

    :cond_f
    iget-wide v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_10

    const/16 v0, 0x19

    iget-wide v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyServerInitialTokens:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt64(IJ)V

    :cond_10
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    if-eqz v0, :cond_11

    const/16 v0, 0x1a

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->endUserCredsRequested:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_11
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_12

    const/16 v0, 0x1b

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->logLevel:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_12
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_13

    const/16 v0, 0x1c

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->legacyTokenUnit:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_13
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    if-eqz v0, :cond_14

    const/16 v0, 0x1d

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->goLegacyChannelApi:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_14
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    if-eqz v0, :cond_15

    const/16 v0, 0x21

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->deprecated:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_15
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I

    if-eqz v0, :cond_16

    const/16 v0, 0x22

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->idempotencyLevel:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_16
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v0, v0

    if-lez v0, :cond_18

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$MethodOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    aget-object v1, v1, v0

    if-eqz v1, :cond_17

    const/16 v2, 0x3e7

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_18
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method

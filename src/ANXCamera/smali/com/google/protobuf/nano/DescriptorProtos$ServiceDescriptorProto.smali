.class public final Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ServiceDescriptorProto"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;


# instance fields
.field public method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

.field public name:Ljava/lang/String;

.field public options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

.field public stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->clear()Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
    .locals 2

    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

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
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
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

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
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

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
    .locals 1

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->cachedSize:I

    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 5

    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    array-length v1, v1

    if-lez v1, :cond_3

    move v1, v0

    move v0, v2

    :goto_0
    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    array-length v3, v3

    if-ge v0, v3, :cond_2

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    aget-object v3, v3, v0

    if-eqz v3, :cond_1

    const/4 v4, 0x2

    invoke-static {v4, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v3

    add-int/2addr v1, v3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    :cond_3
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    if-eqz v1, :cond_4

    const/4 v1, 0x3

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    array-length v1, v1

    if-lez v1, :cond_6

    :goto_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    array-length v1, v1

    if-ge v2, v1, :cond_6

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    aget-object v1, v1, v2

    if-eqz v1, :cond_5

    const/4 v3, 0x4

    invoke-static {v3, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;
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

    if-eqz v0, :cond_c

    const/16 v1, 0xa

    if-eq v0, v1, :cond_a

    const/16 v1, 0x12

    const/4 v2, 0x0

    if-eq v0, v1, :cond_6

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_4

    const/16 v1, 0x22

    if-eq v0, v1, :cond_0

    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_b

    return-object p0

    :cond_0
    nop

    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    if-nez v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    array-length v1, v1

    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    if-eqz v1, :cond_2

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_3

    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    goto :goto_5

    :cond_4
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    if-nez v0, :cond_5

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;-><init>()V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    invoke-virtual {p1, v0}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    goto :goto_5

    :cond_6
    nop

    invoke-static {p1, v1}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    if-nez v1, :cond_7

    move v1, v2

    goto :goto_3

    :cond_7
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    array-length v1, v1

    :goto_3
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    if-eqz v1, :cond_8

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_8
    :goto_4
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_9

    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_9
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;-><init>()V

    aput-object v2, v0, v1

    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    goto :goto_5

    :cond_a
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    nop

    :cond_b
    :goto_5
    goto/16 :goto_0

    :cond_c
    return-object p0
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

    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 4
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

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->name:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->method:[Lcom/google/protobuf/nano/DescriptorProtos$MethodDescriptorProto;

    aget-object v2, v2, v0

    if-eqz v2, :cond_1

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    if-eqz v0, :cond_3

    const/4 v0, 0x3

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->options:Lcom/google/protobuf/nano/DescriptorProtos$ServiceOptions;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    :cond_3
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    array-length v0, v0

    if-lez v0, :cond_5

    :goto_1
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    array-length v0, v0

    if-ge v1, v0, :cond_5

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$ServiceDescriptorProto;->stream:[Lcom/google/protobuf/nano/DescriptorProtos$StreamDescriptorProto;

    aget-object v0, v0, v1

    if-eqz v0, :cond_4

    const/4 v2, 0x4

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method

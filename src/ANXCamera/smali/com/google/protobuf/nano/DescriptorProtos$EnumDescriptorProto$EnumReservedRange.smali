.class public final Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "EnumReservedRange"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;


# instance fields
.field public end:I

.field public start:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->clear()Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    return-void
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
    .locals 2

    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

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
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
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

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
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

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->cachedSize:I

    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 3

    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;
    .locals 2
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

    if-eqz v0, :cond_3

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_2

    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    nop

    :cond_2
    :goto_1
    goto :goto_0

    :cond_3
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

    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
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

    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->start:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_0
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$EnumDescriptorProto$EnumReservedRange;->end:I

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_1
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method

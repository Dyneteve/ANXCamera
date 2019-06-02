.class final Lcom/google/gson/stream/JsonReader$1;
.super Lcom/google/gson/internal/JsonReaderInternalAccess;
.source "JsonReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/stream/JsonReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/gson/internal/JsonReaderInternalAccess;-><init>()V

    return-void
.end method


# virtual methods
.method public promoteNameToValue(Lcom/google/gson/stream/JsonReader;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    instance-of v0, p1, Lcom/google/gson/internal/bind/JsonTreeReader;

    if-eqz v0, :cond_b

    move-object v0, p1

    check-cast v0, Lcom/google/gson/internal/bind/JsonTreeReader;

    invoke-virtual {v0}, Lcom/google/gson/internal/bind/JsonTreeReader;->promoteNameToValue()V

    return-void

    :cond_b
    # getter for: Lcom/google/gson/stream/JsonReader;->peeked:I
    invoke-static {p1}, Lcom/google/gson/stream/JsonReader;->access$000(Lcom/google/gson/stream/JsonReader;)I

    move-result v0

    if-nez v0, :cond_15

    # invokes: Lcom/google/gson/stream/JsonReader;->doPeek()I
    invoke-static {p1}, Lcom/google/gson/stream/JsonReader;->access$100(Lcom/google/gson/stream/JsonReader;)I

    move-result v0

    :cond_15
    const/16 v1, 0xd

    if-ne v0, v1, :cond_1f

    const/16 v1, 0x9

    # setter for: Lcom/google/gson/stream/JsonReader;->peeked:I
    invoke-static {p1, v1}, Lcom/google/gson/stream/JsonReader;->access$002(Lcom/google/gson/stream/JsonReader;I)I

    goto :goto_32

    :cond_1f
    const/16 v1, 0xc

    if-ne v0, v1, :cond_29

    const/16 v1, 0x8

    # setter for: Lcom/google/gson/stream/JsonReader;->peeked:I
    invoke-static {p1, v1}, Lcom/google/gson/stream/JsonReader;->access$002(Lcom/google/gson/stream/JsonReader;I)I

    goto :goto_32

    :cond_29
    const/16 v1, 0xe

    if-ne v0, v1, :cond_33

    const/16 v1, 0xa

    # setter for: Lcom/google/gson/stream/JsonReader;->peeked:I
    invoke-static {p1, v1}, Lcom/google/gson/stream/JsonReader;->access$002(Lcom/google/gson/stream/JsonReader;I)I

    :goto_32
    return-void

    :cond_33
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a name but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # invokes: Lcom/google/gson/stream/JsonReader;->getLineNumber()I
    invoke-static {p1}, Lcom/google/gson/stream/JsonReader;->access$200(Lcom/google/gson/stream/JsonReader;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    # invokes: Lcom/google/gson/stream/JsonReader;->getColumnNumber()I
    invoke-static {p1}, Lcom/google/gson/stream/JsonReader;->access$300(Lcom/google/gson/stream/JsonReader;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.class public final Lcom/google/gson/internal/Streams;
.super Ljava/lang/Object;
.source "Streams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/internal/Streams$AppendableWriter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Lcom/google/gson/stream/JsonReader;)Lcom/google/gson/JsonElement;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/gson/JsonParseException;
        }
    .end annotation

    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    const/4 v0, 0x0

    sget-object v1, Lcom/google/gson/internal/bind/TypeAdapters;->JSON_ELEMENT:Lcom/google/gson/TypeAdapter;

    invoke-virtual {v1, p0}, Lcom/google/gson/TypeAdapter;->read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/gson/JsonElement;
    :try_end_d
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_d} :catch_23
    .catch Lcom/google/gson/stream/MalformedJsonException; {:try_start_1 .. :try_end_d} :catch_1c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_d} :catch_15
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_d} :catch_e

    return-object v1

    :catch_e
    move-exception v1

    new-instance v2, Lcom/google/gson/JsonSyntaxException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catch_15
    move-exception v1

    new-instance v2, Lcom/google/gson/JsonIOException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catch_1c
    move-exception v1

    new-instance v2, Lcom/google/gson/JsonSyntaxException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catch_23
    move-exception v1

    if-eqz v0, :cond_29

    sget-object v2, Lcom/google/gson/JsonNull;->INSTANCE:Lcom/google/gson/JsonNull;

    return-object v2

    :cond_29
    new-instance v2, Lcom/google/gson/JsonSyntaxException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static write(Lcom/google/gson/JsonElement;Lcom/google/gson/stream/JsonWriter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/google/gson/internal/bind/TypeAdapters;->JSON_ELEMENT:Lcom/google/gson/TypeAdapter;

    invoke-virtual {v0, p1, p0}, Lcom/google/gson/TypeAdapter;->write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V

    return-void
.end method

.method public static writerForAppendable(Ljava/lang/Appendable;)Ljava/io/Writer;
    .registers 3

    instance-of v0, p0, Ljava/io/Writer;

    if-eqz v0, :cond_8

    move-object v0, p0

    check-cast v0, Ljava/io/Writer;

    goto :goto_e

    :cond_8
    new-instance v0, Lcom/google/gson/internal/Streams$AppendableWriter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/gson/internal/Streams$AppendableWriter;-><init>(Ljava/lang/Appendable;Lcom/google/gson/internal/Streams$1;)V

    :goto_e
    return-object v0
.end method

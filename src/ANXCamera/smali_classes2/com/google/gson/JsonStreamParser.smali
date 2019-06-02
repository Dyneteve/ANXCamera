.class public final Lcom/google/gson/JsonStreamParser;
.super Ljava/lang/Object;
.source "JsonStreamParser.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/google/gson/JsonElement;",
        ">;"
    }
.end annotation


# instance fields
.field private final lock:Ljava/lang/Object;

.field private final parser:Lcom/google/gson/stream/JsonReader;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/gson/stream/JsonReader;

    invoke-direct {v0, p1}, Lcom/google/gson/stream/JsonReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lcom/google/gson/JsonStreamParser;->parser:Lcom/google/gson/stream/JsonReader;

    iget-object v0, p0, Lcom/google/gson/JsonStreamParser;->parser:Lcom/google/gson/stream/JsonReader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/gson/stream/JsonReader;->setLenient(Z)V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/gson/JsonStreamParser;->lock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/gson/JsonStreamParser;-><init>(Ljava/io/Reader;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 4

    iget-object v0, p0, Lcom/google/gson/JsonStreamParser;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/google/gson/JsonStreamParser;->parser:Lcom/google/gson/stream/JsonReader;

    invoke-virtual {v1}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/google/gson/stream/JsonToken;->END_DOCUMENT:Lcom/google/gson/stream/JsonToken;
    :try_end_b
    .catch Lcom/google/gson/stream/MalformedJsonException; {:try_start_3 .. :try_end_b} :catch_1b
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_b} :catch_14
    .catchall {:try_start_3 .. :try_end_b} :catchall_12

    if-eq v1, v2, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    :try_start_10
    monitor-exit v0

    return v1

    :catchall_12
    move-exception v1

    goto :goto_22

    :catch_14
    move-exception v1

    new-instance v2, Lcom/google/gson/JsonIOException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :catch_1b
    move-exception v1

    new-instance v2, Lcom/google/gson/JsonSyntaxException;

    invoke-direct {v2, v1}, Lcom/google/gson/JsonSyntaxException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    :goto_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_10 .. :try_end_23} :catchall_12

    throw v1
.end method

.method public next()Lcom/google/gson/JsonElement;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/gson/JsonParseException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/gson/JsonStreamParser;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    :try_start_6
    iget-object v0, p0, Lcom/google/gson/JsonStreamParser;->parser:Lcom/google/gson/stream/JsonReader;

    invoke-static {v0}, Lcom/google/gson/internal/Streams;->parse(Lcom/google/gson/stream/JsonReader;)Lcom/google/gson/JsonElement;

    move-result-object v0
    :try_end_c
    .catch Ljava/lang/StackOverflowError; {:try_start_6 .. :try_end_c} :catch_27
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_c} :catch_1e
    .catch Lcom/google/gson/JsonParseException; {:try_start_6 .. :try_end_c} :catch_d

    return-object v0

    :catch_d
    move-exception v0

    invoke-virtual {v0}, Lcom/google/gson/JsonParseException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/io/EOFException;

    if-eqz v1, :cond_1c

    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    goto :goto_1d

    :cond_1c
    move-object v1, v0

    :goto_1d
    throw v1

    :catch_1e
    move-exception v0

    new-instance v1, Lcom/google/gson/JsonParseException;

    const-string v2, "Failed parsing JSON source to Json"

    invoke-direct {v1, v2, v0}, Lcom/google/gson/JsonParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_27
    move-exception v0

    new-instance v1, Lcom/google/gson/JsonParseException;

    const-string v2, "Failed parsing JSON source to Json"

    invoke-direct {v1, v2, v0}, Lcom/google/gson/JsonParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_30
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Lcom/google/gson/JsonStreamParser;->next()Lcom/google/gson/JsonElement;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.class public final Lcom/bumptech/glide/load/a/c;
.super Ljava/io/OutputStream;
.source "BufferedOutputStream.java"


# instance fields
.field private ap:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

.field private buffer:[B

.field private index:I

.field private final out:Ljava/io/OutputStream;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V
    .locals 1
    .param p1    # Ljava/io/OutputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/high16 v0, 0x10000

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/load/a/c;-><init>(Ljava/io/OutputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;I)V

    return-void
.end method

.method constructor <init>(Ljava/io/OutputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;I)V
    .locals 0
    .param p1    # Ljava/io/OutputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    iput-object p2, p0, Lcom/bumptech/glide/load/a/c;->ap:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    const-class p1, [B

    invoke-interface {p2, p3, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->a(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    return-void
.end method

.method private al()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/bumptech/glide/load/a/c;->index:I

    iget-object v1, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    array-length v1, v1

    if-ne v0, v1, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/a/c;->flushBuffer()V

    :cond_0
    return-void
.end method

.method private flushBuffer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/bumptech/glide/load/a/c;->index:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    iget v2, p0, Lcom/bumptech/glide/load/a/c;->index:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    iput v3, p0, Lcom/bumptech/glide/load/a/c;->index:I

    :cond_0
    return-void
.end method

.method private release()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->ap:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    iget-object v1, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/bumptech/glide/load/a/c;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    nop

    invoke-direct {p0}, Lcom/bumptech/glide/load/a/c;->release()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/load/a/c;->flushBuffer()V

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    iget v1, p0, Lcom/bumptech/glide/load/a/c;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/bumptech/glide/load/a/c;->index:I

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    invoke-direct {p0}, Lcom/bumptech/glide/load/a/c;->al()V

    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/bumptech/glide/load/a/c;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 5
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    nop

    const/4 v0, 0x0

    :cond_0
    sub-int v1, p3, v0

    add-int v2, p2, v0

    iget v3, p0, Lcom/bumptech/glide/load/a/c;->index:I

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    array-length v3, v3

    if-lt v1, v3, :cond_1

    iget-object p2, p0, Lcom/bumptech/glide/load/a/c;->out:Ljava/io/OutputStream;

    invoke-virtual {p2, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    return-void

    :cond_1
    iget-object v3, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lcom/bumptech/glide/load/a/c;->index:I

    sub-int/2addr v3, v4

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v3, p0, Lcom/bumptech/glide/load/a/c;->buffer:[B

    iget v4, p0, Lcom/bumptech/glide/load/a/c;->index:I

    invoke-static {p1, v2, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v2, p0, Lcom/bumptech/glide/load/a/c;->index:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/bumptech/glide/load/a/c;->index:I

    add-int/2addr v0, v1

    invoke-direct {p0}, Lcom/bumptech/glide/load/a/c;->al()V

    if-lt v0, p3, :cond_0

    return-void
.end method

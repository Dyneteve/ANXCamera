.class public final Lcom/adobe/xmp/impl/CountOutputStream;
.super Ljava/io/OutputStream;
.source "CountOutputStream.java"


# instance fields
.field private bytesWritten:I

.field private final out:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    iput-object p1, p0, Lcom/adobe/xmp/impl/CountOutputStream;->out:Ljava/io/OutputStream;

    return-void
.end method


# virtual methods
.method public getBytesWritten()I
    .locals 1

    iget v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    return v0
.end method

.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    iget p1, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    return-void
.end method

.method public write([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    iget v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    array-length p1, p1

    add-int/2addr v0, p1

    iput v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/adobe/xmp/impl/CountOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    iget p1, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/adobe/xmp/impl/CountOutputStream;->bytesWritten:I

    return-void
.end method

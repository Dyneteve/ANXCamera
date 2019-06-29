.class public final Lcom/bumptech/glide/a/a$d;
.super Ljava/lang/Object;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "d"
.end annotation


# instance fields
.field final synthetic cY:Lcom/bumptech/glide/a/a;

.field private final dd:[Ljava/io/File;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J


# direct methods
.method private constructor <init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;J[Ljava/io/File;[J)V
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/a/a$d;->cY:Lcom/bumptech/glide/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/bumptech/glide/a/a$d;->key:Ljava/lang/String;

    iput-wide p3, p0, Lcom/bumptech/glide/a/a$d;->sequenceNumber:J

    iput-object p5, p0, Lcom/bumptech/glide/a/a$d;->dd:[Ljava/io/File;

    iput-object p6, p0, Lcom/bumptech/glide/a/a$d;->lengths:[J

    return-void
.end method

.method synthetic constructor <init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;J[Ljava/io/File;[JLcom/bumptech/glide/a/a$1;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/bumptech/glide/a/a$d;-><init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;J[Ljava/io/File;[J)V

    return-void
.end method


# virtual methods
.method public ar()Lcom/bumptech/glide/a/a$b;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/a/a$d;->cY:Lcom/bumptech/glide/a/a;

    iget-object v1, p0, Lcom/bumptech/glide/a/a$d;->key:Ljava/lang/String;

    iget-wide v2, p0, Lcom/bumptech/glide/a/a$d;->sequenceNumber:J

    invoke-static {v0, v1, v2, v3}, Lcom/bumptech/glide/a/a;->a(Lcom/bumptech/glide/a/a;Ljava/lang/String;J)Lcom/bumptech/glide/a/a$b;

    move-result-object v0

    return-object v0
.end method

.method public getLength(I)J
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/a/a$d;->lengths:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/bumptech/glide/a/a$d;->dd:[Ljava/io/File;

    aget-object p1, v1, p1

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0}, Lcom/bumptech/glide/a/a;->b(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public n(I)Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/a/a$d;->dd:[Ljava/io/File;

    aget-object p1, v0, p1

    return-object p1
.end method

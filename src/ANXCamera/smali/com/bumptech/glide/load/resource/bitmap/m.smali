.class public final Lcom/bumptech/glide/load/resource/bitmap/m;
.super Ljava/lang/Object;
.source "DefaultImageHeaderParser.java"

# interfaces
.implements Lcom/bumptech/glide/load/ImageHeaderParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/bitmap/m$d;,
        Lcom/bumptech/glide/load/resource/bitmap/m$a;,
        Lcom/bumptech/glide/load/resource/bitmap/m$c;,
        Lcom/bumptech/glide/load/resource/bitmap/m$b;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DfltImageHeaderParser"

.field private static final lG:I = 0x474946

.field private static final lH:I = -0x76afb1b9

.field static final lI:I = 0xffd8

.field private static final lJ:I = 0x4d4d

.field private static final lK:I = 0x4949

.field private static final lL:Ljava/lang/String; = "Exif\u0000\u0000"

.field static final lM:[B

.field private static final lN:I = 0xda

.field private static final lO:I = 0xd9

.field static final lP:I = 0xff

.field static final lQ:I = 0xe1

.field private static final lR:I = 0x112

.field private static final lS:[I

.field private static final lT:I = 0x52494646

.field private static final lU:I = 0x57454250

.field private static final lV:I = 0x56503800

.field private static final lW:I = -0x100

.field private static final lX:I = 0xff

.field private static final lY:I = 0x58

.field private static final lZ:I = 0x4c

.field private static final ma:I = 0x10

.field private static final mb:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "Exif\u0000\u0000"

    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/m;->lM:[B

    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/m;->lS:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static F(I)Z
    .locals 2

    const v0, 0xffd8

    and-int v1, p0, v0

    if-eq v1, v0, :cond_1

    const/16 v0, 0x4d4d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x4949

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static a(Lcom/bumptech/glide/load/resource/bitmap/m$b;)I
    .locals 11

    const-string v0, "Exif\u0000\u0000"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->H(I)S

    move-result v1

    const/16 v2, 0x4949

    const/4 v3, 0x3

    if-eq v1, v2, :cond_2

    const/16 v2, 0x4d4d

    if-eq v1, v2, :cond_1

    const-string v2, "DfltImageHeaderParser"

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "DfltImageHeaderParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown endianness = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    :cond_1
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    goto :goto_0

    :cond_2
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    nop

    :goto_0
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->a(Ljava/nio/ByteOrder;)V

    add-int/lit8 v1, v0, 0x4

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->G(I)I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->H(I)S

    move-result v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_e

    invoke-static {v1, v2}, Lcom/bumptech/glide/load/resource/bitmap/m;->l(II)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->H(I)S

    move-result v5

    const/16 v6, 0x112

    if-eq v5, v6, :cond_3

    goto/16 :goto_5

    :cond_3
    add-int/lit8 v6, v4, 0x2

    invoke-virtual {p0, v6}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->H(I)S

    move-result v6

    const/4 v7, 0x1

    if-lt v6, v7, :cond_c

    const/16 v7, 0xc

    if-le v6, v7, :cond_4

    goto/16 :goto_4

    :cond_4
    add-int/lit8 v7, v4, 0x4

    invoke-virtual {p0, v7}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->G(I)I

    move-result v7

    if-gez v7, :cond_5

    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "DfltImageHeaderParser"

    const-string v5, "Negative tiff component count"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    :cond_5
    const-string v8, "DfltImageHeaderParser"

    invoke-static {v8, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_6

    const-string v8, "DfltImageHeaderParser"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Got tagIndex="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " tagType="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " formatCode="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " componentCount="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    sget-object v8, Lcom/bumptech/glide/load/resource/bitmap/m;->lS:[I

    aget v8, v8, v6

    add-int/2addr v7, v8

    const/4 v8, 0x4

    if-le v7, v8, :cond_7

    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "DfltImageHeaderParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got byte count > 4, not orientation, continuing, formatCode="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    :cond_7
    add-int/lit8 v4, v4, 0x8

    if-ltz v4, :cond_b

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->length()I

    move-result v6

    if-le v4, v6, :cond_8

    goto :goto_3

    :cond_8
    if-ltz v7, :cond_a

    add-int/2addr v7, v4

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->length()I

    move-result v6

    if-le v7, v6, :cond_9

    goto :goto_2

    :cond_9
    invoke-virtual {p0, v4}, Lcom/bumptech/glide/load/resource/bitmap/m$b;->H(I)S

    move-result p0

    return p0

    :cond_a
    :goto_2
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "DfltImageHeaderParser"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal number of bytes for TI tag data tagType="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_b
    :goto_3
    const-string v6, "DfltImageHeaderParser"

    invoke-static {v6, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_d

    const-string v6, "DfltImageHeaderParser"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Illegal tagValueOffset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " tagType="

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :cond_c
    :goto_4
    const-string v4, "DfltImageHeaderParser"

    invoke-static {v4, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_d

    const-string v4, "DfltImageHeaderParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got invalid format code = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_d
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_e
    const/4 p0, -0x1

    return p0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v0

    invoke-static {v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->F(I)Z

    move-result v1

    const/4 v2, 0x3

    const/4 v3, -0x1

    if-nez v1, :cond_1

    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "DfltImageHeaderParser"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Parser doesn\'t handle magic number: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v3

    :cond_1
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->b(Lcom/bumptech/glide/load/resource/bitmap/m$c;)I

    move-result v0

    if-ne v0, v3, :cond_3

    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "DfltImageHeaderParser"

    const-string p2, "Failed to parse exif segment length, or exif segment not found"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return v3

    :cond_3
    const-class v1, [B

    invoke-interface {p2, v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->a(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    :try_start_0
    invoke-direct {p0, p1, v1, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;[BI)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p2, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    return p1

    :catchall_0
    move-exception p1

    invoke-interface {p2, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    throw p1
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;[BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->read([BI)I

    move-result p1

    const/4 v0, -0x1

    const/4 v1, 0x3

    if-eq p1, p3, :cond_1

    const-string p2, "DfltImageHeaderParser"

    invoke-static {p2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "DfltImageHeaderParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to read exif segment data, length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", actually read: "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v0

    :cond_1
    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m;->c([BI)Z

    move-result p1

    if-eqz p1, :cond_2

    new-instance p1, Lcom/bumptech/glide/load/resource/bitmap/m$b;

    invoke-direct {p1, p2, p3}, Lcom/bumptech/glide/load/resource/bitmap/m$b;-><init>([BI)V

    invoke-static {p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$b;)I

    move-result p1

    return p1

    :cond_2
    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "DfltImageHeaderParser"

    const-string p2, "Missing jpeg exif preamble"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return v0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 6
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v0

    const v1, 0xffd8

    if-ne v0, v1, :cond_0

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->ey:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    :cond_0
    shl-int/lit8 v0, v0, 0x10

    const/high16 v1, -0x10000

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v2

    const v3, 0xffff

    and-int/2addr v2, v3

    or-int/2addr v0, v2

    const v2, -0x76afb1b9

    if-ne v0, v2, :cond_2

    const-wide/16 v0, 0x15

    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    const/4 v0, 0x3

    if-lt p1, v0, :cond_1

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eA:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_0

    :cond_1
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eB:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_0
    return-object p1

    :cond_2
    shr-int/lit8 v2, v0, 0x8

    const v4, 0x474946

    if-ne v2, v4, :cond_3

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->ex:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    :cond_3
    const v2, 0x52494646

    if-eq v0, v2, :cond_4

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eE:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    :cond_4
    const-wide/16 v4, 0x4

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    nop

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v2

    and-int/2addr v2, v3

    or-int/2addr v0, v2

    const v2, 0x57454250

    if-eq v0, v2, :cond_5

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eE:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    :cond_5
    nop

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    and-int/2addr v0, v1

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v1

    and-int/2addr v1, v3

    or-int/2addr v0, v1

    and-int/lit16 v1, v0, -0x100

    const v2, 0x56503800

    if-eq v1, v2, :cond_6

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eE:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1

    :cond_6
    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0x58

    if-ne v0, v1, :cond_8

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_7

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eC:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_1

    :cond_7
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eD:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_1
    return-object p1

    :cond_8
    const/16 v1, 0x4c

    if-ne v0, v1, :cond_a

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->getByte()I

    move-result p1

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_9

    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eC:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    goto :goto_2

    :cond_9
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eD:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    :goto_2
    return-object p1

    :cond_a
    sget-object p1, Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;->eD:Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    return-object p1
.end method

.method private b(Lcom/bumptech/glide/load/resource/bitmap/m$c;)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cT()S

    move-result v0

    const/16 v1, 0xff

    const/4 v2, 0x3

    const/4 v3, -0x1

    if-eq v0, v1, :cond_1

    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "DfltImageHeaderParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown segmentId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v3

    :cond_1
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cT()S

    move-result v0

    const/16 v1, 0xda

    if-ne v0, v1, :cond_2

    return v3

    :cond_2
    const/16 v1, 0xd9

    if-ne v0, v1, :cond_4

    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "DfltImageHeaderParser"

    const-string v0, "Found MARKER_EOI in exif segment"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return v3

    :cond_4
    invoke-interface {p1}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->cS()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    const/16 v4, 0xe1

    if-eq v0, v4, :cond_7

    int-to-long v4, v1

    invoke-interface {p1, v4, v5}, Lcom/bumptech/glide/load/resource/bitmap/m$c;->skip(J)J

    move-result-wide v6

    cmp-long v4, v6, v4

    if-eqz v4, :cond_6

    const-string p1, "DfltImageHeaderParser"

    invoke-static {p1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "DfltImageHeaderParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to skip enough data, type: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", wanted to skip: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", but actually skipped: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    return v3

    :cond_6
    nop

    goto/16 :goto_0

    :cond_7
    return v1
.end method

.method private c([BI)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/m;->lM:[B

    array-length v1, v1

    if-le p2, v1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    nop

    move p2, v0

    :goto_0
    if-eqz p2, :cond_2

    move v1, v0

    :goto_1
    sget-object v2, Lcom/bumptech/glide/load/resource/bitmap/m;->lM:[B

    array-length v2, v2

    if-ge v1, v2, :cond_2

    aget-byte v2, p1, v1

    sget-object v3, Lcom/bumptech/glide/load/resource/bitmap/m;->lM:[B

    aget-byte v3, v3, v1

    if-eq v2, v3, :cond_1

    nop

    nop

    move p2, v0

    goto :goto_2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    return p2
.end method

.method private static l(II)I
    .locals 1

    add-int/lit8 p0, p0, 0x2

    const/16 v0, 0xc

    mul-int/2addr v0, p1

    add-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public a(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$d;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$d;-><init>(Ljava/io/InputStream;)V

    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I

    move-result p1

    return p1
.end method

.method public a(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I
    .locals 1
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$a;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$a;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)I

    move-result p1

    return p1
.end method

.method public b(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$a;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$a;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p1

    return-object p1
.end method

.method public c(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/m$d;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/InputStream;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/resource/bitmap/m$d;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/resource/bitmap/m;->a(Lcom/bumptech/glide/load/resource/bitmap/m$c;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    move-result-object p1

    return-object p1
.end method

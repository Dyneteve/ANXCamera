.class public Lcom/bumptech/glide/b/e;
.super Ljava/lang/Object;
.source "StandardGifDecoder.java"

# interfaces
.implements Lcom/bumptech/glide/b/a;


# static fields
.field private static final MAX_STACK_SIZE:I = 0x1000

.field private static final TAG:Ljava/lang/String;

.field private static final cM:I = -0x1

.field private static final cN:I = -0x1

.field private static final cO:I = 0x4

.field private static final cP:I = 0x0
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private static final cq:I = 0xff


# instance fields
.field private act:[I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private block:[B

.field private cK:Ljava/nio/ByteBuffer;

.field private cL:Lcom/bumptech/glide/b/c;

.field private final cQ:[I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private final cR:Lcom/bumptech/glide/b/a$a;

.field private cS:Lcom/bumptech/glide/b/d;

.field private cT:[B

.field private cU:[I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private cV:I

.field private cW:Landroid/graphics/Bitmap;

.field private cX:Z

.field private cY:I

.field private cZ:I

.field private da:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private dc:Landroid/graphics/Bitmap$Config;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private pixelStack:[B

.field private prefix:[S

.field private sampleSize:I

.field private status:I

.field private suffix:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/bumptech/glide/b/e;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/b/a$a;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/b/a$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cQ:[I

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->dc:Landroid/graphics/Bitmap$Config;

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    new-instance p1, Lcom/bumptech/glide/b/c;

    invoke-direct {p1}, Lcom/bumptech/glide/b/c;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/b/a$a;Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/b/a$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/bumptech/glide/b/e;-><init>(Lcom/bumptech/glide/b/a$a;Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/b/a$a;Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;I)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/b/a$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/bumptech/glide/b/e;-><init>(Lcom/bumptech/glide/b/a$a;)V

    invoke-virtual {p0, p2, p3, p4}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;I)V

    return-void
.end method

.method private a(III)I
    .locals 9
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    nop

    nop

    nop

    nop

    nop

    nop

    const/4 v0, 0x0

    move v1, p1

    move v2, v0

    move v3, v2

    move v4, v3

    move v5, v4

    move v6, v5

    :goto_0
    iget v7, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    add-int/2addr v7, p1

    if-ge v1, v7, :cond_1

    iget-object v7, p0, Lcom/bumptech/glide/b/e;->cT:[B

    array-length v7, v7

    if-ge v1, v7, :cond_1

    if-ge v1, p2, :cond_1

    iget-object v7, p0, Lcom/bumptech/glide/b/e;->cT:[B

    aget-byte v7, v7, v1

    and-int/lit16 v7, v7, 0xff

    iget-object v8, p0, Lcom/bumptech/glide/b/e;->act:[I

    aget v7, v8, v7

    if-eqz v7, :cond_0

    shr-int/lit8 v8, v7, 0x18

    and-int/lit16 v8, v8, 0xff

    add-int/2addr v2, v8

    shr-int/lit8 v8, v7, 0x10

    and-int/lit16 v8, v8, 0xff

    add-int/2addr v3, v8

    shr-int/lit8 v8, v7, 0x8

    and-int/lit16 v8, v8, 0xff

    add-int/2addr v4, v8

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v5, v7

    add-int/lit8 v6, v6, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr p1, p3

    move p3, p1

    :goto_1
    iget v1, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    add-int/2addr v1, p1

    if-ge p3, v1, :cond_3

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cT:[B

    array-length v1, v1

    if-ge p3, v1, :cond_3

    if-ge p3, p2, :cond_3

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cT:[B

    aget-byte v1, v1, p3

    and-int/lit16 v1, v1, 0xff

    iget-object v7, p0, Lcom/bumptech/glide/b/e;->act:[I

    aget v1, v7, v1

    if-eqz v1, :cond_2

    shr-int/lit8 v7, v1, 0x18

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v2, v7

    shr-int/lit8 v7, v1, 0x10

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v3, v7

    shr-int/lit8 v7, v1, 0x8

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v4, v7

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v5, v1

    add-int/lit8 v6, v6, 0x1

    :cond_2
    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_3
    if-nez v6, :cond_4

    return v0

    :cond_4
    div-int/2addr v2, v6

    shl-int/lit8 p1, v2, 0x18

    div-int/2addr v3, v6

    shl-int/lit8 p2, v3, 0x10

    or-int/2addr p1, p2

    div-int/2addr v4, v6

    shl-int/lit8 p2, v4, 0x8

    or-int/2addr p1, p2

    div-int/2addr v5, v6

    or-int/2addr p1, v5

    return p1
.end method

.method private a(Lcom/bumptech/glide/b/b;Lcom/bumptech/glide/b/b;)Landroid/graphics/Bitmap;
    .locals 10

    iget-object v8, p0, Lcom/bumptech/glide/b/e;->cU:[I

    const/4 v0, 0x0

    if-nez p2, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    invoke-interface {v1, v2}, Lcom/bumptech/glide/b/a$a;->c(Landroid/graphics/Bitmap;)V

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    invoke-static {v8, v0}, Ljava/util/Arrays;->fill([II)V

    :cond_1
    const/4 v1, 0x3

    if-eqz p2, :cond_2

    iget v2, p2, Lcom/bumptech/glide/b/b;->dispose:I

    if-ne v2, v1, :cond_2

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    if-nez v2, :cond_2

    invoke-static {v8, v0}, Ljava/util/Arrays;->fill([II)V

    :cond_2
    const/4 v9, 0x1

    if-eqz p2, :cond_9

    iget v2, p2, Lcom/bumptech/glide/b/b;->dispose:I

    if-lez v2, :cond_9

    iget v2, p2, Lcom/bumptech/glide/b/b;->dispose:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_8

    nop

    iget-boolean v1, p1, Lcom/bumptech/glide/b/b;->transparency:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v1, v1, Lcom/bumptech/glide/b/c;->bgColor:I

    iget-object v2, p1, Lcom/bumptech/glide/b/b;->lct:[I

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v2, v2, Lcom/bumptech/glide/b/c;->bgIndex:I

    iget v3, p1, Lcom/bumptech/glide/b/b;->transIndex:I

    if-ne v2, v3, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget v1, p0, Lcom/bumptech/glide/b/e;->cV:I

    if-nez v1, :cond_5

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    :cond_5
    :goto_0
    iget v1, p2, Lcom/bumptech/glide/b/b;->ih:I

    iget v2, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v1, v2

    iget v2, p2, Lcom/bumptech/glide/b/b;->iy:I

    iget v3, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v2, v3

    iget v3, p2, Lcom/bumptech/glide/b/b;->iw:I

    iget v4, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v3, v4

    iget p2, p2, Lcom/bumptech/glide/b/b;->ix:I

    iget v4, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr p2, v4

    iget v4, p0, Lcom/bumptech/glide/b/e;->cZ:I

    mul-int/2addr v2, v4

    add-int/2addr v2, p2

    iget p2, p0, Lcom/bumptech/glide/b/e;->cZ:I

    mul-int/2addr v1, p2

    add-int/2addr v1, v2

    :goto_1
    if-ge v2, v1, :cond_7

    add-int p2, v2, v3

    move v4, v2

    :goto_2
    if-ge v4, p2, :cond_6

    aput v0, v8, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_6
    iget p2, p0, Lcom/bumptech/glide/b/e;->cZ:I

    add-int/2addr v2, p2

    goto :goto_1

    :cond_7
    goto :goto_3

    :cond_8
    iget p2, p2, Lcom/bumptech/glide/b/b;->dispose:I

    if-ne p2, v1, :cond_9

    iget-object p2, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    if-eqz p2, :cond_9

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget v3, p0, Lcom/bumptech/glide/b/e;->cZ:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget v7, p0, Lcom/bumptech/glide/b/e;->cY:I

    move-object v1, v8

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    :cond_9
    :goto_3
    invoke-direct {p0, p1}, Lcom/bumptech/glide/b/e;->c(Lcom/bumptech/glide/b/b;)V

    iget-boolean p2, p1, Lcom/bumptech/glide/b/b;->interlace:Z

    if-nez p2, :cond_b

    iget p2, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    if-eq p2, v9, :cond_a

    goto :goto_4

    :cond_a
    invoke-direct {p0, p1}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/b;)V

    goto :goto_5

    :cond_b
    :goto_4
    invoke-direct {p0, p1}, Lcom/bumptech/glide/b/e;->b(Lcom/bumptech/glide/b/b;)V

    :goto_5
    iget-boolean p2, p0, Lcom/bumptech/glide/b/e;->cX:Z

    if-eqz p2, :cond_e

    iget p2, p1, Lcom/bumptech/glide/b/b;->dispose:I

    if-eqz p2, :cond_c

    iget p1, p1, Lcom/bumptech/glide/b/b;->dispose:I

    if-ne p1, v9, :cond_e

    :cond_c
    iget-object p1, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    if-nez p1, :cond_d

    invoke-direct {p0}, Lcom/bumptech/glide/b/e;->ag()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    :cond_d
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget v3, p0, Lcom/bumptech/glide/b/e;->cZ:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget v7, p0, Lcom/bumptech/glide/b/e;->cY:I

    move-object v1, v8

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    :cond_e
    invoke-direct {p0}, Lcom/bumptech/glide/b/e;->ag()Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v2, 0x0

    iget v3, p0, Lcom/bumptech/glide/b/e;->cZ:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget v7, p0, Lcom/bumptech/glide/b/e;->cY:I

    move-object v0, p1

    move-object v1, v8

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object p1
.end method

.method private a(Lcom/bumptech/glide/b/b;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cU:[I

    iget v3, v1, Lcom/bumptech/glide/b/b;->ih:I

    iget v4, v1, Lcom/bumptech/glide/b/b;->iy:I

    iget v5, v1, Lcom/bumptech/glide/b/b;->iw:I

    iget v6, v1, Lcom/bumptech/glide/b/b;->ix:I

    iget v7, v0, Lcom/bumptech/glide/b/e;->cV:I

    if-nez v7, :cond_0

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    nop

    const/4 v7, 0x0

    :goto_0
    iget v10, v0, Lcom/bumptech/glide/b/e;->cZ:I

    iget-object v11, v0, Lcom/bumptech/glide/b/e;->cT:[B

    iget-object v12, v0, Lcom/bumptech/glide/b/e;->act:[I

    nop

    const/4 v14, 0x0

    const/4 v15, -0x1

    :goto_1
    if-ge v14, v3, :cond_5

    add-int v16, v14, v4

    mul-int v16, v16, v10

    add-int v17, v16, v6

    add-int v8, v17, v5

    add-int v9, v16, v10

    if-ge v9, v8, :cond_1

    nop

    move v8, v9

    :cond_1
    iget v9, v1, Lcom/bumptech/glide/b/b;->iw:I

    mul-int/2addr v9, v14

    move v13, v15

    move v15, v9

    move/from16 v9, v17

    :goto_2
    if-ge v9, v8, :cond_4

    aget-byte v1, v11, v15

    move/from16 v18, v3

    and-int/lit16 v3, v1, 0xff

    if-eq v3, v13, :cond_3

    aget v3, v12, v3

    if-eqz v3, :cond_2

    aput v3, v2, v9

    goto :goto_3

    :cond_2
    nop

    move v13, v1

    :cond_3
    :goto_3
    add-int/lit8 v15, v15, 0x1

    add-int/lit8 v9, v9, 0x1

    nop

    move/from16 v3, v18

    move-object/from16 v1, p1

    goto :goto_2

    :cond_4
    move/from16 v18, v3

    add-int/lit8 v14, v14, 0x1

    move v15, v13

    move-object/from16 v1, p1

    goto :goto_1

    :cond_5
    iget-object v1, v0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    if-nez v1, :cond_6

    if-eqz v7, :cond_6

    const/4 v1, -0x1

    if-eq v15, v1, :cond_6

    const/4 v1, 0x1

    goto :goto_4

    :cond_6
    nop

    const/4 v1, 0x0

    :goto_4
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    return-void
.end method

.method private af()Lcom/bumptech/glide/b/d;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cS:Lcom/bumptech/glide/b/d;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/b/d;

    invoke-direct {v0}, Lcom/bumptech/glide/b/d;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cS:Lcom/bumptech/glide/b/d;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cS:Lcom/bumptech/glide/b/d;

    return-object v0
.end method

.method private ag()Landroid/graphics/Bitmap;
    .locals 4

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->dc:Landroid/graphics/Bitmap$Config;

    goto :goto_1

    :cond_1
    :goto_0
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :goto_1
    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget v2, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget v3, p0, Lcom/bumptech/glide/b/e;->cY:I

    invoke-interface {v1, v2, v3, v0}, Lcom/bumptech/glide/b/a$a;->a(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    return-object v0
.end method

.method private b(Lcom/bumptech/glide/b/b;)V
    .locals 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cU:[I

    iget v3, v1, Lcom/bumptech/glide/b/b;->ih:I

    iget v4, v0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v3, v4

    iget v4, v1, Lcom/bumptech/glide/b/b;->iy:I

    iget v5, v0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v4, v5

    iget v5, v1, Lcom/bumptech/glide/b/b;->iw:I

    iget v6, v0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v5, v6

    iget v6, v1, Lcom/bumptech/glide/b/b;->ix:I

    iget v7, v0, Lcom/bumptech/glide/b/e;->sampleSize:I

    div-int/2addr v6, v7

    nop

    nop

    nop

    iget v7, v0, Lcom/bumptech/glide/b/e;->cV:I

    if-nez v7, :cond_0

    const/4 v7, 0x1

    goto :goto_0

    :cond_0
    nop

    const/4 v7, 0x0

    :goto_0
    iget v10, v0, Lcom/bumptech/glide/b/e;->sampleSize:I

    iget v11, v0, Lcom/bumptech/glide/b/e;->cZ:I

    iget v12, v0, Lcom/bumptech/glide/b/e;->cY:I

    iget-object v13, v0, Lcom/bumptech/glide/b/e;->cT:[B

    iget-object v14, v0, Lcom/bumptech/glide/b/e;->act:[I

    iget-object v15, v0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    const/16 v16, 0x8

    move-object/from16 v17, v15

    move/from16 v18, v16

    const/4 v8, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    :goto_1
    if-ge v15, v3, :cond_d

    nop

    iget-boolean v9, v1, Lcom/bumptech/glide/b/b;->interlace:Z

    if-eqz v9, :cond_2

    const/4 v9, 0x4

    const/16 v19, 0x2

    if-lt v8, v3, :cond_1

    add-int/lit8 v16, v16, 0x1

    packed-switch v16, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    nop

    nop

    nop

    move/from16 v18, v19

    const/4 v8, 0x1

    goto :goto_2

    :pswitch_1
    nop

    nop

    nop

    move/from16 v18, v9

    move/from16 v8, v19

    goto :goto_2

    :pswitch_2
    nop

    nop

    move v8, v9

    :cond_1
    :goto_2
    add-int v9, v8, v18

    goto :goto_3

    :cond_2
    move v9, v8

    move v8, v15

    :goto_3
    add-int/2addr v8, v4

    move/from16 v20, v3

    const/4 v3, 0x1

    if-ne v10, v3, :cond_3

    const/4 v3, 0x1

    goto :goto_4

    :cond_3
    nop

    const/4 v3, 0x0

    :goto_4
    if-ge v8, v12, :cond_b

    mul-int/2addr v8, v11

    add-int v19, v8, v6

    move/from16 v21, v4

    add-int v4, v19, v5

    add-int/2addr v8, v11

    if-ge v8, v4, :cond_4

    nop

    move v4, v8

    :cond_4
    mul-int v8, v15, v10

    move/from16 v22, v5

    iget v5, v1, Lcom/bumptech/glide/b/b;->iw:I

    mul-int/2addr v8, v5

    if-eqz v3, :cond_8

    move/from16 v3, v19

    :goto_5
    if-ge v3, v4, :cond_7

    aget-byte v5, v13, v8

    and-int/lit16 v5, v5, 0xff

    aget v5, v14, v5

    if-eqz v5, :cond_5

    aput v5, v2, v3

    goto :goto_6

    :cond_5
    if-eqz v7, :cond_6

    if-nez v17, :cond_6

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    :cond_6
    :goto_6
    add-int/2addr v8, v10

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_7
    goto :goto_9

    :cond_8
    sub-int v3, v4, v19

    mul-int/2addr v3, v10

    add-int/2addr v3, v8

    move/from16 v5, v19

    :goto_7
    if-ge v5, v4, :cond_c

    move/from16 v23, v4

    iget v4, v1, Lcom/bumptech/glide/b/b;->iw:I

    invoke-direct {v0, v8, v3, v4}, Lcom/bumptech/glide/b/e;->a(III)I

    move-result v4

    if-eqz v4, :cond_a

    aput v4, v2, v5

    :cond_9
    const/4 v4, 0x1

    goto :goto_8

    :cond_a
    if-eqz v7, :cond_9

    if-nez v17, :cond_9

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v17

    :goto_8
    add-int/2addr v8, v10

    add-int/lit8 v5, v5, 0x1

    move/from16 v4, v23

    goto :goto_7

    :cond_b
    move/from16 v21, v4

    move/from16 v22, v5

    :cond_c
    :goto_9
    const/4 v4, 0x1

    add-int/lit8 v15, v15, 0x1

    move v8, v9

    move/from16 v3, v20

    move/from16 v4, v21

    move/from16 v5, v22

    goto/16 :goto_1

    :cond_d
    iget-object v1, v0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    if-nez v1, :cond_f

    move-object/from16 v15, v17

    if-nez v15, :cond_e

    const/4 v8, 0x0

    goto :goto_a

    :cond_e
    invoke-virtual {v15}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    :goto_a
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    :cond_f
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private c(Lcom/bumptech/glide/b/b;)V
    .locals 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_0

    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    iget v3, v1, Lcom/bumptech/glide/b/b;->cj:I

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_0
    if-nez v1, :cond_1

    iget-object v1, v0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v1, v1, Lcom/bumptech/glide/b/c;->width:I

    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v2, v2, Lcom/bumptech/glide/b/c;->height:I

    mul-int/2addr v1, v2

    goto :goto_0

    :cond_1
    iget v2, v1, Lcom/bumptech/glide/b/b;->iw:I

    iget v1, v1, Lcom/bumptech/glide/b/b;->ih:I

    mul-int/2addr v1, v2

    :goto_0
    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cT:[B

    if-eqz v2, :cond_2

    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cT:[B

    array-length v2, v2

    if-ge v2, v1, :cond_3

    :cond_2
    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    invoke-interface {v2, v1}, Lcom/bumptech/glide/b/a$a;->m(I)[B

    move-result-object v2

    iput-object v2, v0, Lcom/bumptech/glide/b/e;->cT:[B

    :cond_3
    iget-object v2, v0, Lcom/bumptech/glide/b/e;->cT:[B

    iget-object v3, v0, Lcom/bumptech/glide/b/e;->prefix:[S

    const/16 v4, 0x1000

    if-nez v3, :cond_4

    new-array v3, v4, [S

    iput-object v3, v0, Lcom/bumptech/glide/b/e;->prefix:[S

    :cond_4
    iget-object v3, v0, Lcom/bumptech/glide/b/e;->prefix:[S

    iget-object v5, v0, Lcom/bumptech/glide/b/e;->suffix:[B

    if-nez v5, :cond_5

    new-array v5, v4, [B

    iput-object v5, v0, Lcom/bumptech/glide/b/e;->suffix:[B

    :cond_5
    iget-object v5, v0, Lcom/bumptech/glide/b/e;->suffix:[B

    iget-object v6, v0, Lcom/bumptech/glide/b/e;->pixelStack:[B

    if-nez v6, :cond_6

    const/16 v6, 0x1001

    new-array v6, v6, [B

    iput-object v6, v0, Lcom/bumptech/glide/b/e;->pixelStack:[B

    :cond_6
    iget-object v6, v0, Lcom/bumptech/glide/b/e;->pixelStack:[B

    invoke-direct/range {p0 .. p0}, Lcom/bumptech/glide/b/e;->readByte()I

    move-result v7

    const/4 v8, 0x1

    shl-int v9, v8, v7

    add-int/lit8 v10, v9, 0x1

    add-int/lit8 v11, v9, 0x2

    nop

    add-int/2addr v7, v8

    shl-int v12, v8, v7

    sub-int/2addr v12, v8

    const/4 v13, 0x0

    move v14, v13

    :goto_1
    if-ge v14, v9, :cond_7

    aput-short v13, v3, v14

    int-to-byte v15, v14

    aput-byte v15, v5, v14

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    :cond_7
    iget-object v14, v0, Lcom/bumptech/glide/b/e;->block:[B

    nop

    const/4 v15, -0x1

    move/from16 v26, v7

    move/from16 v24, v11

    move/from16 v25, v12

    move/from16 v16, v13

    move/from16 v17, v16

    move/from16 v18, v17

    move/from16 v19, v18

    move/from16 v20, v19

    move/from16 v22, v20

    move/from16 v23, v22

    move/from16 v21, v15

    :goto_2
    if-ge v13, v1, :cond_14

    if-nez v16, :cond_9

    invoke-direct/range {p0 .. p0}, Lcom/bumptech/glide/b/e;->readBlock()I

    move-result v16

    if-gtz v16, :cond_8

    const/4 v3, 0x3

    iput v3, v0, Lcom/bumptech/glide/b/e;->status:I

    goto/16 :goto_8

    :cond_8
    nop

    const/16 v20, 0x0

    :cond_9
    aget-byte v4, v14, v20

    and-int/lit16 v4, v4, 0xff

    shl-int v4, v4, v18

    add-int v19, v19, v4

    add-int/lit8 v18, v18, 0x8

    add-int/lit8 v20, v20, 0x1

    add-int/lit8 v16, v16, -0x1

    move/from16 v4, v18

    move/from16 v8, v21

    move/from16 v28, v22

    move/from16 v27, v24

    move/from16 v18, v17

    move/from16 v17, v13

    move/from16 v13, v26

    :goto_3
    if-lt v4, v13, :cond_13

    and-int v15, v19, v25

    shr-int v19, v19, v13

    sub-int/2addr v4, v13

    if-ne v15, v9, :cond_a

    nop

    nop

    nop

    nop

    nop

    move v13, v7

    move/from16 v27, v11

    move/from16 v25, v12

    const/4 v8, -0x1

    :goto_4
    const/4 v15, -0x1

    goto :goto_3

    :cond_a
    if-ne v15, v10, :cond_b

    nop

    move/from16 v21, v8

    move/from16 v26, v13

    move/from16 v13, v17

    move/from16 v17, v18

    move/from16 v24, v27

    move/from16 v22, v28

    const/4 v8, 0x1

    const/4 v15, -0x1

    move/from16 v18, v4

    const/16 v4, 0x1000

    goto :goto_2

    :cond_b
    const/4 v0, -0x1

    if-ne v8, v0, :cond_c

    aget-byte v8, v5, v15

    aput-byte v8, v2, v18

    add-int/lit8 v18, v18, 0x1

    add-int/lit8 v17, v17, 0x1

    nop

    nop

    nop

    move v8, v15

    move/from16 v28, v8

    move v15, v0

    move-object/from16 v0, p0

    goto :goto_3

    :cond_c
    nop

    move/from16 v0, v27

    if-lt v15, v0, :cond_d

    move/from16 v29, v4

    move/from16 v4, v28

    int-to-byte v4, v4

    aput-byte v4, v6, v23

    add-int/lit8 v23, v23, 0x1

    nop

    move v4, v8

    goto :goto_5

    :cond_d
    move/from16 v29, v4

    move v4, v15

    :goto_5
    if-lt v4, v9, :cond_e

    aget-byte v21, v5, v4

    aput-byte v21, v6, v23

    add-int/lit8 v23, v23, 0x1

    aget-short v4, v3, v4

    goto :goto_5

    :cond_e
    aget-byte v4, v5, v4

    and-int/lit16 v4, v4, 0xff

    move/from16 v30, v7

    int-to-byte v7, v4

    aput-byte v7, v2, v18

    add-int/lit8 v18, v18, 0x1

    add-int/lit8 v17, v17, 0x1

    :goto_6
    if-lez v23, :cond_f

    add-int/lit8 v23, v23, -0x1

    aget-byte v21, v6, v23

    aput-byte v21, v2, v18

    add-int/lit8 v18, v18, 0x1

    add-int/lit8 v17, v17, 0x1

    goto :goto_6

    :cond_f
    move/from16 v31, v4

    const/16 v4, 0x1000

    if-ge v0, v4, :cond_11

    int-to-short v4, v8

    aput-short v4, v3, v0

    aput-byte v7, v5, v0

    add-int/lit8 v0, v0, 0x1

    and-int v4, v0, v25

    if-nez v4, :cond_10

    const/16 v7, 0x1000

    if-ge v0, v7, :cond_12

    add-int/lit8 v13, v13, 0x1

    add-int v25, v25, v0

    goto :goto_7

    :cond_10
    const/16 v7, 0x1000

    goto :goto_7

    :cond_11
    move v7, v4

    :cond_12
    :goto_7
    move/from16 v27, v0

    move v8, v15

    move/from16 v4, v29

    move/from16 v7, v30

    move/from16 v28, v31

    move-object/from16 v0, p0

    goto/16 :goto_4

    :cond_13
    move/from16 v29, v4

    move/from16 v0, v27

    move/from16 v4, v28

    move/from16 v24, v0

    move/from16 v22, v4

    move/from16 v21, v8

    move/from16 v26, v13

    move/from16 v13, v17

    move/from16 v17, v18

    move/from16 v18, v29

    move-object/from16 v0, p0

    const/16 v4, 0x1000

    const/4 v8, 0x1

    goto/16 :goto_2

    :cond_14
    :goto_8
    move/from16 v13, v17

    const/4 v0, 0x0

    invoke-static {v2, v13, v1, v0}, Ljava/util/Arrays;->fill([BIIB)V

    return-void
.end method

.method private readBlock()I
    .locals 5

    invoke-direct {p0}, Lcom/bumptech/glide/b/e;->readByte()I

    move-result v0

    if-gtz v0, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->block:[B

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    return v0
.end method

.method private readByte()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method


# virtual methods
.method public U()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->cm:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/b/e;->getDelay(I)I

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public V()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    return v0
.end method

.method public W()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    return-void
.end method

.method public X()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    return v0
.end method

.method public Y()I
    .locals 3

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    add-int/2addr v0, v1

    return v0
.end method

.method public Z()I
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cT:[B

    array-length v1, v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cU:[I

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    return v0
.end method

.method public a(Ljava/io/InputStream;I)I
    .locals 4
    .param p1    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_2

    const/16 v0, 0x4000

    if-lez p2, :cond_0

    add-int/lit16 p2, p2, 0x1000

    goto :goto_0

    :cond_0
    move p2, v0

    :goto_0
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, p2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-array p2, v0, [B

    :goto_1
    array-length v0, p2

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    invoke-virtual {v1, p2, v2, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/b/e;->read([B)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p2

    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    const-string v1, "Error reading data from stream"

    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    goto :goto_3

    :cond_2
    const/4 p2, 0x2

    iput p2, p0, Lcom/bumptech/glide/b/e;->status:I

    :goto_3
    if-eqz p1, :cond_3

    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    sget-object p2, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    const-string v0, "Error closing stream"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    :cond_3
    :goto_4
    nop

    :goto_5
    iget p1, p0, Lcom/bumptech/glide/b/e;->status:I

    return p1
.end method

.method public a(Landroid/graphics/Bitmap$Config;)V
    .locals 3
    .param p1    # Landroid/graphics/Bitmap$Config;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-eq p1, v0, :cond_1

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", must be one of "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " or "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/bumptech/glide/b/e;->dc:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method public declared-synchronized a(Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/b/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;I)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/b/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    if-lez p3, :cond_2

    :try_start_0
    invoke-static {p3}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p3

    const/4 v0, 0x0

    iput v0, p0, Lcom/bumptech/glide/b/e;->status:I

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    const/4 v1, -0x1

    iput v1, p0, Lcom/bumptech/glide/b/e;->cV:I

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    iget-object p2, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object p2, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iput-boolean v0, p0, Lcom/bumptech/glide/b/e;->cX:Z

    iget-object p2, p1, Lcom/bumptech/glide/b/c;->cp:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/b/b;

    iget v0, v0, Lcom/bumptech/glide/b/b;->dispose:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/bumptech/glide/b/e;->cX:Z

    goto :goto_1

    :cond_0
    goto :goto_0

    :cond_1
    :goto_1
    iput p3, p0, Lcom/bumptech/glide/b/e;->sampleSize:I

    iget p2, p1, Lcom/bumptech/glide/b/c;->width:I

    div-int/2addr p2, p3

    iput p2, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget p2, p1, Lcom/bumptech/glide/b/c;->height:I

    div-int/2addr p2, p3

    iput p2, p0, Lcom/bumptech/glide/b/e;->cY:I

    iget-object p2, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget p3, p1, Lcom/bumptech/glide/b/c;->width:I

    iget p1, p1, Lcom/bumptech/glide/b/c;->height:I

    mul-int/2addr p3, p1

    invoke-interface {p2, p3}, Lcom/bumptech/glide/b/a$a;->m(I)[B

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cT:[B

    iget-object p1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget p2, p0, Lcom/bumptech/glide/b/e;->cZ:I

    iget p3, p0, Lcom/bumptech/glide/b/e;->cY:I

    mul-int/2addr p2, p3

    invoke-interface {p1, p2}, Lcom/bumptech/glide/b/a$a;->n(I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/b/e;->cU:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Sample size must be >=0, not: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized a(Lcom/bumptech/glide/b/c;[B)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/b/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/c;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized aa()Landroid/graphics/Bitmap;
    .locals 7
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->cm:I

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    if-gez v0, :cond_2

    :cond_0
    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to decode frame, frameCount="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v4, v4, Lcom/bumptech/glide/b/c;->cm:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", framePointer="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/bumptech/glide/b/e;->cV:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iput v2, p0, Lcom/bumptech/glide/b/e;->status:I

    :cond_2
    iget v0, p0, Lcom/bumptech/glide/b/e;->status:I

    const/4 v3, 0x0

    if-eq v0, v2, :cond_a

    iget v0, p0, Lcom/bumptech/glide/b/e;->status:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_3

    goto/16 :goto_2

    :cond_3
    const/4 v0, 0x0

    iput v0, p0, Lcom/bumptech/glide/b/e;->status:I

    iget-object v4, p0, Lcom/bumptech/glide/b/e;->block:[B

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    const/16 v5, 0xff

    invoke-interface {v4, v5}, Lcom/bumptech/glide/b/a$a;->m(I)[B

    move-result-object v4

    iput-object v4, p0, Lcom/bumptech/glide/b/e;->block:[B

    :cond_4
    iget-object v4, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget-object v4, v4, Lcom/bumptech/glide/b/c;->cp:Ljava/util/List;

    iget v5, p0, Lcom/bumptech/glide/b/e;->cV:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/b/b;

    nop

    iget v5, p0, Lcom/bumptech/glide/b/e;->cV:I

    sub-int/2addr v5, v2

    if-ltz v5, :cond_5

    iget-object v6, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget-object v6, v6, Lcom/bumptech/glide/b/c;->cp:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/bumptech/glide/b/b;

    goto :goto_0

    :cond_5
    move-object v5, v3

    :goto_0
    iget-object v6, v4, Lcom/bumptech/glide/b/b;->lct:[I

    if-eqz v6, :cond_6

    iget-object v6, v4, Lcom/bumptech/glide/b/b;->lct:[I

    goto :goto_1

    :cond_6
    iget-object v6, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget-object v6, v6, Lcom/bumptech/glide/b/c;->gct:[I

    :goto_1
    iput-object v6, p0, Lcom/bumptech/glide/b/e;->act:[I

    iget-object v6, p0, Lcom/bumptech/glide/b/e;->act:[I

    if-nez v6, :cond_8

    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No valid color table found for frame #"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/bumptech/glide/b/e;->cV:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    iput v2, p0, Lcom/bumptech/glide/b/e;->status:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v3

    :cond_8
    :try_start_1
    iget-boolean v1, v4, Lcom/bumptech/glide/b/b;->transparency:Z

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->act:[I

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cQ:[I

    iget-object v3, p0, Lcom/bumptech/glide/b/e;->act:[I

    array-length v3, v3

    invoke-static {v1, v0, v2, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cQ:[I

    iput-object v1, p0, Lcom/bumptech/glide/b/e;->act:[I

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->act:[I

    iget v2, v4, Lcom/bumptech/glide/b/b;->transIndex:I

    aput v0, v1, v2

    :cond_9
    invoke-direct {p0, v4, v5}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/b;Lcom/bumptech/glide/b/b;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_a
    :goto_2
    :try_start_2
    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Lcom/bumptech/glide/b/e;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to decode frame, status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/bumptech/glide/b/e;->status:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_b
    monitor-exit p0

    return-object v3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public advance()V
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v1, v1, Lcom/bumptech/glide/b/c;->cm:I

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/b/e;->cV:I

    return-void
.end method

.method public clear()V
    .locals 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cT:[B

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cT:[B

    invoke-interface {v1, v2}, Lcom/bumptech/glide/b/a$a;->c([B)V

    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cU:[I

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cU:[I

    invoke-interface {v1, v2}, Lcom/bumptech/glide/b/a$a;->b([I)V

    :cond_1
    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget-object v2, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    invoke-interface {v1, v2}, Lcom/bumptech/glide/b/a$a;->c(Landroid/graphics/Bitmap;)V

    :cond_2
    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cW:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->da:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->block:[B

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cR:Lcom/bumptech/glide/b/a$a;

    iget-object v1, p0, Lcom/bumptech/glide/b/e;->block:[B

    invoke-interface {v0, v1}, Lcom/bumptech/glide/b/a$a;->c([B)V

    :cond_3
    return-void
.end method

.method public getData()Ljava/nio/ByteBuffer;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cK:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getDelay(I)I
    .locals 1

    nop

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->cm:I

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget-object v0, v0, Lcom/bumptech/glide/b/c;->cp:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/b/b;

    iget p1, p1, Lcom/bumptech/glide/b/b;->delay:I

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public getFrameCount()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->cm:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->height:I

    return v0
.end method

.method public getLoopCount()I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->loopCount:I

    return v0
.end method

.method public getStatus()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/e;->status:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    iget v0, v0, Lcom/bumptech/glide/b/c;->width:I

    return v0
.end method

.method public declared-synchronized read([B)I
    .locals 1
    .param p1    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/b/e;->af()Lcom/bumptech/glide/b/d;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/b/d;->d([B)Lcom/bumptech/glide/b/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/b/d;->ac()Lcom/bumptech/glide/b/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/b/e;->cL:Lcom/bumptech/glide/b/c;

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/b/e;->a(Lcom/bumptech/glide/b/c;[B)V

    :cond_0
    iget p1, p0, Lcom/bumptech/glide/b/e;->status:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

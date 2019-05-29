.class public Lcom/bumptech/glide/b/c;
.super Ljava/lang/Object;
.source "GifHeader.java"


# static fields
.field public static final ck:I = 0x0

.field public static final cl:I = -0x1


# instance fields
.field bgColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field bgIndex:I

.field cm:I

.field cn:Lcom/bumptech/glide/b/b;

.field final cp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/b/b;",
            ">;"
        }
    .end annotation
.end field

.field gct:[I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field gctFlag:Z

.field gctSize:I

.field height:I

.field loopCount:I

.field pixelAspect:I

.field status:I

.field width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/b/c;->gct:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/bumptech/glide/b/c;->status:I

    iput v0, p0, Lcom/bumptech/glide/b/c;->cm:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/b/c;->cp:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/b/c;->loopCount:I

    return-void
.end method


# virtual methods
.method public ab()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/c;->cm:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/c;->height:I

    return v0
.end method

.method public getStatus()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/c;->status:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/b/c;->width:I

    return v0
.end method

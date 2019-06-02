.class public Lcom/android/camera/fragment/music/RoundedCornersTransformation;
.super Lcom/bumptech/glide/load/resource/bitmap/g;
.source "RoundedCornersTransformation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;
    }
.end annotation


# static fields
.field private static final ID:Ljava/lang/String; = "jp.wasabeef.glide.transformations.RoundedCornersTransformation.1"

.field private static final VERSION:I = 0x1


# instance fields
.field private cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

.field private diameter:I

.field private margin:I

.field private radius:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ALL:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;-><init>(IILcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;)V

    return-void
.end method

.method public constructor <init>(IILcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;)V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/bitmap/g;-><init>()V

    iput p1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    iget p1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    mul-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    iput p2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iput-object p3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    return-void
.end method

.method private drawBottomLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v4, v4

    sub-float v4, p4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawBottomRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 4

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float v3, p3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p4, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawBottomRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 4

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p4, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawDiagonalFromTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 6

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v5, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v3, v3

    sub-float v3, p3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p4, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawDiagonalFromTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, p3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float v3, p3, v3

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v4, v4

    sub-float v4, p4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawOtherBottomLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, p3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p3, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawOtherBottomRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, p3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawOtherTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 4

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p3, v3

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p4, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawOtherTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v2, v2

    sub-float v2, p4, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p4, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 4

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float/2addr p3, v3

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 3

    iget v0, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v0, v0

    sub-float/2addr p3, v0

    iget v0, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v0, v0

    sub-float/2addr p4, v0

    sget-object v0, Lcom/android/camera/fragment/music/RoundedCornersTransformation$1;->$SwitchMap$com$android$camera$fragment$music$RoundedCornersTransformation$CornerType:[I

    iget-object v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget p3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float p3, p3

    iget p4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float p4, p4

    invoke-virtual {p1, v0, p3, p4, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawDiagonalFromTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawDiagonalFromTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawOtherBottomRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawOtherBottomLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_4
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawOtherTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_5
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawOtherTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_6
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_7
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_8
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawBottomRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_9
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawTopRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_a
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawBottomRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_b
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawBottomLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_c
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_d
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    goto :goto_0

    :pswitch_e
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget p3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float p3, p3

    iget p4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float p4, p4

    invoke-virtual {p1, v0, p3, p4, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private drawTopLeftRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 6

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v5, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawTopRightRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, p3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v3, v3

    sub-float v3, p3, v3

    invoke-direct {v0, v1, v2, v3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method private drawTopRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v4, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    add-int/2addr v3, v4

    int-to-float v3, v3

    invoke-direct {v0, v1, v2, p3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v3, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-direct {v0, v1, v2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v0, p2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    iget v0, p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    iget-object v0, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hashCode()I
    .locals 2

    const-string v0, "jp.wasabeef.glide.transformations.RoundedCornersTransformation.1"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    mul-int/lit16 v1, v1, 0x2710

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    mul-int/lit16 v1, v1, 0x3e8

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    mul-int/lit8 v1, v1, 0x64

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->ordinal()I

    move-result v1

    mul-int/lit8 v1, v1, 0xa

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "RoundedTransformation(radius="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->radius:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", margin="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->margin:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", diameter="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->diameter:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", cornerType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->cornerType:Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;

    invoke-virtual {v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation$CornerType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected transform(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 5

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-interface {p1, p3, p4, v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->b(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance v0, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    int-to-float p2, p3

    int-to-float p3, p4

    invoke-direct {p0, v1, v2, p2, p3}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;->drawRoundRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;FF)V

    return-object p1
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 0
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

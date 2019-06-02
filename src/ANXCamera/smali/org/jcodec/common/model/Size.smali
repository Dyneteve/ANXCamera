.class public Lorg/jcodec/common/model/Size;
.super Ljava/lang/Object;
.source "Size.java"


# instance fields
.field private height:I

.field private width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/jcodec/common/model/Size;->width:I

    iput p2, p0, Lorg/jcodec/common/model/Size;->height:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    :cond_2
    check-cast p1, Lorg/jcodec/common/model/Size;

    iget v2, p0, Lorg/jcodec/common/model/Size;->height:I

    iget v3, p1, Lorg/jcodec/common/model/Size;->height:I

    if-eq v2, v3, :cond_3

    return v1

    :cond_3
    iget v2, p0, Lorg/jcodec/common/model/Size;->width:I

    iget p1, p1, Lorg/jcodec/common/model/Size;->width:I

    if-eq v2, p1, :cond_4

    return v1

    :cond_4
    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lorg/jcodec/common/model/Size;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lorg/jcodec/common/model/Size;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    nop

    nop

    iget v0, p0, Lorg/jcodec/common/model/Size;->height:I

    const/16 v1, 0x1f

    add-int/2addr v0, v1

    mul-int/2addr v1, v0

    iget v0, p0, Lorg/jcodec/common/model/Size;->width:I

    add-int/2addr v1, v0

    return v1
.end method

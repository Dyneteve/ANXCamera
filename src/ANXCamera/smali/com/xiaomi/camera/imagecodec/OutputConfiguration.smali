.class public Lcom/xiaomi/camera/imagecodec/OutputConfiguration;
.super Ljava/lang/Object;
.source "OutputConfiguration.java"


# instance fields
.field private final mFormat:I

.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mWidth:I

    iput p2, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mHeight:I

    iput p3, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mFormat:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    iget v1, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mWidth:I

    iget v3, p1, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mWidth:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mHeight:I

    iget p1, p1, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mHeight:I

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getFormat()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mWidth:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "OutputConfiguration(w:%d, h:%d, format:%d)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mWidth:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget v2, p0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->mFormat:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

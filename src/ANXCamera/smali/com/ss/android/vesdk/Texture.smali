.class public Lcom/ss/android/vesdk/Texture;
.super Ljava/lang/Object;
.source "Texture.java"


# instance fields
.field private surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private surfaceTextureID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILandroid/graphics/SurfaceTexture;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTextureID:I

    iput-object p2, p0, Lcom/ss/android/vesdk/Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-void
.end method


# virtual methods
.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public getSurfaceTextureID()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/Texture;->surfaceTextureID:I

    return v0
.end method

.method public onDestroy(Z)V
    .locals 0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    :cond_0
    iget p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTextureID:I

    invoke-static {p1}, Lcom/ss/android/ttve/common/TECommon;->isTextureID(I)Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTextureID:I

    invoke-static {p1}, Lcom/ss/android/ttve/common/TECommon;->deleteTextureID(I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/ss/android/vesdk/Texture;->surfaceTextureID:I

    :cond_1
    return-void
.end method

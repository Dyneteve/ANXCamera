.class public Lcom/android/gallery3d/ui/ExtTexture;
.super Lcom/android/gallery3d/ui/BasicTexture;
.source "ExtTexture.java"


# static fields
.field private static sTextureId:[I


# instance fields
.field private mTarget:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/android/gallery3d/ui/BasicTexture;-><init>()V

    sget-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    sget-object v0, Lcom/android/gallery3d/ui/ExtTexture;->sTextureId:[I

    aget v0, v0, v1

    iput v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    const-string v0, "ExtTexture"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "texId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const v0, 0x8d65

    iput v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    return-void
.end method

.method private uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 3

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    iget v1, p0, Lcom/android/gallery3d/ui/ExtTexture;->mId:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    const v1, 0x812f

    const/16 v2, 0x2802

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    const/16 v2, 0x2803

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    const v1, 0x46180400    # 9729.0f

    const/16 v2, 0x2801

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    const/16 v2, 0x2800

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/ExtTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/gallery3d/ui/ExtTexture;->mState:I

    return-void
.end method


# virtual methods
.method public draw(Lcom/android/gallery3d/ui/GLCanvas;II)V
    .locals 0

    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 0

    return-void
.end method

.method public getTarget()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/ExtTexture;->mTarget:I

    return v0
.end method

.method public hasBorder()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isOpaque()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/ExtTexture;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/gallery3d/ui/ExtTexture;->uploadToCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public yield()V
    .locals 0

    return-void
.end method

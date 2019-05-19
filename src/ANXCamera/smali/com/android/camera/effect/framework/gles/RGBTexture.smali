.class public Lcom/android/camera/effect/framework/gles/RGBTexture;
.super Lcom/android/gallery3d/ui/RawTexture;
.source "RGBTexture.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "RGBTexture"

.field private static final sTextureId:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    new-array v0, v0, [I

    sput-object v0, Lcom/android/camera/effect/framework/gles/RGBTexture;->sTextureId:[I

    return-void
.end method

.method public constructor <init>(IIZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    return-void
.end method


# virtual methods
.method public getTarget()I
    .locals 1

    const/16 v0, 0xde1

    return v0
.end method

.method public onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/RGBTexture;->isLoaded()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const-string p1, "RGBTexture"

    const-string v0, "lost the content due to context change"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1
.end method

.method public prepare(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 14

    sget-object v0, Lcom/android/camera/effect/framework/gles/RGBTexture;->sTextureId:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    sget-object v0, Lcom/android/camera/effect/framework/gles/RGBTexture;->sTextureId:[I

    aget v0, v0, v2

    const/16 v3, 0xde1

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const v0, 0x812f

    const/16 v4, 0x2802

    invoke-static {v3, v4, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v4, 0x2803

    invoke-static {v3, v4, v0}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const v0, 0x46180400    # 9729.0f

    const/16 v4, 0x2801

    invoke-static {v3, v4, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v4, 0x2800

    invoke-static {v3, v4, v0}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/RGBTexture;->getTextureWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/RGBTexture;->getTextureHeight()I

    move-result v9

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/16 v7, 0x1907

    const/4 v10, 0x0

    const/16 v11, 0x1907

    const/16 v12, 0x1401

    const/4 v13, 0x0

    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const-string v0, "RGBTexture"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "prepare textureSize="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/RGBTexture;->getTextureWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/RGBTexture;->getTextureHeight()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/android/camera/effect/framework/gles/RGBTexture;->sTextureId:[I

    aget v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/camera/effect/framework/gles/RGBTexture;->sTextureId:[I

    aget v0, v0, v2

    iput v0, p0, Lcom/android/camera/effect/framework/gles/RGBTexture;->mId:I

    iput v1, p0, Lcom/android/camera/effect/framework/gles/RGBTexture;->mState:I

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/framework/gles/RGBTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    return-void
.end method

.method public yield()V
    .locals 0

    return-void
.end method

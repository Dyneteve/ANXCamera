.class public Lcom/android/camera/effect/FrameBuffer;
.super Ljava/lang/Object;
.source "FrameBuffer.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mFrameBufferID:[I

.field private mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

.field private mTexture:Lcom/android/gallery3d/ui/RawTexture;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/FrameBuffer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;III)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    new-instance v1, Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {v1, p2, p3, v0}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    iput-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1, p1}, Lcom/android/gallery3d/ui/RawTexture;->prepare(Lcom/android/gallery3d/ui/GLCanvas;)V

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    aget v1, v1, v2

    const v3, 0x8d40

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v1

    const v4, 0x8ce0

    const/16 v5, 0xde1

    invoke-static {v3, v4, v5, v1, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v3, p4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iput-object p1, p0, Lcom/android/camera/effect/FrameBuffer;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    sget-object p1, Lcom/android/camera/effect/FrameBuffer;->TAG:Ljava/lang/String;

    sget-object p4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "init@2: fbo=%d tex=%d %d*%d thread=%d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v2, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v0, 0x2

    aput-object p2, v3, v0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x3

    aput-object p2, v3, p3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->getId()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const/4 p3, 0x4

    aput-object p2, v3, p3

    invoke-static {p4, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/camera/effect/framework/gles/RGBTexture;I)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    invoke-virtual {p2}, Lcom/android/camera/effect/framework/gles/RGBTexture;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2, p1}, Lcom/android/camera/effect/framework/gles/RGBTexture;->prepare(Lcom/android/gallery3d/ui/GLCanvas;)V

    :cond_0
    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    aget v1, v1, v2

    const v3, 0x8d40

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const v1, 0x8ce0

    const/16 v4, 0xde1

    invoke-virtual {p2}, Lcom/android/camera/effect/framework/gles/RGBTexture;->getId()I

    move-result v5

    invoke-static {v3, v1, v4, v5, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v3, p3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iput-object p2, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    iput-object p1, p0, Lcom/android/camera/effect/FrameBuffer;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    sget-object p1, Lcom/android/camera/effect/FrameBuffer;->TAG:Ljava/lang/String;

    sget-object p2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string p3, "init@1: fbo=%d tex=%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    iget-object v2, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-static {p2, p3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2, p1}, Lcom/android/gallery3d/ui/RawTexture;->prepare(Lcom/android/gallery3d/ui/GLCanvas;)V

    :cond_0
    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    aget v1, v1, v2

    const v3, 0x8d40

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const v1, 0x8ce0

    const/16 v4, 0xde1

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v5

    invoke-static {v3, v1, v4, v5, v2}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v3, p3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iput-object p2, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    iput-object p1, p0, Lcom/android/camera/effect/FrameBuffer;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    sget-object p1, Lcom/android/camera/effect/FrameBuffer;->TAG:Ljava/lang/String;

    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v1, "init@1: fbo=%d tex=%d %d*%d thread=%d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v2, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v0

    const/4 v0, 0x2

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v3, v0

    const/4 v0, 0x3

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v3, v0

    const/4 p2, 0x4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v3, p2

    invoke-static {p3, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public delete()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    return-void
.end method

.method protected finalize()V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/FrameBuffer;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "delete fbo thread=%d id=%d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mGLCanvas:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-virtual {p0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/gallery3d/ui/GLCanvas;->deleteFrameBuffer(I)V

    :cond_0
    return-void
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v0

    return v0
.end method

.method public getId()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mFrameBufferID:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public getTexture()Lcom/android/gallery3d/ui/RawTexture;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/FrameBuffer;->mTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v0

    return v0
.end method

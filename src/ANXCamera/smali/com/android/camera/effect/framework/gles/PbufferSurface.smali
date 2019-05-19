.class public Lcom/android/camera/effect/framework/gles/PbufferSurface;
.super Lcom/android/camera/effect/framework/gles/EglSurfaceBase;
.source "PbufferSurface.java"


# direct methods
.method protected constructor <init>(Lcom/android/camera/effect/framework/gles/EglCore;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/framework/gles/EglSurfaceBase;-><init>(Lcom/android/camera/effect/framework/gles/EglCore;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/effect/framework/gles/EglCore;II)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/framework/gles/EglSurfaceBase;-><init>(Lcom/android/camera/effect/framework/gles/EglCore;)V

    invoke-virtual {p0, p2, p3}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->createPbufferSurface(II)V

    return-void
.end method


# virtual methods
.method public release()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->releaseEglSurface()V

    return-void
.end method

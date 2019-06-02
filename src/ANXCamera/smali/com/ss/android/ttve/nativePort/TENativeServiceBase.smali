.class public Lcom/ss/android/ttve/nativePort/TENativeServiceBase;
.super Ljava/lang/Object;
.source "TENativeServiceBase.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field protected mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

.field protected mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

.field protected mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    iput-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-void
.end method


# virtual methods
.method public getErrorListener()Lcom/ss/android/ttve/common/TECommonCallback;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-object v0
.end method

.method public getInfoListener()Lcom/ss/android/ttve/common/TECommonCallback;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    return-object v0
.end method

.method public getOpenGLListeners()Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    return-object v0
.end method

.method public nativeCallback_onErrorListener(IIFLjava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/common/TECommonCallback;->onCallback(IIFLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public nativeCallback_onInfoListener(IIF)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/ss/android/ttve/common/TECommonCallback;->onCallback(IIFLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLCreate(I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLCreate(I)I

    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDestroy(I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDestroy(I)I

    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDrawAfter(ID)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDrawAfter(ID)I

    :cond_0
    return-void
.end method

.method public nativeCallback_onOpenGLDrawBefore(ID)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onOpenGLDrawBefore(ID)I

    :cond_0
    return-void
.end method

.method public nativeCallback_onPreviewSurface(I)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-interface {v0, p1}, Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;->onPreviewSurface(I)I

    :cond_0
    return-void
.end method

.method public declared-synchronized setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnErrorListener:Lcom/ss/android/ttve/common/TECommonCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOnInfoListener:Lcom/ss/android/ttve/common/TECommonCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/ss/android/ttve/nativePort/TENativeServiceBase;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

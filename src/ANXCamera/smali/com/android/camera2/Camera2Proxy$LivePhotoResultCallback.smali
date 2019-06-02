.class public interface abstract Lcom/android/camera2/Camera2Proxy$LivePhotoResultCallback;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/Camera2Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LivePhotoResultCallback"
.end annotation


# virtual methods
.method public abstract getFilterId()I
.end method

.method public abstract isGyroStable()Z
.end method

.method public abstract isLivePhotoStarted()Z
.end method

.method public abstract onLivePhotoResultCallback(Lcom/xiaomi/camera/liveshot/LivePhotoResult;)V
.end method

.class public interface abstract Lcom/xiaomi/camera/imagecodec/Reprocessor;
.super Ljava/lang/Object;
.source "Reprocessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;
    }
.end annotation


# virtual methods
.method public abstract deInit()V
.end method

.method public abstract init(Landroid/content/Context;)V
.end method

.method public abstract setJpegOutputSize(II)V
.end method

.method public abstract setVirtualCameraIds(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract submit(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
.end method

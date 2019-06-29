.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$ZoomProtocol;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ZoomProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xaa


# virtual methods
.method public abstract getMaxZoomRatio()F
.end method

.method public abstract getMinZoomRatio()F
.end method

.method public abstract getZoomRatio()F
.end method

.method public abstract notifyDualZoom(Z)V
.end method

.method public abstract notifyZooming(Z)V
.end method

.method public abstract onZoomRatioChanged(FI)V
.end method

.method public abstract onZoomSwitchCamera()V
.end method

.method public abstract setMaxZoomRatio(F)V
.end method

.method public abstract setMinZoomRatio(F)V
.end method

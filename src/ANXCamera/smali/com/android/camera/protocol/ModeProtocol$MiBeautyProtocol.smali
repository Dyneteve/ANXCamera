.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MiBeautyProtocol;
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
    name = "MiBeautyProtocol"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xc2


# virtual methods
.method public abstract closeEyeLight()V
.end method

.method public abstract dismiss()V
.end method

.method public abstract getSupportedBeautyItems(Ljava/lang/String;)Ljava/util/List;
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isBeautyPanelShow()Z
.end method

.method public abstract isEyeLightShow()Z
.end method

.method public abstract resetBeauty()V
.end method

.method public abstract switchShineType(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
.end method

.class final Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;
.super Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;
.source "HardwareCodecReprocessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton<",
        "Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;-><init>()V

    return-void
.end method


# virtual methods
.method protected create()Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;
    .locals 2

    new-instance v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;-><init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;)V

    return-object v0
.end method

.method protected bridge synthetic create()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;->create()Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    move-result-object v0

    return-object v0
.end method

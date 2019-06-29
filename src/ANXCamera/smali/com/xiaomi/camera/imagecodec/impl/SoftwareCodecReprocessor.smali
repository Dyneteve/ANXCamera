.class public Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor;
.super Ljava/lang/Object;
.source "SoftwareCodecReprocessor.java"

# interfaces
.implements Lcom/xiaomi/camera/imagecodec/Reprocessor;


# static fields
.field public static final sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton<",
            "Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor$1;

    invoke-direct {v0}, Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor$1;-><init>()V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor;->sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor;-><init>()V

    return-void
.end method


# virtual methods
.method public deInit()V
    .locals 0

    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public setJpegOutputSize(II)V
    .locals 0

    return-void
.end method

.method public setVirtualCameraIds(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public submit(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    .locals 0

    return-void
.end method

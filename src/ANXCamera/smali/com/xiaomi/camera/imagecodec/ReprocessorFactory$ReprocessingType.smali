.class public final enum Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
.super Ljava/lang/Enum;
.source "ReprocessorFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ReprocessingType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

.field public static final enum HARDWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

.field public static final enum SOFTWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

.field public static final enum VIRTUAL_CAMERA:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    const-string v1, "VIRTUAL_CAMERA"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->VIRTUAL_CAMERA:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    new-instance v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    const-string v1, "HARDWARE_CODEC"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->HARDWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    new-instance v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    const-string v1, "SOFTWARE_CODEC"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->SOFTWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->VIRTUAL_CAMERA:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->HARDWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->SOFTWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->$VALUES:[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
    .locals 1

    const-class v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    return-object p0
.end method

.method public static values()[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->$VALUES:[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    invoke-virtual {v0}, [Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    return-object v0
.end method

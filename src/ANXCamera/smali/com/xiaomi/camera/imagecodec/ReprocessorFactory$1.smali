.class synthetic Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$1;
.super Ljava/lang/Object;
.source "ReprocessorFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$xiaomi$camera$imagecodec$ReprocessorFactory$ReprocessingType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->values()[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$1;->$SwitchMap$com$xiaomi$camera$imagecodec$ReprocessorFactory$ReprocessingType:[I

    :try_start_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$1;->$SwitchMap$com$xiaomi$camera$imagecodec$ReprocessorFactory$ReprocessingType:[I

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->HARDWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    :try_start_1
    sget-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$1;->$SwitchMap$com$xiaomi$camera$imagecodec$ReprocessorFactory$ReprocessingType:[I

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->SOFTWARE_CODEC:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    :goto_1
    return-void
.end method

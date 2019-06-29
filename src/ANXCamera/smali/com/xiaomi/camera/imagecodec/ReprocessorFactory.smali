.class public Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;
.super Ljava/lang/Object;
.source "ReprocessorFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ReprocessorFactory"

.field private static sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getReprocessor()Lcom/xiaomi/camera/imagecodec/Reprocessor;
    .locals 3

    const-class v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$1;->$SwitchMap$com$xiaomi$camera$imagecodec$ReprocessorFactory$ReprocessingType:[I

    sget-object v2, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;

    goto :goto_0

    :pswitch_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/SoftwareCodecReprocessor;->sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/Reprocessor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :pswitch_1
    :try_start_1
    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/Reprocessor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :goto_0
    :try_start_2
    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/Reprocessor;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v0

    return-object v1

    :cond_0
    :try_start_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The global reprocessingType is not defined yet, make sure #setPreferredReprocessingType is called"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static declared-synchronized setPreferredReprocessorType(Landroid/content/Context;)V
    .locals 4

    const-class v0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->VIRTUAL_CAMERA:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v2, Lcom/xiaomi/camera/imagecodec/R$integer;->preferred_image_reprocessor_type:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;->values()[Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    move-result-object v2

    aget-object p0, v2, p0
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p0

    :try_start_2
    const-string v2, "ReprocessorFactory"

    const-string v3, "Failed to find the preferred reprocessor, use default (VIRTUAL_CAMERA) instead"

    invoke-static {v2, v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p0, v1

    :goto_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    if-nez v1, :cond_0

    sput-object p0, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;

    goto :goto_1

    :cond_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->sReprocessorType:Lcom/xiaomi/camera/imagecodec/ReprocessorFactory$ReprocessingType;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-ne v1, p0, :cond_1

    :goto_1
    monitor-exit v0

    return-void

    :cond_1
    :try_start_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "The type of preferred reprocessor is not allowed to be changed."

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

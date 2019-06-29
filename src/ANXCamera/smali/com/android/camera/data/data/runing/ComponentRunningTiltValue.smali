.class public Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentRunningTiltValue.java"


# static fields
.field public static final TILT_CIRCLE:Ljava/lang/String; = "circle"

.field public static final TILT_PARALLEL:Ljava/lang/String; = "parallel"


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    return-void
.end method

.method private initItems()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "circle"

    const v3, 0x7f0200b5

    const v4, 0x7f09014f

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/camera/data/data/ComponentDataItem;

    const-string v2, "parallel"

    const v3, 0x7f0200b6

    const v4, 0x7f090150

    invoke-direct {v1, v3, v3, v4, v2}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    const-string p1, "circle"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    const v0, 0x7f09018a

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    const-string p1, "pref_camera_tilt_shift_key"

    return-object p1
.end method

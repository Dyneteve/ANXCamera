.class public Lcom/android/camera/data/data/config/ComponentRunningMacroMode;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentRunningMacroMode.java"


# static fields
.field public static final VALUE_OFF:Ljava/lang/String; = "OFF"

.field public static final VALUE_ON:Ljava/lang/String; = "ON"


# instance fields
.field private mCacheValues:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraId:I

.field private mIsNormalIntent:Z

.field public mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/runing/DataItemRunning;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCacheValues:Ljava/util/Map;

    return-void
.end method

.method private getMode(I)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xa5

    if-ne v0, p1, :cond_0

    const/16 p1, 0xa3

    :cond_0
    const/16 v0, 0xa9

    if-ne v0, p1, :cond_1

    const/16 p1, 0xa2

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCameraId:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public clearArrayMap()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCacheValues:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const-string p1, "OFF"

    return-object p1
.end method

.method public getDisplayTitleString()I
    .locals 1

    const/4 v0, 0x0

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

    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    const-string p1, "pref_macro_mode"

    return-object p1
.end method

.method public getResIcon(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const p1, 0x7f02013b

    return p1

    :cond_0
    const p1, 0x7f02013a

    return p1
.end method

.method public getResText()I
    .locals 1

    const v0, 0x7f09029d

    return v0
.end method

.method public isCacheSwitchOn(I)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCacheValues:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->getMode(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    :goto_0
    return p1
.end method

.method public isSwitchOn(I)Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mIsNormalIntent:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->isCacheSwitchOn(I)Z

    move-result p1

    return p1
.end method

.method public reInit(IZ)V
    .locals 0

    iput p1, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCameraId:I

    iput-boolean p2, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mIsNormalIntent:Z

    return-void
.end method

.method public setSwitchOff(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCacheValues:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->getMode(I)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setSwitchOn(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->mCacheValues:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/config/ComponentRunningMacroMode;->getMode(I)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

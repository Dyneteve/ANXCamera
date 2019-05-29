.class public Lcom/android/camera/data/data/config/ComponentConfigUltraWide;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigUltraWide.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# static fields
.field public static final ULTRA_WIDE_VALUE_OFF:Ljava/lang/String; = "OFF"

.field public static final ULTRA_WIDE_VALUE_ON:Ljava/lang/String; = "ON"


# instance fields
.field private mUltraWideResource:[I


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    invoke-direct {p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getUltraWideResources()[I

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mUltraWideResource:[I

    return-void
.end method

.method private getUltraWideResources()[I
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    nop

    nop

    return-object v0

    nop

    :array_0
    .array-data 4
        0x7f02019c
        0x7f02019d
    .end array-data
.end method


# virtual methods
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

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 2

    const/16 v0, 0xa0

    if-eq p1, v0, :cond_2

    const/16 v0, 0xa5

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa9

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pref_ultra_wide_status"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    :pswitch_0
    const-string p1, "pref_ultra_wide_status162"

    return-object p1

    :cond_1
    :pswitch_1
    const-string p1, "pref_ultra_wide_status163"

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "unspecified ultra wide"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0xa2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getValueSelectedDrawableIgnoreClose(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "ON"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mUltraWideResource:[I

    const/4 v0, 0x1

    aget p1, p1, v0

    return p1

    :cond_0
    const-string v0, "OFF"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mUltraWideResource:[I

    const/4 v0, 0x0

    aget p1, p1, v0

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getValueSelectedStringIdIgnoreClose(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "ON"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const p1, 0x7f09024c

    return p1

    :cond_0
    const-string v0, "OFF"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const p1, 0x7f09024d

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public isSupportUltraWide()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isUltraWideOnInMode(I)Z
    .locals 1

    const-string v0, "ON"

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public reInit(IILcom/android/camera2/CameraCapabilities;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/android/camera2/CameraCapabilities;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    iget-object p3, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    if-nez p3, :cond_0

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p3

    invoke-virtual {p3}, Lcom/mi/config/a;->isSupportUltraWide()Z

    move-result p3

    if-nez p2, :cond_3

    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    const/16 p2, 0xa6

    if-eq p1, p2, :cond_2

    packed-switch p1, :pswitch_data_0

    nop

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    const-string p3, "OFF"

    const/4 v0, 0x0

    const v1, 0x7f02019c

    invoke-direct {p2, v1, v1, v0, p3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    const-string p3, "ON"

    const v1, 0x7f02019d

    invoke-direct {p2, v1, v1, v0, p3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    return-object p1

    :cond_2
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    return-object p1

    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->mItems:Ljava/util/List;

    return-object p1

    :pswitch_data_0
    .packed-switch 0xab
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public resetUltraWide(Lcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 3

    const/16 v0, 0xa3

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_0
    const/16 v0, 0xa1

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_1
    const/16 v0, 0xac

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_2
    const/16 v0, 0xa2

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_3
    const/16 v0, 0xad

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_4
    const/16 v0, 0xa5

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_5
    const/16 v0, 0xaf

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "OFF"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->getKey(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "OFF"

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_6
    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    return-void
.end method

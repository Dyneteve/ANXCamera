.class public Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBeautyBody.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final DEF_BEAUTY_BODY_VALUE:I


# instance fields
.field private mIsClosed:Z


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    return-void
.end method


# virtual methods
.method public getBeautyBodyValue(Ljava/lang/String;I)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return p2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 p1, 0x0

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

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    :pswitch_0
    const-string p1, "_video"

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isBeautyBodyKey(Ljava/lang/String;)Z
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x1

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "pref_beauty_head_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    move p1, v1

    goto :goto_1

    :sswitch_1
    const-string v2, "pref_beauty_shoulder_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    goto :goto_1

    :sswitch_2
    const-string v2, "key_beauty_leg_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x3

    goto :goto_1

    :sswitch_3
    const-string v2, "pref_beauty_whole_body_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x4

    goto :goto_1

    :sswitch_4
    const-string v2, "pref_beauty_butt_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x5

    goto :goto_1

    :sswitch_5
    const-string v2, "pref_beauty_body_slim_ratio"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    move p1, v3

    goto :goto_1

    :cond_1
    :goto_0
    move p1, v0

    :goto_1
    packed-switch p1, :pswitch_data_0

    return v1

    :pswitch_0
    return v3

    :pswitch_1
    return v3

    :pswitch_2
    return v3

    :pswitch_3
    return v3

    :pswitch_4
    return v3

    :pswitch_5
    return v3

    nop

    :sswitch_data_0
    .sparse-switch
        -0x676e6ee1 -> :sswitch_5
        -0x5a8387f2 -> :sswitch_4
        -0x4b3d8c29 -> :sswitch_3
        -0x8bc7263 -> :sswitch_2
        0x65e369e1 -> :sswitch_1
        0x73f08a21 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mIsClosed:Z

    return v0
.end method

.method public resetBeautyBody(ILcom/android/camera/data/provider/DataProvider$ProviderEditor;)V
    .locals 7

    const-string p1, "pref_beauty_head_slim_ratio"

    const-string v0, "pref_beauty_body_slim_ratio"

    const-string v1, "pref_beauty_shoulder_slim_ratio"

    const-string v2, "key_beauty_leg_slim_ratio"

    const-string v3, "pref_beauty_whole_body_slim_ratio"

    const-string v4, "pref_beauty_butt_slim_ratio"

    iget-object v5, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    const/4 v6, 0x0

    invoke-virtual {v5, p1, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-lez v5, :cond_0

    invoke-interface {p2, p1, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_0
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v0, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_1

    invoke-interface {p2, v0, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_1
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v1, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_2

    invoke-interface {p2, v1, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_2
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v2, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_3

    invoke-interface {p2, v2, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_3
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v3, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_4

    invoke-interface {p2, v3, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_4
    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {p1, v4, v6}, Lcom/android/camera/data/data/DataItemBase;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p1, :cond_5

    invoke-interface {p2, v4, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_5
    return-void
.end method

.method public setBeautyBodyValue(Ljava/lang/String;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setClosed(Z)V

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mParentDataItem:Lcom/android/camera/data/data/DataItemBase;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/data/data/DataItemBase;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return-void
.end method

.method public setClosed(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->mIsClosed:Z

    return-void
.end method

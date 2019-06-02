.class public Lcom/android/camera/data/data/config/ComponentConfigBeauty;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentConfigBeauty.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mIsClosed:Landroid/util/SparseBooleanArray;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    const-string v0, "i:0"

    const-string v1, "i:3"

    const-string v2, "i:6"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/data/data/config/DataItemConfig;I)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const v1, 0x7f09017b

    const v2, 0x7f02009e

    invoke-direct {p2, v2, v2, v1, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v0, v0, v3

    const v3, 0x7f02009d

    invoke-direct {p2, v2, v3, v1, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    new-instance p2, Lcom/android/camera/data/data/ComponentDataItem;

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    const v1, 0x7f02009c

    const v3, 0x7f09017c

    invoke-direct {p2, v2, v1, v3, v0}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private static final logd(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5

    sget-object v0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "%s: legacy=%b, mode=%d, value=%s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const/4 v4, 0x1

    aput-object p0, v3, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 p1, 0x2

    aput-object p0, v3, p1

    const/4 p0, 0x3

    aput-object p2, v3, p0

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public clearClosed()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    :cond_0
    return-void
.end method

.method public getComponentValue(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1: getComponentValue()"

    const-string v1, "i:0"

    invoke-static {v0, p1, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    const-string p1, "i:0"

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "2: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    const-string v1, "3: getComponentValue()"

    invoke-static {v1, p1, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->logd(Ljava/lang/String;ILjava/lang/String;)V

    return-object v0
.end method

.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

    const-string p1, "i:0"

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

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    const-string p1, "pref_beautify_level_key_capture"

    return-object p1

    :pswitch_0
    const-string p1, "pref_beautify_level_key_video"

    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getNextValue(I)Ljava/lang/String;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    sget-object v3, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {v3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object p1, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->SWITCHABLE_BEAUTY_LEVELS:[Ljava/lang/String;

    add-int/lit8 v2, v2, 0x1

    rem-int/2addr v2, v1

    aget-object p1, p1, v2

    return-object p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPersistValue(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isClosed(I)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    return p1
.end method

.method public isSwitchOn(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public setClosed(ZI)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->mIsClosed:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p2, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    return-void
.end method

.method public setComponentValue(ILjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->setClosed(ZI)V

    invoke-super {p0, p1, p2}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    return-void
.end method

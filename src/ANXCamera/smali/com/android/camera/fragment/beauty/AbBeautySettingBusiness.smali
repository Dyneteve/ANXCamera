.class public Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;
.super Ljava/lang/Object;
.source "AbBeautySettingBusiness.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBeautyType:Ljava/lang/String;
    .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
    .end annotation
.end field

.field private mCurrentBeautyItemType:Ljava/lang/String;

.field private mExtraTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportedTypeItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/android/camera/data/data/runing/TypeElementsBeauty;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyType:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyType:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->initBeauty(Ljava/lang/String;Lcom/android/camera/data/data/runing/TypeElementsBeauty;)V

    return-void
.end method

.method private getBeautyType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mBeautyType:Ljava/lang/String;

    return-object v0
.end method

.method private initBeauty(Ljava/lang/String;Lcom/android/camera/data/data/runing/TypeElementsBeauty;)V
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilitiesByBogusCameraId(II)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-virtual {p2, v1, v0, p1}, Lcom/android/camera/data/data/runing/TypeElementsBeauty;->initAndGetSupportItems(ILcom/android/camera2/CameraCapabilities;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mSupportedTypeItems:Ljava/util/List;

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getBeautyType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/TypeItem;

    iget-object p1, p1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public clearBeauty()V
    .locals 4

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getBeautyType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/TypeItem;

    iget-object v1, v1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    return-void
.end method

.method public getDefaultProgressByCurrentItem()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getProgressByCurrentItem()I
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue(Ljava/lang/String;)I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getProgressDefValue(Ljava/lang/String;)I
    .locals 0

    invoke-static {p1}, Lcom/android/camera/constant/BeautyConstant;->getDefaultValueByKey(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mSupportedTypeItems:Ljava/util/List;

    return-object p1
.end method

.method public operate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public resetBeauty()V
    .locals 5

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getBeautyType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/TypeItem;

    iget-object v1, v1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    return-void
.end method

.method public setCurrentType(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    return-void
.end method

.method public setProgressForCurrentItem(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mCurrentBeautyItemType:Ljava/lang/String;

    if-ne v0, p1, :cond_1

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getProgressDefValue(Ljava/lang/String;)I

    move-result v0

    if-ne p1, v0, :cond_2

    :cond_1
    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->setFaceBeautyRatio(Ljava/lang/String;I)V

    sget-object v0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onBeautyParameterChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->onBeautyChanged()V

    :cond_2
    return-void
.end method

.method public updateExtraTable()V
    .locals 4

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getBeautyType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/TypeItem;

    const/4 v2, 0x0

    iget-object v1, v1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;)I

    move-result v2

    :cond_0
    iget-object v3, p0, Lcom/android/camera/fragment/beauty/AbBeautySettingBusiness;->mExtraTable:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

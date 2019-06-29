.class public Lcom/android/camera/data/data/global/ComponentModuleList;
.super Lcom/android/camera/data/data/ComponentData;
.source "ComponentModuleList.java"


# instance fields
.field private mIntentType:I


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/global/DataItemGlobal;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/data/data/ComponentData;-><init>(Lcom/android/camera/data/data/DataItemBase;)V

    return-void
.end method

.method public static final getTransferredMode(I)I
    .locals 1

    const/16 v0, 0xa5

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb0

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    return p0

    :pswitch_0
    const/16 p0, 0xa2

    return p0

    :cond_0
    const/16 p0, 0xa6

    return p0

    :cond_1
    const/16 p0, 0xa3

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private initItems()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/ComponentDataItem;",
            ">;"
        }
    .end annotation

    iget v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/mi/config/a;->gh()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f0901c0

    const/16 v5, 0xac

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {v2}, Lcom/mi/config/a;->gt()Z

    move-result v3

    const v4, 0x7f0901bf

    if-nez v3, :cond_1

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_1

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const/16 v5, 0xa1

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v2}, Lcom/mi/config/a;->gt()Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_2

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const/16 v5, 0xae

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_3

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_4

    :cond_3
    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f0901c1

    const/16 v5, 0xa2

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v4, 0x3

    const/16 v5, 0xa3

    const v6, 0x7f0901c2

    if-ne v3, v4, :cond_5

    new-instance v2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v1, v6, v3}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_5
    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_6

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_d

    :cond_6
    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v1, v6, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_7

    invoke-virtual {v2}, Lcom/mi/config/a;->hh()Z

    move-result v3

    if-eqz v3, :cond_7

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f0901c8

    const/16 v5, 0xaf

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    invoke-virtual {v2}, Lcom/mi/config/a;->hi()Z

    move-result v3

    if-eqz v3, :cond_8

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f0901c7

    const/16 v5, 0xab

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mi/config/a;->gu()Z

    move-result v3

    if-eqz v3, :cond_9

    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_9

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f09033f

    const/16 v5, 0xb1

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    invoke-virtual {v2}, Lcom/mi/config/a;->fV()Z

    move-result v3

    if-nez v3, :cond_a

    invoke-virtual {v2}, Lcom/mi/config/a;->hx()Z

    move-result v3

    if-eqz v3, :cond_b

    :cond_a
    iget v3, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v3, :cond_b

    new-instance v3, Lcom/android/camera/data/data/ComponentDataItem;

    const v4, 0x7f0900a1

    const/16 v5, 0xad

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v1, v1, v4, v5}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b
    invoke-virtual {v2}, Lcom/mi/config/a;->gN()Z

    move-result v2

    if-eqz v2, :cond_c

    iget v2, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    if-nez v2, :cond_c

    new-instance v2, Lcom/android/camera/data/data/ComponentDataItem;

    const v3, 0x7f0901c5

    const/16 v4, 0xa6

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v1, v3, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_c
    new-instance v2, Lcom/android/camera/data/data/ComponentDataItem;

    const v3, 0x7f09025b

    const/16 v4, 0xa7

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v1, v3, v4}, Lcom/android/camera/data/data/ComponentDataItem;-><init>(IIILjava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_d
    :goto_0
    return-object v0

    :cond_e
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "parse intent first!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getDefaultValue(I)Ljava/lang/String;
    .locals 0

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

    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/data/data/global/ComponentModuleList;->initItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getKey(I)Ljava/lang/String;
    .locals 1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "pref_camera_mode_key_intent_"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMode(I)I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object p1, p1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public needShowLiveRedDot()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveModuleClicked()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public reInit()V
    .locals 0

    return-void
.end method

.method public setIntentType(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mIntentType:I

    iget-object p1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/data/data/global/ComponentModuleList;->initItems()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/data/data/global/ComponentModuleList;->mItems:Ljava/util/List;

    return-void
.end method

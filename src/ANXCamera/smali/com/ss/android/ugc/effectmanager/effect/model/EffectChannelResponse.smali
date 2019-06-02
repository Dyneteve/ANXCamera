.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
.super Ljava/lang/Object;
.source "EffectChannelResponse.java"


# instance fields
.field private allCategoryEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private categoryResponseList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;"
        }
    .end annotation
.end field

.field private collections:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private panel:Ljava/lang/String;

.field private panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

.field private rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getAllCategoryEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    return-object v0
.end method

.method public getCategoryResponseList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-object v0
.end method

.method public getCollections()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->collections:Ljava/util/List;

    return-object v0
.end method

.method public getFrontEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getPanel()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    return-object v0
.end method

.method public getPanelModel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->setId(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-object v0
.end method

.method public getRearEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    return-object v0
.end method

.method public setAllCategoryEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->allCategoryEffects:Ljava/util/List;

    return-void
.end method

.method public setCategoryResponseList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->categoryResponseList:Ljava/util/List;

    return-void
.end method

.method public setCollections(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->collections:Ljava/util/List;

    return-void
.end method

.method public setFrontEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->frontEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-void
.end method

.method public setPanel(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panel:Ljava/lang/String;

    return-void
.end method

.method public setPanelModel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V
    .locals 0

    if-nez p1, :cond_0

    new-instance p1, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->panelModel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-void
.end method

.method public setRearEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->rearEffect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->version:Ljava/lang/String;

    return-void
.end method

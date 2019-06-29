.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;
.super Ljava/lang/Object;
.source "EffectChannelModel.java"


# instance fields
.field private category:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;"
        }
    .end annotation
.end field

.field private collection:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private effects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private front_effect_id:Ljava/lang/String;

.field private panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

.field private rear_effect_id:Ljava/lang/String;

.field private url_prefix:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->url_prefix:Ljava/util/List;

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
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    if-nez v0, :cond_2

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->collection:Ljava/util/List;

    if-nez v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->collection:Ljava/util/List;

    :cond_3
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;->checkValued()Z

    const/4 v0, 0x1

    return v0
.end method

.method public getCategory()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    return-object v0
.end method

.method public getCollection()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->collection:Ljava/util/List;

    return-object v0
.end method

.method public getEffects()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    return-object v0
.end method

.method public getFront_effect_id()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->front_effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getPanel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-object v0
.end method

.method public getRear_effect_id()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->rear_effect_id:Ljava/lang/String;

    return-object v0
.end method

.method public getUrlPrefix()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->url_prefix:Ljava/util/List;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    return-object v0
.end method

.method public setCategory(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->category:Ljava/util/List;

    return-void
.end method

.method public setCollection(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->collection:Ljava/util/List;

    return-void
.end method

.method public setEffects(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->effects:Ljava/util/List;

    return-void
.end method

.method public setFront_effect_id(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->front_effect_id:Ljava/lang/String;

    return-void
.end method

.method public setPanel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->panel:Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    return-void
.end method

.method public setRear_effect_id(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->rear_effect_id:Ljava/lang/String;

    return-void
.end method

.method public setUrlPrefix(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->url_prefix:Ljava/util/List;

    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->version:Ljava/lang/String;

    return-void
.end method

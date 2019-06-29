.class public Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;
.super Ljava/lang/Object;
.source "EffectCategoryIconsModel.java"


# instance fields
.field private uri:Ljava/lang/String;

.field private url_list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public checkValued()Z
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl_list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    return-object v0
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->uri:Ljava/lang/String;

    return-void
.end method

.method public setUrl_list(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->url_list:Ljava/util/List;

    return-void
.end method

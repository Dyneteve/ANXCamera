.class public Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;
.super Ljava/lang/Object;
.source "ComposerHelper.java"


# static fields
.field public static final COMPOSER_CHILDREN:Ljava/lang/String; = "nodes"

.field public static final COMPOSER_CONTENT:Ljava/lang/String; = "content"

.field public static final COMPOSER_DEFAULT_VALUE:Ljava/lang/String; = "default_value"

.field public static final COMPOSER_EXTRA_INFO:Ljava/lang/String; = "extra_info"

.field public static final COMPOSER_ICON:Ljava/lang/String; = "icon"

.field public static final COMPOSER_MAX_VALUE:Ljava/lang/String; = "max_value"

.field public static final COMPOSER_MIN_VALUE:Ljava/lang/String; = "min_value"

.field public static final COMPOSER_NODES:Ljava/lang/String; = "nodes"

.field public static final COMPOSER_PATH:Ljava/lang/String; = "file"

.field public static final COMPOSER_SWITCH_MODE:Ljava/lang/String; = "switch_mode"

.field public static final COMPOSER_TAG_NAME:Ljava/lang/String; = "tag_name"

.field public static final COMPOSER_TYPE:Ljava/lang/String; = "type"

.field public static final COMPOSER_UI_NAME:Ljava/lang/String; = "UI_name"

.field public static final COMPOSER_VERSION:Ljava/lang/String; = "version"

.field public static final CONFIG_EFFECT:Ljava/lang/String; = "effect"

.field public static final CONFIG_FILE_NAME:Ljava/lang/String; = "config.json"

.field public static final CONFIG_LINK:Ljava/lang/String; = "Link"

.field public static final CONFIG_PATH:Ljava/lang/String; = "path"

.field public static final CONFIG_TYPE:Ljava/lang/String; = "type"

.field public static final CONFIG_TYPE_COMPOSER:Ljava/lang/String; = "composer"

.field public static final CONTENT_FILE_NAME:Ljava/lang/String; = "content.json"

.field public static final DEFAULT_SERVER_URL1:Ljava/lang/String; = "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field public static final DEFAULT_SERVER_URL2:Ljava/lang/String; = "https://sf3-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field public static final DEFAULT_SERVER_URL3:Ljava/lang/String; = "https://sf6-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

.field private static serverURLs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf3-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    const-string v1, "https://sf6-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getServerUrls()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    return-object v0
.end method

.method public static parseComposerMaterial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "config.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->getFileContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "effect"

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v2, "Link"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-gtz v2, :cond_0

    return-object v1

    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "path"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v4, "type"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v4, "composer"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "content.json"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->getFileContent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;-><init>()V

    const-string v3, "root"

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->tag_name:Ljava/lang/String;

    const-string v3, "Composer"

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->UI_name:Ljava/lang/String;

    const/4 v3, 0x4

    iput v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const-string v3, "content"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    const-string v3, "nodes"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    move-result-object v3

    if-eqz v3, :cond_2

    iput-object p0, v3, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->parent:Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    :cond_2
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method public static parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;
    .locals 7
    .param p0    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    invoke-direct {v1}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;-><init>()V

    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const-string v2, "file"

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://sf1-hscdn-tos.pstatp.com/obj/ies.fe.effect/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "icon"

    invoke-virtual {p0, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->icon:Ljava/lang/String;

    const-string v2, "UI_name"

    invoke-virtual {p0, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->UI_name:Ljava/lang/String;

    const-string v2, "tag_name"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->tag_name:Ljava/lang/String;

    const-string v2, "default_value"

    const-wide/16 v3, 0x0

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    double-to-float v2, v5

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->default_value:F

    const-string v2, "min_value"

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    double-to-float v2, v5

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->min_value:F

    const-string v2, "max_value"

    invoke-virtual {p0, v2, v3, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->max_value:F

    const-string v2, "switch_mode"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->switch_mode:I

    const-string v2, "nodes"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    const-string v2, "nodes"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    move v2, v3

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_1

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-static {v4, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->parseComposerNode(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    move-result-object v4

    if-eqz v4, :cond_0

    iput-object v1, v4, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->parent:Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    iget-object v5, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-eqz p0, :cond_3

    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_2

    iget-object p0, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->children:Ljava/util/List;

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;

    iget p0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->type:I

    const/4 p1, -0x1

    if-ne p0, p1, :cond_2

    goto :goto_1

    :cond_2
    goto/16 :goto_3

    :cond_3
    :goto_1
    return-object v0

    :cond_4
    invoke-static {}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->getServerUrls()Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;

    invoke-direct {v2}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;-><init>()V

    invoke-virtual {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->setUrlList(Ljava/util/List;)V

    iget-object v3, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;->setUri(Ljava/lang/String;)V

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    invoke-direct {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;-><init>()V

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setFileUrl(Lcom/ss/android/ugc/effectmanager/common/model/UrlModel;)V

    iget-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setId(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->file:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setEffectId(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".zip"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setZipPath(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->setUnzipPath(Ljava/lang/String;)V

    iput-object v3, v1, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerNode;->effect:Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    const-string p2, "extra_info"

    invoke-virtual {p0, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "0"

    if-eqz p0, :cond_6

    const-string p2, "version"

    const-string v2, "0"

    invoke-virtual {p0, p2, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_6
    invoke-static {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->versionCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-gez p0, :cond_7

    return-object v0

    :cond_7
    :goto_3
    return-object v1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v0
.end method

.method public static setServerUrls(Ljava/util/List;)V
    .locals 0
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    sput-object p0, Lcom/ss/android/ugc/effectmanager/effect/model/ComposerHelper;->serverURLs:Ljava/util/List;

    return-void
.end method

.method public static versionCompare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    nop

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-object v1, p0, v0

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    array-length v1, p1

    if-ge v0, v1, :cond_1

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    aget-object p1, p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    return p0

    :cond_1
    array-length p0, p0

    array-length p1, p1

    sub-int/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Integer;->signum(I)I

    move-result p0

    return p0
.end method

.class public final Landroid/provider/MiuiSettings$FrequentPhrases;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FrequentPhrases"
.end annotation


# static fields
.field private static final FREQUENT_PHRASES:Ljava/lang/String; = "frequent_phrases"

.field private static final TAG_PHRASES:Ljava/lang/String; = "phrases"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5894
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFrequentPhrases(Landroid/content/Context;)Ljava/util/ArrayList;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 5921
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "frequent_phrases"

    invoke-static {v0, v1}, Lmiui/provider/ExtraSettings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 5923
    .local v0, "phraseString":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    .line 5924
    return-object v2

    .line 5927
    :cond_12
    move-object v1, v2

    .line 5929
    .local v1, "jsonObject":Lorg/json/JSONObject;
    :try_start_13
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_18} :catch_49

    move-object v1, v3

    .line 5933
    nop

    .line 5935
    const-string/jumbo v3, "phrases"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 5936
    .local v3, "jsonArray":Lorg/json/JSONArray;
    if-eqz v3, :cond_48

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-nez v4, :cond_2a

    goto :goto_48

    .line 5940
    :cond_2a
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 5941
    .local v2, "phraseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 5941
    .local v4, "i":I
    :goto_30
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_47

    .line 5942
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v5

    .line 5943
    .local v5, "phrase":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_41

    .line 5944
    goto :goto_44

    .line 5946
    :cond_41
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5941
    .end local v5    # "phrase":Ljava/lang/String;
    :goto_44
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    .line 5949
    .end local v4    # "i":I
    :cond_47
    return-object v2

    .line 5937
    .end local v2    # "phraseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_48
    :goto_48
    return-object v2

    .line 5930
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    :catch_49
    move-exception v3

    .line 5931
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 5932
    return-object v2
.end method

.method public static setFrequentPhrases(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 5900
    .local p1, "phraseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_3e

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_9

    goto :goto_3e

    .line 5903
    :cond_9
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 5904
    .local v0, "jsonArray":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .line 5904
    .local v1, "i":I
    :goto_f
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1f

    .line 5905
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 5904
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 5907
    .end local v1    # "i":I
    :cond_1f
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 5909
    .local v1, "jsonObject":Lorg/json/JSONObject;
    :try_start_24
    const-string/jumbo v2, "phrases"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_2a} :catch_39

    .line 5913
    nop

    .line 5915
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "frequent_phrases"

    .line 5916
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 5915
    invoke-static {v2, v3, v4}, Lmiui/provider/ExtraSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5915
    .end local v0    # "jsonArray":Lorg/json/JSONArray;
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    goto :goto_49

    .line 5910
    .restart local v0    # "jsonArray":Lorg/json/JSONArray;
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    :catch_39
    move-exception v2

    .line 5911
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 5912
    return-void

    .line 5901
    .end local v0    # "jsonArray":Lorg/json/JSONArray;
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_3e
    :goto_3e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "frequent_phrases"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 5918
    :goto_49
    return-void
.end method

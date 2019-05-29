.class public Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;
.super Ljava/lang/Object;
.source "MiuiSettings.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings$SettingsCloudData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CloudData"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private data:Ljava/lang/String;

.field private json:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6099
    new-instance v0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData$1;

    invoke-direct {v0}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData$1;-><init>()V

    sput-object v0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .line 6000
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6001
    iput-object p1, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    .line 6002
    return-void
.end method

.method private hasKey(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 6033
    invoke-direct {p0}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->initJson()V

    .line 6034
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private initJson()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 6027
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    if-nez v0, :cond_d

    .line 6028
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    .line 6030
    :cond_d
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .line 6092
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 6011
    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    .line 6012
    return v0

    .line 6014
    :cond_4
    instance-of v1, p1, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    .line 6015
    return v2

    .line 6017
    :cond_a
    move-object v1, p1

    check-cast v1, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;

    .line 6018
    .local v1, "cloudData":Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;
    iget-object v3, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    iget-object v4, v1, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    if-eq v3, v4, :cond_24

    iget-object v3, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    if-eqz v3, :cond_22

    iget-object v3, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    iget-object v4, v1, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    goto :goto_24

    :cond_22
    move v0, v2

    nop

    :cond_24
    :goto_24
    return v0
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defVal"    # Z

    .line 6071
    :try_start_0
    invoke-direct {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 6072
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    return v0

    .line 6076
    :cond_d
    goto :goto_12

    .line 6074
    :catch_e
    move-exception v0

    .line 6075
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6077
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_12
    return p2
.end method

.method public getInt(Ljava/lang/String;I)I
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defVal"    # I

    .line 6049
    :try_start_0
    invoke-direct {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 6050
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    return v0

    .line 6054
    :cond_d
    goto :goto_12

    .line 6052
    :catch_e
    move-exception v0

    .line 6053
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6055
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_12
    return p2
.end method

.method public getLong(Ljava/lang/String;J)J
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defVal"    # J

    .line 6060
    :try_start_0
    invoke-direct {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 6061
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    return-wide v0

    .line 6065
    :cond_d
    goto :goto_12

    .line 6063
    :catch_e
    move-exception v0

    .line 6064
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6066
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_12
    return-wide p2
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defVal"    # Ljava/lang/String;

    .line 6082
    :try_start_0
    invoke-direct {p0, p1}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 6083
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    return-object v0

    .line 6087
    :cond_d
    goto :goto_12

    .line 6085
    :catch_e
    move-exception v0

    .line 6086
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6088
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_12
    return-object p2
.end method

.method public hashCode()I
    .registers 2

    .line 6023
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public json()Lorg/json/JSONObject;
    .registers 3

    .line 6039
    :try_start_0
    invoke-direct {p0}, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->initJson()V

    .line 6040
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->json:Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v0

    .line 6041
    :catch_6
    move-exception v0

    .line 6042
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 6043
    const/4 v1, 0x0

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 6006
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 6096
    iget-object v0, p0, Landroid/provider/MiuiSettings$SettingsCloudData$CloudData;->data:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 6097
    return-void
.end method

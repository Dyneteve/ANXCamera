.class public Lcom/xiaomi/camera/core/PictureInfo;
.super Ljava/lang/Object;
.source "PictureInfo.java"


# static fields
.field private static final MIRROR:Ljava/lang/String; = "mirror"

.field private static final SENSOR_TYPE:Ljava/lang/String; = "sensor_type"

.field private static final SENSOR_TYPE_FRONT:Ljava/lang/String; = "front"

.field private static final SENSOR_TYPE_REAR:Ljava/lang/String; = "rear"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private aiEnabled:Z

.field private aiType:I

.field private isBokehFrontCamera:Z

.field private isMirror:Z

.field private transient mInfo:Lorg/json/JSONObject;

.field private mInfoString:Ljava/lang/String;

.field private mSensorType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/PictureInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "rear"

    iput-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mSensorType:Ljava/lang/String;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public end()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfoString:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    return-void
.end method

.method public getAiType()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->aiType:I

    return v0
.end method

.method public getInfoString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfoString:Ljava/lang/String;

    return-object v0
.end method

.method public isAiEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->aiEnabled:Z

    return v0
.end method

.method public isBokehFrontCamera()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->isBokehFrontCamera:Z

    return v0
.end method

.method public isFrontCamera()Z
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mSensorType:Ljava/lang/String;

    const-string v1, "front"

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->isMirror:Z

    return v0
.end method

.method public setAiEnabled(Z)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->aiEnabled:Z

    return-object p0
.end method

.method public setAiType(I)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->aiType:I

    return-object p0
.end method

.method public setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->isBokehFrontCamera:Z

    return-object p0
.end method

.method public setFrontMirror(Z)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->isMirror:Z

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "mirror"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setFrontMirror JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object p0
.end method

.method public setSensorType(Z)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "front"

    goto :goto_0

    :cond_0
    const-string p1, "rear"

    :goto_0
    iput-object p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->mSensorType:Ljava/lang/String;

    :try_start_0
    iget-object p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v0, "sensor_type"

    iget-object v1, p0, Lcom/xiaomi/camera/core/PictureInfo;->mSensorType:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setSensorType JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-object p0
.end method

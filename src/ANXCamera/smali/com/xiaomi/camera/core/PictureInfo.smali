.class public Lcom/xiaomi/camera/core/PictureInfo;
.super Ljava/lang/Object;
.source "PictureInfo.java"


# static fields
.field private static final AISCENE:Ljava/lang/String; = "AIScene"

.field private static final BABY:Ljava/lang/String; = "Baby"

.field private static final BEAUTY_LEVEL:Ljava/lang/String; = "BeautyLevel"

.field private static final FEMALE:Ljava/lang/String; = "Female"

.field private static final HDR_TYPE:Ljava/lang/String; = "Hdr"

.field private static final MALE:Ljava/lang/String; = "Male"

.field private static final MAX_BABY_AGE:F = 6.0f

.field private static final MAX_GENDER_FEMALE:F = 0.4f

.field private static final MIN_BABY_AGE:F = 0.0f

.field private static final MIN_GENDER_MALE:F = 0.6f

.field private static final MIRROR:Ljava/lang/String; = "mirror"

.field private static final NIGHTSCENE:Ljava/lang/String; = "NightScene"

.field private static final OPMODE:Ljava/lang/String; = "OpMode"

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

.method public setAIScene(I)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "AIScene"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setAIScene JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object p0
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

.method public setBaby([F)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 4

    if-eqz p1, :cond_1

    array-length v0, p1

    if-lez v0, :cond_1

    const/4 v0, 0x0

    aget p1, p1, v0

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    const/high16 v0, 0x40c00000    # 6.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "Baby"

    float-to-double v2, p1

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setBaby JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :cond_0
    :goto_0
    nop

    :cond_1
    :goto_1
    return-object p0
.end method

.method public setBeautyLevel(Ljava/lang/String;)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "BeautyLevel"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setBeautyLevel JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
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

.method public setGender([F)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 6

    nop

    nop

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    :try_start_0
    array-length v1, p1

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_2

    :cond_0
    nop

    move v1, v0

    :goto_0
    move v2, v0

    move v3, v2

    :goto_1
    if-ge v0, v1, :cond_3

    aget v4, p1, v0

    const v5, 0x3f19999a    # 0.6f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_1

    add-int/lit8 v2, v2, 0x1

    :cond_1
    aget v4, p1, v0

    const v5, 0x3ecccccd    # 0.4f

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_2

    add-int/lit8 v3, v3, 0x1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v0, "Male"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-object p1, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v0, "Female"

    invoke-virtual {p1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :goto_2
    nop

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setGender JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-object p0
.end method

.method public setHdrType(Ljava/lang/String;)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "Hdr"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setHdrType JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object p0
.end method

.method public setNightScene(I)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "NightScene"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setNightScene JSONException occurs "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object p0
.end method

.method public setOpMode(I)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PictureInfo;->mInfo:Lorg/json/JSONObject;

    const-string v1, "OpMode"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/xiaomi/camera/core/PictureInfo;->TAG:Ljava/lang/String;

    const-string v1, "setOpMode JSONException occurs "

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

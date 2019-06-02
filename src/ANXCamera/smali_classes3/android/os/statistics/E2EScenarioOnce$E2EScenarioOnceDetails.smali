.class public Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
.super Landroid/os/statistics/PerfEvent$DetailFields;
.source "E2EScenarioOnce.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/os/statistics/E2EScenarioOnce;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "E2EScenarioOnceDetails"
.end annotation


# instance fields
.field public batteryLevel:I

.field public batteryTemperature:I

.field public beginPackageName:Ljava/lang/String;

.field public beginPid:I

.field public beginProcessName:Ljava/lang/String;

.field public beginTid:I

.field public beginWalltimeMillis:J

.field public endPackageName:Ljava/lang/String;

.field public endPid:I

.field public endProcessName:Ljava/lang/String;

.field public endTid:I

.field public endWalltimeMillis:J

.field public isCharging:Z

.field public payload:Landroid/os/statistics/E2EScenarioPayload;

.field public scenario:Landroid/os/statistics/E2EScenario;

.field public scenarioOnceId:J

.field public settings:Landroid/os/statistics/E2EScenarioSettings;

.field public tag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/os/statistics/PerfEvent$DetailFields;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public fillIn(Landroid/os/statistics/JniParcel;)V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 4

    invoke-super {p0, p1}, Landroid/os/statistics/PerfEvent$DetailFields;->readFromParcel(Landroid/os/Parcel;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenarioOnceId:J

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenario;

    iput-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/statistics/E2EScenarioSettings;

    iput-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->settings:Landroid/os/statistics/E2EScenarioSettings;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/statistics/E2EScenarioPayload;

    iput-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_30

    goto :goto_31

    :cond_30
    const/4 v1, 0x0

    :goto_31
    iput-boolean v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->isCharging:Z

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryLevel:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryTemperature:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPid:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginTid:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPid:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endTid:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    return-void
.end method

.method public writeToJson(Lorg/json/JSONObject;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/os/statistics/PerfEvent$DetailFields;->writeToJson(Lorg/json/JSONObject;)V

    :try_start_3
    const-string/jumbo v0, "scenarioOnceId"

    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenarioOnceId:J

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string/jumbo v0, "scenario"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    invoke-virtual {v1}, Landroid/os/statistics/E2EScenario;->toJson()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {v0}, Landroid/os/statistics/E2EScenarioPayload;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2f

    const-string/jumbo v0, "payload"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {v1}, Landroid/os/statistics/E2EScenarioPayload;->toJson()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2f
    const-string v0, "charging"

    iget-boolean v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->isCharging:Z

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "batteryLevel"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryLevel:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string/jumbo v0, "temperature"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryTemperature:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "beginWalltime"

    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "beginPid"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPid:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "beginTid"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginTid:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "beginProcessName"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "beginPackageName"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "endWalltime"

    iget-wide v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "endPid"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPid:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "endTid"

    iget v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endTid:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "endProcessName"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "endPackageName"

    iget-object v1, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8b
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_8b} :catch_8c

    goto :goto_90

    :catch_8c
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :goto_90
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroid/os/statistics/PerfEvent$DetailFields;->writeToParcel(Landroid/os/Parcel;I)V

    iget-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenarioOnceId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->scenario:Landroid/os/statistics/E2EScenario;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->settings:Landroid/os/statistics/E2EScenarioSettings;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->payload:Landroid/os/statistics/E2EScenarioPayload;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-boolean v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->isCharging:Z

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryLevel:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->batteryTemperature:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginWalltimeMillis:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginTid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginProcessName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->beginPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-wide v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endWalltimeMillis:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endTid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endProcessName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;->endPackageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

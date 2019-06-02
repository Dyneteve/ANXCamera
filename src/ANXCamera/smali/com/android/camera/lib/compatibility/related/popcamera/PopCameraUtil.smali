.class public Lcom/android/camera/lib/compatibility/related/popcamera/PopCameraUtil;
.super Ljava/lang/Object;
.source "PopCameraUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PopCameraUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMotorStatus()I
    .locals 2

    const-string v0, "PopCameraUtil"

    const-string v1, "takebackMotor: ignore..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1

    return v0
.end method

.method public static popupMotor()Z
    .locals 2

    const-string v0, "PopCameraUtil"

    const-string v1, "popupMotor: ignore..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method public static takebackMotor()Z
    .locals 2

    const-string v0, "PopCameraUtil"

    const-string v1, "takebackMotor: ignore..."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

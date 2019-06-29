.class public Lcom/android/camera/WatermarkMiSysUtils;
.super Ljava/lang/Object;
.source "WatermarkMiSysUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WatermarkMiSysUtils"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static writeFileToPersist([BLjava/lang/String;)Z
    .locals 0

    const-string p0, "WatermarkMiSysUtils"

    const-string/jumbo p1, "writeFileToPersist NO Permission!!!!"

    invoke-static {p0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0
.end method

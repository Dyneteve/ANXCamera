.class public final Lcom/xiaomi/camera/base/CommonUtil;
.super Ljava/lang/Object;
.source "CommonUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CommonUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static saveCameraCalibrationToFile(Landroid/content/Context;[BLjava/lang/String;)Z
    .locals 2

    nop

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    if-eqz p0, :cond_0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x1

    :try_start_2
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :goto_0
    goto :goto_5

    :catch_0
    move-exception p0

    const-string p1, "CommonUtil"

    const-string p2, "saveCameraCalibrationToFile: failed!"

    invoke-static {p1, p2, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    :catchall_0
    move-exception p1

    move-object v1, p0

    goto :goto_3

    :catch_1
    move-exception p1

    move-object v1, p0

    goto :goto_1

    :catch_2
    move-exception p1

    move-object v1, p0

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_3
    move-exception p1

    :goto_1
    :try_start_3
    const-string p0, "CommonUtil"

    const-string p2, "saveCameraCalibrationToFile: IOException"

    invoke-static {p0, p2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    :catch_4
    move-exception p1

    :goto_2
    :try_start_5
    const-string p0, "CommonUtil"

    const-string p2, "saveCameraCalibrationToFile: FileNotFoundException"

    invoke-static {p0, p2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_0

    :goto_3
    nop

    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_4

    :catch_5
    move-exception p0

    const-string p2, "CommonUtil"

    const-string v0, "saveCameraCalibrationToFile: failed!"

    invoke-static {p2, v0, p0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_4
    throw p1

    :cond_0
    :goto_5
    return v0
.end method

.method public static saveCameraCalibrationToFile(Landroid/content/Context;[BZ)Z
    .locals 0

    if-eqz p2, :cond_0

    const-string p2, "front_dual_camera_caldata.bin"

    goto :goto_0

    :cond_0
    const-string p2, "back_dual_camera_caldata.bin"

    :goto_0
    invoke-static {p0, p1, p2}, Lcom/xiaomi/camera/base/CommonUtil;->saveCameraCalibrationToFile(Landroid/content/Context;[BLjava/lang/String;)Z

    move-result p0

    return p0
.end method

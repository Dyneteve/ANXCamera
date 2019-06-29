.class public Lcom/android/camera/network/util/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# static fields
.field private static DBG:Z = false

.field private static final TAG:Ljava/lang/String; = "NetworkUtils"

.field private static sApp:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/network/util/NetworkUtils;->DBG:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/app/Application;)V
    .locals 0

    sput-object p0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    return-void
.end method

.method public static getActiveNetworkInfo()Landroid/net/NetworkInfo;
    .locals 2

    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static isActiveNetworkMetered()Z
    .locals 2

    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    move-result v0

    return v0
.end method

.method public static isNetworkConnected()Z
    .locals 2

    sget-object v0, Lcom/android/camera/network/util/NetworkUtils;->sApp:Landroid/app/Application;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public static tryRequestTTSticker()V
    .locals 3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveStickerInternalChannel()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "local_test"

    goto :goto_0

    :cond_0
    const-string v0, "default"

    :goto_0
    new-instance v1, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

    const-string v2, "default"

    invoke-direct {v1, v0, v2}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/android/camera/network/util/NetworkUtils$1;

    invoke-direct {v0}, Lcom/android/camera/network/util/NetworkUtils$1;-><init>()V

    invoke-virtual {v1, v0}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->execute(Lcom/android/camera/network/net/base/ResponseListener;)V

    return-void
.end method

.class public Lcom/ss/android/medialib/log/VEMonitorInvoker;
.super Ljava/lang/Object;
.source "VEMonitorInvoker.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native nativeGetMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public static native nativeInit()V
.end method

.method public static native nativeMonitorPerf(I)V
.end method

.method public static native nativePerfLong(Ljava/lang/String;J)V
.end method

.method public static native nativePerfRational(Ljava/lang/String;FF)V
.end method

.method public static native nativeReset()V
.end method

.method public static onNativeCallback_onMonitorLogFloat(Ljava/lang/String;Ljava/lang/String;F)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;F)Z

    return-void
.end method

.method public static onNativeCallback_onMonitorLogInt(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;J)Z

    return-void
.end method

.method public static onNativeCallback_onMonitorLogJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELogJson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static onNativeCallback_onMonitorLogMap(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/ss/android/medialib/log/VEMonitor;->monitorVELog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    return-void
.end method

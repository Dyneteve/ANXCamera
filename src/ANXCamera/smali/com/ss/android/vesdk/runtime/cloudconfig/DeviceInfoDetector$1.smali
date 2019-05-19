.class final Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;
.super Ljava/util/ArrayList;
.source "DeviceInfoDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "os_sdk_int"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "external_storage"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "screen_height"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "screen_width"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "storage"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "memory"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "cpu_core"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    const-string v0, "cpu_freq"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    return-void
.end method

.class public final synthetic Lcom/android/camera/module/loader/camera2/-$$Lambda$Camera2OpenManager$ZgrG5KJjepjIEPa7zEeKP9qWso8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$CaptureBusyCallback;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/-$$Lambda$Camera2OpenManager$ZgrG5KJjepjIEPa7zEeKP9qWso8;->f$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    iput-boolean p2, p0, Lcom/android/camera/module/loader/camera2/-$$Lambda$Camera2OpenManager$ZgrG5KJjepjIEPa7zEeKP9qWso8;->f$1:Z

    return-void
.end method


# virtual methods
.method public final onCaptureCompleted(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/-$$Lambda$Camera2OpenManager$ZgrG5KJjepjIEPa7zEeKP9qWso8;->f$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    iget-boolean v1, p0, Lcom/android/camera/module/loader/camera2/-$$Lambda$Camera2OpenManager$ZgrG5KJjepjIEPa7zEeKP9qWso8;->f$1:Z

    invoke-static {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->lambda$release$0(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ZZ)V

    return-void
.end method

.class public final synthetic Lcom/android/camera/module/-$$Lambda$Camera2Module$CEp3KFYUlt9BLp9GeMRWiPpa60E;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$CaptureCallback;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$CEp3KFYUlt9BLp9GeMRWiPpa60E;->f$0:Lcom/android/camera/module/Camera2Module;

    return-void
.end method


# virtual methods
.method public final onCaptureCompleted(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$CEp3KFYUlt9BLp9GeMRWiPpa60E;->f$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0, p1}, Lcom/android/camera/module/Camera2Module;->lambda$startNormalCapture$4(Lcom/android/camera/module/Camera2Module;Z)V

    return-void
.end method

.class public final synthetic Lcom/android/camera2/-$$Lambda$MiCamera2$MUh8S4N2ZF-Ry2fO1Ztm019Axoc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/android/camera2/MiCamera2;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera2/MiCamera2;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$MUh8S4N2ZF-Ry2fO1Ztm019Axoc;->f$0:Lcom/android/camera2/MiCamera2;

    iput-boolean p2, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$MUh8S4N2ZF-Ry2fO1Ztm019Axoc;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$MUh8S4N2ZF-Ry2fO1Ztm019Axoc;->f$0:Lcom/android/camera2/MiCamera2;

    iget-boolean v1, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$MUh8S4N2ZF-Ry2fO1Ztm019Axoc;->f$1:Z

    invoke-static {v0, v1}, Lcom/android/camera2/MiCamera2;->lambda$setCaptureEnable$0(Lcom/android/camera2/MiCamera2;Z)V

    return-void
.end method

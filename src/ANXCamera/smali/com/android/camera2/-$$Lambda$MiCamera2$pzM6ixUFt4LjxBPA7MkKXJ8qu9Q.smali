.class public final synthetic Lcom/android/camera2/-$$Lambda$MiCamera2$pzM6ixUFt4LjxBPA7MkKXJ8qu9Q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# instance fields
.field private final synthetic f$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$pzM6ixUFt4LjxBPA7MkKXJ8qu9Q;->f$0:Lcom/android/camera2/MiCamera2;

    return-void
.end method


# virtual methods
.method public final onImageAvailable(Landroid/media/ImageReader;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera2/-$$Lambda$MiCamera2$pzM6ixUFt4LjxBPA7MkKXJ8qu9Q;->f$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0, p1}, Lcom/android/camera2/MiCamera2;->lambda$preparePreviewImageReader$0(Lcom/android/camera2/MiCamera2;Landroid/media/ImageReader;)V

    return-void
.end method

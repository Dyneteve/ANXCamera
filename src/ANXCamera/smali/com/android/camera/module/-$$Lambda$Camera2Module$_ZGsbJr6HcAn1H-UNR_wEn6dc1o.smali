.class public final synthetic Lcom/android/camera/module/-$$Lambda$Camera2Module$_ZGsbJr6HcAn1H-UNR_wEn6dc1o;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/Camera2Module;

.field private final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$_ZGsbJr6HcAn1H-UNR_wEn6dc1o;->f$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$_ZGsbJr6HcAn1H-UNR_wEn6dc1o;->f$1:I

    return-void
.end method


# virtual methods
.method public final onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$_ZGsbJr6HcAn1H-UNR_wEn6dc1o;->f$0:Lcom/android/camera/module/Camera2Module;

    iget v1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$_ZGsbJr6HcAn1H-UNR_wEn6dc1o;->f$1:I

    invoke-static {v0, v1, p1, p2, p3}, Lcom/android/camera/module/Camera2Module;->lambda$updateDecodePreview$10(Lcom/android/camera/module/Camera2Module;ILandroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V

    return-void
.end method

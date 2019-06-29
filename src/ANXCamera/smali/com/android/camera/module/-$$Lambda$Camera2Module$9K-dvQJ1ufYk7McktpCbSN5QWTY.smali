.class public final synthetic Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/android/camera/fragment/GoogleLensFragment$OnClickListener;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/Camera2Module;

.field private final synthetic f$1:F

.field private final synthetic f$2:F

.field private final synthetic f$3:I

.field private final synthetic f$4:I


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;FFII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$0:Lcom/android/camera/module/Camera2Module;

    iput p2, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$1:F

    iput p3, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$2:F

    iput p4, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$3:I

    iput p5, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$4:I

    return-void
.end method


# virtual methods
.method public final onOptionClick(I)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$0:Lcom/android/camera/module/Camera2Module;

    iget v1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$1:F

    iget v2, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$2:F

    iget v3, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$3:I

    iget v4, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$9K-dvQJ1ufYk7McktpCbSN5QWTY;->f$4:I

    move v5, p1

    invoke-static/range {v0 .. v5}, Lcom/android/camera/module/Camera2Module;->lambda$onLongPress$5(Lcom/android/camera/module/Camera2Module;FFIII)V

    return-void
.end method

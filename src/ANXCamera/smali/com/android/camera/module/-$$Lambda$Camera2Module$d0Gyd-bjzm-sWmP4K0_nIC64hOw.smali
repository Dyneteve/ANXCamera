.class public final synthetic Lcom/android/camera/module/-$$Lambda$Camera2Module$d0Gyd-bjzm-sWmP4K0_nIC64hOw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/Camera2Module;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$d0Gyd-bjzm-sWmP4K0_nIC64hOw;->f$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean p2, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$d0Gyd-bjzm-sWmP4K0_nIC64hOw;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$d0Gyd-bjzm-sWmP4K0_nIC64hOw;->f$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$d0Gyd-bjzm-sWmP4K0_nIC64hOw;->f$1:Z

    invoke-static {v0, v1}, Lcom/android/camera/module/Camera2Module;->lambda$updateManualEvAdjust$9(Lcom/android/camera/module/Camera2Module;Z)V

    return-void
.end method

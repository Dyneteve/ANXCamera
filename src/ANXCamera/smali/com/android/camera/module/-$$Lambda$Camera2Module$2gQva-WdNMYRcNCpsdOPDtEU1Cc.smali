.class public final synthetic Lcom/android/camera/module/-$$Lambda$Camera2Module$2gQva-WdNMYRcNCpsdOPDtEU1Cc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$2gQva-WdNMYRcNCpsdOPDtEU1Cc;->f$0:Lcom/android/camera/module/Camera2Module;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$Camera2Module$2gQva-WdNMYRcNCpsdOPDtEU1Cc;->f$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->lambda$updateManualEvAdjust$10(Lcom/android/camera/module/Camera2Module;)V

    return-void
.end method

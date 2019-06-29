.class public final synthetic Lcom/android/camera/module/-$$Lambda$oOvsnMVgkAj6Z-9eQJtbx5l97Hw;
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

    iput-object p1, p0, Lcom/android/camera/module/-$$Lambda$oOvsnMVgkAj6Z-9eQJtbx5l97Hw;->f$0:Lcom/android/camera/module/Camera2Module;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/-$$Lambda$oOvsnMVgkAj6Z-9eQJtbx5l97Hw;->f$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->restartModule()V

    return-void
.end method

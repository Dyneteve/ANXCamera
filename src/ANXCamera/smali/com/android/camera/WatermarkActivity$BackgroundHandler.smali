.class final Lcom/android/camera/WatermarkActivity$BackgroundHandler;
.super Landroid/os/Handler;
.source "WatermarkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/WatermarkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BackgroundHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/WatermarkActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/WatermarkActivity;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/WatermarkActivity$BackgroundHandler;->this$0:Lcom/android/camera/WatermarkActivity;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/WatermarkActivity$BackgroundHandler;->this$0:Lcom/android/camera/WatermarkActivity;

    invoke-static {v0, p1}, Lcom/android/camera/WatermarkActivity;->access$700(Lcom/android/camera/WatermarkActivity;Landroid/os/Message;)V

    return-void
.end method

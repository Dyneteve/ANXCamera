.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;
.super Landroid/os/Handler;
.source "MimojiAvatarEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    iget p1, p1, Landroid/os/Message;->what:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    goto :goto_0

    :pswitch_2
    goto :goto_0

    :pswitch_3
    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

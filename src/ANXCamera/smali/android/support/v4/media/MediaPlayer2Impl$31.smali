.class Landroid/support/v4/media/MediaPlayer2Impl$31;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl;->setUpListeners(Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaPlayer2Impl;

.field final synthetic val$src:Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$31;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$31;->val$src:Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 0

    const/4 p3, 0x3

    if-eq p2, p3, :cond_0

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$31;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-static {p2}, Landroid/support/v4/media/MediaPlayer2Impl;->access$100(Landroid/support/v4/media/MediaPlayer2Impl;)Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p2, p1, p3}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V

    goto :goto_0

    :pswitch_1
    iget-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$31;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-static {p2}, Landroid/support/v4/media/MediaPlayer2Impl;->access$100(Landroid/support/v4/media/MediaPlayer2Impl;)Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object p2

    const/4 p3, 0x2

    invoke-virtual {p2, p1, p3}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setBufferingState(Landroid/media/MediaPlayer;I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$31;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    new-instance p2, Landroid/support/v4/media/MediaPlayer2Impl$31$1;

    invoke-direct {p2, p0}, Landroid/support/v4/media/MediaPlayer2Impl$31$1;-><init>(Landroid/support/v4/media/MediaPlayer2Impl$31;)V

    invoke-static {p1, p2}, Landroid/support/v4/media/MediaPlayer2Impl;->access$300(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    nop

    :goto_0
    const/4 p1, 0x0

    return p1

    :pswitch_data_0
    .packed-switch 0x2bd
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

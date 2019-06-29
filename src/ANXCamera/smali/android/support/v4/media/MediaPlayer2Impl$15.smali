.class Landroid/support/v4/media/MediaPlayer2Impl$15;
.super Landroid/support/v4/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl;->setPlaybackParams(Landroid/support/v4/media/PlaybackParams2;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaPlayer2Impl;

.field final synthetic val$params:Landroid/support/v4/media/PlaybackParams2;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl;IZLandroid/support/v4/media/PlaybackParams2;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$15;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iput-object p4, p0, Landroid/support/v4/media/MediaPlayer2Impl$15;->val$params:Landroid/support/v4/media/PlaybackParams2;

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/media/MediaPlayer2Impl$Task;-><init>(Landroid/support/v4/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$15;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iget-object v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$15;->val$params:Landroid/support/v4/media/PlaybackParams2;

    invoke-virtual {v1}, Landroid/support/v4/media/PlaybackParams2;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/media/MediaPlayer2Impl;->access$400(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/media/PlaybackParams;)V

    return-void
.end method

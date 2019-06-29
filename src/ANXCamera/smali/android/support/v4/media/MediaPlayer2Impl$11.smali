.class Landroid/support/v4/media/MediaPlayer2Impl$11;
.super Landroid/support/v4/media/MediaPlayer2Impl$Task;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl;->setPlayerVolume(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaPlayer2Impl;

.field final synthetic val$volume:F


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl;IZF)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$11;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iput p4, p0, Landroid/support/v4/media/MediaPlayer2Impl$11;->val$volume:F

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/media/MediaPlayer2Impl$Task;-><init>(Landroid/support/v4/media/MediaPlayer2Impl;IZ)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$11;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroid/support/v4/media/MediaPlayer2Impl;->access$100(Landroid/support/v4/media/MediaPlayer2Impl;)Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$11;->val$volume:F

    invoke-virtual {v0, v1}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->setVolume(F)V

    return-void
.end method

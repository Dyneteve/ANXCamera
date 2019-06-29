.class Landroid/support/v4/media/MediaPlayer2Impl$36;
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

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$36;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$36;->val$src:Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 1

    iget-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$36;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    new-instance v0, Landroid/support/v4/media/MediaPlayer2Impl$36$1;

    invoke-direct {v0, p0, p2, p3}, Landroid/support/v4/media/MediaPlayer2Impl$36$1;-><init>(Landroid/support/v4/media/MediaPlayer2Impl$36;II)V

    invoke-static {p1, v0}, Landroid/support/v4/media/MediaPlayer2Impl;->access$300(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/MediaPlayer2Impl$Mp2EventNotifier;)V

    const/4 p1, 0x1

    return p1
.end method

.class Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaPlayerSource"
.end annotation


# instance fields
.field final mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

.field mBufferingState:I

.field volatile mDSD:Landroid/support/v4/media/DataSourceDesc;

.field mMp2State:I

.field mPlayPending:Z

.field final mPlayer:Landroid/media/MediaPlayer;

.field mPlayerState:I

.field mSourceState:I

.field final synthetic this$0:Landroid/support/v4/media/MediaPlayer2Impl;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/DataSourceDesc;)V
    .locals 2

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayer:Landroid/media/MediaPlayer;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferedPercentage:Ljava/util/concurrent/atomic/AtomicInteger;

    iput v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mSourceState:I

    const/16 v0, 0x3e9

    iput v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mMp2State:I

    iput v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mBufferingState:I

    iput v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mPlayerState:I

    iput-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mDSD:Landroid/support/v4/media/DataSourceDesc;

    invoke-static {p1, p0}, Landroid/support/v4/media/MediaPlayer2Impl;->access$2000(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;)V

    return-void
.end method


# virtual methods
.method getDSD()Landroid/support/v4/media/DataSourceDesc;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->mDSD:Landroid/support/v4/media/DataSourceDesc;

    return-object v0
.end method

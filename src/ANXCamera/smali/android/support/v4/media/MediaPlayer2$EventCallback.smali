.class public abstract Landroid/support/v4/media/MediaPlayer2$EventCallback;
.super Ljava/lang/Object;
.source "MediaPlayer2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaPlayer2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "EventCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallCompleted(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;II)V
    .locals 0

    return-void
.end method

.method public onCommandLabelReached(Landroid/support/v4/media/MediaPlayer2;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onError(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;II)V
    .locals 0

    return-void
.end method

.method public onInfo(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;II)V
    .locals 0

    return-void
.end method

.method public onMediaTimeDiscontinuity(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/MediaTimestamp2;)V
    .locals 0

    return-void
.end method

.method public onSubtitleData(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/SubtitleData2;)V
    .locals 0
    .param p3    # Landroid/support/v4/media/SubtitleData2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onTimedMetaDataAvailable(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;Landroid/media/TimedMetaData;)V
    .locals 0

    return-void
.end method

.method public onVideoSizeChanged(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;II)V
    .locals 0

    return-void
.end method

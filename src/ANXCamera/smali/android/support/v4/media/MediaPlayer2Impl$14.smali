.class final Landroid/support/v4/media/MediaPlayer2Impl$14;
.super Landroid/media/MediaDataSource;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl;->handleDataSource(Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field mDataSource:Landroid/support/v4/media/Media2DataSource;

.field final synthetic val$dsd:Landroid/support/v4/media/DataSourceDesc;


# direct methods
.method constructor <init>(Landroid/support/v4/media/DataSourceDesc;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    invoke-direct {p0}, Landroid/media/MediaDataSource;-><init>()V

    iget-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->val$dsd:Landroid/support/v4/media/DataSourceDesc;

    invoke-virtual {p1}, Landroid/support/v4/media/DataSourceDesc;->getMedia2DataSource()Landroid/support/v4/media/Media2DataSource;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->mDataSource:Landroid/support/v4/media/Media2DataSource;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->mDataSource:Landroid/support/v4/media/Media2DataSource;

    invoke-virtual {v0}, Landroid/support/v4/media/Media2DataSource;->close()V

    return-void
.end method

.method public getSize()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->mDataSource:Landroid/support/v4/media/Media2DataSource;

    invoke-virtual {v0}, Landroid/support/v4/media/Media2DataSource;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public readAt(J[BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$14;->mDataSource:Landroid/support/v4/media/Media2DataSource;

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/media/Media2DataSource;->readAt(J[BII)I

    move-result p1

    return p1
.end method

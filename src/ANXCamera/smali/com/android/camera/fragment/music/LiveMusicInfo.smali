.class public Lcom/android/camera/fragment/music/LiveMusicInfo;
.super Lcom/android/camera/network/resource/LiveResource;
.source "LiveMusicInfo.java"


# instance fields
.field public downloadState:I

.field public mAuthor:Ljava/lang/String;

.field public mDuration:Ljava/lang/String;

.field public mPlayUrl:Ljava/lang/String;

.field public mThumbnailUrl:Ljava/lang/String;

.field public mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/network/resource/LiveResource;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/music/LiveMusicInfo;->downloadState:I

    return-void
.end method

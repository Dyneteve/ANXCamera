.class Landroid/support/v4/media/MediaPlayer2Impl$DataSourceError;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaPlayer2Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataSourceError"
.end annotation


# instance fields
.field final mDSD:Landroid/support/v4/media/DataSourceDesc;

.field final mExtra:I

.field final mWhat:I


# direct methods
.method constructor <init>(Landroid/support/v4/media/DataSourceDesc;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$DataSourceError;->mDSD:Landroid/support/v4/media/DataSourceDesc;

    iput p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$DataSourceError;->mWhat:I

    iput p3, p0, Landroid/support/v4/media/MediaPlayer2Impl$DataSourceError;->mExtra:I

    return-void
.end method

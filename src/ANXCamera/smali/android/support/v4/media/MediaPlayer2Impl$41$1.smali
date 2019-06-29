.class Landroid/support/v4/media/MediaPlayer2Impl$41$1;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/support/v4/media/MediaPlayer2Impl$DrmEventNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl$41;->onDrmPrepared(Landroid/media/MediaPlayer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v4/media/MediaPlayer2Impl$41;

.field final synthetic val$status:I


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl$41;I)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$41$1;->this$1:Landroid/support/v4/media/MediaPlayer2Impl$41;

    iput p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$41$1;->val$status:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public notify(Landroid/support/v4/media/MediaPlayer2$DrmEventCallback;)V
    .locals 3

    invoke-static {}, Landroid/support/v4/media/MediaPlayer2Impl;->access$1900()Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$41$1;->val$status:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/util/ArrayMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$41$1;->this$1:Landroid/support/v4/media/MediaPlayer2Impl$41;

    iget-object v1, v1, Landroid/support/v4/media/MediaPlayer2Impl$41;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iget-object v2, p0, Landroid/support/v4/media/MediaPlayer2Impl$41$1;->this$1:Landroid/support/v4/media/MediaPlayer2Impl$41;

    iget-object v2, v2, Landroid/support/v4/media/MediaPlayer2Impl$41;->val$src:Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroid/support/v4/media/DataSourceDesc;

    move-result-object v2

    invoke-virtual {p1, v1, v2, v0}, Landroid/support/v4/media/MediaPlayer2$DrmEventCallback;->onDrmPrepared(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;I)V

    return-void
.end method

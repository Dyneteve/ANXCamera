.class Landroid/support/v4/media/MediaPlayer2Impl$22;
.super Ljava/lang/Object;
.source "MediaPlayer2Impl.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnDrmConfigHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaPlayer2Impl;->setOnDrmConfigHelper(Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaPlayer2Impl;

.field final synthetic val$listener:Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaPlayer2Impl;Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaPlayer2Impl$22;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    iput-object p2, p0, Landroid/support/v4/media/MediaPlayer2Impl$22;->val$listener:Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrmConfig(Landroid/media/MediaPlayer;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$22;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-static {v0}, Landroid/support/v4/media/MediaPlayer2Impl;->access$100(Landroid/support/v4/media/MediaPlayer2Impl;)Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSourceQueue;->getSourceForPlayer(Landroid/media/MediaPlayer;)Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaPlayer2Impl$MediaPlayerSource;->getDSD()Landroid/support/v4/media/DataSourceDesc;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Landroid/support/v4/media/MediaPlayer2Impl$22;->val$listener:Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;

    iget-object v1, p0, Landroid/support/v4/media/MediaPlayer2Impl$22;->this$0:Landroid/support/v4/media/MediaPlayer2Impl;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/MediaPlayer2$OnDrmConfigHelper;->onDrmConfig(Landroid/support/v4/media/MediaPlayer2;Landroid/support/v4/media/DataSourceDesc;)V

    return-void
.end method

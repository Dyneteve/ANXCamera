.class public abstract Landroid/support/v4/media/session/MediaControllerCompat$Callback;
.super Ljava/lang/Object;
.source "MediaControllerCompat.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaControllerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Callback"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;,
        Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubCompat;,
        Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubApi21;
    }
.end annotation


# instance fields
.field private final mCallbackObj:Ljava/lang/Object;

.field private mHandler:Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;

.field private mRegistered:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mRegistered:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_19

    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubApi21;

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubApi21;-><init>(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/support/v4/media/session/MediaControllerCompat$1;)V

    invoke-static {v0}, Landroid/support/v4/media/session/MediaControllerCompatApi21;->createCallback(Landroid/support/v4/media/session/MediaControllerCompatApi21$Callback;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mCallbackObj:Ljava/lang/Object;

    goto :goto_20

    :cond_19
    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubCompat;

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/session/MediaControllerCompat$Callback$StubCompat;-><init>(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/support/v4/media/session/MediaControllerCompat$1;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mCallbackObj:Ljava/lang/Object;

    :goto_20
    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mHandler:Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mRegistered:Z

    return v0
.end method

.method static synthetic access$302(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mRegistered:Z

    return p1
.end method

.method static synthetic access$400(Landroid/support/v4/media/session/MediaControllerCompat$Callback;)Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mCallbackObj:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Handler;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->setHandler(Landroid/os/Handler;)V

    return-void
.end method

.method private setHandler(Landroid/os/Handler;)V
    .registers 4

    new-instance v0, Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;

    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;-><init>(Landroid/support/v4/media/session/MediaControllerCompat$Callback;Landroid/os/Looper;)V

    iput-object v0, p0, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->mHandler:Landroid/support/v4/media/session/MediaControllerCompat$Callback$MessageHandler;

    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 1

    invoke-virtual {p0}, Landroid/support/v4/media/session/MediaControllerCompat$Callback;->onSessionDestroyed()V

    return-void
.end method

.method public onAudioInfoChanged(Landroid/support/v4/media/session/MediaControllerCompat$PlaybackInfo;)V
    .registers 2

    return-void
.end method

.method public onExtrasChanged(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public onMetadataChanged(Landroid/support/v4/media/MediaMetadataCompat;)V
    .registers 2

    return-void
.end method

.method public onPlaybackStateChanged(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .registers 2

    return-void
.end method

.method public onQueueChanged(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/session/MediaSessionCompat$QueueItem;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onQueueTitleChanged(Ljava/lang/CharSequence;)V
    .registers 2

    return-void
.end method

.method public onSessionDestroyed()V
    .registers 1

    return-void
.end method

.method public onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

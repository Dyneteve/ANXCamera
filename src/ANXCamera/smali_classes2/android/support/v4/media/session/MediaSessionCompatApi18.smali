.class public Landroid/support/v4/media/session/MediaSessionCompatApi18;
.super Ljava/lang/Object;
.source "MediaSessionCompatApi18.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaSessionCompatApi18$OnPlaybackPositionUpdateListener;
    }
.end annotation


# static fields
.field private static final ACTION_SEEK_TO:J = 0x100L


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createPlaybackPositionUpdateListener(Landroid/support/v4/media/session/MediaSessionCompatApi14$Callback;)Ljava/lang/Object;
    .registers 2

    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompatApi18$OnPlaybackPositionUpdateListener;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/MediaSessionCompatApi18$OnPlaybackPositionUpdateListener;-><init>(Landroid/support/v4/media/session/MediaSessionCompatApi14$Callback;)V

    return-object v0
.end method

.method static getRccTransportControlFlagsFromActions(J)I
    .registers 7

    invoke-static {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompatApi14;->getRccTransportControlFlagsFromActions(J)I

    move-result v0

    const-wide/16 v1, 0x100

    and-long/2addr v1, p0

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_f

    or-int/lit16 v0, v0, 0x100

    :cond_f
    return v0
.end method

.method public static registerMediaButtonEventReceiver(Landroid/content/Context;Landroid/app/PendingIntent;)V
    .registers 3

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->registerMediaButtonEventReceiver(Landroid/app/PendingIntent;)V

    return-void
.end method

.method public static setOnPlaybackPositionUpdateListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/media/RemoteControlClient;

    move-object v1, p1

    check-cast v1, Landroid/media/RemoteControlClient$OnPlaybackPositionUpdateListener;

    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient;->setPlaybackPositionUpdateListener(Landroid/media/RemoteControlClient$OnPlaybackPositionUpdateListener;)V

    return-void
.end method

.method public static setState(Ljava/lang/Object;IJFJ)V
    .registers 13

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const/4 v2, 0x3

    if-ne p1, v2, :cond_24

    const-wide/16 v2, 0x0

    cmp-long v4, p2, v2

    if-lez v4, :cond_24

    const-wide/16 v4, 0x0

    cmp-long v2, p5, v2

    if-lez v2, :cond_23

    sub-long v4, v0, p5

    const/4 v2, 0x0

    cmpl-float v2, p4, v2

    if-lez v2, :cond_23

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p4, v2

    if-eqz v2, :cond_23

    long-to-float v2, v4

    mul-float/2addr v2, p4

    float-to-long v4, v2

    :cond_23
    add-long/2addr p2, v4

    :cond_24
    invoke-static {p1}, Landroid/support/v4/media/session/MediaSessionCompatApi14;->getRccStateFromState(I)I

    move-result p1

    move-object v2, p0

    check-cast v2, Landroid/media/RemoteControlClient;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/media/RemoteControlClient;->setPlaybackState(IJF)V

    return-void
.end method

.method public static setTransportControlFlags(Ljava/lang/Object;J)V
    .registers 5

    move-object v0, p0

    check-cast v0, Landroid/media/RemoteControlClient;

    invoke-static {p1, p2}, Landroid/support/v4/media/session/MediaSessionCompatApi18;->getRccTransportControlFlagsFromActions(J)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient;->setTransportControlFlags(I)V

    return-void
.end method

.method public static unregisterMediaButtonEventReceiver(Landroid/content/Context;Landroid/app/PendingIntent;)V
    .registers 3

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->unregisterMediaButtonEventReceiver(Landroid/app/PendingIntent;)V

    return-void
.end method

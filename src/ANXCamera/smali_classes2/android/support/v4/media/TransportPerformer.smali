.class public abstract Landroid/support/v4/media/TransportPerformer;
.super Ljava/lang/Object;
.source "TransportPerformer.java"


# static fields
.field static final AUDIOFOCUS_GAIN:I = 0x1

.field static final AUDIOFOCUS_GAIN_TRANSIENT:I = 0x2

.field static final AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK:I = 0x3

.field static final AUDIOFOCUS_LOSS:I = -0x1

.field static final AUDIOFOCUS_LOSS_TRANSIENT:I = -0x2

.field static final AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK:I = -0x3


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .registers 14

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_5

    goto :goto_7

    :cond_5
    const/16 v0, 0x7f

    :goto_7
    if-eqz v0, :cond_25

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    new-instance v11, Landroid/view/KeyEvent;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v1, v11

    move-wide v2, v9

    move-wide v4, v9

    move v7, v0

    invoke-direct/range {v1 .. v8}, Landroid/view/KeyEvent;-><init>(JJIII)V

    invoke-virtual {p0, v0, v11}, Landroid/support/v4/media/TransportPerformer;->onMediaButtonDown(ILandroid/view/KeyEvent;)Z

    new-instance v11, Landroid/view/KeyEvent;

    const/4 v6, 0x1

    move-object v1, v11

    invoke-direct/range {v1 .. v8}, Landroid/view/KeyEvent;-><init>(JJIII)V

    invoke-virtual {p0, v0, v11}, Landroid/support/v4/media/TransportPerformer;->onMediaButtonUp(ILandroid/view/KeyEvent;)Z

    :cond_25
    return-void
.end method

.method public onGetBufferPercentage()I
    .registers 2

    const/16 v0, 0x64

    return v0
.end method

.method public abstract onGetCurrentPosition()J
.end method

.method public abstract onGetDuration()J
.end method

.method public onGetTransportControlFlags()I
    .registers 2

    const/16 v0, 0x3c

    return v0
.end method

.method public abstract onIsPlaying()Z
.end method

.method public onMediaButtonDown(ILandroid/view/KeyEvent;)Z
    .registers 5

    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_20

    goto :goto_1e

    :sswitch_5
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onPause()V

    return v0

    :sswitch_9
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStart()V

    return v0

    :sswitch_d
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStop()V

    return v0

    :sswitch_11
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onIsPlaying()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onPause()V

    goto :goto_1e

    :cond_1b
    invoke-virtual {p0}, Landroid/support/v4/media/TransportPerformer;->onStart()V

    :goto_1e
    return v0

    nop

    :sswitch_data_20
    .sparse-switch
        0x4f -> :sswitch_11
        0x55 -> :sswitch_11
        0x56 -> :sswitch_d
        0x7e -> :sswitch_9
        0x7f -> :sswitch_5
    .end sparse-switch
.end method

.method public onMediaButtonUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x1

    return v0
.end method

.method public abstract onPause()V
.end method

.method public abstract onSeekTo(J)V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStop()V
.end method

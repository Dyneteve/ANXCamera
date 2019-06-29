.class public abstract Landroid/support/v4/media/session/IMediaSession$Stub;
.super Landroid/os/Binder;
.source "IMediaSession.java"

# interfaces
.implements Landroid/support/v4/media/session/IMediaSession;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/IMediaSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/IMediaSession$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.support.v4.media.session.IMediaSession"

.field static final TRANSACTION_addQueueItem:I = 0x29

.field static final TRANSACTION_addQueueItemAt:I = 0x2a

.field static final TRANSACTION_adjustVolume:I = 0xb

.field static final TRANSACTION_fastForward:I = 0x16

.field static final TRANSACTION_getExtras:I = 0x1f

.field static final TRANSACTION_getFlags:I = 0x9

.field static final TRANSACTION_getLaunchPendingIntent:I = 0x8

.field static final TRANSACTION_getMetadata:I = 0x1b

.field static final TRANSACTION_getPackageName:I = 0x6

.field static final TRANSACTION_getPlaybackState:I = 0x1c

.field static final TRANSACTION_getQueue:I = 0x1d

.field static final TRANSACTION_getQueueTitle:I = 0x1e

.field static final TRANSACTION_getRatingType:I = 0x20

.field static final TRANSACTION_getRepeatMode:I = 0x25

.field static final TRANSACTION_getShuffleMode:I = 0x2f

.field static final TRANSACTION_getTag:I = 0x7

.field static final TRANSACTION_getVolumeAttributes:I = 0xa

.field static final TRANSACTION_isCaptioningEnabled:I = 0x2d

.field static final TRANSACTION_isShuffleModeEnabledRemoved:I = 0x26

.field static final TRANSACTION_isTransportControlEnabled:I = 0x5

.field static final TRANSACTION_next:I = 0x14

.field static final TRANSACTION_pause:I = 0x12

.field static final TRANSACTION_play:I = 0xd

.field static final TRANSACTION_playFromMediaId:I = 0xe

.field static final TRANSACTION_playFromSearch:I = 0xf

.field static final TRANSACTION_playFromUri:I = 0x10

.field static final TRANSACTION_prepare:I = 0x21

.field static final TRANSACTION_prepareFromMediaId:I = 0x22

.field static final TRANSACTION_prepareFromSearch:I = 0x23

.field static final TRANSACTION_prepareFromUri:I = 0x24

.field static final TRANSACTION_previous:I = 0x15

.field static final TRANSACTION_rate:I = 0x19

.field static final TRANSACTION_rateWithExtras:I = 0x33

.field static final TRANSACTION_registerCallbackListener:I = 0x3

.field static final TRANSACTION_removeQueueItem:I = 0x2b

.field static final TRANSACTION_removeQueueItemAt:I = 0x2c

.field static final TRANSACTION_rewind:I = 0x17

.field static final TRANSACTION_seekTo:I = 0x18

.field static final TRANSACTION_sendCommand:I = 0x1

.field static final TRANSACTION_sendCustomAction:I = 0x1a

.field static final TRANSACTION_sendMediaButton:I = 0x2

.field static final TRANSACTION_setCaptioningEnabled:I = 0x2e

.field static final TRANSACTION_setRepeatMode:I = 0x27

.field static final TRANSACTION_setShuffleMode:I = 0x30

.field static final TRANSACTION_setShuffleModeEnabledRemoved:I = 0x28

.field static final TRANSACTION_setVolumeTo:I = 0xc

.field static final TRANSACTION_skipToQueueItem:I = 0x11

.field static final TRANSACTION_stop:I = 0x13

.field static final TRANSACTION_unregisterCallbackListener:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p0, p0, v0}, Landroid/support/v4/media/session/IMediaSession$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaSession;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "android.support.v4.media.session.IMediaSession"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/media/session/IMediaSession;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v4/media/session/IMediaSession;

    return-object v0

    :cond_1
    new-instance v0, Landroid/support/v4/media/session/IMediaSession$Stub$Proxy;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/IMediaSession$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/16 v0, 0x33

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_19

    const v0, 0x5f4e5446

    if-eq p1, v0, :cond_18

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    :pswitch_0
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->setShuffleMode(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getShuffleMode()I

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_2
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    nop

    :goto_0
    invoke-virtual {p0, v0}, Landroid/support/v4/media/session/IMediaSession$Stub;->setCaptioningEnabled(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_3
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->isCaptioningEnabled()Z

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_4
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->removeQueueItemAt(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_5
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1

    sget-object p1, Landroid/support/v4/media/MediaDescriptionCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/support/v4/media/MediaDescriptionCompat;

    goto :goto_1

    :cond_1
    nop

    :goto_1
    invoke-virtual {p0, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->removeQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_6
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Landroid/support/v4/media/MediaDescriptionCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/support/v4/media/MediaDescriptionCompat;

    goto :goto_2

    :cond_2
    nop

    :goto_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->addQueueItemAt(Landroid/support/v4/media/MediaDescriptionCompat;I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_7
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_3

    sget-object p1, Landroid/support/v4/media/MediaDescriptionCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/support/v4/media/MediaDescriptionCompat;

    goto :goto_3

    :cond_3
    nop

    :goto_3
    invoke-virtual {p0, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->addQueueItem(Landroid/support/v4/media/MediaDescriptionCompat;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_8
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_4

    move v0, v2

    goto :goto_4

    :cond_4
    nop

    :goto_4
    invoke-virtual {p0, v0}, Landroid/support/v4/media/session/IMediaSession$Stub;->setShuffleModeEnabledRemoved(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_9
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->setRepeatMode(I)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_a
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->isShuffleModeEnabledRemoved()Z

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_b
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getRepeatMode()I

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_c
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    goto :goto_5

    :cond_5
    nop

    move-object p1, v1

    :goto_5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_6

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_6

    :cond_6
    nop

    :goto_6
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_d
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_7

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_7

    :cond_7
    nop

    :goto_7
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_e
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_8

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_8

    :cond_8
    nop

    :goto_8
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_f
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->prepare()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_10
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getRatingType()I

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_11
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_9

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p3, v2}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_9

    :cond_9
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_9
    return v2

    :pswitch_12
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getQueueTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_a

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-static {p1, p3, v2}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    goto :goto_a

    :cond_a
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_a
    return v2

    :pswitch_13
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getQueue()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return v2

    :pswitch_14
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getPlaybackState()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_b

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p3, v2}, Landroid/support/v4/media/session/PlaybackStateCompat;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_b

    :cond_b
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_b
    return v2

    :pswitch_15
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getMetadata()Landroid/support/v4/media/MediaMetadataCompat;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_c

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p3, v2}, Landroid/support/v4/media/MediaMetadataCompat;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_c

    :cond_c
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_c
    return v2

    :pswitch_16
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_d

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_d

    :cond_d
    nop

    :goto_d
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->sendCustomAction(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_17
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_e

    sget-object p1, Landroid/support/v4/media/RatingCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/support/v4/media/RatingCompat;

    goto :goto_e

    :cond_e
    nop

    :goto_e
    invoke-virtual {p0, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->rate(Landroid/support/v4/media/RatingCompat;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_18
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession$Stub;->seekTo(J)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_19
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->rewind()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1a
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->fastForward()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1b
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->previous()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1c
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->next()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1d
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->stop()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1e
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->pause()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_1f
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/media/session/IMediaSession$Stub;->skipToQueueItem(J)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_20
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_f

    sget-object p1, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    goto :goto_f

    :cond_f
    nop

    move-object p1, v1

    :goto_f
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_10

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_10

    :cond_10
    nop

    :goto_10
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_21
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_11

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_11

    :cond_11
    nop

    :goto_11
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_22
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_12

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_12

    :cond_12
    nop

    :goto_12
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_23
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->play()V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_24
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Landroid/support/v4/media/session/IMediaSession$Stub;->setVolumeTo(IILjava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_25
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p4, p2}, Landroid/support/v4/media/session/IMediaSession$Stub;->adjustVolume(IILjava/lang/String;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_26
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getVolumeAttributes()Landroid/support/v4/media/session/ParcelableVolumeInfo;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_13

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p3, v2}, Landroid/support/v4/media/session/ParcelableVolumeInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_13

    :cond_13
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_13
    return v2

    :pswitch_27
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getFlags()J

    move-result-wide p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1, p2}, Landroid/os/Parcel;->writeLong(J)V

    return v2

    :pswitch_28
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getLaunchPendingIntent()Landroid/app/PendingIntent;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    if-eqz p1, :cond_14

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, p3, v2}, Landroid/app/PendingIntent;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_14

    :cond_14
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_14
    return v2

    :pswitch_29
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getTag()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :pswitch_2a
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :pswitch_2b
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/media/session/IMediaSession$Stub;->isTransportControlEnabled()Z

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_2c
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->unregisterCallbackListener(Landroid/support/v4/media/session/IMediaControllerCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_2d
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/session/IMediaSession$Stub;->registerCallbackListener(Landroid/support/v4/media/session/IMediaControllerCallback;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_2e
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_15

    sget-object p1, Landroid/view/KeyEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/view/KeyEvent;

    goto :goto_15

    :cond_15
    nop

    :goto_15
    invoke-virtual {p0, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->sendMediaButton(Landroid/view/KeyEvent;)Z

    move-result p1

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v2

    :pswitch_2f
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_16

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/os/Bundle;

    goto :goto_16

    :cond_16
    nop

    move-object p4, v1

    :goto_16
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_17

    sget-object v0, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;

    goto :goto_17

    :cond_17
    nop

    :goto_17
    invoke-virtual {p0, p1, p4, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/support/v4/media/session/MediaSessionCompat$ResultReceiverWrapper;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :cond_18
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v2

    :cond_19
    const-string p1, "android.support.v4.media.session.IMediaSession"

    invoke-virtual {p2, p1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_1a

    sget-object p1, Landroid/support/v4/media/RatingCompat;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/RatingCompat;

    goto :goto_18

    :cond_1a
    nop

    move-object p1, v1

    :goto_18
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p4

    if-eqz p4, :cond_1b

    sget-object p4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p4, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Landroid/os/Bundle;

    goto :goto_19

    :cond_1b
    nop

    :goto_19
    invoke-virtual {p0, p1, v1}, Landroid/support/v4/media/session/IMediaSession$Stub;->rateWithExtras(Landroid/support/v4/media/RatingCompat;Landroid/os/Bundle;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

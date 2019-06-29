.class public abstract Landroid/support/v4/media/IMediaController2$Stub;
.super Landroid/os/Binder;
.source "IMediaController2.java"

# interfaces
.implements Landroid/support/v4/media/IMediaController2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/IMediaController2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/IMediaController2$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "android.support.v4.media.IMediaController2"

.field static final TRANSACTION_onAllowedCommandsChanged:I = 0x10

.field static final TRANSACTION_onBufferingStateChanged:I = 0x4

.field static final TRANSACTION_onChildrenChanged:I = 0x14

.field static final TRANSACTION_onConnected:I = 0xd

.field static final TRANSACTION_onCurrentMediaItemChanged:I = 0x1

.field static final TRANSACTION_onCustomCommand:I = 0x11

.field static final TRANSACTION_onCustomLayoutChanged:I = 0xf

.field static final TRANSACTION_onDisconnected:I = 0xe

.field static final TRANSACTION_onError:I = 0xb

.field static final TRANSACTION_onGetChildrenDone:I = 0x15

.field static final TRANSACTION_onGetItemDone:I = 0x13

.field static final TRANSACTION_onGetLibraryRootDone:I = 0x12

.field static final TRANSACTION_onGetSearchResultDone:I = 0x17

.field static final TRANSACTION_onPlaybackInfoChanged:I = 0x7

.field static final TRANSACTION_onPlaybackSpeedChanged:I = 0x3

.field static final TRANSACTION_onPlayerStateChanged:I = 0x2

.field static final TRANSACTION_onPlaylistChanged:I = 0x5

.field static final TRANSACTION_onPlaylistMetadataChanged:I = 0x6

.field static final TRANSACTION_onRepeatModeChanged:I = 0x8

.field static final TRANSACTION_onRoutesInfoChanged:I = 0xc

.field static final TRANSACTION_onSearchResultChanged:I = 0x16

.field static final TRANSACTION_onSeekCompleted:I = 0xa

.field static final TRANSACTION_onShuffleModeChanged:I = 0x9


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "android.support.v4.media.IMediaController2"

    invoke-virtual {p0, p0, v0}, Landroid/support/v4/media/IMediaController2$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/IMediaController2;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "android.support.v4.media.IMediaController2"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/media/IMediaController2;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v4/media/IMediaController2;

    return-object v0

    :cond_1
    new-instance v0, Landroid/support/v4/media/IMediaController2$Stub$Proxy;

    invoke-direct {v0, p0}, Landroid/support/v4/media/IMediaController2$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    const v3, 0x5f4e5446

    const/16 v17, 0x1

    if-eq v1, v3, :cond_15

    packed-switch v1, :pswitch_data_0

    invoke-super/range {p0 .. p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    return v0

    :pswitch_0
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    sget-object v6, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v6}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    if-eqz v7, :cond_0

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    move-object v7, v2

    goto :goto_0

    :cond_0
    nop

    const/4 v7, 0x0

    :goto_0
    move v2, v4

    move v3, v5

    move-object v4, v6

    move-object v5, v7

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2$Stub;->onGetSearchResultDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V

    return v17

    :pswitch_1
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_1

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_1

    :cond_1
    nop

    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v0, v1, v4, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return v17

    :pswitch_2
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    sget-object v6, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v6}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    if-eqz v7, :cond_2

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    move-object v7, v2

    goto :goto_2

    :cond_2
    nop

    const/4 v7, 0x0

    :goto_2
    move v2, v4

    move v3, v5

    move-object v4, v6

    move-object v5, v7

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2$Stub;->onGetChildrenDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V

    return v17

    :pswitch_3
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_3

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_3

    :cond_3
    nop

    const/4 v3, 0x0

    :goto_3
    invoke-virtual {v0, v1, v4, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return v17

    :pswitch_4
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_4

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_4

    :cond_4
    nop

    const/4 v3, 0x0

    :goto_4
    invoke-virtual {v0, v1, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onGetItemDone(Ljava/lang/String;Landroid/os/Bundle;)V

    return v17

    :pswitch_5
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    goto :goto_5

    :cond_5
    nop

    const/4 v1, 0x0

    :goto_5
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_6

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_6

    :cond_6
    nop

    const/4 v3, 0x0

    :goto_6
    invoke-virtual {v0, v1, v4, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onGetLibraryRootDone(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V

    return v17

    :pswitch_6
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_7

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    goto :goto_7

    :cond_7
    nop

    const/4 v1, 0x0

    :goto_7
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_8

    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    goto :goto_8

    :cond_8
    nop

    const/4 v4, 0x0

    :goto_8
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_9

    sget-object v3, Landroid/os/ResultReceiver;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/ResultReceiver;

    goto :goto_9

    :cond_9
    nop

    const/4 v3, 0x0

    :goto_9
    invoke-virtual {v0, v1, v4, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onCustomCommand(Landroid/os/Bundle;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    return v17

    :pswitch_7
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_a

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/os/Bundle;

    goto :goto_a

    :cond_a
    nop

    const/4 v3, 0x0

    :goto_a
    invoke-virtual {v0, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onAllowedCommandsChanged(Landroid/os/Bundle;)V

    return v17

    :pswitch_8
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/IMediaController2$Stub;->onCustomLayoutChanged(Ljava/util/List;)V

    return v17

    :pswitch_9
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/media/IMediaController2$Stub;->onDisconnected()V

    return v17

    :pswitch_a
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/media/IMediaSession2$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/IMediaSession2;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_b

    sget-object v4, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v4, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/Bundle;

    goto :goto_b

    :cond_b
    nop

    const/4 v4, 0x0

    :goto_b
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v6

    if-eqz v6, :cond_c

    sget-object v6, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v6, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Bundle;

    goto :goto_c

    :cond_c
    nop

    const/4 v6, 0x0

    :goto_c
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v7

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v9

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readFloat()F

    move-result v11

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v12

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v14

    if-eqz v14, :cond_d

    sget-object v14, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v14, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/os/Bundle;

    goto :goto_d

    :cond_d
    nop

    const/4 v14, 0x0

    :goto_d
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v15

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v16

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_e

    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/PendingIntent;

    move-object/from16 v18, v2

    goto :goto_e

    :cond_e
    nop

    const/16 v18, 0x0

    :goto_e
    move-object v2, v4

    move v3, v5

    move-object v4, v6

    move-wide v5, v7

    move-wide v7, v9

    move v9, v11

    move-wide v10, v12

    move-object v12, v14

    move v13, v15

    move/from16 v14, v16

    move-object/from16 v15, v19

    move-object/from16 v16, v18

    invoke-virtual/range {v0 .. v16}, Landroid/support/v4/media/IMediaController2$Stub;->onConnected(Landroid/support/v4/media/IMediaSession2;Landroid/os/Bundle;ILandroid/os/Bundle;JJFJLandroid/os/Bundle;IILjava/util/List;Landroid/app/PendingIntent;)V

    return v17

    :pswitch_b
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/IMediaController2$Stub;->onRoutesInfoChanged(Ljava/util/List;)V

    return v17

    :pswitch_c
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_f

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_f

    :cond_f
    nop

    const/4 v3, 0x0

    :goto_f
    invoke-virtual {v0, v1, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onError(ILandroid/os/Bundle;)V

    return v17

    :pswitch_d
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v7

    move-wide v1, v3

    move-wide v3, v5

    move-wide v5, v7

    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/media/IMediaController2$Stub;->onSeekCompleted(JJJ)V

    return v17

    :pswitch_e
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/IMediaController2$Stub;->onShuffleModeChanged(I)V

    return v17

    :pswitch_f
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/media/IMediaController2$Stub;->onRepeatModeChanged(I)V

    return v17

    :pswitch_10
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_10

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/os/Bundle;

    goto :goto_10

    :cond_10
    nop

    const/4 v3, 0x0

    :goto_10
    invoke-virtual {v0, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onPlaybackInfoChanged(Landroid/os/Bundle;)V

    return v17

    :pswitch_11
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_11

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/os/Bundle;

    goto :goto_11

    :cond_11
    nop

    const/4 v3, 0x0

    :goto_11
    invoke-virtual {v0, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onPlaylistMetadataChanged(Landroid/os/Bundle;)V

    return v17

    :pswitch_12
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_12

    sget-object v3, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Landroid/os/Bundle;

    goto :goto_12

    :cond_12
    nop

    const/4 v3, 0x0

    :goto_12
    invoke-virtual {v0, v1, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onPlaylistChanged(Ljava/util/List;Landroid/os/Bundle;)V

    return v17

    :pswitch_13
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_13

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/os/Bundle;

    goto :goto_13

    :cond_13
    nop

    const/4 v3, 0x0

    :goto_13
    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {v0, v3, v1, v4, v5}, Landroid/support/v4/media/IMediaController2$Stub;->onBufferingStateChanged(Landroid/os/Bundle;IJ)V

    return v17

    :pswitch_14
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readFloat()F

    move-result v7

    move-wide v1, v3

    move-wide v3, v5

    move v5, v7

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2$Stub;->onPlaybackSpeedChanged(JJF)V

    return v17

    :pswitch_15
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v5

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v7

    move-wide v1, v3

    move-wide v3, v5

    move v5, v7

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2$Stub;->onPlayerStateChanged(JJI)V

    return v17

    :pswitch_16
    const-string v1, "android.support.v4.media.IMediaController2"

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_14

    sget-object v1, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/os/Bundle;

    goto :goto_14

    :cond_14
    nop

    const/4 v3, 0x0

    :goto_14
    invoke-virtual {v0, v3}, Landroid/support/v4/media/IMediaController2$Stub;->onCurrentMediaItemChanged(Landroid/os/Bundle;)V

    return v17

    :cond_15
    const-string v0, "android.support.v4.media.IMediaController2"

    move-object/from16 v1, p3

    invoke-virtual {v1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v17

    :pswitch_data_0
    .packed-switch 0x1
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

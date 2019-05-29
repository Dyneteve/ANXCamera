.class public Lcom/ss/android/medialib/player/SimplePlayer;
.super Ljava/lang/Object;
.source "SimplePlayer.java"

# interfaces
.implements Lorg/a/a/b;


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field private mAudioPlayer:Lorg/a/a/a;

.field private mHandle:J

.field private mListener:Lcom/ss/android/medialib/player/Message$Listener;

.field private mSeekingCover:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    invoke-static {}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeRegister()I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeCreatePlayer()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mSeekingCover:Z

    return-void
.end method

.method public static native nativeRegister()I
.end method

.method private native nativeSetEffectConfig(JLcom/ss/android/medialib/player/EffectConfig;)V
.end method

.method private prepare(Ljava/lang/String;)I
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativePrepare(JLjava/lang/String;)I

    move-result p1

    return p1
.end method


# virtual methods
.method public configSeekCover(JIJ)I
    .locals 9

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mSeekingCover:Z

    iget-wide v2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    move-object v1, p0

    move-wide v4, p1

    move v6, p3

    move-wide v7, p4

    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeConfigSeekCover(JJIJ)I

    move-result p1

    return p1
.end method

.method public getDuration()J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeGetDuration(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeight()I
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeGetHeight(J)I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeGetWidth(J)I

    move-result v0

    return v0
.end method

.method public native nativeConfigSeekCover(JJIJ)I
.end method

.method public native nativeCreatePlayer()J
.end method

.method public native nativeGetDuration(J)J
.end method

.method public native nativeGetHeight(J)I
.end method

.method public native nativeGetWidth(J)I
.end method

.method public native nativeInitAudioPlayer(JJ)V
.end method

.method public native nativePause(J)I
.end method

.method public native nativePlayAudioSamples(J)[B
.end method

.method public native nativePlayCover(JI)V
.end method

.method public native nativePrepare(JLjava/lang/String;)I
.end method

.method public native nativePrepare(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method public native nativeRelease(J)V
.end method

.method public native nativeResume(J)I
.end method

.method public native nativeSeekCover(JJ)V
.end method

.method public native nativeSetFilter(JLjava/lang/String;)V
.end method

.method public native nativeSetLoop(JZ)V
.end method

.method public native nativeStart(JLandroid/view/Surface;II)I
.end method

.method public native nativeStop(J)V
.end method

.method public native nativeStopAudioPlayer(J)V
.end method

.method public onInfo(II)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mListener:Lcom/ss/android/medialib/player/Message$Listener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mListener:Lcom/ss/android/medialib/player/Message$Listener;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/medialib/player/Message$Listener;->onInfo(II)V

    :cond_0
    return-void
.end method

.method public pause()I
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {v0}, Lorg/a/a/a;->pause()V

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativePause(J)I

    move-result v0

    return v0
.end method

.method public playAudioSamples(J)[B
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/ss/android/medialib/player/SimplePlayer;->nativePlayAudioSamples(J)[B

    move-result-object p1

    return-object p1
.end method

.method public playCover(I)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativePlayCover(JI)V

    return-void
.end method

.method public prepare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeCreatePlayer()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/player/SimplePlayer;->nativePrepare(JLjava/lang/String;Ljava/lang/String;)I

    move-result p1

    iget-boolean p2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mSeekingCover:Z

    if-nez p2, :cond_1

    new-instance p2, Lorg/a/a/a;

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-direct {p2, v0, v1}, Lorg/a/a/a;-><init>(J)V

    iput-object p2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    :cond_1
    if-nez p1, :cond_2

    iget-object p2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {p2, p0}, Lorg/a/a/a;->a(Lorg/a/a/b;)Z

    move-result p2

    if-nez p2, :cond_2

    const/16 p1, -0x3e8

    return p1

    :cond_2
    return p1
.end method

.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {v0}, Lorg/a/a/a;->iM()V

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeRelease(J)V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    return-void
.end method

.method public resume()I
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {v0}, Lorg/a/a/a;->resume()V

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeResume(J)I

    move-result v0

    return v0
.end method

.method public seekCover(J)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeSeekCover(JJ)V

    return-void
.end method

.method public setAudioMinSize(JJ)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeInitAudioPlayer(JJ)V

    return-void
.end method

.method public setEffectConfig(Lcom/ss/android/medialib/player/EffectConfig;)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeSetEffectConfig(JLcom/ss/android/medialib/player/EffectConfig;)V

    return-void
.end method

.method public setFilter(Ljava/lang/String;)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeSetFilter(JLjava/lang/String;)V

    return-void
.end method

.method public setLoop(Z)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeSetLoop(JZ)V

    return-void
.end method

.method public setMessageListener(Lcom/ss/android/medialib/player/Message$Listener;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mListener:Lcom/ss/android/medialib/player/Message$Listener;

    return-void
.end method

.method public start(Landroid/view/Surface;II)I
    .locals 7

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {v0}, Lorg/a/a/a;->iN()V

    :cond_0
    iget-wide v2, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeStart(JLandroid/view/Surface;II)I

    move-result p1

    return p1
.end method

.method public stop()V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mAudioPlayer:Lorg/a/a/a;

    invoke-virtual {v0}, Lorg/a/a/a;->iO()V

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/player/SimplePlayer;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeStop(J)V

    return-void
.end method

.method public stopAudio(J)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/ss/android/medialib/player/SimplePlayer;->nativeStopAudioPlayer(J)V

    return-void
.end method

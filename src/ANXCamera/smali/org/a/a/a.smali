.class public Lorg/a/a/a;
.super Ljava/lang/Object;
.source "AudioPlayer.java"


# instance fields
.field private mHandle:J

.field private mStatus:I

.field private vZ:Landroid/media/AudioTrack;

.field private wa:J

.field private wb:Ljava/lang/Thread;

.field private wc:Lorg/a/a/b;


# direct methods
.method public constructor <init>(J)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/a/a/a;->wa:J

    iput-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    iput-object v0, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    const/4 v0, 0x0

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    iput-wide p1, p0, Lorg/a/a/a;->mHandle:J

    return-void
.end method

.method static synthetic a(Lorg/a/a/a;)Landroid/media/AudioTrack;
    .locals 0

    iget-object p0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    return-object p0
.end method

.method static synthetic b(Lorg/a/a/a;)I
    .locals 0

    iget p0, p0, Lorg/a/a/a;->mStatus:I

    return p0
.end method

.method static synthetic c(Lorg/a/a/a;)J
    .locals 2

    iget-wide v0, p0, Lorg/a/a/a;->mHandle:J

    return-wide v0
.end method

.method static synthetic d(Lorg/a/a/a;)Lorg/a/a/b;
    .locals 0

    iget-object p0, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    return-object p0
.end method

.method private iQ()V
    .locals 8

    invoke-direct {p0}, Lorg/a/a/a;->iR()V

    new-instance v7, Landroid/media/AudioTrack;

    iget-wide v0, p0, Lorg/a/a/a;->wa:J

    long-to-int v5, v0

    const/4 v1, 0x3

    const v2, 0xac44

    const/16 v3, 0xc

    const/4 v4, 0x2

    const/4 v6, 0x1

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v7, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    return-void
.end method

.method private iR()V
    .locals 2

    iget-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    iget-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    :cond_1
    return-void
.end method

.method private iS()I
    .locals 2

    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    if-nez v0, :cond_1

    const/4 v0, -0x2

    return v0

    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/a/a/a$1;

    invoke-direct {v1, p0}, Lorg/a/a/a$1;-><init>(Lorg/a/a/a;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    iget-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public a(Lorg/a/a/b;)Z
    .locals 6

    iput-object p1, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    const p1, 0xac44

    const/16 v0, 0xc

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result p1

    int-to-long v0, p1

    iput-wide v0, p0, Lorg/a/a/a;->wa:J

    iget-wide v0, p0, Lorg/a/a/a;->wa:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    const/4 v0, 0x0

    if-gtz p1, :cond_0

    return v0

    :cond_0
    invoke-direct {p0}, Lorg/a/a/a;->iQ()V

    iget-object p1, p0, Lorg/a/a/a;->vZ:Landroid/media/AudioTrack;

    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    move-result p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    return v0

    :cond_1
    iput v1, p0, Lorg/a/a/a;->mStatus:I

    iget-object p1, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    iget-wide v2, p0, Lorg/a/a/a;->mHandle:J

    const-wide/16 v4, 0x1000

    invoke-interface {p1, v2, v3, v4, v5}, Lorg/a/a/b;->setAudioMinSize(JJ)V

    :cond_2
    return v1
.end method

.method public iM()J
    .locals 2

    iget-wide v0, p0, Lorg/a/a/a;->mHandle:J

    return-wide v0
.end method

.method public iN()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    invoke-virtual {p0}, Lorg/a/a/a;->iP()V

    invoke-direct {p0}, Lorg/a/a/a;->iR()V

    return-void
.end method

.method public iO()V
    .locals 2

    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    invoke-direct {p0}, Lorg/a/a/a;->iS()I

    return-void
.end method

.method public iP()V
    .locals 3

    const/4 v0, 0x4

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    iget-object v0, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/a/a/a;->wc:Lorg/a/a/b;

    iget-wide v1, p0, Lorg/a/a/a;->mHandle:J

    invoke-interface {v0, v1, v2}, Lorg/a/a/b;->stopAudio(J)V

    :cond_0
    iget-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/a/a/a;->wb:Ljava/lang/Thread;

    return-void
.end method

.method public pause()V
    .locals 2

    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    return-void
.end method

.method public resume()V
    .locals 2

    iget v0, p0, Lorg/a/a/a;->mStatus:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Lorg/a/a/a;->mStatus:I

    return-void
.end method

.class public abstract Landroid/support/v4/media/subtitle/SubtitleTrack;
.super Ljava/lang/Object;
.source "SubtitleTrack.java"

# interfaces
.implements Landroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;,
        Landroid/support/v4/media/subtitle/SubtitleTrack$Run;,
        Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;,
        Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SubtitleTrack"


# instance fields
.field public DEBUG:Z

.field private final mActiveCues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;",
            ">;"
        }
    .end annotation
.end field

.field private mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

.field private mFormat:Landroid/media/MediaFormat;

.field protected mHandler:Landroid/os/Handler;

.field private mLastTimeMs:J

.field private mLastUpdateTimeMs:J

.field private mNextScheduledTimeMs:J

.field private mRunnable:Ljava/lang/Runnable;

.field private final mRunsByEndTime:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack$Run;",
            ">;"
        }
    .end annotation
.end field

.field private final mRunsByID:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack$Run;",
            ">;"
        }
    .end annotation
.end field

.field protected mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

.field protected mVisible:Z


# direct methods
.method public constructor <init>(Landroid/media/MediaFormat;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mFormat:Landroid/media/MediaFormat;

    new-instance p1, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    invoke-direct {p1}, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->clearActiveCues()V

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    return-void
.end method

.method static synthetic access$102(Landroid/support/v4/media/subtitle/SubtitleTrack;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$200(Landroid/support/v4/media/subtitle/SubtitleTrack;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    return-object p0
.end method

.method private removeRunsByEndTimeIndex(I)V
    .locals 5

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    :goto_0
    if-eqz v0, :cond_1

    iget-object v1, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mFirstCue:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    :goto_1
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v3, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    invoke-virtual {v3, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;->remove(Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;)V

    iget-object v3, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mNextInRun:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    iput-object v2, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mNextInRun:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    nop

    nop

    move-object v1, v3

    goto :goto_1

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    iget-wide v3, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mRunID:J

    invoke-virtual {v1, v3, v4}, Landroid/util/LongSparseArray;->remove(J)V

    iget-object v1, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mNextRunAtEndTimeMs:Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    iput-object v2, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mPrevRunAtEndTimeMs:Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    iput-object v2, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mNextRunAtEndTimeMs:Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    nop

    nop

    move-object v0, v1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1}, Landroid/util/LongSparseArray;->removeAt(I)V

    return-void
.end method

.method private declared-synchronized takeTime(J)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method protected declared-synchronized addCue(Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;)Z
    .locals 11

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;->add(Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;)V

    iget-wide v0, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mRunID:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    iget-wide v4, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mRunID:J

    invoke-virtual {v0, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;-><init>(Landroid/support/v4/media/subtitle/SubtitleTrack$1;)V

    iget-object v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    iget-wide v4, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mRunID:J

    invoke-virtual {v1, v4, v5, v0}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    iget-wide v4, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    iput-wide v4, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mEndTimeMs:J

    goto :goto_0

    :cond_0
    iget-wide v4, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mEndTimeMs:J

    iget-wide v6, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    cmp-long v1, v4, v6

    if-gez v1, :cond_1

    iget-wide v4, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    iput-wide v4, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mEndTimeMs:J

    :cond_1
    :goto_0
    iget-object v1, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mFirstCue:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    iput-object v1, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mNextInRun:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    iput-object p1, v0, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mFirstCue:Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    :cond_2
    const-wide/16 v0, -0x1

    iget-object v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_3

    :try_start_1
    iget-object v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {v4, v6, v5}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->getCurrentTimeUs(ZZ)J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    div-long/2addr v7, v9
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    nop

    move-wide v0, v7

    goto :goto_1

    :catch_0
    move-exception v4

    :cond_3
    :goto_1
    :try_start_2
    iget-boolean v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v4, :cond_4

    const-string v4, "SubtitleTrack"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mVisible="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v8, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mStartTimeMs:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, " <= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, " >= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-boolean v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    if-eqz v4, :cond_8

    iget-wide v7, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mStartTimeMs:J

    cmp-long v4, v7, v0

    if-gtz v4, :cond_8

    iget-wide v7, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    iget-wide v9, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    cmp-long v4, v7, v9

    if-ltz v4, :cond_8

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_5

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_5
    nop

    nop

    new-instance p1, Landroid/support/v4/media/subtitle/SubtitleTrack$1;

    invoke-direct {p1, p0, p0, v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack$1;-><init>(Landroid/support/v4/media/subtitle/SubtitleTrack;Landroid/support/v4/media/subtitle/SubtitleTrack;J)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunnable:Ljava/lang/Runnable;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xa

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz p1, :cond_7

    const-string p1, "SubtitleTrack"

    const-string v0, "scheduling update"

    invoke-static {p1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_6
    iget-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz p1, :cond_7

    const-string p1, "SubtitleTrack"

    const-string v0, "failed to schedule subtitle view update"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_7
    :goto_2
    monitor-exit p0

    return v5

    :cond_8
    :try_start_3
    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    if-eqz v0, :cond_a

    iget-wide v0, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    iget-wide v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    cmp-long v0, v0, v4

    if-ltz v0, :cond_a

    iget-wide v0, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mStartTimeMs:J

    iget-wide v4, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    cmp-long p1, v0, v4

    if-ltz p1, :cond_9

    iget-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_a

    :cond_9
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->scheduleTimedEvents()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_a
    monitor-exit p0

    return v6

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized clearActiveCues()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "SubtitleTrack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Clearing "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " active cues"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastUpdateTimeMs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->removeRunsByEndTimeIndex(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method protected finishedRun(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    if-eqz p1, :cond_0

    iget-object p2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->storeByEndTimeMs(Landroid/util/LongSparseArray;)V

    :cond_0
    return-void
.end method

.method public final getFormat()Landroid/media/MediaFormat;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mFormat:Landroid/media/MediaFormat;

    return-object v0
.end method

.method public abstract getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;
.end method

.method public getTrackType()I
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    return v0
.end method

.method public hide()V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {v0, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->cancelNotifications(Landroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V

    :cond_1
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;->setVisible(Z)V

    :cond_2
    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    return-void
.end method

.method public onData(Landroid/support/v4/media/SubtitleData2;)V
    .locals 6

    invoke-virtual {p1}, Landroid/support/v4/media/SubtitleData2;->getStartTimeUs()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {p1}, Landroid/support/v4/media/SubtitleData2;->getData()[B

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3, v0, v1}, Landroid/support/v4/media/subtitle/SubtitleTrack;->onData([BZJ)V

    nop

    invoke-virtual {p1}, Landroid/support/v4/media/SubtitleData2;->getStartTimeUs()J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/support/v4/media/SubtitleData2;->getDurationUs()J

    move-result-wide v4

    add-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/support/v4/media/subtitle/SubtitleTrack;->setRunDiscardTimeMs(JJ)V

    return-void
.end method

.method protected abstract onData([BZJ)V
.end method

.method public onSeek(J)V
    .locals 3

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "SubtitleTrack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSeek "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-enter p0

    const-wide/16 v0, 0x3e8

    :try_start_0
    div-long/2addr p1, v0

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;->updateActiveCues(ZJ)V

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;->takeTime(J)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleTrack;->updateView(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->scheduleTimedEvents()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onStop()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "SubtitleTrack"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->clearActiveCues()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Landroid/support/v4/media/subtitle/SubtitleTrack;->updateView(Ljava/util/ArrayList;)V

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {v2, v0, v1, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->notifyAt(JLandroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onTimedEvent(J)V
    .locals 3

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "SubtitleTrack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTimedEvent "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    monitor-enter p0

    const-wide/16 v0, 0x3e8

    :try_start_0
    div-long/2addr p1, v0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;->updateActiveCues(ZJ)V

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;->takeTime(J)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleTrack;->updateView(Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->scheduleTimedEvents()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected scheduleTimedEvents()V
    .locals 5

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    iget-wide v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;->nextTimeAfter(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "SubtitleTrack"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sched @"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " after "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastTimeMs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    iget-wide v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_1

    iget-wide v1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mNextScheduledTimeMs:J

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    goto :goto_0

    :cond_1
    const-wide/16 v1, -0x1

    :goto_0
    invoke-interface {v0, v1, v2, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->notifyAt(JLandroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V

    :cond_2
    return-void
.end method

.method public setRunDiscardTimeMs(JJ)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByID:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;

    if-eqz p1, :cond_0

    iput-wide p3, p1, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->mEndTimeMs:J

    iget-object p2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack$Run;->storeByEndTimeMs(Landroid/util/LongSparseArray;)V

    :cond_0
    return-void
.end method

.method public declared-synchronized setTimeProvider(Landroid/support/v4/media/subtitle/MediaTimeProvider;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {v0, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->cancelNotifications(Landroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V

    :cond_1
    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {p1, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->scheduleUpdate(Landroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public show()V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mVisible:Z

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1, v0}, Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;->setVisible(Z)V

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mTimeProvider:Landroid/support/v4/media/subtitle/MediaTimeProvider;

    invoke-interface {v0, p0}, Landroid/support/v4/media/subtitle/MediaTimeProvider;->scheduleUpdate(Landroid/support/v4/media/subtitle/MediaTimeProvider$OnMediaTimeListener;)V

    :cond_2
    return-void
.end method

.method protected declared-synchronized updateActiveCues(ZJ)V
    .locals 6

    monitor-enter p0

    if-nez p1, :cond_0

    :try_start_0
    iget-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastUpdateTimeMs:J

    cmp-long p1, v0, p2

    if-lez p1, :cond_1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto/16 :goto_4

    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->clearActiveCues()V

    :cond_1
    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mCues:Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;

    iget-wide v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastUpdateTimeMs:J

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/support/v4/media/subtitle/SubtitleTrack$CueList;->entriesBetween(JJ)Ljava/lang/Iterable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;

    iget-wide v2, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mEndTimeMs:J

    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "SubtitleTrack"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Removing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-wide v0, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mRunID:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_3
    iget-wide v2, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mStartTimeMs:J

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-nez v0, :cond_6

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "SubtitleTrack"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Adding "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object v0, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mInnerTimesMs:[J

    if-eqz v0, :cond_5

    invoke-virtual {v1, p2, p3}, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->onTime(J)V

    :cond_5
    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mActiveCues:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    iget-object v0, v1, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->mInnerTimesMs:[J

    if-eqz v0, :cond_7

    invoke-virtual {v1, p2, p3}, Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;->onTime(J)V

    :cond_7
    :goto_2
    goto/16 :goto_1

    :cond_8
    :goto_3
    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Landroid/util/LongSparseArray;->size()I

    move-result p1

    if-lez p1, :cond_9

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mRunsByEndTime:Landroid/util/LongSparseArray;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v1

    cmp-long p1, v1, p2

    if-gtz p1, :cond_9

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/SubtitleTrack;->removeRunsByEndTimeIndex(I)V

    goto :goto_3

    :cond_9
    iput-wide p2, p0, Landroid/support/v4/media/subtitle/SubtitleTrack;->mLastUpdateTimeMs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :goto_4
    monitor-exit p0

    throw p1
.end method

.method public abstract updateView(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;",
            ">;)V"
        }
    .end annotation
.end method

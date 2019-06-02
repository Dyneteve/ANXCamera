.class final Lokhttp3/internal/http2/Ping;
.super Ljava/lang/Object;
.source "Ping.java"


# instance fields
.field private final latch:Ljava/util/concurrent/CountDownLatch;

.field private received:J

.field private sent:J


# direct methods
.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lokhttp3/internal/http2/Ping;->latch:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    iput-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    return-void
.end method


# virtual methods
.method cancel()V
    .locals 4

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    iget-object v0, p0, Lokhttp3/internal/http2/Ping;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method receive()V
    .locals 4

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    iget-object v0, p0, Lokhttp3/internal/http2/Ping;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public roundTripTime()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lokhttp3/internal/http2/Ping;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->received:J

    iget-wide v2, p0, Lokhttp3/internal/http2/Ping;->sent:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public roundTripTime(JLjava/util/concurrent/TimeUnit;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lokhttp3/internal/http2/Ping;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-wide p1, p0, Lokhttp3/internal/http2/Ping;->received:J

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    sub-long/2addr p1, v0

    return-wide p1

    :cond_0
    const-wide/16 p1, -0x2

    return-wide p1
.end method

.method send()V
    .locals 4

    iget-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lokhttp3/internal/http2/Ping;->sent:J

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

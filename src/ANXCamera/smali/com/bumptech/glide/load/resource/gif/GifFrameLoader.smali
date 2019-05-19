.class Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;
.super Ljava/lang/Object;
.source "GifFrameLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;,
        Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;,
        Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;,
        Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;
    }
.end annotation


# instance fields
.field final aH:Lcom/bumptech/glide/i;

.field private final ak:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;",
            ">;"
        }
    .end annotation
.end field

.field private gV:Lcom/bumptech/glide/load/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private isRunning:Z

.field private final mq:Lcom/bumptech/glide/b/a;

.field private mr:Z

.field private ms:Z

.field private mt:Lcom/bumptech/glide/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

.field private mv:Z

.field private mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

.field private mx:Landroid/graphics/Bitmap;

.field private my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

.field private mz:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/b/a;IILcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/c;",
            "Lcom/bumptech/glide/b/a;",
            "II",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    nop

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->k()Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    move-result-object v1

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object v2

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object p1

    invoke-static {p1, p3, p4}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->a(Lcom/bumptech/glide/i;II)Lcom/bumptech/glide/h;

    move-result-object v5

    const/4 v4, 0x0

    move-object v0, p0

    move-object v3, p2

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/i;Lcom/bumptech/glide/b/a;Landroid/os/Handler;Lcom/bumptech/glide/h;Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/i;Lcom/bumptech/glide/b/a;Landroid/os/Handler;Lcom/bumptech/glide/h;Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/d;",
            "Lcom/bumptech/glide/i;",
            "Lcom/bumptech/glide/b/a;",
            "Landroid/os/Handler;",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    iput-object p2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->aH:Lcom/bumptech/glide/i;

    if-nez p4, :cond_0

    new-instance p4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    new-instance v0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$b;-><init>(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;)V

    invoke-direct {p4, p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->ak:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iput-object p4, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->handler:Landroid/os/Handler;

    iput-object p5, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mt:Lcom/bumptech/glide/h;

    iput-object p3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-virtual {p0, p6, p7}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->a(Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private static a(Lcom/bumptech/glide/i;II)Lcom/bumptech/glide/h;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/i;",
            "II)",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    nop

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->H()Lcom/bumptech/glide/h;

    move-result-object p0

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->fT:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->o(II)Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p0

    return-object p0
.end method

.method private cQ()V
    .locals 5

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mr:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->ms:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    const/4 v2, 0x0

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    const-string v3, "Pending target must be null when starting from the first frame"

    invoke-static {v0, v3}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->W()V

    iput-boolean v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->ms:Z

    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->onFrameReady(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;)V

    return-void

    :cond_3
    iput-boolean v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mr:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->U()I

    move-result v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    int-to-long v3, v0

    add-long/2addr v1, v3

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->advance()V

    new-instance v0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    iget-object v3, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->handler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v4}, Lcom/bumptech/glide/b/a;->V()I

    move-result v4

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;-><init>(Landroid/os/Handler;IJ)V

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mt:Lcom/bumptech/glide/h;

    invoke-static {}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cT()Lcom/bumptech/glide/load/c;

    move-result-object v1

    invoke-static {v1}, Lcom/bumptech/glide/request/f;->j(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->g(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;

    return-void

    :cond_4
    :goto_1
    return-void
.end method

.method private cR()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->ak:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    invoke-interface {v0, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->d(Landroid/graphics/Bitmap;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method

.method private static cT()Lcom/bumptech/glide/load/c;
    .locals 3

    new-instance v0, Lcom/bumptech/glide/e/d;

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/bumptech/glide/e/d;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method private getFrameSize()I
    .locals 3

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cP()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cP()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cP()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/util/k;->i(IILandroid/graphics/Bitmap$Config;)I

    move-result v0

    return v0
.end method

.method private start()V
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mv:Z

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cQ()V

    return-void
.end method

.method private stop()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/i;Landroid/graphics/Bitmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/i;

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->gV:Lcom/bumptech/glide/load/i;

    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    iget-object p2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mt:Lcom/bumptech/glide/h;

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mt:Lcom/bumptech/glide/h;

    return-void
.end method

.method a(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;)V
    .locals 2

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mv:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->start()V

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot subscribe twice in a row"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot subscribe to a cleared frame loader"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method b(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;)V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->stop()V

    :cond_0
    return-void
.end method

.method cG()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method cH()Lcom/bumptech/glide/load/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->gV:Lcom/bumptech/glide/load/i;

    return-object v0
.end method

.method cP()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->cU()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mx:Landroid/graphics/Bitmap;

    :goto_0
    return-object v0
.end method

.method cS()V
    .locals 3

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Can\'t restart a running animation"

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iput-boolean v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->ms:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->aH:Lcom/bumptech/glide/i;

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    :cond_0
    return-void
.end method

.method clear()V
    .locals 3

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cR()V

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->stop()V

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->aH:Lcom/bumptech/glide/i;

    iget-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    iput-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->aH:Lcom/bumptech/glide/i;

    iget-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    iput-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mw:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->aH:Lcom/bumptech/glide/i;

    iget-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    iput-object v1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->clear()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mv:Z

    return-void
.end method

.method getBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->getData()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method getCurrentIndex()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    iget v0, v0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->index:I

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method getFrameCount()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->getFrameCount()I

    move-result v0

    return v0
.end method

.method getHeight()I
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cP()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    return v0
.end method

.method getLoopCount()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->Y()I

    move-result v0

    return v0
.end method

.method getSize()I
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mq:Lcom/bumptech/glide/b/a;

    invoke-interface {v0}, Lcom/bumptech/glide/b/a;->Z()I

    move-result v0

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->getFrameSize()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method getWidth()I
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cP()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    return v0
.end method

.method onFrameReady(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;)V
    .locals 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mz:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mz:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;

    invoke-interface {v0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;->cO()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mr:Z

    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mv:Z

    const/4 v1, 0x2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->isRunning:Z

    if-nez v0, :cond_2

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->my:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;->cU()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cR()V

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mu:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget;

    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :goto_0
    if-ltz p1, :cond_3

    iget-object v2, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->callbacks:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;

    invoke-interface {v2}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$a;->cO()V

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_3
    if-eqz v0, :cond_4

    iget-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_4
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->cQ()V

    return-void
.end method

.method setOnEveryFrameReadyListener(Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/GifFrameLoader;->mz:Lcom/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener;

    return-void
.end method

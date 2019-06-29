.class Lcom/bumptech/glide/load/engine/DecodeJob;
.super Ljava/lang/Object;
.source "DecodeJob.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/d$a;
.implements Lcom/bumptech/glide/util/a/a$c;
.implements Ljava/lang/Comparable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/DecodeJob$Stage;,
        Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;,
        Lcom/bumptech/glide/load/engine/DecodeJob$d;,
        Lcom/bumptech/glide/load/engine/DecodeJob$a;,
        Lcom/bumptech/glide/load/engine/DecodeJob$c;,
        Lcom/bumptech/glide/load/engine/DecodeJob$e;,
        Lcom/bumptech/glide/load/engine/DecodeJob$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/d$a;",
        "Lcom/bumptech/glide/util/a/a$c;",
        "Ljava/lang/Comparable<",
        "Lcom/bumptech/glide/load/engine/DecodeJob<",
        "*>;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DecodeJob"


# instance fields
.field private bp:Lcom/bumptech/glide/e;

.field private cy:Ljava/lang/Object;

.field private fP:Lcom/bumptech/glide/load/c;

.field private fR:Lcom/bumptech/glide/load/f;

.field private final fU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

.field private fY:Lcom/bumptech/glide/Priority;

.field private fZ:Lcom/bumptech/glide/load/engine/g;

.field private volatile fc:Z

.field private final gc:Lcom/bumptech/glide/load/engine/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/e<",
            "TR;>;"
        }
    .end annotation
.end field

.field private final gd:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final ge:Lcom/bumptech/glide/util/a/c;

.field private final gf:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob$c<",
            "*>;"
        }
    .end annotation
.end field

.field private final gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

.field private gi:Lcom/bumptech/glide/load/engine/i;

.field private gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob$a<",
            "TR;>;"
        }
    .end annotation
.end field

.field private gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

.field private gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

.field private gm:J

.field private gn:Z

.field private go:Ljava/lang/Thread;

.field private gp:Lcom/bumptech/glide/load/c;

.field private gq:Lcom/bumptech/glide/load/c;

.field private gr:Ljava/lang/Object;

.field private gs:Lcom/bumptech/glide/load/DataSource;

.field private gt:Lcom/bumptech/glide/load/a/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/a/d<",
            "*>;"
        }
    .end annotation
.end field

.field private volatile gu:Lcom/bumptech/glide/load/engine/d;

.field private volatile gv:Z

.field private height:I

.field private order:I

.field private width:I


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/DecodeJob$d;Landroid/support/v4/util/Pools$Pool;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob$d;",
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/load/engine/e;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/e;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-static {}, Lcom/bumptech/glide/util/a/c;->fu()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->ge:Lcom/bumptech/glide/util/a/c;

    new-instance v0, Lcom/bumptech/glide/load/engine/DecodeJob$c;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$c;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    new-instance v0, Lcom/bumptech/glide/load/engine/DecodeJob$e;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$e;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gf:Landroid/support/v4/util/Pools$Pool;

    return-void
.end method

.method private a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    .locals 3

    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->gx:[I

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized stage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fZ:Lcom/bumptech/glide/load/engine/g;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/g;->bv()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gK:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gK:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object p1

    :goto_0
    return-object p1

    :pswitch_1
    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gO:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    return-object p1

    :pswitch_2
    iget-boolean p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gn:Z

    if-eqz p1, :cond_1

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gO:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    goto :goto_1

    :cond_1
    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gM:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    :goto_1
    return-object p1

    :pswitch_3
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fZ:Lcom/bumptech/glide/load/engine/g;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/g;->bw()Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gL:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    goto :goto_2

    :cond_2
    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gL:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object p1

    :goto_2
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private a(Lcom/bumptech/glide/load/a/d;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/p;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/a/d<",
            "*>;TData;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p2, 0x0

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    return-object p2

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/bumptech/glide/util/e;->fm()J

    move-result-wide v0

    invoke-direct {p0, p2, p3}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p2

    const-string p3, "DecodeJob"

    const/4 v2, 0x2

    invoke-static {p3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p3

    if-eqz p3, :cond_1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Decoded result "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p3, v0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->b(Ljava/lang/String;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    nop

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    return-object p2

    :catchall_0
    move-exception p2

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    throw p2
.end method

.method private a(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/p;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(TData;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/e;->e(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/n;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/engine/n;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    return-object p1
.end method

.method private a(Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/engine/n;)Lcom/bumptech/glide/load/engine/p;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            "ResourceType:",
            "Ljava/lang/Object;",
            ">(TData;",
            "Lcom/bumptech/glide/load/DataSource;",
            "Lcom/bumptech/glide/load/engine/n<",
            "TData;TResourceType;TR;>;)",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/load/engine/GlideException;
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/f;

    move-result-object v2

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->bp:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->R()Lcom/bumptech/glide/Registry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/Registry;->h(Ljava/lang/Object;)Lcom/bumptech/glide/load/a/e;

    move-result-object p1

    :try_start_0
    iget v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    new-instance v5, Lcom/bumptech/glide/load/engine/DecodeJob$b;

    invoke-direct {v5, p0, p2}, Lcom/bumptech/glide/load/engine/DecodeJob$b;-><init>(Lcom/bumptech/glide/load/engine/DecodeJob;Lcom/bumptech/glide/load/DataSource;)V

    move-object v0, p3

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/n;->a(Lcom/bumptech/glide/load/a/e;Lcom/bumptech/glide/load/f;IILcom/bumptech/glide/load/engine/f$a;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/e;->cleanup()V

    return-object p2

    :catchall_0
    move-exception p2

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/e;->cleanup()V

    throw p2
.end method

.method private a(Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/f;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    return-object v0

    :cond_0
    sget-object v1, Lcom/bumptech/glide/load/resource/bitmap/n;->mq:Lcom/bumptech/glide/load/e;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    sget-object v1, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    if-eq p1, v1, :cond_2

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/e;->be()Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    new-instance v0, Lcom/bumptech/glide/load/f;

    invoke-direct {v0}, Lcom/bumptech/glide/load/f;-><init>()V

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/f;)V

    sget-object p1, Lcom/bumptech/glide/load/resource/bitmap/n;->mq:Lcom/bumptech/glide/load/e;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/load/f;

    :cond_3
    return-object v0
.end method

.method private a(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bo()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    invoke-interface {v0, p1, p2}, Lcom/bumptech/glide/load/engine/DecodeJob$a;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    return-void
.end method

.method private a(Ljava/lang/String;JLjava/lang/String;)V
    .locals 2

    const-string v0, "DecodeJob"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " in "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2, p3}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide p1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p1, ", load key: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gi:Lcom/bumptech/glide/load/engine/i;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, ", "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", thread: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private b(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    instance-of v0, p1, Lcom/bumptech/glide/load/engine/l;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/bumptech/glide/load/engine/l;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/l;->initialize()V

    :cond_0
    nop

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/DecodeJob$c;->br()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lcom/bumptech/glide/load/engine/o;->f(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/o;

    move-result-object p1

    nop

    move-object v0, p1

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gN:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    :try_start_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/DecodeJob$c;->br()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {p1, p2, v1}, Lcom/bumptech/glide/load/engine/DecodeJob$c;->a(Lcom/bumptech/glide/load/engine/DecodeJob$d;Lcom/bumptech/glide/load/f;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/o;->unlock()V

    :cond_3
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bi()V

    return-void

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/o;->unlock()V

    :cond_4
    throw p1
.end method

.method private b(Ljava/lang/String;J)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method private bi()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$e;->bt()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bk()V

    :cond_0
    return-void
.end method

.method private bj()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$e;->bu()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bk()V

    :cond_0
    return-void
.end method

.method private bk()V
    .locals 4

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$e;->reset()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$c;->clear()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/e;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gv:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->bp:Lcom/bumptech/glide/e;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fP:Lcom/bumptech/glide/load/c;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fY:Lcom/bumptech/glide/Priority;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gi:Lcom/bumptech/glide/load/engine/i;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->go:Ljava/lang/Thread;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gr:Ljava/lang/Object;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gs:Lcom/bumptech/glide/load/DataSource;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gt:Lcom/bumptech/glide/load/a/d;

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gm:J

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->cy:Ljava/lang/Object;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gf:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p0}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method

.method private bl()V
    .locals 3

    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->gw:[I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized run reason: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bp()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bn()V

    goto :goto_0

    :pswitch_2
    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gJ:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bm()Lcom/bumptech/glide/load/engine/d;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bn()V

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private bm()Lcom/bumptech/glide/load/engine/d;
    .locals 3

    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$1;->gx:[I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized stage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const/4 v0, 0x0

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/bumptech/glide/load/engine/t;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/t;-><init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/bumptech/glide/load/engine/a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/a;-><init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V

    return-object v0

    :pswitch_3
    new-instance v0, Lcom/bumptech/glide/load/engine/q;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/load/engine/q;-><init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private bn()V
    .locals 3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->go:Ljava/lang/Thread;

    invoke-static {}, Lcom/bumptech/glide/util/e;->fm()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gm:J

    nop

    const/4 v0, 0x0

    :cond_0
    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/d;->aS()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bm()Lcom/bumptech/glide/load/engine/d;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    sget-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gM:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->aV()V

    return-void

    :cond_1
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    sget-object v2, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gO:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    if-eq v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    if-eqz v1, :cond_3

    :cond_2
    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V

    :cond_3
    return-void
.end method

.method private bo()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->ge:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->fv()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gv:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gv:Z

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already notified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private bp()V
    .locals 5

    const-string v0, "DecodeJob"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Retrieved data"

    iget-wide v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gm:J

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "data: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gr:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ", cache key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ", fetcher: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gt:Lcom/bumptech/glide/load/a/d;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Ljava/lang/String;JLjava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gt:Lcom/bumptech/glide/load/a/d;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gr:Ljava/lang/Object;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gs:Lcom/bumptech/glide/load/DataSource;

    invoke-direct {p0, v1, v2, v3}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/a/d;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)Lcom/bumptech/glide/load/engine/p;

    move-result-object v1
    :try_end_0
    .catch Lcom/bumptech/glide/load/engine/GlideException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gq:Lcom/bumptech/glide/load/c;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gs:Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {v1, v2, v3}, Lcom/bumptech/glide/load/engine/GlideException;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/DataSource;)V

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gs:Lcom/bumptech/glide/load/DataSource;

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/load/engine/DecodeJob;->b(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bn()V

    :goto_1
    return-void
.end method

.method private getPriority()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fY:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0}, Lcom/bumptech/glide/Priority;->ordinal()I

    move-result v0

    return v0
.end method

.method private notifyFailed()V
    .locals 4

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bo()V

    new-instance v0, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v1, "Failed to load resource"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;Ljava/util/List;)V

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    invoke-interface {v1, v0}, Lcom/bumptech/glide/load/engine/DecodeJob$a;->a(Lcom/bumptech/glide/load/engine/GlideException;)V

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bj()V

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/DecodeJob;)I
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/engine/DecodeJob;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;)I"
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->getPriority()I

    move-result v0

    invoke-direct {p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->getPriority()I

    move-result v1

    sub-int/2addr v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    iget p1, p1, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    sub-int/2addr v0, p1

    :cond_0
    return v0
.end method

.method a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/engine/i;Lcom/bumptech/glide/load/c;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/engine/g;Ljava/util/Map;ZZZLcom/bumptech/glide/load/f;Lcom/bumptech/glide/load/engine/DecodeJob$a;I)Lcom/bumptech/glide/load/engine/DecodeJob;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/e;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/engine/i;",
            "Lcom/bumptech/glide/load/c;",
            "II",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/engine/g;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;ZZZ",
            "Lcom/bumptech/glide/load/f;",
            "Lcom/bumptech/glide/load/engine/DecodeJob$a<",
            "TR;>;I)",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "TR;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    iget-object v15, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->fU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p10

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p15

    move-object/from16 v12, p11

    move/from16 v13, p12

    move/from16 v14, p13

    invoke-virtual/range {v1 .. v15}, Lcom/bumptech/glide/load/engine/e;->a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/c;IILcom/bumptech/glide/load/engine/g;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/f;Ljava/util/Map;ZZLcom/bumptech/glide/load/engine/DecodeJob$d;)V

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->bp:Lcom/bumptech/glide/e;

    move-object/from16 v1, p4

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->fP:Lcom/bumptech/glide/load/c;

    move-object/from16 v1, p9

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->fY:Lcom/bumptech/glide/Priority;

    move-object/from16 v1, p3

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->gi:Lcom/bumptech/glide/load/engine/i;

    move/from16 v1, p5

    iput v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    move/from16 v1, p6

    iput v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    move-object/from16 v1, p10

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->fZ:Lcom/bumptech/glide/load/engine/g;

    move/from16 v1, p14

    iput-boolean v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->gn:Z

    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    move/from16 v1, p17

    iput v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->order:I

    sget-object v1, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->gF:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    move-object/from16 v1, p2

    iput-object v1, v0, Lcom/bumptech/glide/load/engine/DecodeJob;->cy:Ljava/lang/Object;

    return-object v0
.end method

.method a(Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;
    .locals 11
    .param p2    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/DataSource;",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;"
        }
    .end annotation

    invoke-interface {p2}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    nop

    nop

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    const/4 v1, 0x0

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v0, v8}, Lcom/bumptech/glide/load/engine/e;->f(Ljava/lang/Class;)Lcom/bumptech/glide/load/i;

    move-result-object v0

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->bp:Lcom/bumptech/glide/e;

    iget v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    invoke-interface {v0, v2, p2, v3, v4}, Lcom/bumptech/glide/load/i;->transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/p;II)Lcom/bumptech/glide/load/engine/p;

    move-result-object v2

    move-object v7, v0

    move-object v0, v2

    goto :goto_0

    :cond_0
    move-object v0, p2

    move-object v7, v1

    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {p2}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    :cond_1
    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {p2, v0}, Lcom/bumptech/glide/load/engine/e;->a(Lcom/bumptech/glide/load/engine/p;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {p2, v0}, Lcom/bumptech/glide/load/engine/e;->b(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/h;

    move-result-object v1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    invoke-interface {v1, p2}, Lcom/bumptech/glide/load/h;->b(Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/EncodeStrategy;

    move-result-object p2

    :goto_1
    move-object v10, v1

    goto :goto_2

    :cond_2
    nop

    sget-object p2, Lcom/bumptech/glide/load/EncodeStrategy;->eu:Lcom/bumptech/glide/load/EncodeStrategy;

    goto :goto_1

    :goto_2
    nop

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/load/engine/e;->c(Lcom/bumptech/glide/load/c;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fZ:Lcom/bumptech/glide/load/engine/g;

    invoke-virtual {v2, v1, p1, p2}, Lcom/bumptech/glide/load/engine/g;->a(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z

    move-result p1

    if-eqz p1, :cond_4

    if-eqz v10, :cond_3

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$1;->gy:[I

    invoke-virtual {p2}, Lcom/bumptech/glide/load/EncodeStrategy;->ordinal()I

    move-result v1

    aget p1, p1, v1

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown strategy: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    new-instance p1, Lcom/bumptech/glide/load/engine/r;

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gc:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/e;->L()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    move-result-object v2

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fP:Lcom/bumptech/glide/load/c;

    iget v5, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->width:I

    iget v6, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->height:I

    iget-object v9, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fR:Lcom/bumptech/glide/load/f;

    move-object v1, p1

    invoke-direct/range {v1 .. v9}, Lcom/bumptech/glide/load/engine/r;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;IILcom/bumptech/glide/load/i;Ljava/lang/Class;Lcom/bumptech/glide/load/f;)V

    goto :goto_3

    :pswitch_1
    new-instance p1, Lcom/bumptech/glide/load/engine/b;

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fP:Lcom/bumptech/glide/load/c;

    invoke-direct {p1, p2, v1}, Lcom/bumptech/glide/load/engine/b;-><init>(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;)V

    nop

    :goto_3
    invoke-static {v0}, Lcom/bumptech/glide/load/engine/o;->f(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/o;

    move-result-object v0

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gg:Lcom/bumptech/glide/load/engine/DecodeJob$c;

    invoke-virtual {p2, p1, v10, v0}, Lcom/bumptech/glide/load/engine/DecodeJob$c;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/h;Lcom/bumptech/glide/load/engine/o;)V

    goto :goto_4

    :cond_3
    new-instance p1, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/bumptech/glide/Registry$NoResultEncoderAvailableException;-><init>(Ljava/lang/Class;)V

    throw p1

    :cond_4
    :goto_4
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Ljava/lang/Exception;",
            "Lcom/bumptech/glide/load/a/d<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    invoke-interface {p3}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    new-instance v0, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v1, "Fetching data failed"

    invoke-direct {v0, v1, p2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {p3}, Lcom/bumptech/glide/load/a/d;->aJ()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v0, p1, p4, p2}, Lcom/bumptech/glide/load/engine/GlideException;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/DataSource;Ljava/lang/Class;)V

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->go:Ljava/lang/Thread;

    if-eq p1, p2, :cond_0

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->gG:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/load/engine/DecodeJob$a;->b(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bn()V

    :goto_0
    return-void
.end method

.method public a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/a/d<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            "Lcom/bumptech/glide/load/c;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gp:Lcom/bumptech/glide/load/c;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gr:Ljava/lang/Object;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gt:Lcom/bumptech/glide/load/a/d;

    iput-object p4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gs:Lcom/bumptech/glide/load/DataSource;

    iput-object p5, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gq:Lcom/bumptech/glide/load/c;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->go:Ljava/lang/Thread;

    if-eq p1, p2, :cond_0

    sget-object p1, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->gH:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/load/engine/DecodeJob$a;->b(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    goto :goto_0

    :cond_0
    const-string p1, "DecodeJob.decodeFromRetrievedData"

    invoke-static {p1}, Lcom/bumptech/glide/util/a/b;->beginSection(Ljava/lang/String;)V

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    nop

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    throw p1
.end method

.method public aV()V
    .locals 1

    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;->gG:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gl:Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gj:Lcom/bumptech/glide/load/engine/DecodeJob$a;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/load/engine/DecodeJob$a;->b(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    return-void
.end method

.method bh()Z
    .locals 2

    sget-object v0, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gJ:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob$Stage;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gK:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gL:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public bq()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->ge:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gu:Lcom/bumptech/glide/load/engine/d;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/d;->cancel()V

    :cond_0
    return-void
.end method

.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/bumptech/glide/load/engine/DecodeJob;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->a(Lcom/bumptech/glide/load/engine/DecodeJob;)I

    move-result p1

    return p1
.end method

.method release(Z)V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gh:Lcom/bumptech/glide/load/engine/DecodeJob$e;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/DecodeJob$e;->e(Z)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bk()V

    :cond_0
    return-void
.end method

.method public run()V
    .locals 5

    const-string v0, "DecodeJob#run(model=%s)"

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->cy:Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/a/b;->b(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gt:Lcom/bumptech/glide/load/a/d;

    :try_start_0
    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    if-eqz v1, :cond_1

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    :cond_0
    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    return-void

    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->bl()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_2

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    :cond_2
    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_2
    const-string v2, "DecodeJob"

    const/4 v3, 0x3

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "DecodeJob"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DecodeJob threw unexpectedly, isCancelled: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ", stage: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gk:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    sget-object v3, Lcom/bumptech/glide/load/engine/DecodeJob$Stage;->gN:Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->gd:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/DecodeJob;->notifyFailed()V

    :cond_4
    iget-boolean v2, p0, Lcom/bumptech/glide/load/engine/DecodeJob;->fc:Z

    if-eqz v2, :cond_5

    if-eqz v0, :cond_2

    goto :goto_0

    :goto_1
    return-void

    :cond_5
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    if-eqz v0, :cond_6

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    :cond_6
    invoke-static {}, Lcom/bumptech/glide/util/a/b;->endSection()V

    throw v1
.end method

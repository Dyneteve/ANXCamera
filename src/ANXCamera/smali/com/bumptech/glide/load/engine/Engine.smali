.class public Lcom/bumptech/glide/load/engine/Engine;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/j$a;
.implements Lcom/bumptech/glide/load/engine/h;
.implements Lcom/bumptech/glide/load/engine/k$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;,
        Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;,
        Lcom/bumptech/glide/load/engine/Engine$a;,
        Lcom/bumptech/glide/load/engine/Engine$b;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Engine"

.field private static final gZ:I = 0x96

.field private static final ha:Z


# instance fields
.field private final hb:Lcom/bumptech/glide/load/engine/m;

.field private final hc:Lcom/bumptech/glide/load/engine/j;

.field private final hd:Lcom/bumptech/glide/load/engine/a/j;

.field private final he:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

.field private final hf:Lcom/bumptech/glide/load/engine/s;

.field private final hg:Lcom/bumptech/glide/load/engine/Engine$a;

.field private final hh:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

.field private final hi:Lcom/bumptech/glide/load/engine/ActiveResources;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "Engine"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/a/a$a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/m;Lcom/bumptech/glide/load/engine/j;Lcom/bumptech/glide/load/engine/ActiveResources;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;Lcom/bumptech/glide/load/engine/s;Z)V
    .locals 9
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    move-object v6, p0

    move-object v7, p1

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    iput-object v7, v6, Lcom/bumptech/glide/load/engine/Engine;->hd:Lcom/bumptech/glide/load/engine/a/j;

    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$a;

    move-object v1, p2

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/engine/Engine$a;-><init>(Lcom/bumptech/glide/load/engine/a/a$a;)V

    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hg:Lcom/bumptech/glide/load/engine/Engine$a;

    if-nez p9, :cond_0

    new-instance v0, Lcom/bumptech/glide/load/engine/ActiveResources;

    move/from16 v1, p13

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/engine/ActiveResources;-><init>(Z)V

    goto :goto_0

    :cond_0
    move-object/from16 v0, p9

    :goto_0
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0, v6}, Lcom/bumptech/glide/load/engine/ActiveResources;->a(Lcom/bumptech/glide/load/engine/k$a;)V

    if-nez p8, :cond_1

    new-instance v0, Lcom/bumptech/glide/load/engine/j;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/j;-><init>()V

    goto :goto_1

    :cond_1
    move-object/from16 v0, p8

    :goto_1
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hc:Lcom/bumptech/glide/load/engine/j;

    if-nez p7, :cond_2

    new-instance v0, Lcom/bumptech/glide/load/engine/m;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/m;-><init>()V

    goto :goto_2

    :cond_2
    move-object/from16 v0, p7

    :goto_2
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hb:Lcom/bumptech/glide/load/engine/m;

    if-nez p10, :cond_3

    new-instance v8, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    move-object v0, v8

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;-><init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;)V

    goto :goto_3

    :cond_3
    move-object/from16 v0, p10

    :goto_3
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->he:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    if-nez p11, :cond_4

    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    iget-object v1, v6, Lcom/bumptech/glide/load/engine/Engine;->hg:Lcom/bumptech/glide/load/engine/Engine$a;

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;-><init>(Lcom/bumptech/glide/load/engine/DecodeJob$d;)V

    goto :goto_4

    :cond_4
    move-object/from16 v0, p11

    :goto_4
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hh:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    if-nez p12, :cond_5

    new-instance v0, Lcom/bumptech/glide/load/engine/s;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/s;-><init>()V

    goto :goto_5

    :cond_5
    move-object/from16 v0, p12

    :goto_5
    iput-object v0, v6, Lcom/bumptech/glide/load/engine/Engine;->hf:Lcom/bumptech/glide/load/engine/s;

    invoke-interface {v7, v6}, Lcom/bumptech/glide/load/engine/a/j;->a(Lcom/bumptech/glide/load/engine/a/j$a;)V

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/a/a$a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Z)V
    .locals 14

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v13, p7

    invoke-direct/range {v0 .. v13}, Lcom/bumptech/glide/load/engine/Engine;-><init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/a/a$a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/m;Lcom/bumptech/glide/load/engine/j;Lcom/bumptech/glide/load/engine/ActiveResources;Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;Lcom/bumptech/glide/load/engine/s;Z)V

    return-void
.end method

.method private a(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/k;
    .locals 0
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Z)",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;"
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object p2, p0, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {p2, p1}, Lcom/bumptech/glide/load/engine/ActiveResources;->b(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/k;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/k;->acquire()V

    :cond_1
    return-object p1
.end method

.method private static a(Ljava/lang/String;JLcom/bumptech/glide/load/c;)V
    .locals 2

    const-string v0, "Engine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " in "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide p0

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p0, "ms, key: "

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private b(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/k;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Z)",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;"
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/Engine;->d(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/k;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/k;->acquire()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/engine/ActiveResources;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V

    :cond_1
    return-object p2
.end method

.method private d(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/k;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            ")",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hd:Lcom/bumptech/glide/load/engine/a/j;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/a/j;->g(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/bumptech/glide/load/engine/k;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/bumptech/glide/load/engine/k;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/bumptech/glide/load/engine/k;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1, v1}, Lcom/bumptech/glide/load/engine/k;-><init>(Lcom/bumptech/glide/load/engine/p;ZZ)V

    move-object p1, v0

    :goto_0
    return-object p1
.end method


# virtual methods
.method public P()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hg:Lcom/bumptech/glide/load/engine/Engine$a;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$a;->aW()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v0

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/a/a;->clear()V

    return-void
.end method

.method public a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/c;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/engine/g;Ljava/util/Map;ZZLcom/bumptech/glide/load/f;ZZZZLcom/bumptech/glide/request/g;)Lcom/bumptech/glide/load/engine/Engine$b;
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/e;",
            "Ljava/lang/Object;",
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
            "*>;>;ZZ",
            "Lcom/bumptech/glide/load/f;",
            "ZZZZ",
            "Lcom/bumptech/glide/request/g;",
            ")",
            "Lcom/bumptech/glide/load/engine/Engine$b;"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v3, p14

    move-object/from16 v7, p18

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    sget-boolean v1, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/bumptech/glide/util/e;->fm()J

    move-result-wide v1

    :goto_0
    move-wide v8, v1

    goto :goto_1

    :cond_0
    const-wide/16 v1, 0x0

    goto :goto_0

    :goto_1
    iget-object v10, v0, Lcom/bumptech/glide/load/engine/Engine;->hc:Lcom/bumptech/glide/load/engine/j;

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move/from16 v13, p4

    move/from16 v14, p5

    move-object/from16 v15, p10

    move-object/from16 v16, p6

    move-object/from16 v17, p7

    move-object/from16 v18, p13

    invoke-virtual/range {v10 .. v18}, Lcom/bumptech/glide/load/engine/j;->a(Ljava/lang/Object;Lcom/bumptech/glide/load/c;IILjava/util/Map;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/engine/i;

    move-result-object v10

    invoke-direct {v0, v10, v3}, Lcom/bumptech/glide/load/engine/Engine;->a(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/k;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->el:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v7, v1, v0}, Lcom/bumptech/glide/request/g;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    sget-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    if-eqz v0, :cond_1

    const-string v0, "Loaded resource from active resources"

    invoke-static {v0, v8, v9, v10}, Lcom/bumptech/glide/load/engine/Engine;->a(Ljava/lang/String;JLcom/bumptech/glide/load/c;)V

    :cond_1
    return-object v2

    :cond_2
    invoke-direct {v0, v10, v3}, Lcom/bumptech/glide/load/engine/Engine;->b(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/k;

    move-result-object v1

    if-eqz v1, :cond_4

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->el:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v7, v1, v0}, Lcom/bumptech/glide/request/g;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    sget-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    if-eqz v0, :cond_3

    const-string v0, "Loaded resource from cache"

    invoke-static {v0, v8, v9, v10}, Lcom/bumptech/glide/load/engine/Engine;->a(Ljava/lang/String;JLcom/bumptech/glide/load/c;)V

    :cond_3
    return-object v2

    :cond_4
    iget-object v1, v0, Lcom/bumptech/glide/load/engine/Engine;->hb:Lcom/bumptech/glide/load/engine/m;

    move/from16 v15, p17

    invoke-virtual {v1, v10, v15}, Lcom/bumptech/glide/load/engine/m;->c(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v1, v7}, Lcom/bumptech/glide/load/engine/EngineJob;->a(Lcom/bumptech/glide/request/g;)V

    sget-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    if-eqz v0, :cond_5

    const-string v0, "Added to existing load"

    invoke-static {v0, v8, v9, v10}, Lcom/bumptech/glide/load/engine/Engine;->a(Ljava/lang/String;JLcom/bumptech/glide/load/c;)V

    :cond_5
    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$b;

    invoke-direct {v0, v7, v1}, Lcom/bumptech/glide/load/engine/Engine$b;-><init>(Lcom/bumptech/glide/request/g;Lcom/bumptech/glide/load/engine/EngineJob;)V

    return-object v0

    :cond_6
    iget-object v1, v0, Lcom/bumptech/glide/load/engine/Engine;->he:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    move-object v2, v10

    move/from16 v4, p15

    move/from16 v5, p16

    move v6, v15

    invoke-virtual/range {v1 .. v6}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->a(Lcom/bumptech/glide/load/c;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object v1

    iget-object v11, v0, Lcom/bumptech/glide/load/engine/Engine;->hh:Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object v14, v10

    move-object/from16 v15, p3

    move/from16 v16, p4

    move/from16 v17, p5

    move-object/from16 v18, p6

    move-object/from16 v19, p7

    move-object/from16 v20, p8

    move-object/from16 v21, p9

    move-object/from16 v22, p10

    move/from16 v23, p11

    move/from16 v24, p12

    move/from16 v25, p17

    move-object/from16 v26, p13

    move-object/from16 v27, v1

    invoke-virtual/range {v11 .. v27}, Lcom/bumptech/glide/load/engine/Engine$DecodeJobFactory;->a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/engine/i;Lcom/bumptech/glide/load/c;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/engine/g;Ljava/util/Map;ZZZLcom/bumptech/glide/load/f;Lcom/bumptech/glide/load/engine/DecodeJob$a;)Lcom/bumptech/glide/load/engine/DecodeJob;

    move-result-object v2

    iget-object v0, v0, Lcom/bumptech/glide/load/engine/Engine;->hb:Lcom/bumptech/glide/load/engine/m;

    invoke-virtual {v0, v10, v1}, Lcom/bumptech/glide/load/engine/m;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/EngineJob;)V

    invoke-virtual {v1, v7}, Lcom/bumptech/glide/load/engine/EngineJob;->a(Lcom/bumptech/glide/request/g;)V

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/load/engine/EngineJob;->c(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    sget-boolean v0, Lcom/bumptech/glide/load/engine/Engine;->ha:Z

    if-eqz v0, :cond_7

    const-string v0, "Started new load"

    invoke-static {v0, v8, v9, v10}, Lcom/bumptech/glide/load/engine/Engine;->a(Ljava/lang/String;JLcom/bumptech/glide/load/c;)V

    :cond_7
    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$b;

    invoke-direct {v0, v7, v1}, Lcom/bumptech/glide/load/engine/Engine$b;-><init>(Lcom/bumptech/glide/request/g;Lcom/bumptech/glide/load/engine/EngineJob;)V

    return-object v0
.end method

.method public a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;",
            "Lcom/bumptech/glide/load/c;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hb:Lcom/bumptech/glide/load/engine/m;

    invoke-virtual {v0, p2, p1}, Lcom/bumptech/glide/load/engine/m;->b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/EngineJob;)V

    return-void
.end method

.method public a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;)V"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    if-eqz p3, :cond_0

    invoke-virtual {p3, p2, p0}, Lcom/bumptech/glide/load/engine/k;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k$a;)V

    invoke-virtual {p3}, Lcom/bumptech/glide/load/engine/k;->bF()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0, p2, p3}, Lcom/bumptech/glide/load/engine/ActiveResources;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V

    :cond_0
    iget-object p3, p0, Lcom/bumptech/glide/load/engine/Engine;->hb:Lcom/bumptech/glide/load/engine/m;

    invoke-virtual {p3, p2, p1}, Lcom/bumptech/glide/load/engine/m;->b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/EngineJob;)V

    return-void
.end method

.method public b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;)V"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/ActiveResources;->a(Lcom/bumptech/glide/load/c;)V

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/k;->bF()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hd:Lcom/bumptech/glide/load/engine/a/j;

    invoke-interface {v0, p1, p2}, Lcom/bumptech/glide/load/engine/a/j;->b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/Engine;->hf:Lcom/bumptech/glide/load/engine/s;

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/load/engine/s;->h(Lcom/bumptech/glide/load/engine/p;)V

    :goto_0
    return-void
.end method

.method public d(Lcom/bumptech/glide/load/engine/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)V"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    instance-of v0, p1, Lcom/bumptech/glide/load/engine/k;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/bumptech/glide/load/engine/k;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/k;->release()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot release anything but an EngineResource"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public e(Lcom/bumptech/glide/load/engine/p;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)V"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hf:Lcom/bumptech/glide/load/engine/s;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/s;->h(Lcom/bumptech/glide/load/engine/p;)V

    return-void
.end method

.method public shutdown()V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->he:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->shutdown()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hg:Lcom/bumptech/glide/load/engine/Engine$a;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$a;->clearDiskCacheIfCreated()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine;->hi:Lcom/bumptech/glide/load/engine/ActiveResources;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/ActiveResources;->shutdown()V

    return-void
.end method

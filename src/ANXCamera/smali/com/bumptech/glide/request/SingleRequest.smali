.class public final Lcom/bumptech/glide/request/SingleRequest;
.super Ljava/lang/Object;
.source "SingleRequest.java"

# interfaces
.implements Lcom/bumptech/glide/request/c;
.implements Lcom/bumptech/glide/request/g;
.implements Lcom/bumptech/glide/request/target/m;
.implements Lcom/bumptech/glide/util/a/a$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/SingleRequest$Status;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/c;",
        "Lcom/bumptech/glide/request/g;",
        "Lcom/bumptech/glide/request/target/m;",
        "Lcom/bumptech/glide/util/a/a$c;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Request"

.field private static final gP:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/request/SingleRequest<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final oD:Ljava/lang/String; = "Glide"

.field private static final oF:Z


# instance fields
.field private aj:Lcom/bumptech/glide/load/engine/Engine;

.field private an:Lcom/bumptech/glide/e;

.field private bq:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TR;>;"
        }
    .end annotation
.end field

.field private br:Lcom/bumptech/glide/request/f;

.field private bt:Ljava/lang/Object;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private bu:Lcom/bumptech/glide/request/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/e<",
            "TR;>;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private eD:Lcom/bumptech/glide/load/engine/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;"
        }
    .end annotation
.end field

.field private eW:Lcom/bumptech/glide/Priority;

.field private final fc:Lcom/bumptech/glide/util/a/c;

.field private height:I

.field private oE:Z

.field private oG:Lcom/bumptech/glide/request/e;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/e<",
            "TR;>;"
        }
    .end annotation
.end field

.field private oH:Lcom/bumptech/glide/request/d;

.field private oI:Lcom/bumptech/glide/request/target/n;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/target/n<",
            "TR;>;"
        }
    .end annotation
.end field

.field private oJ:Lcom/bumptech/glide/request/a/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/a/g<",
            "-TR;>;"
        }
    .end annotation
.end field

.field private oK:Lcom/bumptech/glide/load/engine/Engine$b;

.field private oL:Lcom/bumptech/glide/request/SingleRequest$Status;

.field private oM:Landroid/graphics/drawable/Drawable;

.field private ot:Landroid/graphics/drawable/Drawable;

.field private ov:I

.field private ow:I

.field private oy:Landroid/graphics/drawable/Drawable;

.field private startTime:J

.field private final tag:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/bumptech/glide/request/SingleRequest$1;

    invoke-direct {v0}, Lcom/bumptech/glide/request/SingleRequest$1;-><init>()V

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/a/a;->a(ILcom/bumptech/glide/util/a/a$a;)Landroid/support/v4/util/Pools$Pool;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/SingleRequest;->gP:Landroid/support/v4/util/Pools$Pool;

    const-string v0, "Request"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    nop

    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->tag:Ljava/lang/String;

    invoke-static {}, Lcom/bumptech/glide/util/a/c;->eS()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    return-void
.end method

.method private F(Ljava/lang/String;)V
    .locals 2

    const-string v0, "Request"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " this: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->tag:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private T(I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    invoke-static {v1, p1, v0}, Lcom/bumptech/glide/load/resource/b/a;->a(Landroid/content/Context;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method

.method private static a(IF)I
    .locals 1

    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    int-to-float p0, p0

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    :goto_0
    return p0
.end method

.method public static a(Landroid/content/Context;Lcom/bumptech/glide/e;Ljava/lang/Object;Ljava/lang/Class;Lcom/bumptech/glide/request/f;IILcom/bumptech/glide/Priority;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/request/SingleRequest;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/e;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/request/f;",
            "II",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/request/target/n<",
            "TR;>;",
            "Lcom/bumptech/glide/request/e<",
            "TR;>;",
            "Lcom/bumptech/glide/request/e<",
            "TR;>;",
            "Lcom/bumptech/glide/request/d;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "Lcom/bumptech/glide/request/a/g<",
            "-TR;>;)",
            "Lcom/bumptech/glide/request/SingleRequest<",
            "TR;>;"
        }
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/SingleRequest;->gP:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/SingleRequest;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/SingleRequest;

    invoke-direct {v0}, Lcom/bumptech/glide/request/SingleRequest;-><init>()V

    :cond_0
    move-object v1, v0

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    move-object/from16 v15, p13

    invoke-direct/range {v1 .. v15}, Lcom/bumptech/glide/request/SingleRequest;->b(Landroid/content/Context;Lcom/bumptech/glide/e;Ljava/lang/Object;Ljava/lang/Class;Lcom/bumptech/glide/request/f;IILcom/bumptech/glide/Priority;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/request/a/g;)V

    return-object v0
.end method

.method private a(Lcom/bumptech/glide/load/engine/GlideException;I)V
    .locals 4

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->getLogLevel()I

    move-result v0

    if-gt v0, p2, :cond_0

    const-string p2, "Glide"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Load failed for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " with size ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p2, 0x4

    if-gt v0, p2, :cond_0

    const-string p2, "Glide"

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/load/engine/GlideException;->s(Ljava/lang/String;)V

    :cond_0
    const/4 p2, 0x0

    iput-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    sget-object p2, Lcom/bumptech/glide/request/SingleRequest$Status;->oR:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    const/4 p2, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->eo()Z

    move-result v3

    invoke-interface {v0, p1, v1, v2, v3}, Lcom/bumptech/glide/request/e;->a(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/n;Z)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->eo()Z

    move-result v3

    invoke-interface {v0, p1, v1, v2, v3}, Lcom/bumptech/glide/request/e;->a(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/n;Z)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ek()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    iput-boolean p2, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    nop

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->eq()V

    return-void

    :catchall_0
    move-exception p1

    iput-boolean p2, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    throw p1
.end method

.method private a(Lcom/bumptech/glide/load/engine/p;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;TR;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->eo()Z

    move-result v6

    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oQ:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->eD:Lcom/bumptech/glide/load/engine/p;

    iget-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    invoke-virtual {p1}, Lcom/bumptech/glide/e;->getLogLevel()I

    move-result p1

    const/4 v0, 0x3

    if-gt p1, v0, :cond_0

    const-string p1, "Glide"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Finished loading "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " with size ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, " ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    const/4 p1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v3, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    move-object v1, p2

    move-object v4, p3

    move v5, v6

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/request/e;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/load/DataSource;Z)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v3, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    move-object v1, p2

    move-object v4, p3

    move v5, v6

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/request/e;->a(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/load/DataSource;Z)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oJ:Lcom/bumptech/glide/request/a/g;

    invoke-interface {v0, p3, v6}, Lcom/bumptech/glide/request/a/g;->a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;

    move-result-object p3

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-interface {v0, p2, p3}, Lcom/bumptech/glide/request/target/n;->a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    iput-boolean p1, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    nop

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ep()V

    return-void

    :catchall_0
    move-exception p2

    iput-boolean p1, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    throw p2
.end method

.method private b(Landroid/content/Context;Lcom/bumptech/glide/e;Ljava/lang/Object;Ljava/lang/Class;Lcom/bumptech/glide/request/f;IILcom/bumptech/glide/Priority;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/request/a/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/e;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/request/f;",
            "II",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/request/target/n<",
            "TR;>;",
            "Lcom/bumptech/glide/request/e<",
            "TR;>;",
            "Lcom/bumptech/glide/request/e<",
            "TR;>;",
            "Lcom/bumptech/glide/request/d;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "Lcom/bumptech/glide/request/a/g<",
            "-TR;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    iput-object p3, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iput-object p4, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    iput-object p5, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    iput p6, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iput p7, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    iput-object p8, p0, Lcom/bumptech/glide/request/SingleRequest;->eW:Lcom/bumptech/glide/Priority;

    iput-object p9, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    iput-object p10, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    iput-object p11, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    iput-object p12, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    iput-object p13, p0, Lcom/bumptech/glide/request/SingleRequest;->aj:Lcom/bumptech/glide/load/engine/Engine;

    iput-object p14, p0, Lcom/bumptech/glide/request/SingleRequest;->oJ:Lcom/bumptech/glide/request/a/g;

    sget-object p1, Lcom/bumptech/glide/request/SingleRequest$Status;->oN:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    return-void
.end method

.method private dW()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dW()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dV()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dV()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->T(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private dY()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dY()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dX()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dX()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->T(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private ei()V
    .locals 2

    iget-boolean v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oE:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can\'t start or clear loads in RequestListener or Target callbacks. If you\'re trying to start a fallback request when a load fails, use RequestBuilder#error(RequestBuilder). Otherwise consider posting your into() or clear() calls to the main thread using a Handler instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private ej()Landroid/graphics/drawable/Drawable;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dT()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dU()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dU()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->T(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private ek()V
    .locals 2

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->en()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->dY()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_1
    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ej()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_2
    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->dW()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_3
    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-interface {v1, v0}, Lcom/bumptech/glide/request/target/n;->f(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private el()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->d(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method private em()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->f(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method private en()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->e(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

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

.method private eo()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0}, Lcom/bumptech/glide/request/d;->dn()Z

    move-result v0

    if-nez v0, :cond_0

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

.method private ep()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->h(Lcom/bumptech/glide/request/c;)V

    :cond_0
    return-void
.end method

.method private eq()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->i(Lcom/bumptech/glide/request/c;)V

    :cond_0
    return-void
.end method

.method private m(Lcom/bumptech/glide/load/engine/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->aj:Lcom/bumptech/glide/load/engine/Engine;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/Engine;->d(Lcom/bumptech/glide/load/engine/p;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->eD:Lcom/bumptech/glide/load/engine/p;

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/GlideException;)V
    .locals 1

    const/4 v0, 0x5

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/request/SingleRequest;->a(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void
.end method

.method public aQ()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

.method public begin()V
    .locals 3

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ei()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    invoke-static {}, Lcom/bumptech/glide/util/e;->eK()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    if-nez v0, :cond_2

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iget v1, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/k;->s(II)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iput v0, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    iput v0, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->dY()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x5

    goto :goto_0

    :cond_1
    const/4 v0, 0x3

    :goto_0
    new-instance v1, Lcom/bumptech/glide/load/engine/GlideException;

    const-string v2, "Received null model"

    invoke-direct {v1, v2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1, v0}, Lcom/bumptech/glide/request/SingleRequest;->a(Lcom/bumptech/glide/load/engine/GlideException;I)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oO:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v1, :cond_8

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oQ:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->eD:Lcom/bumptech/glide/load/engine/p;

    sget-object v1, Lcom/bumptech/glide/load/DataSource;->dg:Lcom/bumptech/glide/load/DataSource;

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/SingleRequest;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    return-void

    :cond_3
    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oP:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iget v1, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/k;->s(II)Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iget v1, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/SingleRequest;->p(II)V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/target/n;->a(Lcom/bumptech/glide/request/target/m;)V

    :goto_1
    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oO:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v1, :cond_5

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oP:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_6

    :cond_5
    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->en()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->dW()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/request/target/n;->e(Landroid/graphics/drawable/Drawable;)V

    :cond_6
    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    if-eqz v0, :cond_7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "finished run method in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->F(Ljava/lang/String;)V

    :cond_7
    return-void

    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot restart a running request"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    if-nez p1, :cond_0

    new-instance p1, Lcom/bumptech/glide/load/engine/GlideException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Expected to receive a Resource<R> with an object of "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " inside, but instead got null."

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/SingleRequest;->a(Lcom/bumptech/glide/load/engine/GlideException;)V

    return-void

    :cond_0
    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->el()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/SingleRequest;->m(Lcom/bumptech/glide/load/engine/p;)V

    sget-object p1, Lcom/bumptech/glide/request/SingleRequest$Status;->oQ:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object p1, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    return-void

    :cond_2
    invoke-direct {p0, p1, v0, p2}, Lcom/bumptech/glide/request/SingleRequest;->a(Lcom/bumptech/glide/load/engine/p;Ljava/lang/Object;Lcom/bumptech/glide/load/DataSource;)V

    return-void

    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/SingleRequest;->m(Lcom/bumptech/glide/load/engine/p;)V

    new-instance p2, Lcom/bumptech/glide/load/engine/GlideException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected to receive an object of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " but instead got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_1

    :cond_4
    const-string v2, ""

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "} inside Resource{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "}."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_5

    const-string p1, ""

    goto :goto_2

    :cond_5
    const-string p1, " To indicate failure return a null Resource object, rather than a Resource object containing null data."

    :goto_2
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/bumptech/glide/load/engine/GlideException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/request/SingleRequest;->a(Lcom/bumptech/glide/load/engine/GlideException;)V

    return-void
.end method

.method public c(Lcom/bumptech/glide/request/c;)Z
    .locals 3

    instance-of v0, p1, Lcom/bumptech/glide/request/SingleRequest;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    check-cast p1, Lcom/bumptech/glide/request/SingleRequest;

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iget v2, p1, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    iget v2, p1, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->eW:Lcom/bumptech/glide/Priority;

    iget-object v2, p1, Lcom/bumptech/glide/request/SingleRequest;->eW:Lcom/bumptech/glide/Priority;

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    if-nez p1, :cond_1

    :goto_0
    const/4 v1, 0x1

    nop

    :cond_1
    return v1

    :cond_2
    return v1
.end method

.method cancel()V
    .locals 1

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ei()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/target/n;->b(Lcom/bumptech/glide/request/target/m;)V

    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oS:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/Engine$b;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    :cond_0
    return-void
.end method

.method public clear()V
    .locals 2

    invoke-static {}, Lcom/bumptech/glide/util/k;->eL()V

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ei()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oT:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->cancel()V

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->eD:Lcom/bumptech/glide/load/engine/p;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->eD:Lcom/bumptech/glide/load/engine/p;

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/SingleRequest;->m(Lcom/bumptech/glide/load/engine/p;)V

    :cond_1
    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->em()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->dW()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/bumptech/glide/request/target/n;->d(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oT:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    return-void
.end method

.method public dj()Z
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->isComplete()Z

    move-result v0

    return v0
.end method

.method public isCancelled()Z
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oS:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oT:Lcom/bumptech/glide/request/SingleRequest$Status;

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

.method public isComplete()Z
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oQ:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFailed()Z
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oR:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPaused()Z
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oU:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRunning()Z
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oO:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oP:Lcom/bumptech/glide/request/SingleRequest$Status;

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

.method public p(II)V
    .locals 20

    move-object/from16 v15, p0

    iget-object v0, v15, Lcom/bumptech/glide/request/SingleRequest;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Got onSizeReady in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, v15, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v15, v0}, Lcom/bumptech/glide/request/SingleRequest;->F(Ljava/lang/String;)V

    :cond_0
    iget-object v0, v15, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v1, Lcom/bumptech/glide/request/SingleRequest$Status;->oP:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v1, :cond_1

    return-void

    :cond_1
    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oO:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, v15, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    iget-object v0, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ee()F

    move-result v0

    move/from16 v1, p1

    invoke-static {v1, v0}, Lcom/bumptech/glide/request/SingleRequest;->a(IF)I

    move-result v1

    iput v1, v15, Lcom/bumptech/glide/request/SingleRequest;->width:I

    move/from16 v1, p2

    invoke-static {v1, v0}, Lcom/bumptech/glide/request/SingleRequest;->a(IF)I

    move-result v0

    iput v0, v15, Lcom/bumptech/glide/request/SingleRequest;->height:I

    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "finished setup for calling load in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, v15, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v1, v2}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v15, v0}, Lcom/bumptech/glide/request/SingleRequest;->F(Ljava/lang/String;)V

    :cond_2
    iget-object v0, v15, Lcom/bumptech/glide/request/SingleRequest;->aj:Lcom/bumptech/glide/load/engine/Engine;

    iget-object v1, v15, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    iget-object v2, v15, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iget-object v3, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v3}, Lcom/bumptech/glide/request/f;->aA()Lcom/bumptech/glide/load/c;

    move-result-object v3

    iget v4, v15, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iget v5, v15, Lcom/bumptech/glide/request/SingleRequest;->height:I

    iget-object v6, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v6}, Lcom/bumptech/glide/request/f;->bf()Ljava/lang/Class;

    move-result-object v6

    iget-object v7, v15, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    iget-object v8, v15, Lcom/bumptech/glide/request/SingleRequest;->eW:Lcom/bumptech/glide/Priority;

    iget-object v9, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v9}, Lcom/bumptech/glide/request/f;->ax()Lcom/bumptech/glide/load/engine/g;

    move-result-object v9

    iget-object v10, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v10}, Lcom/bumptech/glide/request/f;->dR()Ljava/util/Map;

    move-result-object v10

    iget-object v11, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v11}, Lcom/bumptech/glide/request/f;->dS()Z

    move-result v11

    iget-object v12, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v12}, Lcom/bumptech/glide/request/f;->aE()Z

    move-result v12

    iget-object v13, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v13}, Lcom/bumptech/glide/request/f;->az()Lcom/bumptech/glide/load/f;

    move-result-object v13

    iget-object v14, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v14}, Lcom/bumptech/glide/request/f;->dZ()Z

    move-result v14

    move/from16 v19, v14

    iget-object v14, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v14}, Lcom/bumptech/glide/request/f;->ef()Z

    move-result v16

    iget-object v14, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v14}, Lcom/bumptech/glide/request/f;->eg()Z

    move-result v17

    iget-object v14, v15, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    invoke-virtual {v14}, Lcom/bumptech/glide/request/f;->eh()Z

    move-result v18

    move/from16 v14, v19

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, p0

    invoke-virtual/range {v0 .. v18}, Lcom/bumptech/glide/load/engine/Engine;->a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/c;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/engine/g;Ljava/util/Map;ZZLcom/bumptech/glide/load/f;ZZZZLcom/bumptech/glide/request/g;)Lcom/bumptech/glide/load/engine/Engine$b;

    move-result-object v0

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    iget-object v0, v1, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    sget-object v2, Lcom/bumptech/glide/request/SingleRequest$Status;->oO:Lcom/bumptech/glide/request/SingleRequest$Status;

    if-eq v0, v2, :cond_3

    const/4 v0, 0x0

    iput-object v0, v1, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    :cond_3
    sget-boolean v0, Lcom/bumptech/glide/request/SingleRequest;->oF:Z

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "finished onSizeReady in "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, v1, Lcom/bumptech/glide/request/SingleRequest;->startTime:J

    invoke-static {v2, v3}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/bumptech/glide/request/SingleRequest;->F(Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method public pause()V
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/request/SingleRequest;->clear()V

    sget-object v0, Lcom/bumptech/glide/request/SingleRequest$Status;->oU:Lcom/bumptech/glide/request/SingleRequest$Status;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oL:Lcom/bumptech/glide/request/SingleRequest$Status;

    return-void
.end method

.method public recycle()V
    .locals 2

    invoke-direct {p0}, Lcom/bumptech/glide/request/SingleRequest;->ei()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->context:Landroid/content/Context;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->an:Lcom/bumptech/glide/e;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bt:Ljava/lang/Object;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bq:Ljava/lang/Class;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->br:Lcom/bumptech/glide/request/f;

    const/4 v1, -0x1

    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->ow:I

    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->ov:I

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oI:Lcom/bumptech/glide/request/target/n;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->bu:Lcom/bumptech/glide/request/e;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oG:Lcom/bumptech/glide/request/e;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oH:Lcom/bumptech/glide/request/d;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oJ:Lcom/bumptech/glide/request/a/g;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oK:Lcom/bumptech/glide/load/engine/Engine$b;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oM:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->ot:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/SingleRequest;->oy:Landroid/graphics/drawable/Drawable;

    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->width:I

    iput v1, p0, Lcom/bumptech/glide/request/SingleRequest;->height:I

    sget-object v0, Lcom/bumptech/glide/request/SingleRequest;->gP:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p0}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method

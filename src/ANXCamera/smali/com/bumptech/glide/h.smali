.class public Lcom/bumptech/glide/h;
.super Ljava/lang/Object;
.source "RequestBuilder.java"

# interfaces
.implements Lcom/bumptech/glide/g;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TranscodeType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/g<",
        "Lcom/bumptech/glide/h<",
        "TTranscodeType;>;>;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field protected static final cu:Lcom/bumptech/glide/request/f;


# instance fields
.field private final bB:Lcom/bumptech/glide/request/f;

.field private final bJ:Lcom/bumptech/glide/i;

.field private final bj:Lcom/bumptech/glide/c;

.field private final bp:Lcom/bumptech/glide/e;

.field private cA:Lcom/bumptech/glide/h;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field private cB:Lcom/bumptech/glide/h;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field private cC:Ljava/lang/Float;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private cD:Z

.field private cE:Z

.field private cF:Z

.field private final context:Landroid/content/Context;

.field private final cv:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field

.field protected cw:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private cx:Lcom/bumptech/glide/j;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/j<",
            "*-TTranscodeType;>;"
        }
    .end annotation
.end field

.field private cy:Ljava/lang/Object;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private cz:Lcom/bumptech/glide/request/e;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    sget-object v1, Lcom/bumptech/glide/load/engine/g;->gW:Lcom/bumptech/glide/load/engine/g;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/Priority;->ca:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/h;->cu:Lcom/bumptech/glide/request/f;

    return-void
.end method

.method protected constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/i;Ljava/lang/Class;Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/c;",
            "Lcom/bumptech/glide/i;",
            "Ljava/lang/Class<",
            "TTranscodeType;>;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/h;->cD:Z

    iput-object p1, p0, Lcom/bumptech/glide/h;->bj:Lcom/bumptech/glide/c;

    iput-object p2, p0, Lcom/bumptech/glide/h;->bJ:Lcom/bumptech/glide/i;

    iput-object p3, p0, Lcom/bumptech/glide/h;->cv:Ljava/lang/Class;

    invoke-virtual {p2}, Lcom/bumptech/glide/i;->S()Lcom/bumptech/glide/request/f;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/h;->bB:Lcom/bumptech/glide/request/f;

    iput-object p4, p0, Lcom/bumptech/glide/h;->context:Landroid/content/Context;

    invoke-virtual {p2, p3}, Lcom/bumptech/glide/i;->b(Ljava/lang/Class;)Lcom/bumptech/glide/j;

    move-result-object p2

    iput-object p2, p0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    iget-object p2, p0, Lcom/bumptech/glide/h;->bB:Lcom/bumptech/glide/request/f;

    iput-object p2, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->N()Lcom/bumptech/glide/e;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Lcom/bumptech/glide/h;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/h<",
            "*>;)V"
        }
    .end annotation

    iget-object v0, p2, Lcom/bumptech/glide/h;->bj:Lcom/bumptech/glide/c;

    iget-object v1, p2, Lcom/bumptech/glide/h;->bJ:Lcom/bumptech/glide/i;

    iget-object v2, p2, Lcom/bumptech/glide/h;->context:Landroid/content/Context;

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/bumptech/glide/h;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/i;Ljava/lang/Class;Landroid/content/Context;)V

    iget-object p1, p2, Lcom/bumptech/glide/h;->cy:Ljava/lang/Object;

    iput-object p1, p0, Lcom/bumptech/glide/h;->cy:Ljava/lang/Object;

    iget-boolean p1, p2, Lcom/bumptech/glide/h;->cE:Z

    iput-boolean p1, p0, Lcom/bumptech/glide/h;->cE:Z

    iget-object p1, p2, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    iput-object p1, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    return-void
.end method

.method private a(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;
    .locals 2
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/h$2;->cJ:[I

    invoke-virtual {p1}, Lcom/bumptech/glide/Priority;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "unknown priority: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v1}, Lcom/bumptech/glide/request/f;->aY()Lcom/bumptech/glide/Priority;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    sget-object p1, Lcom/bumptech/glide/Priority;->bX:Lcom/bumptech/glide/Priority;

    return-object p1

    :pswitch_1
    sget-object p1, Lcom/bumptech/glide/Priority;->bY:Lcom/bumptech/glide/Priority;

    return-object p1

    :pswitch_2
    sget-object p1, Lcom/bumptech/glide/Priority;->bZ:Lcom/bumptech/glide/Priority;

    return-object p1

    nop

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;
    .locals 14
    .param p2    # Lcom/bumptech/glide/request/e;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/request/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/d;",
            "Lcom/bumptech/glide/j<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Lcom/bumptech/glide/request/f;",
            ")",
            "Lcom/bumptech/glide/request/c;"
        }
    .end annotation

    move-object v9, p0

    nop

    iget-object v0, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/a;

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/bumptech/glide/request/a;-><init>(Lcom/bumptech/glide/request/d;)V

    nop

    move-object v3, v0

    move-object v13, v3

    goto :goto_0

    :cond_0
    move-object/from16 v1, p3

    const/4 v0, 0x0

    move-object v13, v0

    move-object v3, v1

    :goto_0
    move-object v0, v9

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;

    move-result-object v0

    if-nez v13, :cond_1

    return-object v0

    :cond_1
    iget-object v1, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v1, v1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v1}, Lcom/bumptech/glide/request/f;->eD()I

    move-result v1

    iget-object v2, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v2, v2, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v2}, Lcom/bumptech/glide/request/f;->eF()I

    move-result v2

    invoke-static/range {p6 .. p7}, Lcom/bumptech/glide/util/k;->t(II)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v3, v3, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v3}, Lcom/bumptech/glide/request/f;->eE()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual/range {p8 .. p8}, Lcom/bumptech/glide/request/f;->eD()I

    move-result v1

    invoke-virtual/range {p8 .. p8}, Lcom/bumptech/glide/request/f;->eF()I

    move-result v2

    :cond_2
    move v10, v1

    move v11, v2

    iget-object v4, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v1, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v8, v1, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    iget-object v1, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v1, v1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v1}, Lcom/bumptech/glide/request/f;->aY()Lcom/bumptech/glide/Priority;

    move-result-object v1

    iget-object v2, v9, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    iget-object v12, v2, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    move-object v5, p1

    move-object/from16 v6, p2

    move-object v7, v13

    move-object v9, v1

    invoke-direct/range {v4 .. v12}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Lcom/bumptech/glide/request/a;->a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V

    return-object v13
.end method

.method private a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/c;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/f;",
            "Lcom/bumptech/glide/request/d;",
            "Lcom/bumptech/glide/j<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II)",
            "Lcom/bumptech/glide/request/c;"
        }
    .end annotation

    move-object v0, p0

    iget-object v1, v0, Lcom/bumptech/glide/h;->context:Landroid/content/Context;

    iget-object v2, v0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    iget-object v3, v0, Lcom/bumptech/glide/h;->cy:Ljava/lang/Object;

    iget-object v4, v0, Lcom/bumptech/glide/h;->cv:Ljava/lang/Class;

    iget-object v10, v0, Lcom/bumptech/glide/h;->cz:Lcom/bumptech/glide/request/e;

    iget-object v0, v0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->U()Lcom/bumptech/glide/load/engine/Engine;

    move-result-object v12

    invoke-virtual/range {p5 .. p5}, Lcom/bumptech/glide/j;->ao()Lcom/bumptech/glide/request/a/g;

    move-result-object v13

    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object/from16 v4, p3

    move/from16 v5, p7

    move/from16 v6, p8

    move-object/from16 v7, p6

    move-object v8, p1

    move-object/from16 v9, p2

    move-object/from16 v11, p4

    invoke-static/range {v0 .. v13}, Lcom/bumptech/glide/request/SingleRequest;->a(Landroid/content/Context;Lcom/bumptech/glide/e;Ljava/lang/Object;Ljava/lang/Class;Lcom/bumptech/glide/request/f;IILcom/bumptech/glide/Priority;Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/request/SingleRequest;

    move-result-object v0

    return-object v0
.end method

.method private a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/target/n;
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/e;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;>(TY;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/f;",
            ")TY;"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v0, p0, Lcom/bumptech/glide/h;->cE:Z

    if-eqz v0, :cond_2

    invoke-virtual {p3}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;

    move-result-object p2

    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dR()Lcom/bumptech/glide/request/c;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p3, v0}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/c;)Z

    move-result p3

    if-nez p3, :cond_1

    invoke-interface {p2}, Lcom/bumptech/glide/request/c;->recycle()V

    invoke-static {v0}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/bumptech/glide/request/c;

    invoke-interface {p2}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    :cond_0
    return-object p1

    :cond_1
    iget-object p3, p0, Lcom/bumptech/glide/h;->bJ:Lcom/bumptech/glide/i;

    invoke-virtual {p3, p1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    invoke-interface {p1, p2}, Lcom/bumptech/glide/request/target/n;->j(Lcom/bumptech/glide/request/c;)V

    iget-object p3, p0, Lcom/bumptech/glide/h;->bJ:Lcom/bumptech/glide/i;

    invoke-virtual {p3, p1, p2}, Lcom/bumptech/glide/i;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/c;)V

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "You must call #load() before calling #into()"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private a(Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/c;)Z
    .locals 0

    invoke-virtual {p1}, Lcom/bumptech/glide/request/f;->eB()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-interface {p2}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private b(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;
    .locals 19
    .param p3    # Lcom/bumptech/glide/request/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/d;",
            "Lcom/bumptech/glide/j<",
            "*-TTranscodeType;>;",
            "Lcom/bumptech/glide/Priority;",
            "II",
            "Lcom/bumptech/glide/request/f;",
            ")",
            "Lcom/bumptech/glide/request/c;"
        }
    .end annotation

    move-object/from16 v9, p0

    move-object/from16 v4, p3

    move-object/from16 v10, p5

    iget-object v0, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    if-eqz v0, :cond_4

    iget-boolean v0, v9, Lcom/bumptech/glide/h;->cF:Z

    if-nez v0, :cond_3

    iget-object v0, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v0, v0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    iget-object v1, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-boolean v1, v1, Lcom/bumptech/glide/h;->cD:Z

    if-eqz v1, :cond_0

    nop

    move-object/from16 v14, p4

    goto :goto_0

    :cond_0
    move-object v14, v0

    :goto_0
    iget-object v0, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v0, v0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eC()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v0, v0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->aY()Lcom/bumptech/glide/Priority;

    move-result-object v0

    :goto_1
    move-object v15, v0

    goto :goto_2

    :cond_1
    invoke-direct {v9, v10}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;

    move-result-object v0

    goto :goto_1

    :goto_2
    iget-object v0, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v0, v0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eD()I

    move-result v0

    iget-object v1, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v1, v1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v1}, Lcom/bumptech/glide/request/f;->eF()I

    move-result v1

    invoke-static/range {p6 .. p7}, Lcom/bumptech/glide/util/k;->t(II)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v2, v2, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v2}, Lcom/bumptech/glide/request/f;->eE()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual/range {p8 .. p8}, Lcom/bumptech/glide/request/f;->eD()I

    move-result v0

    invoke-virtual/range {p8 .. p8}, Lcom/bumptech/glide/request/f;->eF()I

    move-result v1

    :cond_2
    move/from16 v16, v0

    move/from16 v17, v1

    new-instance v13, Lcom/bumptech/glide/request/h;

    invoke-direct {v13, v4}, Lcom/bumptech/glide/request/h;-><init>(Lcom/bumptech/glide/request/d;)V

    nop

    move-object v0, v9

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p8

    move-object v4, v13

    move-object/from16 v5, p4

    move-object v6, v10

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/c;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v9, Lcom/bumptech/glide/h;->cF:Z

    iget-object v10, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v1, v9, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    iget-object v1, v1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object v2, v13

    move-object/from16 v18, v1

    invoke-direct/range {v10 .. v18}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;

    move-result-object v1

    const/4 v3, 0x0

    iput-boolean v3, v9, Lcom/bumptech/glide/h;->cF:Z

    invoke-virtual {v2, v0, v1}, Lcom/bumptech/glide/request/h;->a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V

    return-object v2

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use a request as both the main request and a thumbnail, consider using clone() on the request(s) passed to thumbnail()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    iget-object v0, v9, Lcom/bumptech/glide/h;->cC:Ljava/lang/Float;

    if-eqz v0, :cond_5

    new-instance v11, Lcom/bumptech/glide/request/h;

    invoke-direct {v11, v4}, Lcom/bumptech/glide/request/h;-><init>(Lcom/bumptech/glide/request/d;)V

    nop

    move-object v0, v9

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p8

    move-object v4, v11

    move-object/from16 v5, p4

    move-object v6, v10

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/c;

    move-result-object v12

    invoke-virtual/range {p8 .. p8}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    iget-object v1, v9, Lcom/bumptech/glide/h;->cC:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->h(F)Lcom/bumptech/glide/request/f;

    move-result-object v3

    nop

    invoke-direct {v9, v10}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/Priority;

    move-result-object v6

    move-object v0, v9

    move-object/from16 v1, p1

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/c;

    move-result-object v0

    invoke-virtual {v11, v12, v0}, Lcom/bumptech/glide/request/h;->a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V

    return-object v11

    :cond_5
    move-object v0, v9

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p8

    move-object/from16 v5, p4

    move-object v6, v10

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;II)Lcom/bumptech/glide/request/c;

    move-result-object v0

    return-object v0
.end method

.method private b(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;
    .locals 9
    .param p2    # Lcom/bumptech/glide/request/e;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;",
            "Lcom/bumptech/glide/request/f;",
            ")",
            "Lcom/bumptech/glide/request/c;"
        }
    .end annotation

    iget-object v4, p0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    invoke-virtual {p3}, Lcom/bumptech/glide/request/f;->aY()Lcom/bumptech/glide/Priority;

    move-result-object v5

    invoke-virtual {p3}, Lcom/bumptech/glide/request/f;->eD()I

    move-result v6

    invoke-virtual {p3}, Lcom/bumptech/glide/request/f;->eF()I

    move-result v7

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/d;Lcom/bumptech/glide/j;Lcom/bumptech/glide/Priority;IILcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/c;

    move-result-object p1

    return-object p1
.end method

.method private k(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/h;->cy:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/bumptech/glide/h;->cE:Z

    return-object p0
.end method


# virtual methods
.method protected X()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/h;->bB:Lcom/bumptech/glide/request/f;

    iget-object v1, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    :goto_0
    return-object v0
.end method

.method public Y()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/h;

    iget-object v1, v0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v1}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    iget-object v1, v0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    invoke-virtual {v1}, Lcom/bumptech/glide/j;->an()Lcom/bumptech/glide/j;

    move-result-object v1

    iput-object v1, v0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public Z()Lcom/bumptech/glide/request/b;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/b<",
            "TTranscodeType;>;"
        }
    .end annotation

    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0, v0}, Lcom/bumptech/glide/h;->h(II)Lcom/bumptech/glide/request/b;

    move-result-object v0

    return-object v0
.end method

.method public a(F)Lcom/bumptech/glide/h;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/h;->cC:Ljava/lang/Float;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sizeMultiplier must be between 0 and 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Lcom/bumptech/glide/h;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/h;->cB:Lcom/bumptech/glide/h;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/j;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Lcom/bumptech/glide/j;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/j<",
            "*-TTranscodeType;>;)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/j;

    iput-object p1, p0, Lcom/bumptech/glide/h;->cx:Lcom/bumptech/glide/j;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/bumptech/glide/h;->cD:Z

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/request/e;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/e;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/h;->cz:Lcom/bumptech/glide/request/e;

    return-object p0
.end method

.method public varargs a([Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;
    .locals 3
    .param p1    # [Lcom/bumptech/glide/h;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    array-length v1, p1

    if-nez v1, :cond_0

    goto :goto_2

    :cond_0
    nop

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_3

    aget-object v2, p1, v1

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    if-nez v0, :cond_2

    nop

    move-object v0, v2

    goto :goto_1

    :cond_2
    invoke-virtual {v2, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;

    move-result-object v0

    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_3
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1

    :cond_4
    :goto_2
    check-cast v0, Lcom/bumptech/glide/h;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
    .locals 3
    .param p1    # Landroid/widget/ImageView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ImageView;",
            ")",
            "Lcom/bumptech/glide/request/target/ViewTarget<",
            "Landroid/widget/ImageView;",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eb()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ea()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/bumptech/glide/h$2;->cI:[I

    invoke-virtual {p1}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eh()Lcom/bumptech/glide/request/f;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ef()Lcom/bumptech/glide/request/f;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eh()Lcom/bumptech/glide/request/f;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ed()Lcom/bumptech/glide/request/f;

    move-result-object v0

    nop

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    iget-object v2, p0, Lcom/bumptech/glide/h;->cv:Ljava/lang/Class;

    invoke-virtual {v1, p1, v2}, Lcom/bumptech/glide/e;->a(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/ViewTarget;

    move-result-object p1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/target/n;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/request/target/ViewTarget;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;)Lcom/bumptech/glide/request/target/n;
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/e;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;>(TY;",
            "Lcom/bumptech/glide/request/e<",
            "TTranscodeType;>;)TY;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/h;->X()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/target/n;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Landroid/net/Uri;)Ljava/lang/Object;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Landroid/net/Uri;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/io/File;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Ljava/io/File;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/lang/Integer;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(Ljava/net/URL;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Ljava/net/URL;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a([B)Ljava/lang/Object;
    .locals 0
    .param p1    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b([B)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public aa()Lcom/bumptech/glide/request/target/n;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;"
        }
    .end annotation

    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0, v0}, Lcom/bumptech/glide/h;->i(II)Lcom/bumptech/glide/request/target/n;

    move-result-object v0

    return-object v0
.end method

.method protected ab()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/h;

    const-class v1, Ljava/io/File;

    invoke-direct {v0, v1, p0}, Lcom/bumptech/glide/h;-><init>(Ljava/lang/Class;Lcom/bumptech/glide/h;)V

    sget-object v1, Lcom/bumptech/glide/h;->cu:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->gV:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->gV:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/net/Uri;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/h;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Lcom/bumptech/glide/h;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/h;->cA:Lcom/bumptech/glide/h;

    return-object p0
.end method

.method public b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/f;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/bumptech/glide/h;->X()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    return-object p0
.end method

.method public b(Ljava/io/File;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/Nullable;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    iget-object v0, p0, Lcom/bumptech/glide/h;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/bumptech/glide/e/a;->n(Landroid/content/Context;)Lcom/bumptech/glide/load/c;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->j(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/net/URL;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b([B)Lcom/bumptech/glide/h;
    .locals 1
    .param p1    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    iget-object v0, p1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->er()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->gV:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    :cond_0
    iget-object v0, p1, Lcom/bumptech/glide/h;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->es()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->i(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public b(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;>(TY;)TY;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;)Lcom/bumptech/glide/request/target/n;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Y::",
            "Lcom/bumptech/glide/request/target/n<",
            "Ljava/io/File;",
            ">;>(TY;)TY;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/h;->ab()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;

    move-result-object p1

    return-object p1
.end method

.method public synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/h;->Y()Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public g(II)Lcom/bumptech/glide/request/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/bumptech/glide/request/b<",
            "TTranscodeType;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/h;->h(II)Lcom/bumptech/glide/request/b;

    move-result-object p1

    return-object p1
.end method

.method public h(II)Lcom/bumptech/glide/request/b;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/bumptech/glide/request/b<",
            "TTranscodeType;>;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/RequestFutureTarget;

    iget-object v1, p0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/e;->T()Landroid/os/Handler;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lcom/bumptech/glide/request/RequestFutureTarget;-><init>(Landroid/os/Handler;II)V

    invoke-static {}, Lcom/bumptech/glide/util/k;->fq()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/h;->bp:Lcom/bumptech/glide/e;

    invoke-virtual {p1}, Lcom/bumptech/glide/e;->T()Landroid/os/Handler;

    move-result-object p1

    new-instance p2, Lcom/bumptech/glide/h$1;

    invoke-direct {p2, p0, v0}, Lcom/bumptech/glide/h$1;-><init>(Lcom/bumptech/glide/h;Lcom/bumptech/glide/request/RequestFutureTarget;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0, v0}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/e;)Lcom/bumptech/glide/request/target/n;

    :goto_0
    return-object v0
.end method

.method public i(II)Lcom/bumptech/glide/request/target/n;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/bumptech/glide/request/target/n<",
            "TTranscodeType;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/h;->bJ:Lcom/bumptech/glide/i;

    invoke-static {v0, p1, p2}, Lcom/bumptech/glide/request/target/k;->b(Lcom/bumptech/glide/i;II)Lcom/bumptech/glide/request/target/k;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/target/n;)Lcom/bumptech/glide/request/target/n;

    move-result-object p1

    return-object p1
.end method

.method public j(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public j(II)Lcom/bumptech/glide/request/b;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/bumptech/glide/request/b<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/h;->ab()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/h;->h(II)Lcom/bumptech/glide/request/b;

    move-result-object p1

    return-object p1
.end method

.method public synthetic l(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->m(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public synthetic load(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/h;->j(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public m(Ljava/lang/String;)Lcom/bumptech/glide/h;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/bumptech/glide/h<",
            "TTranscodeType;>;"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/h;->k(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

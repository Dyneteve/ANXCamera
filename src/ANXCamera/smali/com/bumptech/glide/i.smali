.class public Lcom/bumptech/glide/i;
.super Ljava/lang/Object;
.source "RequestManager.java"

# interfaces
.implements Lcom/bumptech/glide/g;
.implements Lcom/bumptech/glide/manager/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/i$a;,
        Lcom/bumptech/glide/i$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/g<",
        "Lcom/bumptech/glide/h<",
        "Landroid/graphics/drawable/Drawable;",
        ">;>;",
        "Lcom/bumptech/glide/manager/i;"
    }
.end annotation


# static fields
.field private static final cK:Lcom/bumptech/glide/request/f;

.field private static final cL:Lcom/bumptech/glide/request/f;

.field private static final cu:Lcom/bumptech/glide/request/f;


# instance fields
.field private final bF:Landroid/os/Handler;

.field protected final bj:Lcom/bumptech/glide/c;

.field final cM:Lcom/bumptech/glide/manager/h;

.field private final cN:Lcom/bumptech/glide/manager/n;

.field private final cO:Lcom/bumptech/glide/manager/m;

.field private final cP:Lcom/bumptech/glide/manager/o;

.field private final cQ:Ljava/lang/Runnable;

.field private final cR:Lcom/bumptech/glide/manager/c;

.field protected final context:Landroid/content/Context;

.field private cw:Lcom/bumptech/glide/request/f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->en()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->cK:Lcom/bumptech/glide/request/f;

    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->en()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->cL:Lcom/bumptech/glide/request/f;

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->gW:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/Priority;->ca:Lcom/bumptech/glide/Priority;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/i;->cu:Lcom/bumptech/glide/request/f;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Landroid/content/Context;)V
    .locals 7
    .param p1    # Lcom/bumptech/glide/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/manager/h;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/manager/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v4, Lcom/bumptech/glide/manager/n;

    invoke-direct {v4}, Lcom/bumptech/glide/manager/n;-><init>()V

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->M()Lcom/bumptech/glide/manager/d;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/i;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/n;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V

    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/manager/h;Lcom/bumptech/glide/manager/m;Lcom/bumptech/glide/manager/n;Lcom/bumptech/glide/manager/d;Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/manager/o;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/o;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    new-instance v0, Lcom/bumptech/glide/i$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/i$1;-><init>(Lcom/bumptech/glide/i;)V

    iput-object v0, p0, Lcom/bumptech/glide/i;->cQ:Ljava/lang/Runnable;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/bumptech/glide/i;->bF:Landroid/os/Handler;

    iput-object p1, p0, Lcom/bumptech/glide/i;->bj:Lcom/bumptech/glide/c;

    iput-object p2, p0, Lcom/bumptech/glide/i;->cM:Lcom/bumptech/glide/manager/h;

    iput-object p3, p0, Lcom/bumptech/glide/i;->cO:Lcom/bumptech/glide/manager/m;

    iput-object p4, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    iput-object p6, p0, Lcom/bumptech/glide/i;->context:Landroid/content/Context;

    nop

    invoke-virtual {p6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    new-instance p6, Lcom/bumptech/glide/i$b;

    invoke-direct {p6, p4}, Lcom/bumptech/glide/i$b;-><init>(Lcom/bumptech/glide/manager/n;)V

    invoke-interface {p5, p3, p6}, Lcom/bumptech/glide/manager/d;->a(Landroid/content/Context;Lcom/bumptech/glide/manager/c$a;)Lcom/bumptech/glide/manager/c;

    move-result-object p3

    iput-object p3, p0, Lcom/bumptech/glide/i;->cR:Lcom/bumptech/glide/manager/c;

    invoke-static {}, Lcom/bumptech/glide/util/k;->fq()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/bumptech/glide/i;->bF:Landroid/os/Handler;

    iget-object p4, p0, Lcom/bumptech/glide/i;->cQ:Ljava/lang/Runnable;

    invoke-virtual {p3, p4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-interface {p2, p0}, Lcom/bumptech/glide/manager/h;->a(Lcom/bumptech/glide/manager/i;)V

    :goto_0
    iget-object p3, p0, Lcom/bumptech/glide/i;->cR:Lcom/bumptech/glide/manager/c;

    invoke-interface {p2, p3}, Lcom/bumptech/glide/manager/h;->a(Lcom/bumptech/glide/manager/i;)V

    invoke-virtual {p1}, Lcom/bumptech/glide/c;->N()Lcom/bumptech/glide/e;

    move-result-object p2

    invoke-virtual {p2}, Lcom/bumptech/glide/e;->S()Lcom/bumptech/glide/request/f;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/i;->c(Lcom/bumptech/glide/request/f;)V

    invoke-virtual {p1, p0}, Lcom/bumptech/glide/c;->a(Lcom/bumptech/glide/i;)V

    return-void
.end method

.method private d(Lcom/bumptech/glide/request/f;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/i;->cw:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/i;->cw:Lcom/bumptech/glide/request/f;

    return-void
.end method

.method private e(Lcom/bumptech/glide/request/target/n;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->f(Lcom/bumptech/glide/request/target/n;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/i;->bj:Lcom/bumptech/glide/c;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/c;->a(Lcom/bumptech/glide/request/target/n;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dR()Lcom/bumptech/glide/request/c;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dR()Lcom/bumptech/glide/request/c;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Lcom/bumptech/glide/request/target/n;->j(Lcom/bumptech/glide/request/c;)V

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    :cond_0
    return-void
.end method


# virtual methods
.method S()Lcom/bumptech/glide/request/f;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/i;->cw:Lcom/bumptech/glide/request/f;

    return-object v0
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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Landroid/net/Uri;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/io/File;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b(Ljava/net/URL;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->b([B)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method a(Lcom/bumptech/glide/request/target/n;Lcom/bumptech/glide/request/c;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;",
            "Lcom/bumptech/glide/request/c;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/manager/o;->g(Lcom/bumptech/glide/request/target/n;)V

    iget-object p1, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {p1, p2}, Lcom/bumptech/glide/manager/n;->a(Lcom/bumptech/glide/request/c;)V

    return-void
.end method

.method public ac()V
    .locals 1

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->ac()V

    return-void
.end method

.method public ad()V
    .locals 1

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->ad()V

    return-void
.end method

.method public ae()V
    .locals 2

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->ac()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cO:Lcom/bumptech/glide/manager/m;

    invoke-interface {v0}, Lcom/bumptech/glide/manager/m;->dy()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/i;

    invoke-virtual {v1}, Lcom/bumptech/glide/i;->ac()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public af()V
    .locals 1

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->af()V

    return-void
.end method

.method public ag()V
    .locals 2

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->af()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cO:Lcom/bumptech/glide/manager/m;

    invoke-interface {v0}, Lcom/bumptech/glide/manager/m;->dy()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/i;

    invoke-virtual {v1}, Lcom/bumptech/glide/i;->af()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public ah()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->c(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->cK:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public ai()Lcom/bumptech/glide/h;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Lcom/bumptech/glide/load/resource/gif/b;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->c(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->cL:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public aj()Lcom/bumptech/glide/h;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/h<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    const-class v0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->c(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public ak()Lcom/bumptech/glide/h;
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

    const-class v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->c(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/i;->cu:Lcom/bumptech/glide/request/f;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    return-object v0
.end method

.method public al()Lcom/bumptech/glide/h;
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

    const-class v0, Ljava/io/File;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->c(Ljava/lang/Class;)Lcom/bumptech/glide/h;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/bumptech/glide/request/f;->i(Z)Lcom/bumptech/glide/request/f;

    move-result-object v1

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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/net/Uri;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Landroid/net/Uri;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/io/File;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/io/File;)Lcom/bumptech/glide/h;

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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/net/URL;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b(Ljava/net/URL;)Lcom/bumptech/glide/h;

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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->b([B)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method b(Ljava/lang/Class;)Lcom/bumptech/glide/j;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/bumptech/glide/j<",
            "*TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/i;->bj:Lcom/bumptech/glide/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/c;->N()Lcom/bumptech/glide/e;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/e;->b(Ljava/lang/Class;)Lcom/bumptech/glide/j;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/bumptech/glide/i$a;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/i$a;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    return-void
.end method

.method public c(Ljava/lang/Class;)Lcom/bumptech/glide/h;
    .locals 3
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ResourceType:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TResourceType;>;)",
            "Lcom/bumptech/glide/h<",
            "TResourceType;>;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/h;

    iget-object v1, p0, Lcom/bumptech/glide/i;->bj:Lcom/bumptech/glide/c;

    iget-object v2, p0, Lcom/bumptech/glide/i;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p1, v2}, Lcom/bumptech/glide/h;-><init>(Lcom/bumptech/glide/c;Lcom/bumptech/glide/i;Ljava/lang/Class;Landroid/content/Context;)V

    return-object v0
.end method

.method protected c(Lcom/bumptech/glide/request/f;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p1}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/i;->cw:Lcom/bumptech/glide/request/f;

    return-void
.end method

.method public d(Lcom/bumptech/glide/request/target/n;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/bumptech/glide/util/k;->fp()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/bumptech/glide/i;->e(Lcom/bumptech/glide/request/target/n;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/i;->bF:Landroid/os/Handler;

    new-instance v1, Lcom/bumptech/glide/i$2;

    invoke-direct {v1, p0, p1}, Lcom/bumptech/glide/i$2;-><init>(Lcom/bumptech/glide/i;Lcom/bumptech/glide/request/target/n;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method public e(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/i;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-direct {p0, p1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/f;)V

    return-object p0
.end method

.method public f(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/i;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->c(Lcom/bumptech/glide/request/f;)V

    return-object p0
.end method

.method f(Lcom/bumptech/glide/request/target/n;)Z
    .locals 3
    .param p1    # Lcom/bumptech/glide/request/target/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/target/n<",
            "*>;)Z"
        }
    .end annotation

    invoke-interface {p1}, Lcom/bumptech/glide/request/target/n;->dR()Lcom/bumptech/glide/request/c;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v2, v0}, Lcom/bumptech/glide/manager/n;->b(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/manager/o;->h(Lcom/bumptech/glide/request/target/n;)V

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/bumptech/glide/request/target/n;->j(Lcom/bumptech/glide/request/c;)V

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isPaused()Z
    .locals 1

    invoke-static {}, Lcom/bumptech/glide/util/k;->fn()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->isPaused()Z

    move-result v0

    return v0
.end method

.method public j(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->j(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public l(Ljava/lang/Object;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->ak()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->j(Ljava/lang/Object;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->m(Ljava/lang/String;)Lcom/bumptech/glide/h;

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

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/i;->j(Ljava/lang/Object;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public m(Ljava/lang/String;)Lcom/bumptech/glide/h;
    .locals 1
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
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->aj()Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/h;->m(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object p1

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onDestroy()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->getAll()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/request/target/n;

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/i;->d(Lcom/bumptech/glide/request/target/n;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->clear()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/n;->dF()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cM:Lcom/bumptech/glide/manager/h;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/manager/h;->b(Lcom/bumptech/glide/manager/i;)V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cM:Lcom/bumptech/glide/manager/h;

    iget-object v1, p0, Lcom/bumptech/glide/i;->cR:Lcom/bumptech/glide/manager/c;

    invoke-interface {v0, v1}, Lcom/bumptech/glide/manager/h;->b(Lcom/bumptech/glide/manager/i;)V

    iget-object v0, p0, Lcom/bumptech/glide/i;->bF:Landroid/os/Handler;

    iget-object v1, p0, Lcom/bumptech/glide/i;->cQ:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/bumptech/glide/i;->bj:Lcom/bumptech/glide/c;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/c;->b(Lcom/bumptech/glide/i;)V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->af()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/i;->ac()V

    iget-object v0, p0, Lcom/bumptech/glide/i;->cP:Lcom/bumptech/glide/manager/o;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/o;->onStop()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "{tracker="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/i;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", treeNode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/i;->cO:Lcom/bumptech/glide/manager/m;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

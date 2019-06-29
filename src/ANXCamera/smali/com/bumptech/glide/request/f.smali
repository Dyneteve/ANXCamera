.class public Lcom/bumptech/glide/request/f;
.super Ljava/lang/Object;
.source "RequestOptions.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final PRIORITY:I = 0x8

.field private static final UNSET:I = -0x1

.field private static final oP:I = 0x2

.field private static final oQ:I = 0x4

.field private static final oR:I = 0x10

.field private static final oS:I = 0x20

.field private static final oT:I = 0x40

.field private static final oU:I = 0x80

.field private static final oV:I = 0x100

.field private static final oW:I = 0x200

.field private static final oX:I = 0x400

.field private static final oY:I = 0x800

.field private static final oZ:I = 0x1000

.field private static final pa:I = 0x2000

.field private static final pb:I = 0x4000

.field private static final pc:I = 0x8000

.field private static final pd:I = 0x10000

.field private static final pe:I = 0x20000

.field private static final pf:I = 0x40000

.field private static final pg:I = 0x80000

.field private static final ph:I = 0x100000

.field private static pi:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pj:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pk:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pl:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pm:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pn:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static po:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private static pp:Lcom/bumptech/glide/request/f;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# instance fields
.field private fE:Z

.field private fP:Lcom/bumptech/glide/load/c;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private fR:Lcom/bumptech/glide/load/f;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private fT:Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private fV:Ljava/util/Map;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;"
        }
    .end annotation
.end field

.field private fY:Lcom/bumptech/glide/Priority;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private fZ:Lcom/bumptech/glide/load/engine/g;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private ga:Z

.field private gb:Z

.field private gn:Z

.field private hA:Z

.field private isLocked:Z

.field private pA:I

.field private pB:Landroid/content/res/Resources$Theme;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private pC:Z

.field private pD:Z

.field private pq:I

.field private pr:F

.field private ps:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private pt:I

.field private pu:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private pv:I

.field private pw:I

.field private px:I

.field private py:Z

.field private pz:Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/bumptech/glide/request/f;->pr:F

    sget-object v0, Lcom/bumptech/glide/load/engine/g;->gY:Lcom/bumptech/glide/load/engine/g;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    sget-object v0, Lcom/bumptech/glide/Priority;->bZ:Lcom/bumptech/glide/Priority;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->fE:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/bumptech/glide/request/f;->pw:I

    iput v1, p0, Lcom/bumptech/glide/request/f;->px:I

    nop

    invoke-static {}, Lcom/bumptech/glide/e/b;->fj()Lcom/bumptech/glide/e/b;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    new-instance v1, Lcom/bumptech/glide/load/f;

    invoke-direct {v1}, Lcom/bumptech/glide/load/f;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    new-instance v1, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;

    invoke-direct {v1}, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;-><init>()V

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    const-class v1, Ljava/lang/Object;

    iput-object v1, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->gb:Z

    return-void
.end method

.method public static M(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->R(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static N(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->T(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static O(I)Lcom/bumptech/glide/request/f;
    .locals 0
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {p0, p0}, Lcom/bumptech/glide/request/f;->n(II)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static P(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->W(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static Q(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x64L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->V(I)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/DecodeFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/engine/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/i;
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
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/p;

    invoke-direct {v0, p1, p2}, Lcom/bumptech/glide/load/resource/bitmap/p;-><init>(Lcom/bumptech/glide/load/i;Z)V

    const-class v1, Landroid/graphics/Bitmap;

    invoke-direct {p0, v1, p1, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    const-class v1, Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1, v0, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    const-class v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/resource/bitmap/p;->cW()Lcom/bumptech/glide/load/i;

    move-result-object v0

    invoke-direct {p0, v1, v0, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    const-class v0, Lcom/bumptech/glide/load/resource/gif/b;

    new-instance v1, Lcom/bumptech/glide/load/resource/gif/e;

    invoke-direct {v1, p1}, Lcom/bumptech/glide/load/resource/gif/e;-><init>(Lcom/bumptech/glide/load/i;)V

    invoke-direct {p0, v0, v1, p2}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    if-eqz p3, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    :goto_0
    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/bumptech/glide/request/f;->gb:Z

    return-object p1
.end method

.method private a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/load/i<",
            "TT;>;Z)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-direct {v0, p1, p2, p3}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x800

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->py:Z

    iget p2, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v0, 0x10000

    or-int/2addr p2, v0

    iput p2, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/bumptech/glide/request/f;->gb:Z

    if-eqz p3, :cond_1

    iget p2, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 p3, 0x20000

    or-int/2addr p2, p3

    iput p2, p0, Lcom/bumptech/glide/request/f;->pq:I

    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->ga:Z

    :cond_1
    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static b(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static b(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/e<",
            "TT;>;TT;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static d(J)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # J
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->e(J)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public static dT()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->pk:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eg()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->pk:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->pk:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dU()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->pl:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ei()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->pl:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->pl:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dV()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->pm:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ee()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->pm:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->pm:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dW()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->pn:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->ek()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->pn:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->pn:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dX()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->po:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->el()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->po:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->po:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public static dY()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/request/f;->pp:Lcom/bumptech/glide/request/f;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->em()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/request/f;->pp:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object v0, Lcom/bumptech/glide/request/f;->pp:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method private ep()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot modify locked RequestOptions, consider clone()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static g(F)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->h(F)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static g(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static h(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static i(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    if-eqz p0, :cond_1

    sget-object p0, Lcom/bumptech/glide/request/f;->pi:Lcom/bumptech/glide/request/f;

    if-nez p0, :cond_0

    new-instance p0, Lcom/bumptech/glide/request/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object p0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object p0

    sput-object p0, Lcom/bumptech/glide/request/f;->pi:Lcom/bumptech/glide/request/f;

    :cond_0
    sget-object p0, Lcom/bumptech/glide/request/f;->pi:Lcom/bumptech/glide/request/f;

    return-object p0

    :cond_1
    sget-object p0, Lcom/bumptech/glide/request/f;->pj:Lcom/bumptech/glide/request/f;

    if-nez p0, :cond_2

    new-instance p0, Lcom/bumptech/glide/request/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object p0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->eo()Lcom/bumptech/glide/request/f;

    move-result-object p0

    sput-object p0, Lcom/bumptech/glide/request/f;->pj:Lcom/bumptech/glide/request/f;

    :cond_2
    sget-object p0, Lcom/bumptech/glide/request/f;->pj:Lcom/bumptech/glide/request/f;

    return-object p0
.end method

.method private isSet(I)Z
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-static {v0, p1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result p1

    return p1
.end method

.method public static j(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method public static n(II)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/bumptech/glide/request/f;->p(II)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method

.method private static o(II)Z
    .locals 0

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static p(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p0    # Ljava/lang/Class;
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
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/request/f;->q(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public R(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->R(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->pv:I

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x80

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public S(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->S(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->pA:I

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x4000

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public T(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->T(I)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->pt:I

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x20

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public U(I)Lcom/bumptech/glide/request/f;
    .locals 0
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1, p1}, Lcom/bumptech/glide/request/f;->p(II)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public V(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x64L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->lC:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public W(I)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/model/a/b;->lx:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/res/Resources$Theme;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->a(Landroid/content/res/Resources$Theme;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const v0, 0x8000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method final a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/load/i<",
            "TT;>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public varargs a([Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # [Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/load/d;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/d;-><init>([Lcom/bumptech/glide/load/i;)V

    const/4 p1, 0x1

    invoke-direct {p0, v0, p1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final aX()Lcom/bumptech/glide/load/engine/g;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    return-object v0
.end method

.method public final aY()Lcom/bumptech/glide/Priority;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    return-object v0
.end method

.method public final aZ()Lcom/bumptech/glide/load/f;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    return-object v0
.end method

.method public b(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/e;->lD:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/load/DecodeFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/n;->mn:Lcom/bumptech/glide/load/e;

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/resource/gif/g;->mn:Lcom/bumptech/glide/load/e;

    invoke-virtual {v0, v1, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/engine/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/engine/g;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/g;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x4

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/i;
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
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mj:Lcom/bumptech/glide/load/e;

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method final b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
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
            "Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/f;

    invoke-virtual {p0, p2}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Class;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/bumptech/glide/load/i<",
            "TT;>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/bumptech/glide/request/f;->a(Ljava/lang/Class;Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final bG()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    return-object v0
.end method

.method public final ba()Lcom/bumptech/glide/load/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    return-object v0
.end method

.method be()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->gb:Z

    return v0
.end method

.method public c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/Priority;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/e<",
            "TT;>;TT;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/load/f;

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public c(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/i;
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
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;Z)Lcom/bumptech/glide/request/f;

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

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public dZ()Lcom/bumptech/glide/request/f;
    .locals 3
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/request/f;

    new-instance v1, Lcom/bumptech/glide/load/f;

    invoke-direct {v1}, Lcom/bumptech/glide/load/f;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    iget-object v1, v0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    iget-object v2, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/f;)V

    new-instance v1, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;

    invoke-direct {v1}, Lcom/bumptech/glide/util/CachedHashCodeArrayMap;-><init>()V

    iput-object v1, v0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    iget-object v1, v0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    iget-object v2, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/bumptech/glide/request/f;->isLocked:Z

    iput-boolean v1, v0, Lcom/bumptech/glide/request/f;->pC:Z
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public e(J)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # J
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/VideoDecoder;->mV:Lcom/bumptech/glide/load/e;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final eA()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final eB()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->fE:Z

    return v0
.end method

.method public final eC()Z
    .locals 1

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final eD()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->px:I

    return v0
.end method

.method public final eE()Z
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/request/f;->px:I

    iget v1, p0, Lcom/bumptech/glide/request/f;->pw:I

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/k;->t(II)Z

    move-result v0

    return v0
.end method

.method public final eF()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pw:I

    return v0
.end method

.method public final eG()F
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pr:F

    return v0
.end method

.method public final eH()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pD:Z

    return v0
.end method

.method public final eI()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->hA:Z

    return v0
.end method

.method public final eJ()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->gn:Z

    return v0
.end method

.method public final ea()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    return v0
.end method

.method public final eb()Z
    .locals 1

    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public ec()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/n;->mq:Lcom/bumptech/glide/load/e;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ed()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->md:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/j;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/j;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ee()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->md:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/j;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/j;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ef()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mc:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/q;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/q;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public eg()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mc:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/q;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/q;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public eh()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mg:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/k;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/k;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->d(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ei()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mg:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/k;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/k;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ej()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->md:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/l;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/l;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public ek()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->mg:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    new-instance v1, Lcom/bumptech/glide/load/resource/bitmap/l;

    invoke-direct {v1}, Lcom/bumptech/glide/load/resource/bitmap/l;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->b(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public el()Lcom/bumptech/glide/request/f;
    .locals 3
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/f;->el()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ga:Z

    iget v1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const v2, -0x20001

    and-int/2addr v1, v2

    iput v1, p0, Lcom/bumptech/glide/request/f;->pq:I

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x10000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->gb:Z

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public em()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/resource/gif/g;->nK:Lcom/bumptech/glide/load/e;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/bumptech/glide/request/f;->c(Lcom/bumptech/glide/load/e;Ljava/lang/Object;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method public en()Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    return-object p0
.end method

.method public eo()Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot auto lock an already locked options object, try clone() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->en()Lcom/bumptech/glide/request/f;

    move-result-object v0

    return-object v0
.end method

.method protected eq()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Lcom/bumptech/glide/request/f;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Lcom/bumptech/glide/request/f;

    iget v0, p1, Lcom/bumptech/glide/request/f;->pr:F

    iget v2, p0, Lcom/bumptech/glide/request/f;->pr:F

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->pt:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->pt:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->pv:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->pv:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->pA:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->pA:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->fE:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->fE:Z

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->pw:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->pw:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/bumptech/glide/request/f;->px:I

    iget v2, p1, Lcom/bumptech/glide/request/f;->px:I

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->ga:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->ga:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->py:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pD:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->pD:Z

    if-ne v0, v2, :cond_0

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->gn:Z

    iget-boolean v2, p1, Lcom/bumptech/glide/request/f;->gn:Z

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/load/f;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    iget-object v2, p1, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    invoke-static {v0, v2}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    iget-object p1, p1, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    invoke-static {v0, p1}, Lcom/bumptech/glide/util/k;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public final er()Z
    .locals 1

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final es()Z
    .locals 1

    const/16 v0, 0x100

    invoke-direct {p0, v0}, Lcom/bumptech/glide/request/f;->isSet(I)Z

    move-result v0

    return v0
.end method

.method public final et()Ljava/util/Map;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    return-object v0
.end method

.method public final eu()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->ga:Z

    return v0
.end method

.method public final ev()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final ew()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pt:I

    return v0
.end method

.method public final ex()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pv:I

    return v0
.end method

.method public final ey()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public final ez()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/request/f;->pA:I

    return v0
.end method

.method public g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->g(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p1, Lcom/bumptech/glide/request/f;->pr:F

    iput v0, p0, Lcom/bumptech/glide/request/f;->pr:F

    :cond_1
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x40000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->pD:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->pD:Z

    :cond_2
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x100000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->hA:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->hA:Z

    :cond_3
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    :cond_4
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    :cond_5
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x10

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    :cond_6
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x20

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_7

    iget v0, p1, Lcom/bumptech/glide/request/f;->pt:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->pt:I

    :cond_7
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x40

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    :cond_8
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x80

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_9

    iget v0, p1, Lcom/bumptech/glide/request/f;->pv:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->pv:I

    :cond_9
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x100

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->fE:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->fE:Z

    :cond_a
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x200

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_b

    iget v0, p1, Lcom/bumptech/glide/request/f;->px:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->px:I

    iget v0, p1, Lcom/bumptech/glide/request/f;->pw:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->pw:I

    :cond_b
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x400

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    :cond_c
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x1000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    :cond_d
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x2000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    :cond_e
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x4000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_f

    iget v0, p1, Lcom/bumptech/glide/request/f;->pA:I

    iput v0, p0, Lcom/bumptech/glide/request/f;->pA:I

    :cond_f
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const v1, 0x8000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p1, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    iput-object v0, p0, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    :cond_10
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x10000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->py:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    :cond_11
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x20000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->ga:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ga:Z

    :cond_12
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/16 v1, 0x800

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    iget-object v1, p1, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->gb:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->gb:Z

    :cond_13
    iget v0, p1, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v1, 0x80000

    invoke-static {v0, v1}, Lcom/bumptech/glide/request/f;->o(II)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-boolean v0, p1, Lcom/bumptech/glide/request/f;->gn:Z

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->gn:Z

    :cond_14
    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->py:Z

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    and-int/lit16 v0, v0, -0x801

    iput v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->ga:Z

    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const v1, -0x20001

    and-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/request/f;->gb:Z

    :cond_15
    iget v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    iget v1, p1, Lcom/bumptech/glide/request/f;->pq:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/request/f;->pq:I

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    iget-object p1, p1, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/f;)V

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final getTheme()Landroid/content/res/Resources$Theme;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    return-object v0
.end method

.method public h(F)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->h(F)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_1

    iput p1, p0, Lcom/bumptech/glide/request/f;->pr:F

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sizeMultiplier must be between 0 and 1"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/request/f;->pr:F

    invoke-static {v0}, Lcom/bumptech/glide/util/k;->hashCode(F)I

    move-result v0

    iget v1, p0, Lcom/bumptech/glide/request/f;->pt:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->u(II)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget v1, p0, Lcom/bumptech/glide/request/f;->pv:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->u(II)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget v1, p0, Lcom/bumptech/glide/request/f;->pA:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->u(II)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->fE:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->c(ZI)I

    move-result v0

    iget v1, p0, Lcom/bumptech/glide/request/f;->pw:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->u(II)I

    move-result v0

    iget v1, p0, Lcom/bumptech/glide/request/f;->px:I

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->u(II)I

    move-result v0

    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->ga:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->c(ZI)I

    move-result v0

    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->py:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->c(ZI)I

    move-result v0

    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->pD:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->c(ZI)I

    move-result v0

    iget-boolean v1, p0, Lcom/bumptech/glide/request/f;->gn:Z

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->c(ZI)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fZ:Lcom/bumptech/glide/load/engine/g;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fY:Lcom/bumptech/glide/Priority;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fR:Lcom/bumptech/glide/load/f;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fV:Ljava/util/Map;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    iget-object v1, p0, Lcom/bumptech/glide/request/f;->pB:Landroid/content/res/Resources$Theme;

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/k;->a(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->pu:Landroid/graphics/drawable/Drawable;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x40

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public final isLocked()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->isLocked:Z

    return v0
.end method

.method public j(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->j(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->pz:Landroid/graphics/drawable/Drawable;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x2000

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public j(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->j(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->pD:Z

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v0, 0x40000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->k(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-object p1, p0, Lcom/bumptech/glide/request/f;->ps:Landroid/graphics/drawable/Drawable;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit8 p1, p1, 0x10

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->k(Lcom/bumptech/glide/load/c;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/c;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->fP:Lcom/bumptech/glide/load/c;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x400

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public k(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->k(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->hA:Z

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v0, 0x100000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public l(Z)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->l(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->gn:Z

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    const/high16 v0, 0x80000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public m(Z)Lcom/bumptech/glide/request/f;
    .locals 2
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/bumptech/glide/request/f;->m(Z)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    xor-int/2addr p1, v1

    iput-boolean p1, p0, Lcom/bumptech/glide/request/f;->fE:Z

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x100

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public p(II)Lcom/bumptech/glide/request/f;
    .locals 1
    .annotation build Landroid/support/annotation/CheckResult;
    .end annotation

    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/f;->p(II)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    iput p1, p0, Lcom/bumptech/glide/request/f;->px:I

    iput p2, p0, Lcom/bumptech/glide/request/f;->pw:I

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x200

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

.method public q(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;
    .locals 1
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
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/bumptech/glide/request/f;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/request/f;->pC:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/request/f;->dZ()Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/f;->q(Ljava/lang/Class;)Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Class;

    iput-object p1, p0, Lcom/bumptech/glide/request/f;->fT:Ljava/lang/Class;

    iget p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    or-int/lit16 p1, p1, 0x1000

    iput p1, p0, Lcom/bumptech/glide/request/f;->pq:I

    invoke-direct {p0}, Lcom/bumptech/glide/request/f;->ep()Lcom/bumptech/glide/request/f;

    move-result-object p1

    return-object p1
.end method

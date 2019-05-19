.class public final Lcom/bumptech/glide/load/engine/a/l$a;
.super Ljava/lang/Object;
.source "MemorySizeCalculator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/a/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final MEMORY_CACHE_TARGET_SCREENS:I = 0x2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final il:I

.field static final im:F = 0.4f

.field static final io:F = 0.33f

.field static final ip:I = 0x400000


# instance fields
.field final context:Landroid/content/Context;

.field iA:F

.field iB:I

.field iq:Landroid/app/ActivityManager;

.field ir:Lcom/bumptech/glide/load/engine/a/l$c;

.field iu:F

.field iv:F

.field iz:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput v0, Lcom/bumptech/glide/load/engine/a/l$a;->il:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iu:F

    sget v0, Lcom/bumptech/glide/load/engine/a/l$a;->il:I

    int-to-float v0, v0

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iv:F

    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iz:F

    const v0, 0x3ea8f5c3    # 0.33f

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iA:F

    const/high16 v0, 0x400000

    iput v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iB:I

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->context:Landroid/content/Context;

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iq:Landroid/app/ActivityManager;

    new-instance v0, Lcom/bumptech/glide/load/engine/a/l$b;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/engine/a/l$b;-><init>(Landroid/util/DisplayMetrics;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$a;->ir:Lcom/bumptech/glide/load/engine/a/l$c;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p1, v0, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iq:Landroid/app/ActivityManager;

    invoke-static {p1}, Lcom/bumptech/glide/load/engine/a/l;->a(Landroid/app/ActivityManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iv:F

    :cond_0
    return-void
.end method


# virtual methods
.method public bJ()Lcom/bumptech/glide/load/engine/a/l;
    .locals 1

    new-instance v0, Lcom/bumptech/glide/load/engine/a/l;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/a/l;-><init>(Lcom/bumptech/glide/load/engine/a/l$a;)V

    return-object v0
.end method

.method public c(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Memory cache screens must be greater than or equal to 0"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iu:F

    return-object p0
.end method

.method public d(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Bitmap pool screens must be greater than or equal to 0"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iv:F

    return-object p0
.end method

.method public e(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Size multiplier must be between 0 and 1"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iz:F

    return-object p0
.end method

.method public f(F)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Low memory max size multiplier must be between 0 and 1"

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/i;->a(ZLjava/lang/String;)V

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iA:F

    return-object p0
.end method

.method setActivityManager(Landroid/app/ActivityManager;)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iq:Landroid/app/ActivityManager;

    return-object p0
.end method

.method setScreenDimensions(Lcom/bumptech/glide/load/engine/a/l$c;)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->ir:Lcom/bumptech/glide/load/engine/a/l$c;

    return-object p0
.end method

.method public x(I)Lcom/bumptech/glide/load/engine/a/l$a;
    .locals 0

    iput p1, p0, Lcom/bumptech/glide/load/engine/a/l$a;->iB:I

    return-object p0
.end method

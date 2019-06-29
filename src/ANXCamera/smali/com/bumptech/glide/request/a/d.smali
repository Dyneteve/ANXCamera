.class public Lcom/bumptech/glide/request/a/d;
.super Ljava/lang/Object;
.source "DrawableCrossFadeTransition.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/f<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final duration:I

.field private final qC:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/bumptech/glide/request/a/d;->duration:I

    iput-boolean p2, p0, Lcom/bumptech/glide/request/a/d;->qC:Z

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/a/f$a;)Z
    .locals 4

    invoke-interface {p2}, Lcom/bumptech/glide/request/a/f$a;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    :cond_0
    new-instance v2, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v3, v1

    const/4 v0, 0x1

    aput-object p1, v3, v0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iget-boolean p1, p0, Lcom/bumptech/glide/request/a/d;->qC:Z

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    iget p1, p0, Lcom/bumptech/glide/request/a/d;->duration:I

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    invoke-interface {p2, v2}, Lcom/bumptech/glide/request/a/f$a;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    return v0
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f$a;)Z
    .locals 0

    check-cast p1, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2}, Lcom/bumptech/glide/request/a/d;->a(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/a/f$a;)Z

    move-result p1

    return p1
.end method

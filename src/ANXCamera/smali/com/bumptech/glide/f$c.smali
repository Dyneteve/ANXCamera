.class final Lcom/bumptech/glide/f$c;
.super Lcom/bumptech/glide/request/target/b;
.source "ListPreloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/b<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field aQ:I

.field aR:I


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/request/target/b;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/request/target/m;)V
    .locals 2
    .param p1    # Lcom/bumptech/glide/request/target/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget v0, p0, Lcom/bumptech/glide/f$c;->aR:I

    iget v1, p0, Lcom/bumptech/glide/f$c;->aQ:I

    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/request/target/m;->p(II)V

    return-void
.end method

.method public a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/request/a/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/request/a/f<",
            "-",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public b(Lcom/bumptech/glide/request/target/m;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/target/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

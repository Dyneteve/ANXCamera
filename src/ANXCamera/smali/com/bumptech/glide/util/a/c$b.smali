.class Lcom/bumptech/glide/util/a/c$b;
.super Lcom/bumptech/glide/util/a/c;
.source "StateVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/util/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private volatile fA:Z


# direct methods
.method constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/util/a/c;-><init>(Lcom/bumptech/glide/util/a/c$1;)V

    return-void
.end method


# virtual methods
.method public eT()V
    .locals 2

    iget-boolean v0, p0, Lcom/bumptech/glide/util/a/c$b;->fA:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public o(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/bumptech/glide/util/a/c$b;->fA:Z

    return-void
.end method

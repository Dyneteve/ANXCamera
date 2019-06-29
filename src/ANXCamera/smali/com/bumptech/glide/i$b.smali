.class Lcom/bumptech/glide/i$b;
.super Ljava/lang/Object;
.source "RequestManager.java"

# interfaces
.implements Lcom/bumptech/glide/manager/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private final cN:Lcom/bumptech/glide/manager/n;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/manager/n;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/n;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/i$b;->cN:Lcom/bumptech/glide/manager/n;

    return-void
.end method


# virtual methods
.method public d(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/i$b;->cN:Lcom/bumptech/glide/manager/n;

    invoke-virtual {p1}, Lcom/bumptech/glide/manager/n;->dG()V

    :cond_0
    return-void
.end method

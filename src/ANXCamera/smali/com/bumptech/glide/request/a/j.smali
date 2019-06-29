.class public Lcom/bumptech/glide/request/a/j;
.super Ljava/lang/Object;
.source "ViewPropertyTransition.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/a/j$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/f<",
        "TR;>;"
    }
.end annotation


# instance fields
.field private final qJ:Lcom/bumptech/glide/request/a/j$a;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/request/a/j$a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/a/j;->qJ:Lcom/bumptech/glide/request/a/j$a;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/bumptech/glide/request/a/f$a;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Lcom/bumptech/glide/request/a/f$a;",
            ")Z"
        }
    .end annotation

    invoke-interface {p2}, Lcom/bumptech/glide/request/a/f$a;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/request/a/j;->qJ:Lcom/bumptech/glide/request/a/j$a;

    invoke-interface {p2}, Lcom/bumptech/glide/request/a/f$a;->getView()Landroid/view/View;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/bumptech/glide/request/a/j$a;->d(Landroid/view/View;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

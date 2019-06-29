.class public abstract Lcom/bumptech/glide/request/a/a;
.super Ljava/lang/Object;
.source "BitmapContainerTransitionFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/a/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/g<",
        "TR;>;"
    }
.end annotation


# instance fields
.field private final qz:Lcom/bumptech/glide/request/a/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/request/a/g<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/request/a/g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/request/a/g<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/a/a;->qz:Lcom/bumptech/glide/request/a/g;

    return-void
.end method


# virtual methods
.method protected abstract B(Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation
.end method

.method public a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/DataSource;",
            "Z)",
            "Lcom/bumptech/glide/request/a/f<",
            "TR;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/a/a;->qz:Lcom/bumptech/glide/request/a/g;

    invoke-interface {v0, p1, p2}, Lcom/bumptech/glide/request/a/g;->a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    new-instance p2, Lcom/bumptech/glide/request/a/a$a;

    invoke-direct {p2, p0, p1}, Lcom/bumptech/glide/request/a/a$a;-><init>(Lcom/bumptech/glide/request/a/a;Lcom/bumptech/glide/request/a/f;)V

    return-object p2
.end method

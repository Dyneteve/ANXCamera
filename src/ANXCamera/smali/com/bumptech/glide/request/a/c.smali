.class public Lcom/bumptech/glide/request/a/c;
.super Ljava/lang/Object;
.source "DrawableCrossFadeFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/g;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/a/c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/a/g<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final duration:I

.field private final qC:Z

.field private qD:Lcom/bumptech/glide/request/a/d;


# direct methods
.method protected constructor <init>(IZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/bumptech/glide/request/a/c;->duration:I

    iput-boolean p2, p0, Lcom/bumptech/glide/request/a/c;->qC:Z

    return-void
.end method

.method private ff()Lcom/bumptech/glide/request/a/f;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/request/a/f<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/request/a/c;->qD:Lcom/bumptech/glide/request/a/d;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bumptech/glide/request/a/d;

    iget v1, p0, Lcom/bumptech/glide/request/a/c;->duration:I

    iget-boolean v2, p0, Lcom/bumptech/glide/request/a/c;->qC:Z

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/request/a/d;-><init>(IZ)V

    iput-object v0, p0, Lcom/bumptech/glide/request/a/c;->qD:Lcom/bumptech/glide/request/a/d;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a/c;->qD:Lcom/bumptech/glide/request/a/d;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/a/f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/DataSource;",
            "Z)",
            "Lcom/bumptech/glide/request/a/f<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    sget-object p2, Lcom/bumptech/glide/load/DataSource;->el:Lcom/bumptech/glide/load/DataSource;

    if-ne p1, p2, :cond_0

    invoke-static {}, Lcom/bumptech/glide/request/a/e;->fi()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/request/a/c;->ff()Lcom/bumptech/glide/request/a/f;

    move-result-object p1

    :goto_0
    return-object p1
.end method

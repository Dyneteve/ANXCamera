.class Lcom/bumptech/glide/load/model/b$c;
.super Ljava/lang/Object;
.source "ByteArrayLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/d<",
        "TData;>;"
    }
.end annotation


# instance fields
.field private final ku:Lcom/bumptech/glide/load/model/b$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/b$b<",
            "TData;>;"
        }
    .end annotation
.end field

.field private final kw:[B


# direct methods
.method constructor <init>([BLcom/bumptech/glide/load/model/b$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/bumptech/glide/load/model/b$b<",
            "TData;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/model/b$c;->kw:[B

    iput-object p2, p0, Lcom/bumptech/glide/load/model/b$c;->ku:Lcom/bumptech/glide/load/model/b$b;

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V
    .locals 1
    .param p1    # Lcom/bumptech/glide/Priority;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/a/d$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/a/d$a<",
            "-TData;>;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/bumptech/glide/load/model/b$c;->ku:Lcom/bumptech/glide/load/model/b$b;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/b$c;->kw:[B

    invoke-interface {p1, v0}, Lcom/bumptech/glide/load/model/b$b;->h([B)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/a/d$a;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public aJ()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TData;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/model/b$c;->ku:Lcom/bumptech/glide/load/model/b$b;

    invoke-interface {v0}, Lcom/bumptech/glide/load/model/b$b;->aJ()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public aK()Lcom/bumptech/glide/load/DataSource;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->eh:Lcom/bumptech/glide/load/DataSource;

    return-object v0
.end method

.method public cancel()V
    .locals 0

    return-void
.end method

.method public cleanup()V
    .locals 0

    return-void
.end method

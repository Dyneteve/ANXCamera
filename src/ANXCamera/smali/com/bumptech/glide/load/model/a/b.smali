.class public Lcom/bumptech/glide/load/model/a/b;
.super Ljava/lang/Object;
.source "HttpGlideUrlLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/a/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/m<",
        "Lcom/bumptech/glide/load/model/g;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field public static final kw:Lcom/bumptech/glide/load/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/e<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final kv:Lcom/bumptech/glide/load/model/ModelCache;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/ModelCache<",
            "Lcom/bumptech/glide/load/model/g;",
            "Lcom/bumptech/glide/load/model/g;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "com.bumptech.glide.load.model.stream.HttpGlideUrlLoader.Timeout"

    const/16 v1, 0x9c4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bumptech/glide/load/e;->a(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/e;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/model/a/b;->kw:Lcom/bumptech/glide/load/e;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/model/a/b;-><init>(Lcom/bumptech/glide/load/model/ModelCache;)V

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/model/ModelCache;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/model/ModelCache;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/ModelCache<",
            "Lcom/bumptech/glide/load/model/g;",
            "Lcom/bumptech/glide/load/model/g;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/model/a/b;->kv:Lcom/bumptech/glide/load/model/ModelCache;

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/model/g;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/model/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/g;",
            "II",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/model/m$a<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    nop

    iget-object p2, p0, Lcom/bumptech/glide/load/model/a/b;->kv:Lcom/bumptech/glide/load/model/ModelCache;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/bumptech/glide/load/model/a/b;->kv:Lcom/bumptech/glide/load/model/ModelCache;

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3, p3}, Lcom/bumptech/glide/load/model/ModelCache;->c(Ljava/lang/Object;II)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/bumptech/glide/load/model/g;

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/bumptech/glide/load/model/a/b;->kv:Lcom/bumptech/glide/load/model/ModelCache;

    invoke-virtual {p2, p1, p3, p3, p1}, Lcom/bumptech/glide/load/model/ModelCache;->a(Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    move-object p1, p2

    :cond_1
    :goto_0
    sget-object p2, Lcom/bumptech/glide/load/model/a/b;->kw:Lcom/bumptech/glide/load/e;

    invoke-virtual {p4, p2}, Lcom/bumptech/glide/load/f;->a(Lcom/bumptech/glide/load/e;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    new-instance p3, Lcom/bumptech/glide/load/model/m$a;

    new-instance p4, Lcom/bumptech/glide/load/a/j;

    invoke-direct {p4, p1, p2}, Lcom/bumptech/glide/load/a/j;-><init>(Lcom/bumptech/glide/load/model/g;I)V

    invoke-direct {p3, p1, p4}, Lcom/bumptech/glide/load/model/m$a;-><init>(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/a/d;)V

    return-object p3
.end method

.method public a(Lcom/bumptech/glide/load/model/g;)Z
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/model/g;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 p1, 0x1

    return p1
.end method

.method public synthetic b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/bumptech/glide/load/model/g;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/model/a/b;->a(Lcom/bumptech/glide/load/model/g;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object p1

    return-object p1
.end method

.method public synthetic q(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/bumptech/glide/load/model/g;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/model/a/b;->a(Lcom/bumptech/glide/load/model/g;)Z

    move-result p1

    return p1
.end method

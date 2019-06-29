.class public Lcom/bumptech/glide/load/model/f$a;
.super Ljava/lang/Object;
.source "FileLoader.java"

# interfaces
.implements Lcom/bumptech/glide/load/model/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/model/n<",
        "Ljava/io/File;",
        "TData;>;"
    }
.end annotation


# instance fields
.field private final kG:Lcom/bumptech/glide/load/model/f$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/f$d<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/model/f$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/f$d<",
            "TData;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/model/f$a;->kG:Lcom/bumptech/glide/load/model/f$d;

    return-void
.end method


# virtual methods
.method public final a(Lcom/bumptech/glide/load/model/q;)Lcom/bumptech/glide/load/model/m;
    .locals 1
    .param p1    # Lcom/bumptech/glide/load/model/q;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/model/q;",
            ")",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/io/File;",
            "TData;>;"
        }
    .end annotation

    new-instance p1, Lcom/bumptech/glide/load/model/f;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/f$a;->kG:Lcom/bumptech/glide/load/model/f$d;

    invoke-direct {p1, v0}, Lcom/bumptech/glide/load/model/f;-><init>(Lcom/bumptech/glide/load/model/f$d;)V

    return-object p1
.end method

.method public final cA()V
    .locals 0

    return-void
.end method

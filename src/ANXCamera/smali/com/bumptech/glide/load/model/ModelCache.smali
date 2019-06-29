.class public Lcom/bumptech/glide/load/model/ModelCache;
.super Ljava/lang/Object;
.source "ModelCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/model/ModelCache$ModelKey;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEFAULT_SIZE:I = 0xfa


# instance fields
.field private final kV:Lcom/bumptech/glide/util/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/util/f<",
            "Lcom/bumptech/glide/load/model/ModelCache$ModelKey<",
            "TA;>;TB;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/16 v0, 0xfa

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/load/model/ModelCache;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/load/model/ModelCache$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/bumptech/glide/load/model/ModelCache$1;-><init>(Lcom/bumptech/glide/load/model/ModelCache;J)V

    iput-object v0, p0, Lcom/bumptech/glide/load/model/ModelCache;->kV:Lcom/bumptech/glide/util/f;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;IILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;IITB;)V"
        }
    .end annotation

    invoke-static {p1, p2, p3}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->d(Ljava/lang/Object;II)Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/model/ModelCache;->kV:Lcom/bumptech/glide/util/f;

    invoke-virtual {p2, p1, p4}, Lcom/bumptech/glide/util/f;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public c(Ljava/lang/Object;II)Ljava/lang/Object;
    .locals 0
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;II)TB;"
        }
    .end annotation

    invoke-static {p1, p2, p3}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->d(Ljava/lang/Object;II)Lcom/bumptech/glide/load/model/ModelCache$ModelKey;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/model/ModelCache;->kV:Lcom/bumptech/glide/util/f;

    invoke-virtual {p2, p1}, Lcom/bumptech/glide/util/f;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1}, Lcom/bumptech/glide/load/model/ModelCache$ModelKey;->release()V

    return-object p2
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/model/ModelCache;->kV:Lcom/bumptech/glide/util/f;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/f;->O()V

    return-void
.end method

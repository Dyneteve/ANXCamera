.class final Lcom/bumptech/glide/load/engine/a/m$a;
.super Ljava/lang/Object;
.source "SafeKeyGenerator.java"

# interfaces
.implements Lcom/bumptech/glide/util/a/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/a/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final ge:Lcom/bumptech/glide/util/a/c;

.field final messageDigest:Ljava/security/MessageDigest;


# direct methods
.method constructor <init>(Ljava/security/MessageDigest;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/bumptech/glide/util/a/c;->fu()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a/m$a;->ge:Lcom/bumptech/glide/util/a/c;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/m$a;->messageDigest:Ljava/security/MessageDigest;

    return-void
.end method


# virtual methods
.method public bq()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/m$a;->ge:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

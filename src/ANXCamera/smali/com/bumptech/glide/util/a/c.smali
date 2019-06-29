.class public abstract Lcom/bumptech/glide/util/a/c;
.super Ljava/lang/Object;
.source "StateVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/util/a/c$a;,
        Lcom/bumptech/glide/util/a/c$b;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/bumptech/glide/util/a/c$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/util/a/c;-><init>()V

    return-void
.end method

.method public static fu()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/bumptech/glide/util/a/c$b;

    invoke-direct {v0}, Lcom/bumptech/glide/util/a/c$b;-><init>()V

    return-object v0
.end method


# virtual methods
.method public abstract fv()V
.end method

.method abstract o(Z)V
.end method

.class public abstract Lcom/bumptech/glide/c/a;
.super Lcom/bumptech/glide/c/d;
.source "AppGlideModule.java"

# interfaces
.implements Lcom/bumptech/glide/c/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/c/d;-><init>()V

    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;Lcom/bumptech/glide/d;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public dI()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

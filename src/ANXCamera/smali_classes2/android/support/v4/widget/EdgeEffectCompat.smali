.class public Landroid/support/v4/widget/EdgeEffectCompat;
.super Ljava/lang/Object;
.source "EdgeEffectCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectLollipopImpl;,
        Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectIcsImpl;,
        Landroid/support/v4/widget/EdgeEffectCompat$BaseEdgeEffectImpl;,
        Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;
    }
.end annotation


# static fields
.field private static final IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;


# instance fields
.field private mEdgeEffect:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_e

    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectLollipopImpl;

    invoke-direct {v0}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectLollipopImpl;-><init>()V

    sput-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    goto :goto_23

    :cond_e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1c

    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectIcsImpl;

    invoke-direct {v0}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectIcsImpl;-><init>()V

    sput-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    goto :goto_23

    :cond_1c
    new-instance v0, Landroid/support/v4/widget/EdgeEffectCompat$BaseEdgeEffectImpl;

    invoke-direct {v0}, Landroid/support/v4/widget/EdgeEffectCompat$BaseEdgeEffectImpl;-><init>()V

    sput-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    :goto_23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->newEdgeEffect(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)Z
    .registers 4

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->draw(Ljava/lang/Object;Landroid/graphics/Canvas;)Z

    move-result v0

    return v0
.end method

.method public finish()V
    .registers 3

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->finish(Ljava/lang/Object;)V

    return-void
.end method

.method public isFinished()Z
    .registers 3

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->isFinished(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public onAbsorb(I)Z
    .registers 4

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->onAbsorb(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method public onPull(F)Z
    .registers 4

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->onPull(Ljava/lang/Object;F)Z

    move-result v0

    return v0
.end method

.method public onPull(FF)Z
    .registers 5

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->onPull(Ljava/lang/Object;FF)Z

    move-result v0

    return v0
.end method

.method public onRelease()Z
    .registers 3

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->onRelease(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setSize(II)V
    .registers 5

    sget-object v0, Landroid/support/v4/widget/EdgeEffectCompat;->IMPL:Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;

    iget-object v1, p0, Landroid/support/v4/widget/EdgeEffectCompat;->mEdgeEffect:Ljava/lang/Object;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/widget/EdgeEffectCompat$EdgeEffectImpl;->setSize(Ljava/lang/Object;II)V

    return-void
.end method

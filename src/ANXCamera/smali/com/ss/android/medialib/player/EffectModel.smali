.class public Lcom/ss/android/medialib/player/EffectModel;
.super Ljava/lang/Object;
.source "EffectModel.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field private end:I

.field private index:I

.field private start:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    iput p2, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    iput p3, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    return-void
.end method


# virtual methods
.method public getEnd()I
    .locals 1

    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    return v0
.end method

.method public getIndex()I
    .locals 1

    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    return v0
.end method

.method public getStart()I
    .locals 1

    iget v0, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    return v0
.end method

.method public setEnd(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->end:I

    return-void
.end method

.method public setIndex(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->index:I

    return-void
.end method

.method public setStart(I)V
    .locals 0

    iput p1, p0, Lcom/ss/android/medialib/player/EffectModel;->start:I

    return-void
.end method

.class public Lcom/android/camera/ui/autoselectview/SelectItemBean;
.super Ljava/lang/Object;
.source "SelectItemBean.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private alpha:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlpha()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/SelectItemBean;->alpha:I

    return v0
.end method

.method public setAlpha(I)V
    .locals 1

    const/4 v0, 0x1

    if-gt p1, v0, :cond_1

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/android/camera/ui/autoselectview/SelectItemBean;->alpha:I

    return-void

    :cond_1
    :goto_0
    return-void
.end method

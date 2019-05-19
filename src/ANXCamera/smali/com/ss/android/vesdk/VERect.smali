.class public Lcom/ss/android/vesdk/VERect;
.super Ljava/lang/Object;
.source "VERect.java"


# instance fields
.field public height:I

.field public width:I

.field public x:I

.field public y:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->x:I

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->y:I

    const/16 v0, 0x2d0

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->width:I

    const/16 v0, 0x500

    iput v0, p0, Lcom/ss/android/vesdk/VERect;->height:I

    iput p1, p0, Lcom/ss/android/vesdk/VERect;->x:I

    iput p2, p0, Lcom/ss/android/vesdk/VERect;->y:I

    iput p3, p0, Lcom/ss/android/vesdk/VERect;->width:I

    iput p4, p0, Lcom/ss/android/vesdk/VERect;->height:I

    return-void
.end method

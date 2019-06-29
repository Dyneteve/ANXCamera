.class public Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawIntTexAttribute.java"


# instance fields
.field public mHeight:I

.field public mIsSnapshot:Z

.field public mTexId:I

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method public constructor <init>(IIIIIZ)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mX:I

    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mY:I

    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mWidth:I

    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mHeight:I

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mTexId:I

    const/4 p1, 0x6

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mTarget:I

    iput-boolean p6, p0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;->mIsSnapshot:Z

    return-void
.end method

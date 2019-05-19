.class public Lcom/android/camera/effect/renders/DualWatermarkParam;
.super Ljava/lang/Object;
.source "DualWatermarkParam.java"


# instance fields
.field private mIsDualWatermarkEnable:Z

.field private mPaddingX:F

.field private mPaddingY:F

.field private mPath:Ljava/lang/String;

.field private mSize:F


# direct methods
.method public constructor <init>(ZLjava/lang/String;FFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mIsDualWatermarkEnable:Z

    iput-object p2, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    iput p3, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    iput p4, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    iput p5, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    return-void
.end method


# virtual methods
.method public getPaddingX()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingX:F

    return v0
.end method

.method public getPaddingY()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPaddingY:F

    return v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mSize:F

    return v0
.end method

.method public isDualWatermarkEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/DualWatermarkParam;->mIsDualWatermarkEnable:Z

    return v0
.end method

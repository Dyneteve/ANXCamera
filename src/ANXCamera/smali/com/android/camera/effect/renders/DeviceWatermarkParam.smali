.class public Lcom/android/camera/effect/renders/DeviceWatermarkParam;
.super Ljava/lang/Object;
.source "DeviceWatermarkParam.java"


# instance fields
.field private mIsDualWatermarkEnable:Z

.field private mIsFrontWatermarkEnable:Z

.field private mIsUltraMPWatermarkEnable:Z

.field private mPaddingX:F

.field private mPaddingY:F

.field private mPath:Ljava/lang/String;

.field private mSize:F


# direct methods
.method public constructor <init>(ZZZLjava/lang/String;FFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsDualWatermarkEnable:Z

    iput-boolean p2, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsFrontWatermarkEnable:Z

    iput-boolean p3, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsUltraMPWatermarkEnable:Z

    iput-object p4, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPath:Ljava/lang/String;

    iput p5, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mSize:F

    iput p6, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPaddingX:F

    iput p7, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPaddingY:F

    return-void
.end method


# virtual methods
.method public getPaddingX()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPaddingX:F

    return v0
.end method

.method public getPaddingY()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPaddingY:F

    return v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mSize:F

    return v0
.end method

.method public isDualWatermarkEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsDualWatermarkEnable:Z

    return v0
.end method

.method public isFrontWatermarkEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsFrontWatermarkEnable:Z

    return v0
.end method

.method public isUltraWatermarkEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->mIsUltraMPWatermarkEnable:Z

    return v0
.end method

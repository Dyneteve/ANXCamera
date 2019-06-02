.class public Lcom/android/camera/fragment/beauty/MakeupItem;
.super Ljava/lang/Object;
.source "MakeupItem.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

.field private mImageResource:I

.field private mTextResource:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mImageResource:I

    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mTextResource:I

    return-void
.end method

.method public constructor <init>(IILcom/android/camera/fragment/beauty/CameraBeautyParameterType;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mImageResource:I

    iput p2, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mTextResource:I

    iput-object p3, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-void
.end method


# virtual methods
.method public getCameraBeautyParameterType()Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->cameraBeautyParameterType:Lcom/android/camera/fragment/beauty/CameraBeautyParameterType;

    return-object v0
.end method

.method public getImageResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/beauty/MakeupItem;->mTextResource:I

    return v0
.end method

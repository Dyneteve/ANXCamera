.class public final Lcom/ss/android/vesdk/VEDuetSettings;
.super Ljava/lang/Object;
.source "VEDuetSettings.java"


# instance fields
.field private mAlpha:F

.field private mDuetAudioPath:Ljava/lang/String;

.field private mDuetVideoPath:Ljava/lang/String;

.field private mIsFitMode:Z

.field private mXInPercent:F

.field private mYInPercent:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;FFFZ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetVideoPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetAudioPath:Ljava/lang/String;

    iput p3, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mXInPercent:F

    iput p4, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mYInPercent:F

    iput p5, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mAlpha:F

    iput-boolean p6, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mIsFitMode:Z

    return-void
.end method


# virtual methods
.method public getAlpha()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mAlpha:F

    return v0
.end method

.method public getDuetAudioPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetAudioPath:Ljava/lang/String;

    return-object v0
.end method

.method public getDuetVideoPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mDuetVideoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getIsFitMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mIsFitMode:Z

    return v0
.end method

.method public getXInPercent()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mXInPercent:F

    return v0
.end method

.method public getYInPercent()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEDuetSettings;->mYInPercent:F

    return v0
.end method

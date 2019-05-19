.class public final Lcom/ss/android/vesdk/VEReactSettings;
.super Ljava/lang/Object;
.source "VEReactSettings.java"


# instance fields
.field private mAlpha:F

.field private mIsFitMode:Z

.field private mReactAudioPath:Ljava/lang/String;

.field private mReactInitalReagion:[F

.field private mReactPosMarginPercent:[F

.field private mReactVideoPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[F[FFZ)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [F
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [F
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactVideoPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactAudioPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactPosMarginPercent:[F

    iput-object p4, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactInitalReagion:[F

    iput p5, p0, Lcom/ss/android/vesdk/VEReactSettings;->mAlpha:F

    iput-boolean p6, p0, Lcom/ss/android/vesdk/VEReactSettings;->mIsFitMode:Z

    return-void
.end method


# virtual methods
.method public getAlpha()F
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mAlpha:F

    return v0
.end method

.method public getIsFitMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mIsFitMode:Z

    return v0
.end method

.method public getReactAudioPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactAudioPath:Ljava/lang/String;

    return-object v0
.end method

.method public getReactVideoPath()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactVideoPath:Ljava/lang/String;

    return-object v0
.end method

.method public getReactionInitalRegion()[F
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactInitalReagion:[F

    return-object v0
.end method

.method public getReactionPosMargin()[F
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/VEReactSettings;->mReactPosMarginPercent:[F

    return-object v0
.end method

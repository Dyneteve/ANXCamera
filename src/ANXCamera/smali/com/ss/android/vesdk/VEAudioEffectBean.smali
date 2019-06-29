.class public Lcom/ss/android/vesdk/VEAudioEffectBean;
.super Ljava/lang/Object;
.source "VEAudioEffectBean.java"


# instance fields
.field public blockSize:I

.field public centtone:F

.field public formatShiftOn:Z

.field public octative:F

.field public phaseAdjustMethod:I

.field public phaseResetMode:I

.field public pitchTunerMode:I

.field public processChMode:I

.field public semiton:F

.field public smoothOn:Z

.field public speedRatio:F

.field public transientDetectMode:I

.field public type:I

.field public windowMode:I


# direct methods
.method public constructor <init>(IZZIIIIIIIFFFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->type:I

    iput-boolean p2, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->formatShiftOn:Z

    iput-boolean p3, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->smoothOn:Z

    iput p4, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->processChMode:I

    iput p5, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->transientDetectMode:I

    iput p6, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseResetMode:I

    iput p7, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseAdjustMethod:I

    iput p8, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->windowMode:I

    iput p9, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->pitchTunerMode:I

    iput p10, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->blockSize:I

    iput p11, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->centtone:F

    iput p12, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->semiton:F

    iput p13, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->octative:F

    iput p14, p0, Lcom/ss/android/vesdk/VEAudioEffectBean;->speedRatio:F

    return-void
.end method

.class public Lcom/facebook/rebound/Spring;
.super Ljava/lang/Object;
.source "Spring.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/rebound/Spring$PhysicsState;
    }
.end annotation


# static fields
.field private static ID:I = 0x0

.field private static final MAX_DELTA_TIME_SEC:D = 0.064

.field private static final SOLVER_TIMESTEP_SEC:D = 0.001


# instance fields
.field private final mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

.field private mDisplacementFromRestThreshold:D

.field private mEndValue:D

.field private final mId:Ljava/lang/String;

.field private mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/facebook/rebound/SpringListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOvershootClampingEnabled:Z

.field private final mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

.field private mRestSpeedThreshold:D

.field private mSpringConfig:Lcom/facebook/rebound/SpringConfig;

.field private final mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

.field private mStartValue:D

.field private final mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

.field private mTimeAccumulator:D

.field private mWasAtRest:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/facebook/rebound/Spring;->ID:I

    return-void
.end method

.method constructor <init>(Lcom/facebook/rebound/BaseSpringSystem;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/facebook/rebound/Spring$PhysicsState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/rebound/Spring$PhysicsState;-><init>(Lcom/facebook/rebound/Spring$1;)V

    iput-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    new-instance v0, Lcom/facebook/rebound/Spring$PhysicsState;

    invoke-direct {v0, v1}, Lcom/facebook/rebound/Spring$PhysicsState;-><init>(Lcom/facebook/rebound/Spring$1;)V

    iput-object v0, p0, Lcom/facebook/rebound/Spring;->mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

    new-instance v0, Lcom/facebook/rebound/Spring$PhysicsState;

    invoke-direct {v0, v1}, Lcom/facebook/rebound/Spring$PhysicsState;-><init>(Lcom/facebook/rebound/Spring$1;)V

    iput-object v0, p0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    const-wide v0, 0x3f747ae147ae147bL    # 0.005

    iput-wide v0, p0, Lcom/facebook/rebound/Spring;->mRestSpeedThreshold:D

    iput-wide v0, p0, Lcom/facebook/rebound/Spring;->mDisplacementFromRestThreshold:D

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/facebook/rebound/Spring;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "spring:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lcom/facebook/rebound/Spring;->ID:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/facebook/rebound/Spring;->ID:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/rebound/Spring;->mId:Ljava/lang/String;

    sget-object p1, Lcom/facebook/rebound/SpringConfig;->defaultConfig:Lcom/facebook/rebound/SpringConfig;

    invoke-virtual {p0, p1}, Lcom/facebook/rebound/Spring;->setSpringConfig(Lcom/facebook/rebound/SpringConfig;)Lcom/facebook/rebound/Spring;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Spring cannot be created outside of a BaseSpringSystem"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getDisplacementDistanceForState(Lcom/facebook/rebound/Spring$PhysicsState;)D
    .locals 4

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iget-wide v2, p1, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    sub-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private interpolate(D)V
    .locals 7

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-object v1, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v1, v1, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    mul-double/2addr v1, p1

    iget-object v3, p0, Lcom/facebook/rebound/Spring;->mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v3, v3, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v5, p1

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    iput-wide v1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-object v1, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v1, v1, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    mul-double/2addr v1, p1

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide p1, p1, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    mul-double/2addr p1, v5

    add-double/2addr v1, p1

    iput-wide v1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    return-void
.end method


# virtual methods
.method public addListener(Lcom/facebook/rebound/SpringListener;)Lcom/facebook/rebound/Spring;
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "newListener is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method advance(D)V
    .locals 30

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/facebook/rebound/Spring;->isAtRest()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v2, v0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    if-eqz v2, :cond_0

    return-void

    :cond_0
    nop

    const-wide v2, 0x3fb0624dd2f1a9fcL    # 0.064

    cmpl-double v6, p1, v2

    if-lez v6, :cond_1

    goto :goto_0

    :cond_1
    move-wide/from16 v2, p1

    :goto_0
    iget-wide v4, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    add-double/2addr v4, v2

    iput-wide v4, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    iget-object v2, v0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    iget-wide v2, v2, Lcom/facebook/rebound/SpringConfig;->tension:D

    iget-object v4, v0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    iget-wide v4, v4, Lcom/facebook/rebound/SpringConfig;->friction:D

    iget-object v6, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v6, v6, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v8, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v8, v8, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    iget-object v10, v0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v10, v10, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v12, v0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v12, v12, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    :goto_1
    iget-wide v14, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    const-wide v16, 0x3f50624dd2f1a9fcL    # 0.001

    cmpl-double v14, v14, v16

    if-ltz v14, :cond_3

    iget-wide v12, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    sub-double v12, v12, v16

    iput-wide v12, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    iget-wide v12, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    cmpg-double v12, v12, v16

    if-gez v12, :cond_2

    iget-object v12, v0, Lcom/facebook/rebound/Spring;->mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v6, v12, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v12, v0, Lcom/facebook/rebound/Spring;->mPreviousState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v8, v12, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    :cond_2
    nop

    iget-wide v12, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    sub-double/2addr v12, v10

    mul-double/2addr v12, v2

    mul-double v10, v4, v8

    sub-double/2addr v12, v10

    mul-double v10, v8, v16

    const-wide/high16 v14, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v10, v14

    add-double/2addr v10, v6

    mul-double v18, v12, v16

    mul-double v18, v18, v14

    add-double v18, v8, v18

    nop

    iget-wide v14, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    sub-double/2addr v14, v10

    mul-double/2addr v14, v2

    mul-double v10, v4, v18

    sub-double/2addr v14, v10

    mul-double v10, v18, v16

    const-wide/high16 v20, 0x3fe0000000000000L    # 0.5

    mul-double v10, v10, v20

    add-double/2addr v10, v6

    mul-double v22, v14, v16

    mul-double v22, v22, v20

    add-double v22, v8, v22

    nop

    move-wide/from16 v24, v12

    iget-wide v12, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    sub-double/2addr v12, v10

    mul-double/2addr v12, v2

    mul-double v10, v4, v22

    sub-double/2addr v12, v10

    mul-double v10, v22, v16

    add-double/2addr v10, v6

    mul-double v20, v12, v16

    add-double v20, v8, v20

    nop

    move-wide/from16 v26, v6

    iget-wide v6, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    sub-double/2addr v6, v10

    mul-double/2addr v6, v2

    mul-double v28, v4, v20

    sub-double v6, v6, v28

    add-double v18, v18, v22

    const-wide/high16 v22, 0x4000000000000000L    # 2.0

    mul-double v18, v18, v22

    add-double v18, v8, v18

    add-double v18, v18, v20

    const-wide v28, 0x3fc5555555555555L    # 0.16666666666666666

    mul-double v18, v18, v28

    add-double/2addr v14, v12

    mul-double v22, v22, v14

    add-double v12, v24, v22

    add-double/2addr v12, v6

    mul-double v28, v28, v12

    mul-double v18, v18, v16

    add-double v6, v26, v18

    mul-double v28, v28, v16

    add-double v8, v8, v28

    move-wide/from16 v12, v20

    goto/16 :goto_1

    :cond_3
    move-wide/from16 v26, v6

    iget-object v4, v0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v10, v4, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v4, v0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v12, v4, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    iget-object v4, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v6, v4, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v4, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide v8, v4, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    iget-wide v4, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    const-wide/16 v6, 0x0

    cmpl-double v4, v4, v6

    if-lez v4, :cond_4

    iget-wide v4, v0, Lcom/facebook/rebound/Spring;->mTimeAccumulator:D

    div-double v4, v4, v16

    invoke-direct {v0, v4, v5}, Lcom/facebook/rebound/Spring;->interpolate(D)V

    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/rebound/Spring;->isAtRest()Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_5

    iget-boolean v4, v0, Lcom/facebook/rebound/Spring;->mOvershootClampingEnabled:Z

    if-eqz v4, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/facebook/rebound/Spring;->isOvershooting()Z

    move-result v4

    if-eqz v4, :cond_7

    :cond_5
    cmpl-double v1, v2, v6

    if-lez v1, :cond_6

    iget-wide v1, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iput-wide v1, v0, Lcom/facebook/rebound/Spring;->mStartValue:D

    iget-object v1, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v2, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iput-wide v2, v1, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    goto :goto_2

    :cond_6
    iget-object v1, v0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v1, v1, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iput-wide v1, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iget-wide v1, v0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iput-wide v1, v0, Lcom/facebook/rebound/Spring;->mStartValue:D

    :goto_2
    invoke-virtual {v0, v6, v7}, Lcom/facebook/rebound/Spring;->setVelocity(D)Lcom/facebook/rebound/Spring;

    nop

    move v1, v5

    :cond_7
    iget-boolean v2, v0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_8

    iput-boolean v3, v0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    nop

    move v2, v5

    goto :goto_3

    :cond_8
    move v2, v3

    :goto_3
    if-eqz v1, :cond_9

    iput-boolean v5, v0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    nop

    move v3, v5

    :cond_9
    iget-object v1, v0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/rebound/SpringListener;

    if-eqz v2, :cond_a

    invoke-interface {v4, v0}, Lcom/facebook/rebound/SpringListener;->onSpringActivate(Lcom/facebook/rebound/Spring;)V

    :cond_a
    invoke-interface {v4, v0}, Lcom/facebook/rebound/SpringListener;->onSpringUpdate(Lcom/facebook/rebound/Spring;)V

    if-eqz v3, :cond_b

    invoke-interface {v4, v0}, Lcom/facebook/rebound/SpringListener;->onSpringAtRest(Lcom/facebook/rebound/Spring;)V

    :cond_b
    goto :goto_4

    :cond_c
    return-void
.end method

.method public currentValueIsApproximately(D)Z
    .locals 2

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getCurrentValue()D

    move-result-wide v0

    sub-double/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p1

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getRestDisplacementThreshold()D

    move-result-wide v0

    cmpg-double p1, p1, v0

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public destroy()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {v0, p0}, Lcom/facebook/rebound/BaseSpringSystem;->deregisterSpring(Lcom/facebook/rebound/Spring;)V

    return-void
.end method

.method public getCurrentDisplacementDistance()D
    .locals 2

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    invoke-direct {p0, v0}, Lcom/facebook/rebound/Spring;->getDisplacementDistanceForState(Lcom/facebook/rebound/Spring$PhysicsState;)D

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentValue()D
    .locals 2

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v0, v0, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    return-wide v0
.end method

.method public getEndValue()D
    .locals 2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getRestDisplacementThreshold()D
    .locals 2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mDisplacementFromRestThreshold:D

    return-wide v0
.end method

.method public getRestSpeedThreshold()D
    .locals 2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mRestSpeedThreshold:D

    return-wide v0
.end method

.method public getSpringConfig()Lcom/facebook/rebound/SpringConfig;
    .locals 1

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    return-object v0
.end method

.method public getStartValue()D
    .locals 2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mStartValue:D

    return-wide v0
.end method

.method public getVelocity()D
    .locals 2

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v0, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    return-wide v0
.end method

.method public isAtRest()Z
    .locals 4

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v0, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mRestSpeedThreshold:D

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    invoke-direct {p0, v0}, Lcom/facebook/rebound/Spring;->getDisplacementDistanceForState(Lcom/facebook/rebound/Spring$PhysicsState;)D

    move-result-wide v0

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mDisplacementFromRestThreshold:D

    cmpg-double v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    iget-wide v0, v0, Lcom/facebook/rebound/SpringConfig;->tension:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOvershootClampingEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/rebound/Spring;->mOvershootClampingEnabled:Z

    return v0
.end method

.method public isOvershooting()Z
    .locals 4

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    iget-wide v0, v0, Lcom/facebook/rebound/SpringConfig;->tension:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mStartValue:D

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getCurrentValue()D

    move-result-wide v0

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_1

    :cond_0
    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mStartValue:D

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_2

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getCurrentValue()D

    move-result-wide v0

    iget-wide v2, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    cmpg-double v0, v0, v2

    if-gez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeAllListeners()Lcom/facebook/rebound/Spring;
    .locals 1

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    return-object p0
.end method

.method public removeListener(Lcom/facebook/rebound/SpringListener;)Lcom/facebook/rebound/Spring;
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listenerToRemove is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAtRest()Lcom/facebook/rebound/Spring;
    .locals 3

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v0, v0, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iput-wide v0, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mTempState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-object v1, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v1, v1, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iput-wide v1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    return-object p0
.end method

.method public setCurrentValue(D)Lcom/facebook/rebound/Spring;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/rebound/Spring;->setCurrentValue(DZ)Lcom/facebook/rebound/Spring;

    move-result-object p1

    return-object p1
.end method

.method public setCurrentValue(DZ)Lcom/facebook/rebound/Spring;
    .locals 1

    iput-wide p1, p0, Lcom/facebook/rebound/Spring;->mStartValue:D

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide p1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->position:D

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/rebound/BaseSpringSystem;->activateSpring(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/rebound/SpringListener;

    invoke-interface {p2, p0}, Lcom/facebook/rebound/SpringListener;->onSpringUpdate(Lcom/facebook/rebound/Spring;)V

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->setAtRest()Lcom/facebook/rebound/Spring;

    :cond_1
    return-object p0
.end method

.method public setEndValue(D)Lcom/facebook/rebound/Spring;
    .locals 2

    iget-wide v0, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    cmpl-double v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->isAtRest()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getCurrentValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/rebound/Spring;->mStartValue:D

    iput-wide p1, p0, Lcom/facebook/rebound/Spring;->mEndValue:D

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/rebound/BaseSpringSystem;->activateSpring(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/rebound/SpringListener;

    invoke-interface {p2, p0}, Lcom/facebook/rebound/SpringListener;->onSpringEndStateChange(Lcom/facebook/rebound/Spring;)V

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public setOvershootClampingEnabled(Z)Lcom/facebook/rebound/Spring;
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/rebound/Spring;->mOvershootClampingEnabled:Z

    return-object p0
.end method

.method public setRestDisplacementThreshold(D)Lcom/facebook/rebound/Spring;
    .locals 0

    iput-wide p1, p0, Lcom/facebook/rebound/Spring;->mDisplacementFromRestThreshold:D

    return-object p0
.end method

.method public setRestSpeedThreshold(D)Lcom/facebook/rebound/Spring;
    .locals 0

    iput-wide p1, p0, Lcom/facebook/rebound/Spring;->mRestSpeedThreshold:D

    return-object p0
.end method

.method public setSpringConfig(Lcom/facebook/rebound/SpringConfig;)Lcom/facebook/rebound/Spring;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/facebook/rebound/Spring;->mSpringConfig:Lcom/facebook/rebound/SpringConfig;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "springConfig is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setVelocity(D)Lcom/facebook/rebound/Spring;
    .locals 2

    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iget-wide v0, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    cmpl-double v0, p1, v0

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/facebook/rebound/Spring;->mCurrentState:Lcom/facebook/rebound/Spring$PhysicsState;

    iput-wide p1, v0, Lcom/facebook/rebound/Spring$PhysicsState;->velocity:D

    iget-object p1, p0, Lcom/facebook/rebound/Spring;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/rebound/BaseSpringSystem;->activateSpring(Ljava/lang/String;)V

    return-object p0
.end method

.method public systemShouldAdvance()Z
    .locals 1

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->isAtRest()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/facebook/rebound/Spring;->wasAtRest()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public wasAtRest()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/rebound/Spring;->mWasAtRest:Z

    return v0
.end method

.class public Lcom/android/camera/panorama/PositionDetector;
.super Ljava/lang/Object;
.source "PositionDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/PositionDetector$DiffManager;
    }
.end annotation


# static fields
.field public static final COMPLETED:I = 0x1

.field public static final ERROR_IDLE:I = -0x1

.field public static final ERROR_REVERSE:I = -0x2

.field private static final IDLE_THRES_RATIO:I = 0x2

.field private static final IDLE_TIME:J = 0xb2d05e00L

.field public static final OK:I = 0x0

.field private static final PREVIEW_LONG_SIDE_CROP_RATIO:F = 0.8f

.field private static final REVERSE_THRES_RATIO:I = 0x7

.field private static final SPEED_CHECK_CONTINUOUSLY_TIMES:I = 0x5

.field private static final SPEED_CHECK_IGNORE_TIMES:I = 0xf

.field private static final SPEED_CHECK_MODE:I = 0x1

.field private static final SPEED_CHECK_MODE_AVERAGE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "PositionDetector"

.field private static final TOO_FAST_THRES_RATIO:D = 0.8

.field private static final TOO_SLOW_THRES_RATIO:D = 0.05

.field public static final WARNING_TOO_FAST:I = 0x2

.field public static final WARNING_TOO_SLOW:I = 0x3


# instance fields
.field private count:J

.field private volatile cur_x:D

.field private volatile cur_y:D

.field private final direction:I

.field private final frame_rect:Landroid/graphics/RectF;

.field private idle_rect:Landroid/graphics/RectF;

.field private idle_start_time:J

.field private idle_thres:D

.field private mCameraOrientation:I

.field private final mDiffManager:Lcom/android/camera/panorama/PositionDetector$DiffManager;

.field private mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

.field private mIsFrontCamera:Z

.field private mPreviewFrame:Landroid/view/ViewGroup;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private final output_height:I

.field private final output_width:I

.field private peak:D

.field private prev_x:D

.field private prev_y:D

.field private reset_idle_timer:Z

.field private reverse_thres:D

.field private reverse_thres2:D

.field private too_fast_count:I

.field private too_fast_thres:D

.field private too_slow_count:I

.field private too_slow_thres:D


# direct methods
.method public constructor <init>(Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;Landroid/view/ViewGroup;ZIIIIII)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->idle_rect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->frame_rect:Landroid/graphics/RectF;

    new-instance v0, Lcom/android/camera/panorama/PositionDetector$DiffManager;

    invoke-direct {v0}, Lcom/android/camera/panorama/PositionDetector$DiffManager;-><init>()V

    iput-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->mDiffManager:Lcom/android/camera/panorama/PositionDetector$DiffManager;

    iput-object p1, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iput-object p2, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    iput-boolean p3, p0, Lcom/android/camera/panorama/PositionDetector;->mIsFrontCamera:Z

    iput p4, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    iput p5, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewWidth:I

    iput p6, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewHeight:I

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->count:J

    iput p7, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    iput p8, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    iput p9, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/panorama/PositionDetector;->reset_idle_timer:Z

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_count:I

    iput p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_count:I

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget p3, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    const-wide p4, 0x3f80624dd2f1a9fcL    # 0.008

    const-wide p6, 0x3f40624dd2f1a9fcL    # 5.0E-4

    const v0, 0x3ca3d70a    # 0.02f

    const v1, 0x3f4ccccd    # 0.8f

    const v2, 0x3d8f5c29    # 0.07f

    const/16 v3, 0xb4

    const/16 v4, 0x5a

    packed-switch p3, :pswitch_data_0

    goto/16 :goto_8

    :pswitch_0
    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p8, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p8

    rem-int/lit16 p3, p3, 0x168

    if-eq p3, v4, :cond_1

    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p8, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p8

    rem-int/lit16 p3, p3, 0x168

    if-ne p3, v3, :cond_0

    goto :goto_0

    :cond_0
    int-to-double p1, p9

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    goto :goto_1

    :cond_1
    :goto_0
    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    :goto_1
    int-to-float p1, p9

    mul-float/2addr v2, p1

    float-to-double p2, v2

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    mul-float/2addr v1, p1

    float-to-double p2, v1

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    mul-float/2addr p1, v0

    float-to-double p1, p1

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->idle_thres:D

    int-to-double p1, p9

    mul-double/2addr p6, p1

    iput-wide p6, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_thres:D

    mul-double/2addr p1, p4

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_thres:D

    goto/16 :goto_8

    :pswitch_1
    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p8, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p8

    rem-int/lit16 p3, p3, 0x168

    if-eq p3, v4, :cond_3

    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p8, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p8

    rem-int/lit16 p3, p3, 0x168

    if-ne p3, v3, :cond_2

    goto :goto_2

    :cond_2
    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    goto :goto_3

    :cond_3
    :goto_2
    int-to-double p1, p9

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    :goto_3
    int-to-float p1, p9

    mul-float/2addr v2, p1

    float-to-double p2, v2

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    mul-float/2addr v1, p1

    float-to-double p2, v1

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    mul-float/2addr p1, v0

    float-to-double p1, p1

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->idle_thres:D

    int-to-double p1, p9

    mul-double/2addr p6, p1

    iput-wide p6, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_thres:D

    mul-double/2addr p1, p4

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_thres:D

    goto :goto_8

    :pswitch_2
    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p9, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p9

    rem-int/lit16 p3, p3, 0x168

    if-eq p3, v4, :cond_5

    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p9, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p9

    rem-int/lit16 p3, p3, 0x168

    if-ne p3, v3, :cond_4

    goto :goto_4

    :cond_4
    int-to-double p1, p8

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    goto :goto_5

    :cond_5
    :goto_4
    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    :goto_5
    int-to-float p1, p8

    mul-float/2addr v2, p1

    float-to-double p2, v2

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    mul-float/2addr v1, p1

    float-to-double p2, v1

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    mul-float/2addr p1, v0

    float-to-double p1, p1

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->idle_thres:D

    int-to-double p1, p8

    mul-double/2addr p6, p1

    iput-wide p6, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_thres:D

    mul-double/2addr p1, p4

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_thres:D

    goto :goto_8

    :pswitch_3
    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p9, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p9

    rem-int/lit16 p3, p3, 0x168

    if-eq p3, v4, :cond_7

    iget-object p3, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget p3, p3, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget p9, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr p3, p9

    rem-int/lit16 p3, p3, 0x168

    if-ne p3, v3, :cond_6

    goto :goto_6

    :cond_6
    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    goto :goto_7

    :cond_7
    :goto_6
    int-to-double p1, p8

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    :goto_7
    int-to-float p1, p8

    mul-float/2addr v2, p1

    float-to-double p2, v2

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    mul-float/2addr v1, p1

    float-to-double p2, v1

    iput-wide p2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    mul-float/2addr p1, v0

    float-to-double p1, p1

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->idle_thres:D

    int-to-double p1, p8

    mul-double/2addr p6, p1

    iput-wide p6, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_thres:D

    mul-double/2addr p1, p4

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_thres:D

    nop

    :goto_8
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private checkSpeed()I
    .locals 6

    nop

    iget v0, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    packed-switch v0, :pswitch_data_0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    goto :goto_0

    :pswitch_0
    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    :goto_0
    sub-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->mDiffManager:Lcom/android/camera/panorama/PositionDetector$DiffManager;

    invoke-virtual {v2, v0, v1}, Lcom/android/camera/panorama/PositionDetector$DiffManager;->add(D)V

    const-wide/16 v0, 0xf

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->count:J

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->mDiffManager:Lcom/android/camera/panorama/PositionDetector$DiffManager;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PositionDetector$DiffManager;->getDiff()D

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_thres:D

    cmpg-double v0, v2, v4

    if-gez v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->mDiffManager:Lcom/android/camera/panorama/PositionDetector$DiffManager;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PositionDetector$DiffManager;->getDiff()D

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_thres:D

    cmpl-double v0, v2, v4

    if-lez v0, :cond_1

    const/4 v0, 0x2

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_count:I

    if-lez v2, :cond_2

    iput v1, p0, Lcom/android/camera/panorama/PositionDetector;->too_slow_count:I

    :cond_2
    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_count:I

    if-lez v2, :cond_3

    iput v1, p0, Lcom/android/camera/panorama/PositionDetector;->too_fast_count:I

    :cond_3
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isComplete()Z
    .locals 9

    iget v0, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    packed-switch v0, :pswitch_data_0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    iget v3, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewWidth:I

    div-int/lit8 v3, v3, 0x2

    goto :goto_0

    :pswitch_0
    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    iget v3, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewHeight:I

    div-int/lit8 v3, v3, 0x2

    :goto_0
    iget v4, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    const/16 v5, 0x5a

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v4, v7, :cond_4

    const/4 v8, 0x3

    if-eq v4, v8, :cond_4

    iget-object v4, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v4, v4, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    if-eq v4, v5, :cond_2

    iget-object v4, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v4, v4, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-double v2, v2

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1

    move v6, v7

    nop

    :cond_1
    return v6

    :cond_2
    :goto_1
    div-int/lit8 v3, v3, 0x2

    int-to-double v2, v3

    cmpg-double v0, v0, v2

    if-gez v0, :cond_3

    move v6, v7

    nop

    :cond_3
    return v6

    :cond_4
    iget-object v4, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v4, v4, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    if-eq v4, v5, :cond_7

    iget-object v4, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v4, v4, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    if-nez v4, :cond_5

    goto :goto_2

    :cond_5
    div-int/lit8 v3, v3, 0x2

    int-to-double v2, v3

    cmpg-double v0, v0, v2

    if-gez v0, :cond_6

    move v6, v7

    nop

    :cond_6
    return v6

    :cond_7
    :goto_2
    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-double v2, v2

    cmpl-double v0, v0, v2

    if-lez v0, :cond_8

    move v6, v7

    nop

    :cond_8
    return v6

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isIdle()Z
    .locals 11

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/android/camera/panorama/PositionDetector;->reset_idle_timer:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    iput-boolean v3, p0, Lcom/android/camera/panorama/PositionDetector;->reset_idle_timer:Z

    iput-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->idle_start_time:J

    :cond_0
    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->idle_rect:Landroid/graphics/RectF;

    if-nez v2, :cond_1

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->idle_thres:D

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    div-double/2addr v4, v6

    new-instance v2, Landroid/graphics/RectF;

    iget-wide v6, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    sub-double/2addr v6, v4

    double-to-float v6, v6

    iget-wide v7, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    sub-double/2addr v7, v4

    double-to-float v7, v7

    iget-wide v8, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    add-double/2addr v8, v4

    double-to-float v8, v8

    iget-wide v9, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    add-double/2addr v9, v4

    double-to-float v4, v9

    invoke-direct {v2, v6, v7, v8, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->idle_rect:Landroid/graphics/RectF;

    :cond_1
    const-wide v4, 0xb2d05e00L

    iget-wide v6, p0, Lcom/android/camera/panorama/PositionDetector;->idle_start_time:J

    sub-long/2addr v0, v6

    cmp-long v0, v4, v0

    const/4 v1, 0x1

    if-gez v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->idle_rect:Landroid/graphics/RectF;

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    double-to-float v2, v4

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    double-to-float v4, v4

    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_3

    iput-boolean v1, p0, Lcom/android/camera/panorama/PositionDetector;->reset_idle_timer:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->idle_rect:Landroid/graphics/RectF;

    :cond_3
    return v3
.end method

.method private isReverse()Z
    .locals 12

    nop

    const-string v0, "PositionDetector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cur_x = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ", cur_y = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    packed-switch v0, :pswitch_data_0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    iget v4, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    goto :goto_0

    :pswitch_0
    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    iget v4, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    :goto_0
    nop

    iget v5, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    const/16 v6, 0xb4

    const/16 v7, 0x5a

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eq v5, v9, :cond_1

    const/4 v10, 0x3

    if-eq v5, v10, :cond_1

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v10, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v5, v10

    rem-int/lit16 v5, v5, 0x168

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v10, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v5, v10

    rem-int/lit16 v5, v5, 0x168

    const/16 v10, 0x10e

    if-ne v5, v10, :cond_2

    :cond_0
    nop

    :goto_1
    move v5, v8

    goto :goto_3

    :cond_1
    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v10, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v5, v10

    rem-int/lit16 v5, v5, 0x168

    if-eq v5, v7, :cond_3

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v10, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v5, v10

    rem-int/lit16 v5, v5, 0x168

    if-ne v5, v6, :cond_2

    goto :goto_2

    :cond_2
    move v5, v9

    goto :goto_3

    :cond_3
    :goto_2
    goto :goto_1

    :goto_3
    if-eqz v5, :cond_b

    sub-double/2addr v2, v0

    iget-wide v10, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    cmpl-double v2, v2, v10

    if-lez v2, :cond_4

    goto/16 :goto_b

    :cond_4
    nop

    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v3, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v2, v3

    rem-int/lit16 v2, v2, 0x168

    if-eq v2, v7, :cond_6

    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    iget v3, p0, Lcom/android/camera/panorama/PositionDetector;->mCameraOrientation:I

    add-int/2addr v2, v3

    rem-int/lit16 v2, v2, 0x168

    if-ne v2, v6, :cond_5

    goto :goto_5

    :cond_5
    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    packed-switch v2, :pswitch_data_1

    goto :goto_4

    :pswitch_1
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    goto :goto_4

    :pswitch_2
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    nop

    nop

    move v2, v9

    goto :goto_7

    :goto_4
    move v2, v8

    goto :goto_7

    :cond_6
    :goto_5
    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->direction:I

    packed-switch v2, :pswitch_data_2

    goto :goto_6

    :pswitch_3
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    nop

    move v2, v9

    goto :goto_7

    :pswitch_4
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    nop

    :goto_6
    move v2, v8

    :goto_7
    if-eqz v2, :cond_8

    int-to-double v2, v4

    cmpl-double v2, v0, v2

    if-lez v2, :cond_7

    nop

    :goto_8
    move v8, v9

    goto :goto_9

    :cond_7
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    sub-double/2addr v2, v0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    cmpl-double v0, v2, v0

    if-lez v0, :cond_a

    goto :goto_8

    :cond_8
    int-to-double v2, v4

    cmpl-double v2, v0, v2

    if-lez v2, :cond_9

    goto :goto_8

    :cond_9
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    sub-double/2addr v0, v2

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_a

    goto :goto_8

    :cond_a
    :goto_9
    goto :goto_a

    :cond_b
    sub-double v2, v0, v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres2:D

    cmpl-double v2, v2, v4

    if-lez v2, :cond_c

    goto :goto_b

    :cond_c
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    cmpl-double v2, v0, v2

    if-lez v2, :cond_d

    iput-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    :cond_d
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gez v2, :cond_e

    goto :goto_b

    :cond_e
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->peak:D

    sub-double/2addr v2, v0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->reverse_thres:D

    cmpl-double v0, v2, v0

    if-lez v0, :cond_f

    goto :goto_b

    :cond_f
    :goto_a
    move v9, v8

    :goto_b
    return v9

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private isYOutOfRange()Z
    .locals 7

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    const-wide/16 v2, 0x0

    cmpg-double v0, v0, v2

    const/4 v1, 0x1

    if-ltz v0, :cond_4

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    cmpg-double v0, v4, v2

    if-gez v0, :cond_0

    goto :goto_2

    :cond_0
    iget v0, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    rem-int/lit16 v2, v2, 0xb4

    const/16 v3, 0x5a

    const/4 v4, 0x0

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    int-to-double v5, v0

    cmpl-double v0, v2, v5

    if-lez v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v4

    :goto_0
    return v1

    :cond_2
    iget-wide v2, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    int-to-double v5, v0

    cmpl-double v0, v2, v5

    if-lez v0, :cond_3

    goto :goto_1

    :cond_3
    move v1, v4

    :goto_1
    return v1

    :cond_4
    :goto_2
    return v1
.end method

.method private updateFrame()V
    .locals 9

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-gtz v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v2, 0x5a

    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    double-to-float v2, v4

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iget v6, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-float v4, v4

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    int-to-float v5, v5

    div-float/2addr v5, v3

    mul-float/2addr v5, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    mul-float/2addr v2, v1

    goto/16 :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v2, 0xb4

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    int-to-double v6, v2

    div-double/2addr v4, v6

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-double v6, v2

    mul-double/2addr v4, v6

    double-to-float v4, v4

    iget-wide v5, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    double-to-float v2, v5

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    int-to-float v5, v5

    div-float/2addr v5, v3

    mul-float/2addr v5, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    mul-float/2addr v2, v1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v2, 0x10e

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    int-to-double v4, v2

    iget-wide v6, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    sub-double/2addr v4, v6

    double-to-float v2, v4

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iget v6, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    int-to-double v6, v6

    div-double/2addr v4, v6

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-float v4, v4

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    int-to-float v5, v5

    div-float/2addr v5, v3

    mul-float/2addr v5, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    mul-float/2addr v2, v1

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->mPreviewFrame:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-wide v4, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_width:I

    int-to-double v6, v2

    div-double/2addr v4, v6

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-double v6, v2

    mul-double/2addr v4, v6

    double-to-float v4, v4

    iget v2, p0, Lcom/android/camera/panorama/PositionDetector;->output_height:I

    int-to-double v5, v2

    iget-wide v7, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    sub-double/2addr v5, v7

    double-to-float v2, v5

    iget-object v5, p0, Lcom/android/camera/panorama/PositionDetector;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v5, v5, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    int-to-float v5, v5

    div-float/2addr v5, v3

    mul-float/2addr v5, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v3

    mul-float/2addr v2, v1

    :goto_0
    iget-object v1, p0, Lcom/android/camera/panorama/PositionDetector;->frame_rect:Landroid/graphics/RectF;

    sub-float v3, v2, v5

    sub-float v6, v4, v0

    add-float/2addr v2, v5

    add-float/2addr v4, v0

    invoke-virtual {v1, v3, v6, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method


# virtual methods
.method public detect(DD)I
    .locals 4

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->count:J

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isEqualsZero(D)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isEqualsZero(D)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    iput-wide v0, p0, Lcom/android/camera/panorama/PositionDetector;->prev_x:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_x:D

    :goto_0
    iget-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    invoke-static {p1, p2}, Lcom/android/camera/Util;->isEqualsZero(D)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    invoke-static {p1, p2}, Lcom/android/camera/Util;->isEqualsZero(D)Z

    move-result p1

    if-eqz p1, :cond_1

    iput-wide p3, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    iput-wide p3, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    goto :goto_1

    :cond_1
    iget-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    iput-wide p1, p0, Lcom/android/camera/panorama/PositionDetector;->prev_y:D

    iput-wide p3, p0, Lcom/android/camera/panorama/PositionDetector;->cur_y:D

    :goto_1
    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector;->isYOutOfRange()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_2

    const-string p1, "PositionDetector"

    const-string p3, "isYOutOfRange"

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p2

    :cond_2
    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector;->isReverse()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "PositionDetector"

    const-string p2, "isReverse"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, -0x2

    return p1

    :cond_3
    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector;->isComplete()Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "PositionDetector"

    const-string p3, "isComplete"

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p2

    :cond_4
    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector;->checkSpeed()I

    move-result p1

    invoke-direct {p0}, Lcom/android/camera/panorama/PositionDetector;->updateFrame()V

    return p1
.end method

.method public getFrameRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/panorama/PositionDetector;->frame_rect:Landroid/graphics/RectF;

    return-object v0
.end method

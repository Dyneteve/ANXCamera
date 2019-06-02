.class Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;
.super Landroid/os/Handler;
.source "SnapshotRender.java"

# interfaces
.implements Lcom/android/camera/effect/renders/WatermarkRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/renders/SnapshotRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EGLHandler"
.end annotation


# static fields
.field public static final MSG_DRAW_MAIN_ASYNC:I = 0x1

.field public static final MSG_DRAW_MAIN_SYNC:I = 0x2

.field public static final MSG_INIT_EGL_SYNC:I = 0x0

.field public static final MSG_PREPARE_EFFECT_RENDER:I = 0x6

.field public static final MSG_RELEASE:I = 0x5


# instance fields
.field private mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

.field private mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field final synthetic this$0:Lcom/android/camera/effect/renders/SnapshotRender;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method private applyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B
    .locals 54

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    invoke-direct/range {p0 .. p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->getEffectRender(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Lcom/android/camera/effect/renders/PipeRender;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v2, "init render failed"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    nop

    nop

    nop

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v9

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v12

    nop

    nop

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v2}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v15, 0x0

    aget-object v2, v2, v15

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v3}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v3

    const/4 v8, 0x1

    aget-object v3, v3, v8

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v19

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v20

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "plane0 stride =  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", plane1 stride = "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    const/16 v16, 0x3

    const/16 v17, 0x2

    if-ne v2, v3, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v2

    if-nez v2, :cond_3

    iget-boolean v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-nez v2, :cond_1

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v2, :cond_3

    :cond_1
    nop

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v21

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v22

    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    add-int/lit16 v2, v2, 0x10e

    rem-int/lit16 v2, v2, 0x168

    iget-boolean v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    iget-object v4, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v4, :cond_2

    move/from16 v25, v8

    goto :goto_0

    :cond_2
    move/from16 v25, v15

    :goto_0
    const v26, 0x3de147ae    # 0.11f

    move/from16 v23, v2

    move/from16 v24, v3

    invoke-static/range {v21 .. v26}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v2

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-static {v3}, Lcom/xiaomi/camera/base/ImageUtil;->getYuvData(Landroid/media/Image;)[B

    move-result-object v18

    move-object/from16 v3, v18

    move v4, v9

    move v5, v12

    move/from16 v6, v19

    move/from16 v7, v20

    move-object v8, v2

    invoke-static/range {v3 .. v8}, Lcom/android/camera/Util;->getSubYuvImage([BIIII[I)Lcom/android/camera/effect/MiYuvImage;

    move-result-object v3

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "get sub range data spend total tome ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v13

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    iget-object v5, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    iget-object v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    new-instance v7, Landroid/util/Size;

    aget v8, v2, v17

    aget v13, v2, v16

    invoke-direct {v7, v8, v13}, Landroid/util/Size;-><init>(II)V

    iget v8, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    iget v13, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOrientation:I

    iget v14, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    iget v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mShootRotation:F

    move/from16 v45, v9

    iget-wide v9, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDate:J

    iget-boolean v15, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mMirror:Z

    move-object/from16 v46, v2

    iget-boolean v2, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    move/from16 v47, v12

    iget-boolean v12, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mIsGradienterOn:Z

    move-object/from16 v48, v0

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    move-object/from16 v49, v3

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    move-object/from16 v50, v3

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-object/from16 v51, v3

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    move-object/from16 v28, v4

    move-object/from16 v29, v5

    move-object/from16 v30, v6

    move-object/from16 v31, v7

    move/from16 v32, v8

    move/from16 v33, v13

    move/from16 v34, v14

    move/from16 v35, v1

    move-wide/from16 v36, v9

    move/from16 v38, v15

    move/from16 v39, v2

    move/from16 v40, v12

    move-object/from16 v41, v0

    move-object/from16 v42, v50

    move-object/from16 v43, v51

    move-object/from16 v44, v3

    invoke-direct/range {v28 .. v44}, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;-><init>(Landroid/media/Image;Landroid/util/Size;Landroid/util/Size;IIIFJZZZLjava/lang/String;Ljava/lang/String;Lcom/android/camera/effect/EffectController$EffectRectAttribute;Ljava/util/List;)V

    move-object/from16 v0, v49

    iput-object v0, v4, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mYuvImage:Lcom/android/camera/effect/MiYuvImage;

    nop

    move-object v10, v4

    move-object/from16 v13, v18

    const/4 v12, 0x1

    goto :goto_1

    :cond_3
    move-object/from16 v48, v0

    move/from16 v45, v9

    move/from16 v47, v12

    move-object v10, v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v46, 0x0

    :goto_1
    move-object/from16 v0, v48

    move-object/from16 v14, p0

    invoke-direct {v14, v0, v10}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    instance-of v1, v0, Lcom/android/camera/effect/renders/PipeRender;

    if-eqz v1, :cond_4

    iget-object v1, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    :cond_4
    if-eqz v12, :cond_5

    aget v9, v46, v17

    move v15, v9

    goto :goto_2

    :cond_5
    move/from16 v15, v45

    :goto_2
    if-eqz v12, :cond_6

    aget v1, v46, v16

    move v9, v1

    goto :goto_3

    :cond_6
    move/from16 v9, v47

    :goto_3
    invoke-direct {v14, v15, v9}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkFrameBuffer(II)V

    iget-object v1, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v2, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    iget-object v3, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v3}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/effect/renders/PipeRender;->setParentFrameBufferId(I)V

    invoke-virtual {v0, v10}, Lcom/android/camera/effect/renders/PipeRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "drawTime="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v1

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/PipeRender;->deleteBuffer()V

    new-instance v0, Landroid/util/Size;

    move/from16 v4, v45

    move/from16 v5, v47

    invoke-direct {v0, v4, v5}, Landroid/util/Size;-><init>(II)V

    iput-object v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    nop

    nop

    nop

    nop

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_8

    if-le v4, v5, :cond_7

    sub-int v0, v4, v5

    div-int/lit8 v0, v0, 0x2

    nop

    move/from16 v29, v0

    move/from16 v18, v5

    move/from16 v28, v18

    goto :goto_4

    :cond_7
    sub-int v0, v5, v4

    div-int/lit8 v0, v0, 0x2

    nop

    move/from16 v30, v0

    move/from16 v18, v4

    move/from16 v28, v18

    const/16 v29, 0x0

    goto :goto_5

    :cond_8
    move/from16 v18, v4

    move/from16 v28, v5

    const/16 v29, 0x0

    :goto_4
    const/16 v30, 0x0

    :goto_5
    nop

    iget-boolean v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_f

    if-eqz v12, :cond_9

    const/4 v0, 0x0

    aget v1, v46, v0

    neg-int v0, v1

    const/4 v8, 0x1

    aget v1, v46, v8

    neg-int v1, v1

    move/from16 v27, v0

    move/from16 v31, v1

    goto :goto_6

    :cond_9
    const/4 v8, 0x1

    const/16 v27, 0x0

    const/16 v31, 0x0

    :goto_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    if-nez v12, :cond_b

    iget v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    add-int/lit16 v0, v0, 0x10e

    rem-int/lit16 v0, v0, 0x168

    iget-boolean v1, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    iget-object v2, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v2, :cond_a

    move/from16 v25, v8

    goto :goto_7

    :cond_a
    const/16 v25, 0x0

    :goto_7
    const v26, 0x3de147ae    # 0.11f

    move/from16 v21, v18

    move/from16 v22, v28

    move/from16 v23, v0

    move/from16 v24, v1

    invoke-static/range {v21 .. v26}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v46

    const/4 v0, 0x0

    aget v1, v46, v0

    aget v0, v46, v8

    move/from16 v22, v0

    move/from16 v21, v1

    goto :goto_8

    :cond_b
    const/16 v21, 0x0

    const/16 v22, 0x0

    :goto_8
    iget v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegQuality:I

    const/16 v1, 0x61

    if-lez v0, :cond_d

    if-le v0, v1, :cond_c

    goto :goto_9

    :cond_c
    move v7, v0

    goto :goto_a

    :cond_d
    :goto_9
    nop

    move v7, v1

    :goto_a
    iget-object v1, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    iget-object v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v6

    iget-object v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v23

    iget v3, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    const/16 v24, 0x0

    move-object v0, v14

    move/from16 v2, v27

    move/from16 v25, v3

    move/from16 v3, v31

    move/from16 v52, v7

    move/from16 v7, v23

    move v11, v8

    move/from16 v8, v25

    move v11, v9

    move/from16 v9, v24

    invoke-direct/range {v0 .. v9}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawAgeGenderAndMagicMirrorWater(Ljava/util/List;IIIIIIIZ)V

    add-int v0, v21, v29

    add-int v1, v22, v30

    aget v2, v46, v17

    aget v3, v46, v16

    move/from16 v4, v52

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/camera/effect/ShaderNativeUtil;->getPicture(IIIII)[B

    move-result-object v7

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "for remove watermark spend more time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v32

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int v1, v27, v29

    add-int v2, v31, v30

    iget v5, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    iget-object v6, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    move-object v0, v14

    move/from16 v3, v18

    move/from16 v4, v28

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(IIIIILjava/lang/String;)V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "watermarkTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v32

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    if-eqz v12, :cond_e

    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, v15, v11}, Landroid/util/Size;-><init>(II)V

    goto :goto_b

    :cond_e
    iget-object v0, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    :goto_b
    invoke-direct {v14, v0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkWatermarkFrameBuffer(Landroid/util/Size;)V

    iget-object v1, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v2, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    invoke-direct {v14, v3}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v3

    check-cast v3, Lcom/android/camera/effect/renders/RgbToYuvRender;

    invoke-direct {v14, v3, v10}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    iget-object v4, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v4}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/android/camera/effect/renders/RgbToYuvRender;->setParentFrameBufferId(I)V

    iget-object v4, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v4}, Lcom/android/camera/effect/FrameBuffer;->getTexture()Lcom/android/gallery3d/ui/RawTexture;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v22

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/16 v27, 0x1

    move-object/from16 v21, v3

    move/from16 v25, v4

    move/from16 v26, v0

    invoke-virtual/range {v21 .. v27}, Lcom/android/camera/effect/renders/RgbToYuvRender;->drawTexture(IFFFFZ)V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rgb2YuvTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v22, v46

    goto :goto_c

    :cond_f
    move v11, v9

    move-object/from16 v22, v46

    const/4 v7, 0x0

    :goto_c
    const/16 v0, 0xd05

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    if-eqz v12, :cond_10

    goto :goto_d

    :cond_10
    iget-object v2, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v15

    :goto_d
    if-eqz v12, :cond_11

    move v9, v11

    goto :goto_e

    :cond_11
    iget-object v2, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v9

    :goto_e
    int-to-double v2, v15

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    int-to-double v3, v9

    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    mul-double/2addr v3, v5

    const-wide/high16 v5, 0x4010000000000000L    # 4.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int v4, v2, v3

    const/4 v5, 0x4

    mul-int/2addr v4, v5

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v33, 0x1908

    const/16 v34, 0x1401

    move/from16 v31, v2

    move/from16 v32, v3

    move-object/from16 v35, v4

    invoke-static/range {v29 .. v35}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v6

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v11, "readSize=%dx%d imageSize=%dx%d"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v23, 0x0

    aput-object v2, v5, v23

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v5, v3

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v17

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v16

    invoke-static {v8, v11, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "readTime="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v0

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    if-eqz v12, :cond_12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v21

    move-object/from16 v16, v13

    move/from16 v17, v18

    move/from16 v18, v28

    invoke-static/range {v16 .. v22}, Lcom/android/camera/Util;->coverSubYuvImage([BIIII[B[I)V

    nop

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cover sub range data spend total time ="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f

    :cond_12
    move-object v13, v0

    :goto_f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, v10, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-static {v2, v13, v12}, Lcom/xiaomi/camera/base/ImageUtil;->updateYuvImage(Landroid/media/Image;[BZ)V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "updateImageTime="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    iget-object v0, v14, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    move v11, v3

    move-object/from16 v0, p1

    iget-boolean v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-eqz v1, :cond_14

    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v14

    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v15

    iget v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    add-int/lit16 v1, v1, 0x10e

    rem-int/lit16 v1, v1, 0x168

    iget-boolean v2, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    iget-object v3, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v3, :cond_13

    move/from16 v18, v11

    goto :goto_10

    :cond_13
    move/from16 v18, v23

    :goto_10
    const v19, 0x3de147ae    # 0.11f

    move/from16 v16, v1

    move/from16 v17, v2

    invoke-static/range {v14 .. v19}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v1

    iput-object v7, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDataOfTheRegionUnderWatermarks:[B

    iput-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    :cond_14
    return-object v13
.end method

.method private blockSplitApplyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B
    .locals 43

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1700(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v0

    const-string v1, "TOTAL"

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-direct/range {p0 .. p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->getEffectRender(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Lcom/android/camera/effect/renders/PipeRender;

    move-result-object v12

    const/4 v13, 0x0

    if-nez v12, :cond_0

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    const-string v1, "init render failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v13

    :cond_0
    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v14

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v15

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    const/4 v9, 0x0

    aget-object v0, v0, v9

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v1

    const/4 v8, 0x1

    aget-object v1, v1, v8

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v7

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v6

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/image/MemYuvImage;

    move-result-object v2

    iput v14, v2, Lcom/android/camera/effect/framework/image/MemYuvImage;->mWidth:I

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/image/MemYuvImage;

    move-result-object v2

    iput v15, v2, Lcom/android/camera/effect/framework/image/MemYuvImage;->mHeight:I

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/image/MemYuvImage;

    move-result-object v2

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/framework/image/MemYuvImage;->parseImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "plane0 stride =  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", plane1 stride = "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {v10, v12, v11}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    nop

    nop

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/graphics/Splitter;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600(Lcom/android/camera/effect/renders/SnapshotRender;)I

    move-result v1

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$700(Lcom/android/camera/effect/renders/SnapshotRender;)I

    move-result v2

    invoke-virtual {v0, v14, v15, v1, v2}, Lcom/android/camera/effect/framework/graphics/Splitter;->split(IIII)Ljava/util/List;

    move-result-object v5

    nop

    nop

    nop

    nop

    nop

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    const/4 v4, 0x2

    if-eqz v0, :cond_2

    if-le v14, v15, :cond_1

    sub-int v0, v14, v15

    div-int/2addr v0, v4

    nop

    move/from16 v22, v0

    move/from16 v23, v9

    move v2, v15

    :goto_0
    move v3, v2

    goto :goto_1

    :cond_1
    sub-int v0, v15, v14

    div-int/2addr v0, v4

    nop

    move/from16 v23, v0

    move/from16 v22, v9

    move v2, v14

    goto :goto_0

    :cond_2
    move/from16 v22, v9

    move/from16 v23, v22

    move v3, v14

    move v2, v15

    :goto_1
    iget-boolean v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    const/16 v24, 0x3

    if-eqz v0, :cond_4

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    add-int/lit16 v0, v0, 0x10e

    rem-int/lit16 v0, v0, 0x168

    iget-boolean v13, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v1, :cond_3

    move/from16 v20, v8

    goto :goto_2

    :cond_3
    move/from16 v20, v9

    :goto_2
    const v21, 0x3de147ae    # 0.11f

    move/from16 v16, v3

    move/from16 v17, v2

    move/from16 v18, v0

    move/from16 v19, v13

    invoke-static/range {v16 .. v21}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v0

    new-instance v13, Landroid/graphics/RectF;

    aget v1, v0, v9

    add-int v1, v1, v22

    int-to-float v1, v1

    aget v16, v0, v8

    add-int v8, v16, v23

    int-to-float v8, v8

    aget v16, v0, v9

    aget v17, v0, v4

    add-int v16, v16, v17

    add-int v4, v16, v22

    int-to-float v4, v4

    const/16 v16, 0x1

    aget v17, v0, v16

    aget v18, v0, v24

    add-int v17, v17, v18

    add-int v9, v17, v23

    int-to-float v9, v9

    invoke-direct {v13, v1, v8, v4, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v1, 0x0

    aget v4, v0, v1

    add-int v4, v4, v22

    aget v1, v0, v16

    add-int v1, v1, v23

    const/4 v8, 0x2

    aget v9, v0, v8

    aget v0, v0, v24

    const/4 v8, 0x4

    invoke-static {v4, v1, v9, v0, v8}, Lcom/android/camera/effect/ShaderNativeUtil;->genWaterMarkRange(IIIII)V

    goto :goto_3

    :cond_4
    const/4 v8, 0x4

    const/4 v13, 0x0

    :goto_3
    new-instance v9, Landroid/graphics/RectF;

    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    nop

    const/4 v4, 0x0

    :goto_4
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_8

    const-string v0, "[loop%d/%d]begin"

    const/4 v1, 0x2

    new-array v8, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v16, 0x0

    aput-object v1, v8, v16

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v16, 0x1

    aput-object v1, v8, v16

    invoke-static {v0, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$2000(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/framework/graphics/Block;

    iget v8, v0, Lcom/android/camera/effect/framework/graphics/Block;->mWidth:I

    iget v1, v0, Lcom/android/camera/effect/framework/graphics/Block;->mHeight:I

    move-object/from16 v30, v13

    iget v13, v0, Lcom/android/camera/effect/framework/graphics/Block;->mRowStride:I

    iget v13, v0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    instance-of v13, v12, Lcom/android/camera/effect/renders/PipeRender;

    if-eqz v13, :cond_5

    invoke-virtual {v12, v8, v1}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    :cond_5
    invoke-direct {v10, v8, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkFrameBuffer(II)V

    iget-object v13, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v13}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/android/camera/effect/renders/PipeRender;->setParentFrameBufferId(I)V

    iget-object v13, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    move-object/from16 v31, v9

    iget-object v9, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v9}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v9

    invoke-virtual {v13, v9, v8, v1}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(III)V

    const/4 v9, 0x0

    invoke-static {v9, v9, v8, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    invoke-virtual {v0, v7, v6, v14, v15}, Lcom/android/camera/effect/framework/graphics/Block;->getYUVOffset(IIII)[I

    move-result-object v13

    move/from16 v32, v6

    aget v6, v13, v9

    iput v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOffsetY:I

    const/4 v6, 0x1

    aget v9, v13, v6

    iput v9, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOffsetUV:I

    iput v8, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockWidth:I

    iput v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockHeight:I

    invoke-virtual {v12, v11}, Lcom/android/camera/effect/renders/PipeRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    const-string v6, "[loop%d/%d]gl drawFrame"

    move/from16 v33, v7

    const/4 v9, 0x2

    new-array v7, v9, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x0

    aput-object v16, v7, v17

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/16 v16, 0x1

    aput-object v9, v7, v16

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotRender;->access$2000(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v3, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    iget-boolean v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-eqz v6, :cond_7

    new-instance v9, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v9}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string v6, "drawWaterMark"

    invoke-virtual {v9, v6}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-virtual {v0, v14, v15}, Lcom/android/camera/effect/framework/graphics/Block;->getOffset(II)[I

    move-result-object v16

    const/16 v17, 0x0

    aget v0, v16, v17

    int-to-float v0, v0

    move-object/from16 v7, v31

    iput v0, v7, Landroid/graphics/RectF;->left:F

    const/16 v18, 0x1

    aget v0, v16, v18

    int-to-float v0, v0

    iput v0, v7, Landroid/graphics/RectF;->top:F

    aget v0, v16, v17

    add-int/2addr v0, v8

    int-to-float v0, v0

    iput v0, v7, Landroid/graphics/RectF;->right:F

    aget v0, v16, v18

    add-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, v7, Landroid/graphics/RectF;->bottom:F

    aget v0, v16, v17

    sub-int v19, v22, v0

    aget v0, v16, v18

    sub-int v20, v23, v0

    iget-object v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    aget v0, v16, v17

    neg-int v0, v0

    move/from16 v35, v0

    aget v0, v16, v18

    neg-int v0, v0

    move/from16 v36, v0

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v21

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v25

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    const/16 v26, 0x0

    move/from16 v31, v0

    move/from16 v27, v35

    move/from16 v28, v36

    move-object v0, v10

    move/from16 v37, v1

    move-object v1, v6

    move/from16 v29, v2

    move/from16 v2, v27

    move/from16 v27, v3

    move/from16 v3, v28

    move v6, v4

    move v4, v14

    move-object/from16 v38, v5

    move v5, v15

    move/from16 v39, v6

    move/from16 v28, v32

    move/from16 v6, v21

    move-object/from16 v32, v7

    move/from16 v21, v33

    move/from16 v7, v25

    move/from16 v40, v14

    move/from16 v41, v15

    move/from16 v15, v18

    move v14, v8

    move/from16 v8, v31

    move-object/from16 v42, v12

    move-object/from16 v15, v32

    move-object v12, v9

    move/from16 v9, v26

    invoke-direct/range {v0 .. v9}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawAgeGenderAndMagicMirrorWater(Ljava/util/List;IIIIIIIZ)V

    iget v1, v15, Landroid/graphics/RectF;->left:F

    iget v2, v15, Landroid/graphics/RectF;->top:F

    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v15}, Landroid/graphics/RectF;->height()F

    move-result v4

    move-object/from16 v9, v30

    iget v5, v9, Landroid/graphics/RectF;->left:F

    iget v6, v9, Landroid/graphics/RectF;->top:F

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v7

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v8

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->rectangle_collision(FFFFFFFF)Z

    move-result v0

    if-eqz v0, :cond_6

    iget v1, v15, Landroid/graphics/RectF;->left:F

    iget v2, v15, Landroid/graphics/RectF;->top:F

    iget v3, v15, Landroid/graphics/RectF;->right:F

    iget v4, v15, Landroid/graphics/RectF;->bottom:F

    iget v5, v9, Landroid/graphics/RectF;->left:F

    iget v6, v9, Landroid/graphics/RectF;->top:F

    iget v7, v9, Landroid/graphics/RectF;->right:F

    iget v8, v9, Landroid/graphics/RectF;->bottom:F

    move-object v0, v10

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->getIntersectRect(FFFFFFFF)[F

    move-result-object v0

    aget v1, v0, v17

    float-to-int v2, v1

    const/4 v1, 0x1

    aget v3, v0, v1

    float-to-int v3, v3

    const/4 v8, 0x2

    aget v4, v0, v8

    aget v5, v0, v17

    sub-float/2addr v4, v5

    float-to-int v4, v4

    aget v5, v0, v24

    aget v0, v0, v1

    sub-float/2addr v5, v0

    float-to-int v5, v5

    aget v6, v16, v17

    aget v7, v16, v1

    const/4 v0, 0x4

    move v1, v8

    move v8, v0

    invoke-static/range {v2 .. v8}, Lcom/android/camera/effect/ShaderNativeUtil;->mergeWaterMarkRange(IIIIIII)V

    iget v5, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    iget-object v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    move-object v0, v10

    move v7, v1

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v27

    move/from16 v4, v29

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(IIIIILjava/lang/String;)V

    goto :goto_5

    :cond_6
    const/4 v7, 0x2

    :goto_5
    const-string v0, "drawWaterMark"

    invoke-virtual {v12, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    new-instance v0, Landroid/util/Size;

    move/from16 v1, v37

    invoke-direct {v0, v14, v1}, Landroid/util/Size;-><init>(II)V

    invoke-direct {v10, v0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkWatermarkFrameBuffer(Landroid/util/Size;)V

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    invoke-direct {v10, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v2

    check-cast v2, Lcom/android/camera/effect/renders/RgbToYuvRender;

    invoke-direct {v10, v2, v11}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v3}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/renders/RgbToYuvRender;->setParentFrameBufferId(I)V

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v3}, Lcom/android/camera/effect/FrameBuffer;->getTexture()Lcom/android/gallery3d/ui/RawTexture;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v31

    const/16 v32, 0x0

    const/16 v33, 0x0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/16 v36, 0x1

    move-object/from16 v30, v2

    move/from16 v34, v3

    move/from16 v35, v0

    invoke-virtual/range {v30 .. v36}, Lcom/android/camera/effect/renders/RgbToYuvRender;->drawTexture(IFFFFZ)V

    const-string v0, "drawWaterMark rgb2yuv"

    invoke-virtual {v12, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    goto :goto_6

    :cond_7
    move/from16 v29, v2

    move/from16 v27, v3

    move/from16 v39, v4

    move-object/from16 v38, v5

    move-object/from16 v42, v12

    move/from16 v40, v14

    move/from16 v41, v15

    move-object/from16 v9, v30

    move-object/from16 v15, v31

    move/from16 v28, v32

    move/from16 v21, v33

    const/4 v7, 0x2

    const/16 v17, 0x0

    move v14, v8

    :goto_6
    const/16 v0, 0xd05

    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    aget v0, v13, v17

    aget v3, v13, v2

    invoke-static {v14, v1, v0, v3}, Lcom/android/camera/effect/ShaderNativeUtil;->mergeYUV(IIII)V

    const-string v0, "[loop%d/%d]gl mergeYUV"

    new-array v1, v7, [Ljava/lang/Object;

    move/from16 v3, v39

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v17

    move-object/from16 v4, v38

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$2000(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    add-int/lit8 v0, v3, 0x1

    move-object v5, v4

    move-object v13, v9

    move-object v9, v15

    move/from16 v7, v21

    move/from16 v3, v27

    move/from16 v6, v28

    move/from16 v2, v29

    move/from16 v14, v40

    move/from16 v15, v41

    move-object/from16 v12, v42

    const/4 v8, 0x4

    move v4, v0

    goto/16 :goto_4

    :cond_8
    move-object/from16 v42, v12

    const/4 v2, 0x1

    const/16 v17, 0x0

    move-object/from16 v0, v42

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/PipeRender;->deleteBuffer()V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-boolean v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_a

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$2100(Lcom/android/camera/effect/renders/SnapshotRender;)I

    move-result v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/android/camera/effect/ShaderNativeUtil;->getWaterMarkRange(II)[B

    move-result-object v0

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOutputSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    iget v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    add-int/lit16 v1, v1, 0x10e

    rem-int/lit16 v5, v1, 0x168

    iget-boolean v6, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v1, :cond_9

    move v7, v2

    goto :goto_7

    :cond_9
    move/from16 v7, v17

    :goto_7
    const v8, 0x3de147ae    # 0.11f

    invoke-static/range {v3 .. v8}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v1

    iput-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mDataOfTheRegionUnderWatermarks:[B

    iput-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    :cond_a
    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1700(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v0

    const-string v1, "TOTAL"

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method private checkFrameBuffer(II)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    :cond_0
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_1
    return-void
.end method

.method private checkWatermarkFrameBuffer(Landroid/util/Size;)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-ge v0, v1, :cond_1

    :cond_0
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_1
    return-void
.end method

.method private compress(Landroid/graphics/Bitmap;)[B
    .locals 3

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    nop

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    :try_start_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-object p1
.end method

.method private drawAgeGenderAndMagicMirrorWater(Ljava/util/List;IIIIIIIZ)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;IIIIIIIZ)V"
        }
    .end annotation

    invoke-static {}, Lcom/mi/config/b;->hP()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p9, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/android/camera/watermark/WaterMarkBitmap;

    move-object v1, p1

    invoke-direct {v0, v1}, Lcom/android/camera/watermark/WaterMarkBitmap;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object v1

    if-eqz v1, :cond_1

    new-instance v11, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;

    invoke-virtual {v1}, Lcom/android/camera/watermark/WaterMarkData;->getImage()Landroid/graphics/Bitmap;

    move-result-object v3

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, v11

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p8

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v2 .. v10}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;-><init>(Landroid/graphics/Bitmap;IIIIIFF)V

    invoke-virtual {v1}, Lcom/android/camera/watermark/WaterMarkData;->getOrientation()I

    move-result v1

    sub-int v1, p8, v1

    move-object v2, p0

    move v3, p2

    move v4, p3

    invoke-direct {v2, v11, v3, v4, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->releaseBitmap()V

    const-class v0, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Draw age_gender_and_magic_mirror water mark"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method private drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z
    .locals 3

    nop

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->blockSplitApplyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B

    move-result-object p1

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B

    move-result-object p1

    :goto_1
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mainLen="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_2

    const-string p1, "null"

    goto :goto_2

    :cond_2
    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :goto_2
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    return p1
.end method

.method private drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v1

    add-int/2addr v1, p2

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v2

    add-int/2addr v2, p3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    neg-int p4, p4

    int-to-float p4, p4

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, p4, v2, v2, v1}, Lcom/android/camera/effect/GLCanvasState;->rotate(FFFF)V

    iget-object p4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p4}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p4

    neg-int v0, p2

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    neg-int v1, p3

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p4, v0, v1}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    :cond_0
    iget-object p4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p4}, Lcom/android/camera/effect/SnapshotCanvas;->getBasicRender()Lcom/android/camera/effect/renders/BasicRender;

    move-result-object p4

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result v0

    add-int v2, p2, v0

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result p2

    add-int v3, p3, p2

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getHeight()I

    move-result v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-virtual {p4, v6}, Lcom/android/camera/effect/renders/BasicRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    return-void
.end method

.method private fetchRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getEffectRenderGroup()Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    :cond_0
    return-object v1
.end method

.method private getEffectRender(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Lcom/android/camera/effect/renders/PipeRender;
    .locals 4

    new-instance v0, Lcom/android/camera/effect/renders/PipeRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_YUV2RGB:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v1, v2, :cond_0

    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_0
    iget-boolean v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mIsGradienterOn:Z

    if-eqz v1, :cond_2

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_1
    goto :goto_1

    :cond_2
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    if-eqz v1, :cond_5

    const/4 v1, 0x0

    const-string v2, "circle"

    iget-object v3, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    goto :goto_0

    :cond_3
    const-string v2, "parallel"

    iget-object v3, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_5
    :goto_1
    iget-boolean p1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-nez p1, :cond_6

    sget p1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_6
    return-object v0
.end method

.method private getGPURBGA(IIII)Landroid/graphics/Bitmap;
    .locals 10

    mul-int v0, p3, p4

    new-array v1, v0, [I

    new-array v0, v0, [I

    invoke-static {v1}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v6, 0x1908

    const/16 v7, 0x1401

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v2 .. v8}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    nop

    move p1, v9

    move p2, p1

    :goto_0
    if-ge p1, p4, :cond_1

    move v2, p2

    move p2, v9

    :goto_1
    if-ge p2, p3, :cond_0

    aget v3, v1, v2

    shr-int/lit8 v4, v3, 0x10

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v5, v3, 0x10

    const/high16 v6, 0xff0000

    and-int/2addr v5, v6

    const v6, -0xff0100

    and-int/2addr v3, v6

    or-int/2addr v3, v5

    or-int/2addr v3, v4

    aput v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    move p2, v2

    goto :goto_0

    :cond_1
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, p3, p4, p1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method private getGPUYYY(IIII)Landroid/graphics/Bitmap;
    .locals 11

    shr-int/lit8 v2, p3, 0x1

    shr-int/lit8 v3, p4, 0x1

    mul-int v0, v2, v2

    mul-int/lit8 v0, v0, 0x4

    new-array v7, v0, [B

    mul-int v8, p3, p4

    new-array v9, v8, [I

    invoke-static {v7}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v6

    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v0, p1

    move v1, p2

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    nop

    move p1, v10

    :goto_0
    if-ge v10, v8, :cond_0

    aget-byte p2, v7, v10

    shl-int/lit8 v0, p2, 0x8

    const v1, 0xff00

    and-int/2addr v0, v1

    shl-int/lit8 v1, p2, 0x10

    const/high16 v2, 0xff0000

    and-int/2addr v1, v2

    and-int/lit16 p2, p2, 0xff

    const/high16 v2, -0x1000000

    or-int/2addr v0, v2

    or-int/2addr v0, v1

    or-int/2addr p2, v0

    aput p2, v9, p1

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_0
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v9, p3, p4, p1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method private getIntersectRect(FFFFFFFF)[F
    .locals 2

    const/4 v0, 0x4

    new-array v0, v0, [F

    cmpl-float v1, p1, p5

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    move p1, p5

    :goto_0
    const/4 p5, 0x0

    aput p1, v0, p5

    const/4 p1, 0x1

    cmpl-float p5, p2, p6

    if-lez p5, :cond_1

    goto :goto_1

    :cond_1
    move p2, p6

    :goto_1
    aput p2, v0, p1

    const/4 p1, 0x2

    cmpg-float p2, p3, p7

    aput p7, v0, p1

    const/4 p1, 0x3

    cmpg-float p2, p4, p8

    if-gez p2, :cond_2

    goto :goto_2

    :cond_2
    move p4, p8

    :goto_2
    aput p4, v0, p1

    return-object v0
.end method

.method private initEGL(Landroid/opengl/EGLContext;Z)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/EglCore;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    new-instance v1, Lcom/android/camera/effect/framework/gles/EglCore;

    const/4 v2, 0x2

    invoke-direct {v1, p1, v2}, Lcom/android/camera/effect/framework/gles/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$802(Lcom/android/camera/effect/renders/SnapshotRender;Lcom/android/camera/effect/framework/gles/EglCore;)Lcom/android/camera/effect/framework/gles/EglCore;

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->release()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$902(Lcom/android/camera/effect/renders/SnapshotRender;Lcom/android/camera/effect/framework/gles/PbufferSurface;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    :cond_1
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    new-instance p2, Lcom/android/camera/effect/framework/gles/PbufferSurface;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/EglCore;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p2, v0, v1, v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;-><init>(Lcom/android/camera/effect/framework/gles/EglCore;II)V

    invoke-static {p1, p2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$902(Lcom/android/camera/effect/renders/SnapshotRender;Lcom/android/camera/effect/framework/gles/PbufferSurface;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    return-void
.end method

.method private rectangle_collision(FFFFFFFF)Z
    .locals 0

    add-float/2addr p7, p5

    cmpl-float p7, p1, p7

    if-gtz p7, :cond_0

    add-float/2addr p1, p3

    cmpg-float p1, p1, p5

    if-ltz p1, :cond_0

    add-float/2addr p8, p6

    cmpl-float p1, p2, p8

    if-gtz p1, :cond_0

    add-float/2addr p2, p4

    cmpg-float p1, p2, p6

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private release()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    :cond_0
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$2200(Lcom/android/camera/effect/renders/SnapshotRender;)V

    return-void
.end method

.method private updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V
    .locals 2

    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockWidth:I

    if-eqz v0, :cond_0

    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockHeight:I

    if-eqz v0, :cond_0

    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockWidth:I

    iget v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mBlockHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    goto :goto_0

    :cond_0
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    :goto_0
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    iget-boolean v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mMirror:Z

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOrientation:I

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mShootRotation:F

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    iget p2, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    return-void
.end method


# virtual methods
.method public drawFaceWaterMarkInfos(Landroid/util/Size;Landroid/util/Size;ILjava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroid/util/Size;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    if-eqz p4, :cond_3

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-direct {v0, p4}, Lcom/android/camera/watermark/WaterMarkBitmap;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object p4

    if-eqz p4, :cond_1

    new-instance v10, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;

    invoke-virtual {p4}, Lcom/android/camera/watermark/WaterMarkData;->getImage()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v6

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, v10

    move v5, p3

    invoke-direct/range {v1 .. v9}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;-><init>(Landroid/graphics/Bitmap;IIIIIFF)V

    invoke-virtual {p4}, Lcom/android/camera/watermark/WaterMarkData;->getOrientation()I

    move-result p1

    sub-int/2addr p3, p1

    const/4 p1, 0x0

    invoke-direct {p0, v10, p1, p1, p3}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->releaseBitmap()V

    const-class p1, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Draw age_gender_and_magic_mirror water mark"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public drawWaterMark(IIIIILjava/lang/String;)V
    .locals 8

    if-eqz p6, :cond_0

    new-instance v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    invoke-direct {v0, p6, p3, p4, p5}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;-><init>(Ljava/lang/String;III)V

    invoke-direct {p0, v0, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    :cond_0
    const/4 p6, 0x0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->isFrontWatermarkEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    goto/16 :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->isDualWatermarkEnable()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;

    move-result-object p6

    if-eqz p6, :cond_2

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;

    move-result-object p6

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-nez p6, :cond_2

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-static {p6, v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1302(Lcom/android/camera/effect/renders/SnapshotRender;Ljava/lang/String;)Ljava/lang/String;

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1400(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p6, v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1202(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    :cond_2
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    invoke-static {}, Lcom/android/camera/CameraSettings;->getDefaultWatermarkStr()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->is48MPWatermarkEnable()Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1600(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1502(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    :cond_3
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    :cond_4
    :goto_0
    move-object v1, p6

    if-eqz v1, :cond_5

    new-instance p6, Lcom/android/camera/effect/renders/ImageWaterMark;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->getSize()F

    move-result v5

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->getPaddingX()F

    move-result v6

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->getPaddingY()F

    move-result v7

    move-object v0, p6

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/ImageWaterMark;-><init>(Landroid/graphics/Bitmap;IIIFFF)V

    invoke-direct {p0, p6, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    :cond_5
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    goto/16 :goto_1

    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->release()V

    goto/16 :goto_1

    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    const/4 v3, 0x2

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v2, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-static {v0, v2, v4}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;II)I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-static {v2, v4}, Lcom/android/camera/effect/renders/SnapshotRender;->access$602(Lcom/android/camera/effect/renders/SnapshotRender;I)I

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    div-int/2addr v4, v0

    invoke-static {v2, v4}, Lcom/android/camera/effect/renders/SnapshotRender;->access$702(Lcom/android/camera/effect/renders/SnapshotRender;I)I

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$700(Lcom/android/camera/effect/renders/SnapshotRender;)I

    move-result v0

    rem-int/2addr v0, v3

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$712(Lcom/android/camera/effect/renders/SnapshotRender;I)I

    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_1

    :cond_2
    :goto_0
    const-string v0, "yuv image is broken width %d height %d"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object p1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v1

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto :goto_1

    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$100(Lcom/android/camera/effect/renders/SnapshotRender;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->release()V

    :cond_3
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$200(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$310(Lcom/android/camera/effect/renders/SnapshotRender;)I

    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :pswitch_5
    const/4 v0, 0x0

    invoke-direct {p0, v0, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->initEGL(Landroid/opengl/EGLContext;Z)V

    new-instance v0, Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v0}, Lcom/android/camera/effect/SnapshotCanvas;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/util/Size;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/SnapshotCanvas;->setSize(II)V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    nop

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public sendMessageSync(Landroid/os/Message;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendMessage(Landroid/os/Message;)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    return-void
.end method

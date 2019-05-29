.class Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;
.super Landroid/os/Handler;
.source "SnapshotEffectRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/renders/SnapshotEffectRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EGLHandler"
.end annotation


# static fields
.field public static final MSG_DRAW_MAIN_ASYNC:I = 0x1

.field public static final MSG_DRAW_MAIN_SYNC:I = 0x2

.field public static final MSG_DRAW_THUMB:I = 0x4

.field public static final MSG_GET_DRAW_THUMB:I = 0x3

.field public static final MSG_INIT_EGL_SYNC:I = 0x0

.field public static final MSG_PREPARE_EFFECT_RENDER:I = 0x6

.field public static final MSG_RELEASE:I = 0x5


# instance fields
.field final synthetic this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method private applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B
    .locals 29

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move/from16 v12, p3

    move-object/from16 v13, p4

    move-object/from16 v0, p5

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyEffect: applyToThumb = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v12, :cond_0

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v1}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    :goto_0
    const/4 v14, 0x0

    if-nez v1, :cond_2

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Null "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v12, :cond_1

    const-string v2, "thumb!"

    goto :goto_1

    :cond_1
    const-string v2, "jpeg!"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v14

    :cond_2
    if-nez v12, :cond_3

    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v2, v3, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-direct {v10, v11, v13, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffectOnlyWatermarkRange(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object v0

    return-object v0

    :cond_3
    new-instance v15, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v15}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string v2, "init Texture"

    invoke-virtual {v15, v2}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    const/4 v9, 0x1

    new-array v8, v9, [I

    const/4 v7, 0x0

    invoke-static {v9, v8, v7}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v2, v8, v7

    move/from16 v3, p2

    invoke-static {v1, v2, v3}, Lcom/android/camera/effect/ShaderNativeUtil;->initTexture([BII)[I

    move-result-object v2

    const-string v3, "init Texture"

    invoke-virtual {v15, v3}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    aget v4, v2, v7

    aget v5, v2, v9

    if-eqz v12, :cond_4

    aget v3, v2, v7

    :goto_2
    move v6, v3

    goto :goto_3

    :cond_4
    iget v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    goto :goto_2

    :goto_3
    if-eqz v12, :cond_5

    aget v2, v2, v9

    :goto_4
    move v3, v2

    goto :goto_5

    :cond_5
    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    goto :goto_4

    :goto_5
    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    invoke-direct {v10, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->getEffectRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v2

    if-nez v2, :cond_6

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "init render failed"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_6
    instance-of v1, v2, Lcom/android/camera/effect/renders/PipeRender;

    if-eqz v1, :cond_7

    move-object v1, v2

    check-cast v1, Lcom/android/camera/effect/renders/PipeRender;

    invoke-virtual {v1, v4, v5}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    :cond_7
    invoke-virtual {v2, v6, v3}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    iget-object v1, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    iget-boolean v1, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mMirror:Z

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    if-eqz v12, :cond_8

    invoke-virtual {v2, v4, v5}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    goto :goto_6

    :cond_8
    iget v1, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    iget v0, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-virtual {v2, v1, v0}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    :goto_6
    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mOrientation:I

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mShootRotation:F

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    invoke-direct {v10, v4, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->checkFrameBuffer(II)V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2900(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/FrameBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2900(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/FrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/Render;->setParentFrameBufferId(I)V

    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    aget v17, v8, v7

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x1

    move-object/from16 v16, v0

    move/from16 v20, v4

    move/from16 v21, v5

    invoke-direct/range {v16 .. v22}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/Render;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    invoke-virtual {v2}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    nop

    nop

    nop

    nop

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    const/16 v1, 0xa5

    const/16 v16, 0x2

    if-ne v0, v1, :cond_a

    if-le v4, v5, :cond_9

    sub-int v0, v4, v5

    div-int/lit8 v0, v0, 0x2

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v1

    mul-int/2addr v1, v5

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    nop

    move v2, v0

    move v0, v5

    move v14, v0

    move v1, v7

    goto :goto_7

    :cond_9
    sub-int v0, v5, v4

    div-int/lit8 v0, v0, 0x2

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v1

    mul-int/2addr v1, v4

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    nop

    move v1, v0

    move v0, v4

    move v14, v0

    move v2, v7

    goto :goto_7

    :cond_a
    move v0, v4

    move v14, v5

    move v1, v7

    move v2, v1

    :goto_7
    iget-object v7, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWaterInfos:Ljava/util/List;

    iget v9, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object/from16 v24, v15

    iget-boolean v15, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mIsPortraitRawData:Z

    move v11, v0

    move-object v0, v10

    move/from16 v25, v1

    move-object v1, v7

    move v7, v2

    move/from16 v17, v3

    move/from16 v3, v25

    move/from16 v26, v7

    const/4 v10, 0x0

    move/from16 v7, v17

    move-object/from16 v27, v8

    move v8, v9

    move v9, v15

    invoke-direct/range {v0 .. v9}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawAgeGenderAndMagicMirrorWater(Ljava/util/List;IIIIIIIZ)V

    if-eqz v12, :cond_c

    if-eqz v13, :cond_b

    iput v11, v13, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    iput v14, v13, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "thumbSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v13, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v13, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_b
    move v9, v11

    move-object/from16 v8, p1

    goto :goto_8

    :cond_c
    move v9, v11

    move-object/from16 v8, p1

    iput v9, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iput v14, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    :goto_8
    nop

    nop

    iget-boolean v0, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_10

    if-nez v12, :cond_e

    iget v0, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    add-int/lit16 v0, v0, 0x10e

    rem-int/lit16 v0, v0, 0x168

    iget-boolean v1, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    iget-object v2, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    if-eqz v2, :cond_d

    const/16 v21, 0x1

    goto :goto_9

    :cond_d
    move/from16 v21, v10

    :goto_9
    const v22, 0x3de147ae    # 0.11f

    move/from16 v17, v9

    move/from16 v18, v14

    move/from16 v19, v0

    move/from16 v20, v1

    invoke-static/range {v17 .. v22}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v0

    aget v1, v0, v10

    add-int v1, v1, v26

    const/4 v11, 0x1

    aget v2, v0, v11

    move/from16 v13, v25

    add-int/2addr v2, v13

    aget v3, v0, v16

    const/4 v4, 0x3

    aget v4, v0, v4

    move/from16 v7, v26

    move-object/from16 v15, p0

    iget-object v5, v15, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v5

    invoke-static {v1, v2, v3, v4, v5}, Lcom/android/camera/effect/ShaderNativeUtil;->getPicture(IIIII)[B

    move-result-object v1

    move-object/from16 v16, v0

    move-object/from16 v23, v1

    goto :goto_a

    :cond_e
    move/from16 v13, v25

    move/from16 v7, v26

    const/4 v11, 0x1

    move-object/from16 v15, p0

    const/16 v16, 0x0

    const/16 v23, 0x0

    :goto_a
    iget v6, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/16 v17, 0x0

    move-object v0, v15

    move-object v1, v8

    move v2, v7

    move v3, v13

    move v4, v9

    move v5, v14

    move/from16 v28, v7

    move-object/from16 v7, v17

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawTimeWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gJ()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    if-eqz v0, :cond_f

    iget-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_f

    iget v6, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/4 v7, 0x0

    move-object v0, v15

    move-object v1, v8

    move/from16 v2, v28

    move v3, v13

    move v4, v9

    move v5, v14

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawFrontCameraWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    goto :goto_b

    :cond_f
    iget v6, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/4 v7, 0x0

    move-object v0, v15

    move-object v1, v8

    move/from16 v2, v28

    move v3, v13

    move v4, v9

    move v5, v14

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawDoubleShotWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    :goto_b
    move-object/from16 v1, v16

    move-object/from16 v0, v23

    goto :goto_c

    :cond_10
    move/from16 v13, v25

    move/from16 v28, v26

    const/4 v11, 0x1

    move-object/from16 v15, p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_c
    const-string v2, "draw"

    move-object/from16 v3, v24

    invoke-virtual {v3, v2}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    const/16 v2, 0xd05

    invoke-static {v2, v11}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    iget-object v2, v15, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v2

    if-eqz v12, :cond_11

    iget-object v2, v15, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v2

    const-string v4, "normal"

    invoke-static {v4}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_11
    move/from16 v7, v28

    invoke-static {v7, v13, v9, v14, v2}, Lcom/android/camera/effect/ShaderNativeUtil;->getPicture(IIIII)[B

    move-result-object v2

    const-string v4, "readpixels"

    invoke-virtual {v3, v4}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    move-object/from16 v3, v27

    aget v4, v3, v10

    invoke-static {v4}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result v4

    if-eqz v4, :cond_12

    invoke-static {v11, v3, v10}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    :cond_12
    iget-object v3, v15, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    iget-object v3, v15, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    iget-boolean v3, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    if-eqz v3, :cond_13

    iput-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDataOfTheRegionUnderWatermarks:[B

    iput-object v1, v8, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    :cond_13
    return-object v2
.end method

.method private applyEffectOnlyWatermarkRange(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B
    .locals 35

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v0, p3

    iget-boolean v1, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    const/16 v10, 0xa5

    if-nez v1, :cond_0

    iget v1, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    if-eq v1, v10, :cond_0

    iget-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    return-object v0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    const/4 v11, 0x1

    invoke-static {v3, v11}, Lcom/android/camera/effect/ShaderNativeUtil;->decompressPicture([BI)[I

    move-result-object v3

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "jpeg decompress total time ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v1

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    iget v2, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    const/4 v12, 0x0

    aget v4, v3, v12

    aget v3, v3, v11

    nop

    nop

    nop

    nop

    iget v5, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    const/4 v6, 0x2

    if-ne v5, v10, :cond_2

    if-le v4, v3, :cond_1

    sub-int v5, v4, v3

    div-int/2addr v5, v6

    iget-object v7, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v7

    mul-int/2addr v7, v3

    sget v13, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v7, v13

    sub-int/2addr v5, v7

    nop

    move v13, v3

    move v14, v13

    move v15, v5

    move v7, v12

    goto :goto_0

    :cond_1
    sub-int/2addr v3, v4

    div-int/2addr v3, v6

    iget-object v5, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v5

    mul-int/2addr v5, v4

    sget v7, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v5, v7

    sub-int/2addr v3, v5

    nop

    move v7, v3

    move v13, v4

    move v14, v13

    move v15, v12

    goto :goto_0

    :cond_2
    move v14, v3

    move v13, v4

    move v7, v12

    move v15, v7

    :goto_0
    iput v13, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iput v14, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    iget v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    if-ne v3, v10, :cond_3

    iget-boolean v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    if-nez v3, :cond_3

    iget-object v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    if-nez v3, :cond_3

    invoke-static {v15, v7}, Lcom/android/camera/effect/ShaderNativeUtil;->getCenterSquareImage(II)V

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v0

    invoke-static {v13, v14, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->compressPicture(III)[B

    move-result-object v0

    return-object v0

    :cond_3
    iget v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v5, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    iget v10, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    add-int/lit16 v10, v10, 0x10e

    rem-int/lit16 v10, v10, 0x168

    iget-boolean v12, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    iget-object v11, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    if-eqz v11, :cond_4

    const/16 v20, 0x1

    goto :goto_1

    :cond_4
    const/16 v20, 0x0

    :goto_1
    const v21, 0x3de147ae    # 0.11f

    move/from16 v16, v3

    move/from16 v17, v5

    move/from16 v18, v10

    move/from16 v19, v12

    invoke-static/range {v16 .. v21}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v10

    aget v11, v10, v6

    const/4 v12, 0x3

    aget v5, v10, v12

    iget-object v3, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object v3, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v3

    invoke-virtual {v3, v11, v5}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->reszieBuffer(II)V

    iget-object v3, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3, v11}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$702(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I

    iget-object v3, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$802(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const/4 v3, 0x1

    new-array v12, v3, [I

    invoke-static {}, Lcom/android/camera/effect/framework/gles/OpenGlUtils;->genTexture()I

    move-result v18

    const/16 v19, 0x0

    aput v18, v12, v19

    aget v18, v10, v19

    add-int v6, v18, v15

    aget v18, v10, v3

    add-int v3, v18, v7

    move/from16 v29, v14

    const/16 v18, 0x2

    aget v14, v10, v18

    move/from16 v30, v13

    const/16 v18, 0x3

    aget v13, v10, v18

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v0

    invoke-static {v6, v3, v14, v13, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegFromMemImage(IIIII)[B

    move-result-object v13

    const/4 v0, 0x1

    aget v3, v10, v0

    add-int/2addr v3, v7

    mul-int/2addr v3, v4

    const/4 v0, 0x0

    aget v6, v10, v0

    add-int/2addr v6, v15

    add-int/2addr v3, v6

    mul-int/lit8 v14, v3, 0x3

    aget v3, v12, v0

    invoke-static {v3, v11, v5, v4, v14}, Lcom/android/camera/effect/ShaderNativeUtil;->updateTextureWidthStride(IIIII)V

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get pixel and upload total time ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move/from16 v31, v7

    sub-long v6, v18, v16

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    invoke-direct {v8, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->getEffectRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v7

    if-nez v7, :cond_5

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "init render failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    return-object v0

    :cond_5
    invoke-virtual {v7, v1, v2}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    iget-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-virtual {v7, v0}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    iget-boolean v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mMirror:Z

    invoke-virtual {v7, v0}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    move-object/from16 v0, p3

    iget v1, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    iget v0, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-virtual {v7, v1, v0}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    iget v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mOrientation:I

    invoke-virtual {v7, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    iget v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mShootRotation:F

    invoke-virtual {v7, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    iget v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    invoke-virtual {v7, v0}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->getFrameBufferId()I

    move-result v0

    iget-object v1, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v1

    invoke-virtual {v1, v0, v11, v5}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(III)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-object v0, v7

    check-cast v0, Lcom/android/camera/effect/renders/PipeRender;

    new-instance v1, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    const/4 v2, 0x0

    aget v23, v12, v2

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v28, 0x1

    move-object/from16 v22, v1

    move/from16 v26, v11

    move/from16 v27, v5

    invoke-direct/range {v22 .. v28}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->drawOnExtraFrameBufferOnce(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    invoke-virtual {v7}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    const/4 v0, 0x0

    aget v1, v10, v0

    const/4 v0, 0x1

    aget v2, v10, v0

    neg-int v6, v1

    neg-int v4, v2

    iget v3, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/16 v18, 0x0

    move-object v0, v8

    move-object v1, v9

    move v2, v6

    move/from16 v19, v3

    move v3, v4

    move/from16 v20, v4

    move/from16 v4, v30

    move/from16 v32, v5

    move/from16 v5, v29

    move/from16 v21, v6

    move/from16 v6, v19

    move-object/from16 v34, v12

    move-object/from16 v33, v13

    move/from16 v13, v31

    move-object v12, v7

    move-object/from16 v7, v18

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawTimeWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gJ()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    if-eqz v0, :cond_6

    iget-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_6

    iget v6, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, v9

    move/from16 v2, v21

    move/from16 v3, v20

    move/from16 v4, v30

    move/from16 v5, v29

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawFrontCameraWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    goto :goto_2

    :cond_6
    iget v6, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, v9

    move/from16 v2, v21

    move/from16 v3, v20

    move/from16 v4, v30

    move/from16 v5, v29

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawDoubleShotWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    :goto_2
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drawTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v2, v2, v16

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v12}, Lcom/android/camera/effect/renders/Render;->deleteBuffer()V

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    iget v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_7

    invoke-static {v15, v13}, Lcom/android/camera/effect/ShaderNativeUtil;->getCenterSquareImage(II)V

    const/4 v0, 0x1

    aget v1, v10, v0

    mul-int v1, v1, v30

    const/4 v0, 0x0

    aget v2, v10, v0

    add-int/2addr v1, v2

    const/4 v0, 0x3

    mul-int/2addr v1, v0

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v0

    move/from16 v2, v32

    invoke-virtual {v0, v11, v2, v1}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->readBuffer(III)V

    goto :goto_3

    :cond_7
    move/from16 v2, v32

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v0

    invoke-virtual {v0, v11, v2, v14}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->readBuffer(III)V

    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v2

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-static {v4, v3, v2}, Lcom/android/camera/effect/ShaderNativeUtil;->compressPicture(III)[B

    move-result-object v2

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "compress="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    aget v1, v34, v0

    invoke-static {v1}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result v1

    if-eqz v1, :cond_8

    move-object/from16 v1, v34

    const/4 v3, 0x1

    invoke-static {v3, v1, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    :cond_8
    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    iget-object v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    move-object/from16 v0, v33

    iput-object v0, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDataOfTheRegionUnderWatermarks:[B

    iput-object v10, v9, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    return-object v2
.end method

.method private blockSplitApplyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)V
    .locals 53

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move/from16 v0, p3

    move-object/from16 v1, p5

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applyEffect: applyToThumb = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_0

    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v2}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v2

    goto :goto_0

    :cond_0
    iget-object v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    :goto_0
    if-nez v2, :cond_2

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Null "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_1

    const-string v0, "thumb!"

    goto :goto_1

    :cond_1
    const-string v0, "jpeg!"

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {}, Lcom/android/camera/effect/framework/gles/OpenGlUtils;->genTexture()I

    move-result v4

    invoke-static {v3, v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3002(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/android/camera/effect/framework/image/MemImage;->getPixelsFromJpg([B)V

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v2

    iget v12, v2, Lcom/android/camera/effect/framework/image/MemImage;->mWidth:I

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v2

    iget v13, v2, Lcom/android/camera/effect/framework/image/MemImage;->mHeight:I

    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    move v14, v2

    iget v2, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewHeight:I

    move v15, v2

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v2

    const-string v3, "[NewEffectFramework]start"

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    new-instance v2, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v2}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    const-string v3, "local start"

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/Splitter;

    move-result-object v3

    iget-object v4, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v4

    iget v4, v4, Lcom/android/camera/effect/framework/image/MemImage;->mWidth:I

    iget-object v5, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v5

    iget v5, v5, Lcom/android/camera/effect/framework/image/MemImage;->mHeight:I

    iget-object v6, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v6

    iget-object v7, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/android/camera/effect/framework/graphics/Splitter;->split(IIII)Ljava/util/List;

    move-result-object v9

    const-string v3, "local start setImageSettings"

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    invoke-direct {v10, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->getEffectRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v8

    if-nez v8, :cond_3

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "init render failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    invoke-virtual {v8, v14, v15}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-virtual {v8, v3}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    iget-boolean v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mMirror:Z

    invoke-virtual {v8, v3}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    if-eqz v0, :cond_4

    invoke-virtual {v8, v12, v13}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    goto :goto_2

    :cond_4
    iget v0, v1, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    iget v1, v1, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    invoke-virtual {v8, v0, v1}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    :goto_2
    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mOrientation:I

    invoke-virtual {v8, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mShootRotation:F

    invoke-virtual {v8, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    invoke-virtual {v8, v0}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    const-string v0, "local start render"

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->getFrameBufferId()I

    move-result v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v1

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v3

    iget-object v4, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(III)V

    const-string v0, "local beginBindFrameBuffer"

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    const-string v0, "local beginBindFrameBuffer"

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    nop

    nop

    nop

    nop

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    const/16 v7, 0xa5

    const/4 v6, 0x2

    if-ne v0, v7, :cond_6

    if-le v12, v13, :cond_5

    sub-int v0, v12, v13

    div-int/2addr v0, v6

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v1

    mul-int/2addr v1, v13

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    nop

    move v2, v0

    move v3, v13

    move v4, v3

    const/4 v1, 0x0

    goto :goto_4

    :cond_5
    sub-int v0, v13, v12

    div-int/2addr v0, v6

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v1

    mul-int/2addr v1, v12

    sget v2, Lcom/android/camera/Util;->sWindowWidth:I

    div-int/2addr v1, v2

    sub-int/2addr v0, v1

    nop

    move v1, v0

    move v3, v12

    move v4, v3

    goto :goto_3

    :cond_6
    move v4, v12

    move v3, v13

    const/4 v1, 0x0

    :goto_3
    const/4 v2, 0x0

    :goto_4
    iput v4, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iput v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    nop

    nop

    nop

    nop

    nop

    nop

    iget-boolean v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    const/16 v16, 0x0

    if-eqz v0, :cond_8

    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v7, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    iget v6, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    add-int/lit16 v6, v6, 0x10e

    rem-int/lit16 v6, v6, 0x168

    iget-boolean v5, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    move/from16 v25, v3

    iget-object v3, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    if-eqz v3, :cond_7

    const/16 v23, 0x1

    goto :goto_5

    :cond_7
    const/16 v23, 0x0

    :goto_5
    const v24, 0x3de147ae    # 0.11f

    move/from16 v19, v0

    move/from16 v20, v7

    move/from16 v21, v6

    move/from16 v22, v5

    invoke-static/range {v19 .. v24}, Lcom/android/camera/Util;->getWatermarkRange(IIIZZF)[I

    move-result-object v0

    new-instance v3, Landroid/graphics/RectF;

    const/4 v5, 0x0

    aget v6, v0, v5

    add-int/2addr v6, v2

    int-to-float v6, v6

    const/4 v7, 0x1

    aget v19, v0, v7

    add-int v7, v19, v1

    int-to-float v7, v7

    aget v19, v0, v5

    add-int v19, v19, v2

    const/4 v5, 0x2

    aget v20, v0, v5

    add-int v5, v19, v20

    int-to-float v5, v5

    const/16 v19, 0x1

    aget v20, v0, v19

    add-int v20, v20, v1

    move/from16 v26, v4

    const/4 v4, 0x3

    aget v18, v0, v4

    add-int v4, v20, v18

    int-to-float v4, v4

    invoke-direct {v3, v6, v7, v5, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v4, 0x0

    aget v5, v0, v4

    add-int/2addr v5, v2

    aget v4, v0, v19

    add-int/2addr v4, v1

    const/4 v6, 0x2

    aget v7, v0, v6

    move-object/from16 v27, v3

    const/4 v6, 0x3

    aget v3, v0, v6

    invoke-static {v5, v4, v7, v3, v6}, Lcom/android/camera/effect/ShaderNativeUtil;->genWaterMarkRange(IIIII)V

    move-object v6, v0

    move-object/from16 v7, v27

    goto :goto_6

    :cond_8
    move/from16 v25, v3

    move/from16 v26, v4

    move-object/from16 v6, v16

    move-object v7, v6

    :goto_6
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    nop

    move-object/from16 v19, v16

    move-object/from16 v20, v19

    const/4 v4, 0x0

    :goto_7
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_b

    const-string v0, "[loop%d/%d]begin"

    move-object/from16 v28, v6

    const/4 v3, 0x2

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v21, 0x0

    aput-object v3, v6, v21

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v21, 0x1

    aput-object v3, v6, v21

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/framework/graphics/Block;

    iget v6, v0, Lcom/android/camera/effect/framework/graphics/Block;->mWidth:I

    iget v3, v0, Lcom/android/camera/effect/framework/graphics/Block;->mHeight:I

    move-object/from16 v36, v7

    iget v7, v0, Lcom/android/camera/effect/framework/graphics/Block;->mRowStride:I

    move/from16 v37, v15

    iget v15, v0, Lcom/android/camera/effect/framework/graphics/Block;->mOffset:I

    move/from16 v38, v14

    iget-object v14, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v14}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v14

    iget v14, v14, Lcom/android/camera/effect/framework/image/MemImage;->mChannels:I

    const/4 v11, 0x0

    invoke-static {v11, v11, v6, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const/4 v11, 0x0

    move/from16 v39, v1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v11, v11, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 v1, 0x4100

    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    const-string v1, "[loop%d/%d]gl predraw"

    move/from16 v40, v2

    const/4 v11, 0x2

    new-array v2, v11, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v21, 0x0

    aput-object v11, v2, v21

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v21, 0x1

    aput-object v11, v2, v21

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    mul-int v11, v15, v14

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object v29

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v30

    move/from16 v31, v6

    move/from16 v32, v3

    move/from16 v33, v7

    move/from16 v34, v11

    invoke-virtual/range {v29 .. v34}, Lcom/android/camera/effect/framework/image/MemImage;->textureWithStride(IIIII)V

    const-string v1, "[loop%d/%d]gl uploadtexture textureId %d"

    const/4 v7, 0x3

    new-array v2, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x0

    aput-object v14, v2, v15

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x1

    aput-object v14, v2, v15

    iget-object v14, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v14}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x2

    aput-object v14, v2, v15

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    move-object v1, v8

    check-cast v1, Lcom/android/camera/effect/renders/PipeRender;

    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;

    iget-object v14, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v14}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v30

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v35, 0x1

    move-object/from16 v29, v2

    move/from16 v33, v6

    move/from16 v34, v3

    invoke-direct/range {v29 .. v35}, Lcom/android/camera/effect/draw_mode/DrawIntTexAttribute;-><init>(IIIIIZ)V

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/renders/PipeRender;->drawOnExtraFrameBufferOnce(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    invoke-virtual {v0, v12, v13}, Lcom/android/camera/effect/framework/graphics/Block;->getOffset(II)[I

    move-result-object v14

    const/4 v0, 0x0

    aget v1, v14, v0

    int-to-float v1, v1

    iput v1, v5, Landroid/graphics/RectF;->left:F

    const/16 v17, 0x1

    aget v1, v14, v17

    int-to-float v1, v1

    iput v1, v5, Landroid/graphics/RectF;->top:F

    aget v1, v14, v0

    add-int/2addr v1, v6

    int-to-float v1, v1

    iput v1, v5, Landroid/graphics/RectF;->right:F

    aget v1, v14, v17

    add-int/2addr v1, v3

    int-to-float v1, v1

    iput v1, v5, Landroid/graphics/RectF;->bottom:F

    aget v1, v14, v0

    sub-int v18, v40, v1

    aget v0, v14, v17

    sub-int v21, v39, v0

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    move-object/from16 v2, p1

    iget-object v1, v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWaterInfos:Ljava/util/List;

    const/16 v22, 0x0

    aget v0, v14, v22

    neg-int v0, v0

    aget v7, v14, v17

    neg-int v7, v7

    iget v15, v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object/from16 v41, v9

    iget-boolean v9, v2, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mIsPortraitRawData:Z

    move/from16 v23, v0

    move-object v0, v10

    move/from16 v42, v39

    move/from16 v43, v11

    move/from16 v44, v40

    move-object v11, v2

    move/from16 v2, v23

    move/from16 v45, v3

    move/from16 v23, v25

    move v3, v7

    move v7, v4

    move/from16 v24, v26

    move v4, v12

    move/from16 v46, v12

    move-object/from16 v47, v14

    move/from16 v14, v22

    move-object v12, v5

    move v5, v13

    move/from16 v48, v6

    move-object/from16 v49, v28

    move/from16 v6, v38

    move/from16 v50, v7

    move/from16 v51, v13

    move-object/from16 v14, v36

    const/16 v13, 0xa5

    move/from16 v7, v37

    move-object/from16 v17, v8

    move v8, v15

    move-object/from16 v15, v41

    invoke-direct/range {v0 .. v9}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawAgeGenderAndMagicMirrorWater(Ljava/util/List;IIIIIIIZ)V

    iget-boolean v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_a

    iget v1, v12, Landroid/graphics/RectF;->left:F

    iget v2, v12, Landroid/graphics/RectF;->top:F

    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, v14, Landroid/graphics/RectF;->left:F

    iget v6, v14, Landroid/graphics/RectF;->top:F

    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    move-result v7

    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    move-result v8

    move-object v0, v10

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->rectangle_collision(FFFFFFFF)Z

    move-result v0

    if-eqz v0, :cond_a

    iget v1, v12, Landroid/graphics/RectF;->left:F

    iget v2, v12, Landroid/graphics/RectF;->top:F

    iget v3, v12, Landroid/graphics/RectF;->right:F

    iget v4, v12, Landroid/graphics/RectF;->bottom:F

    iget v5, v14, Landroid/graphics/RectF;->left:F

    iget v6, v14, Landroid/graphics/RectF;->top:F

    iget v7, v14, Landroid/graphics/RectF;->right:F

    iget v8, v14, Landroid/graphics/RectF;->bottom:F

    move-object v0, v10

    invoke-direct/range {v0 .. v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->getIntersectRect(FFFFFFFF)[F

    move-result-object v0

    const/4 v1, 0x0

    aget v2, v0, v1

    float-to-int v3, v2

    const/4 v2, 0x1

    aget v4, v0, v2

    float-to-int v4, v4

    const/4 v9, 0x2

    aget v5, v0, v9

    aget v6, v0, v1

    sub-float/2addr v5, v6

    float-to-int v5, v5

    const/4 v8, 0x3

    aget v6, v0, v8

    aget v0, v0, v2

    sub-float/2addr v6, v0

    float-to-int v6, v6

    aget v7, v47, v1

    aget v0, v47, v2

    const/4 v1, 0x3

    move v8, v0

    move v0, v9

    move v9, v1

    invoke-static/range {v3 .. v9}, Lcom/android/camera/effect/ShaderNativeUtil;->mergeWaterMarkRange(IIIIIII)V

    iget v6, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move v8, v0

    move-object v0, v10

    move-object v1, v11

    move v9, v2

    move/from16 v2, v18

    move/from16 v3, v21

    move/from16 v4, v24

    move/from16 v5, v23

    move-object/from16 v7, v16

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawTimeWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    move-result-object v16

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gJ()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    if-eqz v0, :cond_9

    iget-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_9

    iget v6, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object v0, v10

    move-object v1, v11

    move/from16 v2, v18

    move/from16 v3, v21

    move/from16 v4, v24

    move/from16 v5, v23

    move-object/from16 v7, v20

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawFrontCameraWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    move-result-object v20

    goto :goto_8

    :cond_9
    iget v6, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    move-object v0, v10

    move-object v1, v11

    move/from16 v2, v18

    move/from16 v3, v21

    move/from16 v4, v24

    move/from16 v5, v23

    move-object/from16 v7, v19

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawDoubleShotWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;

    move-result-object v19

    goto :goto_8

    :cond_a
    const/4 v8, 0x2

    const/4 v9, 0x1

    :goto_8
    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    const-string v0, "[loop%d/%d]gl gldraw"

    new-array v1, v8, [Ljava/lang/Object;

    move/from16 v2, v50

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v9

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v0

    move/from16 v4, v43

    move/from16 v3, v45

    move/from16 v1, v48

    invoke-virtual {v0, v1, v3, v4}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->readBuffer(III)V

    const-string v0, "[loop%d/%d]gl readPixelAndMerge"

    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v9

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    add-int/lit8 v4, v2, 0x1

    move-object v5, v12

    move-object v7, v14

    move-object v9, v15

    move-object/from16 v8, v17

    move/from16 v25, v23

    move/from16 v26, v24

    move/from16 v15, v37

    move/from16 v14, v38

    move/from16 v1, v42

    move/from16 v2, v44

    move/from16 v12, v46

    move-object/from16 v6, v49

    move/from16 v13, v51

    goto/16 :goto_7

    :cond_b
    move/from16 v42, v1

    move/from16 v44, v2

    move-object/from16 v49, v6

    const/4 v9, 0x1

    const/16 v13, 0xa5

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glIsTexture(I)Z

    move-result v0

    if-eqz v0, :cond_c

    new-array v0, v9, [I

    iget-object v1, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    invoke-static {v9, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    :cond_c
    iget v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mRequestModuleIdx:I

    if-ne v0, v13, :cond_d

    move/from16 v0, v42

    move/from16 v5, v44

    invoke-static {v5, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->getCenterSquareImage(II)V

    :cond_d
    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    iget-boolean v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_e

    iget-object v0, v10, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/android/camera/effect/ShaderNativeUtil;->getWaterMarkRange(II)[B

    move-result-object v0

    iput-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDataOfTheRegionUnderWatermarks:[B

    move-object/from16 v0, v49

    iput-object v0, v11, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mCoordinatesOfTheRegionUnderWatermarks:[I

    :cond_e
    return-void
.end method

.method private checkFrameBuffer(II)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2900(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/FrameBuffer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2900(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/FrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    if-lt v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2900(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/FrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2902(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/FrameBuffer;)Lcom/android/camera/effect/FrameBuffer;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    new-instance v1, Lcom/android/camera/effect/FrameBuffer;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, p2, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2902(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/FrameBuffer;)Lcom/android/camera/effect/FrameBuffer;

    :cond_1
    return-void
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

    invoke-static {}, Lcom/mi/config/b;->hM()Z

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

    invoke-direct {v2, v11, v3, v4, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

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

.method private drawDoubleShotWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;
    .locals 8

    invoke-static {}, Lcom/mi/config/b;->hM()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    if-eqz p7, :cond_1

    invoke-direct {p0, p7, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p7

    :cond_1
    iget-boolean p1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1600(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p7

    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p7

    invoke-static {p1, p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1602(Lcom/android/camera/effect/renders/SnapshotEffectRender;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-static {p7, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1700(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p7

    invoke-static {p1, p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1502(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    :cond_2
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getDefaultWatermarkStr()Ljava/lang/String;

    move-result-object p7

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p7

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelRear48MPOn()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->ga()Z

    move-result v0

    if-nez v0, :cond_4

    if-eqz p7, :cond_4

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p7

    if-nez p7, :cond_3

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1900(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p7, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1802(Lcom/android/camera/effect/renders/SnapshotEffectRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    :cond_3
    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p7

    if-eqz p7, :cond_4

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p1

    :cond_4
    move-object v1, p1

    new-instance p1, Lcom/android/camera/effect/renders/ImageWaterMark;

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v5

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v6

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v7

    move-object v0, p1

    move v2, p4

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/ImageWaterMark;-><init>(Landroid/graphics/Bitmap;IIIFFF)V

    invoke-direct {p0, p1, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p1

    :cond_5
    return-object v1
.end method

.method private drawFrontCameraWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;
    .locals 8

    invoke-static {}, Lcom/mi/config/b;->hM()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    if-eqz p7, :cond_1

    invoke-direct {p0, p7, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p7

    :cond_1
    iget-boolean p1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDeviceWaterMarkEnabled:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance p1, Lcom/android/camera/effect/renders/ImageWaterMark;

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v5

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v6

    iget-object p7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2600(Lcom/android/camera/effect/renders/SnapshotEffectRender;)F

    move-result v7

    move-object v0, p1

    move v2, p4

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/ImageWaterMark;-><init>(Landroid/graphics/Bitmap;IIIFFF)V

    invoke-direct {p0, p1, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p1

    :cond_2
    return-object v1
.end method

.method private drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ)Z
    .locals 10

    nop

    new-instance v5, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    invoke-direct {v5, v0, v1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;-><init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;II)V

    const/4 v6, 0x1

    move v2, v6

    :goto_0
    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    sget v1, Lcom/android/gallery3d/ui/BaseGLCanvas;->sMaxTextureSize:I

    const/4 v3, 0x2

    if-gt v0, v1, :cond_4

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    sget v1, Lcom/android/gallery3d/ui/BaseGLCanvas;->sMaxTextureSize:I

    if-le v0, v1, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "downScale: %d width: %d %d parallel: %b"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    iget v8, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v6

    iget v8, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewWidth:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v1, v4, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mEffectIndex:I

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffectOnlyWatermarkRange(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->saveMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ[B)Z

    move-result p1

    return p1

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result p2

    if-nez p2, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->blockSplitApplyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)V

    iget-object p2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object p2

    const-string v0, "[NewEffectFramework] done"

    invoke-virtual {p2, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/image/MemImage;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v0

    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v2, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    invoke-virtual {p2, v0, v1, v2}, Lcom/android/camera/effect/framework/image/MemImage;->encodeJpeg(III)[B

    move-result-object p2

    invoke-direct {p0, p1, v9, p3, p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->saveMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ[B)Z

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object p2

    invoke-direct {p0, p1, v9, p3, p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->saveMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ[B)Z

    nop

    :goto_2
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object p1

    const-string p2, "TOTAL finish"

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    return v6

    :cond_4
    :goto_3
    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    div-int/2addr v0, v3

    iput v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    div-int/2addr v0, v3

    iput v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    mul-int/lit8 v2, v2, 0x2

    goto/16 :goto_0
.end method

.method private drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z
    .locals 25

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    if-nez v0, :cond_0

    iget-object v0, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v7}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3700(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;)Lcom/android/gallery3d/exif/ExifInterface;

    move-result-object v0

    iput-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v1, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/exif/ExifInterface;->addAlgorithmComment(Ljava/lang/String;)Z

    :cond_0
    new-instance v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;

    iget-object v0, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-direct {v8, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;-><init>(Lcom/android/camera/effect/renders/SnapshotEffectRender;)V

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v5, 0x0

    move-object v0, v6

    move-object v1, v7

    move-object v4, v8

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IZLcom/android/camera/effect/renders/SnapshotEffectRender$Size;Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;)[B

    move-result-object v0

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "drawThumbJpeg: thumbLen="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v0, :cond_1

    const-string v3, "null"

    goto :goto_0

    :cond_1
    array-length v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_2

    iget-object v1, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v1, v0}, Lcom/android/gallery3d/exif/ExifInterface;->setCompressedThumbnail([B)Z

    nop

    :cond_2
    iget v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    move/from16 v21, v1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    move/from16 v21, v0

    :goto_1
    if-eqz p2, :cond_4

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v9

    iget-object v10, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    iget-wide v11, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    iget-object v13, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    iget v14, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Lcom/android/gallery3d/exif/ExifInterface;->getThumbnailBytes()[B

    move-result-object v15

    iget v0, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->width:I

    iget v2, v8, Lcom/android/camera/effect/renders/SnapshotEffectRender$Size;->height:I

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    iget-object v3, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    const/16 v24, 0x0

    move/from16 v16, v0

    move/from16 v17, v2

    move-object/from16 v23, v3

    invoke-static/range {v9 .. v24}, Lcom/android/camera/storage/Storage;->addImage(Landroid/content/Context;Ljava/lang/String;JLandroid/location/Location;I[BIIZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    iget-object v0, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_4

    iget-object v0, v6, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    iget-object v2, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    iget-object v3, v7, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/ActivityBase;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    :cond_4
    return v1
.end method

.method private drawTimeWaterMark(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;IIIIILcom/android/camera/effect/renders/WaterMark;)Lcom/android/camera/effect/renders/WaterMark;
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->hM()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    if-eqz p7, :cond_1

    invoke-direct {p0, p7, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p7

    :cond_1
    iget-object v0, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    if-eqz v0, :cond_3

    if-nez p7, :cond_3

    iget-object p1, p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTimeWaterMarkText:Ljava/lang/String;

    invoke-static {}, Lcom/mi/config/b;->gW()Z

    move-result p7

    if-eqz p7, :cond_2

    new-instance p7, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    invoke-direct {p7, p1, p4, p5, p6}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;-><init>(Ljava/lang/String;III)V

    goto :goto_0

    :cond_2
    new-instance p7, Lcom/android/camera/effect/renders/TextWaterMark;

    invoke-direct {p7, p1, p4, p5, p6}, Lcom/android/camera/effect/renders/TextWaterMark;-><init>(Ljava/lang/String;III)V

    :goto_0
    invoke-direct {p0, p7, p2, p3, p6}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    return-object p7

    :cond_3
    return-object v1
.end method

.method private drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

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

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    neg-int p4, p4

    int-to-float p4, p4

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, p4, v2, v2, v1}, Lcom/android/camera/effect/GLCanvasState;->rotate(FFFF)V

    iget-object p4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p4

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
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result p4

    add-int v2, p2, p4

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result p2

    add-int v3, p3, p2

    iget-object p2, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/SnapshotCanvas;->getBasicRender()Lcom/android/camera/effect/renders/BasicRender;

    move-result-object p2

    new-instance p3, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getHeight()I

    move-result v5

    move-object v0, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-virtual {p2, p3}, Lcom/android/camera/effect/renders/BasicRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    return-void
.end method

.method private fetchRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getEffectRenderGroup()Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    :cond_0
    return-object v1
.end method

.method private getEffectRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 4

    new-instance v0, Lcom/android/camera/effect/renders/PipeRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p1, v1, :cond_0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v1

    if-eqz v1, :cond_2

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_1
    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, 0x0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "circle"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    goto :goto_0

    :cond_3
    const-string v3, "parallel"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_5
    :goto_1
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/PipeRender;->getRenderSize()I

    move-result v1

    if-nez v1, :cond_6

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    :cond_6
    return-object v0
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

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/EglCore;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    new-instance v1, Lcom/android/camera/effect/framework/gles/EglCore;

    const/4 v2, 0x2

    invoke-direct {v1, p1, v2}, Lcom/android/camera/effect/framework/gles/EglCore;-><init>(Landroid/opengl/EGLContext;I)V

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1402(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/framework/gles/EglCore;)Lcom/android/camera/effect/framework/gles/EglCore;

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->release()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1202(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/framework/gles/PbufferSurface;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    :cond_1
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    new-instance p2, Lcom/android/camera/effect/framework/gles/PbufferSurface;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/EglCore;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p2, v0, v1, v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;-><init>(Lcom/android/camera/effect/framework/gles/EglCore;II)V

    invoke-static {p1, p2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1202(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/framework/gles/PbufferSurface;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    :cond_2
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

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

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$2902(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/FrameBuffer;)Lcom/android/camera/effect/FrameBuffer;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$102(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/SnapshotCanvas;)Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)V

    return-void
.end method

.method private saveMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ[B)Z
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mainLen="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v2, :cond_0

    const-string v5, "null"

    goto :goto_0

    :cond_0
    array-length v5, v2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v2, :cond_1

    iput-object v2, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    nop

    :cond_1
    if-eqz p2, :cond_a

    nop

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    monitor-enter v2

    :try_start_0
    iget-object v3, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/util/Map;

    move-result-object v4

    iget-object v5, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3600(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/storage/ImageSaver;

    move-result-object v2

    const/4 v4, 0x0

    if-eqz v2, :cond_5

    iget-object v0, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$3600(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/storage/ImageSaver;

    move-result-object v5

    iget-object v6, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    iget-boolean v7, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mNeedThumbnail:Z

    if-nez v3, :cond_2

    iget-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    move-object v8, v0

    goto :goto_1

    :cond_2
    move-object v8, v3

    :goto_1
    if-nez v3, :cond_3

    :goto_2
    move-object v9, v4

    goto :goto_3

    :cond_3
    iget-object v4, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    goto :goto_2

    :goto_3
    iget-wide v10, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    iget-object v12, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    iget-object v13, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    iget v14, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v15, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    iget-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget v2, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    const/16 v18, 0x0

    const/16 v19, 0x0

    if-nez v3, :cond_4

    iget-boolean v3, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mFinalImage:Z

    :goto_4
    move/from16 v20, v3

    goto :goto_5

    :cond_4
    const/4 v3, 0x0

    goto :goto_4

    :goto_5
    const/16 v21, 0x0

    iget-object v3, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    iget-object v4, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    iget v1, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mPreviewThumbnailHash:I

    move-object/from16 v16, v0

    move/from16 v17, v2

    move/from16 v22, p3

    move-object/from16 v23, v3

    move-object/from16 v24, v4

    move/from16 v25, v1

    invoke-virtual/range {v5 .. v25}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;I)V

    goto/16 :goto_9

    :cond_5
    iget-object v2, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-nez v2, :cond_7

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v2

    const-string v4, "addImageForEffect"

    invoke-static {v2, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v4

    if-nez v3, :cond_6

    iget-object v3, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    :cond_6
    move-object v5, v3

    iget-wide v6, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mDate:J

    iget-object v8, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    iget v9, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    iget-object v10, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    iget v11, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v12, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    const/4 v13, 0x0

    iget-object v15, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mAlgorithmName:Ljava/lang/String;

    iget-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mInfo:Lcom/xiaomi/camera/core/PictureInfo;

    move/from16 v14, p3

    move-object/from16 v16, v0

    invoke-static/range {v4 .. v16}, Lcom/android/camera/storage/Storage;->addImageForEffect(Landroid/app/Activity;Ljava/lang/String;JLandroid/location/Location;I[BIIZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)Landroid/net/Uri;

    goto :goto_9

    :cond_7
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateImage: uri="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v5

    iget-object v6, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    iget-object v7, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v8, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mUri:Landroid/net/Uri;

    if-nez v3, :cond_8

    iget-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    move-object v9, v0

    goto :goto_6

    :cond_8
    move-object v9, v3

    :goto_6
    iget-object v10, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mLoc:Landroid/location/Location;

    iget v11, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mJpegOrientation:I

    iget v12, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v13, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    if-nez v3, :cond_9

    :goto_7
    move-object v14, v4

    goto :goto_8

    :cond_9
    iget-object v4, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mTitle:Ljava/lang/String;

    goto :goto_7

    :goto_8
    invoke-static/range {v5 .. v14}, Lcom/android/camera/storage/Storage;->updateImage(Landroid/content/Context;[BLcom/android/gallery3d/exif/ExifInterface;Landroid/net/Uri;Ljava/lang/String;Landroid/location/Location;IIILjava/lang/String;)Z

    :goto_9
    goto :goto_a

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_a
    iget-object v0, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_2
    iget-object v2, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mExif:Lcom/android/gallery3d/exif/ExifInterface;

    iget-object v3, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    invoke-virtual {v2, v3, v0}, Lcom/android/gallery3d/exif/ExifInterface;->writeExif([BLjava/io/OutputStream;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    if-eqz v2, :cond_b

    iput-object v2, v1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    :cond_b
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_a

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_c
    :goto_a
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object v0

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    goto/16 :goto_4

    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->release()V

    goto/16 :goto_4

    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    invoke-direct {p0, p1, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_4

    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    invoke-direct {p0, p1, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    goto/16 :goto_4

    :pswitch_4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-lez v3, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    nop

    move v3, v2

    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    if-lez p1, :cond_2

    move p1, v1

    goto :goto_1

    :cond_2
    nop

    move p1, v2

    :goto_1
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget v7, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    iget v8, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    invoke-static {v6, v7, v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$900(Lcom/android/camera/effect/renders/SnapshotEffectRender;II)I

    move-result v6

    iget v7, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    if-eqz v7, :cond_7

    iget v7, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    if-nez v7, :cond_3

    goto/16 :goto_3

    :cond_3
    iget-object v7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget v8, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    invoke-static {v7, v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$702(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I

    iget-object v7, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget v8, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    div-int/2addr v8, v6

    invoke-static {v7, v8}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$802(Lcom/android/camera/effect/renders/SnapshotEffectRender;I)I

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v6

    if-ne v4, v6, :cond_4

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v4

    if-eq v5, v4, :cond_5

    :cond_4
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v1

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->reszieBuffer(II)V

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    goto :goto_2

    :cond_5
    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v5}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$700(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v5

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$800(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->initBuffer(II)V

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v4, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1102(Lcom/android/camera/effect/renders/SnapshotEffectRender;Z)Z

    :goto_2
    if-eqz v3, :cond_6

    if-nez p1, :cond_6

    invoke-direct {p0, v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawThumbJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)Z

    :cond_6
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object v1

    const-string v3, "TOTAL"

    invoke-virtual {v1, v3}, Lcom/android/camera/effect/framework/utils/CounterUtil;->reset(Ljava/lang/String;)V

    invoke-direct {p0, v0, v2, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeCurrent()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;->release()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->makeNothingCurrent()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;

    move-result-object p1

    const-string v0, "TOTAL"

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/framework/utils/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_4

    :cond_7
    :goto_3
    const-string p1, "jpeg data is broken width %d height %d length %d"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget v4, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    const/4 v1, 0x2

    iget-object v4, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    if-eqz v4, :cond_8

    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    array-length v2, v0

    nop

    :cond_8
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$1000()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_4

    :pswitch_5
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    iget p1, p1, Landroid/os/Message;->arg1:I

    if-lez p1, :cond_9

    move v2, v1

    nop

    :cond_9
    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->drawMainJpeg(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;ZZ)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$400(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Z

    move-result p1

    if-eqz p1, :cond_a

    invoke-virtual {p0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_a

    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->release()V

    :cond_a
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$500(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$610(Lcom/android/camera/effect/renders/SnapshotEffectRender;)I

    monitor-exit p1

    goto :goto_4

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :pswitch_6
    const/4 p1, 0x0

    invoke-direct {p0, p1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->initEGL(Landroid/opengl/EGLContext;Z)V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    new-instance v0, Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v0}, Lcom/android/camera/effect/SnapshotCanvas;-><init>()V

    invoke-static {p1, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$102(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/SnapshotCanvas;)Lcom/android/camera/effect/SnapshotCanvas;

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    new-instance v0, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    invoke-direct {v0}, Lcom/android/camera/effect/framework/graphics/GraphicBuffer;-><init>()V

    invoke-static {p1, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$202(Lcom/android/camera/effect/renders/SnapshotEffectRender;Lcom/android/camera/effect/framework/graphics/GraphicBuffer;)Lcom/android/camera/effect/framework/graphics/GraphicBuffer;

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$100(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/effect/SnapshotCanvas;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$000(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Lcom/android/camera/ActivityBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/SnapshotCanvas;->setSize(II)V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    nop

    :goto_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public sendMessageSync(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->sendEmptyMessage(I)Z

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotEffectRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->access$300(Lcom/android/camera/effect/renders/SnapshotEffectRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    return-void
.end method

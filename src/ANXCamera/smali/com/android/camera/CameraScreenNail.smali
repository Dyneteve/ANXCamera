.class public Lcom/android/camera/CameraScreenNail;
.super Lcom/android/camera/SurfaceTextureScreenNail;
.source "CameraScreenNail.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/CameraScreenNail$RequestRenderListener;,
        Lcom/android/camera/CameraScreenNail$NailListener;,
        Lcom/android/camera/CameraScreenNail$ArrivedType;
    }
.end annotation


# static fields
.field private static final ANIM_CAPTURE_RUNNING:I = 0xc

.field private static final ANIM_CAPTURE_START:I = 0xb

.field private static final ANIM_MODULE_COPY_TEXTURE:I = 0x1f

.field private static final ANIM_MODULE_COPY_TEXTURE_WITH_ALPHA:I = 0x25

.field private static final ANIM_MODULE_DRAW_PREVIEW:I = 0x20

.field private static final ANIM_MODULE_RESUME:I = 0x23

.field private static final ANIM_MODULE_RUNNING:I = 0x21

.field private static final ANIM_MODULE_WAITING_FIRST_FRAME:I = 0x22

.field private static final ANIM_NONE:I = 0x0

.field private static final ANIM_READ_LAST_FRAME_GAUSSIAN:I = 0x24

.field private static final ANIM_SWITCH_COPY_TEXTURE:I = 0x15

.field private static final ANIM_SWITCH_DRAW_PREVIEW:I = 0x16

.field private static final ANIM_SWITCH_RESUME:I = 0x19

.field private static final ANIM_SWITCH_RUNNING:I = 0x17

.field private static final ANIM_SWITCH_WAITING_FIRST_FRAME:I = 0x18

.field public static final FRAME_AVAILABLE_AFTER_CATCH:I = 0x4

.field public static final FRAME_AVAILABLE_ON_CREATE:I = 0x1

.field private static final STATE_HIBERNATE:I = 0xe

.field private static final STATE_READ_PIXELS:I = 0xd

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAnimState:I

.field private mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

.field private mDisableSwitchAnimationOnce:Z

.field private mExternalFrameProcessorCopy:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

.field private mFirstFrameArrived:Z

.field private mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mFrameNumber:I

.field private volatile mIsDrawBlackFrame:Z

.field private mLastFrameGaussianBitmap:Landroid/graphics/Bitmap;

.field private mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

.field private mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

.field private mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

.field private mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

.field private mReadPixelsNum:I

.field private mRequestRenderListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/CameraScreenNail$RequestRenderListener;",
            ">;"
        }
    .end annotation
.end field

.field private mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

.field private final mTextureTransformMatrix:[F

.field private mVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/CameraScreenNail$NailListener;Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/android/camera/SurfaceTextureScreenNail;-><init>(Lcom/android/camera/SurfaceTextureScreenNail$SurfaceTextureScreenNailCallback;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    const/16 v1, 0x10

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    new-instance v1, Lcom/android/camera/CaptureAnimManager;

    invoke-direct {v1}, Lcom/android/camera/CaptureAnimManager;-><init>()V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    new-instance v1, Lcom/android/camera/SwitchAnimManager;

    invoke-direct {v1}, Lcom/android/camera/SwitchAnimManager;-><init>()V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    new-instance v1, Lcom/android/camera/SwitchAnimManager;

    invoke-direct {v1}, Lcom/android/camera/SwitchAnimManager;-><init>()V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-virtual {p0, p2}, Lcom/android/camera/CameraScreenNail;->addRequestListener(Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V

    return-void
.end method

.method private copyExternalPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V
    .locals 6

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v4

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v5

    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    int-to-float v0, v4

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    int-to-float v2, v5

    div-float/2addr v2, v1

    invoke-virtual {p3, v0, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {p3, v0, v2, v0}, Lcom/android/camera/effect/GLCanvasState;->scale(FFF)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p3

    neg-int v0, v4

    int-to-float v0, v0

    div-float/2addr v0, v1

    neg-int v2, v5

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p3, v0, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    new-instance p3, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p3

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    return-void
.end method

.method private copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V
    .locals 9

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v7

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v8

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {p0, v0}, Lcom/android/camera/CameraScreenNail;->updateTransformMatrix([F)V

    const/4 v0, 0x0

    if-nez p3, :cond_0

    new-instance p3, Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {p3, p1, p2, v0}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessorCopy:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessorCopy:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessor:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    :goto_0
    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    const/4 v3, 0x1

    if-ne p2, v2, :cond_4

    if-eqz v1, :cond_4

    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-nez p2, :cond_2

    new-instance p2, Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p2, v7, v8, v3}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    iput-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    :cond_2
    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez p2, :cond_3

    new-instance p2, Lcom/android/camera/effect/FrameBuffer;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p2, p1, v2, v0}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_3
    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, p2}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getDisplayRect()Landroid/graphics/Rect;

    move-result-object p2

    invoke-interface {v1, p2, v7, v8, v3}, Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;->onDrawFrame(Landroid/graphics/Rect;IIZ)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/CameraScreenNail;->copyExternalPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    goto/16 :goto_1

    :cond_4
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result p2

    const/16 v2, 0xb1

    if-ne p2, v2, :cond_8

    if-eqz v1, :cond_7

    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-nez p2, :cond_5

    new-instance p2, Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p2, v7, v8, v3}, Lcom/android/gallery3d/ui/RawTexture;-><init>(IIZ)V

    iput-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    :cond_5
    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez p2, :cond_6

    new-instance p2, Lcom/android/camera/effect/FrameBuffer;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p2, p1, v2, v0}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_6
    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, p2}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getDisplayRect()Landroid/graphics/Rect;

    move-result-object p2

    invoke-interface {v1, p2, v7, v8, v3}, Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;->onDrawFrame(Landroid/graphics/Rect;IIZ)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    iget-object p2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/CameraScreenNail;->copyExternalPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    goto :goto_1

    :cond_7
    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance p2, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p2

    move v5, v7

    move v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, p2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance p2, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, p2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    goto :goto_1

    :cond_8
    invoke-interface {p1, p3}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance p2, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p2

    move v5, v7

    move v6, v8

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, p2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    :goto_1
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessorCopy:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    return-void
.end method

.method private notifyFrameAvailable(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v0, p1}, Lcom/android/camera/CameraScreenNail$NailListener;->onFrameAvailable(I)V

    return-void
.end method

.method private postRequestListener()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraScreenNail$RequestRenderListener;

    invoke-interface {v1}, Lcom/android/camera/CameraScreenNail$RequestRenderListener;->requestRender()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private readPreviewPixels(Lcom/android/gallery3d/ui/GLCanvas;II)[B
    .locals 9

    mul-int v0, p2, p3

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {v1, v2}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    invoke-virtual {p0, v1}, Lcom/android/camera/CameraScreenNail;->updateTransformMatrix([F)V

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/effect/FrameBuffer;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v2, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, v1}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance v1, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;

    iget-object v3, p0, Lcom/android/camera/CameraScreenNail;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iget-object v4, p0, Lcom/android/camera/CameraScreenNail;->mTextureTransformMatrix:[F

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, v1

    move v7, p2

    move v8, p3

    invoke-direct/range {v2 .. v8}, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;-><init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V

    invoke-interface {p1, v1}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move v3, p2

    move v4, p3

    move-object v7, v0

    invoke-static/range {v1 .. v7}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    return-object p1
.end method

.method private renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)V
    .locals 7

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v4

    invoke-virtual {p2}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v5

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_0
    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->prepareBlurRenders()V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, v6

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    return-void
.end method


# virtual methods
.method public acquireSurfaceTexture()V
    .locals 2

    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "acquireSurfaceTexture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    invoke-super {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->acquireSurfaceTexture()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public addRequestListener(Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public animateCapture(I)V
    .locals 3

    iget-object p1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "animateCapture: state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/CaptureAnimManager;->animateHoldAndSlide()V

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    const/16 v0, 0xb

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public animateHold(I)V
    .locals 3

    iget-object p1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "animateHold: state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/CaptureAnimManager;->animateHold()V

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    const/16 v0, 0xb

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public animateModuleCopyTexture(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const/16 p1, 0x25

    iput p1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object p1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "state=MODULE_COPY_TEXTURE_WITH_ALPHA"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/16 p1, 0x1f

    iput p1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object p1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "state=MODULE_COPY_TEXTURE"

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object p1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessor:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessorCopy:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public animateSlide()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0xc

    if-eq v1, v2, :cond_0

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot animateSlide outside of animateCapture! Animation state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v1}, Lcom/android/camera/CaptureAnimManager;->animateSlide()V

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public animateSwitchCameraBefore()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchBefore: state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x16

    if-ne v1, v2, :cond_0

    const/16 v1, 0x17

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/SwitchAnimManager;->startAnimation(Z)V

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public animateSwitchCopyTexture()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    const/16 v1, 0x15

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "state=SWITCH_COPY_TEXTURE"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public clearAnimation()V
    .locals 1

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->clearAnimation()V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/CaptureAnimManager;->clearAnimation()V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->clearAnimation()V

    :cond_0
    return-void
.end method

.method public directDraw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    return-void
.end method

.method public disableSwitchAnimationOnce()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    move/from16 v13, p5

    iget-object v14, v0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v14

    :try_start_0
    iget-boolean v1, v0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    const/4 v2, 0x1

    if-nez v1, :cond_0

    iput-boolean v2, v0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    :cond_0
    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    if-eqz v1, :cond_3

    nop

    nop

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v1

    if-eqz v1, :cond_2

    if-le v12, v13, :cond_1

    sub-int v1, v12, v13

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v10

    nop

    move v2, v1

    move v3, v11

    move v4, v13

    :goto_0
    move v5, v4

    goto :goto_1

    :cond_1
    sub-int v1, v13, v12

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v11

    nop

    move v3, v1

    move v2, v10

    move v4, v12

    goto :goto_0

    :cond_2
    move v2, v10

    move v3, v11

    move v4, v12

    move v5, v13

    :goto_1
    iget-object v0, v0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    move-object v1, v9

    invoke-virtual/range {v0 .. v5}, Lcom/android/gallery3d/ui/BitmapTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    monitor-exit v14

    return-void

    :cond_3
    iget-boolean v1, v0, Lcom/android/camera/CameraScreenNail;->mIsDrawBlackFrame:Z

    if-eqz v1, :cond_4

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "draw: skip frame..."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Lcom/android/camera/effect/draw_mode/FillRectAttribute;

    int-to-float v4, v10

    int-to-float v5, v11

    int-to-float v6, v12

    int-to-float v7, v13

    const/high16 v8, -0x1000000

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/android/camera/effect/draw_mode/FillRectAttribute;-><init>(FFFFI)V

    invoke-interface {v9, v1}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    monitor-exit v14

    return-void

    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v8

    if-eqz v8, :cond_14

    iget-boolean v1, v0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    if-nez v1, :cond_5

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v1, :cond_5

    goto/16 :goto_d

    :cond_5
    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v7, 0x21

    const/4 v6, 0x0

    sparse-switch v1, :sswitch_data_0

    :goto_2
    move v15, v6

    goto/16 :goto_5

    :sswitch_0
    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "draw: state=ANIM_READ_LAST_FRAME_GAUSSIAN"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {v0, v9, v1, v2}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    invoke-virtual/range {p0 .. p5}, Lcom/android/camera/CameraScreenNail;->drawGaussianBitmap(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    iput v6, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    goto :goto_2

    :sswitch_1
    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    iget-object v3, v0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {v0, v9, v1, v3}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v1, v10, v11, v12, v13}, Lcom/android/camera/SwitchAnimManager;->setReviewDrawingSize(IIII)V

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v3, "draw: state=MODULE_DRAW_PREVIEW"

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v3, 0x25

    if-ne v1, v3, :cond_6

    goto :goto_3

    :cond_6
    move v2, v6

    :goto_3
    iput v7, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v1, v2}, Lcom/android/camera/SwitchAnimManager;->startAnimation(Z)V

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto :goto_2

    :sswitch_2
    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {v0, v9, v1, v2}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v1, v10, v11, v12, v13}, Lcom/android/camera/SwitchAnimManager;->setReviewDrawingSize(IIII)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v1}, Lcom/android/camera/CameraScreenNail$NailListener;->onPreviewTextureCopied()V

    const/16 v1, 0x16

    iput v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "draw: state=SWITCH_DRAW_PREVIEW"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :sswitch_3
    invoke-virtual {v8}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget-object v5, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object v2, v9

    move v3, v10

    move v4, v11

    move-object/from16 v16, v5

    move v5, v12

    move v15, v6

    move v6, v13

    move-object/from16 v7, v16

    invoke-virtual/range {v1 .. v7}, Lcom/android/camera/SwitchAnimManager;->drawPreview(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)Z

    goto/16 :goto_5

    :sswitch_4
    move v15, v6

    invoke-virtual {v8}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    invoke-interface/range {p1 .. p1}, Lcom/android/gallery3d/ui/GLCanvas;->clearBuffer()V

    goto :goto_5

    :sswitch_5
    move v15, v6

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result v1

    iget-object v3, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v3}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result v3

    mul-int v4, v12, v3

    mul-int v5, v13, v1

    if-le v4, v5, :cond_7

    nop

    div-int v3, v5, v12

    goto :goto_4

    :cond_7
    div-int v1, v4, v13

    nop

    :goto_4
    invoke-direct {v0, v9, v1, v3}, Lcom/android/camera/CameraScreenNail;->readPreviewPixels(Lcom/android/gallery3d/ui/GLCanvas;II)[B

    move-result-object v4

    iget v5, v0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    sub-int/2addr v5, v2

    iput v5, v0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    sget-object v5, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "draw: state=STATE_READ_PIXELS mReadPixelsNum="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v5, v0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    if-ge v5, v2, :cond_8

    iput v15, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    :cond_8
    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v2, v4, v1, v3}, Lcom/android/camera/CameraScreenNail$NailListener;->onPreviewPixelsRead([BII)V

    goto :goto_5

    :sswitch_6
    move v15, v6

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-direct {v0, v9, v1, v2}, Lcom/android/camera/CameraScreenNail;->copyPreviewTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;Lcom/android/camera/effect/FrameBuffer;)V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    invoke-virtual {v1, v10, v11, v12, v13}, Lcom/android/camera/CaptureAnimManager;->startAnimation(IIII)V

    const/16 v1, 0xc

    iput v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "draw: state=CAPTURE_RUNNING"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    :sswitch_7
    move v15, v6

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    nop

    :goto_5
    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x17

    const/16 v7, 0x19

    if-eq v1, v2, :cond_f

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x18

    if-eq v1, v2, :cond_f

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-ne v1, v7, :cond_9

    goto :goto_8

    :cond_9
    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_b

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1, v9, v2}, Lcom/android/camera/CaptureAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto :goto_6

    :cond_a
    iput v15, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimManager:Lcom/android/camera/CaptureAnimManager;

    iget-object v2, v0, Lcom/android/camera/CameraScreenNail;->mCaptureAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1, v9, v2}, Lcom/android/camera/CaptureAnimManager;->drawPreview(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)V

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :goto_6
    goto/16 :goto_c

    :cond_b
    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v7, 0x23

    const/16 v2, 0x21

    if-eq v1, v2, :cond_c

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x22

    if-eq v1, v2, :cond_c

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-ne v1, v7, :cond_13

    :cond_c
    invoke-virtual {v8}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object v2, v9

    move v3, v10

    move v4, v11

    move v5, v12

    move v6, v13

    move v15, v7

    move-object v7, v0

    invoke-virtual/range {v1 .. v8}, Lcom/android/camera/SwitchAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v1

    if-nez v1, :cond_e

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eq v1, v15, :cond_d

    goto :goto_7

    :cond_d
    const/4 v1, 0x0

    iput v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    goto :goto_c

    :cond_e
    :goto_7
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    goto :goto_c

    :cond_f
    :goto_8
    invoke-virtual {v8}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    nop

    iget-boolean v1, v0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    if-eqz v1, :cond_10

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object v2, v9

    move v3, v10

    move v4, v11

    move v5, v12

    move v6, v13

    move v15, v7

    move-object v7, v8

    invoke-virtual/range {v1 .. v7}, Lcom/android/camera/SwitchAnimManager;->drawPreview(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)Z

    const/4 v6, 0x0

    goto :goto_9

    :cond_10
    move v15, v7

    iget-object v1, v0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget-object v8, v0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object v2, v9

    move v3, v10

    move v4, v11

    move v5, v12

    move v6, v13

    move-object v7, v0

    invoke-virtual/range {v1 .. v8}, Lcom/android/camera/SwitchAnimManager;->drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/camera/CameraScreenNail;Lcom/android/gallery3d/ui/RawTexture;)Z

    move-result v6

    :goto_9
    if-nez v6, :cond_12

    iget v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eq v1, v15, :cond_11

    goto :goto_a

    :cond_11
    const/4 v1, 0x0

    iput v1, v0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iput-boolean v1, v0, Lcom/android/camera/CameraScreenNail;->mDisableSwitchAnimationOnce:Z

    invoke-super/range {p0 .. p5}, Lcom/android/camera/SurfaceTextureScreenNail;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    goto :goto_b

    :cond_12
    :goto_a
    invoke-direct/range {p0 .. p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :goto_b
    nop

    :cond_13
    :goto_c
    monitor-exit v14

    return-void

    :cond_14
    :goto_d
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "draw: firstFrame="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, v0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " surface="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v8, :cond_15

    invoke-virtual {v8}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    :cond_15
    monitor-exit v14

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_7
        0xb -> :sswitch_6
        0xd -> :sswitch_5
        0xe -> :sswitch_4
        0x15 -> :sswitch_2
        0x16 -> :sswitch_3
        0x1f -> :sswitch_1
        0x24 -> :sswitch_0
        0x25 -> :sswitch_1
    .end sparse-switch
.end method

.method public drawBlackFrame(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/CameraScreenNail;->mIsDrawBlackFrame:Z

    return-void
.end method

.method public drawBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 7

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    move-object v0, v6

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    return-void
.end method

.method public drawGaussianBitmap(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    iget-object p4, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {p4}, Lcom/android/gallery3d/ui/RawTexture;->getWidth()I

    move-result p4

    iget-object p5, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {p5}, Lcom/android/gallery3d/ui/RawTexture;->getHeight()I

    move-result p5

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraScreenNail;->renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    mul-int v1, p4, p5

    mul-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-nez v1, :cond_1

    new-instance v1, Lcom/android/camera/effect/FrameBuffer;

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {v1, p1, v2, v0}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;I)V

    iput-object v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, v6

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/16 v4, 0x1908

    const/16 v5, 0x1401

    move v2, p4

    move v3, p5

    move-object v6, v7

    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->endBindFrameBuffer()V

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p4, p5, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p4, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    iput-object p4, p0, Lcom/android/camera/CameraScreenNail;->mLastFrameGaussianBitmap:Landroid/graphics/Bitmap;

    sget-object p1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "readLastFrameGaussian end... bitmap = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p5, p0, Lcom/android/camera/CameraScreenNail;->mLastFrameGaussianBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p5, ", cost time = "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p2

    invoke-virtual {p4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, "ms"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public getDisplayRect()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mDisplayRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getExternalFrameProcessor()Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessor:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    return-object v0
.end method

.method public getFrameAvailableFlag()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public getLastFrameGaussianBitmap()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLastFrameGaussianBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getRenderRect()Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mRenderLayoutRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public isAnimationRunning()Z
    .locals 1

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public noDraw()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    if-eq v0, p1, :cond_0

    sget-object p1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v0, "onFrameAvailable: surface changed"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->getSkipFrameNumber()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    monitor-exit p1

    return-void

    :cond_1
    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "onFrameAvailable first frame arrived."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraEnd()V

    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeEnd()V

    invoke-direct {p0, v2}, Lcom/android/camera/CameraScreenNail;->notifyFrameAvailable(I)V

    iput-boolean v2, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    iput-boolean v2, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    :cond_2
    iget-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v1, 0x18

    if-ne v0, v1, :cond_3

    const/16 v0, 0x19

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "SWITCH_WAITING_FIRST_FRAME->SWITCH_RESUME"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->startResume()V

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v1, 0x22

    if-ne v0, v1, :cond_4

    const/16 v0, 0x23

    iput v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "MODULE_WAITING_FIRST_FRAME->MODULE_RESUME"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mModuleAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->startResume()V

    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/android/camera/CameraScreenNail;->notifyFrameAvailable(I)V

    :cond_5
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public readLastFrameGaussian()V
    .locals 3

    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "readLastFrameGaussian: not start preview return!!!"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_1
    const/16 v1, 0x24

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v1, "readLastFrameGaussian: state=ANIM_READ_LAST_FRAME_GAUSSIAN end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    :goto_0
    :try_start_1
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v2, "readLastFrameGaussian: not start preview return!!!"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public recycle()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public releaseBitmapIfNeeded()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mNailListener:Lcom/android/camera/CameraScreenNail$NailListener;

    invoke-interface {v0}, Lcom/android/camera/CameraScreenNail$NailListener;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :cond_0
    return-void
.end method

.method public releaseSurfaceTexture()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-super {p0}, Lcom/android/camera/SurfaceTextureScreenNail;->releaseSurfaceTexture()V

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    sget-object v2, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    const-string v3, "release: state=NONE"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mModuleSwitching:Z

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/RawTexture;->recycle()V

    iput-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiTexture:Lcom/android/gallery3d/ui/RawTexture;

    :cond_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v1}, Lcom/android/camera/effect/FrameBuffer;->delete()V

    iput-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_1
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/RawTexture;->recycle()V

    iput-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurTexture:Lcom/android/gallery3d/ui/RawTexture;

    :cond_2
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v1}, Lcom/android/camera/effect/FrameBuffer;->delete()V

    iput-object v2, p0, Lcom/android/camera/CameraScreenNail;->mMimojiBlurFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    :cond_3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeRequestListener(Lcom/android/camera/CameraScreenNail$RequestRenderListener;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/CameraScreenNail;->mRequestRenderListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public renderBitmapToCanvas(Landroid/graphics/Bitmap;)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraScreenNail;->mVisible:Z

    new-instance v0, Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {v0, p1}, Lcom/android/gallery3d/ui/BitmapTexture;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/android/camera/CameraScreenNail;->mBitmapTexture:Lcom/android/gallery3d/ui/BitmapTexture;

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    return-void
.end method

.method public renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimTexture:Lcom/android/gallery3d/ui/RawTexture;

    invoke-direct {p0, p1, v0}, Lcom/android/camera/CameraScreenNail;->renderBlurTexture(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)V

    return-void
.end method

.method public requestAwaken()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0xe

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public requestHibernate()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-nez v1, :cond_0

    const/16 v1, 0xe

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public requestReadPixels()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestReadPixels state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0xd

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eq v1, v2, :cond_0

    const/16 v1, 0xc

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-eq v1, v3, :cond_0

    const/16 v1, 0xb

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    if-ne v1, v3, :cond_1

    :cond_0
    iput v2, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    invoke-direct {p0}, Lcom/android/camera/CameraScreenNail;->postRequestListener()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public resetFrameAvailableFlag()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mFrameAvailableNotified:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/camera/CameraScreenNail;->mFirstFrameArrived:Z

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mFrameNumber:I

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mReadPixelsNum:I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setExternalFrameProcessor(Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/CameraScreenNail;->mExternalFrameProcessor:Lcom/android/camera/SurfaceTextureScreenNail$ExternalFrameProcessor;

    return-void
.end method

.method public setPreviewFrameLayoutSize(II)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "setPreviewFrameLayoutSize: %dx%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/mi/config/b;->iw()Z

    move-result v1

    const/16 v2, 0x2d0

    if-nez v1, :cond_0

    move v1, p1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceWidth:I

    invoke-static {}, Lcom/mi/config/b;->iw()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    mul-int/2addr v2, p2

    div-int p2, v2, p1

    :goto_1
    iput p2, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceHeight:I

    iget-object p1, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    iget p2, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceWidth:I

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mSurfaceHeight:I

    invoke-virtual {p1, p2, v1}, Lcom/android/camera/SwitchAnimManager;->setPreviewFrameLayoutSize(II)V

    invoke-virtual {p0}, Lcom/android/camera/CameraScreenNail;->updateRenderRect()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public switchCameraDone()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/camera/CameraScreenNail;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "switchDone: state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x17

    if-ne v1, v2, :cond_0

    const/16 v1, 0x18

    iput v1, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected updateExtraTransformMatrix([F)V
    .locals 6

    nop

    nop

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/high16 v1, 0x3f800000    # 1.0f

    const/16 v2, 0x17

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x18

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/android/camera/CameraScreenNail;->mAnimState:I

    const/16 v2, 0x19

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    move v2, v0

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v0}, Lcom/android/camera/SwitchAnimManager;->getExtScaleX()F

    move-result v0

    iget-object v2, p0, Lcom/android/camera/CameraScreenNail;->mSwitchAnimManager:Lcom/android/camera/SwitchAnimManager;

    invoke-virtual {v2}, Lcom/android/camera/SwitchAnimManager;->getExtScaleY()F

    move-result v2

    :goto_1
    cmpl-float v3, v0, v1

    if-nez v3, :cond_2

    cmpl-float v3, v2, v1

    if-eqz v3, :cond_3

    :cond_2
    const/4 v3, 0x0

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x0

    invoke-static {p1, v5, v4, v4, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    invoke-static {p1, v5, v0, v2, v1}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    const/high16 v0, -0x41000000    # -0.5f

    invoke-static {p1, v5, v0, v0, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    :cond_3
    return-void
.end method

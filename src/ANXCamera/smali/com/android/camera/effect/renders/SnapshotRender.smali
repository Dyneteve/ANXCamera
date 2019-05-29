.class public Lcom/android/camera/effect/renders/SnapshotRender;
.super Ljava/lang/Object;
.source "SnapshotRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;
    }
.end annotation


# static fields
.field private static final DUMP_TEXTURE:Z = false

.field private static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098

.field private static final QUEUE_LIMIT:I = 0x7

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private mBlockHeight:I

.field private mBlockWidth:I

.field private mCurrentCustomWaterMarkText:Ljava/lang/String;

.field private mDeviceWaterMarkParam:Lcom/android/camera/effect/renders/DeviceWatermarkParam;

.field private mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

.field private mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

.field private mEglThread:Landroid/os/HandlerThread;

.field private mEglThreadBlockVar:Landroid/os/ConditionVariable;

.field private mFrameCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

.field private mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

.field private volatile mImageQueueSize:I

.field private final mLock:Ljava/lang/Object;

.field private mMemImage:Lcom/android/camera/effect/framework/image/MemYuvImage;

.field private mQuality:I

.field private mRelease:Z

.field private mReleasePending:Z

.field private mRenderCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

.field private mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

.field private mSplitter:Lcom/android/camera/effect/framework/graphics/Splitter;

.field private mTextureId:I

.field private mTotalCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/util/Size;)V
    .locals 4
    .param p1    # Landroid/util/Size;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x61

    iput v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mQuality:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    new-instance v1, Landroid/os/ConditionVariable;

    invoke-direct {v1}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    sget-object v1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SnapshotRender created "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; with size : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "SnapshotRender"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;-><init>(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mMemImage:Lcom/android/camera/effect/framework/image/MemYuvImage;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/camera/effect/framework/image/MemYuvImage;

    invoke-direct {v1}, Lcom/android/camera/effect/framework/image/MemYuvImage;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mMemImage:Lcom/android/camera/effect/framework/image/MemYuvImage;

    :cond_0
    new-instance v1, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrameCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

    new-instance v1, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mTotalCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

    new-instance v1, Lcom/android/camera/effect/framework/utils/CounterUtil;

    invoke-direct {v1}, Lcom/android/camera/effect/framework/utils/CounterUtil;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

    new-instance v1, Lcom/android/camera/effect/framework/graphics/Splitter;

    invoke-direct {v1}, Lcom/android/camera/effect/framework/graphics/Splitter;-><init>()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mSplitter:Lcom/android/camera/effect/framework/graphics/Splitter;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v1, v0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendMessageSync(Landroid/os/Message;)V

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/effect/renders/SnapshotRender;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DeviceWatermarkParam;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDeviceWaterMarkParam:Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/android/camera/effect/renders/SnapshotRender;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->m48MCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->load48MWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mTotalCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/image/MemYuvImage;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mMemImage:Lcom/android/camera/effect/framework/image/MemYuvImage;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/graphics/Splitter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mSplitter:Lcom/android/camera/effect/framework/graphics/Splitter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/utils/CounterUtil;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrameCounter:Lcom/android/camera/effect/framework/utils/CounterUtil;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mQuality:I

    return p0
.end method

.method static synthetic access$2200(Lcom/android/camera/effect/renders/SnapshotRender;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender;->destroy()V

    return-void
.end method

.method static synthetic access$310(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 2

    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    return v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/camera/effect/renders/SnapshotRender;II)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/SnapshotRender;->calEachBlockHeight(II)I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockWidth:I

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/effect/renders/SnapshotRender;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockWidth:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/effect/renders/SnapshotRender;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockHeight:I

    return p0
.end method

.method static synthetic access$702(Lcom/android/camera/effect/renders/SnapshotRender;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockHeight:I

    return p1
.end method

.method static synthetic access$712(Lcom/android/camera/effect/renders/SnapshotRender;I)I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockHeight:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mBlockHeight:I

    return v0
.end method

.method static synthetic access$800(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/EglCore;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

    return-object p0
.end method

.method static synthetic access$802(Lcom/android/camera/effect/renders/SnapshotRender;Lcom/android/camera/effect/framework/gles/EglCore;)Lcom/android/camera/effect/framework/gles/EglCore;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

    return-object p1
.end method

.method static synthetic access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/framework/gles/PbufferSurface;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

    return-object p0
.end method

.method static synthetic access$902(Lcom/android/camera/effect/renders/SnapshotRender;Lcom/android/camera/effect/framework/gles/PbufferSurface;)Lcom/android/camera/effect/framework/gles/PbufferSurface;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

    return-object p1
.end method

.method private calEachBlockHeight(II)I
    .locals 3

    nop

    const/4 v0, 0x1

    :goto_0
    mul-int v1, p1, p2

    const v2, 0x5b8d80

    if-le v1, v2, :cond_0

    shr-int/lit8 p2, p2, 0x1

    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method private destroy()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/gles/PbufferSurface;->release()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRenderSurface:Lcom/android/camera/effect/framework/gles/PbufferSurface;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

    invoke-virtual {v0}, Lcom/android/camera/effect/framework/gles/EglCore;->release()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglCore:Lcom/android/camera/effect/framework/gles/EglCore;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    :cond_2
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    :cond_3
    invoke-static {}, Ljava/lang/System;->gc()V

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SnapshotRender released "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private load48MWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 5

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fn()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    sget-object v3, Lcom/android/camera/Util;->WATERMARK_48M_FILE_NAME:Ljava/lang/String;

    invoke-direct {v1, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->generate48MWatermark2File()Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_0
    :try_start_0
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-static {p1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {v2, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-object v0

    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_0
    :try_start_4
    invoke-static {v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception p1

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v1, "Failed to load app camera watermark "

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    return-object v2
.end method

.method private loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 4

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPremultiplied:Z

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fn()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    sget-object v2, Lcom/android/camera/Util;->WATERMARK_FILE_NAME:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/android/camera/Util;->generateWatermark2File()Landroid/graphics/Bitmap;

    :cond_0
    const/4 p1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-static {v2, p1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {p1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-object v0

    :catchall_0
    move-exception v0

    move-object v1, p1

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v1

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_0
    :try_start_4
    invoke-static {v1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception v0

    sget-object v1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v2, "Failed to load app camera watermark "

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    nop

    return-object p1

    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public isRelease()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mRelease:Z

    if-eqz v0, :cond_0

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

.method public prepareEffectRender(Lcom/android/camera/effect/renders/DeviceWatermarkParam;I)V
    .locals 2

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDeviceWaterMarkParam:Lcom/android/camera/effect/renders/DeviceWatermarkParam;

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->isDualWatermarkEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender;->loadCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mDualCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mCurrentCustomWaterMarkText:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/DeviceWatermarkParam;->isFrontWatermarkEnable()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    if-nez p1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->loadFrontCameraWatermark(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mFrontCameraWaterMarkBitmap:Landroid/graphics/Bitmap;

    :cond_1
    :goto_0
    sget p1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p2, p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v0, 0x6

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_2
    return-void
.end method

.method public processImageAsync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z
    .locals 3

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queueSize="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    sget-object p1, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v0, "queueSize is full"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mImageQueueSize:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    invoke-virtual {v0, v2, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return v2

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public processImageSync(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglThreadBlockVar:Landroid/os/ConditionVariable;

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    return-void
.end method

.method public release()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender;->TAG:Ljava/lang/String;

    const-string v2, "release: try to release but message is not null, so pending it"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v1, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mReleasePending:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender;->mEglHandler:Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendEmptyMessage(I)Z

    :goto_0
    return-void
.end method

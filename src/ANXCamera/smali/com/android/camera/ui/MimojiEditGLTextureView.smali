.class public Lcom/android/camera/ui/MimojiEditGLTextureView;
.super Lcom/android/camera/ui/GLTextureView;
.source "MimojiEditGLTextureView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;
    }
.end annotation


# static fields
.field private static BACKGROUND_COLOR:[F = null

.field private static final DEBUG_FPS:Z = false

.field public static final DO_DRAW:I = 0x6

.field public static final GET_SAVE_THUM_END:I = 0x4

.field private static final TAG:Ljava/lang/String;

.field public static final THUM_HEIGHT:I = 0xc8

.field public static final THUM_WIDTH:I = 0xc8

.field public static final UPDATE_THUM:I = 0x5


# instance fields
.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mDeviceRotation:I

.field private final mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;

.field private mFrameCount:I

.field private mFrameCountingStart:J

.field private mHandler:Landroid/os/Handler;

.field private mIsStopRender:Z

.field private mSaveConfigThum:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/ui/MimojiEditGLTextureView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/MimojiEditGLTextureView;->TAG:Ljava/lang/String;

    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/ui/MimojiEditGLTextureView;->BACKGROUND_COLOR:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/MimojiEditGLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/GLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;-><init>(Lcom/android/camera/ui/MimojiEditGLTextureView;Lcom/android/camera/ui/MimojiEditGLTextureView$1;)V

    iput-object p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCount:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    const/16 p2, 0x5a

    iput p2, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mDeviceRotation:I

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mIsStopRender:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mSaveConfigThum:Z

    const/4 p2, 0x2

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setEGLContextClientVersion(I)V

    iget-object p2, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mEglConfigChooser:Lcom/android/camera/ui/MimojiEditGLTextureView$MyEGLConfigChooser;

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setEGLConfigChooser(Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;)V

    invoke-virtual {p0, p0}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setRenderMode(I)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setPreserveEGLContextOnPause(Z)V

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLTextureView;->setupAvatar()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/ui/MimojiEditGLTextureView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private outputFps()V
    .locals 8

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iput-wide v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    goto :goto_0

    :cond_0
    iget-wide v2, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0x3b9aca00

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    sget-object v2, Lcom/android/camera/ui/MimojiEditGLTextureView;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fps: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCount:I

    int-to-double v4, v4

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    mul-double/2addr v4, v6

    iget-wide v6, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    sub-long v6, v0, v6

    long-to-double v6, v6

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-wide v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCountingStart:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCount:I

    :cond_1
    :goto_0
    iget v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mFrameCount:I

    return-void
.end method


# virtual methods
.method public onDeviceRotationChange(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mDeviceRotation:I

    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 11

    const p1, 0x3da88ce7    # 0.0823f

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, p1, p1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    iget-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mIsStopRender:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLTextureView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/camera/ui/MimojiEditGLTextureView;->getHeight()I

    move-result v3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mDeviceRotation:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->avatarRender(IIIIZ[I)V

    iget-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mSaveConfigThum:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mSaveConfigThum:Z

    const p1, 0x27100

    new-array p1, p1, [B

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    const/16 v1, 0xf4

    const/16 v2, 0x124

    const/16 v3, 0x15

    const/16 v4, 0x14

    const/16 v6, 0xc8

    const/16 v7, 0xc8

    const/16 v8, 0x320

    sget-object v9, Lcom/android/camera/ui/MimojiEditGLTextureView;->BACKGROUND_COLOR:[F

    const/high16 v10, 0x3f800000    # 1.0f

    move-object v5, p1

    invoke-virtual/range {v0 .. v10}, Lcom/arcsoft/avatar/AvatarEngine;->renderThumb(IIII[BIII[FF)I

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mHandler:Landroid/os/Handler;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1, p1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    const/4 p1, 0x0

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p1, p1, p1, p2}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    return-void
.end method

.method public setHandler(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public setSaveConfigThum(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mSaveConfigThum:Z

    return-void
.end method

.method public setStopRender(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mIsStopRender:Z

    return-void
.end method

.method public setupAvatar()V
    .locals 3

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/ui/MimojiEditGLTextureView;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/4 v1, 0x0

    const v2, 0x3f59999a    # 0.85f

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    return-void
.end method

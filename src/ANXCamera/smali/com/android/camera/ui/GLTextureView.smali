.class public Lcom/android/camera/ui/GLTextureView;
.super Landroid/view/TextureView;
.source "GLTextureView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;,
        Lcom/android/camera/ui/GLTextureView$GLThreadManager;,
        Lcom/android/camera/ui/GLTextureView$LogWriter;,
        Lcom/android/camera/ui/GLTextureView$GLThread;,
        Lcom/android/camera/ui/GLTextureView$EglHelper;,
        Lcom/android/camera/ui/GLTextureView$SimpleEGLConfigChooser;,
        Lcom/android/camera/ui/GLTextureView$ComponentSizeChooser;,
        Lcom/android/camera/ui/GLTextureView$BaseConfigChooser;,
        Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;,
        Lcom/android/camera/ui/GLTextureView$DefaultWindowSurfaceFactory;,
        Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;,
        Lcom/android/camera/ui/GLTextureView$DefaultContextFactory;,
        Lcom/android/camera/ui/GLTextureView$EGLContextFactory;,
        Lcom/android/camera/ui/GLTextureView$GLWrapper;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final LOG_ATTACH_DETACH:Z = false

.field private static final LOG_EGL:Z = false

.field private static final LOG_PAUSE_RESUME:Z = false

.field private static final LOG_RENDERER:Z = false

.field private static final LOG_RENDERER_DRAW_FRAME:Z = false

.field private static final LOG_SURFACE:Z = false

.field private static final LOG_THREADS:Z = false

.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I = 0x0

.field private static final TAG:Ljava/lang/String; = "GLTextureView"

.field private static final sGLThreadManager:Lcom/android/camera/ui/GLTextureView$GLThreadManager;


# instance fields
.field private mDebugFlags:I

.field private mDetached:Z

.field private mEGLConfigChooser:Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;

.field private mEGLContextClientVersion:I

.field private mEGLContextFactory:Lcom/android/camera/ui/GLTextureView$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;

.field private mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

.field private mGLWrapper:Lcom/android/camera/ui/GLTextureView$GLWrapper;

.field private mPreserveEGLContextOnPause:Z

.field private mPreservedHeight:I

.field private mPreservedWidth:I

.field private mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

.field private mShareContextGetter:Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;

.field private final mThisWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/ui/GLTextureView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/camera/ui/GLTextureView$GLThreadManager;-><init>(Lcom/android/camera/ui/GLTextureView$1;)V

    sput-object v0, Lcom/android/camera/ui/GLTextureView;->sGLThreadManager:Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->init()V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/camera/ui/GLTextureView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/GLTextureView;->mPreserveEGLContextOnPause:Z

    return p0
.end method

.method static synthetic access$1100(Lcom/android/camera/ui/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/ui/GLTextureView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextClientVersion:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/ui/GLTextureView;)Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLConfigChooser:Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/ui/GLTextureView;)Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mShareContextGetter:Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/ui/GLTextureView;)Lcom/android/camera/ui/GLTextureView$EGLContextFactory;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextFactory:Lcom/android/camera/ui/GLTextureView$EGLContextFactory;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/camera/ui/GLTextureView;)Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/camera/ui/GLTextureView;)Lcom/android/camera/ui/GLTextureView$GLWrapper;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/GLTextureView;->mGLWrapper:Lcom/android/camera/ui/GLTextureView$GLWrapper;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/ui/GLTextureView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/GLTextureView;->mDebugFlags:I

    return p0
.end method

.method static synthetic access$900()Lcom/android/camera/ui/GLTextureView$GLThreadManager;
    .locals 1

    sget-object v0, Lcom/android/camera/ui/GLTextureView;->sGLThreadManager:Lcom/android/camera/ui/GLTextureView$GLThreadManager;

    return-object v0
.end method

.method private checkRenderThreadState()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRenderer has already been called for this instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private init()V
    .locals 0

    invoke-virtual {p0, p0}, Lcom/android/camera/ui/GLTextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->requestExitAndWait()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    nop

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getDebugFlags()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/GLTextureView;->mDebugFlags:I

    return v0
.end method

.method public getPreserveEGLContextOnPause()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView;->mPreserveEGLContextOnPause:Z

    return v0
.end method

.method public getRenderMode()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->getRenderMode()I

    move-result v0

    return v0
.end method

.method public getRenderer()Landroid/opengl/GLSurfaceView$Renderer;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    return-object v0
.end method

.method public on(Landroid/view/SurfaceHolder;)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->surfaceCreated()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 6

    invoke-super {p0}, Landroid/view/TextureView;->onAttachedToWindow()V

    iget-boolean v0, p0, Lcom/android/camera/ui/GLTextureView;->mDetached:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    if-eqz v0, :cond_2

    nop

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->getRenderMode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    new-instance v2, Lcom/android/camera/ui/GLTextureView$GLThread;

    iget-object v3, p0, Lcom/android/camera/ui/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    iget v4, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedWidth:I

    iget v5, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedHeight:I

    invoke-direct {v2, v3, v4, v5}, Lcom/android/camera/ui/GLTextureView$GLThread;-><init>(Ljava/lang/ref/WeakReference;II)V

    iput-object v2, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    if-eq v0, v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->setRenderMode(I)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->start()V

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView;->mDetached:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->requestExitAndWait()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/GLTextureView;->mDetached:Z

    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->onResume()V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/TextureView;->onSizeChanged(IIII)V

    iput p1, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedWidth:I

    iput p2, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedHeight:I

    iget-object p3, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ui/GLTextureView$GLThread;->onWindowResize(II)V

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->surfaceCreated()V

    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    iget-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->surfaceDestroyed()V

    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    iput p2, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedWidth:I

    iput p3, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedHeight:I

    iget-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p1, p2, p3}, Lcom/android/camera/ui/GLTextureView$GLThread;->onWindowResize(II)V

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0}, Lcom/android/camera/ui/GLTextureView$GLThread;->requestRender()V

    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/GLTextureView;->mDebugFlags:I

    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 9

    new-instance v8, Lcom/android/camera/ui/GLTextureView$ComponentSizeChooser;

    move-object v0, v8

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/ui/GLTextureView$ComponentSizeChooser;-><init>(Lcom/android/camera/ui/GLTextureView;IIIIII)V

    invoke-virtual {p0, v8}, Lcom/android/camera/ui/GLTextureView;->setEGLConfigChooser(Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLConfigChooser(Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->checkRenderThreadState()V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mEGLConfigChooser:Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;

    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1

    new-instance v0, Lcom/android/camera/ui/GLTextureView$SimpleEGLConfigChooser;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/ui/GLTextureView$SimpleEGLConfigChooser;-><init>(Lcom/android/camera/ui/GLTextureView;Z)V

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/GLTextureView;->setEGLConfigChooser(Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;)V

    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->checkRenderThreadState()V

    iput p1, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextClientVersion:I

    return-void
.end method

.method public setEGLContextFactory(Lcom/android/camera/ui/GLTextureView$EGLContextFactory;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->checkRenderThreadState()V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextFactory:Lcom/android/camera/ui/GLTextureView$EGLContextFactory;

    return-void
.end method

.method public setEGLShareContextGetter(Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mShareContextGetter:Lcom/android/camera/ui/GLTextureView$EGLShareContextGetter;

    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->checkRenderThreadState()V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;

    return-void
.end method

.method public setGLWrapper(Lcom/android/camera/ui/GLTextureView$GLWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLWrapper:Lcom/android/camera/ui/GLTextureView$GLWrapper;

    return-void
.end method

.method public setPreserveEGLContextOnPause(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/GLTextureView;->mPreserveEGLContextOnPause:Z

    return-void
.end method

.method public setRenderMode(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->setRenderMode(I)V

    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/GLTextureView;->checkRenderThreadState()V

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLConfigChooser:Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/ui/GLTextureView$SimpleEGLConfigChooser;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/ui/GLTextureView$SimpleEGLConfigChooser;-><init>(Lcom/android/camera/ui/GLTextureView;Z)V

    iput-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLConfigChooser:Lcom/android/camera/ui/GLTextureView$EGLConfigChooser;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextFactory:Lcom/android/camera/ui/GLTextureView$EGLContextFactory;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    new-instance v0, Lcom/android/camera/ui/GLTextureView$DefaultContextFactory;

    invoke-direct {v0, p0, v1}, Lcom/android/camera/ui/GLTextureView$DefaultContextFactory;-><init>(Lcom/android/camera/ui/GLTextureView;Lcom/android/camera/ui/GLTextureView$1;)V

    iput-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLContextFactory:Lcom/android/camera/ui/GLTextureView$EGLContextFactory;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;

    if-nez v0, :cond_2

    new-instance v0, Lcom/android/camera/ui/GLTextureView$DefaultWindowSurfaceFactory;

    invoke-direct {v0, v1}, Lcom/android/camera/ui/GLTextureView$DefaultWindowSurfaceFactory;-><init>(Lcom/android/camera/ui/GLTextureView$1;)V

    iput-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mEGLWindowSurfaceFactory:Lcom/android/camera/ui/GLTextureView$EGLWindowSurfaceFactory;

    :cond_2
    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    new-instance p1, Lcom/android/camera/ui/GLTextureView$GLThread;

    iget-object v0, p0, Lcom/android/camera/ui/GLTextureView;->mThisWeakRef:Ljava/lang/ref/WeakReference;

    iget v1, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedWidth:I

    iget v2, p0, Lcom/android/camera/ui/GLTextureView;->mPreservedHeight:I

    invoke-direct {p1, v0, v1, v2}, Lcom/android/camera/ui/GLTextureView$GLThread;-><init>(Ljava/lang/ref/WeakReference;II)V

    iput-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    iget-object p1, p0, Lcom/android/camera/ui/GLTextureView;->mGLThread:Lcom/android/camera/ui/GLTextureView$GLThread;

    invoke-virtual {p1}, Lcom/android/camera/ui/GLTextureView$GLThread;->start()V

    return-void
.end method

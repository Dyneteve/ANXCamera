.class public Lcom/android/camera/fragment/mimoji/EGLWrapper;
.super Ljava/lang/Object;
.source "EGLWrapper.java"


# static fields
.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

.field private mEGLConfigs:[Landroid/opengl/EGLConfig;

.field private mEGLContext:Landroid/opengl/EGLContext;

.field private mEGLDisplay:Landroid/opengl/EGLDisplay;

.field private mEGLSurface:Landroid/opengl/EGLSurface;

.field private mHeight:I

.field private mIsPbuffSurface:Z

.field private mSurface:Landroid/view/Surface;

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/EGLWrapper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/4 v0, 0x1

    new-array v1, v0, [Landroid/opengl/EGLConfig;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    iput p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mWidth:I

    iput p2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mHeight:I

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->egl_Setup()V

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/opengl/EGLConfig;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->egl_Setup()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public constructor <init>(Landroid/view/Surface;Landroid/opengl/EGLContext;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/opengl/EGLConfig;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->egl_Setup()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method private checkEglError(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "NOT_ERROR_JUST_SEE_CALL_STACK"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": EGL_ERROR_CODE: 0x"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private createEGLPbufferSurface()V
    .locals 4

    const/4 v0, 0x5

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3057

    aput v2, v0, v1

    iget v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mWidth:I

    const/4 v3, 0x1

    aput v2, v0, v3

    const/4 v2, 0x2

    const/16 v3, 0x3056

    aput v3, v0, v2

    iget v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mHeight:I

    const/4 v3, 0x3

    aput v2, v0, v3

    const/4 v2, 0x4

    const/16 v3, 0x3038

    aput v3, v0, v2

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    aget-object v3, v3, v1

    invoke-static {v2, v3, v0, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const-string v0, "createEGLPbufferSurface"

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "surface == null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createEGLSurface()V
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3038

    aput v2, v0, v1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    aget-object v3, v3, v1

    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    invoke-static {v2, v3, v4, v0, v1}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const-string v0, "eglCreateWindowSurface"

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "surface == null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private egl_Setup()V
    .locals 13

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v1, v2, :cond_5

    const/4 v1, 0x2

    new-array v1, v1, [I

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    const/4 v3, 0x1

    invoke-static {v2, v1, v0, v1, v3}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v1

    if-eqz v1, :cond_4

    const/16 v1, 0x11

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    new-array v1, v1, [I

    fill-array-data v1, :array_1

    iget-boolean v4, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    if-eqz v4, :cond_0

    move-object v6, v1

    goto :goto_0

    :cond_0
    move-object v6, v2

    :goto_0
    new-array v11, v3, [I

    iget-object v5, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    const/4 v9, 0x0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    array-length v10, v1

    const/4 v12, 0x0

    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x3

    new-array v1, v1, [I

    fill-array-data v1, :array_2

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLConfigs:[Landroid/opengl/EGLConfig;

    aget-object v3, v3, v0

    iget-object v4, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v2, v3, v4, v1, v0}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    const-string v0, "eglCreateContext"

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mIsPbuffSurface:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->createEGLPbufferSurface()V

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->createEGLSurface()V

    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mHeight:I

    return-void

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglCreateContext == null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglChooseConfig [RGBA888 + recordable] ES2 EGL_config_fail..."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "EGL14.eglInitialize fail..."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "EGL14.eglGetDisplay fail..."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :array_0
    .array-data 4
        0x3033
        0x4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x8
        0x3142
        0x1
        0x3038
    .end array-data

    :array_1
    .array-data 4
        0x3033
        0x1
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3025
        0x8
        0x3142
        0x1
        0x3038
    .end array-data

    :array_2
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private releaseEGLSurface()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    :cond_0
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/4 v3, 0x0

    const/16 v4, 0x3056

    invoke-static {v1, v2, v4, v0, v3}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    aget v0, v0, v3

    return v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public getWidth()I
    .locals 5

    const/4 v0, 0x1

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    const/4 v3, 0x0

    const/16 v4, 0x3057

    invoke-static {v1, v2, v4, v0, v3}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    aget v0, v0, v3

    return v0
.end method

.method public makeCurrent()Z
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v1, "makeCurrent"

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    :cond_1
    sget-object v1, Lcom/android/camera/fragment/mimoji/EGLWrapper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "makeCurrent()-> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_2
    :goto_0
    sget-object v0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->TAG:Ljava/lang/String;

    const-string v1, "makeCurrent()-> failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0
.end method

.method public makeUnCurrent()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "makeUnCurrent"

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    :cond_0
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLContext:Landroid/opengl/EGLContext;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->EGL_SHARE_CONTEXT:Landroid/opengl/EGLContext;

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/fragment/mimoji/EGLWrapper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "release release mSurface failed : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method public setPresentationTime(J)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    const-string p1, "eglPresentationTimeANDROID"

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    return-void
.end method

.method public swapBuffers()Z
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mEGLSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v1}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v1, "makeCurrent"

    invoke-direct {p0, v1}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->checkEglError(Ljava/lang/String;)V

    :cond_1
    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public updateSize(II)V
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mWidth:I

    if-ne p1, v0, :cond_0

    iget p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mHeight:I

    if-eq p2, p1, :cond_1

    :cond_0
    sget-object p1, Lcom/android/camera/fragment/mimoji/EGLWrapper;->TAG:Ljava/lang/String;

    const-string p2, "re-create EGLSurface"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->releaseEGLSurface()V

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->createEGLSurface()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/EGLWrapper;->mHeight:I

    :cond_1
    return-void
.end method

.class public abstract Lcom/android/gallery3d/ui/BasicTexture;
.super Ljava/lang/Object;
.source "BasicTexture.java"

# interfaces
.implements Lcom/android/gallery3d/ui/Texture;


# static fields
.field private static final MAX_TEXTURE_SIZE:I = 0x1680

.field protected static final STATE_ERROR:I = -0x1

.field protected static final STATE_LOADED:I = 0x1

.field protected static final STATE_UNLOADED:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BasicTexture"

.field protected static final UNSPECIFIED:I = -0x1

.field private static sAllTextures:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/android/gallery3d/ui/BasicTexture;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static sInFinalizer:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mCanvasRef:Lcom/android/gallery3d/ui/GLCanvas;

.field private mHasBorder:Z

.field protected mHeight:I

.field protected mId:I

.field protected mState:I

.field private mTextureHeight:I

.field private mTextureWidth:I

.field protected mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0, v0}, Lcom/android/gallery3d/ui/BasicTexture;-><init>(Lcom/android/gallery3d/ui/GLCanvas;II)V

    return-void
.end method

.method protected constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mWidth:I

    iput v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mCanvasRef:Lcom/android/gallery3d/ui/GLCanvas;

    invoke-virtual {p0, p1}, Lcom/android/gallery3d/ui/BasicTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    iput p2, p0, Lcom/android/gallery3d/ui/BasicTexture;->mId:I

    iput p3, p0, Lcom/android/gallery3d/ui/BasicTexture;->mState:I

    sget-object p1, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter p1

    :try_start_0
    sget-object p2, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    invoke-virtual {p2, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method private freeResource()V
    .locals 2

    iget-object v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mCanvasRef:Lcom/android/gallery3d/ui/GLCanvas;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/BasicTexture;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, p0}, Lcom/android/gallery3d/ui/GLCanvas;->deleteTexture(Lcom/android/gallery3d/ui/BasicTexture;)Z

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mState:I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/ui/BasicTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    return-void
.end method

.method public static inFinalizer()Z
    .locals 1

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static invalidateAllTextures()V
    .locals 4

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/ui/BasicTexture;

    const/4 v3, 0x0

    iput v3, v2, Lcom/android/gallery3d/ui/BasicTexture;->mState:I

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/gallery3d/ui/BasicTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    goto :goto_0

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

.method public static invalidateAllTextures(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 4

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/ui/BasicTexture;

    iget-object v3, v2, Lcom/android/gallery3d/ui/BasicTexture;->mCanvasRef:Lcom/android/gallery3d/ui/GLCanvas;

    if-ne v3, p0, :cond_0

    const/4 v3, 0x0

    iput v3, v2, Lcom/android/gallery3d/ui/BasicTexture;->mState:I

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/gallery3d/ui/BasicTexture;->setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V

    :cond_0
    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static yieldAllTextures()V
    .locals 3

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/android/gallery3d/ui/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/BasicTexture;->yield()V

    goto :goto_0

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


# virtual methods
.method public draw(Lcom/android/gallery3d/ui/GLCanvas;II)V
    .locals 7

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/BasicTexture;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/BasicTexture;->getHeight()I

    move-result v5

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 7

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIIIIIII)V
    .locals 2

    new-instance v0, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;

    new-instance v1, Landroid/graphics/RectF;

    int-to-float p2, p2

    int-to-float p3, p3

    int-to-float p4, p4

    int-to-float p5, p5

    invoke-direct {v1, p2, p3, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance p2, Landroid/graphics/RectF;

    int-to-float p3, p6

    int-to-float p4, p7

    int-to-float p5, p8

    int-to-float p6, p9

    invoke-direct {p2, p3, p4, p5, p6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-direct {v0, p0, v1, p2}, Lcom/android/camera/effect/draw_mode/DrawRectFTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    invoke-interface {p1, v0}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    return-void
.end method

.method public drawBlur(Lcom/android/gallery3d/ui/GLCanvas;IIII)V
    .locals 7

    invoke-interface {p1}, Lcom/android/gallery3d/ui/GLCanvas;->prepareBlurRenders()V

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {p1, v6}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    return-void
.end method

.method protected finalize()V
    .locals 2

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    const-class v1, Lcom/android/gallery3d/ui/BasicTexture;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/android/gallery3d/ui/BasicTexture;->recycle()V

    sget-object v0, Lcom/android/gallery3d/ui/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHeight:I

    return v0
.end method

.method public getId()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mId:I

    return v0
.end method

.method public abstract getTarget()I
.end method

.method public getTextureHeight()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureHeight:I

    return v0
.end method

.method public getTextureWidth()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureWidth:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mWidth:I

    return v0
.end method

.method public hasBorder()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHasBorder:Z

    return v0
.end method

.method public isLoaded()Z
    .locals 2

    iget v0, p0, Lcom/android/gallery3d/ui/BasicTexture;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public abstract onBind(Lcom/android/gallery3d/ui/GLCanvas;)Z
.end method

.method public recycle()V
    .locals 0

    invoke-direct {p0}, Lcom/android/gallery3d/ui/BasicTexture;->freeResource()V

    return-void
.end method

.method protected setAssociatedCanvas(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    iput-object p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mCanvasRef:Lcom/android/gallery3d/ui/GLCanvas;

    return-void
.end method

.method protected setBorder(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHasBorder:Z

    return-void
.end method

.method public setSize(II)V
    .locals 4

    iput p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mWidth:I

    iput p2, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHeight:I

    iget p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mWidth:I

    iput p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureWidth:I

    iget p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mHeight:I

    iput p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureHeight:I

    iget p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureWidth:I

    const/16 p2, 0x1680

    if-gt p1, p2, :cond_0

    iget p1, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureHeight:I

    if-le p1, p2, :cond_1

    :cond_0
    const-string p1, "BasicTexture"

    sget-object p2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "texture is too large: %d x %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/android/gallery3d/ui/BasicTexture;->mTextureHeight:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p2, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-static {p1, p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    return-void
.end method

.method public yield()V
    .locals 0

    invoke-direct {p0}, Lcom/android/gallery3d/ui/BasicTexture;->freeResource()V

    return-void
.end method

.class public Lcom/android/volley/toolbox/ImageLoader;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;,
        Lcom/android/volley/toolbox/ImageLoader$ImageContainer;,
        Lcom/android/volley/toolbox/ImageLoader$ImageListener;,
        Lcom/android/volley/toolbox/ImageLoader$ImageCache;
    }
.end annotation


# instance fields
.field private mBatchResponseDelayMs:I

.field private final mBatchedResponses:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final mCache:Lcom/android/volley/toolbox/ImageLoader$ImageCache;

.field private final mHandler:Landroid/os/Handler;

.field private final mInFlightRequests:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final mRequestQueue:Lcom/android/volley/RequestQueue;

.field private mRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/toolbox/ImageLoader$ImageCache;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x64

    iput v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchResponseDelayMs:I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader;->mRequestQueue:Lcom/android/volley/RequestQueue;

    iput-object p2, p0, Lcom/android/volley/toolbox/ImageLoader;->mCache:Lcom/android/volley/toolbox/ImageLoader$ImageCache;

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/volley/toolbox/ImageLoader;->onGetImageSuccess(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/android/volley/toolbox/ImageLoader;->onGetImageError(Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$802(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 2

    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader;->mRunnable:Ljava/lang/Runnable;

    return-object p1
.end method

.method private batchResponse(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)V
    .registers 7

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_1a

    new-instance v0, Lcom/android/volley/toolbox/ImageLoader$4;

    invoke-direct {v0, p0}, Lcom/android/volley/toolbox/ImageLoader$4;-><init>(Lcom/android/volley/toolbox/ImageLoader;)V

    iput-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mRunnable:Ljava/lang/Runnable;

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader;->mRunnable:Ljava/lang/Runnable;

    iget v2, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchResponseDelayMs:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1a
    return-void
.end method

.method private static getCacheKey(Ljava/lang/String;II)Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0xc

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "#W"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "#H"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    .registers 4

    new-instance v0, Lcom/android/volley/toolbox/ImageLoader$1;

    invoke-direct {v0, p2, p0, p1}, Lcom/android/volley/toolbox/ImageLoader$1;-><init>(ILandroid/widget/ImageView;I)V

    return-object v0
.end method

.method private onGetImageError(Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .registers 4

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    if-eqz v0, :cond_10

    invoke-virtual {v0, p2}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->setError(Lcom/android/volley/VolleyError;)V

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/ImageLoader;->batchResponse(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)V

    :cond_10
    return-void
.end method

.method private onGetImageSuccess(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 4

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mCache:Lcom/android/volley/toolbox/ImageLoader$ImageCache;

    invoke-interface {v0, p1, p2}, Lcom/android/volley/toolbox/ImageLoader$ImageCache;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    if-eqz v0, :cond_15

    # setter for: Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->mResponseBitmap:Landroid/graphics/Bitmap;
    invoke-static {v0, p2}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->access$202(Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/ImageLoader;->batchResponse(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)V

    :cond_15
    return-void
.end method

.method private throwIfNotOnMainThread()V
    .registers 3

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_b

    return-void

    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ImageLoader must be invoked from the main thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    .registers 22

    move-object/from16 v6, p0

    move-object/from16 v7, p2

    invoke-direct/range {p0 .. p0}, Lcom/android/volley/toolbox/ImageLoader;->throwIfNotOnMainThread()V

    move-object/from16 v15, p1

    move/from16 v14, p3

    move/from16 v13, p4

    invoke-static {v15, v14, v13}, Lcom/android/volley/toolbox/ImageLoader;->getCacheKey(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v12

    iget-object v0, v6, Lcom/android/volley/toolbox/ImageLoader;->mCache:Lcom/android/volley/toolbox/ImageLoader$ImageCache;

    invoke-interface {v0, v12}, Lcom/android/volley/toolbox/ImageLoader$ImageCache;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v16

    const/4 v8, 0x1

    if-eqz v16, :cond_2a

    new-instance v9, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v9

    move-object v1, v6

    move-object/from16 v2, v16

    move-object v3, v15

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;-><init>(Lcom/android/volley/toolbox/ImageLoader;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)V

    invoke-interface {v7, v0, v8}, Lcom/android/volley/toolbox/ImageLoader$ImageListener;->onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V

    return-object v0

    :cond_2a
    new-instance v9, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    const/4 v2, 0x0

    move-object v0, v9

    move-object v1, v6

    move-object v3, v15

    move-object v4, v12

    move-object v5, v7

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;-><init>(Lcom/android/volley/toolbox/ImageLoader;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)V

    invoke-interface {v7, v0, v8}, Lcom/android/volley/toolbox/ImageLoader$ImageListener;->onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V

    iget-object v1, v6, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    invoke-virtual {v1, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    if-eqz v1, :cond_46

    invoke-virtual {v1, v0}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->addContainer(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)V

    return-object v0

    :cond_46
    new-instance v2, Lcom/android/volley/toolbox/ImageRequest;

    new-instance v10, Lcom/android/volley/toolbox/ImageLoader$2;

    invoke-direct {v10, v6, v12}, Lcom/android/volley/toolbox/ImageLoader$2;-><init>(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;)V

    sget-object v3, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    new-instance v4, Lcom/android/volley/toolbox/ImageLoader$3;

    invoke-direct {v4, v6, v12}, Lcom/android/volley/toolbox/ImageLoader$3;-><init>(Lcom/android/volley/toolbox/ImageLoader;Ljava/lang/String;)V

    move-object v8, v2

    move-object v9, v15

    move v11, v14

    move-object v5, v12

    move v12, v13

    move-object v13, v3

    move-object v14, v4

    invoke-direct/range {v8 .. v14}, Lcom/android/volley/toolbox/ImageRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;IILandroid/graphics/Bitmap$Config;Lcom/android/volley/Response$ErrorListener;)V

    iget-object v3, v6, Lcom/android/volley/toolbox/ImageLoader;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v3, v2}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    iget-object v3, v6, Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;

    new-instance v4, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    invoke-direct {v4, v6, v2, v0}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;-><init>(Lcom/android/volley/toolbox/ImageLoader;Lcom/android/volley/Request;Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)V

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public isCached(Ljava/lang/String;II)Z
    .registers 6

    invoke-direct {p0}, Lcom/android/volley/toolbox/ImageLoader;->throwIfNotOnMainThread()V

    invoke-static {p1, p2, p3}, Lcom/android/volley/toolbox/ImageLoader;->getCacheKey(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader;->mCache:Lcom/android/volley/toolbox/ImageLoader$ImageCache;

    invoke-interface {v1, v0}, Lcom/android/volley/toolbox/ImageLoader$ImageCache;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_11

    const/4 v1, 0x1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    return v1
.end method

.method public setBatchedResponseDelay(I)V
    .registers 2

    iput p1, p0, Lcom/android/volley/toolbox/ImageLoader;->mBatchResponseDelayMs:I

    return-void
.end method

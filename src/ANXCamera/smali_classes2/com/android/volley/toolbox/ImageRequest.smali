.class public Lcom/android/volley/toolbox/ImageRequest;
.super Lcom/android/volley/Request;
.source "ImageRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/volley/Request<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final IMAGE_BACKOFF_MULT:F = 2.0f

.field private static final IMAGE_MAX_RETRIES:I = 0x2

.field private static final IMAGE_TIMEOUT_MS:I = 0x3e8

.field private static final sDecodeLock:Ljava/lang/Object;


# instance fields
.field private final mDecodeConfig:Landroid/graphics/Bitmap$Config;

.field private final mListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final mMaxHeight:I

.field private final mMaxWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/volley/toolbox/ImageRequest;->sDecodeLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;IILandroid/graphics/Bitmap$Config;Lcom/android/volley/Response$ErrorListener;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener<",
            "Landroid/graphics/Bitmap;",
            ">;II",
            "Landroid/graphics/Bitmap$Config;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p6}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    new-instance v0, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x3e8

    const/4 v2, 0x2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {v0, v1, v2, v3}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/ImageRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    iput-object p2, p0, Lcom/android/volley/toolbox/ImageRequest;->mListener:Lcom/android/volley/Response$Listener;

    iput-object p5, p0, Lcom/android/volley/toolbox/ImageRequest;->mDecodeConfig:Landroid/graphics/Bitmap$Config;

    iput p3, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxWidth:I

    iput p4, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxHeight:I

    return-void
.end method

.method private doParse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    iget-object v0, p1, Lcom/android/volley/NetworkResponse;->data:[B

    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxWidth:I

    const/4 v4, 0x0

    if-nez v3, :cond_1b

    iget v3, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxHeight:I

    if-nez v3, :cond_1b

    iget-object v3, p0, Lcom/android/volley/toolbox/ImageRequest;->mDecodeConfig:Landroid/graphics/Bitmap$Config;

    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v3, v0

    invoke-static {v0, v4, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_5a

    :cond_1b
    const/4 v3, 0x1

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    array-length v5, v0

    invoke-static {v0, v4, v5, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v7, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxWidth:I

    iget v8, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxHeight:I

    invoke-static {v7, v8, v5, v6}, Lcom/android/volley/toolbox/ImageRequest;->getResizedDimension(IIII)I

    move-result v7

    iget v8, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxHeight:I

    iget v9, p0, Lcom/android/volley/toolbox/ImageRequest;->mMaxWidth:I

    invoke-static {v8, v9, v6, v5}, Lcom/android/volley/toolbox/ImageRequest;->getResizedDimension(IIII)I

    move-result v8

    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {v5, v6, v7, v8}, Lcom/android/volley/toolbox/ImageRequest;->findBestSampleSize(IIII)I

    move-result v9

    iput v9, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    array-length v9, v0

    invoke-static {v0, v4, v9, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_59

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    if-gt v9, v7, :cond_51

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    if-le v9, v8, :cond_59

    :cond_51
    invoke-static {v4, v7, v8, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_5a

    :cond_59
    move-object v2, v4

    :goto_5a
    if-nez v2, :cond_66

    new-instance v3, Lcom/android/volley/ParseError;

    invoke-direct {v3, p1}, Lcom/android/volley/ParseError;-><init>(Lcom/android/volley/NetworkResponse;)V

    invoke-static {v3}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v3

    return-object v3

    :cond_66
    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;

    move-result-object v3

    return-object v3
.end method

.method static findBestSampleSize(IIII)I
    .registers 14

    int-to-double v0, p0

    int-to-double v2, p2

    div-double/2addr v0, v2

    int-to-double v2, p1

    int-to-double v4, p3

    div-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    const/high16 v6, 0x3f800000    # 1.0f

    :goto_c
    const/high16 v7, 0x40000000    # 2.0f

    mul-float v8, v6, v7

    float-to-double v8, v8

    cmpg-double v8, v8, v4

    if-gtz v8, :cond_17

    mul-float/2addr v6, v7

    goto :goto_c

    :cond_17
    float-to-int v7, v6

    return v7
.end method

.method private static getResizedDimension(IIII)I
    .registers 11

    if-nez p0, :cond_5

    if-nez p1, :cond_5

    return p2

    :cond_5
    if-nez p0, :cond_e

    int-to-double v0, p1

    int-to-double v2, p3

    div-double/2addr v0, v2

    int-to-double v2, p2

    mul-double/2addr v2, v0

    double-to-int v2, v2

    return v2

    :cond_e
    if-nez p1, :cond_11

    return p0

    :cond_11
    int-to-double v0, p3

    int-to-double v2, p2

    div-double/2addr v0, v2

    move v2, p0

    int-to-double v3, v2

    mul-double/2addr v3, v0

    int-to-double v5, p1

    cmpl-double v3, v3, v5

    if-lez v3, :cond_1f

    int-to-double v3, p1

    div-double/2addr v3, v0

    double-to-int v2, v3

    :cond_1f
    return v2
.end method


# virtual methods
.method protected deliverResponse(Landroid/graphics/Bitmap;)V
    .registers 3

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageRequest;->mListener:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    return-void
.end method

.method protected bridge synthetic deliverResponse(Ljava/lang/Object;)V
    .registers 3

    move-object v0, p1

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/ImageRequest;->deliverResponse(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public getPriority()Lcom/android/volley/Request$Priority;
    .registers 2

    sget-object v0, Lcom/android/volley/Request$Priority;->LOW:Lcom/android/volley/Request$Priority;

    return-object v0
.end method

.method protected parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/android/volley/toolbox/ImageRequest;->sDecodeLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0, p1}, Lcom/android/volley/toolbox/ImageRequest;->doParse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v1
    :try_end_7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_7} :catch_b
    .catchall {:try_start_3 .. :try_end_7} :catchall_9

    :try_start_7
    monitor-exit v0

    return-object v1

    :catchall_9
    move-exception v1

    goto :goto_30

    :catch_b
    move-exception v1

    const-string v2, "Caught OOM for %d byte image, url=%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p1, Lcom/android/volley/NetworkResponse;->data:[B

    array-length v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p0}, Lcom/android/volley/toolbox/ImageRequest;->getUrl()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v2, Lcom/android/volley/ParseError;

    invoke-direct {v2, v1}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v2

    monitor-exit v0

    return-object v2

    :goto_30
    monitor-exit v0
    :try_end_31
    .catchall {:try_start_7 .. :try_end_31} :catchall_9

    throw v1
.end method

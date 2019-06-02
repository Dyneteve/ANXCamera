.class public Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
.super Ljava/lang/Object;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImageContainer"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private final mCacheKey:Ljava/lang/String;

.field private final mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;

.field private final mRequestUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/volley/toolbox/ImageLoader;


# direct methods
.method public constructor <init>(Lcom/android/volley/toolbox/ImageLoader;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;)V
    .registers 6

    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mBitmap:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mRequestUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mCacheKey:Ljava/lang/String;

    iput-object p5, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    return-void
.end method

.method static synthetic access$600(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Lcom/android/volley/toolbox/ImageLoader$ImageListener;
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    return-object v0
.end method

.method static synthetic access$702(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 2

    iput-object p1, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method


# virtual methods
.method public cancelRequest()V
    .registers 5

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mListener:Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;
    invoke-static {v0}, Lcom/android/volley/toolbox/ImageLoader;->access$300(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mCacheKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    if-eqz v0, :cond_27

    invoke-virtual {v0, p0}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->removeContainerAndCancelIfNecessary(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Z

    move-result v1

    if-eqz v1, :cond_26

    iget-object v2, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mInFlightRequests:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/android/volley/toolbox/ImageLoader;->access$300(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mCacheKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26
    goto :goto_50

    :cond_27
    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/android/volley/toolbox/ImageLoader;->access$400(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mCacheKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;

    if-eqz v0, :cond_50

    invoke-virtual {v0, p0}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->removeContainerAndCancelIfNecessary(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)Z

    # getter for: Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->mContainers:Ljava/util/LinkedList;
    invoke-static {v0}, Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;->access$500(Lcom/android/volley/toolbox/ImageLoader$BatchedImageRequest;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_50

    iget-object v1, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->this$0:Lcom/android/volley/toolbox/ImageLoader;

    # getter for: Lcom/android/volley/toolbox/ImageLoader;->mBatchedResponses:Ljava/util/HashMap;
    invoke-static {v1}, Lcom/android/volley/toolbox/ImageLoader;->access$400(Lcom/android/volley/toolbox/ImageLoader;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mCacheKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_50
    :goto_50
    return-void
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getRequestUrl()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->mRequestUrl:Ljava/lang/String;

    return-object v0
.end method

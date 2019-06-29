.class public Lcom/miui/filtersdk/filter/BeautificationFilter;
.super Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;
.source "BeautificationFilter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BeautificationFilter"


# instance fields
.field private mBeautyInputHeight:I

.field private mBeautyInputWidth:I

.field private mOutTexture:[I


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, -0x1

    aput v2, v0, v1

    iput-object v0, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mOutTexture:[I

    return-void
.end method

.method private initBeauty()V
    .locals 0

    return-void
.end method


# virtual methods
.method public initBeautyProcessor(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iput p1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputWidth:I

    iput p2, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputHeight:I

    iget-object v0, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->init(II)V

    return-void
.end method

.method public onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/filtersdk/filter/BeautificationFilter;->onDrawToTexture(I)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mTextureId:I

    iget p1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mTextureId:I

    invoke-super {p0, p1, p2, p3}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result p1

    return p1
.end method

.method public onDrawFrame(Ljava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 0

    const/4 p1, -0x1

    return p1
.end method

.method public onDrawToTexture(I)I
    .locals 5

    iget v0, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputWidth:I

    iget v1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputHeight:I

    iget-object v2, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mOutTexture:[I

    const/16 v3, 0xde1

    invoke-static {v0, v1, v2, v3}, Lcom/miui/filtersdk/utils/OpenGlUtils;->initEffectTexture(II[II)I

    iget-object v0, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyProcessor:Lcom/miui/filtersdk/beauty/BeautyProcessor;

    iget v1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputWidth:I

    iget v2, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mBeautyInputHeight:I

    iget-object v3, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mOutTexture:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/miui/filtersdk/beauty/BeautyProcessor;->beautify(IIII)V

    iget-object p1, p0, Lcom/miui/filtersdk/filter/BeautificationFilter;->mOutTexture:[I

    aget p1, p1, v4

    return p1
.end method

.method protected onInit()V
    .locals 0

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseBeautyFilter;->onInit()V

    invoke-direct {p0}, Lcom/miui/filtersdk/filter/BeautificationFilter;->initBeauty()V

    return-void
.end method

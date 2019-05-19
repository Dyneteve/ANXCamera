.class public Lcom/android/camera/PictureSizeManager;
.super Ljava/lang/Object;
.source "PictureSizeManager.java"


# static fields
.field private static final sPictureList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    nop

    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x3fe28f5c    # 1.77f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    :cond_0
    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    nop

    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    :cond_0
    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    nop

    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x400a3d71    # 2.16f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    :cond_0
    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    nop

    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    :cond_0
    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method private static _findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    nop

    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getRatio()F

    move-result v3

    const v4, 0x3faa3d71    # 1.33f

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    float-to-double v3, v3

    const-wide v5, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v3, v3, v5

    if-gez v3, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->area()I

    move-result v3

    mul-int v4, v0, v1

    if-le v3, v4, :cond_0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v1

    :cond_0
    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    :goto_1
    return-object p0
.end method

.method public static getBestPanoPictureSize()Lcom/android/camera/CameraSize;
    .locals 4

    nop

    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_0
    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    sget v1, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->isAspectRatio18_9(II)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_1
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    new-instance v0, Lcom/android/camera/CameraSize;

    sget-object v1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    sget-object v3, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/CameraSize;-><init>(II)V

    :cond_5
    return-object v0
.end method

.method public static getBestPictureSize()Lcom/android/camera/CameraSize;
    .locals 1

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method public static getBestPictureSize(F)Lcom/android/camera/CameraSize;
    .locals 5

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    if-eqz v0, :cond_8

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v0, 0x0

    const v1, 0x3fe28f5c    # 1.77f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    const-wide v3, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v1, v1, v3

    if-gez v1, :cond_1

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_1
    const v1, 0x3faa3d71    # 1.33f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_2

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_3

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_3
    const/high16 v1, 0x40000000    # 2.0f

    sub-float v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    cmpg-double v1, v1, v3

    if-gez v1, :cond_4

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    goto :goto_0

    :cond_4
    const v1, 0x400a3d71    # 2.16f

    sub-float/2addr p0, v1

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    float-to-double v1, p0

    cmpg-double p0, v1, v3

    if-gez p0, :cond_5

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    :cond_5
    :goto_0
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_7

    :cond_6
    new-instance v0, Lcom/android/camera/CameraSize;

    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera/CameraSize;

    iget p0, p0, Lcom/android/camera/CameraSize;->width:I

    sget-object v2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v0, p0, v1}, Lcom/android/camera/CameraSize;-><init>(II)V

    :cond_7
    return-object v0

    :cond_8
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    return-object p0
.end method

.method public static getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPictureSizeRatioString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getRatio(Ljava/lang/String;)F

    move-result v0

    const/4 v1, 0x0

    const v2, 0x3fe28f5c    # 1.77f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    const-wide v4, 0x3f947ae147ae147bL    # 0.02

    cmpg-double v2, v2, v4

    if-gez v2, :cond_1

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    :cond_1
    const v2, 0x3faa3d71    # 1.33f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_2

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    :cond_2
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_3

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    :cond_3
    const/high16 v2, 0x40000000    # 2.0f

    sub-float v2, v0, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    float-to-double v2, v2

    cmpg-double v2, v2, v4

    if-gez v2, :cond_4

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    goto :goto_0

    :cond_4
    const v2, 0x400a3d71    # 2.16f

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v2, v0

    cmpg-double v0, v2, v4

    if-gez v0, :cond_5

    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    :cond_5
    :goto_0
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    new-instance v1, Lcom/android/camera/CameraSize;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/camera/CameraSize;

    iget p0, p0, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {v1, v2, p0}, Lcom/android/camera/CameraSize;-><init>(II)V

    :cond_7
    return-object v1

    :cond_8
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0}, Lcom/android/camera/CameraSize;-><init>()V

    return-object p0
.end method

.method public static getBestSquareSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    nop

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    :cond_2
    goto :goto_0

    :cond_3
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    return-object p0

    :cond_4
    :goto_1
    new-instance p0, Lcom/android/camera/CameraSize;

    invoke-direct {p0, v0, v0}, Lcom/android/camera/CameraSize;-><init>(II)V

    return-object p0
.end method

.method public static initialize(Ljava/util/List;III)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;III)V"
        }
    .end annotation

    sget-object v0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    if-eqz p0, :cond_9

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigRatio()Lcom/android/camera/data/data/config/ComponentConfigRatio;

    move-result-object v0

    invoke-virtual {v0, p0, p2, p3}, Lcom/android/camera/data/data/config/ComponentConfigRatio;->initSensorRatio(Ljava/util/List;II)V

    if-eqz p1, :cond_2

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/CameraSize;

    invoke-virtual {p3}, Lcom/android/camera/CameraSize;->area()I

    move-result v0

    if-gt v0, p1, :cond_0

    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    goto :goto_0

    :cond_1
    nop

    move-object p0, p2

    :cond_2
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio4_3(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    if-eqz p1, :cond_3

    sget-object p2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio1_1(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    if-eqz p1, :cond_4

    sget-object p2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio16_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    if-eqz p1, :cond_5

    sget-object p2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio18_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    if-eqz p1, :cond_6

    sget-object p2, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    invoke-static {p0}, Lcom/android/camera/PictureSizeManager;->_findMaxRatio19_5_9(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p0

    if-eqz p0, :cond_7

    sget-object p1, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    sget-object p0, Lcom/android/camera/PictureSizeManager;->sPictureList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-eqz p0, :cond_8

    return-void

    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Not find the desire picture sizes!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The supported picture size list return from hal is null!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

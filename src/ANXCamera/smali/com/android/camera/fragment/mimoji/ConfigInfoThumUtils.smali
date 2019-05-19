.class public Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;
.super Ljava/lang/Object;
.source "ConfigInfoThumUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ConfigInfoThumUtils"


# instance fields
.field private final mBeardStyleRegion:[I

.field private final mEarShapeRegion:[I

.field private final mEyeBrowSharpRegion:[I

.field private final mEyeSharpRegion:[I

.field private mEyeWearList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mEyeWearStyleRegin:[I

.field private final mEyelashStyleRegion:[I

.field private final mFaceSharpRegion:[I

.field private final mFrecklesRegion:[I

.field private mHairList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mHairStyleRegion:[I

.field private final mHeadWearStyleRegion:[I

.field private final mMouthSharpRegion:[I

.field private final mNevusRegion:[I

.field private mNoEyeWear:Z

.field private mNoHair:Z

.field private final mNoseShapeRegion:[I

.field private mTempRegion:[I

.field private final mnNormalRegion:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x6

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairStyleRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_1

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mFaceSharpRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_2

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeWearStyleRegin:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_3

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyelashStyleRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_4

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeSharpRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_5

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeBrowSharpRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_6

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoseShapeRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_7

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mMouthSharpRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_8

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mBeardStyleRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_9

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mFrecklesRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_a

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNevusRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_b

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEarShapeRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_c

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHeadWearStyleRegion:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_d

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mnNormalRegion:[I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoHair:Z

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    return-void

    :array_0
    .array-data 4
        0xfb
        0x12f
        0x19
        0x23
        0xc8
        0xc8
    .end array-data

    :array_1
    .array-data 4
        0x105
        0x13a
        0x23
        0x28
        0xc8
        0xc8
    .end array-data

    :array_2
    .array-data 4
        0x105
        0x13a
        0x23
        0x28
        0xc8
        0xc8
    .end array-data

    :array_3
    .array-data 4
        0x51a
        0x622
        0x185
        0x29c
        0xc8
        0xc8
    .end array-data

    :array_4
    .array-data 4
        0x210
        0x27b
        0xa4
        0xd1
        0xc8
        0xc8
    .end array-data

    :array_5
    .array-data 4
        0x210
        0x27b
        0xa4
        0xd1
        0xc8
        0xc8
    .end array-data

    :array_6
    .array-data 4
        0x2e1
        0x377
        0x10e
        0x17a
        0xc8
        0xc8
    .end array-data

    :array_7
    .array-data 4
        0x4ae
        0x5a2
        0x1f3
        0x310
        0xc8
        0xc8
    .end array-data

    :array_8
    .array-data 4
        0x20a
        0x274
        0xa0
        0x146
        0xc8
        0xc8
    .end array-data

    :array_9
    .array-data 4
        0x259
        0x2d3
        0xc9
        0x112
        0xc8
        0xc8
    .end array-data

    :array_a
    .array-data 4
        0x259
        0x2d3
        0xc9
        0x112
        0xc8
        0xc8
    .end array-data

    :array_b
    .array-data 4
        0x407
        0x4d8
        0xb3
        0x21f
        0xc8
        0xc8
    .end array-data

    :array_c
    .array-data 4
        0x105
        0x13a
        0x23
        0x1e
        0xc8
        0xc8
    .end array-data

    :array_d
    .array-data 4
        0xc8
        0xc8
        0x0
        0x0
        0xc8
        0xc8
    .end array-data
.end method


# virtual methods
.method public renderThumb(Lcom/arcsoft/avatar/AvatarEngine;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I[F)V
    .locals 14

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v10, p2

    move/from16 v2, p3

    const/4 v3, 0x0

    iput-boolean v3, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoHair:Z

    iput-boolean v3, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    const-string v4, "ConfigInfoThumUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "configType : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v10, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v4, v10, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_4

    const/16 v6, 0xc

    if-eq v4, v6, :cond_3

    const/16 v6, 0xe

    if-eq v4, v6, :cond_2

    const/16 v6, 0x11

    if-eq v4, v6, :cond_1

    const/16 v6, 0x18

    if-eq v4, v6, :cond_0

    packed-switch v4, :pswitch_data_0

    packed-switch v4, :pswitch_data_1

    packed-switch v4, :pswitch_data_2

    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mnNormalRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    goto :goto_0

    :pswitch_0
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeBrowSharpRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :pswitch_1
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEarShapeRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoHair:Z

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :pswitch_2
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mMouthSharpRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :pswitch_3
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeSharpRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :pswitch_4
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mFaceSharpRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    goto :goto_0

    :pswitch_5
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeWearStyleRegin:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    goto :goto_0

    :pswitch_6
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNevusRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :pswitch_7
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mFrecklesRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :cond_0
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoseShapeRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :cond_1
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyelashStyleRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :cond_2
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mBeardStyleRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    iput-boolean v5, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    goto :goto_0

    :cond_3
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHeadWearStyleRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    goto :goto_0

    :cond_4
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairStyleRegion:[I

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    nop

    :goto_0
    iget-boolean v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoHair:Z

    if-eqz v4, :cond_6

    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairList:Ljava/util/ArrayList;

    if-nez v4, :cond_5

    invoke-virtual {v1, v5, v2}, Lcom/arcsoft/avatar/AvatarEngine;->getConfig(II)Ljava/util/ArrayList;

    move-result-object v4

    iput-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairList:Ljava/util/ArrayList;

    :cond_5
    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairList:Ljava/util/ArrayList;

    iget-object v6, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mHairList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v5

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {v1, v4}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    :cond_6
    iget-boolean v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mNoEyeWear:Z

    if-eqz v4, :cond_8

    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeWearList:Ljava/util/ArrayList;

    if-nez v4, :cond_7

    const/16 v4, 0x9

    invoke-virtual {v1, v4, v2}, Lcom/arcsoft/avatar/AvatarEngine;->getConfig(II)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeWearList:Ljava/util/ArrayList;

    :cond_7
    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mEyeWearList:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    :cond_8
    invoke-virtual/range {p1 .. p2}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    const/4 v4, 0x4

    aget v11, v2, v4

    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    const/4 v6, 0x5

    aget v12, v2, v6

    mul-int v2, v11, v12

    mul-int/2addr v2, v4

    new-array v13, v2, [B

    const-string v2, "ConfigInfoThumUtils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mTempRegion"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    invoke-static {v6}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    aget v2, v2, v3

    iget-object v3, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    aget v3, v3, v5

    iget-object v4, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    const/4 v5, 0x2

    aget v4, v4, v5

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->mTempRegion:[I

    const/4 v5, 0x3

    aget v5, v0, v5

    mul-int/lit8 v8, v11, 0x4

    move-object v0, v1

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move-object v5, v13

    move v6, v11

    move v7, v12

    move-object/from16 v9, p4

    invoke-virtual/range {v0 .. v9}, Lcom/arcsoft/avatar/AvatarEngine;->renderThumb(IIII[BIII[F)I

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v11, v12, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v13}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    iput-object v0, v10, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x13
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1b
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

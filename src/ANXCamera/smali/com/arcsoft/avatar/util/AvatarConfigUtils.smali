.class public Lcom/arcsoft/avatar/util/AvatarConfigUtils;
.super Ljava/lang/Object;
.source "AvatarConfigUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentConfigIdWithType(ILcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)I
    .locals 0

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const/4 p0, -0x1

    return p0

    :pswitch_1
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    return p0

    :pswitch_2
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    return p0

    :pswitch_3
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    return p0

    :pswitch_4
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    return p0

    :pswitch_5
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    return p0

    :pswitch_6
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    return p0

    :pswitch_7
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    return p0

    :pswitch_8
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    return p0

    :pswitch_9
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    return p0

    :pswitch_a
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    return p0

    :pswitch_b
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    return p0

    :pswitch_c
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorID:I

    return p0

    :pswitch_d
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    return p0

    :pswitch_e
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesID:I

    return p0

    :pswitch_f
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameID:I

    return p0

    :pswitch_10
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    return p0

    :pswitch_11
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    return p0

    :pswitch_12
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    return p0

    :pswitch_13
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorID:I

    return p0

    :pswitch_14
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    return p0

    :pswitch_15
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorID:I

    return p0

    :pswitch_16
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    return p0

    :pswitch_17
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    return p0

    :pswitch_18
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static getCurrentContinuousValueWithType(ILcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)F
    .locals 0

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const/high16 p0, -0x40800000    # -1.0f

    return p0

    :pswitch_1
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeValue:F

    return p0

    :pswitch_2
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeValue:F

    return p0

    :pswitch_3
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeValue:F

    return p0

    :pswitch_4
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeValue:F

    return p0

    :pswitch_5
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeValue:F

    return p0

    :pswitch_6
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeValue:F

    return p0

    :pswitch_7
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorValue:F

    return p0

    :pswitch_8
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorValue:F

    return p0

    :pswitch_9
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorValue:F

    return p0

    :pswitch_a
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesValue:F

    return p0

    :pswitch_b
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameValue:F

    return p0

    :pswitch_c
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorValue:F

    return p0

    :pswitch_d
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorValue:F

    return p0

    :pswitch_e
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    return p0

    :pswitch_f
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorValue:F

    return p0

    :pswitch_10
    iget p0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorValue:F

    return p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static getMatchConfigType(I)I
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/16 v0, 0xc

    if-eq p0, v0, :cond_2

    const/16 v0, 0xe

    if-eq p0, v0, :cond_1

    const/16 v0, 0x1c

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :pswitch_0
    const/4 p0, 0x5

    return p0

    :pswitch_1
    const/4 p0, 0x4

    return p0

    :pswitch_2
    const/4 p0, 0x3

    return p0

    :cond_0
    const/16 p0, 0x12

    return p0

    :cond_1
    const/16 p0, 0xf

    return p0

    :cond_2
    const/16 p0, 0xd

    return p0

    :cond_3
    const/4 p0, 0x2

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static isColorConfigComponentType(I)Z
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0xf

    if-eq p0, v0, :cond_1

    const/16 v0, 0x12

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isSupportContinuousConfigInfo(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)Z
    .locals 2

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0x13

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0x15

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0x18

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0x14

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean p0, p0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->isSupportContinuous:Z

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public static updateConfigID(IILcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V
    .locals 0

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeID:I

    goto :goto_0

    :pswitch_2
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeID:I

    goto :goto_0

    :pswitch_3
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeID:I

    goto :goto_0

    :pswitch_4
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeID:I

    goto :goto_0

    :pswitch_5
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeID:I

    goto :goto_0

    :pswitch_6
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeID:I

    goto :goto_0

    :pswitch_7
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorID:I

    goto :goto_0

    :pswitch_8
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyelashStyleID:I

    goto :goto_0

    :pswitch_9
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarringStyleID:I

    goto :goto_0

    :pswitch_a
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorID:I

    goto :goto_0

    :pswitch_b
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardStyleID:I

    goto :goto_0

    :pswitch_c
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorID:I

    goto :goto_0

    :pswitch_d
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearStyleID:I

    goto :goto_0

    :pswitch_e
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesID:I

    goto :goto_0

    :pswitch_f
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameID:I

    goto :goto_0

    :pswitch_10
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearStyleID:I

    goto :goto_0

    :pswitch_11
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNevusID:I

    goto :goto_0

    :pswitch_12
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFrecklesID:I

    goto :goto_0

    :pswitch_13
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorID:I

    goto :goto_0

    :pswitch_14
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorID:I

    goto :goto_0

    :pswitch_15
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorID:I

    goto :goto_0

    :pswitch_16
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorID:I

    goto :goto_0

    :pswitch_17
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorID:I

    goto :goto_0

    :pswitch_18
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairStyleID:I

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static updateConfigValue(IFLcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V
    .locals 0

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowShapeValue:F

    goto :goto_0

    :pswitch_2
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEarShapeValue:F

    goto :goto_0

    :pswitch_3
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configNoseShapeValue:F

    goto :goto_0

    :pswitch_4
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configMouthShapeValue:F

    goto :goto_0

    :pswitch_5
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeShapeValue:F

    goto :goto_0

    :pswitch_6
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceShapeValue:F

    goto :goto_0

    :pswitch_7
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyebrowColorValue:F

    goto :goto_0

    :pswitch_8
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configBeardColorValue:F

    goto :goto_0

    :pswitch_9
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHeadwearColorValue:F

    goto :goto_0

    :pswitch_a
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearLensesValue:F

    goto :goto_0

    :pswitch_b
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyewearFrameValue:F

    goto :goto_0

    :pswitch_c
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairHighlightColorValue:F

    goto :goto_0

    :pswitch_d
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configLipColorValue:F

    goto :goto_0

    :pswitch_e
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configEyeColorValue:F

    goto :goto_0

    :pswitch_f
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configFaceColorValue:F

    goto :goto_0

    :pswitch_10
    iput p1, p2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->configHairColorValue:F

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

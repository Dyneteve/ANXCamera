.class public Lcom/android/camera/animation/FragmentAnimationFactory;
.super Ljava/lang/Object;
.source "FragmentAnimationFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs wrapperAnimation(Landroid/view/animation/Animation$AnimationListener;[I)Landroid/view/animation/Animation;
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    nop

    array-length v4, v1

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v5, v4, :cond_1

    aget v7, v1, v5

    nop

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    sparse-switch v7, :sswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :sswitch_0
    new-instance v7, Landroid/view/animation/TranslateAnimation;

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/high16 v18, 0x3f800000    # 1.0f

    move-object v10, v7

    invoke-direct/range {v10 .. v18}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    goto :goto_1

    :sswitch_1
    new-instance v7, Landroid/view/animation/TranslateAnimation;

    const/16 v20, 0x1

    const/16 v21, 0x0

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, 0x1

    const/high16 v25, 0x3f800000    # 1.0f

    const/16 v26, 0x1

    const/16 v27, 0x0

    move-object/from16 v19, v7

    invoke-direct/range {v19 .. v27}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    goto :goto_1

    :sswitch_2
    new-instance v7, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v7, v9, v8}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    goto :goto_1

    :sswitch_3
    new-instance v7, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v7, v8, v9}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    nop

    :goto_1
    nop

    if-eqz v0, :cond_0

    if-nez v6, :cond_0

    nop

    invoke-virtual {v7, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    move v6, v3

    :cond_0
    const-wide/16 v8, 0xc8

    invoke-virtual {v7, v8, v9}, Landroid/view/animation/Animation;->setDuration(J)V

    sget-object v8, Lcom/android/camera/animation/AnimationDelegate;->DEFAULT_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v7, v8}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {v2, v7}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-object v2

    :sswitch_data_0
    .sparse-switch
        0xa1 -> :sswitch_3
        0xa2 -> :sswitch_2
        0xa7 -> :sswitch_1
        0xa8 -> :sswitch_0
    .end sparse-switch
.end method

.method public static varargs wrapperAnimation([I)Landroid/view/animation/Animation;
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/android/camera/animation/FragmentAnimationFactory;->wrapperAnimation(Landroid/view/animation/Animation$AnimationListener;[I)Landroid/view/animation/Animation;

    move-result-object p0

    return-object p0
.end method

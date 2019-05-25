.class public Lmiui/maml/animation/interpolater/InterpolatorHelper;
.super Ljava/lang/Object;
.source "InterpolatorHelper.java"


# static fields
.field private static final VAR_RATIO:Ljava/lang/String; = "__ratio"


# instance fields
.field private mEaseExp:Lmiui/maml/data/Expression;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mRatioVar:Lmiui/maml/data/IndexedVariable;


# direct methods
.method public constructor <init>(Lmiui/maml/data/Variables;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "vars"    # Lmiui/maml/data/Variables;
    .param p2, "easeType"    # Ljava/lang/String;
    .param p3, "easeExp"    # Ljava/lang/String;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {p2}, Lmiui/maml/animation/interpolater/InterpolatorFactory;->create(Ljava/lang/String;)Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 31
    invoke-static {p1, p3}, Lmiui/maml/data/Expression;->build(Lmiui/maml/data/Variables;Ljava/lang/String;)Lmiui/maml/data/Expression;

    move-result-object v0

    iput-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mEaseExp:Lmiui/maml/data/Expression;

    .line 32
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mEaseExp:Lmiui/maml/data/Expression;

    if-eqz v0, :cond_1d

    .line 33
    new-instance v0, Lmiui/maml/data/IndexedVariable;

    const-string v1, "__ratio"

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, v2}, Lmiui/maml/data/IndexedVariable;-><init>(Ljava/lang/String;Lmiui/maml/data/Variables;Z)V

    iput-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mRatioVar:Lmiui/maml/data/IndexedVariable;

    .line 35
    :cond_1d
    return-void
.end method

.method public static create(Lmiui/maml/data/Variables;Ljava/lang/String;Ljava/lang/String;)Lmiui/maml/animation/interpolater/InterpolatorHelper;
    .registers 4
    .param p0, "vars"    # Lmiui/maml/data/Variables;
    .param p1, "easeType"    # Ljava/lang/String;
    .param p2, "easeExp"    # Ljava/lang/String;

    .line 24
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 25
    const/4 v0, 0x0

    return-object v0

    .line 26
    :cond_e
    new-instance v0, Lmiui/maml/animation/interpolater/InterpolatorHelper;

    invoke-direct {v0, p0, p1, p2}, Lmiui/maml/animation/interpolater/InterpolatorHelper;-><init>(Lmiui/maml/data/Variables;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static create(Lmiui/maml/data/Variables;Lorg/w3c/dom/Element;)Lmiui/maml/animation/interpolater/InterpolatorHelper;
    .registers 4
    .param p0, "vars"    # Lmiui/maml/data/Variables;
    .param p1, "node"    # Lorg/w3c/dom/Element;

    .line 20
    const-string v0, "easeType"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "easeExp"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lmiui/maml/animation/interpolater/InterpolatorHelper;->create(Lmiui/maml/data/Variables;Ljava/lang/String;Ljava/lang/String;)Lmiui/maml/animation/interpolater/InterpolatorHelper;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public get(F)F
    .registers 5
    .param p1, "ratio"    # F

    .line 38
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mEaseExp:Lmiui/maml/data/Expression;

    if-eqz v0, :cond_12

    .line 39
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mRatioVar:Lmiui/maml/data/IndexedVariable;

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lmiui/maml/data/IndexedVariable;->set(D)V

    .line 40
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mEaseExp:Lmiui/maml/data/Expression;

    invoke-virtual {v0}, Lmiui/maml/data/Expression;->evaluate()D

    move-result-wide v0

    double-to-float v0, v0

    return v0

    .line 41
    :cond_12
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v0, :cond_1d

    .line 42
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v0, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    return v0

    .line 44
    :cond_1d
    return p1
.end method

.method public isValid()Z
    .registers 2

    .line 48
    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mEaseExp:Lmiui/maml/data/Expression;

    if-nez v0, :cond_b

    iget-object v0, p0, Lmiui/maml/animation/interpolater/InterpolatorHelper;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method

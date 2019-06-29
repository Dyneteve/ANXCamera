.class public Lcom/android/camera/ui/ValuePreference;
.super Landroid/preference/Preference;
.source "ValuePreference.java"


# instance fields
.field private mExtraPaddingEnd:I

.field private mLabels:Ljava/lang/String;

.field private mMaxEms:I

.field private mShowArrow:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/ValuePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v0, Lcom/android/camera/R$styleable;->ValuePreference:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/ui/ValuePreference;->mLabels:Ljava/lang/String;

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/ui/ValuePreference;->mShowArrow:Z

    const/4 v0, 0x2

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/ValuePreference;->mMaxEms:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0089

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/ValuePreference;->mExtraPaddingEnd:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    const p1, 0x7f040050

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ValuePreference;->setLayoutResource(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    const v0, 0x7f0e00ff

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0e0100

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget v2, p0, Lcom/android/camera/ui/ValuePreference;->mMaxEms:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget v2, p0, Lcom/android/camera/ui/ValuePreference;->mMaxEms:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxEms(I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    :cond_0
    iget-object v2, p0, Lcom/android/camera/ui/ValuePreference;->mLabels:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/ui/ValuePreference;->mLabels:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    :goto_0
    if-eqz p1, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/ui/ValuePreference;->mShowArrow:Z

    if-eqz v0, :cond_3

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1

    :cond_3
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_4
    :goto_1
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/ValuePreference;->mLabels:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/android/camera/ui/ValuePreference;->mLabels:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/android/camera/ui/ValuePreference;->notifyChanged()V

    :cond_0
    return-void
.end method

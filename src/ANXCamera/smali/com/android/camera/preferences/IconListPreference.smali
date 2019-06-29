.class public Lcom/android/camera/preferences/IconListPreference;
.super Lcom/android/camera/preferences/ListPreference;
.source "IconListPreference.java"


# instance fields
.field private mEnabled:Z

.field private mIconIds:[I

.field private mImageIds:[I

.field private mLargeIconIds:[I

.field private mSingleIconId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    invoke-direct {p0, p1, p2}, Lcom/android/camera/preferences/ListPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/preferences/IconListPreference;->mEnabled:Z

    sget-object v1, Lcom/android/camera/R$styleable;->IconListPreference:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/android/camera/preferences/IconListPreference;->mSingleIconId:I

    invoke-virtual {p2, v2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    const/4 v0, 0x2

    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    const/4 v0, 0x3

    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private getIds(Landroid/content/res/Resources;I)[I
    .locals 4

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->length()I

    move-result p2

    new-array v0, p2, [I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p2, :cond_1

    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    aput v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method


# virtual methods
.method public filterUnsupported(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/android/camera/preferences/IconListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v1, Lcom/android/camera/IntArray;

    invoke-direct {v1}, Lcom/android/camera/IntArray;-><init>()V

    new-instance v2, Lcom/android/camera/IntArray;

    invoke-direct {v2}, Lcom/android/camera/IntArray;-><init>()V

    new-instance v3, Lcom/android/camera/IntArray;

    invoke-direct {v3}, Lcom/android/camera/IntArray;-><init>()V

    array-length v4, v0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_3

    aget-object v6, v0, v5

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ltz v6, :cond_2

    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    aget v6, v6, v5

    invoke-virtual {v1, v6}, Lcom/android/camera/IntArray;->add(I)V

    :cond_0
    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    aget v6, v6, v5

    invoke-virtual {v2, v6}, Lcom/android/camera/IntArray;->add(I)V

    :cond_1
    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    aget v6, v6, v5

    invoke-virtual {v3, v6}, Lcom/android/camera/IntArray;->add(I)V

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    if-eqz v0, :cond_4

    invoke-virtual {v1}, Lcom/android/camera/IntArray;->size()I

    move-result v0

    new-array v0, v0, [I

    invoke-virtual {v1, v0}, Lcom/android/camera/IntArray;->toArray([I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    :cond_4
    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    if-eqz v0, :cond_5

    invoke-virtual {v2}, Lcom/android/camera/IntArray;->size()I

    move-result v0

    new-array v0, v0, [I

    invoke-virtual {v2, v0}, Lcom/android/camera/IntArray;->toArray([I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    :cond_5
    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    if-eqz v0, :cond_6

    invoke-virtual {v3}, Lcom/android/camera/IntArray;->size()I

    move-result v0

    new-array v0, v0, [I

    invoke-virtual {v3, v0}, Lcom/android/camera/IntArray;->toArray([I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    :cond_6
    invoke-super {p0, p1}, Lcom/android/camera/preferences/ListPreference;->filterUnsupported(Ljava/util/List;)V

    return-void
.end method

.method public getEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/preferences/IconListPreference;->mEnabled:Z

    return v0
.end method

.method public getIconIds()[I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    return-object v0
.end method

.method public getImageIds()[I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mImageIds:[I

    return-object v0
.end method

.method public getLargeIconIds()[I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    return-object v0
.end method

.method public getSingleIcon()I
    .locals 1

    iget v0, p0, Lcom/android/camera/preferences/IconListPreference;->mSingleIconId:I

    return v0
.end method

.method public setEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/preferences/IconListPreference;->mEnabled:Z

    return-void
.end method

.method public setIconIds([I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    return-void
.end method

.method public setIconRes(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/IconListPreference;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/android/camera/preferences/IconListPreference;->getIds(Landroid/content/res/Resources;I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/preferences/IconListPreference;->mIconIds:[I

    return-void
.end method

.method public setLargeIconIds([I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/preferences/IconListPreference;->mLargeIconIds:[I

    return-void
.end method

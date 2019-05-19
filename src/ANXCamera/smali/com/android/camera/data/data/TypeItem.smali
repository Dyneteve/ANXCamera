.class public final Lcom/android/camera/data/data/TypeItem;
.super Ljava/lang/Object;
.source "TypeItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final RES_NULL:I = -0x1
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public static final STRING_NULL:I = -0x1
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field


# instance fields
.field public mCategory:Ljava/lang/String;

.field public mDefaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public mDisplayNameRes:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field public mIconRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public mIconSelectedRes:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public mKeyOrType:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/data/data/TypeItem;->mIconRes:I

    iput p2, p0, Lcom/android/camera/data/data/TypeItem;->mIconSelectedRes:I

    iput p3, p0, Lcom/android/camera/data/data/TypeItem;->mDisplayNameRes:I

    iput-object p4, p0, Lcom/android/camera/data/data/TypeItem;->mCategory:Ljava/lang/String;

    iput-object p5, p0, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/data/data/TypeItem;->mIconRes:I

    iput p2, p0, Lcom/android/camera/data/data/TypeItem;->mDisplayNameRes:I

    iput-object p3, p0, Lcom/android/camera/data/data/TypeItem;->mCategory:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDefaultValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/data/data/TypeItem;->mDefaultValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getImageResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/TypeItem;->mIconRes:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/data/data/TypeItem;->mDisplayNameRes:I

    return v0
.end method

.method public setDefaultValue(Ljava/lang/Object;)Lcom/android/camera/data/data/TypeItem;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/android/camera/data/data/TypeItem<",
            "TT;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/data/data/TypeItem;->mDefaultValue:Ljava/lang/Object;

    return-object p0
.end method

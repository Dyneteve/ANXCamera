.class public final Lcom/android/camera/data/data/ComponentDataItem;
.super Ljava/lang/Object;
.source "ComponentDataItem.java"


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

.field public mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIILjava/lang/String;)V
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

    iput p1, p0, Lcom/android/camera/data/data/ComponentDataItem;->mIconRes:I

    iput p2, p0, Lcom/android/camera/data/data/ComponentDataItem;->mIconSelectedRes:I

    iput p3, p0, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    iput-object p4, p0, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    return-void
.end method

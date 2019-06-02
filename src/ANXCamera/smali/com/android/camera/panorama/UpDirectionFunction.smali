.class public Lcom/android/camera/panorama/UpDirectionFunction;
.super Lcom/android/camera/panorama/DirectionFunction;
.source "UpDirectionFunction.java"


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/android/camera/panorama/DirectionFunction;-><init>(IIIIII)V

    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/panorama/UpDirectionFunction;->mDirection:I

    return-void
.end method


# virtual methods
.method public enabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getPreviewSize()Landroid/util/Size;
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/panorama/UpDirectionFunction;->getVerticalPreviewSize()Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method

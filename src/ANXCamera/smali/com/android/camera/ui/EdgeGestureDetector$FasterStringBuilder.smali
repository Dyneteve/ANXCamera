.class final Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
.super Ljava/lang/Object;
.source "EdgeGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/EdgeGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FasterStringBuilder"
.end annotation


# instance fields
.field private mChars:[C

.field private mLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    return-void
.end method

.method private reserve(I)I
    .locals 3

    iget v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    iget v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr v1, p1

    iget-object p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    array-length v2, p1

    if-le v1, v2, :cond_0

    mul-int/lit8 v2, v2, 0x2

    new-array v1, v2, [C

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    :cond_0
    return v0
.end method


# virtual methods
.method public append(FI)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 6

    nop

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    mul-int/lit8 v0, v0, 0xa

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    int-to-float v1, v0

    mul-float/2addr p1, v1

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    int-to-double v4, v0

    div-double/2addr v2, v4

    double-to-float p1, v2

    float-to-int v0, p1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(I)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    if-eqz p2, :cond_1

    const-string v0, "."

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    sub-double/2addr v2, v4

    double-to-float p1, v2

    mul-float/2addr p1, v1

    float-to-int p1, p1

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    :cond_1
    return-object p0
.end method

.method public append(I)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    move-result-object p1

    return-object p1
.end method

.method public append(II)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 7

    const/4 v0, 0x1

    if-gez p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    neg-int p1, p1

    if-gez p1, :cond_1

    const-string p1, "-2147483648"

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;

    return-object p0

    :cond_1
    const/16 v2, 0xb

    invoke-direct {p0, v2}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->reserve(I)I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    const/16 v4, 0x30

    if-nez p1, :cond_2

    aput-char v4, v3, v2

    iget p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    return-object p0

    :cond_2
    if-eqz v1, :cond_3

    add-int/lit8 v0, v2, 0x1

    const/16 v1, 0x2d

    aput-char v1, v3, v2

    goto :goto_1

    :cond_3
    move v0, v2

    :goto_1
    const v1, 0x3b9aca00

    nop

    const/16 v2, 0xa

    move v5, v0

    move v0, v2

    :cond_4
    :goto_2
    if-ge p1, v1, :cond_5

    div-int/lit8 v1, v1, 0xa

    add-int/lit8 v0, v0, -0x1

    if-ge v0, p2, :cond_4

    add-int/lit8 v6, v5, 0x1

    aput-char v4, v3, v5

    move v5, v6

    goto :goto_2

    :cond_5
    :goto_3
    div-int p2, p1, v1

    mul-int v0, p2, v1

    sub-int/2addr p1, v0

    div-int/2addr v1, v2

    add-int/lit8 v0, v5, 0x1

    add-int/2addr p2, v4

    int-to-char p2, p2

    aput-char p2, v3, v5

    if-nez v1, :cond_6

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    return-object p0

    :cond_6
    move v5, v0

    goto :goto_3
.end method

.method public append(Ljava/lang/String;)Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->reserve(I)I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0, v2, v1}, Ljava/lang/String;->getChars(II[CI)V

    iget p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    return-object p0
.end method

.method public clear()Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mChars:[C

    iget v2, p0, Lcom/android/camera/ui/EdgeGestureDetector$FasterStringBuilder;->mLength:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

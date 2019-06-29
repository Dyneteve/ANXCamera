.class public final Lcom/google/zxing/oned/rss/FinderPattern;
.super Ljava/lang/Object;
.source "FinderPattern.java"


# instance fields
.field private final resultPoints:[Lcom/google/zxing/ResultPoint;

.field private final startEnd:[I

.field private final value:I


# direct methods
.method public constructor <init>(I[IIII)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    iput-object p2, p0, Lcom/google/zxing/oned/rss/FinderPattern;->startEnd:[I

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v2, p3

    int-to-float v3, p5

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v2, p4

    int-to-float v3, p5

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->resultPoints:[Lcom/google/zxing/ResultPoint;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/oned/rss/FinderPattern;

    iget v2, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    iget v3, v0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    if-ne v2, v3, :cond_10

    const/4 v1, 0x1

    :cond_10
    return v1
.end method

.method public getResultPoints()[Lcom/google/zxing/ResultPoint;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->resultPoints:[Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method public getStartEnd()[I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->startEnd:[I

    return-object v0
.end method

.method public getValue()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/oned/rss/FinderPattern;->value:I

    return v0
.end method

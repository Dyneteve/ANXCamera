.class final Lcom/google/zxing/pdf417/decoder/BoundingBox;
.super Ljava/lang/Object;
.source "BoundingBox.java"


# instance fields
.field private bottomLeft:Lcom/google/zxing/ResultPoint;

.field private bottomRight:Lcom/google/zxing/ResultPoint;

.field private image:Lcom/google/zxing/common/BitMatrix;

.field private maxX:I

.field private maxY:I

.field private minX:I

.field private minY:I

.field private topLeft:Lcom/google/zxing/ResultPoint;

.field private topRight:Lcom/google/zxing/ResultPoint;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_7

    if-eqz p4, :cond_14

    :cond_7
    if-nez p3, :cond_b

    if-eqz p5, :cond_14

    :cond_b
    if-eqz p2, :cond_f

    if-eqz p3, :cond_14

    :cond_f
    if-eqz p4, :cond_19

    if-eqz p5, :cond_14

    goto :goto_19

    :cond_14
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_19
    :goto_19
    invoke-direct/range {p0 .. p5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->init(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    return-void
.end method

.method constructor <init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    iget-object v2, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    iget-object v3, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    iget-object v4, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    iget-object v5, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->init(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    return-void
.end method

.method private calculateMinMaxValues()V
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    if-nez v0, :cond_20

    new-instance v0, Lcom/google/zxing/ResultPoint;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    new-instance v0, Lcom/google/zxing/ResultPoint;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-direct {v0, v2, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    goto :goto_50

    :cond_20
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    if-nez v0, :cond_50

    new-instance v0, Lcom/google/zxing/ResultPoint;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    new-instance v0, Lcom/google/zxing/ResultPoint;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    :cond_50
    :goto_50
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->minX:I

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->maxX:I

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->minY:I

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->maxY:I

    return-void
.end method

.method private init(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V
    .registers 6

    iput-object p1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    iput-object p2, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    iput-object p3, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    iput-object p4, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    iput-object p5, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->calculateMinMaxValues()V

    return-void
.end method

.method static merge(Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/pdf417/decoder/BoundingBox;)Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    new-instance v6, Lcom/google/zxing/pdf417/decoder/BoundingBox;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    iget-object v4, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    iget-object v5, p1, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    return-object v6
.end method


# virtual methods
.method addMissingRows(IIZ)Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    if-lez p1, :cond_29

    if-eqz p3, :cond_f

    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    goto :goto_11

    :cond_f
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    :goto_11
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v5, v5

    sub-int/2addr v5, p1

    if-gez v5, :cond_1a

    const/4 v5, 0x0

    :cond_1a
    new-instance v6, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v7

    int-to-float v8, v5

    invoke-direct {v6, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    if-eqz p3, :cond_28

    move-object v0, v6

    goto :goto_29

    :cond_28
    move-object v2, v6

    :cond_29
    :goto_29
    if-lez p2, :cond_57

    if-eqz p3, :cond_30

    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    goto :goto_32

    :cond_30
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    :goto_32
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v5, v5

    add-int/2addr v5, p2

    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    if-lt v5, v6, :cond_48

    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    add-int/lit8 v5, v6, -0x1

    :cond_48
    new-instance v6, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v7

    int-to-float v8, v5

    invoke-direct {v6, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    if-eqz p3, :cond_56

    move-object v1, v6

    goto :goto_57

    :cond_56
    move-object v3, v6

    :cond_57
    :goto_57
    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->calculateMinMaxValues()V

    new-instance v10, Lcom/google/zxing/pdf417/decoder/BoundingBox;

    iget-object v5, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->image:Lcom/google/zxing/common/BitMatrix;

    move-object v4, v10

    move-object v6, v0

    move-object v7, v1

    move-object v8, v2

    move-object v9, v3

    invoke-direct/range {v4 .. v9}, Lcom/google/zxing/pdf417/decoder/BoundingBox;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    return-object v10
.end method

.method getBottomLeft()Lcom/google/zxing/ResultPoint;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomLeft:Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method getBottomRight()Lcom/google/zxing/ResultPoint;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->bottomRight:Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method getMaxX()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->maxX:I

    return v0
.end method

.method getMaxY()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->maxY:I

    return v0
.end method

.method getMinX()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->minX:I

    return v0
.end method

.method getMinY()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->minY:I

    return v0
.end method

.method getTopLeft()Lcom/google/zxing/ResultPoint;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topLeft:Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

.method getTopRight()Lcom/google/zxing/ResultPoint;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/BoundingBox;->topRight:Lcom/google/zxing/ResultPoint;

    return-object v0
.end method

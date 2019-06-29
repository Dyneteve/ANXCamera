.class Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;
.super Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;
.source "Cea608CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea608CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PAC"
.end annotation


# instance fields
.field final mCol:I

.field final mRow:I


# direct methods
.method constructor <init>(IIII)V
    .locals 0

    invoke-direct {p0, p3, p4}, Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;-><init>(II)V

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mRow:I

    iput p2, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mCol:I

    return-void
.end method

.method static fromBytes(BB)Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;
    .locals 4

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const/4 v1, 0x7

    and-int/2addr p0, v1

    aget p0, v0, p0

    and-int/lit8 v0, p1, 0x20

    shr-int/lit8 v0, v0, 0x5

    add-int/2addr p0, v0

    nop

    and-int/lit8 v0, p1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v3, p1, 0x10

    if-eqz v3, :cond_1

    shr-int/lit8 p1, p1, 0x1

    and-int/2addr p1, v1

    new-instance v1, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;

    mul-int/lit8 p1, p1, 0x4

    invoke-direct {v1, p0, p1, v0, v2}, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;-><init>(IIII)V

    return-object v1

    :cond_1
    shr-int/lit8 p1, p1, 0x1

    and-int/2addr p1, v1

    if-ne p1, v1, :cond_2

    nop

    or-int/lit8 v0, v0, 0x1

    move p1, v2

    :cond_2
    new-instance v1, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;

    const/4 v2, -0x1

    invoke-direct {v1, p0, v2, v0, p1}, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;-><init>(IIII)V

    return-object v1

    :array_0
    .array-data 4
        0xb
        0x1
        0x3
        0xc
        0xe
        0x5
        0x7
        0x9
    .end array-data
.end method


# virtual methods
.method getCol()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mCol:I

    return v0
.end method

.method getRow()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mRow:I

    return v0
.end method

.method isIndentPAC()Z
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mCol:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "{%d, %d}, %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mRow:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$PAC;->mCol:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-super {p0}, Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

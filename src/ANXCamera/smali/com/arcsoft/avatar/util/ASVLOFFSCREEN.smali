.class public Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;
.super Ljava/lang/Object;
.source "ASVLOFFSCREEN.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final ASVL_PAF_NV21:I = 0x802

.field public static final ASVL_PAF_RGB32_R8G8B8A8:I = 0x305


# instance fields
.field private RGBA8888:[B

.field private height:I

.field private pixelFormat:I

.field private rowStride:[I

.field private vuData:[B

.field private width:I

.field private yData:[B


# direct methods
.method public constructor <init>(II[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->width:I

    iput p2, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->height:I

    const/16 p1, 0x305

    iput p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->pixelFormat:I

    iput-object p3, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->RGBA8888:[B

    return-void
.end method

.method public constructor <init>([BIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->width:I

    iput p4, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->height:I

    const/16 p3, 0x802

    iput p3, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->pixelFormat:I

    iput-object p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->yData:[B

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->vuData:[B

    const/4 p1, 0x2

    new-array p1, p1, [I

    const/4 p3, 0x0

    aput p2, p1, p3

    const/4 p3, 0x1

    aput p2, p1, p3

    iput-object p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->rowStride:[I

    return-void
.end method

.method public constructor <init>([BIIIZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;-><init>([BIII)V

    if-eqz p5, :cond_0

    array-length p2, p1

    new-array p2, p2, [B

    iput-object p2, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->yData:[B

    iget-object p2, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->yData:[B

    array-length p3, p1

    const/4 p4, 0x0

    invoke-static {p1, p4, p2, p4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-void
.end method

.method public constructor <init>([B[B[III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p4, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->width:I

    iput p5, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->height:I

    const/16 p4, 0x802

    iput p4, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->pixelFormat:I

    iput-object p1, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->yData:[B

    iput-object p2, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->vuData:[B

    iput-object p3, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->rowStride:[I

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    nop

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->height:I

    return v0
.end method

.method public getPixelFormat()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->pixelFormat:I

    return v0
.end method

.method public getRGBA8888()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->RGBA8888:[B

    return-object v0
.end method

.method public getRowStride()[I
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->rowStride:[I

    return-object v0
.end method

.method public getVuData()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->vuData:[B

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->width:I

    return v0
.end method

.method public getYData()[B
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->yData:[B

    return-object v0
.end method

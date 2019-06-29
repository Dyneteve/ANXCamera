.class public final Lcom/google/zxing/oned/Code128Writer;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "Code128Writer.java"


# static fields
.field private static final CODE_CODE_B:I = 0x64

.field private static final CODE_CODE_C:I = 0x63

.field private static final CODE_FNC_1:I = 0x66

.field private static final CODE_FNC_2:I = 0x61

.field private static final CODE_FNC_3:I = 0x60

.field private static final CODE_FNC_4_B:I = 0x64

.field private static final CODE_START_B:I = 0x68

.field private static final CODE_START_C:I = 0x69

.field private static final CODE_STOP:I = 0x6a

.field private static final ESCAPE_FNC_1:C = '\u00f1'

.field private static final ESCAPE_FNC_2:C = '\u00f2'

.field private static final ESCAPE_FNC_3:C = '\u00f3'

.field private static final ESCAPE_FNC_4:C = '\u00f4'


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method

.method private static isDigits(Ljava/lang/CharSequence;II)Z
    .registers 9

    add-int v0, p1, p2

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    move v2, p1

    :goto_7
    const/4 v3, 0x0

    if-ge v2, v0, :cond_23

    if-lt v2, v1, :cond_d

    goto :goto_23

    :cond_d
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x30

    if-lt v4, v5, :cond_19

    const/16 v5, 0x39

    if-le v4, v5, :cond_20

    :cond_19
    const/16 v5, 0xf1

    if-eq v4, v5, :cond_1e

    return v3

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_23
    :goto_23
    if-gt v0, v1, :cond_27

    const/4 v2, 0x1

    return v2

    :cond_27
    return v3
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_9

    invoke-super/range {p0 .. p5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode CODE_128, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)[Z
    .registers 15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_e5

    const/16 v2, 0x50

    if-gt v0, v2, :cond_e5

    const/4 v2, 0x0

    :goto_c
    const/16 v3, 0x20

    if-lt v2, v0, :cond_bf

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v2

    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    :cond_1a
    :goto_1a
    if-lt v7, v0, :cond_65

    rem-int/lit8 v8, v2, 0x67

    sget-object v2, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v2, v2, v8

    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    sget-object v2, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    const/16 v3, 0x6a

    aget-object v2, v2, v3

    invoke-interface {v4, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_33
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_53

    new-array v3, v2, [Z

    const/4 v9, 0x0

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_40
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_47

    return-object v3

    :cond_47
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [I

    invoke-static {v3, v9, v11, v1}, Lcom/google/zxing/oned/Code128Writer;->appendPattern([ZI[IZ)I

    move-result v12

    add-int/2addr v9, v12

    goto :goto_40

    :cond_53
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, [I

    array-length v11, v10

    const/4 v3, 0x0

    :goto_5c
    if-lt v3, v11, :cond_5f

    goto :goto_33

    :cond_5f
    aget v12, v10, v3

    add-int/2addr v2, v12

    add-int/lit8 v3, v3, 0x1

    goto :goto_5c

    :cond_65
    const/16 v8, 0x63

    if-ne v6, v8, :cond_6b

    const/4 v8, 0x2

    goto :goto_6c

    :cond_6b
    const/4 v8, 0x4

    :goto_6c
    invoke-static {p1, v7, v8}, Lcom/google/zxing/oned/Code128Writer;->isDigits(Ljava/lang/CharSequence;II)Z

    move-result v9

    const/16 v10, 0x64

    if-eqz v9, :cond_77

    const/16 v9, 0x63

    goto :goto_78

    :cond_77
    move v9, v10

    :goto_78
    if-ne v9, v6, :cond_a3

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    packed-switch v11, :pswitch_data_fa

    if-ne v6, v10, :cond_95

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v10

    sub-int/2addr v10, v3

    goto :goto_a1

    :pswitch_89
    const/16 v10, 0x64

    goto :goto_a1

    :pswitch_8c
    const/16 v10, 0x60

    goto :goto_a1

    :pswitch_8f
    const/16 v10, 0x61

    goto :goto_a1

    :pswitch_92
    const/16 v10, 0x66

    goto :goto_a1

    :cond_95
    add-int/lit8 v10, v7, 0x2

    invoke-virtual {p1, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    add-int/lit8 v7, v7, 0x1

    :goto_a1
    add-int/2addr v7, v1

    goto :goto_af

    :cond_a3
    if-nez v6, :cond_ad

    if-ne v9, v10, :cond_aa

    const/16 v10, 0x68

    goto :goto_ae

    :cond_aa
    const/16 v10, 0x69

    goto :goto_ae

    :cond_ad
    move v10, v9

    :goto_ae
    move v6, v9

    :goto_af
    sget-object v11, Lcom/google/zxing/oned/Code128Reader;->CODE_PATTERNS:[[I

    aget-object v11, v11, v10

    invoke-interface {v4, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    mul-int v11, v10, v5

    add-int/2addr v2, v11

    if-eqz v7, :cond_1a

    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1a

    :cond_bf
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-lt v4, v3, :cond_c9

    const/16 v3, 0x7e

    if-le v4, v3, :cond_e1

    :cond_c9
    packed-switch v4, :pswitch_data_106

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Bad character in input: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_e0
    nop

    :cond_e1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_c

    :cond_e5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Contents length should be between 1 and 80 characters, but got "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_fa
    .packed-switch 0xf1
        :pswitch_92
        :pswitch_8f
        :pswitch_8c
        :pswitch_89
    .end packed-switch

    :pswitch_data_106
    .packed-switch 0xf1
        :pswitch_e0
        :pswitch_e0
        :pswitch_e0
        :pswitch_e0
    .end packed-switch
.end method

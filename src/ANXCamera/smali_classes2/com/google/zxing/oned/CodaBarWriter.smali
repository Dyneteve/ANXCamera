.class public final Lcom/google/zxing/oned/CodaBarWriter;
.super Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.source "CodaBarWriter.java"


# static fields
.field private static final ALT_START_END_CHARS:[C

.field private static final CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

.field private static final START_END_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x4

    new-array v1, v0, [C

    fill-array-data v1, :array_18

    sput-object v1, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    new-array v1, v0, [C

    fill-array-data v1, :array_20

    sput-object v1, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    new-array v0, v0, [C

    fill-array-data v0, :array_28

    sput-object v0, Lcom/google/zxing/oned/CodaBarWriter;->CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

    return-void

    nop

    :array_18
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data

    :array_20
    .array-data 2
        0x54s
        0x4es
        0x2as
        0x45s
    .end array-data

    :array_28
    .array-data 2
        0x2fs
        0x3as
        0x2bs
        0x2es
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;)[Z
    .registers 19

    move-object/from16 v0, p1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_15c

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    sget-object v5, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v5, v2}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v5

    if-eqz v5, :cond_32

    sget-object v5, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v5, v3}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v5

    if-eqz v5, :cond_32

    move v5, v4

    goto :goto_33

    :cond_32
    move v5, v1

    :goto_33
    sget-object v6, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v6, v2}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v6

    if-eqz v6, :cond_45

    sget-object v6, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v6, v3}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v6

    if-eqz v6, :cond_45

    move v6, v4

    goto :goto_46

    :cond_45
    move v6, v1

    :goto_46
    if-nez v5, :cond_73

    if-eqz v6, :cond_4b

    goto :goto_73

    :cond_4b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "Codabar should start/end with "

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v7, Lcom/google/zxing/oned/CodaBarWriter;->START_END_CHARS:[C

    invoke-static {v7}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", or start/end with "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Lcom/google/zxing/oned/CodaBarWriter;->ALT_START_END_CHARS:[C

    invoke-static {v7}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_73
    :goto_73
    const/16 v7, 0x14

    const/4 v8, 0x1

    :goto_76
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    if-lt v8, v9, :cond_10e

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v4

    add-int v9, v7, v8

    new-array v10, v9, [Z

    const/4 v7, 0x0

    const/4 v8, 0x0

    move v12, v7

    move v11, v8

    :goto_8a
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v11, v7, :cond_91

    return-object v10

    :cond_91
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v7

    if-eqz v11, :cond_a2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    sub-int/2addr v8, v4

    if-ne v11, v8, :cond_b2

    :cond_a2
    const/16 v8, 0x2a

    if-eq v7, v8, :cond_bd

    const/16 v8, 0x45

    if-eq v7, v8, :cond_ba

    const/16 v8, 0x4e

    if-eq v7, v8, :cond_b7

    const/16 v8, 0x54

    if-eq v7, v8, :cond_b4

    :cond_b2
    :goto_b2
    move v13, v7

    goto :goto_c0

    :cond_b4
    const/16 v7, 0x41

    goto :goto_b2

    :cond_b7
    const/16 v7, 0x42

    goto :goto_b2

    :cond_ba
    const/16 v7, 0x44

    goto :goto_b2

    :cond_bd
    const/16 v7, 0x43

    goto :goto_b2

    :goto_c0
    const/4 v14, 0x0

    const/4 v7, 0x0

    :goto_c2
    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    array-length v8, v8

    if-lt v7, v8, :cond_c9

    :goto_c7
    move v8, v14

    goto :goto_d4

    :cond_c9
    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    aget-char v8, v8, v7

    if-ne v13, v8, :cond_10b

    sget-object v8, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    aget v14, v8, v7

    goto :goto_c7

    :goto_d4
    const/4 v7, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_d7
    const/4 v1, 0x7

    if-lt v15, v1, :cond_eb

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v4

    if-ge v11, v1, :cond_e7

    const/4 v1, 0x0

    aput-boolean v1, v10, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_e8

    :cond_e7
    const/4 v1, 0x0

    :goto_e8
    add-int/lit8 v11, v11, 0x1

    goto :goto_8a

    :cond_eb
    const/4 v1, 0x0

    aput-boolean v7, v10, v12

    add-int/lit8 v12, v12, 0x1

    rsub-int/lit8 v16, v15, 0x6

    shr-int v16, v8, v16

    and-int/lit8 v16, v16, 0x1

    if-eqz v16, :cond_fe

    if-ne v14, v4, :cond_fb

    goto :goto_fe

    :cond_fb
    add-int/lit8 v14, v14, 0x1

    goto :goto_d7

    :cond_fe
    :goto_fe
    if-eqz v7, :cond_103

    move/from16 v16, v1

    goto :goto_105

    :cond_103
    move/from16 v16, v4

    :goto_105
    move/from16 v7, v16

    add-int/lit8 v15, v15, 0x1

    const/4 v14, 0x0

    goto :goto_d7

    :cond_10b
    add-int/lit8 v7, v7, 0x1

    goto :goto_c2

    :cond_10e
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-nez v9, :cond_155

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2d

    if-eq v9, v10, :cond_155

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x24

    if-ne v9, v10, :cond_129

    goto :goto_155

    :cond_129
    sget-object v9, Lcom/google/zxing/oned/CodaBarWriter;->CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED:[C

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v10

    invoke-static {v9, v10}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v9

    if-eqz v9, :cond_138

    add-int/lit8 v7, v7, 0xa

    goto :goto_158

    :cond_138
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v9, "Cannot encode : \'"

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v9, 0x27

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_155
    :goto_155
    add-int/lit8 v7, v7, 0x9

    nop

    :goto_158
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_76

    :cond_15c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Codabar should start/end with start/stop symbols"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

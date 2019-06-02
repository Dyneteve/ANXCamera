.class public final Lcom/google/zxing/common/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final ASSUME_SHIFT_JIS:Z

.field private static final EUC_JP:Ljava/lang/String; = "EUC_JP"

.field public static final GB2312:Ljava/lang/String; = "GB2312"

.field private static final ISO88591:Ljava/lang/String; = "ISO8859_1"

.field private static final PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

.field public static final SHIFT_JIS:Ljava/lang/String; = "SJIS"

.field private static final UTF8:Ljava/lang/String; = "UTF8"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    const-string v0, "SJIS"

    sget-object v1, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "EUC_JP"

    sget-object v1, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    const/4 v0, 0x0

    goto :goto_21

    :cond_20
    const/4 v0, 0x1

    :goto_21
    sput-boolean v0, Lcom/google/zxing/common/StringUtils;->ASSUME_SHIFT_JIS:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static guessEncoding([BLjava/util/Map;)Ljava/lang/String;
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_11

    sget-object v2, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_11

    return-object v2

    :cond_11
    array-length v2, v0

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    array-length v1, v0

    const/16 v17, 0x0

    move/from16 v18, v3

    const/4 v3, 0x3

    const/16 v19, 0x1

    if-le v1, v3, :cond_41

    aget-byte v1, v0, v17

    const/16 v3, -0x11

    if-ne v1, v3, :cond_41

    aget-byte v1, v0, v19

    const/16 v3, -0x45

    if-ne v1, v3, :cond_41

    const/4 v1, 0x2

    aget-byte v3, v0, v1

    const/16 v1, -0x41

    if-ne v3, v1, :cond_41

    move/from16 v17, v19

    nop

    :cond_41
    move/from16 v1, v17

    const/4 v3, 0x0

    :goto_44
    if-ge v3, v2, :cond_105

    if-nez v18, :cond_50

    if-nez v4, :cond_50

    if-nez v5, :cond_50

    move/from16 v20, v2

    goto/16 :goto_107

    :cond_50
    move/from16 v20, v2

    aget-byte v2, v0, v3

    and-int/lit16 v2, v2, 0xff

    if-eqz v5, :cond_8c

    if-lez v6, :cond_65

    and-int/lit16 v0, v2, 0x80

    if-nez v0, :cond_62

    const/4 v0, 0x0

    nop

    :goto_60
    move v5, v0

    goto :goto_8c

    :cond_62
    add-int/lit8 v6, v6, -0x1

    goto :goto_8c

    :cond_65
    and-int/lit16 v0, v2, 0x80

    if-eqz v0, :cond_8c

    and-int/lit8 v0, v2, 0x40

    if-nez v0, :cond_6f

    const/4 v0, 0x0

    goto :goto_60

    :cond_6f
    add-int/lit8 v6, v6, 0x1

    and-int/lit8 v0, v2, 0x20

    if-nez v0, :cond_78

    add-int/lit8 v7, v7, 0x1

    goto :goto_8c

    :cond_78
    add-int/lit8 v6, v6, 0x1

    and-int/lit8 v0, v2, 0x10

    if-nez v0, :cond_81

    add-int/lit8 v8, v8, 0x1

    goto :goto_8c

    :cond_81
    add-int/lit8 v6, v6, 0x1

    and-int/lit8 v0, v2, 0x8

    if-nez v0, :cond_8a

    add-int/lit8 v9, v9, 0x1

    goto :goto_8c

    :cond_8a
    const/4 v0, 0x0

    goto :goto_60

    :cond_8c
    :goto_8c
    const/16 v0, 0x7f

    if-eqz v18, :cond_ad

    if-le v2, v0, :cond_9b

    const/16 v0, 0xa0

    if-ge v2, v0, :cond_9b

    const/4 v0, 0x0

    nop

    move/from16 v18, v0

    goto :goto_ad

    :cond_9b
    const/16 v0, 0x9f

    if-le v2, v0, :cond_ad

    const/16 v0, 0xc0

    if-lt v2, v0, :cond_ab

    const/16 v0, 0xd7

    if-eq v2, v0, :cond_ab

    const/16 v0, 0xf7

    if-ne v2, v0, :cond_ad

    :cond_ab
    add-int/lit8 v16, v16, 0x1

    :cond_ad
    :goto_ad
    if-eqz v4, :cond_fd

    if-lez v10, :cond_c5

    const/16 v0, 0x40

    if-lt v2, v0, :cond_c1

    const/16 v0, 0x7f

    if-eq v2, v0, :cond_c1

    const/16 v0, 0xfc

    if-le v2, v0, :cond_be

    goto :goto_c1

    :cond_be
    add-int/lit8 v10, v10, -0x1

    goto :goto_fd

    :cond_c1
    :goto_c1
    const/4 v0, 0x0

    nop

    :goto_c3
    move v4, v0

    goto :goto_fd

    :cond_c5
    const/16 v0, 0x80

    if-eq v2, v0, :cond_fb

    const/16 v0, 0xa0

    if-eq v2, v0, :cond_fb

    const/16 v0, 0xef

    if-le v2, v0, :cond_d2

    goto :goto_fb

    :cond_d2
    const/16 v0, 0xa0

    if-le v2, v0, :cond_e6

    const/16 v0, 0xe0

    if-ge v2, v0, :cond_e6

    add-int/lit8 v11, v11, 0x1

    const/4 v0, 0x0

    add-int/lit8 v12, v12, 0x1

    if-le v12, v14, :cond_e4

    move v13, v12

    nop

    move v14, v13

    :cond_e4
    move v13, v0

    goto :goto_fd

    :cond_e6
    const/16 v0, 0x7f

    if-le v2, v0, :cond_f6

    add-int/lit8 v10, v10, 0x1

    const/4 v0, 0x0

    add-int/lit8 v13, v13, 0x1

    if-le v13, v15, :cond_f4

    move v12, v13

    nop

    move v15, v12

    :cond_f4
    move v12, v0

    goto :goto_fd

    :cond_f6
    const/4 v0, 0x0

    const/4 v2, 0x0

    move v12, v0

    move v13, v2

    goto :goto_fd

    :cond_fb
    :goto_fb
    const/4 v0, 0x0

    goto :goto_c3

    :cond_fd
    :goto_fd
    add-int/lit8 v3, v3, 0x1

    move/from16 v2, v20

    move-object/from16 v0, p0

    goto/16 :goto_44

    :cond_105
    move/from16 v20, v2

    :goto_107
    if-eqz v5, :cond_10c

    if-lez v6, :cond_10c

    const/4 v5, 0x0

    :cond_10c
    if-eqz v4, :cond_111

    if-lez v10, :cond_111

    const/4 v4, 0x0

    :cond_111
    if-eqz v5, :cond_11d

    if-nez v1, :cond_11a

    add-int v0, v7, v8

    add-int/2addr v0, v9

    if-lez v0, :cond_11d

    :cond_11a
    const-string v0, "UTF8"

    return-object v0

    :cond_11d
    if-eqz v4, :cond_12b

    sget-boolean v0, Lcom/google/zxing/common/StringUtils;->ASSUME_SHIFT_JIS:Z

    if-nez v0, :cond_128

    const/4 v0, 0x3

    if-ge v14, v0, :cond_128

    if-lt v15, v0, :cond_12b

    :cond_128
    const-string v0, "SJIS"

    return-object v0

    :cond_12b
    if-eqz v18, :cond_144

    if-eqz v4, :cond_144

    const/4 v0, 0x2

    if-ne v14, v0, :cond_138

    if-eq v11, v0, :cond_135

    goto :goto_138

    :cond_135
    move/from16 v2, v20

    goto :goto_13e

    :cond_138
    :goto_138
    mul-int/lit8 v0, v16, 0xa

    move/from16 v2, v20

    if-lt v0, v2, :cond_141

    :goto_13e
    const-string v0, "SJIS"

    goto :goto_143

    :cond_141
    const-string v0, "ISO8859_1"

    :goto_143
    return-object v0

    :cond_144
    move/from16 v2, v20

    if-eqz v18, :cond_14b

    const-string v0, "ISO8859_1"

    return-object v0

    :cond_14b
    if-eqz v4, :cond_150

    const-string v0, "SJIS"

    return-object v0

    :cond_150
    if-eqz v5, :cond_155

    const-string v0, "UTF8"

    return-object v0

    :cond_155
    sget-object v0, Lcom/google/zxing/common/StringUtils;->PLATFORM_DEFAULT_ENCODING:Ljava/lang/String;

    return-object v0
.end method

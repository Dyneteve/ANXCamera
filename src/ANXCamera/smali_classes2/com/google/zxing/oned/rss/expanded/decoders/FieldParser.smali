.class final Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;
.super Ljava/lang/Object;
.source "FieldParser.java"


# static fields
.field private static final FOUR_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

.field private static final THREE_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

.field private static final THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

.field private static final TWO_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

.field private static final VARIABLE_LENGTH:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    const/16 v0, 0x18

    new-array v0, v0, [[Ljava/lang/Object;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, "00"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/16 v3, 0x12

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v2, v6

    aput-object v2, v0, v4

    new-array v2, v1, [Ljava/lang/Object;

    const-string v5, "01"

    aput-object v5, v2, v4

    const/16 v5, 0xe

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v6

    aput-object v2, v0, v6

    new-array v2, v1, [Ljava/lang/Object;

    const-string v7, "02"

    aput-object v7, v2, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v6

    aput-object v2, v0, v1

    const/4 v2, 0x3

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "10"

    aput-object v8, v7, v4

    sget-object v8, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v8, v7, v6

    const/16 v8, 0x14

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v1

    aput-object v7, v0, v2

    new-array v7, v1, [Ljava/lang/Object;

    const-string v9, "11"

    aput-object v9, v7, v4

    const/4 v9, 0x6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v6

    const/4 v10, 0x4

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v10, "12"

    aput-object v10, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v6

    const/4 v10, 0x5

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v10, "13"

    aput-object v10, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v6

    aput-object v7, v0, v9

    new-array v7, v1, [Ljava/lang/Object;

    const-string v10, "15"

    aput-object v10, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v6

    const/4 v10, 0x7

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v10, "17"

    aput-object v10, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v6

    const/16 v10, 0x8

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v11, "20"

    aput-object v11, v7, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v6

    const/16 v11, 0x9

    aput-object v7, v0, v11

    new-array v7, v2, [Ljava/lang/Object;

    const-string v11, "21"

    aput-object v11, v7, v4

    sget-object v11, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v11, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v1

    const/16 v11, 0xa

    aput-object v7, v0, v11

    new-array v7, v2, [Ljava/lang/Object;

    const-string v12, "22"

    aput-object v12, v7, v4

    sget-object v12, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v12, v7, v6

    const/16 v12, 0x1d

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v7, v1

    const/16 v12, 0xb

    aput-object v7, v0, v12

    new-array v7, v2, [Ljava/lang/Object;

    const-string v12, "30"

    aput-object v12, v7, v4

    sget-object v12, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v12, v7, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v7, v1

    const/16 v12, 0xc

    aput-object v7, v0, v12

    new-array v7, v2, [Ljava/lang/Object;

    const-string v13, "37"

    aput-object v13, v7, v4

    sget-object v13, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v13, v7, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v7, v1

    const/16 v13, 0xd

    aput-object v7, v0, v13

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "90"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0x1e

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v7, v1

    aput-object v7, v0, v5

    new-array v7, v2, [Ljava/lang/Object;

    const-string v15, "91"

    aput-object v15, v7, v4

    sget-object v15, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v15, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v7, v1

    const/16 v15, 0xf

    aput-object v7, v0, v15

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "92"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x10

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "93"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v15, 0x11

    aput-object v7, v0, v15

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "94"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v3

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "95"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x13

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "96"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v8

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "97"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x15

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "98"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x16

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "99"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x17

    aput-object v7, v0, v16

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->TWO_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    const/16 v0, 0x17

    new-array v0, v0, [[Ljava/lang/Object;

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "240"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v4

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "241"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v6

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "242"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v1

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "250"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v2

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "251"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x4

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "253"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x5

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "254"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v9

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "400"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x7

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "401"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "402"

    aput-object v16, v7, v4

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    const/16 v16, 0x9

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "403"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v11

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "410"

    aput-object v16, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    const/16 v16, 0xb

    aput-object v7, v0, v16

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "411"

    aput-object v16, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    aput-object v7, v0, v12

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "412"

    aput-object v16, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    aput-object v7, v0, v13

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "413"

    aput-object v16, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    aput-object v7, v0, v5

    new-array v7, v1, [Ljava/lang/Object;

    const-string v16, "414"

    aput-object v16, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v6

    const/16 v16, 0xf

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "420"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v16, 0x10

    aput-object v7, v0, v16

    new-array v7, v2, [Ljava/lang/Object;

    const-string v16, "421"

    aput-object v16, v7, v4

    sget-object v16, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v16, v7, v6

    const/16 v14, 0xf

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v15

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "422"

    aput-object v14, v7, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v3

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "423"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0xf

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v14, 0x13

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "424"

    aput-object v14, v7, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v8

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "425"

    aput-object v14, v7, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x15

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "426"

    aput-object v14, v7, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x16

    aput-object v7, v0, v14

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->THREE_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    const/16 v0, 0x39

    new-array v0, v0, [[Ljava/lang/Object;

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "310"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v4

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "311"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v6

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "312"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v1

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "313"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v2

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "314"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/4 v14, 0x4

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "315"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/4 v14, 0x5

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "316"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v9

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "320"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/4 v14, 0x7

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "321"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v10

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "322"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x9

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "323"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v11

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "324"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0xb

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "325"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v12

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "326"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v13

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "327"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v5

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "328"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0xf

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "329"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x10

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "330"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v15

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "331"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v3

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "332"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x13

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "333"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v8

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "334"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x15

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "335"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x16

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "336"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x17

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "340"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x18

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "341"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x19

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "342"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1a

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "343"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1b

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "344"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1c

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "345"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1d

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "346"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1e

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "347"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x1f

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "348"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x20

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "349"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x21

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "350"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x22

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "351"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x23

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "352"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x24

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "353"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x25

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "354"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x26

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "355"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x27

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "356"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x28

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "357"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x29

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "360"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2a

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "361"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2b

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "362"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2c

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "363"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2d

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "364"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2e

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "365"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x2f

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "366"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x30

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "367"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x31

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "368"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x32

    aput-object v7, v0, v14

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "369"

    aput-object v14, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    const/16 v14, 0x33

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "390"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0xf

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v14, 0x34

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "391"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v1

    const/16 v14, 0x35

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "392"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0xf

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v14, 0x36

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "393"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v1

    const/16 v14, 0x37

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "703"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0x1e

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    const/16 v14, 0x38

    aput-object v7, v0, v14

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    new-array v0, v3, [[Ljava/lang/Object;

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "7001"

    aput-object v14, v7, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v4

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "7002"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    const/16 v14, 0x1e

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v7, v1

    aput-object v7, v0, v6

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "7003"

    aput-object v14, v7, v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v1

    new-array v7, v1, [Ljava/lang/Object;

    const-string v14, "8001"

    aput-object v14, v7, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v6

    aput-object v7, v0, v2

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "8002"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    const/4 v8, 0x4

    aput-object v7, v0, v8

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "8003"

    aput-object v8, v7, v4

    sget-object v8, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v8, v7, v6

    const/16 v8, 0x1e

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v1

    const/4 v14, 0x5

    aput-object v7, v0, v14

    new-array v7, v2, [Ljava/lang/Object;

    const-string v14, "8004"

    aput-object v14, v7, v4

    sget-object v14, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v14, v7, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v7, v1

    aput-object v7, v0, v9

    new-array v7, v1, [Ljava/lang/Object;

    const-string v8, "8005"

    aput-object v8, v7, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v6

    const/4 v8, 0x7

    aput-object v7, v0, v8

    new-array v7, v1, [Ljava/lang/Object;

    const-string v8, "8006"

    aput-object v8, v7, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v6

    aput-object v7, v0, v10

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "8007"

    aput-object v8, v7, v4

    sget-object v8, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v8, v7, v6

    const/16 v8, 0x1e

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    const/16 v8, 0x9

    aput-object v7, v0, v8

    new-array v7, v2, [Ljava/lang/Object;

    const-string v8, "8008"

    aput-object v8, v7, v4

    sget-object v8, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v8, v7, v6

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    aput-object v7, v0, v11

    new-array v7, v1, [Ljava/lang/Object;

    const-string v8, "8018"

    aput-object v8, v7, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v6

    const/16 v3, 0xb

    aput-object v7, v0, v3

    new-array v3, v2, [Ljava/lang/Object;

    const-string v7, "8020"

    aput-object v7, v3, v4

    sget-object v7, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v7, v3, v6

    const/16 v7, 0x19

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v1

    aput-object v3, v0, v12

    new-array v3, v1, [Ljava/lang/Object;

    const-string v7, "8100"

    aput-object v7, v3, v4

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v6

    aput-object v3, v0, v13

    new-array v3, v1, [Ljava/lang/Object;

    const-string v7, "8101"

    aput-object v7, v3, v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v6

    aput-object v3, v0, v5

    new-array v3, v1, [Ljava/lang/Object;

    const-string v5, "8102"

    aput-object v5, v3, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v6

    const/16 v5, 0xf

    aput-object v3, v0, v5

    new-array v3, v2, [Ljava/lang/Object;

    const-string v5, "8110"

    aput-object v5, v3, v4

    sget-object v5, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v5, v3, v6

    const/16 v5, 0x46

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v1

    const/16 v5, 0x10

    aput-object v3, v0, v5

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "8200"

    aput-object v3, v2, v4

    sget-object v3, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    aput-object v3, v2, v6

    const/16 v3, 0x46

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    aput-object v2, v0, v15

    sput-object v0, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->FOUR_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static parseFieldsInGeneralPurpose(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_108

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->TWO_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    array-length v4, v3

    move v5, v0

    :goto_18
    const/4 v6, 0x1

    if-lt v5, v4, :cond_da

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x3

    if-lt v3, v4, :cond_d5

    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    sget-object v5, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->THREE_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    array-length v7, v5

    move v8, v0

    :goto_2a
    if-lt v8, v7, :cond_a7

    sget-object v9, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    array-length v10, v9

    move v4, v0

    :goto_30
    const/4 v5, 0x4

    if-lt v4, v10, :cond_7a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v5, :cond_75

    invoke-virtual {p0, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->FOUR_DIGIT_DATA_LENGTH:[[Ljava/lang/Object;

    array-length v8, v7

    move v9, v0

    :goto_41
    if-ge v9, v8, :cond_70

    aget-object v10, v7, v9

    aget-object v11, v10, v0

    invoke-virtual {v11, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6d

    aget-object v0, v10, v6

    sget-object v7, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    if-ne v0, v7, :cond_60

    aget-object v0, v10, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v5, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processVariableAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_60
    aget-object v0, v10, v6

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v5, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processFixedAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_6d
    add-int/lit8 v9, v9, 0x1

    goto :goto_41

    :cond_70
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_75
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_7a
    aget-object v7, v9, v4

    aget-object v8, v7, v0

    invoke-virtual {v8, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a4

    aget-object v0, v7, v6

    sget-object v4, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    if-ne v0, v4, :cond_97

    aget-object v0, v7, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v5, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processVariableAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_97
    aget-object v0, v7, v6

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v5, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processFixedAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_a4
    add-int/lit8 v4, v4, 0x1

    goto :goto_30

    :cond_a7
    aget-object v9, v5, v8

    aget-object v10, v9, v0

    invoke-virtual {v10, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d1

    aget-object v0, v9, v6

    sget-object v5, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    if-ne v0, v5, :cond_c4

    aget-object v0, v9, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v4, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processVariableAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_c4
    aget-object v0, v9, v6

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v4, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processFixedAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_d1
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2a

    :cond_d5
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_da
    aget-object v7, v3, v5

    aget-object v8, v7, v0

    invoke-virtual {v8, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_104

    aget-object v0, v7, v6

    sget-object v3, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->VARIABLE_LENGTH:Ljava/lang/Object;

    if-ne v0, v3, :cond_f7

    aget-object v0, v7, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v1, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processVariableAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_f7
    aget-object v0, v7, v6

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v1, v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->processFixedAI(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_104
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_18

    :cond_108
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static processFixedAI(IILjava/lang/String;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, p0, :cond_57

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int v2, p0, p1

    if-lt v1, v2, :cond_52

    add-int v1, p0, p1

    invoke-virtual {p2, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int v2, p0, p1

    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x28

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->parseFieldsInGeneralPurpose(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_41

    move-object v5, v3

    goto :goto_51

    :cond_41
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_51
    return-object v5

    :cond_52
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_57
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static processVariableAI(IILjava/lang/String;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int v2, p0, p1

    if-ge v1, v2, :cond_12

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_14

    :cond_12
    add-int v1, p0, p1

    :goto_14
    invoke-virtual {p2, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v5, 0x28

    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v5, 0x29

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Lcom/google/zxing/oned/rss/expanded/decoders/FieldParser;->parseFieldsInGeneralPurpose(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3e

    move-object v6, v4

    goto :goto_4e

    :cond_3e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_4e
    return-object v6
.end method

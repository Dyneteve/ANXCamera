.class public Lcom/google/gson/stream/JsonReader;
.super Ljava/lang/Object;
.source "JsonReader.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final MIN_INCOMPLETE_INTEGER:J = -0xcccccccccccccccL

.field private static final NON_EXECUTE_PREFIX:[C

.field private static final NUMBER_CHAR_DECIMAL:I = 0x3

.field private static final NUMBER_CHAR_DIGIT:I = 0x2

.field private static final NUMBER_CHAR_EXP_DIGIT:I = 0x7

.field private static final NUMBER_CHAR_EXP_E:I = 0x5

.field private static final NUMBER_CHAR_EXP_SIGN:I = 0x6

.field private static final NUMBER_CHAR_FRACTION_DIGIT:I = 0x4

.field private static final NUMBER_CHAR_NONE:I = 0x0

.field private static final NUMBER_CHAR_SIGN:I = 0x1

.field private static final PEEKED_BEGIN_ARRAY:I = 0x3

.field private static final PEEKED_BEGIN_OBJECT:I = 0x1

.field private static final PEEKED_BUFFERED:I = 0xb

.field private static final PEEKED_DOUBLE_QUOTED:I = 0x9

.field private static final PEEKED_DOUBLE_QUOTED_NAME:I = 0xd

.field private static final PEEKED_END_ARRAY:I = 0x4

.field private static final PEEKED_END_OBJECT:I = 0x2

.field private static final PEEKED_EOF:I = 0x11

.field private static final PEEKED_FALSE:I = 0x6

.field private static final PEEKED_LONG:I = 0xf

.field private static final PEEKED_NONE:I = 0x0

.field private static final PEEKED_NULL:I = 0x7

.field private static final PEEKED_NUMBER:I = 0x10

.field private static final PEEKED_SINGLE_QUOTED:I = 0x8

.field private static final PEEKED_SINGLE_QUOTED_NAME:I = 0xc

.field private static final PEEKED_TRUE:I = 0x5

.field private static final PEEKED_UNQUOTED:I = 0xa

.field private static final PEEKED_UNQUOTED_NAME:I = 0xe


# instance fields
.field private final buffer:[C

.field private final in:Ljava/io/Reader;

.field private lenient:Z

.field private limit:I

.field private lineNumber:I

.field private lineStart:I

.field private peeked:I

.field private peekedLong:J

.field private peekedNumberLength:I

.field private peekedString:Ljava/lang/String;

.field private pos:I

.field private stack:[I

.field private stackSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, ")]}\'\n"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    new-instance v0, Lcom/google/gson/stream/JsonReader$1;

    invoke-direct {v0}, Lcom/google/gson/stream/JsonReader$1;-><init>()V

    sput-object v0, Lcom/google/gson/internal/JsonReaderInternalAccess;->INSTANCE:Lcom/google/gson/internal/JsonReaderInternalAccess;

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    const/16 v1, 0x400

    new-array v1, v1, [C

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    const/16 v1, 0x20

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v2, 0x6

    aput v2, v0, v1

    if-eqz p1, :cond_2e

    iput-object p1, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    return-void

    :cond_2e
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Lcom/google/gson/stream/JsonReader;)I
    .registers 2

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v0
.end method

.method static synthetic access$002(Lcom/google/gson/stream/JsonReader;I)I
    .registers 2

    iput p1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return p1
.end method

.method static synthetic access$100(Lcom/google/gson/stream/JsonReader;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/google/gson/stream/JsonReader;)I
    .registers 2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/google/gson/stream/JsonReader;)I
    .registers 2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v0

    return v0
.end method

.method private checkLenient()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const-string v0, "Use JsonReader.setLenient(true) to accept malformed JSON"

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private consumeNonExecutePrefix()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sget-object v1, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v1, v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-le v0, v1, :cond_1d

    sget-object v0, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v0, v0

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-nez v0, :cond_1d

    return-void

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    sget-object v1, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v1, v1

    if-ge v0, v1, :cond_34

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    sget-object v2, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    aget-char v2, v2, v0

    if-eq v1, v2, :cond_31

    return-void

    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    :cond_34
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sget-object v1, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v1, v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return-void
.end method

.method private doPeek()I
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    aget v0, v0, v1

    const/16 v1, 0x27

    const/16 v3, 0x22

    const/16 v4, 0x8

    const/4 v5, 0x3

    const/16 v6, 0x5d

    const/4 v7, 0x7

    const/16 v8, 0x3b

    const/16 v9, 0x2c

    const/4 v10, 0x4

    const/4 v11, 0x2

    if-ne v0, v2, :cond_23

    iget-object v12, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v13, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v13, v2

    aput v11, v12, v13

    goto/16 :goto_af

    :cond_23
    if-ne v0, v11, :cond_3f

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v12

    if-eq v12, v9, :cond_3c

    if-eq v12, v8, :cond_39

    if-ne v12, v6, :cond_32

    iput v10, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v10

    :cond_32
    const-string v1, "Unterminated array"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_39
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :cond_3c
    nop

    goto/16 :goto_af

    :cond_3f
    const/4 v12, 0x5

    if-eq v0, v5, :cond_136

    if-ne v0, v12, :cond_46

    goto/16 :goto_136

    :cond_46
    if-ne v0, v10, :cond_83

    iget-object v13, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v14, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v14, v2

    aput v12, v13, v14

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v12

    const/16 v13, 0x3a

    if-eq v12, v13, :cond_81

    const/16 v13, 0x3d

    if-ne v12, v13, :cond_7a

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iget v13, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v14, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v13, v14, :cond_6a

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v13

    if-eqz v13, :cond_82

    :cond_6a
    iget-object v13, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v14, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v13, v13, v14

    const/16 v14, 0x3e

    if-ne v13, v14, :cond_82

    iget v13, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v13, v2

    iput v13, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_82

    :cond_7a
    const-string v1, "Expected \':\'"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_81
    nop

    :cond_82
    :goto_82
    goto :goto_af

    :cond_83
    const/4 v12, 0x6

    if-ne v0, v12, :cond_95

    iget-boolean v12, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-eqz v12, :cond_8d

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->consumeNonExecutePrefix()V

    :cond_8d
    iget-object v12, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v13, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v13, v2

    aput v7, v12, v13

    goto :goto_af

    :cond_95
    if-ne v0, v7, :cond_ad

    const/4 v12, 0x0

    invoke-direct {p0, v12}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_a4

    const/16 v1, 0x11

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_a4
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iget v13, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v13, v2

    iput v13, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_af

    :cond_ad
    if-eq v0, v4, :cond_12e

    :goto_af
    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v12

    if-eq v12, v3, :cond_122

    if-eq v12, v1, :cond_11c

    if-eq v12, v9, :cond_105

    if-eq v12, v8, :cond_105

    const/16 v1, 0x5b

    if-eq v12, v1, :cond_102

    if-eq v12, v6, :cond_fd

    const/16 v1, 0x7b

    if-eq v12, v1, :cond_fa

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    if-ne v1, v2, :cond_d1

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :cond_d1
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->peekKeyword()I

    move-result v1

    if-eqz v1, :cond_d8

    return v1

    :cond_d8
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->peekNumber()I

    move-result v1

    if-eqz v1, :cond_df

    return v1

    :cond_df
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v2, v2, v3

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v2

    if-eqz v2, :cond_f3

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    const/16 v2, 0xa

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v2

    :cond_f3
    const-string v2, "Expected value"

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    :cond_fa
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v2

    :cond_fd
    if-ne v0, v2, :cond_105

    iput v10, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v10

    :cond_102
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v5

    :cond_105
    if-eq v0, v2, :cond_111

    if-ne v0, v11, :cond_10a

    goto :goto_111

    :cond_10a
    const-string v1, "Unexpected value"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_111
    :goto_111
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v7

    :cond_11c
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v4

    :cond_122
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    if-ne v1, v2, :cond_129

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :cond_129
    const/16 v1, 0x9

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_12e
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "JsonReader is closed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_136
    :goto_136
    iget-object v4, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v5, v2

    aput v10, v4, v5

    const/16 v4, 0x7d

    if-ne v0, v12, :cond_159

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v5

    if-eq v5, v9, :cond_158

    if-eq v5, v8, :cond_155

    if-ne v5, v4, :cond_14e

    iput v11, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v11

    :cond_14e
    const-string v1, "Unterminated object"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_155
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :cond_158
    nop

    :cond_159
    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v5

    if-eq v5, v3, :cond_192

    if-eq v5, v1, :cond_18a

    if-eq v5, v4, :cond_17e

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    int-to-char v1, v5

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v1

    if-eqz v1, :cond_177

    const/16 v1, 0xe

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_177
    const-string v1, "Expected name"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_17e
    if-eq v0, v12, :cond_183

    iput v11, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v11

    :cond_183
    const-string v1, "Expected name"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_18a
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    const/16 v1, 0xc

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_192
    const/16 v1, 0xd

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1
.end method

.method private fillBuffer(I)Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1f

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    invoke-static {v0, v1, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_21

    :cond_1f
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    :goto_21
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    :cond_23
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    array-length v4, v0

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v0, v2, v4}, Ljava/io/Reader;->read([CII)I

    move-result v1

    move v2, v1

    const/4 v4, -0x1

    if-eq v1, v4, :cond_5d

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    const/4 v4, 0x1

    if-nez v1, :cond_58

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    if-nez v1, :cond_58

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lez v1, :cond_58

    aget-char v1, v0, v3

    const v5, 0xfeff

    if-ne v1, v5, :cond_58

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v4

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    add-int/2addr v1, v4

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    add-int/lit8 p1, p1, 0x1

    :cond_58
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v1, p1, :cond_23

    return v4

    :cond_5d
    return v3
.end method

.method private getColumnNumber()I
    .registers 3

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private getLineNumber()I
    .registers 2

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private isLiteral(C)Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sparse-switch p1, :sswitch_data_a

    const/4 v0, 0x1

    return v0

    :sswitch_5
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :sswitch_8
    const/4 v0, 0x0

    return v0

    :sswitch_data_a
    .sparse-switch
        0x9 -> :sswitch_8
        0xa -> :sswitch_8
        0xc -> :sswitch_8
        0xd -> :sswitch_8
        0x20 -> :sswitch_8
        0x23 -> :sswitch_5
        0x2c -> :sswitch_8
        0x2f -> :sswitch_5
        0x3a -> :sswitch_8
        0x3b -> :sswitch_5
        0x3d -> :sswitch_5
        0x5b -> :sswitch_8
        0x5c -> :sswitch_5
        0x5d -> :sswitch_8
        0x7b -> :sswitch_8
        0x7d -> :sswitch_8
    .end sparse-switch
.end method

.method private nextNonWhitespace(Z)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    :goto_6
    const/4 v3, 0x1

    if-ne v1, v2, :cond_41

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v4

    if-nez v4, :cond_3d

    nop

    if-nez p1, :cond_16

    const/4 v3, -0x1

    return v3

    :cond_16
    new-instance v3, Ljava/io/EOFException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "End of input at line "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " column "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_3d
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    :cond_41
    add-int/lit8 v4, v1, 0x1

    aget-char v1, v0, v1

    const/16 v5, 0xa

    if-ne v1, v5, :cond_52

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto/16 :goto_c5

    :cond_52
    const/16 v5, 0x20

    if-eq v1, v5, :cond_c5

    const/16 v5, 0xd

    if-eq v1, v5, :cond_c5

    const/16 v5, 0x9

    if-ne v1, v5, :cond_5f

    goto :goto_c5

    :cond_5f
    const/16 v5, 0x2f

    if-ne v1, v5, :cond_b1

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/4 v6, 0x2

    if-ne v4, v2, :cond_79

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v7, v3

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0, v6}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v8, v3

    iput v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    if-nez v7, :cond_79

    return v1

    :cond_79
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v7, v0, v7

    const/16 v8, 0x2a

    if-eq v7, v8, :cond_97

    if-eq v7, v5, :cond_87

    return v1

    :cond_87
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipToEndOfLine()V

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    nop

    :goto_94
    move v1, v3

    goto/16 :goto_6

    :cond_97
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const-string v3, "*/"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->skipTo(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_aa

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v6

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    goto :goto_94

    :cond_aa
    const-string v3, "Unterminated comment"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    :cond_b1
    const/16 v3, 0x23

    if-ne v1, v3, :cond_c2

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipToEndOfLine()V

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    goto :goto_94

    :cond_c2
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return v1

    :cond_c5
    :goto_c5
    move v1, v4

    goto/16 :goto_6
.end method

.method private nextQuotedValue(C)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    :goto_7
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    move v4, v3

    move v3, v2

    :goto_d
    const/4 v5, 0x1

    if-ge v3, v4, :cond_4a

    add-int/lit8 v6, v3, 0x1

    aget-char v3, v0, v3

    if-ne v3, p1, :cond_23

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int v7, v6, v2

    sub-int/2addr v7, v5

    invoke-virtual {v1, v0, v2, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    :cond_23
    const/16 v7, 0x5c

    if-ne v3, v7, :cond_3d

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int v7, v6, v2

    sub-int/2addr v7, v5

    invoke-virtual {v1, v0, v2, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->readEscapeCharacter()C

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    move v2, v5

    move v3, v5

    goto :goto_49

    :cond_3d
    const/16 v7, 0xa

    if-ne v3, v7, :cond_48

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v7, v5

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    :cond_48
    move v3, v6

    :goto_49
    goto :goto_d

    :cond_4a
    sub-int v6, v3, v2

    invoke-virtual {v1, v0, v2, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v5

    if-eqz v5, :cond_58

    goto :goto_7

    :cond_58
    const-string v5, "Unterminated string"

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v5

    throw v5
.end method

.method private nextUnquotedValue()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_2
    :goto_2
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-ge v2, v3, :cond_1a

    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v1

    aget-char v2, v2, v3

    sparse-switch v2, :sswitch_data_62

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :sswitch_16
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :sswitch_19
    goto :goto_45

    :cond_1a
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    array-length v2, v2

    if-ge v1, v2, :cond_28

    add-int/lit8 v2, v1, 0x1

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-eqz v2, :cond_45

    goto :goto_2

    :cond_28
    if-nez v0, :cond_30

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v2

    :cond_30
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {v0, v2, v3, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v2

    if-nez v2, :cond_2

    nop

    :cond_45
    :goto_45
    if-nez v0, :cond_51

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {v2, v3, v4, v1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_5c

    :cond_51
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {v0, v2, v3, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_5c
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return-object v2

    :sswitch_data_62
    .sparse-switch
        0x9 -> :sswitch_19
        0xa -> :sswitch_19
        0xc -> :sswitch_19
        0xd -> :sswitch_19
        0x20 -> :sswitch_19
        0x23 -> :sswitch_16
        0x2c -> :sswitch_19
        0x2f -> :sswitch_16
        0x3a -> :sswitch_19
        0x3b -> :sswitch_16
        0x3d -> :sswitch_16
        0x5b -> :sswitch_19
        0x5c -> :sswitch_16
        0x5d -> :sswitch_19
        0x7b -> :sswitch_19
        0x7d -> :sswitch_19
    .end sparse-switch
.end method

.method private peekKeyword()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/4 v1, 0x0

    const/16 v2, 0x74

    if-eq v0, v2, :cond_2f

    const/16 v2, 0x54

    if-ne v0, v2, :cond_10

    goto :goto_2f

    :cond_10
    const/16 v2, 0x66

    if-eq v0, v2, :cond_29

    const/16 v2, 0x46

    if-ne v0, v2, :cond_19

    goto :goto_29

    :cond_19
    const/16 v2, 0x6e

    if-eq v0, v2, :cond_23

    const/16 v2, 0x4e

    if-ne v0, v2, :cond_22

    goto :goto_23

    :cond_22
    return v1

    :cond_23
    :goto_23
    const-string v2, "null"

    const-string v3, "NULL"

    const/4 v4, 0x7

    goto :goto_34

    :cond_29
    :goto_29
    const-string v2, "false"

    const-string v3, "FALSE"

    const/4 v4, 0x6

    goto :goto_34

    :cond_2f
    :goto_2f
    const-string v2, "true"

    const-string v3, "TRUE"

    const/4 v4, 0x5

    :goto_34
    nop

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    :goto_3a
    if-ge v6, v5, :cond_63

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v7, v6

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v7, v8, :cond_4c

    add-int/lit8 v7, v6, 0x1

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    if-nez v7, :cond_4c

    return v1

    :cond_4c
    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v8, v6

    aget-char v0, v7, v8

    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v0, v7, :cond_60

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v0, v7, :cond_60

    return v1

    :cond_60
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a

    :cond_63
    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v6, v5

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v6, v7, :cond_72

    add-int/lit8 v6, v5, 0x1

    invoke-direct {p0, v6}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v6

    if-eqz v6, :cond_80

    :cond_72
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v7, v5

    aget-char v6, v6, v7

    invoke-direct {p0, v6}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v6

    if-eqz v6, :cond_80

    return v1

    :cond_80
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v5

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v4
.end method

.method private peekNumber()I
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, v0, Lcom/google/gson/stream/JsonReader;->limit:I

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-wide v10, v4

    move v4, v3

    move v3, v2

    move v2, v9

    :goto_12
    add-int v5, v3, v2

    const/4 v12, 0x4

    const/4 v13, 0x2

    if-ne v5, v4, :cond_2d

    array-length v5, v1

    if-ne v2, v5, :cond_1c

    return v9

    :cond_1c
    add-int/lit8 v5, v2, 0x1

    invoke-direct {v0, v5}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v5

    if-nez v5, :cond_29

    nop

    move-wide/from16 v16, v10

    goto/16 :goto_a2

    :cond_29
    iget v3, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, v0, Lcom/google/gson/stream/JsonReader;->limit:I

    :cond_2d
    add-int v5, v3, v2

    aget-char v5, v1, v5

    const/16 v14, 0x2b

    const/4 v15, 0x5

    if-eq v5, v14, :cond_101

    const/16 v14, 0x45

    if-eq v5, v14, :cond_f4

    const/16 v14, 0x65

    if-eq v5, v14, :cond_f4

    packed-switch v5, :pswitch_data_10e

    const/16 v14, 0x30

    if-lt v5, v14, :cond_99

    const/16 v14, 0x39

    if-le v5, v14, :cond_4c

    move-wide/from16 v16, v10

    goto :goto_9b

    :cond_4c
    const/4 v12, 0x1

    if-eq v8, v12, :cond_90

    if-nez v8, :cond_54

    move-wide/from16 v16, v10

    goto :goto_92

    :cond_54
    if-ne v8, v13, :cond_7e

    const-wide/16 v13, 0x0

    cmp-long v13, v10, v13

    if-nez v13, :cond_5d

    return v9

    :cond_5d
    const-wide/16 v13, 0xa

    mul-long/2addr v13, v10

    add-int/lit8 v15, v5, -0x30

    move-wide/from16 v16, v10

    int-to-long v9, v15

    sub-long/2addr v13, v9

    const-wide v9, -0xcccccccccccccccL

    cmp-long v11, v16, v9

    if-gtz v11, :cond_7a

    cmp-long v9, v16, v9

    if-nez v9, :cond_78

    cmp-long v9, v13, v16

    if-gez v9, :cond_78

    goto :goto_7a

    :cond_78
    const/4 v12, 0x0

    nop

    :cond_7a
    :goto_7a
    and-int/2addr v7, v12

    move-wide v9, v13

    goto/16 :goto_106

    :cond_7e
    move-wide/from16 v16, v10

    const/4 v9, 0x3

    if-ne v8, v9, :cond_88

    const/4 v8, 0x4

    :cond_84
    :goto_84
    move-wide/from16 v10, v16

    goto/16 :goto_107

    :cond_88
    if-eq v8, v15, :cond_8d

    const/4 v9, 0x6

    if-ne v8, v9, :cond_84

    :cond_8d
    const/4 v5, 0x7

    move v8, v5

    goto :goto_84

    :cond_90
    move-wide/from16 v16, v10

    :goto_92
    add-int/lit8 v9, v5, -0x30

    neg-int v9, v9

    int-to-long v9, v9

    const/4 v8, 0x2

    goto/16 :goto_106

    :cond_99
    move-wide/from16 v16, v10

    :goto_9b
    invoke-direct {v0, v5}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v9

    if-nez v9, :cond_da

    nop

    :goto_a2
    if-ne v8, v13, :cond_c7

    if-eqz v7, :cond_c7

    const-wide/high16 v9, -0x8000000000000000L

    cmp-long v5, v16, v9

    if-nez v5, :cond_b2

    if-eqz v6, :cond_af

    goto :goto_b2

    :cond_af
    move-wide/from16 v9, v16

    goto :goto_c9

    :cond_b2
    :goto_b2
    if-eqz v6, :cond_b8

    move-wide/from16 v9, v16

    move-wide v11, v9

    goto :goto_bb

    :cond_b8
    move-wide/from16 v9, v16

    neg-long v11, v9

    :goto_bb
    iput-wide v11, v0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    iget v5, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v5, v2

    iput v5, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/16 v5, 0xf

    iput v5, v0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v5

    :cond_c7
    move-wide/from16 v9, v16

    :goto_c9
    if-eq v8, v13, :cond_d3

    if-eq v8, v12, :cond_d3

    const/4 v5, 0x7

    if-ne v8, v5, :cond_d1

    goto :goto_d3

    :cond_d1
    const/4 v11, 0x0

    return v11

    :cond_d3
    :goto_d3
    iput v2, v0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    const/16 v5, 0x10

    iput v5, v0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v5

    :cond_da
    move-wide/from16 v9, v16

    const/4 v11, 0x0

    return v11

    :pswitch_de
    move-wide/from16 v18, v10

    move v11, v9

    move-wide/from16 v9, v18

    if-ne v8, v13, :cond_e7

    const/4 v8, 0x3

    goto :goto_106

    :cond_e7
    return v11

    :pswitch_e8
    move-wide v9, v10

    if-nez v8, :cond_ee

    const/4 v6, 0x1

    const/4 v8, 0x1

    goto :goto_106

    :cond_ee
    if-ne v8, v15, :cond_f2

    const/4 v8, 0x6

    goto :goto_106

    :cond_f2
    const/4 v11, 0x0

    return v11

    :cond_f4
    move-wide/from16 v18, v10

    move v11, v9

    move-wide/from16 v9, v18

    if-eq v8, v13, :cond_ff

    if-ne v8, v12, :cond_fe

    goto :goto_ff

    :cond_fe
    return v11

    :cond_ff
    :goto_ff
    const/4 v8, 0x5

    goto :goto_106

    :cond_101
    move-wide v9, v10

    if-ne v8, v15, :cond_10c

    const/4 v8, 0x6

    nop

    :goto_106
    move-wide v10, v9

    :goto_107
    add-int/lit8 v2, v2, 0x1

    const/4 v9, 0x0

    goto/16 :goto_12

    :cond_10c
    const/4 v11, 0x0

    return v11

    :pswitch_data_10e
    .packed-switch 0x2d
        :pswitch_e8
        :pswitch_de
    .end packed-switch
.end method

.method private push(I)V
    .registers 6

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    array-length v1, v1

    if-ne v0, v1, :cond_17

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    :cond_17
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    aput p1, v0, v1

    return-void
.end method

.method private readEscapeCharacter()C
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_15

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-eqz v0, :cond_e

    goto :goto_15

    :cond_e
    const-string v0, "Unterminated escape sequence"

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_15
    :goto_15
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_b8

    const/16 v2, 0x62

    if-eq v0, v2, :cond_b5

    const/16 v2, 0x66

    if-eq v0, v2, :cond_b2

    const/16 v3, 0x6e

    if-eq v0, v3, :cond_b1

    const/16 v3, 0x72

    if-eq v0, v3, :cond_ae

    packed-switch v0, :pswitch_data_c2

    goto/16 :goto_c1

    :pswitch_38
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/4 v4, 0x4

    add-int/2addr v3, v4

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-le v3, v5, :cond_4e

    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-eqz v3, :cond_47

    goto :goto_4e

    :cond_47
    const-string v1, "Unterminated escape sequence"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1

    :cond_4e
    :goto_4e
    const/4 v3, 0x0

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v6, v5, 0x4

    :goto_53
    if-ge v5, v6, :cond_a5

    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    aget-char v7, v7, v5

    shl-int/lit8 v8, v3, 0x4

    int-to-char v3, v8

    const/16 v8, 0x30

    if-lt v7, v8, :cond_69

    const/16 v8, 0x39

    if-gt v7, v8, :cond_69

    add-int/lit8 v8, v7, -0x30

    add-int/2addr v8, v3

    int-to-char v3, v8

    goto :goto_82

    :cond_69
    const/16 v8, 0x61

    if-lt v7, v8, :cond_75

    if-gt v7, v2, :cond_75

    add-int/lit8 v8, v7, -0x61

    add-int/2addr v8, v1

    add-int/2addr v8, v3

    int-to-char v3, v8

    goto :goto_82

    :cond_75
    const/16 v8, 0x41

    if-lt v7, v8, :cond_85

    const/16 v8, 0x46

    if-gt v7, v8, :cond_85

    add-int/lit8 v8, v7, -0x41

    add-int/2addr v8, v1

    add-int/2addr v8, v3

    int-to-char v3, v8

    :goto_82
    add-int/lit8 v5, v5, 0x1

    goto :goto_53

    :cond_85
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\\u"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v10, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {v8, v9, v10, v4}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_a5
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v4

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return v3

    :pswitch_ab
    const/16 v1, 0x9

    return v1

    :cond_ae
    const/16 v1, 0xd

    return v1

    :cond_b1
    return v1

    :cond_b2
    const/16 v1, 0xc

    return v1

    :cond_b5
    const/16 v1, 0x8

    return v1

    :cond_b8
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    :goto_c1
    return v0

    :pswitch_data_c2
    .packed-switch 0x74
        :pswitch_ab
        :pswitch_38
    .end packed-switch
.end method

.method private skipQuotedValue(C)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    :goto_2
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    :goto_6
    const/4 v3, 0x1

    if-ge v1, v2, :cond_2e

    add-int/lit8 v4, v1, 0x1

    aget-char v1, v0, v1

    if-ne v1, p1, :cond_12

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return-void

    :cond_12
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_21

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->readEscapeCharacter()C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    move v1, v3

    goto :goto_2d

    :cond_21
    const/16 v5, 0xa

    if-ne v1, v5, :cond_2c

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v5, v3

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iput v4, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    :cond_2c
    move v1, v4

    :goto_2d
    goto :goto_6

    :cond_2e
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-eqz v1, :cond_37

    goto :goto_2

    :cond_37
    const-string v1, "Unterminated string"

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method private skipTo(Ljava/lang/String;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    const/4 v2, 0x0

    if-le v0, v1, :cond_18

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-eqz v0, :cond_17

    goto :goto_18

    :cond_17
    return v2

    :cond_18
    :goto_18
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/16 v1, 0xa

    const/4 v3, 0x1

    if-ne v0, v1, :cond_2e

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto :goto_44

    :cond_2e
    nop

    :goto_2f
    move v0, v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4d

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_4a

    nop

    :goto_44
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_0

    :cond_4a
    add-int/lit8 v2, v0, 0x1

    goto :goto_2f

    :cond_4d
    return v3
.end method

.method private skipToEndOfLine()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    const/4 v2, 0x1

    if-lt v0, v1, :cond_d

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-eqz v0, :cond_2a

    :cond_d
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_25

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto :goto_2a

    :cond_25
    const/16 v1, 0xd

    if-ne v0, v1, :cond_2b

    nop

    :cond_2a
    :goto_2a
    return-void

    :cond_2b
    goto :goto_0
.end method

.method private skipUnquotedValue()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-ge v1, v2, :cond_1e

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    sparse-switch v1, :sswitch_data_2c

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :sswitch_15
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    :sswitch_18
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    return-void

    :cond_1e
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    nop

    :sswitch_data_2c
    .sparse-switch
        0x9 -> :sswitch_18
        0xa -> :sswitch_18
        0xc -> :sswitch_18
        0xd -> :sswitch_18
        0x20 -> :sswitch_18
        0x23 -> :sswitch_15
        0x2c -> :sswitch_18
        0x2f -> :sswitch_15
        0x3a -> :sswitch_18
        0x3b -> :sswitch_15
        0x3d -> :sswitch_15
        0x5b -> :sswitch_18
        0x5c -> :sswitch_15
        0x5d -> :sswitch_18
        0x7b -> :sswitch_18
        0x7d -> :sswitch_18
    .end sparse-switch
.end method

.method private syntaxError(Ljava/lang/String;)Ljava/io/IOException;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/google/gson/stream/MalformedJsonException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/gson/stream/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public beginArray()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x3

    if-ne v0, v1, :cond_13

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->push(I)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-void

    :cond_13
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected BEGIN_ARRAY but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public beginObject()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->push(I)V

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-void

    :cond_13
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected BEGIN_OBJECT but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    const/16 v2, 0x8

    aput v2, v1, v0

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    return-void
.end method

.method public endArray()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x4

    if-ne v0, v1, :cond_15

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-void

    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected END_ARRAY but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public endObject()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x2

    if-ne v0, v1, :cond_15

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-void

    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected END_OBJECT but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public hasNext()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    const/4 v1, 0x1

    goto :goto_11

    :cond_10
    const/4 v1, 0x0

    :goto_11
    return v1
.end method

.method public final isLenient()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    return v0
.end method

.method public nextBoolean()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x5

    const/4 v2, 0x0

    if-ne v0, v1, :cond_10

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    const/4 v1, 0x1

    return v1

    :cond_10
    const/4 v1, 0x6

    if-ne v0, v1, :cond_16

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v2

    :cond_16
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a boolean but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextDouble()D
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/16 v1, 0xf

    const/4 v2, 0x0

    if-ne v0, v1, :cond_13

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-wide v1, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    long-to-double v1, v1

    return-wide v1

    :cond_13
    const/16 v1, 0x10

    const/16 v3, 0xb

    if-ne v0, v1, :cond_2e

    new-instance v1, Ljava/lang/String;

    iget-object v4, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v1, v4, v5, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v1, v4

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_85

    :cond_2e
    const/16 v1, 0x8

    if-eq v0, v1, :cond_78

    const/16 v4, 0x9

    if-ne v0, v4, :cond_37

    goto :goto_78

    :cond_37
    const/16 v1, 0xa

    if-ne v0, v1, :cond_42

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    goto :goto_85

    :cond_42
    if-ne v0, v3, :cond_45

    goto :goto_85

    :cond_45
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a double but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_78
    :goto_78
    if-ne v0, v1, :cond_7d

    const/16 v1, 0x27

    goto :goto_7f

    :cond_7d
    const/16 v1, 0x22

    :goto_7f
    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    :goto_85
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    iget-boolean v1, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-nez v1, :cond_cd

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_9e

    invoke-static {v3, v4}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-nez v1, :cond_9e

    goto :goto_cd

    :cond_9e
    new-instance v1, Lcom/google/gson/stream/MalformedJsonException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSON forbids NaN and infinities: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v5, " at line "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " column "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/gson/stream/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_cd
    :goto_cd
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-wide v3
.end method

.method public nextInt()I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/16 v1, 0xf

    const/4 v2, 0x0

    if-ne v0, v1, :cond_4b

    iget-wide v3, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    long-to-int v1, v3

    iget-wide v3, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    int-to-long v5, v1

    cmp-long v3, v3, v5

    if-nez v3, :cond_1a

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_1a
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected an int but was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " at line "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " column "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_4b
    const/16 v1, 0x10

    if-ne v0, v1, :cond_65

    new-instance v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v1, v3, v4, v5}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    move v1, v2

    goto :goto_bc

    :cond_65
    const/16 v1, 0x8

    if-eq v0, v1, :cond_a1

    const/16 v3, 0x9

    if-ne v0, v3, :cond_6e

    goto :goto_a1

    :cond_6e
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected an int but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_a1
    :goto_a1
    if-ne v0, v1, :cond_a6

    const/16 v1, 0x27

    goto :goto_a8

    :cond_a6
    const/16 v1, 0x22

    :goto_a8
    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    :try_start_ae
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_b4
    .catch Ljava/lang/NumberFormatException; {:try_start_ae .. :try_end_b4} :catch_b9

    :try_start_b4
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I
    :try_end_b6
    .catch Ljava/lang/NumberFormatException; {:try_start_b4 .. :try_end_b6} :catch_b7

    return v1

    :catch_b7
    move-exception v3

    goto :goto_bb

    :catch_b9
    move-exception v1

    move v1, v2

    :goto_bb
    nop

    :goto_bc
    const/16 v3, 0xb

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-int v1, v3

    int-to-double v5, v1

    cmpl-double v5, v5, v3

    if-nez v5, :cond_d2

    const/4 v5, 0x0

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v1

    :cond_d2
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected an int but was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " at line "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " column "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public nextLong()J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/16 v1, 0xf

    const/4 v2, 0x0

    if-ne v0, v1, :cond_12

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-wide v1, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    return-wide v1

    :cond_12
    const/16 v1, 0x10

    if-ne v0, v1, :cond_2b

    new-instance v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v1, v3, v4, v5}, Ljava/lang/String;-><init>([CII)V

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v1, v3

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_7f

    :cond_2b
    const/16 v1, 0x8

    if-eq v0, v1, :cond_67

    const/16 v3, 0x9

    if-ne v0, v3, :cond_34

    goto :goto_67

    :cond_34
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a long but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_67
    :goto_67
    if-ne v0, v1, :cond_6c

    const/16 v1, 0x27

    goto :goto_6e

    :cond_6c
    const/16 v1, 0x22

    :goto_6e
    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    :try_start_74
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I
    :try_end_7c
    .catch Ljava/lang/NumberFormatException; {:try_start_74 .. :try_end_7c} :catch_7d

    return-wide v3

    :catch_7d
    move-exception v1

    nop

    :goto_7f
    const/16 v1, 0xb

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-long v5, v3

    long-to-double v7, v5

    cmpl-double v1, v7, v3

    if-nez v1, :cond_95

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-wide v5

    :cond_95
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected a long but was "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " at line "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " column "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextName()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/16 v1, 0xe

    if-ne v0, v1, :cond_11

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v1

    :goto_10
    goto :goto_27

    :cond_11
    const/16 v1, 0xc

    if-ne v0, v1, :cond_1c

    const/16 v1, 0x27

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_1c
    const/16 v1, 0xd

    if-ne v0, v1, :cond_2c

    const/16 v1, 0x22

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :goto_27
    nop

    const/4 v2, 0x0

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-object v1

    :cond_2c
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a name but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextNull()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/4 v1, 0x7

    if-ne v0, v1, :cond_f

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-void

    :cond_f
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected null but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextString()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    const/16 v1, 0xa

    if-ne v0, v1, :cond_11

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v1

    :goto_10
    goto :goto_52

    :cond_11
    const/16 v1, 0x8

    if-ne v0, v1, :cond_1c

    const/16 v1, 0x27

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_1c
    const/16 v1, 0x9

    if-ne v0, v1, :cond_27

    const/16 v1, 0x22

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_27
    const/16 v1, 0xb

    if-ne v0, v1, :cond_31

    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    goto :goto_52

    :cond_31
    const/16 v1, 0xf

    if-ne v0, v1, :cond_3c

    iget-wide v1, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_3c
    const/16 v1, 0x10

    if-ne v0, v1, :cond_57

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    :goto_52
    nop

    const/4 v2, 0x0

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return-object v1

    :cond_57
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a string but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public peek()Lcom/google/gson/stream/JsonToken;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v0, :cond_8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    :cond_8
    packed-switch v0, :pswitch_data_30

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    :pswitch_11
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_DOCUMENT:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_14
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NUMBER:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_17
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NAME:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_1a
    sget-object v1, Lcom/google/gson/stream/JsonToken;->STRING:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_1d
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NULL:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_20
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BOOLEAN:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_23
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_ARRAY:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_26
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BEGIN_ARRAY:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_29
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_OBJECT:Lcom/google/gson/stream/JsonToken;

    return-object v1

    :pswitch_2c
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BEGIN_OBJECT:Lcom/google/gson/stream/JsonToken;

    return-object v1

    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_14
        :pswitch_14
        :pswitch_11
    .end packed-switch
.end method

.method public final setLenient(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    return-void
.end method

.method public skipValue()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :cond_2
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v2, :cond_a

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v2

    :cond_a
    const/4 v3, 0x3

    const/4 v4, 0x1

    if-ne v2, v3, :cond_14

    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->push(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_68

    :cond_14
    if-ne v2, v4, :cond_1c

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->push(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_68

    :cond_1c
    const/4 v3, 0x4

    if-ne v2, v3, :cond_27

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    goto :goto_68

    :cond_27
    const/4 v3, 0x2

    if-ne v2, v3, :cond_32

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    goto :goto_68

    :cond_32
    const/16 v3, 0xe

    if-eq v2, v3, :cond_65

    const/16 v3, 0xa

    if-ne v2, v3, :cond_3b

    goto :goto_65

    :cond_3b
    const/16 v3, 0x8

    if-eq v2, v3, :cond_5f

    const/16 v3, 0xc

    if-ne v2, v3, :cond_44

    goto :goto_5f

    :cond_44
    const/16 v3, 0x9

    if-eq v2, v3, :cond_59

    const/16 v3, 0xd

    if-ne v2, v3, :cond_4d

    goto :goto_59

    :cond_4d
    const/16 v3, 0x10

    if-ne v2, v3, :cond_68

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_68

    :cond_59
    :goto_59
    const/16 v3, 0x22

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->skipQuotedValue(C)V

    goto :goto_68

    :cond_5f
    :goto_5f
    const/16 v3, 0x27

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->skipQuotedValue(C)V

    goto :goto_68

    :cond_65
    :goto_65
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipUnquotedValue()V

    :cond_68
    :goto_68
    iput v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    if-nez v1, :cond_2

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " at line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " column "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

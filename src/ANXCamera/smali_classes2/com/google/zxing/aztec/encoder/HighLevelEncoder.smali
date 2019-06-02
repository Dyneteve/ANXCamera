.class public final Lcom/google/zxing/aztec/encoder/HighLevelEncoder;
.super Ljava/lang/Object;
.source "HighLevelEncoder.java"


# static fields
.field private static final CHAR_MAP:[[I

.field static final LATCH_TABLE:[[I

.field static final MODE_DIGIT:I = 0x2

.field static final MODE_LOWER:I = 0x1

.field static final MODE_MIXED:I = 0x3

.field static final MODE_NAMES:[Ljava/lang/String;

.field static final MODE_PUNCT:I = 0x4

.field static final MODE_UPPER:I

.field static final SHIFT_TABLE:[[I


# instance fields
.field private final text:[B


# direct methods
.method static constructor <clinit>()V
    .registers 14

    const-string v0, "UPPER"

    const-string v1, "LOWER"

    const-string v2, "DIGIT"

    const-string v3, "MIXED"

    const-string v4, "PUNCT"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->MODE_NAMES:[Ljava/lang/String;

    const/4 v0, 0x5

    new-array v1, v0, [[I

    new-array v2, v0, [I

    const/4 v3, 0x1

    const v4, 0x5001c

    aput v4, v2, v3

    const v4, 0x5001e

    const/4 v5, 0x2

    aput v4, v2, v5

    const v6, 0x5001d

    const/4 v7, 0x3

    aput v6, v2, v7

    const v8, 0xa03be

    const/4 v9, 0x4

    aput v8, v2, v9

    const/4 v10, 0x0

    aput-object v2, v1, v10

    new-array v2, v0, [I

    const v11, 0x901ee

    aput v11, v2, v10

    aput v4, v2, v5

    aput v6, v2, v7

    aput v8, v2, v9

    aput-object v2, v1, v3

    new-array v2, v0, [I

    const v11, 0x4000e

    aput v11, v2, v10

    const v11, 0x901dc

    aput v11, v2, v3

    const v11, 0x901dd

    aput v11, v2, v7

    const v11, 0xe3bbe

    aput v11, v2, v9

    aput-object v2, v1, v5

    new-array v2, v0, [I

    aput v6, v2, v10

    const v6, 0x5001c

    aput v6, v2, v3

    aput v8, v2, v5

    aput v4, v2, v9

    aput-object v2, v1, v7

    new-array v2, v0, [I

    const v4, 0x5001f

    aput v4, v2, v10

    const v4, 0xa03fc

    aput v4, v2, v3

    const v4, 0xa03fe

    aput v4, v2, v5

    const v4, 0xa03fd

    aput v4, v2, v7

    aput-object v2, v1, v9

    sput-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->LATCH_TABLE:[[I

    const/16 v1, 0x100

    filled-new-array {v0, v1}, [I

    move-result-object v1

    const-class v2, I

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    sput-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v10

    const/16 v2, 0x20

    aput v3, v1, v2

    const/16 v1, 0x41

    :goto_9a
    const/16 v4, 0x5a

    if-le v1, v4, :cond_25d

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v3

    aput v3, v1, v2

    const/16 v1, 0x61

    :goto_a6
    const/16 v4, 0x7a

    if-le v1, v4, :cond_250

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    aput v3, v1, v2

    const/16 v1, 0x30

    :goto_b2
    const/16 v4, 0x39

    if-le v1, v4, :cond_243

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    const/16 v4, 0x2c

    const/16 v6, 0xc

    aput v6, v1, v4

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v5

    const/16 v4, 0x2e

    const/16 v8, 0xd

    aput v8, v1, v4

    const/16 v4, 0x1c

    new-array v1, v4, [I

    aput v2, v1, v3

    aput v3, v1, v5

    aput v5, v1, v7

    aput v7, v1, v9

    aput v9, v1, v0

    const/4 v11, 0x6

    aput v0, v1, v11

    const/4 v12, 0x7

    aput v11, v1, v12

    const/16 v0, 0x8

    aput v12, v1, v0

    const/16 v0, 0x9

    const/16 v2, 0x8

    aput v2, v1, v0

    const/16 v0, 0xa

    const/16 v2, 0x9

    aput v2, v1, v0

    const/16 v0, 0xb

    const/16 v2, 0xa

    aput v2, v1, v0

    aput v0, v1, v6

    aput v6, v1, v8

    const/16 v0, 0xe

    aput v8, v1, v0

    const/16 v0, 0xf

    const/16 v2, 0x1b

    aput v2, v1, v0

    const/16 v0, 0x10

    aput v4, v1, v0

    const/16 v0, 0x11

    const/16 v2, 0x1d

    aput v2, v1, v0

    const/16 v0, 0x12

    const/16 v2, 0x1e

    aput v2, v1, v0

    const/16 v0, 0x13

    const/16 v2, 0x1f

    aput v2, v1, v0

    const/16 v0, 0x14

    const/16 v2, 0x40

    aput v2, v1, v0

    const/16 v0, 0x15

    const/16 v2, 0x5c

    aput v2, v1, v0

    const/16 v0, 0x16

    const/16 v2, 0x5e

    aput v2, v1, v0

    const/16 v0, 0x17

    const/16 v2, 0x5f

    aput v2, v1, v0

    const/16 v0, 0x18

    const/16 v2, 0x60

    aput v2, v1, v0

    const/16 v0, 0x19

    const/16 v2, 0x7c

    aput v2, v1, v0

    const/16 v0, 0x1a

    const/16 v2, 0x7e

    aput v2, v1, v0

    const/16 v0, 0x1b

    const/16 v2, 0x7f

    aput v2, v1, v0

    move-object v13, v1

    const/4 v0, 0x0

    :goto_14a
    array-length v1, v13

    if-lt v0, v1, :cond_237

    const/16 v0, 0x1f

    new-array v0, v0, [I

    aput v8, v0, v3

    const/16 v1, 0x21

    aput v1, v0, v11

    const/16 v1, 0x27

    aput v1, v0, v12

    const/16 v1, 0x8

    const/16 v2, 0x23

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x24

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x25

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0x26

    aput v2, v0, v1

    const/16 v1, 0x27

    aput v1, v0, v6

    const/16 v1, 0x28

    aput v1, v0, v8

    const/16 v1, 0xe

    const/16 v2, 0x29

    aput v2, v0, v1

    const/16 v1, 0xf

    const/16 v2, 0x2a

    aput v2, v0, v1

    const/16 v1, 0x10

    const/16 v2, 0x2b

    aput v2, v0, v1

    const/16 v1, 0x11

    const/16 v2, 0x2c

    aput v2, v0, v1

    const/16 v1, 0x12

    const/16 v2, 0x2d

    aput v2, v0, v1

    const/16 v1, 0x13

    const/16 v2, 0x2e

    aput v2, v0, v1

    const/16 v1, 0x14

    const/16 v2, 0x2f

    aput v2, v0, v1

    const/16 v1, 0x15

    const/16 v2, 0x3a

    aput v2, v0, v1

    const/16 v1, 0x16

    const/16 v2, 0x3b

    aput v2, v0, v1

    const/16 v1, 0x17

    const/16 v2, 0x3c

    aput v2, v0, v1

    const/16 v1, 0x18

    const/16 v2, 0x3d

    aput v2, v0, v1

    const/16 v1, 0x19

    const/16 v2, 0x3e

    aput v2, v0, v1

    const/16 v1, 0x1a

    const/16 v2, 0x3f

    aput v2, v0, v1

    const/16 v1, 0x1b

    const/16 v2, 0x5b

    aput v2, v0, v1

    const/16 v1, 0x5d

    aput v1, v0, v4

    const/16 v1, 0x1d

    const/16 v2, 0x7b

    aput v2, v0, v1

    const/16 v1, 0x1e

    const/16 v2, 0x7d

    aput v2, v0, v1

    move-object v1, v0

    const/4 v0, 0x0

    :goto_1e1
    array-length v2, v1

    if-lt v0, v2, :cond_228

    filled-new-array {v11, v11}, [I

    move-result-object v0

    const-class v1, I

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    sput-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    sget-object v2, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    array-length v6, v2

    move v0, v10

    :goto_1f6
    if-lt v0, v6, :cond_21f

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v10

    aput v10, v0, v9

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v3

    aput v10, v0, v9

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v3

    aput v4, v0, v10

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v7

    aput v10, v0, v9

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v5

    aput v10, v0, v9

    sget-object v0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v0, v0, v5

    const/16 v1, 0xf

    aput v1, v0, v10

    return-void

    :cond_21f
    aget-object v1, v2, v0

    const/4 v8, -0x1

    invoke-static {v1, v8}, Ljava/util/Arrays;->fill([II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1f6

    :cond_228
    aget v2, v1, v0

    if-lez v2, :cond_234

    sget-object v2, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v2, v2, v9

    aget v6, v1, v0

    aput v0, v2, v6

    :cond_234
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e1

    :cond_237
    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v1, v1, v7

    aget v2, v13, v0

    aput v0, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_14a

    :cond_243
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v5

    add-int/lit8 v6, v1, -0x30

    add-int/2addr v6, v5

    aput v6, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_b2

    :cond_250
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v3

    add-int/lit8 v6, v1, -0x61

    add-int/2addr v6, v5

    aput v6, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_a6

    :cond_25d
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v10

    add-int/lit8 v6, v1, -0x41

    add-int/2addr v6, v5

    aput v6, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_9a
.end method

.method public constructor <init>([B)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    return-void
.end method

.method private static simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_10

    return-object v0

    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    const/4 v3, 0x1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1b
    :goto_1b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_22

    goto :goto_30

    :cond_22
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/aztec/encoder/State;

    invoke-virtual {v5, v2}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_36

    const/4 v3, 0x0

    nop

    :goto_30
    if-eqz v3, :cond_9

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_36
    invoke-virtual {v2, v5}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_1b

    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_1b
.end method

.method private updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "I",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v0, v0, p2

    and-int/lit16 v0, v0, 0xff

    int-to-char v0, v0

    sget-object v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v2

    aget-object v1, v1, v2

    aget v1, v1, v0

    if-lez v1, :cond_15

    const/4 v1, 0x1

    goto :goto_16

    :cond_15
    const/4 v1, 0x0

    :goto_16
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_18
    const/4 v4, 0x4

    if-le v3, v4, :cond_35

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v3

    if-gtz v3, :cond_2d

    sget-object v3, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v4

    aget-object v3, v3, v4

    aget v3, v3, v0

    if-nez v3, :cond_34

    :cond_2d
    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_34
    return-void

    :cond_35
    sget-object v4, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v4, v4, v3

    aget v4, v4, v0

    if-lez v4, :cond_6a

    if-nez v2, :cond_43

    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    :cond_43
    if-eqz v1, :cond_4e

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v5

    if-eq v3, v5, :cond_4e

    const/4 v5, 0x2

    if-ne v3, v5, :cond_55

    :cond_4e
    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v5

    invoke-interface {p3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_55
    if-nez v1, :cond_6a

    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v6

    aget-object v5, v5, v6

    aget v5, v5, v3

    if-ltz v5, :cond_6a

    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v5

    invoke-interface {p3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_6a
    add-int/lit8 v3, v3, 0x1

    goto :goto_18
.end method

.method private static updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "II",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v2

    if-eq v2, v1, :cond_19

    invoke-virtual {v0, v1, p2}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_19
    const/4 v2, 0x3

    if-eq p2, v2, :cond_1e

    if-ne p2, v1, :cond_2f

    :cond_1e
    nop

    rsub-int/lit8 v1, p2, 0x10

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    nop

    invoke-interface {p3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_2f
    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v1

    if-lez v1, :cond_42

    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    invoke-interface {p3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_42
    return-void
.end method

.method private updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;I)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_14

    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    return-object v1

    :cond_14
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    invoke-direct {p0, v2, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V

    goto :goto_9
.end method

.method private static updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;II)",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_14

    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    return-object v1

    :cond_14
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    invoke-static {v2, p1, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V

    goto :goto_9
.end method


# virtual methods
.method public encode()Lcom/google/zxing/common/BitArray;
    .registers 8

    sget-object v0, Lcom/google/zxing/aztec/encoder/State;->INITIAL_STATE:Lcom/google/zxing/aztec/encoder/State;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    :goto_7
    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v2, v2

    if-lt v1, v2, :cond_1e

    new-instance v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;

    invoke-direct {v1, p0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;-><init>(Lcom/google/zxing/aztec/encoder/HighLevelEncoder;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/aztec/encoder/State;

    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    invoke-virtual {v1, v2}, Lcom/google/zxing/aztec/encoder/State;->toBitArray([B)Lcom/google/zxing/common/BitArray;

    move-result-object v2

    return-object v2

    :cond_1e
    add-int/lit8 v2, v1, 0x1

    iget-object v3, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v3, v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_2d

    iget-object v2, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    add-int/lit8 v3, v1, 0x1

    aget-byte v2, v2, v3

    goto :goto_2e

    :cond_2d
    move v2, v4

    :goto_2e
    iget-object v3, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v3, v3, v1

    const/16 v5, 0xd

    if-eq v3, v5, :cond_54

    const/16 v5, 0x2c

    const/16 v6, 0x20

    if-eq v3, v5, :cond_4f

    const/16 v5, 0x2e

    if-eq v3, v5, :cond_4a

    const/16 v5, 0x3a

    if-eq v3, v5, :cond_45

    goto :goto_5b

    :cond_45
    if-ne v2, v6, :cond_49

    const/4 v4, 0x5

    nop

    :cond_49
    goto :goto_5b

    :cond_4a
    if-ne v2, v6, :cond_4e

    const/4 v4, 0x3

    nop

    :cond_4e
    goto :goto_5b

    :cond_4f
    if-ne v2, v6, :cond_53

    const/4 v4, 0x4

    nop

    :cond_53
    goto :goto_5b

    :cond_54
    const/16 v3, 0xa

    if-ne v2, v3, :cond_5a

    const/4 v4, 0x2

    nop

    :cond_5a
    nop

    :goto_5b
    move v3, v4

    if-lez v3, :cond_65

    invoke-static {v0, v1, v3}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_69

    :cond_65
    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;

    move-result-object v0

    :goto_69
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

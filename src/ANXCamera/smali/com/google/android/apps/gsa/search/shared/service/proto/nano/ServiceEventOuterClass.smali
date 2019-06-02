.class public abstract Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventOuterClass;
.super Ljava/lang/Object;
.source "ServiceEventOuterClass.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkServiceEventIdOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventId;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    const/16 v0, 0xa

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    const/16 v0, 0xc

    if-lt p0, v0, :cond_1

    const/16 v0, 0x12

    if-gt p0, v0, :cond_1

    return p0

    :cond_1
    const/16 v0, 0x14

    if-lt p0, v0, :cond_2

    const/16 v0, 0x16

    if-gt p0, v0, :cond_2

    return p0

    :cond_2
    const/16 v0, 0x18

    if-lt p0, v0, :cond_3

    const/16 v0, 0x1b

    if-gt p0, v0, :cond_3

    return p0

    :cond_3
    const/16 v0, 0x1d

    if-lt p0, v0, :cond_4

    const/16 v0, 0x27

    if-gt p0, v0, :cond_4

    return p0

    :cond_4
    const/16 v0, 0x2a

    if-lt p0, v0, :cond_5

    const/16 v0, 0x33

    if-gt p0, v0, :cond_5

    return p0

    :cond_5
    const/16 v0, 0x38

    if-lt p0, v0, :cond_6

    const/16 v0, 0x55

    if-gt p0, v0, :cond_6

    return p0

    :cond_6
    const/16 v0, 0x57

    if-lt p0, v0, :cond_7

    const/16 v0, 0x59

    if-gt p0, v0, :cond_7

    return p0

    :cond_7
    const/16 v0, 0x5b

    if-lt p0, v0, :cond_8

    if-gt p0, v0, :cond_8

    return p0

    :cond_8
    const/16 v0, 0x5e

    if-lt p0, v0, :cond_9

    const/16 v0, 0x6c

    if-gt p0, v0, :cond_9

    return p0

    :cond_9
    const/16 v0, 0x6e

    if-lt p0, v0, :cond_a

    const/16 v0, 0x6f

    if-gt p0, v0, :cond_a

    return p0

    :cond_a
    const/16 v0, 0x71

    if-lt p0, v0, :cond_b

    if-gt p0, v0, :cond_b

    return p0

    :cond_b
    const/16 v0, 0x73

    if-lt p0, v0, :cond_c

    const/16 v0, 0x7b

    if-gt p0, v0, :cond_c

    return p0

    :cond_c
    const/16 v0, 0x7e

    if-lt p0, v0, :cond_d

    const/16 v0, 0x92

    if-gt p0, v0, :cond_d

    return p0

    :cond_d
    const/16 v0, 0x94

    if-lt p0, v0, :cond_e

    const/16 v0, 0x9e

    if-gt p0, v0, :cond_e

    return p0

    :cond_e
    const/16 v0, 0xa0

    if-lt p0, v0, :cond_f

    if-gt p0, v0, :cond_f

    return p0

    :cond_f
    const/16 v0, 0xa2

    if-lt p0, v0, :cond_10

    const/16 v0, 0xa8

    if-gt p0, v0, :cond_10

    return p0

    :cond_10
    const/16 v0, 0xaa

    if-lt p0, v0, :cond_11

    const/16 v0, 0xac

    if-gt p0, v0, :cond_11

    return p0

    :cond_11
    const/16 v0, 0xae

    if-lt p0, v0, :cond_12

    if-gt p0, v0, :cond_12

    return p0

    :cond_12
    const/16 v0, 0xb0

    if-lt p0, v0, :cond_13

    if-gt p0, v0, :cond_13

    return p0

    :cond_13
    const/16 v0, 0xb2

    if-lt p0, v0, :cond_14

    const/16 v0, 0xbd

    if-gt p0, v0, :cond_14

    return p0

    :cond_14
    const/16 v0, 0xbf

    if-lt p0, v0, :cond_15

    const/16 v0, 0xcf

    if-gt p0, v0, :cond_15

    return p0

    :cond_15
    const/16 v0, 0xd2

    if-lt p0, v0, :cond_16

    const/16 v0, 0xf0

    if-gt p0, v0, :cond_16

    return p0

    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x2e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum ServiceEventId"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkServiceEventIdOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventId;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/android/apps/gsa/search/shared/service/proto/nano/ServiceEventOuterClass;->checkServiceEventIdOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

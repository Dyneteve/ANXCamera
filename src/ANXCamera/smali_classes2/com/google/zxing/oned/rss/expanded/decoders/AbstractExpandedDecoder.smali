.class public abstract Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
.super Ljava/lang/Object;
.source "AbstractExpandedDecoder.java"


# instance fields
.field private final generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

.field private final information:Lcom/google/zxing/common/BitArray;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->information:Lcom/google/zxing/common/BitArray;

    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    invoke-direct {v0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    return-void
.end method

.method public static createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
    .registers 7

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    if-eqz v1, :cond_d

    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :cond_d
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    if-nez v1, :cond_1a

    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AnyAIDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :cond_1a
    const/4 v1, 0x4

    invoke-static {p0, v0, v1}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v1

    packed-switch v1, :pswitch_data_ae

    const/4 v2, 0x5

    invoke-static {p0, v0, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v2

    packed-switch v2, :pswitch_data_b6

    const/4 v3, 0x7

    invoke-static {p0, v0, v3}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(Lcom/google/zxing/common/BitArray;II)I

    move-result v0

    packed-switch v0, :pswitch_data_be

    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "unknown decoder: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    :pswitch_46
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01320xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :pswitch_4c
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI013103decoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013103decoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :pswitch_52
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01393xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :pswitch_58
    new-instance v0, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;

    invoke-direct {v0, p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01392xDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-object v0

    :pswitch_5e
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "17"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_68
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "17"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_72
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "15"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_7c
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "15"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_86
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "13"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_90
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "13"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_9a
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "320"

    const-string v5, "11"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_a4
    new-instance v3, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;

    const-string v4, "310"

    const-string v5, "11"

    invoke-direct {v3, p0, v4, v5}, Lcom/google/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder;-><init>(Lcom/google/zxing/common/BitArray;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :pswitch_data_ae
    .packed-switch 0x4
        :pswitch_4c
        :pswitch_46
    .end packed-switch

    :pswitch_data_b6
    .packed-switch 0xc
        :pswitch_58
        :pswitch_52
    .end packed-switch

    :pswitch_data_be
    .packed-switch 0x38
        :pswitch_a4
        :pswitch_9a
        :pswitch_90
        :pswitch_86
        :pswitch_7c
        :pswitch_72
        :pswitch_68
        :pswitch_5e
    .end packed-switch
.end method


# virtual methods
.method protected final getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->generalDecoder:Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    return-object v0
.end method

.method protected final getInformation()Lcom/google/zxing/common/BitArray;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->information:Lcom/google/zxing/common/BitArray;

    return-object v0
.end method

.method public abstract parseInformation()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation
.end method
